void type metadata accessor for CFArray(uint64_t a1)
{
  sub_4D10(a1, &qword_66EF8);
}

void type metadata accessor for tcc_authorization_right_t(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_2AE8(uint64_t a1, uint64_t a2)
{
  return sub_4478(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_2B04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v56 = sub_4890(&qword_66F88);
  __chkstk_darwin();
  v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_4890(&qword_66F90);
  __chkstk_darwin();
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4890(&qword_66F98);
  __chkstk_darwin();
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_4890(&qword_66FA0);
  __chkstk_darwin();
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_4890(&qword_66FA8);
  __chkstk_darwin();
  v54 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_4890(&qword_66FB0);
  __chkstk_darwin();
  unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = *(void *)(v1 + 16);
  uint64_t v17 = *(void *)(v1 + 24);
  switch(*(unsigned char *)(v1 + 32))
  {
    case 1:
      v48 = (char *)&v47 - v15;
      uint64_t v49 = v13;
      id v21 = objc_allocWithZone((Class)ISIcon);
      uint64_t v51 = a1;
      id v22 = v21;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_4C4D0();
      v50 = v4;
      v24 = (void *)v23;
      sub_40A8(v16, v17, 1);
      [v22 initWithBundleIdentifier:v24];

      id v25 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
      uint64_t v26 = *(void *)v1;
      char v27 = *(unsigned char *)(v1 + 8);
      sub_4614(v26, v27);
      double v28 = sub_39E94(v26, v27);
      sub_4664(v26, v27);
      [v25 setScale:v28];
      [v25 setDrawBorder:1];
      v29 = v48;
      sub_4BBC0();
      uint64_t v30 = v49;
      v31 = v29;
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v8, v29, v12);
      goto LABEL_5;
    case 2:
      v48 = (char *)&v47 - v15;
      uint64_t v49 = v13;
      id v32 = objc_allocWithZone((Class)ISIcon);
      uint64_t v51 = a1;
      id v33 = v32;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_4C4D0();
      v50 = v4;
      v35 = (void *)v34;
      sub_40A8(v16, v17, 2);
      [v33 initWithType:v35];

      id v36 = [self imageDescriptorNamed:kISImageDescriptorTableUIName];
      uint64_t v37 = *(void *)v1;
      char v38 = *(unsigned char *)(v1 + 8);
      sub_4614(v37, v38);
      double v39 = sub_39E94(v37, v38);
      sub_4664(v37, v38);
      [v36 setScale:v39];
      [v36 setDrawBorder:1];
      v40 = v48;
      sub_4BBC0();
      uint64_t v30 = v49;
      v31 = v40;
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v8, v40, v12);
LABEL_5:
      swift_storeEnumTagMultiPayload();
      sub_4C14(&qword_66FC8, &qword_66FB0);
      sub_4C060();
      sub_4B18((uint64_t)v10, (uint64_t)v6, &qword_66FA0);
      swift_storeEnumTagMultiPayload();
      sub_4890(&qword_66FD8);
      sub_4998();
      sub_4A30();
      uint64_t v41 = (uint64_t)v54;
      sub_4C060();
      sub_4B7C((uint64_t)v10, &qword_66FA0);
      sub_4B18(v41, (uint64_t)v50, &qword_66FA8);
      swift_storeEnumTagMultiPayload();
      sub_48D4();
      sub_4C060();
      sub_4B7C(v41, &qword_66FA8);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v12);
      break;
    case 3:
      id v42 = [self settingsIconCache];
      v43 = (void *)sub_4C4D0();
      id v44 = [v42 imageForKey:v43];

      if (v44) {
        id v44 = (id)sub_4C270();
      }
      id v57 = v44;
      char v58 = 1;
      swift_retain();
      sub_4890(&qword_66FE8);
      sub_4AAC();
      sub_4C060();
      char v45 = v60;
      *(void *)v6 = v59;
      v6[8] = v45;
      swift_storeEnumTagMultiPayload();
      sub_4890(&qword_66FD8);
      sub_4998();
      sub_4A30();
      uint64_t v46 = (uint64_t)v54;
      sub_4C060();
      sub_4B18(v46, (uint64_t)v4, &qword_66FA8);
      swift_storeEnumTagMultiPayload();
      sub_48D4();
      sub_4C060();
      sub_4B7C(v46, &qword_66FA8);
      uint64_t result = swift_release();
      break;
    case 4:
      swift_storeEnumTagMultiPayload();
      sub_48D4();
      uint64_t result = sub_4C060();
      break;
    default:
      id v57 = *(id *)(v1 + 16);
      char v58 = 0;
      sub_4048(v16, v17, 0);
      swift_retain();
      sub_4890(&qword_66FE8);
      sub_4AAC();
      sub_4C060();
      char v18 = v60;
      *(void *)v6 = v59;
      v6[8] = v18;
      swift_storeEnumTagMultiPayload();
      sub_4890(&qword_66FD8);
      sub_4998();
      sub_4A30();
      uint64_t v19 = (uint64_t)v54;
      sub_4C060();
      sub_4B18(v19, (uint64_t)v4, &qword_66FA8);
      swift_storeEnumTagMultiPayload();
      sub_48D4();
      sub_4C060();
      sub_4B7C(v19, &qword_66FA8);
      uint64_t result = sub_40A8(v16, v17, 0);
      break;
  }
  return result;
}

uint64_t sub_3418()
{
  return sub_4C210();
}

uint64_t sub_3434@<X0>(uint64_t a1@<X8>)
{
  return sub_2B04(a1);
}

BOOL sub_3470(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_3484(uint64_t a1, uint64_t a2)
{
  return sub_3714(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_34B0()
{
  return sub_4BAD0();
}

uint64_t sub_34FC()
{
  return sub_4BAC0();
}

Swift::Int sub_3554()
{
  return sub_4CAF0();
}

id sub_35BC()
{
  return *v0;
}

uint64_t sub_35C4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_35CC(uint64_t a1, uint64_t a2)
{
  return sub_3714(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_35D8(uint64_t a1, id *a2)
{
  uint64_t result = sub_4C4E0();
  *a2 = 0;
  return result;
}

uint64_t sub_3650(uint64_t a1, id *a2)
{
  char v3 = sub_4C4F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_36D0@<X0>(uint64_t *a1@<X8>)
{
  sub_4C500();
  uint64_t v2 = sub_4C4D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_3714(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_4C500();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_3758()
{
  sub_4C500();
  sub_4C560();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_37AC()
{
  sub_4C500();
  sub_4CAD0();
  sub_4C560();
  Swift::Int v0 = sub_4CAF0();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_3820(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_3830()
{
  return sub_4BAB0() & 1;
}

uint64_t sub_3894()
{
  return sub_3924(&qword_66F10, type metadata accessor for CFString);
}

uint64_t sub_38DC()
{
  return sub_3924(&qword_66F18, type metadata accessor for CFString);
}

uint64_t sub_3924(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_396C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_397C()
{
  return sub_4C500();
}

uint64_t sub_39A0()
{
  return sub_4B950();
}

uint64_t sub_3A00()
{
  return sub_4B920();
}

uint64_t sub_3A60(void *a1)
{
  sub_3924(&qword_67010, type metadata accessor for LAError);
  id v2 = a1;
  return sub_4B910();
}

uint64_t sub_3AE4()
{
  id v1 = *v0;
  uint64_t v2 = sub_4C7B0();

  return v2;
}

uint64_t sub_3B1C()
{
  return sub_4B940();
}

Swift::Int sub_3B8C()
{
  return sub_4CAF0();
}

uint64_t sub_3BEC()
{
  uint64_t v0 = sub_4C500();
  uint64_t v2 = v1;
  if (v0 == sub_4C500() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_4CA60();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_3C7C(uint64_t a1)
{
  uint64_t v2 = sub_3924(&qword_66F78, type metadata accessor for SRSensor);
  uint64_t v3 = sub_3924(&qword_66F80, type metadata accessor for SRSensor);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_3D38()
{
  return sub_4CAA0();
}

uint64_t sub_3D98()
{
  return sub_4CA90();
}

uint64_t sub_3DFC()
{
  return sub_4B900();
}

uint64_t sub_3E5C()
{
  return sub_4B930() & 1;
}

uint64_t sub_3ED8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_4C4D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_3F20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_4C500();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_3F4C(uint64_t a1)
{
  uint64_t v2 = sub_3924(&qword_66F68, type metadata accessor for Key);
  uint64_t v3 = sub_3924(&qword_66F70, type metadata accessor for Key);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void type metadata accessor for SRSensor(uint64_t a1)
{
}

uint64_t sub_4048(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
      uint64_t result = swift_retain();
      break;
    case 1:
    case 2:
    case 3:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for PrivacyAndSecuritySettingsListItemIcon.IconType(uint64_t a1)
{
  return sub_40A8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_40A8(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
      uint64_t result = swift_release();
      break;
    case 1:
    case 2:
    case 3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s26PrivacyAndSecuritySettings38PrivacyAndSecuritySettingsListItemIconV8IconTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_4048(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListItemIcon.IconType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_4048(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_40A8(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListItemIcon.IconType(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListItemIcon.IconType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_40A8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemIcon.IconType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemIcon.IconType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_4284(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_42A0(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListItemIcon.IconType()
{
  return &type metadata for PrivacyAndSecuritySettingsListItemIcon.IconType;
}

uint64_t sub_42C8()
{
  return sub_3924(&qword_66F38, type metadata accessor for SRSensor);
}

uint64_t sub_4310()
{
  return sub_3924(&qword_66F40, type metadata accessor for SRSensor);
}

uint64_t sub_4358()
{
  return sub_3924(&qword_66F48, type metadata accessor for SRSensor);
}

uint64_t sub_43A0()
{
  return sub_3924(&qword_66F50, type metadata accessor for Key);
}

uint64_t sub_43E8()
{
  return sub_3924(&qword_66F58, type metadata accessor for Key);
}

uint64_t sub_4430()
{
  return sub_3924(&qword_66F60, type metadata accessor for Key);
}

uint64_t sub_4478(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 != 1) {
        goto LABEL_17;
      }
      goto LABEL_9;
    case 2:
      if (a6 != 2) {
        goto LABEL_17;
      }
      goto LABEL_9;
    case 3:
      if (a6 != 3) {
        goto LABEL_17;
      }
LABEL_9:
      if (a1 == a4 && a2 == a5)
      {
LABEL_16:
        uint64_t result = 1;
      }
      else
      {
        uint64_t result = sub_4CA60();
      }
      break;
    case 4:
      if (a6 == 4 && !(a5 | a4)) {
        goto LABEL_16;
      }
      goto LABEL_17;
    default:
      if (a6)
      {
LABEL_17:
        uint64_t result = 0;
      }
      else
      {
        sub_4048(a1, a2, 0);
        sub_4048(a4, a5, 0);
        char v10 = sub_4C280();
        sub_40A8(a4, a5, 0);
        sub_40A8(a1, a2, 0);
        uint64_t result = v10 & 1;
      }
      break;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PrivacyAndSecuritySettingsListItemIcon(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_4614(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for PrivacyAndSecuritySettingsListItemIcon(uint64_t a1)
{
  sub_4664(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);

  return sub_40A8(v2, v3, v4);
}

uint64_t sub_4664(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListItemIcon(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_4614(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  LOBYTE(v2) = *(unsigned char *)(v2 + 32);
  sub_4048(v6, v7, v2);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v2;
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListItemIcon(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_4614(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_4664(v6, v7);
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v2 + 24);
  LOBYTE(v2) = *(unsigned char *)(v2 + 32);
  sub_4048(v8, v9, v2);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v2;
  sub_40A8(v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListItemIcon(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListItemIcon(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void *)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_4664(v6, v7);
  char v8 = *((unsigned char *)a2 + 32);
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  char v11 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v8;
  sub_40A8(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemIcon(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemIcon(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListItemIcon()
{
  return &type metadata for PrivacyAndSecuritySettingsListItemIcon;
}

uint64_t sub_4874()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_4890(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_48D4()
{
  unint64_t result = qword_66FB8;
  if (!qword_66FB8)
  {
    sub_4950(&qword_66FA8);
    sub_4998();
    sub_4A30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_66FB8);
  }
  return result;
}

uint64_t sub_4950(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_4998()
{
  unint64_t result = qword_66FC0;
  if (!qword_66FC0)
  {
    sub_4950(&qword_66FA0);
    sub_4C14(&qword_66FC8, &qword_66FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_66FC0);
  }
  return result;
}

unint64_t sub_4A30()
{
  unint64_t result = qword_66FD0;
  if (!qword_66FD0)
  {
    sub_4950(&qword_66FD8);
    sub_4AAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_66FD0);
  }
  return result;
}

unint64_t sub_4AAC()
{
  unint64_t result = qword_66FE0;
  if (!qword_66FE0)
  {
    sub_4950(&qword_66FE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_66FE0);
  }
  return result;
}

uint64_t sub_4B18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4890(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_4B7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4890(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_4BD8()
{
  return sub_4C14(&qword_66FF0, &qword_66FF8);
}

uint64_t sub_4C14(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_4950(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_4C6C()
{
  return sub_3924(&qword_67008, type metadata accessor for Code);
}

uint64_t sub_4CB4()
{
  return sub_3924(&qword_67010, type metadata accessor for LAError);
}

void type metadata accessor for LAError(uint64_t a1)
{
}

void sub_4D10(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_4D58()
{
  return sub_3924(&qword_67018, type metadata accessor for LAError);
}

uint64_t sub_4DA0()
{
  return sub_3924(&qword_67020, type metadata accessor for LAError);
}

uint64_t sub_4DE8()
{
  return sub_3924(&qword_67028, type metadata accessor for LAError);
}

uint64_t sub_4E30()
{
  return sub_3924((unint64_t *)&qword_67030, type metadata accessor for Code);
}

uint64_t sub_4E78()
{
  return sub_3924(&qword_67038, type metadata accessor for Code);
}

unint64_t sub_4EC4()
{
  unint64_t result = qword_67040;
  if (!qword_67040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67040);
  }
  return result;
}

uint64_t sub_4F18()
{
  return sub_3924(&qword_67048, type metadata accessor for LAError);
}

uint64_t sub_4F60()
{
  return sub_3924(&qword_67050, type metadata accessor for LAError);
}

unsigned char *initializeBufferWithCopyOfBuffer for PrivacyAndSecuritySettingsListItemIdentifier(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDD) {
    goto LABEL_17;
  }
  if (a2 + 35 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 35) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 35;
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
      return (*a1 | (v4 << 8)) - 35;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 35;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x24;
  int v8 = v6 - 36;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 35 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 35) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDC)
  {
    unsigned int v6 = ((a2 - 221) >> 8) + 1;
    *unint64_t result = a2 + 35;
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
        JUMPOUT(0x5128);
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
          *unint64_t result = a2 + 35;
        break;
    }
  }
  return result;
}

uint64_t sub_5150(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_5158(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListItemIdentifier()
{
  return &type metadata for PrivacyAndSecuritySettingsListItemIdentifier;
}

unint64_t sub_5174()
{
  unint64_t result = qword_67060;
  if (!qword_67060)
  {
    sub_4950(&qword_67068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67060);
  }
  return result;
}

uint64_t sub_51D0(char a1)
{
  switch(a1)
  {
    case 7:
      id v1 = [self defaultWorkspace];
      if (!v1)
      {
        __break(1u);
        JUMPOUT(0x619CLL);
      }
      int v2 = v1;
      int v3 = (void *)sub_4C4D0();
      [v2 applicationIsInstalled:v3];

      sub_4C4C0();
      ((void (*)(void))__chkstk_darwin)();
      break;
    default:
      sub_4C4C0();
      ((void (*)(void))__chkstk_darwin)();
      break;
  }
  sub_4C4B0();
  if (qword_66ED8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_4B970();
  uint64_t v5 = sub_7874(v4, (uint64_t)qword_6B270);
  __chkstk_darwin(v5, v5);
  (*(void (**)(char *))(v7 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_4BA20();
  __chkstk_darwin(v8 - 8, v9);
  sub_4BA10();
  return sub_4B990();
}

unint64_t sub_622C(char a1)
{
  unint64_t result = 0xD00000000000001FLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000030;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
    case 15:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 7:
      id v5 = [self defaultWorkspace];
      if (!v5)
      {
        __break(1u);
        JUMPOUT(0x65F0);
      }
      uint64_t v6 = v5;
      uint64_t v7 = (void *)sub_4C4D0();
      unsigned int v8 = [v6 applicationIsInstalled:v7];

      if (v8) {
        unint64_t result = 0xD000000000000019;
      }
      else {
        unint64_t result = 0xD000000000000024;
      }
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0xD000000000000022;
      break;
    case 10:
      unint64_t result = 0xD000000000000020;
      break;
    case 11:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 12:
    case 18:
    case 29:
      unint64_t result = 0xD000000000000028;
      break;
    case 13:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 14:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 16:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 17:
      unint64_t result = 0xD000000000000027;
      break;
    case 19:
      unint64_t result = 0xD000000000000029;
      break;
    case 20:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 21:
      unint64_t result = 0xD000000000000025;
      break;
    case 22:
      unint64_t result = 0xD000000000000035;
      break;
    case 23:
      unint64_t result = 0xD000000000000025;
      break;
    case 25:
      id v3 = [self currentDevice];
      id v4 = [v3 userInterfaceIdiom];

      if (v4) {
        unint64_t result = 0xD000000000000016;
      }
      else {
        unint64_t result = 0xD000000000000012;
      }
      break;
    case 26:
      unint64_t result = 0xD000000000000023;
      break;
    case 27:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 28:
      unint64_t result = 0xD000000000000031;
      break;
    case 30:
      unint64_t result = 0xD000000000000029;
      break;
    case 31:
      unint64_t result = 0xD00000000000002DLL;
      break;
    case 32:
      unint64_t result = 0xD000000000000027;
      break;
    case 33:
      unint64_t result = 0xD000000000000026;
      break;
    case 34:
      unint64_t result = 0xD00000000000002FLL;
      break;
    case 35:
      unint64_t result = 0xD00000000000001ELL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_6680(char a1)
{
  uint64_t result = 0x4E4F495441434F4CLL;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 18:
    case 19:
    case 20:
    case 24:
      uint64_t result = sub_4C500();
      break;
    case 4:
      uint64_t result = 0x45434341454C4946;
      break;
    case 5:
      id v3 = [self defaultWorkspace];
      if (!v3)
      {
        __break(1u);
        JUMPOUT(0x6A7CLL);
      }
      id v4 = v3;
      id v5 = (void *)sub_4C4D0();
      unsigned int v6 = [v4 applicationIsInstalled:v5];

      if (v6) {
        uint64_t result = 0x48544C414548;
      }
      else {
        uint64_t result = 0x445F48544C414548;
      }
      break;
    case 9:
      uint64_t result = 0x524F535345434341;
      break;
    case 12:
      uint64_t result = 0xD000000000000011;
      break;
    case 13:
      uint64_t result = 0x4C544341544E4F43;
      break;
    case 14:
      uint64_t result = 0x5355434F46;
      break;
    case 15:
      uint64_t result = 0x574F4C4C4957;
      break;
    case 16:
      uint64_t result = 0xD000000000000016;
      break;
    case 17:
      uint64_t result = 0x454E5F4C41434F4CLL;
      break;
    case 21:
      uint64_t result = 0x5359454B53534150;
      break;
    case 22:
      uint64_t result = 0x43414E414D4C41;
      break;
    case 23:
      uint64_t result = 0x455F455255434553;
      break;
    case 25:
      uint64_t result = 0x54454C4C4157;
      break;
    case 26:
      uint64_t result = 0x435F595445464153;
      break;
    case 27:
    case 32:
      uint64_t result = 0xD000000000000010;
      break;
    case 28:
      uint64_t result = 0xD000000000000011;
      break;
    case 29:
      uint64_t result = 0x5349545245564441;
      break;
    case 30:
      uint64_t result = 0x5F59434156495250;
      break;
    case 31:
      uint64_t result = 0xD000000000000019;
      break;
    case 33:
      uint64_t result = 0xD000000000000017;
      break;
    case 34:
      uint64_t result = 0xD000000000000018;
      break;
    case 35:
      uint64_t result = 0x4E574F444B434F4CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_6B0C(unsigned __int8 a1)
{
  uint64_t v1 = a1;
  uint64_t result = 0;
  switch(v1)
  {
    case 1:
    case 2:
    case 3:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 13:
    case 15:
    case 18:
    case 19:
    case 20:
    case 21:
    case 23:
    case 24:
      uint64_t result = sub_4C500();
      break;
    case 25:
      uint64_t result = 0x54454C4C4157;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_6CC4(char a1)
{
  uint64_t v2 = sub_4B980();
  __chkstk_darwin(v2 - 8, v3);
  sub_51D0(a1);
  sub_4C520();
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (void *)sub_4C4D0();
  swift_bridgeObjectRelease();
  id v5 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v4 target:0 set:0 get:0 detail:0 cell:1 edit:0];

  swift_unknownObjectRelease();
  if (v5)
  {
    sub_6B0C(a1);
    if (!v6) {
      sub_6680(a1);
    }
    uint64_t v7 = (void *)sub_4C4D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, "setIdentifier:", v7, v13, (void)v14);

    if (a1 == 23)
    {
      unsigned int v8 = (void *)sub_4C4D0();
      uint64_t v9 = (void *)sub_4C4D0();
      [v5 setProperty:v8 forKey:v9];

      uint64_t v10 = (void *)sub_4C4D0();
      uint64_t v11 = (void *)sub_4C4D0();
      [v5 setProperty:v10 forKey:v11];
    }
    return (uint64_t)v5;
  }
  else
  {
    uint64_t result = sub_4C9C0();
    __break(1u);
  }
  return result;
}

BOOL sub_7004(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_7018()
{
  Swift::UInt v1 = *v0;
  sub_4CAD0();
  sub_4CAE0(v1);
  return sub_4CAF0();
}

void sub_7060()
{
  sub_4CAE0(*v0);
}

Swift::Int sub_708C()
{
  Swift::UInt v1 = *v0;
  sub_4CAD0();
  sub_4CAE0(v1);
  return sub_4CAF0();
}

void sub_70D0(void *a1@<X8>)
{
  *a1 = &off_5E080;
}

unint64_t sub_70E4()
{
  unint64_t result = qword_67070;
  if (!qword_67070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67070);
  }
  return result;
}

void sub_7138(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_7144(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x676E696B63617274;
      break;
    case 2:
      unint64_t result = 0x7261646E656C6163;
      break;
    case 3:
      unint64_t result = 0x73746361746E6F63;
      break;
    case 4:
      unint64_t result = 0x646E4173656C6966;
      break;
    case 5:
      unint64_t result = 0x68746C616568;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0x736F746F6870;
      break;
    case 8:
      unint64_t result = 0x7265646E696D6572;
      break;
    case 9:
      unint64_t result = 0x726F737365636361;
      break;
    case 10:
      unint64_t result = 0x746F6F7465756C62;
      break;
    case 11:
      unint64_t result = 0x6172656D6163;
      break;
    case 13:
      unint64_t result = 0xD000000000000011;
      break;
    case 14:
      unint64_t result = 0x7375636F66;
      break;
    case 15:
      unint64_t result = 0x74694B656D6F68;
      break;
    case 16:
      unint64_t result = 0xD000000000000015;
      break;
    case 17:
      unint64_t result = 0x74654E6C61636F6CLL;
      break;
    case 18:
      unint64_t result = 0x6F68706F7263696DLL;
      break;
    case 20:
      unint64_t result = 0xD000000000000012;
      break;
    case 21:
      unint64_t result = 0x7379656B73736170;
      break;
    case 22:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 23:
      unint64_t result = 0x6C45657275636573;
      break;
    case 24:
      unint64_t result = 0xD000000000000011;
      break;
    case 25:
      unint64_t result = 0x74656C6C6177;
      break;
    case 26:
      unint64_t result = 0x6843797465666173;
      break;
    case 27:
      unint64_t result = 0xD000000000000017;
      break;
    case 28:
      unint64_t result = 0xD000000000000018;
      break;
    case 31:
      unint64_t result = 0xD000000000000017;
      break;
    case 32:
      unint64_t result = 0x53646E4161746164;
      break;
    case 33:
      unint64_t result = 0x65706F6C65766564;
      break;
    case 34:
      unint64_t result = 0xD000000000000016;
      break;
    case 35:
      unint64_t result = 0x6E776F646B636F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

void *sub_7530(char a1)
{
  Swift::UInt v1 = 0;
  switch(a1)
  {
    case 1:
      Swift::UInt v1 = (void *)kTCCServiceUserTracking;
      if (kTCCServiceUserTracking) {
        goto LABEL_37;
      }
      __break(1u);
      goto LABEL_4;
    case 2:
LABEL_4:
      Swift::UInt v1 = (void *)kTCCServiceCalendar;
      if (kTCCServiceCalendar) {
        goto LABEL_37;
      }
      __break(1u);
LABEL_6:
      Swift::UInt v1 = (void *)kTCCServiceAddressBook;
      if (!kTCCServiceAddressBook)
      {
        __break(1u);
LABEL_8:
        Swift::UInt v1 = (void *)kTCCServiceMediaLibrary;
        if (!kTCCServiceMediaLibrary)
        {
          __break(1u);
LABEL_10:
          Swift::UInt v1 = (void *)kTCCServicePhotos;
          if (!kTCCServicePhotos)
          {
            __break(1u);
LABEL_12:
            Swift::UInt v1 = (void *)kTCCServiceReminders;
            if (!kTCCServiceReminders)
            {
              __break(1u);
LABEL_14:
              Swift::UInt v1 = (void *)kTCCServiceBluetoothAlways;
              if (!kTCCServiceBluetoothAlways)
              {
                __break(1u);
LABEL_16:
                Swift::UInt v1 = (void *)kTCCServiceCamera;
                if (!kTCCServiceCamera)
                {
                  __break(1u);
LABEL_18:
                  Swift::UInt v1 = (void *)kTCCServiceContactlessAccess;
                  if (!kTCCServiceContactlessAccess)
                  {
                    __break(1u);
LABEL_20:
                    Swift::UInt v1 = (void *)kTCCServiceFocusStatus;
                    if (!kTCCServiceFocusStatus)
                    {
                      __break(1u);
LABEL_22:
                      Swift::UInt v1 = (void *)kTCCServiceWillow;
                      if (!kTCCServiceWillow)
                      {
                        __break(1u);
LABEL_24:
                        Swift::UInt v1 = (void *)kTCCServiceMicrophone;
                        if (!kTCCServiceMicrophone)
                        {
                          __break(1u);
LABEL_26:
                          Swift::UInt v1 = (void *)kTCCServiceMotion;
                          if (!kTCCServiceMotion)
                          {
                            __break(1u);
LABEL_28:
                            Swift::UInt v1 = (void *)kTCCServiceNearbyInteraction;
                            if (!kTCCServiceNearbyInteraction)
                            {
                              __break(1u);
LABEL_30:
                              Swift::UInt v1 = (void *)kTCCServiceWebBrowserPublicKeyCredential;
                              if (!kTCCServiceWebBrowserPublicKeyCredential)
                              {
                                __break(1u);
LABEL_32:
                                Swift::UInt v1 = (void *)kTCCServiceSecureElementAccess;
                                if (!kTCCServiceSecureElementAccess)
                                {
                                  __break(1u);
LABEL_34:
                                  Swift::UInt v1 = (void *)kTCCServiceFinancialData;
                                  if (!kTCCServiceFinancialData)
                                  {
                                    __break(1u);
LABEL_36:
                                    Swift::UInt v1 = (void *)kTCCServiceSpeechRecognition;
                                    if (!kTCCServiceSpeechRecognition)
                                    {
                                      __break(1u);
                                      JUMPOUT(0x76F0);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_37:
      id v2 = v1;
      return v1;
    case 3:
      goto LABEL_6;
    case 6:
      goto LABEL_8;
    case 7:
      goto LABEL_10;
    case 8:
      goto LABEL_12;
    case 10:
      goto LABEL_14;
    case 11:
      goto LABEL_16;
    case 13:
      goto LABEL_18;
    case 14:
      goto LABEL_20;
    case 15:
      goto LABEL_22;
    case 18:
      goto LABEL_24;
    case 19:
      goto LABEL_26;
    case 20:
      goto LABEL_28;
    case 21:
      goto LABEL_30;
    case 23:
      goto LABEL_32;
    case 24:
      goto LABEL_36;
    case 25:
      goto LABEL_34;
    default:
      return v1;
  }
}

unint64_t sub_7754()
{
  return sub_7144(*v0);
}

uint64_t sub_775C@<X0>(uint64_t a1@<X8>)
{
  char v3 = *v1;
  type metadata accessor for StaticPrivacyAndSecuritySettingsListItemProvider();
  *(unsigned char *)(swift_initStackObject() + 16) = v3;
  sub_927C((uint64_t)v5);
  return sub_780C((uint64_t)v5, a1);
}

unint64_t sub_77B8()
{
  unint64_t result = qword_67078;
  if (!qword_67078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67078);
  }
  return result;
}

uint64_t sub_780C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890((uint64_t *)&unk_67710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_7874(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_78AC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_78F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7940(_OWORD *a1, _OWORD *a2)
{
  sub_8794(a1, v4);
  sub_8794(a2, v5);
  return sub_79F8(v4, v5) & 1;
}

uint64_t sub_798C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v3 = *a1;
  sub_8794(a1 + 8, v7);
  int v4 = *a2;
  sub_8794(a2 + 8, v8);
  if (v3 == v4) {
    char v5 = sub_79F8(v7, v8);
  }
  else {
    char v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_79F8(_OWORD *a1, _OWORD *a2)
{
  sub_8794(a1, &v67);
  char v4 = v73;
  switch(v73 >> 62)
  {
    case 1uLL:
      uint64_t v57 = (uint64_t)a1;
      v73 &= 0x3FFFFFFFFFFFFFFFuLL;
      unsigned __int8 v16 = v67;
      uint64_t v17 = *((void *)&v67 + 1);
      uint64_t v18 = v68;
      char v19 = v69;
      uint64_t v20 = v70;
      uint64_t v21 = v71;
      uint64_t v22 = v72;
      uint64_t v55 = v75;
      uint64_t v56 = v74;
      uint64_t v53 = v76;
      unsigned __int8 v50 = v77;
      char v48 = v78;
      sub_8794(a2, &v58);
      char v23 = v63;
      if (v63 >> 62 != 1) {
        goto LABEL_30;
      }
      v63 &= 0x3FFFFFFFFFFFFFFFuLL;
      v79[0] = v16;
      uint64_t v80 = v17;
      uint64_t v81 = v18;
      char v82 = v19;
      uint64_t v83 = v20;
      uint64_t v84 = v21;
      uint64_t v85 = v22;
      char v86 = v4 & 1;
      uint64_t v87 = v56;
      uint64_t v88 = v55;
      uint64_t v89 = v53;
      unsigned __int8 v90 = v50;
      char v91 = v48;
      unsigned __int8 v92 = v58;
      long long v93 = v59;
      char v94 = v60;
      uint64_t v95 = v61;
      long long v96 = v62;
      LOBYTE(v97) = v23 & 1;
      uint64_t v98 = v64;
      long long v99 = v65;
      __int16 v100 = v66;
      sub_8934(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_87DC);
      sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_87DC);
      char v24 = sub_32180(v79, &v92);
      sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
      sub_8934(v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
      return v24 & 1;
    case 2uLL:
      v73 &= 0x3FFFFFFFFFFFFFFFuLL;
      int v25 = v67;
      uint64_t v26 = v76;
      uint64_t v51 = v75;
      uint64_t v54 = v77;
      sub_8794(a2, &v92);
      char v27 = v97;
      if (v97 >> 62 != 2) {
        goto LABEL_30;
      }
      v97 &= 0x3FFFFFFFFFFFFFFFuLL;
      if (v25 != v92) {
        goto LABEL_30;
      }
      long long v44 = v99;
      int v45 = v100;
      sub_8934((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_87DC);
      sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_87DC);
      if ((sub_4C140() & 1) == 0) {
        goto LABEL_29;
      }
      v79[0] = v27 & 1;
      if ((sub_4C140() & 1) == 0) {
        goto LABEL_29;
      }
      if (v54 != 255)
      {
        if (v45 != 255)
        {
          switch(v54)
          {
            case 1:
              if (v45 != 1) {
                break;
              }
              goto LABEL_59;
            case 2:
              if (v45 != 2) {
                break;
              }
              goto LABEL_59;
            case 3:
              if (v45 != 3) {
                break;
              }
LABEL_59:
              if (__PAIR128__(v26, v51) == v44)
              {
                sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
                sub_8934((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
                goto LABEL_22;
              }
              char v38 = sub_4CA60();
LABEL_71:
              sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
              sub_8934((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
              if ((v38 & 1) == 0) {
                goto LABEL_30;
              }
              goto LABEL_22;
            case 4:
              sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
              sub_8934((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
              if (v45 != 4 || v44 != 0) {
                goto LABEL_30;
              }
              goto LABEL_22;
            default:
              if (v45) {
                break;
              }
              sub_8920(v44, *((uint64_t *)&v44 + 1), 0);
              sub_8920(v51, v26, 0);
              char v38 = sub_4C280();
              sub_8ADC(v44, *((uint64_t *)&v44 + 1), 0);
              sub_8ADC(v51, v26, 0);
              goto LABEL_71;
          }
        }
LABEL_29:
        sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
        sub_8934((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
        goto LABEL_30;
      }
      sub_8934((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
      sub_8934((uint64_t)a1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_8998);
      if (v45 == 255) {
        goto LABEL_22;
      }
      goto LABEL_30;
    case 3uLL:
      v73 &= 0x3FFFFFFFFFFFFFFFuLL;
      int v28 = v67;
      uint64_t v29 = *((void *)&v67 + 1);
      uint64_t v30 = v68;
      char v31 = v69;
      sub_8794(a2, &v92);
      if (v97 >> 62 == 3)
      {
        v97 &= 0x3FFFFFFFFFFFFFFFuLL;
        if (v28 == v92)
        {
          char v32 = v94;
          long long v33 = v93;
          sub_87BC(v29, v30, v31);
          swift_bridgeObjectRetain();
          sub_87BC(v33, *((uint64_t *)&v33 + 1), v32);
          swift_bridgeObjectRetain();
          char v34 = sub_4C140();
          sub_87CC(v33, *((uint64_t *)&v33 + 1), v32);
          swift_bridgeObjectRelease();
          sub_87CC(v29, v30, v31);
          swift_bridgeObjectRelease();
          if (v34) {
            goto LABEL_22;
          }
        }
      }
      goto LABEL_30;
    default:
      v73 &= 0x3FFFFFFFFFFFFFFFuLL;
      int v5 = v67;
      uint64_t v7 = *((void *)&v67 + 1);
      uint64_t v6 = v68;
      char v8 = v69;
      uint64_t v9 = v71;
      uint64_t v10 = v72;
      sub_8794(a2, &v92);
      if (v97 >> 62 || v5 != v92) {
        goto LABEL_30;
      }
      uint64_t v11 = v93;
      char v47 = v97;
      uint64_t v49 = *((void *)&v93 + 1);
      char v52 = v94;
      long long v12 = v96;
      sub_87BC(v7, v6, v8);
      swift_bridgeObjectRetain();
      sub_8920(v9, v10, v4);
      sub_87BC(v11, v49, v52);
      swift_bridgeObjectRetain();
      sub_8920(v12, *((uint64_t *)&v12 + 1), v47);
      if ((sub_4C140() & 1) == 0)
      {
        sub_87CC(v11, v49, v52);
        swift_bridgeObjectRelease();
        sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
        uint64_t v35 = v7;
        uint64_t v36 = v6;
LABEL_24:
        sub_87CC(v35, v36, v8);
        swift_bridgeObjectRelease();
        uint64_t v14 = v10;
        uint64_t v13 = v9;
        char v15 = v4;
LABEL_25:
        sub_8ADC(v13, v14, v15);
        goto LABEL_30;
      }
      uint64_t v46 = v11;
      if (v4 != -1)
      {
        if (v47 != -1)
        {
          switch(v4)
          {
            case 1:
              if (v47 != 1)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                uint64_t v14 = v10;
                uint64_t v13 = v9;
                char v15 = 1;
                goto LABEL_25;
              }
              if (__PAIR128__(v10, v9) == v12)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                char v24 = 1;
                sub_8ADC(v9, v10, 1);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 1);
              }
              else
              {
                char v43 = sub_4CA60();
                sub_87CC(v46, v49, v52);
                swift_bridgeObjectRelease();
                char v24 = 1;
                sub_8ADC(v12, *((uint64_t *)&v12 + 1), 1);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 1);
                if ((v43 & 1) == 0) {
                  goto LABEL_30;
                }
              }
              return v24 & 1;
            case 2:
              if (v47 != 2)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                uint64_t v14 = v10;
                uint64_t v13 = v9;
                char v15 = 2;
                goto LABEL_25;
              }
              if (__PAIR128__(v10, v9) == v12)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 2);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 2);
                goto LABEL_22;
              }
              char v39 = sub_4CA60();
              sub_87CC(v46, v49, v52);
              swift_bridgeObjectRelease();
              sub_8ADC(v12, *((uint64_t *)&v12 + 1), 2);
              sub_87CC(v7, v6, v8);
              swift_bridgeObjectRelease();
              uint64_t v40 = v9;
              uint64_t v41 = v10;
              char v42 = 2;
              goto LABEL_68;
            case 3:
              if (v47 != 3)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                uint64_t v14 = v10;
                uint64_t v13 = v9;
                char v15 = 3;
                goto LABEL_25;
              }
              if (__PAIR128__(v10, v9) == v12)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 3);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 3);
                goto LABEL_22;
              }
              char v39 = sub_4CA60();
              sub_87CC(v46, v49, v52);
              swift_bridgeObjectRelease();
              sub_8ADC(v12, *((uint64_t *)&v12 + 1), 3);
              sub_87CC(v7, v6, v8);
              swift_bridgeObjectRelease();
              uint64_t v40 = v9;
              uint64_t v41 = v10;
              char v42 = 3;
              goto LABEL_68;
            case 4:
              sub_87CC(v11, v49, v52);
              swift_bridgeObjectRelease();
              if (v47 == 4 && v12 == 0)
              {
                sub_8ADC(0, 0, 4);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                sub_8ADC(v9, v10, 4);
                goto LABEL_22;
              }
              sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
              sub_87CC(v7, v6, v8);
              swift_bridgeObjectRelease();
              uint64_t v14 = v10;
              uint64_t v13 = v9;
              char v15 = 4;
              goto LABEL_25;
            default:
              if (v47)
              {
                sub_87CC(v11, v49, v52);
                swift_bridgeObjectRelease();
                sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
                sub_87CC(v7, v6, v8);
                swift_bridgeObjectRelease();
                uint64_t v14 = v10;
                uint64_t v13 = v9;
                char v15 = 0;
                goto LABEL_25;
              }
              sub_8920(v9, v10, 0);
              sub_8920(v12, *((uint64_t *)&v12 + 1), 0);
              char v39 = sub_4C280();
              sub_8ADC(v12, *((uint64_t *)&v12 + 1), 0);
              sub_8ADC(v9, v10, 0);
              sub_87CC(v46, v49, v52);
              swift_bridgeObjectRelease();
              sub_8ADC(v12, *((uint64_t *)&v12 + 1), 0);
              sub_87CC(v7, v6, v8);
              swift_bridgeObjectRelease();
              uint64_t v40 = v9;
              uint64_t v41 = v10;
              char v42 = 0;
LABEL_68:
              sub_8ADC(v40, v41, v42);
              if ((v39 & 1) == 0) {
                goto LABEL_30;
              }
              goto LABEL_22;
          }
        }
        sub_87CC(v11, v49, v52);
        swift_bridgeObjectRelease();
        uint64_t v35 = v7;
        uint64_t v36 = v6;
        goto LABEL_24;
      }
      sub_87CC(v11, v49, v52);
      swift_bridgeObjectRelease();
      if (v47 != -1)
      {
        sub_8ADC(v12, *((uint64_t *)&v12 + 1), v47);
        sub_87CC(v7, v6, v8);
        swift_bridgeObjectRelease();
LABEL_30:
        char v24 = 0;
        return v24 & 1;
      }
      sub_87CC(v7, v6, v8);
      swift_bridgeObjectRelease();
LABEL_22:
      char v24 = 1;
      return v24 & 1;
  }
}

_OWORD *sub_8794(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  long long v3 = a1[2];
  long long v4 = a1[3];
  long long v5 = a1[4];
  *(_OWORD *)((char *)a2 + 74) = *(_OWORD *)((char *)a1 + 74);
  a2[3] = v4;
  a2[4] = v5;
  a2[2] = v3;
  return a2;
}

uint64_t sub_87BC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_87CC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_87DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  char v12 = a8;
  switch(a8 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_87BC(a2, a3, a4 & 1);
      swift_bridgeObjectRetain();
      sub_87BC(a6, a7, v12 & 1);
      swift_bridgeObjectRetain();
      goto LABEL_4;
    case 3uLL:
      sub_87BC(a2, a3, a4 & 1);
      uint64_t result = swift_bridgeObjectRetain();
      break;
    default:
      sub_87BC(a2, a3, a4 & 1);
      swift_bridgeObjectRetain();
      a10 = a6;
      a11 = a7;
      a12 = v12;
LABEL_4:
      uint64_t result = sub_8920(a10, a11, a12);
      break;
  }
  return result;
}

uint64_t sub_8920(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_4048(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_8934(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, __int16))
{
  __int16 v4 = *(_WORD *)(a1 + 88);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v4);
  return a1;
}

uint64_t sub_8998(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  char v12 = a8;
  switch(a8 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_87CC(a2, a3, a4 & 1);
      swift_bridgeObjectRelease();
      sub_87CC(a6, a7, v12 & 1);
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 3uLL:
      sub_87CC(a2, a3, a4 & 1);
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      sub_87CC(a2, a3, a4 & 1);
      swift_bridgeObjectRelease();
      a10 = a6;
      a11 = a7;
      a12 = v12;
LABEL_4:
      uint64_t result = sub_8ADC(a10, a11, a12);
      break;
  }
  return result;
}

uint64_t sub_8ADC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_40A8(a1, a2, a3);
  }
  return a1;
}

uint64_t destroy for PrivacyAndSecuritySettingsListItemViewType(uint64_t a1)
{
  return sub_8998(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(_WORD *)(a1 + 88));
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListItemViewType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  unint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  __int16 v15 = *(_WORD *)(a2 + 88);
  sub_87DC(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(_WORD *)(a1 + 88) = v15;
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListItemViewType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  unint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  uint64_t v25 = *(void *)(a2 + 80);
  __int16 v26 = *(_WORD *)(a2 + 88);
  sub_87DC(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  unint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 80);
  __int16 v22 = *(_WORD *)(a1 + 88);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(void *)(a1 + 80) = v25;
  *(_WORD *)(a1 + 88) = v26;
  sub_8998(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, v22);
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 74) = *(_OWORD *)(a2 + 74);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListItemViewType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 80);
  __int16 v4 = *(_WORD *)(a2 + 88);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  unint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 80);
  __int16 v15 = *(_WORD *)(a1 + 88);
  long long v16 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v16;
  long long v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v3;
  *(_WORD *)(a1 + 88) = v4;
  sub_8998(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemViewType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 90)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)a1 >> 6;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemViewType(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_WORD *)(a1 + 88) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 90) = 1;
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
      *(void *)a1 = (unint64_t)-a2 << 6;
      double result = 0.0;
      *(_OWORD *)(a1 + 8) = 0u;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 40) = 0u;
      *(_OWORD *)(a1 + 56) = 0u;
      *(_OWORD *)(a1 + 72) = 0u;
      *(_WORD *)(a1 + 88) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 90) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_8E6C(uint64_t a1)
{
  return *(void *)(a1 + 56) >> 62;
}

uint64_t sub_8E78(uint64_t result)
{
  *(void *)(result + 56) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_8E88(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 24) & 1;
  unint64_t v3 = *(unsigned __int8 *)(result + 56) | (unint64_t)(a2 << 62);
  *(void *)result &= 0x3FuLL;
  *(void *)(result + 24) = v2;
  *(void *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListItemViewType()
{
  return &type metadata for PrivacyAndSecuritySettingsListItemViewType;
}

uint64_t destroy for PrivacyAndSecuritySettingsListItemModel(uint64_t a1)
{
  return sub_8998(*(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(_WORD *)(a1 + 96));
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListItemModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  unint64_t v10 = *(void *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 88);
  __int16 v15 = *(_WORD *)(a2 + 96);
  sub_87DC(v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v14;
  *(_WORD *)(a1 + 96) = v15;
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListItemModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  unint64_t v10 = *(void *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v24 = *(void *)(a2 + 80);
  uint64_t v25 = *(void *)(a2 + 88);
  __int16 v26 = *(_WORD *)(a2 + 96);
  sub_87DC(v3, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 24);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  unint64_t v19 = *(void *)(a1 + 64);
  long long v20 = *(_OWORD *)(a1 + 72);
  uint64_t v21 = *(void *)(a1 + 88);
  __int16 v22 = *(_WORD *)(a1 + 96);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v24;
  *(void *)(a1 + 88) = v25;
  *(_WORD *)(a1 + 96) = v26;
  sub_8998(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, v22);
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListItemModel(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_WORD *)(a1 + 96) = *((_WORD *)a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListItemModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 88);
  __int16 v4 = *(_WORD *)(a2 + 96);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unint64_t v12 = *(void *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 88);
  __int16 v15 = *(_WORD *)(a1 + 96);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = v3;
  *(_WORD *)(a1 + 96) = v4;
  sub_8998(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 98)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *(void *)(a1 + 8) >> 6;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

double storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListItemModel(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 88) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_WORD *)(a1 + 96) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 98) = 1;
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
      *(void *)(a1 + 8) = (unint64_t)-a2 << 6;
      double result = 0.0;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      *(_WORD *)(a1 + 96) = 0;
      return result;
    }
    *(unsigned char *)(a1 + 98) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListItemModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListItemModel;
}

uint64_t sub_927C@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 v3 = *(unsigned char *)(v1 + 16);
  uint64_t v4 = v3;
  unint64_t v5 = sub_622C(v3);
  if (v7 >= 4u)
  {
    uint64_t v15 = sub_4B980();
    __chkstk_darwin(v15 - 8, v16);
    sub_51D0(v4);
    uint64_t result = sub_4C180();
    uint64_t v14 = 0xC000000000000000;
  }
  else
  {
    sub_40A8(v5, v6, v7);
    uint64_t v8 = sub_4B980();
    __chkstk_darwin(v8 - 8, v9);
    sub_51D0(v4);
    uint64_t result = sub_4C180();
    uint64_t v14 = 255;
  }
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v12 & 1;
  *(void *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 0;
  return result;
}

uint64_t sub_93AC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StaticPrivacyAndSecuritySettingsListItemProvider()
{
  return self;
}

uint64_t sub_93E0@<X0>(uint64_t a1@<X8>)
{
  sub_927C((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListSectionIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListSectionIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0x957CLL);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListSectionIdentifier()
{
  return &type metadata for PrivacyAndSecuritySettingsListSectionIdentifier;
}

unint64_t sub_95B8()
{
  unint64_t result = qword_67128;
  if (!qword_67128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67128);
  }
  return result;
}

uint64_t sub_960C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_9668(v8, v9) & 1;
}

uint64_t sub_9668(void *a1, void *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2) {
    return 0;
  }
  uint64_t v4 = a1[4];
  uint64_t v5 = a2[4];
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    uint64_t v6 = a1[1];
    uint64_t v7 = a1[2];
    uint64_t v8 = a2[1];
    uint64_t v9 = a2[2];
    uint64_t v10 = a2[3];
    uint64_t v22 = a1[3] & 1;
    uint64_t v25 = a1[3];
    sub_98F4(v6, v7, v25, v4);
    sub_98F4(v6, v7, v25, v4);
    sub_98F4(v8, v9, v10, v5);
    char v23 = sub_4C140();
    sub_87CC(v8, v9, v10 & 1);
    swift_bridgeObjectRelease();
    sub_87CC(v6, v7, v22);
    swift_bridgeObjectRelease();
    sub_9938(v6, v7, v25, v4);
    if ((v23 & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v11 = a1[8];
  uint64_t v12 = a2[8];
  if (!v11)
  {
    if (!v12) {
      goto LABEL_10;
    }
    return 0;
  }
  if (!v12) {
    return 0;
  }
  uint64_t v13 = a1[5];
  uint64_t v14 = a1[6];
  uint64_t v15 = a1[7];
  uint64_t v16 = a2[5];
  uint64_t v17 = a2[6];
  uint64_t v18 = a2[7];
  sub_98F4(v13, v14, v15, v11);
  sub_98F4(v13, v14, v15, v11);
  sub_98F4(v16, v17, v18, v12);
  char v24 = sub_4C140();
  sub_87CC(v16, v17, v18 & 1);
  swift_bridgeObjectRelease();
  sub_87CC(v13, v14, v15 & 1);
  swift_bridgeObjectRelease();
  sub_9938(v13, v14, v15, v11);
  if ((v24 & 1) == 0) {
    return 0;
  }
LABEL_10:
  uint64_t v19 = a1[9];
  uint64_t v20 = a2[9];

  return sub_D07C(v19, v20);
}

uint64_t sub_98F4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_87BC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_9938(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_87CC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t destroy for PrivacyAndSecuritySettingsListSectionModel(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    sub_87CC(*(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a1 + 64))
  {
    sub_87CC(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListSectionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 32);
  if (!v4)
  {
    long long v12 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v12;
    uint64_t v8 = *(void *)(a2 + 64);
    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    long long v13 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v13;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  sub_87BC(v5, v6, v7);
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  uint64_t v8 = *(void *)(a2 + 64);
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  char v11 = *(unsigned char *)(a2 + 56);
  sub_87BC(v9, v10, v11);
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v8;
  swift_bridgeObjectRetain();
LABEL_6:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListSectionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a2 + 8);
      uint64_t v8 = *(void *)(a2 + 16);
      char v9 = *(unsigned char *)(a2 + 24);
      sub_87BC(v7, v8, v9);
      uint64_t v10 = *(void *)(a1 + 8);
      uint64_t v11 = *(void *)(a1 + 16);
      char v12 = *(unsigned char *)(a1 + 24);
      *(void *)(a1 + 8) = v7;
      *(void *)(a1 + 16) = v8;
      *(unsigned char *)(a1 + 24) = v9;
      sub_87CC(v10, v11, v12);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_9C80(a1 + 8);
      long long v16 = v5[1];
      _OWORD *v4 = *v5;
      v4[1] = v16;
    }
  }
  else if (v6)
  {
    uint64_t v13 = *(void *)(a2 + 8);
    uint64_t v14 = *(void *)(a2 + 16);
    char v15 = *(unsigned char *)(a2 + 24);
    sub_87BC(v13, v14, v15);
    *(void *)(a1 + 8) = v13;
    *(void *)(a1 + 16) = v14;
    *(unsigned char *)(a1 + 24) = v15;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v17 = *(_OWORD *)(a2 + 24);
    _OWORD *v4 = *v5;
    *(_OWORD *)(a1 + 24) = v17;
  }
  uint64_t v18 = (_OWORD *)(a1 + 40);
  uint64_t v19 = (_OWORD *)(a2 + 40);
  uint64_t v20 = *(void *)(a2 + 64);
  if (*(void *)(a1 + 64))
  {
    if (v20)
    {
      uint64_t v21 = *(void *)(a2 + 40);
      uint64_t v22 = *(void *)(a2 + 48);
      char v23 = *(unsigned char *)(a2 + 56);
      sub_87BC(v21, v22, v23);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      char v26 = *(unsigned char *)(a1 + 56);
      *(void *)(a1 + 40) = v21;
      *(void *)(a1 + 48) = v22;
      *(unsigned char *)(a1 + 56) = v23;
      sub_87CC(v24, v25, v26);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_9C80(a1 + 40);
      long long v30 = *(_OWORD *)(a2 + 56);
      *uint64_t v18 = *v19;
      *(_OWORD *)(a1 + 56) = v30;
    }
  }
  else if (v20)
  {
    uint64_t v27 = *(void *)(a2 + 40);
    uint64_t v28 = *(void *)(a2 + 48);
    char v29 = *(unsigned char *)(a2 + 56);
    sub_87BC(v27, v28, v29);
    *(void *)(a1 + 40) = v27;
    *(void *)(a1 + 48) = v28;
    *(unsigned char *)(a1 + 56) = v29;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v31 = *(_OWORD *)(a2 + 56);
    *uint64_t v18 = *v19;
    *(_OWORD *)(a1 + 56) = v31;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_9C80(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListSectionModel(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PrivacyAndSecuritySettingsListSectionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = (_OWORD *)(a2 + 8);
  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = *(void *)(a2 + 32);
    if (v6)
    {
      char v7 = *(unsigned char *)(a2 + 24);
      uint64_t v8 = *(void *)(a1 + 8);
      uint64_t v9 = *(void *)(a1 + 16);
      char v10 = *(unsigned char *)(a1 + 24);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      *(unsigned char *)(a1 + 24) = v7;
      sub_87CC(v8, v9, v10);
      *(void *)(a1 + 32) = v6;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_9C80(a1 + 8);
  }
  long long v11 = v5[1];
  _OWORD *v4 = *v5;
  v4[1] = v11;
LABEL_6:
  if (!*(void *)(a1 + 64))
  {
LABEL_10:
    long long v17 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v17;
    goto LABEL_11;
  }
  uint64_t v12 = *(void *)(a2 + 64);
  if (!v12)
  {
    sub_9C80(a1 + 40);
    goto LABEL_10;
  }
  char v13 = *(unsigned char *)(a2 + 56);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  char v16 = *(unsigned char *)(a1 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = v13;
  sub_87CC(v14, v15, v16);
  *(void *)(a1 + 64) = v12;
  swift_bridgeObjectRelease();
LABEL_11:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListSectionModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListSectionModel(uint64_t result, int a2, int a3)
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListSectionModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListSectionModel;
}

unint64_t sub_9E98()
{
  unint64_t result = qword_67130;
  if (!qword_67130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67130);
  }
  return result;
}

uint64_t sub_9EEC@<X0>(void *a1@<X8>)
{
  uint64_t result = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    long long v30 = a1;
    uint64_t v4 = result + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = _swiftEmptyArrayStorage;
    do
    {
      sub_A2E4(v4, (uint64_t)v37);
      uint64_t v7 = v38;
      uint64_t v8 = v39;
      sub_78AC(v37, v38);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v8 + 24))(v41, v7, v8);
      char v10 = v41[0];
      uint64_t v9 = v41[1];
      uint64_t v12 = v41[2];
      uint64_t v11 = v41[3];
      uint64_t v13 = v41[4];
      uint64_t v14 = v41[5];
      uint64_t v15 = v41[6];
      uint64_t v35 = v41[8];
      uint64_t v36 = v41[7];
      uint64_t v33 = v41[10];
      uint64_t v34 = v41[9];
      uint64_t v32 = v41[11];
      __int16 v31 = v42;
      sub_78F0((uint64_t)v37);
      sub_A348((uint64_t)v41, (uint64_t)v43, (uint64_t *)&unk_67710);
      if (v44 >> 6 != 0xFFFFFFFF || v45 > 1 || v46 >= 0x100)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_46A78(0, v5[2] + 1, 1, v5);
        }
        char v16 = v5;
        unint64_t v17 = v5[2];
        uint64_t v18 = v16;
        unint64_t v19 = v16[3];
        if (v17 >= v19 >> 1) {
          uint64_t v18 = sub_46A78((void *)(v19 > 1), v17 + 1, 1, v18);
        }
        v18[2] = v17 + 1;
        uint64_t v6 = &v18[13 * v17];
        uint64_t v5 = v18;
        *((unsigned char *)v6 + 32) = v10;
        v6[5] = v9;
        v6[6] = v12;
        v6[7] = v11;
        v6[8] = v13;
        v6[9] = v14;
        v6[10] = v15;
        v6[11] = v36;
        v6[12] = v35;
        v6[13] = v34;
        v6[14] = v33;
        v6[15] = v32;
        *((_WORD *)v6 + 64) = v31;
      }
      v4 += 40;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    uint64_t v40 = v5;
    if (v5[2])
    {
      if (*(unsigned char *)(v29 + 17) == 1)
      {
        sub_A1B8(&v40);
        uint64_t v5 = v40;
      }
      uint64_t v20 = v5;
      uint64_t v21 = *(unsigned __int8 *)(v29 + 16);
      uint64_t v22 = *(void *)(v29 + 24);
      uint64_t v23 = *(void *)(v29 + 32);
      uint64_t v24 = *(void *)(v29 + 40);
      uint64_t v25 = *(void *)(v29 + 48);
      uint64_t v26 = *(void *)(v29 + 56);
      uint64_t v27 = *(void *)(v29 + 64);
      uint64_t v3 = *(void *)(v29 + 72);
      uint64_t v28 = *(void *)(v29 + 80);
      sub_98F4(v22, v23, v24, v25);
      uint64_t result = sub_98F4(v26, v27, v3, v28);
    }
    else
    {
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v3 = 0;
      uint64_t v28 = 0;
      uint64_t v20 = 0;
    }
    a1 = v30;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v20 = 0;
  }
  *a1 = v21;
  a1[1] = v22;
  a1[2] = v23;
  a1[3] = v24;
  a1[4] = v25;
  a1[5] = v26;
  a1[6] = v27;
  a1[7] = v3;
  a1[8] = v28;
  a1[9] = v20;
  return result;
}

Swift::Int sub_A1B8(void **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_CD88(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  Swift::Int result = sub_A3AC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_A228()
{
  sub_9938(v0[3], v0[4], v0[5], v0[6]);
  sub_9938(v0[7], v0[8], v0[9], v0[10]);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StaticPrivacyAndSecuritySettingsListSectionProvider()
{
  return self;
}

uint64_t sub_A29C@<X0>(uint64_t a1@<X8>)
{
  sub_9EEC(v3);
  return sub_A348((uint64_t)v3, a1, &qword_67230);
}

uint64_t sub_A2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_A348(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4890(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

Swift::Int sub_A3AC(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v240 = sub_4BF60();
  uint64_t v4 = *(void *)(v240 - 8);
  __chkstk_darwin(v240, v5);
  v239 = (char *)&v224 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Int v7 = a1[1];
  Swift::Int result = sub_4CA30(v7);
  if (result >= v7)
  {
    if (v7 < 0) {
      goto LABEL_131;
    }
    if (v7) {
      return sub_BAEC(0, v7, 1, a1);
    }
    return result;
  }
  if (v7 >= 0) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 + 1;
  }
  if (v7 < -1) {
    goto LABEL_139;
  }
  Swift::Int v228 = result;
  v225 = a1;
  if (v7 < 2)
  {
    uint64_t v13 = (char *)_swiftEmptyArrayStorage;
    uint64_t v12 = (unsigned __int8 *)&_swiftEmptyArrayStorage[4];
    v227 = _swiftEmptyArrayStorage;
    if (v7 != 1)
    {
      unint64_t v16 = _swiftEmptyArrayStorage[2];
LABEL_97:
      if (v16 >= 2)
      {
        uint64_t v215 = *v225;
        do
        {
          unint64_t v216 = v16 - 2;
          if (v16 < 2) {
            goto LABEL_126;
          }
          if (!v215) {
            goto LABEL_138;
          }
          v217 = v13;
          v218 = v13 + 32;
          uint64_t v219 = *(void *)&v13[16 * v216 + 32];
          uint64_t v220 = *(void *)&v13[16 * v16 + 24];
          v221 = v12;
          sub_C0E0((unsigned __int8 *)(v215 + 104 * v219), v215 + 104 * *(void *)&v218[16 * v16 - 16], v215 + 104 * v220, v12);
          if (v2) {
            break;
          }
          if (v220 < v219) {
            goto LABEL_127;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v217 = sub_145B8((uint64_t)v217);
          }
          if (v216 >= *((void *)v217 + 2)) {
            goto LABEL_128;
          }
          v222 = &v217[16 * v216 + 32];
          *(void *)v222 = v219;
          *((void *)v222 + 1) = v220;
          unint64_t v223 = *((void *)v217 + 2);
          if (v16 > v223) {
            goto LABEL_129;
          }
          uint64_t v13 = v217;
          memmove(&v217[16 * v16 + 16], &v217[16 * v16 + 32], 16 * (v223 - v16));
          *((void *)v217 + 2) = v223 - 1;
          unint64_t v16 = v223 - 1;
          uint64_t v12 = v221;
        }
        while (v223 > 2);
      }
LABEL_108:
      swift_bridgeObjectRelease();
      v227[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v10 = v9 >> 1;
    uint64_t v11 = sub_4C600();
    *(void *)(v11 + 16) = v10;
    v227 = (void *)v11;
    uint64_t v12 = (unsigned __int8 *)(v11 + 32);
  }
  Swift::Int v14 = 0;
  uint64_t v15 = *a1;
  v238 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v226 = v15 + 152;
  uint64_t v224 = v15 - 104;
  uint64_t v13 = (char *)_swiftEmptyArrayStorage;
  v236 = v12;
  Swift::Int v233 = v7;
  uint64_t v241 = v15;
  while (1)
  {
    Swift::Int v17 = v14;
    Swift::Int v18 = v14 + 1;
    v230 = v13;
    Swift::Int v234 = v14;
    if (v14 + 1 < v7)
    {
      uint64_t v229 = v2;
      unint64_t v19 = (unsigned __int8 *)(v15 + 104 * v18);
      uint64_t v261 = *((void *)v19 + 1);
      uint64_t v20 = *((void *)v19 + 2);
      uint64_t v270 = *((void *)v19 + 3);
      uint64_t v271 = v20;
      *(void *)&long long v273 = *((void *)v19 + 4);
      *(void *)&long long v272 = *((void *)v19 + 5);
      *(void *)&long long v276 = *((void *)v19 + 6);
      *(void *)&long long v275 = *((void *)v19 + 7);
      uint64_t v21 = *((void *)v19 + 9);
      *(void *)&long long v274 = *((void *)v19 + 8);
      unint64_t v259 = v21;
      uint64_t v23 = *((void *)v19 + 11);
      uint64_t v258 = *((void *)v19 + 10);
      uint64_t v22 = v258;
      uint64_t v257 = v23;
      unsigned __int16 v24 = *((_WORD *)v19 + 48);
      LODWORD(v256) = v24;
      uint64_t v25 = (unsigned __int8 *)(v15 + 104 * v14);
      uint64_t v262 = *((void *)v25 + 1);
      v269 = (void *)*((void *)v25 + 2);
      uint64_t v268 = *((void *)v25 + 3);
      uint64_t v267 = *((void *)v25 + 4);
      uint64_t v266 = *((void *)v25 + 5);
      uint64_t v265 = *((void *)v25 + 6);
      uint64_t v264 = *((void *)v25 + 7);
      unint64_t v263 = *((void *)v25 + 8);
      uint64_t v26 = *((void *)v25 + 10);
      uint64_t v260 = *((void *)v25 + 9);
      uint64_t v255 = v26;
      uint64_t v254 = *((void *)v25 + 11);
      uint64_t v27 = v254;
      unsigned __int16 v28 = *((_WORD *)v25 + 48);
      LODWORD(v253) = v28;
      LODWORD(v251) = *v19;
      LODWORD(v252) = *v25;
      uint64_t v29 = sub_4B980();
      v247 = &v224;
      long long v30 = *(unsigned __int8 **)(*(void *)(v29 - 8) + 64);
      __chkstk_darwin(v29 - 8, v31);
      unint64_t v246 = (unint64_t)(v30 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_87DC(v261, v271, v270, v273, v272, v276, v275, v274, v21, v22, v23, v24);
      sub_87DC(v262, (uint64_t)v269, v268, v267, v266, v265, v264, v263, v260, v26, v27, v28);
      sub_51D0((char)v251);
      uint64_t v250 = sub_4C180();
      uint64_t v249 = v32;
      v251 = (void *)v33;
      LODWORD(v248) = v34 & 1;
      v235 = v30;
      __chkstk_darwin(v250, v32);
      sub_51D0(v252);
      v247 = (void *)sub_4C180();
      unint64_t v246 = v35;
      unint64_t v245 = v36;
      LODWORD(v252) = v37 & 1;
      uint64_t v38 = v239;
      sub_4BF50();
      uint64_t v39 = sub_4C130();
      uint64_t v41 = v40;
      __int16 v42 = *v238;
      uint64_t v43 = v240;
      (*v238)(v38, v240);
      uint64_t v279 = v39;
      uint64_t v280 = v41;
      sub_4BF50();
      uint64_t v44 = v246;
      uint64_t v45 = sub_4C130();
      uint64_t v47 = v46;
      uint64_t v48 = v43;
      Swift::Int v7 = v233;
      v232 = v42;
      v42(v38, v48);
      uint64_t v277 = v45;
      uint64_t v278 = v47;
      unint64_t v231 = sub_CD9C();
      uint64_t v49 = sub_4C830();
      Swift::Int v17 = v234;
      uint64_t v237 = v49;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_87CC((uint64_t)v247, v44, v252);
      swift_bridgeObjectRelease();
      sub_87CC(v250, v249, v248);
      swift_bridgeObjectRelease();
      sub_8998(v262, (uint64_t)v269, v268, v267, v266, v265, v264, v263, v260, v255, v254, v253);
      sub_8998(v261, v271, v270, v273, v272, v276, v275, v274, v259, v258, v257, v256);
      Swift::Int v18 = v17 + 2;
      if (v17 + 2 < v7)
      {
        uint64_t v50 = v226 + 104 * v17;
        uint64_t v51 = v50;
        while (1)
        {
          Swift::Int v242 = v18;
          v251 = &v224;
          LODWORD(v271) = v237 == -1;
          uint64_t v52 = *(void *)(v50 + 72);
          uint64_t v270 = *(void *)(v50 + 64);
          v269 = (void *)v52;
          uint64_t v53 = *(void *)(v50 + 88);
          uint64_t v268 = *(void *)(v50 + 80);
          uint64_t v267 = v53;
          uint64_t v266 = *(void *)(v50 + 96);
          uint64_t v265 = *(void *)(v51 + 104);
          Swift::Int v243 = v51 + 104;
          unint64_t v54 = *(void *)(v50 + 120);
          uint64_t v264 = *(void *)(v50 + 112);
          unint64_t v263 = v54;
          uint64_t v55 = *(void *)(v50 + 136);
          uint64_t v262 = *(void *)(v50 + 128);
          uint64_t v261 = v55;
          uint64_t v260 = *(void *)(v50 + 144);
          LODWORD(v259) = *(unsigned __int16 *)(v50 + 152);
          uint64_t v56 = *(void *)(v50 - 32);
          *(void *)&long long v273 = *(void *)(v50 - 40);
          uint64_t v258 = v56;
          uint64_t v257 = *(void *)(v50 - 24);
          uint64_t v57 = v257;
          *(void *)&long long v272 = *(void *)(v50 - 16);
          *(void *)&long long v274 = *(void *)(v50 - 8);
          uint64_t v58 = *(void *)(v50 + 8);
          *(void *)&long long v275 = *(void *)v50;
          uint64_t v256 = v58;
          uint64_t v59 = *(void *)(v50 + 24);
          *(void *)&long long v276 = *(void *)(v50 + 16);
          uint64_t v255 = v59;
          uint64_t v61 = *(void *)(v50 + 40);
          uint64_t v254 = *(void *)(v50 + 32);
          uint64_t v60 = v254;
          uint64_t v253 = v61;
          unsigned __int16 v62 = *(_WORD *)(v50 + 48);
          LODWORD(v252) = v62;
          LODWORD(v250) = *(unsigned __int8 *)(v50 + 56);
          LODWORD(v249) = *(unsigned __int8 *)(v50 - 48);
          unint64_t v63 = v235;
          uint64_t v64 = __chkstk_darwin(v270, v52);
          unint64_t v245 = (unint64_t)(v63 + 15) & 0xFFFFFFFFFFFFFFF0;
          sub_87DC(v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75);
          sub_87DC(v273, v56, v57, v272, v274, v275, v58, v276, v59, v60, v61, v62);
          sub_51D0(v250);
          uint64_t v248 = sub_4C180();
          v247 = (void *)v76;
          uint64_t v250 = v77;
          LODWORD(v246) = v78 & 1;
          v244 = &v224;
          __chkstk_darwin(v248, v76);
          sub_51D0(v249);
          v251 = (void *)sub_4C180();
          unint64_t v245 = v79;
          LODWORD(v249) = v80 & 1;
          uint64_t v81 = v239;
          sub_4BF50();
          uint64_t v82 = sub_4C130();
          uint64_t v84 = v83;
          uint64_t v85 = v240;
          char v86 = v232;
          v232(v81, v240);
          uint64_t v279 = v82;
          uint64_t v280 = v84;
          sub_4BF50();
          uint64_t v87 = v245;
          uint64_t v88 = sub_4C130();
          uint64_t v90 = v89;
          v86(v81, v85);
          uint64_t v277 = v88;
          uint64_t v278 = v90;
          uint64_t v91 = sub_4C830();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_87CC((uint64_t)v251, v87, v249);
          swift_bridgeObjectRelease();
          sub_87CC(v248, (uint64_t)v247, v246);
          swift_bridgeObjectRelease();
          sub_8998(v273, v258, v257, v272, v274, v275, v256, v276, v255, v254, v253, v252);
          sub_8998(v270, (uint64_t)v269, v268, v267, v266, v265, v264, v263, v262, v261, v260, v259);
          if (v271 == (v91 != -1)) {
            break;
          }
          Swift::Int v18 = v242 + 1;
          uint64_t v51 = v243;
          uint64_t v50 = v243;
          if (v233 == v242 + 1)
          {
            Swift::Int v7 = v233;
            Swift::Int v18 = v233;
            goto LABEL_22;
          }
        }
        Swift::Int v7 = v233;
        Swift::Int v18 = v242;
LABEL_22:
        Swift::Int v17 = v234;
      }
      uint64_t v2 = v229;
      uint64_t v13 = v230;
      uint64_t v92 = v241;
      if (v237 == -1)
      {
        if (v18 < v17) {
          goto LABEL_134;
        }
        if (v17 < v18)
        {
          uint64_t v93 = 104 * v18;
          Swift::Int v242 = v18;
          Swift::Int v94 = v17;
          Swift::Int v95 = v18;
          Swift::Int v96 = v94;
          uint64_t v97 = 104 * v94;
          do
          {
            if (v96 != --v95)
            {
              if (!v92) {
                goto LABEL_137;
              }
              uint64_t v98 = v92 + v93;
              char v99 = *(unsigned char *)(v92 + v97);
              uint64_t v100 = *(void *)(v92 + v97 + 88);
              __int16 v101 = *(_WORD *)(v92 + v97 + 96);
              long long v102 = *(_OWORD *)(v92 + v97 + 8);
              long long v275 = *(_OWORD *)(v92 + v97 + 24);
              long long v276 = v102;
              long long v103 = *(_OWORD *)(v92 + v97 + 40);
              long long v273 = *(_OWORD *)(v92 + v97 + 56);
              long long v274 = v103;
              long long v272 = *(_OWORD *)(v92 + v97 + 72);
              memmove((void *)(v92 + v97), (const void *)(v92 + v93 - 104), 0x68uLL);
              uint64_t v92 = v241;
              *(unsigned char *)(v98 - 104) = v99;
              long long v104 = v275;
              *(_OWORD *)(v98 - 96) = v276;
              *(_OWORD *)(v98 - 80) = v104;
              long long v105 = v273;
              *(_OWORD *)(v98 - 64) = v274;
              *(_OWORD *)(v98 - 48) = v105;
              *(_OWORD *)(v98 - 32) = v272;
              *(void *)(v98 - 16) = v100;
              *(_WORD *)(v98 - 8) = v101;
              uint64_t v13 = v230;
            }
            ++v96;
            v93 -= 104;
            v97 += 104;
          }
          while (v96 < v95);
          Swift::Int v7 = v233;
          Swift::Int v18 = v242;
          Swift::Int v17 = v234;
        }
      }
    }
    if (v18 < v7)
    {
      if (__OFSUB__(v18, v17)) {
        goto LABEL_130;
      }
      if (v18 - v17 < v228) {
        break;
      }
    }
LABEL_49:
    if (v18 < v17) {
      goto LABEL_125;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_14330(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v164 = *((void *)v13 + 2);
    unint64_t v163 = *((void *)v13 + 3);
    unint64_t v16 = v164 + 1;
    uint64_t v15 = v241;
    uint64_t v12 = v236;
    Swift::Int v242 = v18;
    if (v164 >= v163 >> 1)
    {
      v214 = sub_14330((char *)(v163 > 1), v164 + 1, 1, v13);
      uint64_t v12 = v236;
      uint64_t v15 = v241;
      uint64_t v13 = v214;
    }
    *((void *)v13 + 2) = v16;
    v165 = v13 + 32;
    v166 = &v13[16 * v164 + 32];
    Swift::Int v167 = v242;
    *(void *)v166 = v234;
    *((void *)v166 + 1) = v167;
    if (v164)
    {
      while (1)
      {
        unint64_t v168 = v16 - 1;
        if (v16 >= 4)
        {
          v173 = &v165[16 * v16];
          uint64_t v174 = *((void *)v173 - 8);
          uint64_t v175 = *((void *)v173 - 7);
          BOOL v179 = __OFSUB__(v175, v174);
          uint64_t v176 = v175 - v174;
          if (v179) {
            goto LABEL_114;
          }
          uint64_t v178 = *((void *)v173 - 6);
          uint64_t v177 = *((void *)v173 - 5);
          BOOL v179 = __OFSUB__(v177, v178);
          uint64_t v171 = v177 - v178;
          char v172 = v179;
          if (v179) {
            goto LABEL_115;
          }
          unint64_t v180 = v16 - 2;
          v181 = &v165[16 * v16 - 32];
          uint64_t v183 = *(void *)v181;
          uint64_t v182 = *((void *)v181 + 1);
          BOOL v179 = __OFSUB__(v182, v183);
          uint64_t v184 = v182 - v183;
          if (v179) {
            goto LABEL_117;
          }
          BOOL v179 = __OFADD__(v171, v184);
          uint64_t v185 = v171 + v184;
          if (v179) {
            goto LABEL_120;
          }
          if (v185 >= v176)
          {
            v203 = &v165[16 * v168];
            uint64_t v205 = *(void *)v203;
            uint64_t v204 = *((void *)v203 + 1);
            BOOL v179 = __OFSUB__(v204, v205);
            uint64_t v206 = v204 - v205;
            if (v179) {
              goto LABEL_124;
            }
            BOOL v196 = v171 < v206;
            goto LABEL_86;
          }
        }
        else
        {
          if (v16 != 3)
          {
            uint64_t v197 = *((void *)v13 + 4);
            uint64_t v198 = *((void *)v13 + 5);
            BOOL v179 = __OFSUB__(v198, v197);
            uint64_t v190 = v198 - v197;
            char v191 = v179;
            goto LABEL_80;
          }
          uint64_t v170 = *((void *)v13 + 4);
          uint64_t v169 = *((void *)v13 + 5);
          BOOL v179 = __OFSUB__(v169, v170);
          uint64_t v171 = v169 - v170;
          char v172 = v179;
        }
        if (v172) {
          goto LABEL_116;
        }
        unint64_t v180 = v16 - 2;
        v186 = &v165[16 * v16 - 32];
        uint64_t v188 = *(void *)v186;
        uint64_t v187 = *((void *)v186 + 1);
        BOOL v189 = __OFSUB__(v187, v188);
        uint64_t v190 = v187 - v188;
        char v191 = v189;
        if (v189) {
          goto LABEL_119;
        }
        v192 = &v165[16 * v168];
        uint64_t v194 = *(void *)v192;
        uint64_t v193 = *((void *)v192 + 1);
        BOOL v179 = __OFSUB__(v193, v194);
        uint64_t v195 = v193 - v194;
        if (v179) {
          goto LABEL_122;
        }
        if (__OFADD__(v190, v195)) {
          goto LABEL_123;
        }
        if (v190 + v195 >= v171)
        {
          BOOL v196 = v171 < v195;
LABEL_86:
          if (v196) {
            unint64_t v168 = v180;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v191) {
          goto LABEL_118;
        }
        v199 = &v165[16 * v168];
        uint64_t v201 = *(void *)v199;
        uint64_t v200 = *((void *)v199 + 1);
        BOOL v179 = __OFSUB__(v200, v201);
        uint64_t v202 = v200 - v201;
        if (v179) {
          goto LABEL_121;
        }
        if (v202 < v190) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v207 = v168 - 1;
        if (v168 - 1 >= v16)
        {
          __break(1u);
LABEL_111:
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
          goto LABEL_133;
        }
        if (!v15) {
          goto LABEL_136;
        }
        v208 = v13;
        v209 = &v165[16 * v207];
        uint64_t v210 = *(void *)v209;
        v211 = &v165[16 * v168];
        uint64_t v212 = *((void *)v211 + 1);
        sub_C0E0((unsigned __int8 *)(v15 + 104 * *(void *)v209), v15 + 104 * *(void *)v211, v15 + 104 * v212, v12);
        if (v2) {
          goto LABEL_108;
        }
        if (v212 < v210) {
          goto LABEL_111;
        }
        if (v168 > *((void *)v208 + 2)) {
          goto LABEL_112;
        }
        *(void *)v209 = v210;
        *(void *)&v165[16 * v207 + 8] = v212;
        unint64_t v213 = *((void *)v208 + 2);
        if (v168 >= v213) {
          goto LABEL_113;
        }
        uint64_t v13 = v208;
        unint64_t v16 = v213 - 1;
        memmove(&v165[16 * v168], v211 + 16, 16 * (v213 - 1 - v168));
        *((void *)v208 + 2) = v213 - 1;
        uint64_t v15 = v241;
        uint64_t v12 = v236;
        if (v213 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v16 = 1;
LABEL_14:
    Swift::Int v7 = v233;
    Swift::Int v14 = v242;
    if (v242 >= v233) {
      goto LABEL_97;
    }
  }
  if (__OFADD__(v17, v228)) {
    goto LABEL_132;
  }
  if (v17 + v228 < v7) {
    Swift::Int v7 = v17 + v228;
  }
  if (v7 >= v17)
  {
    if (v18 != v7)
    {
      uint64_t v229 = v2;
      uint64_t v237 = *(void *)(*(void *)(sub_4B980() - 8) + 64);
      v106 = (unsigned __int8 *)(v224 + 104 * v18);
      v232 = (void (*)(char *, uint64_t))v7;
      do
      {
        v235 = v106;
        v108 = v106;
        Swift::Int v242 = v18;
        while (1)
        {
          Swift::Int v243 = v17;
          v269 = &v224;
          v109 = v108 + 104;
          LODWORD(v268) = v108[104];
          uint64_t v110 = *((void *)v108 + 15);
          uint64_t v266 = *((void *)v108 + 14);
          uint64_t v265 = v110;
          unint64_t v111 = *((void *)v108 + 17);
          uint64_t v264 = *((void *)v108 + 16);
          unint64_t v263 = v111;
          uint64_t v112 = *((void *)v108 + 19);
          uint64_t v262 = *((void *)v108 + 18);
          uint64_t v261 = v112;
          unint64_t v113 = *((void *)v108 + 21);
          uint64_t v260 = *((void *)v108 + 20);
          unint64_t v259 = v113;
          uint64_t v114 = *((void *)v108 + 23);
          uint64_t v258 = *((void *)v108 + 22);
          uint64_t v257 = v114;
          uint64_t v256 = *((void *)v108 + 24);
          LODWORD(v255) = *((unsigned __int16 *)v108 + 100);
          uint64_t v254 = *((void *)v108 + 1);
          uint64_t v115 = v254;
          uint64_t v116 = *((void *)v108 + 2);
          *(void *)&long long v273 = *((void *)v108 + 3);
          uint64_t v117 = *((void *)v108 + 4);
          uint64_t v271 = v116;
          *(void *)&long long v272 = v117;
          uint64_t v270 = *((void *)v108 + 5);
          *(void *)&long long v276 = *((void *)v108 + 6);
          *(void *)&long long v275 = *((void *)v108 + 7);
          uint64_t v118 = *((void *)v108 + 9);
          *(void *)&long long v274 = *((void *)v108 + 8);
          uint64_t v253 = v118;
          uint64_t v120 = *((void *)v108 + 11);
          uint64_t v252 = *((void *)v108 + 10);
          uint64_t v119 = v252;
          v251 = (void *)v120;
          unsigned __int16 v121 = *((_WORD *)v108 + 48);
          LODWORD(v250) = v121;
          LODWORD(v267) = *v108;
          uint64_t v122 = v237;
          uint64_t v123 = __chkstk_darwin(v266, v110);
          unint64_t v245 = (v122 + 15) & 0xFFFFFFFFFFFFFFF0;
          sub_87DC(v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134);
          sub_87DC(v115, v271, v273, v272, v270, v276, v275, v274, v118, v119, v120, v121);
          sub_51D0(v268);
          uint64_t v248 = sub_4C180();
          v247 = (void *)v135;
          uint64_t v249 = v136;
          LODWORD(v246) = v137 & 1;
          v244 = &v224;
          __chkstk_darwin(v248, v135);
          sub_51D0(v267);
          uint64_t v268 = sub_4C180();
          uint64_t v267 = v138;
          v269 = (void *)v139;
          LODWORD(v245) = v140 & 1;
          v141 = v239;
          sub_4BF50();
          uint64_t v142 = sub_4C130();
          uint64_t v144 = v143;
          v145 = *v238;
          uint64_t v146 = v240;
          (*v238)(v141, v240);
          uint64_t v279 = v142;
          uint64_t v280 = v144;
          sub_4BF50();
          uint64_t v147 = sub_4C130();
          uint64_t v149 = v148;
          v145(v141, v146);
          uint64_t v277 = v147;
          uint64_t v278 = v149;
          sub_CD9C();
          uint64_t v150 = sub_4C830();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_87CC(v268, v267, v245);
          swift_bridgeObjectRelease();
          sub_87CC(v248, (uint64_t)v247, v246);
          swift_bridgeObjectRelease();
          sub_8998(v254, v271, v273, v272, v270, v276, v275, v274, v253, v252, (uint64_t)v251, v250);
          sub_8998(v266, v265, v264, v263, v262, v261, v260, v259, v258, v257, v256, v255);
          if (v150 != -1) {
            break;
          }
          Swift::Int v107 = v242;
          if (!v241) {
            goto LABEL_135;
          }
          long long v151 = *((_OWORD *)v108 + 8);
          long long v152 = *((_OWORD *)v108 + 9);
          long long v153 = *((_OWORD *)v108 + 10);
          long long v154 = *(_OWORD *)v108;
          long long v155 = *((_OWORD *)v108 + 1);
          *(_OWORD *)(v108 + 8) = *((_OWORD *)v108 + 7);
          long long v157 = *((_OWORD *)v108 + 2);
          long long v156 = *((_OWORD *)v108 + 3);
          *(_OWORD *)(v108 + 24) = v151;
          *(_OWORD *)(v108 + 40) = v152;
          long long v158 = *((_OWORD *)v108 + 4);
          long long v159 = *((_OWORD *)v108 + 5);
          *(_OWORD *)(v108 + 56) = v153;
          *(_OWORD *)(v108 + 72) = *((_OWORD *)v108 + 11);
          uint64_t v160 = *((void *)v108 + 24);
          __int16 v161 = *((_WORD *)v108 + 100);
          uint64_t v162 = *((void *)v108 + 12);
          unsigned __int8 *v108 = v108[104];
          *((void *)v108 + 11) = v160;
          *((_WORD *)v108 + 48) = v161;
          v108 -= 104;
          *((_OWORD *)v109 + 4) = v158;
          *((_OWORD *)v109 + 5) = v159;
          *((void *)v109 + 12) = v162;
          *(_OWORD *)v109 = v154;
          *((_OWORD *)v109 + 1) = v155;
          Swift::Int v17 = v243 + 1;
          *((_OWORD *)v109 + 2) = v157;
          *((_OWORD *)v109 + 3) = v156;
          if (v107 == v17) {
            goto LABEL_42;
          }
        }
        Swift::Int v107 = v242;
LABEL_42:
        Swift::Int v18 = v107 + 1;
        v106 = v235 + 104;
        Swift::Int v17 = v234;
      }
      while ((void (*)(char *, uint64_t))v18 != v232);
      Swift::Int v18 = (Swift::Int)v232;
      uint64_t v2 = v229;
      uint64_t v13 = v230;
    }
    goto LABEL_49;
  }
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
  Swift::Int result = sub_4C9B0();
  __break(1u);
  return result;
}

uint64_t sub_BAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v73 = a1;
  uint64_t v79 = sub_4BF60();
  uint64_t v7 = *(void *)(v79 - 8);
  uint64_t result = __chkstk_darwin(v79, v8);
  char v78 = &v71[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v80 = a3;
  uint64_t v72 = a2;
  if (a3 != a2)
  {
    uint64_t v11 = *a4;
    uint64_t v77 = *(void *)(*(void *)(sub_4B980() - 8) + 64);
    uint64_t v76 = (void (**)(unsigned char *, uint64_t))(v7 + 8);
    uint64_t v75 = v11;
    uint64_t v12 = (unsigned __int8 *)(v11 + 104 * v80 - 104);
LABEL_5:
    uint64_t v81 = v73;
    uint64_t v74 = v12;
    while (1)
    {
      v106 = v71;
      uint64_t v13 = v12 + 104;
      LODWORD(v105) = v12[104];
      uint64_t v14 = *((void *)v12 + 14);
      uint64_t v102 = *((void *)v12 + 15);
      uint64_t v103 = v14;
      uint64_t v15 = *((void *)v12 + 16);
      uint64_t v100 = *((void *)v12 + 17);
      uint64_t v101 = v15;
      uint64_t v16 = *((void *)v12 + 18);
      uint64_t v98 = *((void *)v12 + 19);
      uint64_t v99 = v16;
      unint64_t v17 = *((void *)v12 + 21);
      uint64_t v97 = *((void *)v12 + 20);
      unint64_t v96 = v17;
      uint64_t v18 = *((void *)v12 + 23);
      uint64_t v95 = *((void *)v12 + 22);
      uint64_t v94 = v18;
      uint64_t v93 = *((void *)v12 + 24);
      int v118 = *((unsigned __int16 *)v12 + 100);
      uint64_t v92 = *((void *)v12 + 1);
      uint64_t v19 = v92;
      uint64_t v20 = *((void *)v12 + 3);
      uint64_t v21 = *((void *)v12 + 4);
      uint64_t v108 = *((void *)v12 + 2);
      uint64_t v109 = v21;
      uint64_t v107 = *((void *)v12 + 5);
      uint64_t v22 = *((void *)v12 + 6);
      uint64_t v112 = *((void *)v12 + 7);
      uint64_t v113 = v22;
      unint64_t v23 = *((void *)v12 + 8);
      uint64_t v24 = *((void *)v12 + 9);
      uint64_t v110 = v20;
      unint64_t v111 = v23;
      uint64_t v91 = v24;
      uint64_t v26 = *((void *)v12 + 11);
      uint64_t v90 = *((void *)v12 + 10);
      uint64_t v25 = v90;
      uint64_t v89 = v26;
      unsigned __int16 v27 = *((_WORD *)v12 + 48);
      int v88 = v27;
      LODWORD(v104) = *v12;
      uint64_t v28 = v77;
      uint64_t v29 = __chkstk_darwin(v14, v102);
      unint64_t v83 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_87DC(v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
      sub_87DC(v19, v108, v110, v109, v107, v113, v112, v111, v24, v25, v26, v27);
      sub_51D0(v105);
      uint64_t v86 = sub_4C180();
      uint64_t v85 = v41;
      uint64_t v87 = v42;
      int v84 = v43 & 1;
      uint64_t v82 = v71;
      __chkstk_darwin(v86, v41);
      sub_51D0(v104);
      uint64_t v44 = sub_4C180();
      uint64_t v104 = v45;
      uint64_t v105 = v44;
      v106 = v46;
      LODWORD(v83) = v47 & 1;
      uint64_t v48 = v78;
      sub_4BF50();
      uint64_t v49 = sub_4C130();
      uint64_t v51 = v50;
      uint64_t v52 = *v76;
      uint64_t v53 = v79;
      (*v76)(v48, v79);
      uint64_t v116 = v49;
      uint64_t v117 = v51;
      sub_4BF50();
      uint64_t v54 = sub_4C130();
      uint64_t v56 = v55;
      v52(v48, v53);
      uint64_t v114 = v54;
      uint64_t v115 = v56;
      sub_CD9C();
      uint64_t v57 = sub_4C830();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_87CC(v105, v104, v83);
      swift_bridgeObjectRelease();
      sub_87CC(v86, v85, v84);
      swift_bridgeObjectRelease();
      sub_8998(v92, v108, v110, v109, v107, v113, v112, v111, v91, v90, v89, v88);
      uint64_t result = sub_8998(v103, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93, v118);
      if (v57 != -1)
      {
LABEL_4:
        uint64_t v12 = v74 + 104;
        if (++v80 == v72) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v75) {
        break;
      }
      long long v58 = *((_OWORD *)v12 + 8);
      long long v59 = *((_OWORD *)v12 + 9);
      long long v60 = *((_OWORD *)v12 + 10);
      long long v61 = *(_OWORD *)v12;
      long long v62 = *((_OWORD *)v12 + 1);
      *(_OWORD *)(v12 + 8) = *((_OWORD *)v12 + 7);
      long long v64 = *((_OWORD *)v12 + 2);
      long long v63 = *((_OWORD *)v12 + 3);
      *(_OWORD *)(v12 + 24) = v58;
      *(_OWORD *)(v12 + 40) = v59;
      long long v65 = *((_OWORD *)v12 + 4);
      long long v66 = *((_OWORD *)v12 + 5);
      *(_OWORD *)(v12 + 56) = v60;
      *(_OWORD *)(v12 + 72) = *((_OWORD *)v12 + 11);
      uint64_t v67 = *((void *)v12 + 24);
      __int16 v68 = *((_WORD *)v12 + 100);
      uint64_t v69 = *((void *)v12 + 12);
      *uint64_t v12 = v12[104];
      *((void *)v12 + 11) = v67;
      *((_WORD *)v12 + 48) = v68;
      v12 -= 104;
      *((_OWORD *)v13 + 4) = v65;
      *((_OWORD *)v13 + 5) = v66;
      *((void *)v13 + 12) = v69;
      *(_OWORD *)uint64_t v13 = v61;
      *((_OWORD *)v13 + 1) = v62;
      uint64_t v70 = v81 + 1;
      *((_OWORD *)v13 + 2) = v64;
      *((_OWORD *)v13 + 3) = v63;
      uint64_t v81 = v70;
      if (v80 == v70) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_C0E0(unsigned __int8 *a1, unint64_t a2, unint64_t a3, unsigned __int8 *a4)
{
  uint64_t v147 = sub_4BF60();
  uint64_t v8 = *(void *)(v147 - 8);
  __chkstk_darwin(v147, v9);
  uint64_t v146 = (char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a2 - (void)a1;
  uint64_t v12 = (uint64_t)(a2 - (void)a1) / 104;
  unint64_t v124 = a3;
  uint64_t v13 = a3 - a2;
  unint64_t v168 = (unint64_t)a1;
  Swift::Int v167 = a4;
  if (v12 >= v13 / 104)
  {
    if (v13 < -103) {
      goto LABEL_42;
    }
    uint64_t v64 = 104 * (v13 / 104);
    if (a4 != (unsigned __int8 *)a2 || a2 + v64 <= (unint64_t)a4) {
      memmove(a4, (const void *)a2, 104 * (v13 / 104));
    }
    unint64_t v65 = (unint64_t)&a4[v64];
    v166 = &a4[v64];
    unint64_t v168 = a2;
    if (v13 < 104 || (unint64_t)a1 >= a2) {
      goto LABEL_41;
    }
    unsigned __int16 v121 = *(void (***)(char *, uint64_t))(*(void *)(sub_4B980() - 8) + 64);
    uint64_t v120 = (void (**)(char *, uint64_t))(v8 + 8);
    long long v66 = (char *)(v124 - 104);
    uint64_t v67 = (char *)a2;
    long long v159 = (char *)a1;
    uint64_t v160 = a4;
    while (1)
    {
      __int16 v161 = (char *)a2;
      uint64_t v143 = (char *)v65;
      uint64_t v150 = &v119;
      uint64_t v69 = (unsigned __int8 *)(v65 - 104);
      char v70 = *(unsigned char *)(v65 - 104);
      v145 = v66;
      uint64_t v144 = v66 + 104;
      uint64_t v71 = *(void *)(v65 - 88);
      uint64_t v142 = *(void *)(v65 - 96);
      uint64_t v141 = v71;
      uint64_t v72 = *(void *)(v65 - 72);
      uint64_t v140 = *(void *)(v65 - 80);
      uint64_t v139 = v72;
      uint64_t v73 = *(void *)(v65 - 56);
      uint64_t v138 = *(void *)(v65 - 64);
      uint64_t v137 = v73;
      unint64_t v74 = *(void *)(v65 - 40);
      uint64_t v136 = *(void *)(v65 - 48);
      unint64_t v135 = v74;
      uint64_t v75 = *(void *)(v65 - 24);
      uint64_t v134 = *(void *)(v65 - 32);
      uint64_t v133 = v75;
      uint64_t v132 = *(uint64_t **)(v65 - 16);
      LODWORD(v131) = *(unsigned __int16 *)(v65 - 8);
      int v76 = *(v67 - 104);
      v67 -= 104;
      LODWORD(v149) = v76;
      uint64_t v77 = *((void *)v67 + 1);
      uint64_t v78 = *((void *)v67 + 2);
      uint64_t v153 = *((void *)v67 + 3);
      uint64_t v154 = v77;
      uint64_t v79 = *((void *)v67 + 4);
      uint64_t v151 = v78;
      uint64_t v152 = v79;
      unint64_t v80 = *((void *)v67 + 5);
      uint64_t v157 = *((void *)v67 + 6);
      unint64_t v158 = v80;
      uint64_t v81 = *((void *)v67 + 7);
      uint64_t v82 = *((void *)v67 + 9);
      unint64_t v155 = *((void *)v67 + 8);
      uint64_t v156 = v81;
      uint64_t v130 = v82;
      uint64_t v84 = *((void *)v67 + 11);
      uint64_t v129 = *((void *)v67 + 10);
      uint64_t v83 = v129;
      uint64_t v128 = v84;
      unsigned __int16 v85 = *((_WORD *)v67 + 48);
      LODWORD(v127) = v85;
      uint64_t v86 = v121;
      uint64_t v87 = __chkstk_darwin(v142, v71);
      unint64_t v148 = ((unint64_t)v86 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_87DC(v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98);
      sub_87DC(v154, v151, v153, v152, v158, v157, v156, v155, v82, v83, v84, v85);
      sub_51D0(v70);
      uint64_t v125 = sub_4C180();
      unint64_t v124 = v99;
      unint64_t v126 = v100;
      LODWORD(v123) = v101 & 1;
      __chkstk_darwin(v125, v99);
      sub_51D0(v149);
      uint64_t v122 = sub_4C180();
      uint64_t v149 = v102;
      uint64_t v150 = (uint64_t *)v103;
      LODWORD(v148) = v104 & 1;
      uint64_t v105 = v146;
      sub_4BF50();
      uint64_t v106 = sub_4C130();
      uint64_t v108 = v107;
      uint64_t v109 = *v120;
      uint64_t v110 = v147;
      (*v120)(v105, v147);
      uint64_t v164 = v106;
      uint64_t v165 = v108;
      sub_4BF50();
      uint64_t v111 = v122;
      uint64_t v112 = sub_4C130();
      uint64_t v114 = v113;
      v109(v105, v110);
      uint64_t v162 = v112;
      uint64_t v163 = v114;
      sub_CD9C();
      uint64_t v115 = sub_4C830();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_87CC(v111, v149, v148);
      swift_bridgeObjectRelease();
      sub_87CC(v125, v124, (char)v123);
      swift_bridgeObjectRelease();
      sub_8998(v154, v151, v153, v152, v158, v157, v156, v155, v130, v129, v128, v127);
      sub_8998(v142, v141, v140, v139, v138, v137, v136, v135, v134, v133, (uint64_t)v132, v131);
      if (v115 == -1) {
        break;
      }
      v166 = (unsigned __int8 *)(v65 - 104);
      uint64_t v116 = v145;
      uint64_t v67 = v161;
      if (v144 < v143 || v145 >= v143)
      {
        memmove(v145, v69, 0x68uLL);
        v65 -= 104;
        goto LABEL_28;
      }
      __int16 v68 = v159;
      uint64_t v117 = v160;
      if (v144 != v143) {
        memmove(v145, v69, 0x68uLL);
      }
      v65 -= 104;
      if (v69 <= v117) {
        goto LABEL_41;
      }
LABEL_29:
      long long v66 = v116 - 104;
      a2 = (unint64_t)v67;
      if (v67 <= v68) {
        goto LABEL_41;
      }
    }
    unint64_t v65 = (unint64_t)v143;
    uint64_t v116 = v145;
    if (v144 != v161 || v145 >= v161) {
      memmove(v145, v67, 0x68uLL);
    }
    unint64_t v168 = (unint64_t)v67;
LABEL_28:
    __int16 v68 = v159;
    if (v65 <= (unint64_t)v160) {
      goto LABEL_41;
    }
    goto LABEL_29;
  }
  if (v11 >= -103)
  {
    size_t v14 = 104 * v12;
    if (a4 != a1 || &a1[v14] <= a4) {
      memmove(a4, a1, v14);
    }
    uint64_t v123 = &a4[v14];
    v166 = &a4[v14];
    if (v11 >= 104 && a2 < v124)
    {
      uint64_t v122 = *(void *)(*(void *)(sub_4B980() - 8) + 64);
      unsigned __int16 v121 = (void (**)(char *, uint64_t))(v8 + 8);
      do
      {
        long long v159 = (char *)a1;
        uint64_t v160 = a4;
        uint64_t v132 = &v119;
        uint64_t v15 = *(void *)(a2 + 8);
        uint64_t v151 = *(void *)(a2 + 16);
        uint64_t v152 = v15;
        uint64_t v16 = *(void *)(a2 + 32);
        uint64_t v150 = *(uint64_t **)(a2 + 24);
        uint64_t v149 = v16;
        unint64_t v17 = *(char **)(a2 + 48);
        unint64_t v148 = *(void *)(a2 + 40);
        v145 = v17;
        unint64_t v18 = *(void *)(a2 + 64);
        uint64_t v144 = *(char **)(a2 + 56);
        uint64_t v143 = (char *)v18;
        uint64_t v19 = *(void *)(a2 + 80);
        uint64_t v142 = *(void *)(a2 + 72);
        uint64_t v141 = v19;
        uint64_t v140 = *(void *)(a2 + 88);
        LODWORD(v139) = *(unsigned __int16 *)(a2 + 96);
        uint64_t v138 = *((void *)a4 + 1);
        uint64_t v20 = v138;
        unint64_t v21 = *((void *)a4 + 2);
        uint64_t v157 = *((void *)a4 + 3);
        uint64_t v22 = *((void *)a4 + 4);
        unint64_t v155 = v21;
        uint64_t v156 = v22;
        unint64_t v23 = (char *)a2;
        uint64_t v24 = *((void *)a4 + 5);
        uint64_t v25 = *((void *)a4 + 7);
        uint64_t v153 = *((void *)a4 + 6);
        uint64_t v154 = v24;
        uint64_t v137 = v25;
        uint64_t v26 = *((void *)a4 + 9);
        unint64_t v158 = *((void *)a4 + 8);
        uint64_t v136 = v26;
        uint64_t v28 = *((void *)a4 + 11);
        unint64_t v135 = *((void *)a4 + 10);
        uint64_t v27 = v135;
        uint64_t v134 = v28;
        unsigned __int16 v29 = *((_WORD *)a4 + 48);
        LODWORD(v133) = v29;
        __int16 v161 = v23;
        LODWORD(v131) = *v23;
        LODWORD(v127) = *a4;
        uint64_t v30 = v122;
        uint64_t v31 = __chkstk_darwin(v15, v151);
        unint64_t v126 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
        sub_87DC(v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42);
        sub_87DC(v20, v155, v157, v156, v154, v153, v25, v158, v26, v27, v28, v29);
        sub_51D0(v131);
        uint64_t v130 = sub_4C180();
        uint64_t v129 = v43;
        uint64_t v131 = v44;
        LODWORD(v128) = v45 & 1;
        __chkstk_darwin(v130, v43);
        sub_51D0(v127);
        unint64_t v126 = sub_4C180();
        uint64_t v132 = (uint64_t *)v46;
        uint64_t v127 = v47;
        LODWORD(v125) = v48 & 1;
        uint64_t v49 = v146;
        sub_4BF50();
        uint64_t v50 = sub_4C130();
        uint64_t v52 = v51;
        uint64_t v53 = *v121;
        uint64_t v54 = v147;
        (*v121)(v49, v147);
        uint64_t v164 = v50;
        uint64_t v165 = v52;
        sub_4BF50();
        uint64_t v55 = v126;
        char v56 = v125;
        uint64_t v57 = sub_4C130();
        uint64_t v59 = v58;
        v53(v49, v54);
        uint64_t v162 = v57;
        uint64_t v163 = v59;
        sub_CD9C();
        uint64_t v60 = sub_4C830();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_87CC(v55, (uint64_t)v132, v56);
        swift_bridgeObjectRelease();
        sub_87CC(v130, v129, v128);
        swift_bridgeObjectRelease();
        sub_8998(v138, v155, v157, v156, v154, v153, v137, v158, v136, v135, v134, v133);
        sub_8998(v152, v151, (uint64_t)v150, v149, v148, (uint64_t)v145, (uint64_t)v144, (unint64_t)v143, v142, v141, v140, v139);
        if (v60 == -1)
        {
          a4 = v160;
          long long v61 = v161 + 104;
          long long v63 = v159;
          if (v159 < v161 || v159 >= v61 || v159 != v161) {
            memmove(v159, v161, 0x68uLL);
          }
        }
        else
        {
          long long v62 = (char *)v160;
          long long v61 = v161;
          long long v63 = v159;
          if (v159 != (char *)v160) {
            memmove(v159, v160, 0x68uLL);
          }
          a4 = (unsigned __int8 *)(v62 + 104);
          Swift::Int v167 = a4;
        }
        a1 = (unsigned __int8 *)(v63 + 104);
        unint64_t v168 = (unint64_t)a1;
        if (a4 >= v123) {
          break;
        }
        a2 = (unint64_t)v61;
      }
      while ((unint64_t)v61 < v124);
    }
LABEL_41:
    sub_1442C((void **)&v168, (const void **)&v167, &v166);
    return 1;
  }
LABEL_42:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

void *sub_CD88(void *a1)
{
  return sub_46A78(0, a1[2], 0, a1);
}

unint64_t sub_CD9C()
{
  unint64_t result = qword_67238;
  if (!qword_67238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67238);
  }
  return result;
}

uint64_t destroy for PrivacyAndSecuritySettingsListDataModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListDataModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PrivacyAndSecuritySettingsListDataModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListDataModel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListDataModel(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListDataModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListDataModel(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListDataModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListDataModel;
}

uint64_t sub_CFFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  if ((sub_D2CC(*a1, *a2) & 1) == 0 || (sub_DA2C(v2, v4) & 1) == 0) {
    return 0;
  }

  return sub_E418(v3, v5);
}

uint64_t sub_D07C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2) {
      return 1;
    }
    uint64_t v3 = (uint64_t *)(a2 + 64);
    for (i = (uint64_t *)(a1 + 64); *((unsigned __int8 *)i - 32) == *((unsigned __int8 *)v3 - 32); i += 13)
    {
      uint64_t v31 = v2;
      __int16 v49 = *((_WORD *)i + 32);
      uint64_t v5 = i[5];
      uint64_t v47 = i[6];
      uint64_t v48 = i[7];
      uint64_t v7 = i[3];
      unint64_t v6 = i[4];
      uint64_t v9 = i[1];
      uint64_t v8 = i[2];
      uint64_t v11 = *(i - 1);
      uint64_t v10 = *i;
      uint64_t v12 = *(i - 2);
      __int16 v13 = *((_WORD *)v3 + 32);
      uint64_t v14 = v3[6];
      uint64_t v15 = v3[7];
      uint64_t v16 = v3[5];
      uint64_t v17 = v3[2];
      uint64_t v18 = v3[3];
      uint64_t v19 = v3[1];
      uint64_t v34 = *v3;
      uint64_t v20 = *v3;
      unint64_t v35 = v3[4];
      uint64_t v21 = *(v3 - 1);
      long long v36 = *(_OWORD *)(v3 - 3);
      *(void *)&long long v50 = *(i - 3);
      *((void *)&v50 + 1) = v12;
      uint64_t v38 = v50;
      uint64_t v39 = v12;
      uint64_t v51 = v11;
      uint64_t v52 = v10;
      uint64_t v40 = v11;
      char v41 = v10;
      uint64_t v53 = v9;
      uint64_t v54 = v8;
      uint64_t v22 = v9;
      uint64_t v42 = v9;
      uint64_t v43 = v8;
      uint64_t v55 = v7;
      unint64_t v56 = v6;
      uint64_t v44 = v7;
      unint64_t v45 = v6;
      uint64_t v23 = v5;
      uint64_t v46 = v5;
      uint64_t v57 = v5;
      uint64_t v58 = v47;
      uint64_t v59 = v48;
      __int16 v60 = v49;
      long long v61 = v36;
      uint64_t v62 = v21;
      uint64_t v63 = v20;
      uint64_t v24 = v21;
      uint64_t v64 = v19;
      uint64_t v65 = v17;
      uint64_t v25 = v19;
      uint64_t v26 = v17;
      uint64_t v66 = v18;
      unint64_t v67 = v35;
      uint64_t v27 = v18;
      uint64_t v68 = v16;
      uint64_t v69 = v14;
      uint64_t v28 = v16;
      uint64_t v33 = v16;
      uint64_t v29 = v14;
      uint64_t v32 = v14;
      uint64_t v70 = v15;
      __int16 v71 = v13;
      sub_87DC(v50, v12, v11, v10, v22, v8, v7, v6, v23, v47, v48, v49);
      sub_87DC(v36, *((uint64_t *)&v36 + 1), v24, v34, v25, v26, v27, v35, v28, v29, v15, v13);
      char v37 = sub_79F8(&v50, &v61);
      sub_8998(v36, *((uint64_t *)&v36 + 1), v24, v34, v25, v26, v27, v35, v33, v32, v15, v13);
      sub_8998(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49);
      if ((v37 & 1) == 0) {
        break;
      }
      v3 += 13;
      uint64_t v2 = v31 - 1;
      if (v31 == 1) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_D2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 32;
    uint64_t v5 = a2 + 32;
    uint64_t v55 = a1 + 32;
    uint64_t v56 = *(void *)(a1 + 16);
    uint64_t v54 = a2 + 32;
    while (1)
    {
      unint64_t v6 = (void *)(v4 + 80 * v3);
      uint64_t v7 = (void *)(v5 + 80 * v3);
      if (*(unsigned __int8 *)v6 != *(unsigned __int8 *)v7) {
        return 0;
      }
      uint64_t v57 = v3;
      uint64_t v8 = v6[1];
      uint64_t v9 = v6[2];
      uint64_t v11 = v6[3];
      uint64_t v10 = v6[4];
      uint64_t v12 = v6[5];
      uint64_t v13 = v6[8];
      uint64_t v69 = v6[6];
      uint64_t v70 = v6[7];
      uint64_t v14 = v6[9];
      uint64_t v63 = v7[1];
      uint64_t v64 = v7[2];
      uint64_t v15 = v7[4];
      uint64_t v65 = v7[3];
      uint64_t v66 = v7[5];
      uint64_t v16 = v7[8];
      uint64_t v67 = v7[6];
      uint64_t v68 = v7[7];
      uint64_t v92 = v7[9];
      uint64_t v72 = v16;
      uint64_t v73 = v13;
      uint64_t v61 = v10;
      uint64_t v62 = v12;
      uint64_t v59 = v9;
      char v60 = v11;
      uint64_t v58 = v15;
      if (v10)
      {
        if (!v15) {
          return 0;
        }
        sub_98F4(v8, v9, v11, v10);
        sub_98F4(v8, v9, v11, v10);
        sub_98F4(v8, v9, v11, v10);
        sub_98F4(v12, v69, v70, v13);
        swift_bridgeObjectRetain();
        sub_98F4(v63, v64, v65, v15);
        sub_98F4(v66, v67, v68, v16);
        swift_bridgeObjectRetain();
        sub_98F4(v63, v64, v65, v15);
        char v89 = sub_4C140();
        sub_87CC(v63, v64, v65 & 1);
        swift_bridgeObjectRelease();
        sub_87CC(v8, v9, v11 & 1);
        swift_bridgeObjectRelease();
        sub_9938(v8, v9, v11, v10);
        if ((v89 & 1) == 0)
        {
          sub_9938(v63, v64, v65, v15);
          uint64_t v50 = v66;
          uint64_t v51 = v67;
          char v52 = v68;
          uint64_t v53 = v16;
          goto LABEL_32;
        }
        if (v13)
        {
LABEL_10:
          if (!v16)
          {
            sub_9938(v63, v64, v65, v15);
            uint64_t v50 = v66;
            uint64_t v51 = v67;
            char v52 = v68;
            uint64_t v53 = 0;
LABEL_32:
            sub_9938(v50, v51, v52, v53);
            swift_bridgeObjectRelease();
            sub_9938(v8, v9, v11, v10);
            uint64_t v46 = v12;
LABEL_33:
            uint64_t v47 = v69;
            char v48 = v70;
            uint64_t v49 = v13;
LABEL_34:
            sub_9938(v46, v47, v48, v49);
LABEL_35:
            swift_bridgeObjectRelease();
            return 0;
          }
          sub_98F4(v12, v69, v70, v13);
          sub_98F4(v12, v69, v70, v13);
          sub_98F4(v66, v67, v68, v16);
          char v17 = sub_4C140();
          uint64_t v18 = v72;
          sub_87CC(v66, v67, v68 & 1);
          swift_bridgeObjectRelease();
          sub_87CC(v12, v69, v70 & 1);
          swift_bridgeObjectRelease();
          sub_9938(v12, v69, v70, v13);
          if ((v17 & 1) == 0) {
            goto LABEL_29;
          }
          goto LABEL_16;
        }
      }
      else
      {
        if (v15) {
          return 0;
        }
        sub_98F4(v8, v9, v11, 0);
        sub_98F4(v12, v69, v70, v13);
        swift_bridgeObjectRetain();
        sub_98F4(v63, v64, v65, 0);
        sub_98F4(v66, v67, v68, v16);
        swift_bridgeObjectRetain();
        if (v13) {
          goto LABEL_10;
        }
      }
      uint64_t v18 = v16;
      if (v16)
      {
        sub_9938(v63, v64, v65, v15);
        sub_9938(v66, v67, v68, v16);
        swift_bridgeObjectRelease();
        sub_9938(v8, v9, v11, v10);
        uint64_t v46 = v12;
        uint64_t v47 = v69;
        char v48 = v70;
        uint64_t v49 = 0;
        goto LABEL_34;
      }
LABEL_16:
      uint64_t v19 = *(void *)(v14 + 16);
      if (v19 != *(void *)(v92 + 16))
      {
LABEL_29:
        sub_9938(v63, v64, v65, v15);
        sub_9938(v66, v67, v68, v18);
        swift_bridgeObjectRelease();
        sub_9938(v8, v9, v11, v10);
        uint64_t v46 = v12;
        goto LABEL_33;
      }
      if (v19 && v14 != v92)
      {
        uint64_t v20 = 0;
        uint64_t v71 = v14;
        while (1)
        {
          uint64_t v21 = v14 + v20;
          uint64_t v22 = v92 + v20;
          if (*(unsigned __int8 *)(v14 + v20 + 32) != *(unsigned __int8 *)(v92 + v20 + 32))
          {
            sub_9938(v63, v64, v65, v58);
            sub_9938(v66, v67, v68, v72);
            swift_bridgeObjectRelease();
            sub_9938(v8, v59, v60, v61);
            uint64_t v46 = v62;
            uint64_t v47 = v69;
            char v48 = v70;
            uint64_t v49 = v73;
            goto LABEL_34;
          }
          uint64_t v74 = v20;
          uint64_t v75 = v19;
          __int16 v23 = *(_WORD *)(v21 + 128);
          uint64_t v24 = *(void *)(v21 + 120);
          uint64_t v84 = *(void *)(v21 + 112);
          unint64_t v25 = *(void *)(v21 + 96);
          uint64_t v26 = *(void *)(v21 + 104);
          uint64_t v27 = *(void *)(v21 + 80);
          uint64_t v28 = *(void *)(v21 + 88);
          uint64_t v30 = *(void *)(v21 + 64);
          uint64_t v29 = *(void *)(v21 + 72);
          uint64_t v32 = *(void *)(v21 + 48);
          uint64_t v31 = *(void *)(v21 + 56);
          __int16 v33 = *(_WORD *)(v22 + 128);
          uint64_t v34 = *(void *)(v22 + 112);
          uint64_t v35 = *(void *)(v22 + 120);
          uint64_t v36 = *(void *)(v22 + 104);
          unint64_t v93 = *(void *)(v22 + 96);
          uint64_t v37 = *(void *)(v22 + 80);
          uint64_t v38 = *(void *)(v22 + 88);
          uint64_t v40 = *(void *)(v22 + 64);
          uint64_t v39 = *(void *)(v22 + 72);
          uint64_t v41 = *(void *)(v22 + 56);
          uint64_t v76 = *(void *)(v22 + 48);
          uint64_t v78 = *(void *)(v22 + 40);
          *(void *)&long long v94 = *(void *)(v21 + 40);
          *((void *)&v94 + 1) = v32;
          uint64_t v80 = v94;
          uint64_t v81 = v32;
          uint64_t v95 = v31;
          uint64_t v96 = v30;
          uint64_t v82 = v31;
          char v83 = v30;
          uint64_t v87 = v29;
          uint64_t v88 = v27;
          uint64_t v97 = v29;
          uint64_t v98 = v27;
          uint64_t v90 = v28;
          unint64_t v91 = v25;
          uint64_t v99 = v28;
          unint64_t v100 = v25;
          uint64_t v101 = v26;
          uint64_t v102 = v84;
          uint64_t v79 = v26;
          uint64_t v85 = v24;
          uint64_t v103 = v24;
          char v42 = v23;
          char v86 = v23;
          __int16 v104 = v23;
          *(void *)&long long v105 = v78;
          *((void *)&v105 + 1) = v76;
          uint64_t v106 = v41;
          uint64_t v107 = v40;
          uint64_t v43 = v41;
          uint64_t v108 = v39;
          uint64_t v109 = v37;
          uint64_t v44 = v37;
          uint64_t v110 = v38;
          unint64_t v111 = v93;
          uint64_t v112 = v36;
          uint64_t v113 = v34;
          uint64_t v114 = v35;
          __int16 v115 = v33;
          sub_87DC(v94, v32, v31, v30, v29, v27, v28, v25, v26, v84, v24, v42);
          sub_87DC(v78, v76, v43, v40, v39, v44, v38, v93, v36, v34, v35, v33);
          char v77 = sub_79F8(&v94, &v105);
          sub_8998(v78, v76, v43, v40, v39, v44, v38, v93, v36, v34, v35, v33);
          sub_8998(v80, v81, v82, v83, v87, v88, v90, v91, v79, v84, v85, v86);
          if ((v77 & 1) == 0) {
            break;
          }
          uint64_t v20 = v74 + 104;
          uint64_t v19 = v75 - 1;
          uint64_t v14 = v71;
          if (v75 == 1)
          {
            uint64_t v12 = v62;
            goto LABEL_24;
          }
        }
        sub_9938(v63, v64, v65, v58);
        sub_9938(v66, v67, v68, v72);
        swift_bridgeObjectRelease();
        sub_9938(v8, v59, v60, v61);
        sub_9938(v62, v69, v70, v73);
        goto LABEL_35;
      }
LABEL_24:
      sub_9938(v63, v64, v65, v58);
      sub_9938(v66, v67, v68, v72);
      uint64_t v3 = v57 + 1;
      swift_bridgeObjectRelease();
      sub_9938(v8, v59, v60, v61);
      sub_9938(v12, v69, v70, v73);
      swift_bridgeObjectRelease();
      uint64_t result = 1;
      uint64_t v4 = v55;
      uint64_t v5 = v54;
      if (v57 + 1 == v56) {
        return result;
      }
    }
  }
  return 1;
}

uint64_t sub_DA2C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v2 = 0;
  uint64_t v3 = *(void *)(result + 64);
  uint64_t v67 = a2;
  uint64_t v68 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & v3;
  int64_t v69 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v66 = result;
  if ((v5 & v3) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v7 = __clz(__rbit64(v6));
  uint64_t v8 = (v6 - 1) & v6;
  int64_t v71 = v2;
  for (unint64_t i = v7 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v11)) + (v12 << 6))
  {
    uint64_t v14 = (void *)(*(void *)(result + 56) + 80 * i);
    int v15 = *(unsigned __int8 *)v14;
    uint64_t v16 = v14[2];
    uint64_t v84 = v14[1];
    uint64_t v85 = v14[3];
    uint64_t v76 = v14[4];
    uint64_t v17 = v14[6];
    uint64_t v83 = v14[5];
    uint64_t v18 = v14[8];
    uint64_t v88 = v14[7];
    uint64_t v19 = v14[9];
    uint64_t v20 = a2;
    uint64_t v21 = sub_1F304(*(unsigned __int8 *)(*(void *)(result + 48) + i));
    if ((v22 & 1) == 0 || (__int16 v23 = (void *)(*(void *)(v20 + 56) + 80 * v21), *(unsigned __int8 *)v23 != v15))
    {
LABEL_50:
      sub_98F4(v84, v16, v85, v76);
      char v61 = v88;
      sub_98F4(v83, v17, v88, v18);
      swift_bridgeObjectRetain();
      sub_9938(v84, v16, v85, v76);
      uint64_t v57 = v83;
LABEL_54:
      uint64_t v58 = v17;
      char v60 = v61;
      uint64_t v59 = v18;
      goto LABEL_55;
    }
    uint64_t v80 = v23[1];
    uint64_t v81 = v23[2];
    uint64_t v82 = v23[3];
    uint64_t v77 = v23[5];
    uint64_t v78 = v23[6];
    uint64_t v79 = v23[7];
    uint64_t v89 = v23[8];
    uint64_t v109 = v23[9];
    uint64_t v74 = v18;
    uint64_t v75 = v23[4];
    uint64_t v73 = v17;
    unint64_t v70 = v8;
    if (v75) {
      break;
    }
    if (v76) {
      goto LABEL_50;
    }
    uint64_t v24 = v16;
    sub_98F4(v84, v16, v85, 0);
    sub_98F4(v83, v17, v88, v18);
    swift_bridgeObjectRetain();
    sub_98F4(v80, v81, v82, 0);
    uint64_t v25 = v89;
    sub_98F4(v77, v78, v79, v89);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v72 = v16;
    if (v89) {
      goto LABEL_29;
    }
LABEL_34:
    uint64_t v26 = v18;
    if (v18)
    {
      sub_9938(v80, v81, v82, v75);
      uint64_t v62 = v77;
      uint64_t v63 = v78;
      char v64 = v79;
      uint64_t v65 = 0;
      goto LABEL_52;
    }
LABEL_35:
    uint64_t v28 = *(void *)(v109 + 16);
    if (v28 != *(void *)(v19 + 16))
    {
LABEL_51:
      sub_9938(v80, v81, v82, v75);
      uint64_t v62 = v77;
      uint64_t v63 = v78;
      char v64 = v79;
      uint64_t v65 = v25;
LABEL_52:
      sub_9938(v62, v63, v64, v65);
      swift_bridgeObjectRelease();
      sub_9938(v84, v72, v85, v76);
      uint64_t v57 = v83;
      uint64_t v58 = v17;
      char v60 = v88;
      uint64_t v59 = v26;
      goto LABEL_55;
    }
    uint64_t v29 = v72;
    char v30 = v88;
    if (v28 && v109 != v19)
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v86 = *(void *)(v109 + 16);
      uint64_t v87 = v19;
      while (v32 < *(void *)(v19 + 16))
      {
        uint64_t v33 = v109 + v31;
        uint64_t v34 = v19 + v31;
        if (*(unsigned __int8 *)(v109 + v31 + 32) != *(unsigned __int8 *)(v19 + v31 + 32))
        {
          sub_9938(v80, v81, v82, v75);
          sub_9938(v77, v78, v79, v89);
          swift_bridgeObjectRelease();
          uint64_t v55 = v84;
          uint64_t v56 = v72;
          goto LABEL_48;
        }
        unint64_t v90 = v32;
        uint64_t v35 = *(void *)(v33 + 56);
        uint64_t v36 = *(void *)(v33 + 64);
        uint64_t v37 = *(void *)(v33 + 72);
        uint64_t v38 = *(void *)(v33 + 80);
        uint64_t v39 = *(void *)(v33 + 88);
        unint64_t v40 = *(void *)(v33 + 96);
        uint64_t v41 = *(void *)(v33 + 104);
        uint64_t v42 = *(void *)(v33 + 112);
        uint64_t v97 = *(void *)(v33 + 120);
        __int16 v96 = *(_WORD *)(v33 + 128);
        __int16 v43 = *(_WORD *)(v34 + 128);
        uint64_t v44 = *(void *)(v34 + 112);
        uint64_t v45 = *(void *)(v34 + 120);
        uint64_t v46 = *(void *)(v34 + 104);
        uint64_t v48 = *(void *)(v34 + 80);
        uint64_t v47 = *(void *)(v34 + 88);
        uint64_t v49 = *(void *)(v34 + 72);
        uint64_t v93 = *(void *)(v34 + 64);
        unint64_t v94 = *(void *)(v34 + 96);
        uint64_t v50 = *(void *)(v34 + 56);
        uint64_t v92 = *(void *)(v34 + 48);
        uint64_t v51 = *(void *)(v34 + 40);
        uint64_t v107 = *(void *)(v33 + 48);
        uint64_t v108 = *(void *)(v33 + 40);
        *(void *)&long long v110 = v108;
        *((void *)&v110 + 1) = v107;
        char v104 = v36;
        uint64_t v106 = v35;
        uint64_t v111 = v35;
        uint64_t v112 = v36;
        uint64_t v102 = v38;
        uint64_t v103 = v37;
        uint64_t v113 = v37;
        uint64_t v114 = v38;
        unint64_t v100 = v40;
        uint64_t v101 = v39;
        uint64_t v115 = v39;
        unint64_t v116 = v40;
        uint64_t v98 = v42;
        uint64_t v99 = v41;
        uint64_t v117 = v41;
        uint64_t v118 = v42;
        uint64_t v119 = v97;
        __int16 v120 = v96;
        *(void *)&long long v121 = v51;
        *((void *)&v121 + 1) = v92;
        uint64_t v122 = v50;
        uint64_t v123 = v93;
        uint64_t v124 = v49;
        uint64_t v125 = v48;
        uint64_t v52 = v49;
        uint64_t v126 = v47;
        unint64_t v127 = v94;
        uint64_t v53 = v47;
        uint64_t v128 = v46;
        uint64_t v129 = v44;
        uint64_t v54 = v46;
        uint64_t v91 = v46;
        uint64_t v130 = v45;
        __int16 v131 = v43;
        sub_87DC(v108, v107, v35, v36, v37, v38, v39, v40, v41, v42, v97, v96);
        sub_87DC(v51, v92, v50, v93, v52, v48, v53, v94, v54, v44, v45, v43);
        char v95 = sub_79F8(&v110, &v121);
        sub_8998(v51, v92, v50, v93, v52, v48, v53, v94, v91, v44, v45, v43);
        uint64_t result = sub_8998(v108, v107, v106, v104, v103, v102, v101, v100, v99, v98, v97, v96);
        if ((v95 & 1) == 0)
        {
          sub_9938(v80, v81, v82, v75);
          sub_9938(v77, v78, v79, v89);
          swift_bridgeObjectRelease();
          sub_9938(v84, v72, v85, v76);
          sub_9938(v83, v73, v88, v74);
          goto LABEL_56;
        }
        unint64_t v32 = v90 + 1;
        v31 += 104;
        uint64_t v19 = v87;
        if (v86 == v90 + 1)
        {
          char v30 = v88;
          uint64_t v25 = v89;
          uint64_t v17 = v73;
          uint64_t v26 = v74;
          uint64_t v29 = v72;
          goto LABEL_44;
        }
      }
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
      return result;
    }
LABEL_44:
    sub_9938(v80, v81, v82, v75);
    sub_9938(v77, v78, v79, v25);
    swift_bridgeObjectRelease();
    sub_9938(v84, v29, v85, v76);
    sub_9938(v83, v17, v30, v26);
    swift_bridgeObjectRelease();
    uint64_t result = v66;
    a2 = v67;
    unint64_t v6 = v70;
    int64_t v2 = v71;
    if (v70) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      goto LABEL_62;
    }
    if (v10 >= v69) {
      return 1;
    }
    unint64_t v11 = *(void *)(v68 + 8 * v10);
    int64_t v12 = v2 + 1;
    if (!v11)
    {
      int64_t v12 = v10 + 1;
      if (v10 + 1 >= v69) {
        return 1;
      }
      unint64_t v11 = *(void *)(v68 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v10 + 2;
        if (v10 + 2 >= v69) {
          return 1;
        }
        unint64_t v11 = *(void *)(v68 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v10 + 3;
          if (v10 + 3 >= v69) {
            return 1;
          }
          unint64_t v11 = *(void *)(v68 + 8 * v12);
          if (!v11)
          {
            int64_t v13 = v10 + 4;
            if (v13 >= v69) {
              return 1;
            }
            unint64_t v11 = *(void *)(v68 + 8 * v13);
            if (!v11)
            {
              while (1)
              {
                int64_t v12 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_63;
                }
                if (v12 >= v69) {
                  return 1;
                }
                unint64_t v11 = *(void *)(v68 + 8 * v12);
                ++v13;
                if (v11) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v12 = v13;
          }
        }
      }
    }
LABEL_22:
    uint64_t v8 = (v11 - 1) & v11;
    int64_t v71 = v12;
  }
  if (!v76)
  {
    sub_98F4(v84, v16, v85, 0);
    char v61 = v88;
    sub_98F4(v83, v17, v88, v18);
    swift_bridgeObjectRetain();
    sub_9938(v84, v16, v85, 0);
    uint64_t v57 = v83;
    goto LABEL_54;
  }
  sub_98F4(v80, v81, v82, v75);
  sub_98F4(v80, v81, v82, v75);
  sub_98F4(v84, v16, v85, v76);
  uint64_t v24 = v16;
  sub_98F4(v83, v17, v88, v18);
  swift_bridgeObjectRetain();
  sub_98F4(v80, v81, v82, v75);
  uint64_t v25 = v89;
  sub_98F4(v77, v78, v79, v89);
  swift_bridgeObjectRetain();
  sub_98F4(v84, v16, v85, v76);
  char v105 = sub_4C140();
  sub_87CC(v84, v16, v85 & 1);
  swift_bridgeObjectRelease();
  sub_87CC(v80, v81, v82 & 1);
  swift_bridgeObjectRelease();
  uint64_t result = sub_9938(v80, v81, v82, v75);
  if ((v105 & 1) == 0)
  {
    sub_9938(v80, v81, v82, v75);
    sub_9938(v77, v78, v79, v89);
    swift_bridgeObjectRelease();
    uint64_t v55 = v84;
    uint64_t v56 = v16;
LABEL_48:
    sub_9938(v55, v56, v85, v76);
    uint64_t v57 = v83;
    uint64_t v58 = v73;
    uint64_t v59 = v74;
    char v60 = v88;
    goto LABEL_55;
  }
  uint64_t v72 = v16;
  if (!v89) {
    goto LABEL_34;
  }
LABEL_29:
  uint64_t v26 = v18;
  if (v18)
  {
    sub_98F4(v77, v78, v79, v89);
    sub_98F4(v77, v78, v79, v89);
    sub_98F4(v83, v17, v88, v18);
    char v27 = sub_4C140();
    sub_87CC(v83, v17, v88 & 1);
    swift_bridgeObjectRelease();
    sub_87CC(v77, v78, v79 & 1);
    swift_bridgeObjectRelease();
    uint64_t v25 = v89;
    uint64_t result = sub_9938(v77, v78, v79, v89);
    if ((v27 & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_35;
  }
  sub_9938(v80, v81, v82, v75);
  sub_9938(v77, v78, v79, v25);
  swift_bridgeObjectRelease();
  sub_9938(v84, v24, v85, v76);
  uint64_t v57 = v83;
  uint64_t v58 = v17;
  char v60 = v88;
  uint64_t v59 = 0;
LABEL_55:
  sub_9938(v57, v58, v60, v59);
LABEL_56:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_E418(uint64_t result, uint64_t a2)
{
  uint64_t v37 = result;
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v51 = 0;
  uint64_t v34 = result + 64;
  uint64_t v2 = 1 << *(unsigned char *)(result + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(result + 64);
  int64_t v35 = (unint64_t)(v2 + 63) >> 6;
  while (v4)
  {
    unint64_t v5 = __clz(__rbit64(v4));
    uint64_t v6 = (v4 - 1) & v4;
    unint64_t v7 = v5 | (v51 << 6);
    uint64_t v8 = a2;
LABEL_24:
    int64_t v12 = (unsigned __int8 *)(*(void *)(v37 + 56) + 104 * v7);
    int v13 = *v12;
    long long v52 = *(_OWORD *)(v12 + 8);
    uint64_t v53 = *((void *)v12 + 3);
    uint64_t v54 = *((void *)v12 + 4);
    uint64_t v14 = *((void *)v12 + 6);
    uint64_t v55 = *((void *)v12 + 5);
    uint64_t v15 = *((void *)v12 + 7);
    unint64_t v16 = *((void *)v12 + 8);
    uint64_t v17 = *((void *)v12 + 9);
    uint64_t v18 = *((void *)v12 + 10);
    uint64_t v19 = *((void *)v12 + 11);
    __int16 v20 = *((_WORD *)v12 + 48);
    uint64_t v21 = sub_1F304(*(unsigned __int8 *)(*(void *)(v37 + 48) + v7));
    if ((v22 & 1) == 0 || (__int16 v23 = (unsigned __int8 *)(*(void *)(v8 + 56) + 104 * v21), *v23 != v13))
    {
      sub_87DC(v52, *((uint64_t *)&v52 + 1), v53, v54, v55, v14, v15, v16, v17, v18, v19, v20);
      sub_8998(v52, *((uint64_t *)&v52 + 1), v53, v54, v55, v14, v15, v16, v17, v18, v19, v33);
      return 0;
    }
    __int16 v24 = *((_WORD *)v23 + 48);
    uint64_t v26 = *((void *)v23 + 10);
    uint64_t v25 = *((void *)v23 + 11);
    uint64_t v27 = v14;
    uint64_t v28 = *((void *)v23 + 9);
    uint64_t v46 = *((void *)v23 + 7);
    unint64_t v47 = *((void *)v23 + 8);
    uint64_t v29 = *((void *)v23 + 5);
    uint64_t v44 = *((void *)v23 + 4);
    uint64_t v45 = *((void *)v23 + 6);
    unint64_t v50 = v6;
    uint64_t v42 = *((void *)v23 + 2);
    uint64_t v43 = *((void *)v23 + 3);
    unint64_t v30 = v16;
    *(void *)&long long v56 = *((void *)v23 + 1);
    uint64_t v41 = v56;
    *((void *)&v56 + 1) = v42;
    uint64_t v57 = v43;
    uint64_t v58 = v44;
    uint64_t v59 = v29;
    uint64_t v60 = v45;
    uint64_t v61 = v46;
    unint64_t v62 = v47;
    uint64_t v63 = v28;
    uint64_t v64 = v26;
    uint64_t v65 = v25;
    uint64_t v31 = v25;
    uint64_t v39 = v25;
    __int16 v66 = v24;
    char v32 = v24;
    char v38 = v24;
    long long v67 = v52;
    uint64_t v68 = v53;
    uint64_t v69 = v54;
    uint64_t v70 = v55;
    uint64_t v71 = v27;
    unint64_t v48 = v30;
    uint64_t v49 = v27;
    uint64_t v72 = v15;
    unint64_t v73 = v30;
    uint64_t v74 = v17;
    uint64_t v75 = v18;
    uint64_t v76 = v19;
    __int16 v77 = v20;
    sub_87DC(v52, *((uint64_t *)&v52 + 1), v53, v54, v55, v27, v15, v30, v17, v18, v19, v20);
    sub_87DC(v41, v42, v43, v44, v29, v45, v46, v47, v28, v26, v31, v32);
    char v40 = sub_79F8(&v56, &v67);
    unint64_t v4 = v50;
    sub_8998(v41, v42, v43, v44, v29, v45, v46, v47, v28, v26, v39, v38);
    uint64_t result = sub_8998(v52, *((uint64_t *)&v52 + 1), v53, v54, v55, v49, v15, v48, v17, v18, v19, v20);
    if ((v40 & 1) == 0) {
      return 0;
    }
  }
  int64_t v9 = v51 + 1;
  uint64_t v8 = a2;
  if (__OFADD__(v51, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v9 >= v35) {
    return 1;
  }
  unint64_t v10 = *(void *)(v34 + 8 * v9);
  ++v51;
  if (v10) {
    goto LABEL_23;
  }
  int64_t v51 = v9 + 1;
  if (v9 + 1 >= v35) {
    return 1;
  }
  unint64_t v10 = *(void *)(v34 + 8 * v51);
  if (v10) {
    goto LABEL_23;
  }
  int64_t v51 = v9 + 2;
  if (v9 + 2 >= v35) {
    return 1;
  }
  unint64_t v10 = *(void *)(v34 + 8 * v51);
  if (v10) {
    goto LABEL_23;
  }
  int64_t v51 = v9 + 3;
  if (v9 + 3 >= v35) {
    return 1;
  }
  unint64_t v10 = *(void *)(v34 + 8 * v51);
  if (v10)
  {
LABEL_23:
    uint64_t v6 = (v10 - 1) & v10;
    unint64_t v7 = __clz(__rbit64(v10)) + (v51 << 6);
    goto LABEL_24;
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v35) {
    return 1;
  }
  unint64_t v10 = *(void *)(v34 + 8 * v11);
  if (v10)
  {
    int64_t v51 = v11;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v51 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v51 >= v35) {
      return 1;
    }
    unint64_t v10 = *(void *)(v34 + 8 * v51);
    ++v11;
    if (v10) {
      goto LABEL_23;
    }
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_E880(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  uint64_t v37 = result;
  int64_t v38 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      uint64_t v10 = (v8 - 1) & v8;
      unint64_t v11 = v9 | (v4 << 6);
    }
    else
    {
      int64_t v12 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        goto LABEL_49;
      }
      if (v12 >= v38) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v12);
      ++v4;
      if (!v13)
      {
        int64_t v4 = v12 + 1;
        if (v12 + 1 >= v38) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 2;
          if (v12 + 2 >= v38) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13)
          {
            int64_t v4 = v12 + 3;
            if (v12 + 3 >= v38) {
              return 1;
            }
            unint64_t v13 = *(void *)(v5 + 8 * v4);
            if (!v13)
            {
              int64_t v14 = v12 + 4;
              if (v14 >= v38) {
                return 1;
              }
              unint64_t v13 = *(void *)(v5 + 8 * v14);
              if (!v13)
              {
                while (1)
                {
                  int64_t v4 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_51;
                  }
                  if (v4 >= v38) {
                    return 1;
                  }
                  unint64_t v13 = *(void *)(v5 + 8 * v4);
                  ++v14;
                  if (v13) {
                    goto LABEL_24;
                  }
                }
              }
              int64_t v4 = v14;
            }
          }
        }
      }
LABEL_24:
      uint64_t v10 = (v13 - 1) & v13;
      unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
    }
    uint64_t v15 = 8 * v11;
    unint64_t v16 = *(void **)(*(void *)(v3 + 56) + v15);
    id v17 = *(id *)(*(void *)(v3 + 48) + v15);
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_1F42C((uint64_t)v17);
    char v20 = v19;

    if ((v20 & 1) == 0) {
      goto LABEL_45;
    }
    unint64_t v39 = v10;
    uint64_t v21 = *(void **)(*(void *)(v2 + 56) + 8 * v18);
    uint64_t v22 = v21[2];
    if (v22 != v16[2]) {
      goto LABEL_45;
    }
    uint64_t v23 = v2;
    if (v22 && v21 != v16) {
      break;
    }
LABEL_6:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v2 = v23;
    unint64_t v8 = v39;
  }
  uint64_t v25 = v5;
  uint64_t v26 = v21[4];
  uint64_t v27 = v16[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v28 = sub_EBD4(v26, v27);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v28 & 1) == 0) {
    goto LABEL_44;
  }
  if (v22 == 1) {
    goto LABEL_41;
  }
  if (v16[2] < 2uLL) {
    goto LABEL_50;
  }
  uint64_t v29 = v21[5];
  uint64_t v30 = v16[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v31 = sub_EBD4(v29, v30);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v31 & 1) == 0)
  {
LABEL_44:
    swift_bridgeObjectRelease();
LABEL_45:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v22 == 2)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    uint64_t v3 = v37;
    uint64_t v5 = v25;
    goto LABEL_6;
  }
  uint64_t v32 = 2 - v22;
  uint64_t v33 = 6;
  while (v32 + v33 != 6)
  {
    if ((unint64_t)(v33 - 4) >= v16[2]) {
      goto LABEL_48;
    }
    uint64_t v34 = v21[v33];
    uint64_t v35 = v16[v33];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v36 = sub_EBD4(v34, v35);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v36 & 1) == 0) {
      goto LABEL_44;
    }
    ++v33;
    if (v32 + v33 == 6) {
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_EBD4(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_1F370(v16, v17);
    char v21 = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0 || *(void *)(*(void *)(a2 + 56) + 8 * v19) != v18) {
      return 0;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_ED80(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4890(&qword_67248);
  char v46 = a2;
  uint64_t result = sub_4C9F0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v43 = (void *)(v5 + 64);
    uint64_t v44 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    uint64_t v41 = v2;
    int64_t v42 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    uint64_t v45 = result;
    while (1)
    {
      if (v11)
      {
        uint64_t v47 = (v11 - 1) & v11;
        int64_t v48 = v8;
        unint64_t v21 = __clz(__rbit64(v11)) | (v8 << 6);
      }
      else
      {
        int64_t v22 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v43;
        if (v22 >= v42) {
          goto LABEL_33;
        }
        unint64_t v23 = v43[v22];
        int64_t v24 = v8 + 1;
        if (!v23)
        {
          int64_t v24 = v22 + 1;
          if (v22 + 1 >= v42) {
            goto LABEL_33;
          }
          unint64_t v23 = v43[v24];
          if (!v23)
          {
            int64_t v25 = v22 + 2;
            if (v25 >= v42)
            {
LABEL_33:
              if ((v46 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v41;
                goto LABEL_40;
              }
              uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
              if (v40 >= 64) {
                bzero(v43, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v43 = -1 << v40;
              }
              uint64_t v3 = v41;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v23 = v43[v25];
            if (!v23)
            {
              while (1)
              {
                int64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_42;
                }
                if (v24 >= v42) {
                  goto LABEL_33;
                }
                unint64_t v23 = v43[v24];
                ++v25;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v24 = v25;
          }
        }
LABEL_30:
        uint64_t v47 = (v23 - 1) & v23;
        int64_t v48 = v24;
        unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      Swift::UInt v51 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v21);
      uint64_t v30 = *(void *)(v5 + 56) + 104 * v21;
      char v49 = *(unsigned char *)v30;
      uint64_t v31 = *(void *)(v30 + 8);
      uint64_t v32 = *(void *)(v30 + 16);
      uint64_t v33 = *(void *)(v30 + 24);
      uint64_t v34 = *(void *)(v30 + 32);
      uint64_t v35 = *(void *)(v30 + 40);
      uint64_t v36 = *(void *)(v30 + 48);
      uint64_t v38 = *(void *)(v30 + 56);
      unint64_t v37 = *(void *)(v30 + 64);
      uint64_t v39 = *(void *)(v30 + 72);
      uint64_t v53 = *(void *)(v30 + 88);
      uint64_t v54 = *(void *)(v30 + 80);
      __int16 v52 = *(_WORD *)(v30 + 96);
      if ((v46 & 1) == 0) {
        sub_87DC(v31, v32, v33, v34, v35, v36, v38, v37, v39, v54, v53, v52);
      }
      uint64_t v50 = v39;
      uint64_t v7 = v45;
      sub_4CAD0();
      sub_4CAE0(v51);
      Swift::Int v13 = sub_4CAF0();
      uint64_t v14 = -1 << *(unsigned char *)(v45 + 32);
      unint64_t v15 = v13 & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v12 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v12 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        uint64_t result = v38;
        uint64_t v18 = v50;
        unint64_t v19 = v37;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v14) >> 6;
        uint64_t result = v38;
        uint64_t v18 = v50;
        unint64_t v19 = v37;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v28 = v16 == v27;
          if (v16 == v27) {
            unint64_t v16 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v16);
        }
        while (v29 == -1);
        unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(void *)(v12 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v45 + 48) + v17) = v51;
      uint64_t v20 = *(void *)(v45 + 56) + 104 * v17;
      *(unsigned char *)uint64_t v20 = v49;
      *(void *)(v20 + 8) = v31;
      *(void *)(v20 + 16) = v32;
      *(void *)(v20 + 24) = v33;
      *(void *)(v20 + 32) = v34;
      *(void *)(v20 + 40) = v35;
      *(void *)(v20 + 48) = v36;
      *(void *)(v20 + 56) = result;
      *(void *)(v20 + 64) = v19;
      *(void *)(v20 + 72) = v18;
      *(void *)(v20 + 80) = v54;
      *(void *)(v20 + 88) = v53;
      *(_WORD *)(v20 + 96) = v52;
      ++*(void *)(v45 + 16);
      uint64_t v5 = v44;
      unint64_t v11 = v47;
      int64_t v8 = v48;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_F140(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4890(&qword_67240);
  char v46 = a2;
  uint64_t result = sub_4C9F0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v43 = (void *)(v5 + 64);
    uint64_t v44 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    uint64_t v41 = v2;
    int64_t v42 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    uint64_t v45 = result;
    while (1)
    {
      if (v11)
      {
        uint64_t v47 = (v11 - 1) & v11;
        int64_t v48 = v8;
        unint64_t v21 = __clz(__rbit64(v11)) | (v8 << 6);
      }
      else
      {
        int64_t v22 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v43;
        if (v22 >= v42) {
          goto LABEL_33;
        }
        unint64_t v23 = v43[v22];
        int64_t v24 = v8 + 1;
        if (!v23)
        {
          int64_t v24 = v22 + 1;
          if (v22 + 1 >= v42) {
            goto LABEL_33;
          }
          unint64_t v23 = v43[v24];
          if (!v23)
          {
            int64_t v25 = v22 + 2;
            if (v25 >= v42)
            {
LABEL_33:
              if ((v46 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v41;
                goto LABEL_40;
              }
              uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
              if (v40 >= 64) {
                bzero(v43, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v43 = -1 << v40;
              }
              uint64_t v3 = v41;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v23 = v43[v25];
            if (!v23)
            {
              while (1)
              {
                int64_t v24 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_42;
                }
                if (v24 >= v42) {
                  goto LABEL_33;
                }
                unint64_t v23 = v43[v24];
                ++v25;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v24 = v25;
          }
        }
LABEL_30:
        uint64_t v47 = (v23 - 1) & v23;
        int64_t v48 = v24;
        unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      Swift::UInt v51 = *(unsigned __int8 *)(*(void *)(v5 + 48) + v21);
      uint64_t v30 = *(void *)(v5 + 56) + 80 * v21;
      char v49 = *(unsigned char *)v30;
      uint64_t v31 = *(void *)(v30 + 8);
      uint64_t v32 = *(void *)(v30 + 16);
      uint64_t v33 = *(void *)(v30 + 24);
      uint64_t v34 = *(void *)(v30 + 32);
      uint64_t v35 = *(void *)(v30 + 40);
      uint64_t v36 = *(void *)(v30 + 48);
      uint64_t v38 = *(void *)(v30 + 56);
      uint64_t v37 = *(void *)(v30 + 64);
      uint64_t v39 = *(void *)(v30 + 72);
      if ((v46 & 1) == 0)
      {
        sub_98F4(v31, v32, v33, v34);
        sub_98F4(v35, v36, v38, v37);
        swift_bridgeObjectRetain();
      }
      uint64_t v50 = v39;
      uint64_t v7 = v45;
      sub_4CAD0();
      sub_4CAE0(v51);
      Swift::Int v13 = sub_4CAF0();
      uint64_t v14 = -1 << *(unsigned char *)(v45 + 32);
      unint64_t v15 = v13 & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v12 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v12 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        uint64_t result = v38;
        uint64_t v18 = v50;
        uint64_t v19 = v37;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v14) >> 6;
        uint64_t result = v38;
        uint64_t v18 = v50;
        uint64_t v19 = v37;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v28 = v16 == v27;
          if (v16 == v27) {
            unint64_t v16 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v16);
        }
        while (v29 == -1);
        unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(void *)(v12 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v45 + 48) + v17) = v51;
      uint64_t v20 = *(void *)(v45 + 56) + 80 * v17;
      *(unsigned char *)uint64_t v20 = v49;
      *(void *)(v20 + 8) = v31;
      *(void *)(v20 + 16) = v32;
      *(void *)(v20 + 24) = v33;
      *(void *)(v20 + 32) = v34;
      *(void *)(v20 + 40) = v35;
      *(void *)(v20 + 48) = v36;
      *(void *)(v20 + 56) = result;
      *(void *)(v20 + 64) = v19;
      *(void *)(v20 + 72) = v18;
      ++*(void *)(v45 + 16);
      uint64_t v5 = v44;
      unint64_t v11 = v47;
      int64_t v8 = v48;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_F4D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4890(&qword_67250);
  char v36 = a2;
  uint64_t v6 = sub_4C9F0();
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
    int64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_4CAD0();
    sub_4C560();
    uint64_t result = sub_4CAF0();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_F7E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4890(&qword_67260);
  uint64_t v6 = sub_4C9F0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v34[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v34[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v34[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v34[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void **)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
      {
        id v31 = v29;
        swift_bridgeObjectRetain();
      }
      sub_4CAD0();
      type metadata accessor for CFString(0);
      sub_10E04();
      sub_4BAC0();
      uint64_t result = sub_4CAF0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_FAEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4890(&qword_67258);
  uint64_t v6 = sub_4C9F0();
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10DF4((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10D3C(v25, (uint64_t)&v38);
      sub_10D98(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_4C8A0(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10DF4(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_FE04()
{
  uint64_t v1 = v0;
  sub_4890(&qword_67248);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4C9E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v30 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v30 >= v13) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v30);
    ++v9;
    if (!v31)
    {
      int64_t v9 = v30 + 1;
      if (v30 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v31 = *(void *)(v6 + 8 * v9);
      if (!v31) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v31 - 1) & v31;
    unint64_t v15 = __clz(__rbit64(v31)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 104 * v15;
    char v17 = *(unsigned char *)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = *(void *)(v16 + 16);
    uint64_t v20 = *(void *)(v16 + 24);
    uint64_t v21 = *(void *)(v16 + 32);
    uint64_t v22 = *(void *)(v16 + 40);
    uint64_t v23 = *(void *)(v16 + 48);
    uint64_t v24 = *(void *)(v16 + 56);
    unint64_t v25 = *(void *)(v16 + 64);
    uint64_t v26 = *(void *)(v16 + 72);
    uint64_t v27 = *(void *)(v16 + 80);
    uint64_t v28 = *(void *)(v16 + 88);
    LOWORD(v16) = *(_WORD *)(v16 + 96);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v29 = *(void *)(v4 + 56) + 104 * v15;
    *(unsigned char *)uint64_t v29 = v17;
    *(void *)(v29 + 8) = v18;
    *(void *)(v29 + 16) = v19;
    *(void *)(v29 + 24) = v20;
    *(void *)(v29 + 32) = v21;
    *(void *)(v29 + 40) = v22;
    *(void *)(v29 + 48) = v23;
    *(void *)(v29 + 56) = v24;
    *(void *)(v29 + 64) = v25;
    *(void *)(v29 + 72) = v26;
    *(void *)(v29 + 80) = v27;
    *(void *)(v29 + 88) = v28;
    *(_WORD *)(v29 + 96) = v16;
    uint64_t result = (void *)sub_87DC(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v16);
  }
  int64_t v32 = v30 + 2;
  if (v32 >= v13) {
    goto LABEL_26;
  }
  unint64_t v31 = *(void *)(v6 + 8 * v32);
  if (v31)
  {
    int64_t v9 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v9);
    ++v32;
    if (v31) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000()
{
  sub_4890(&qword_67240);
  uint64_t v29 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_4C9E0();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v29 = v3;
    return result;
  }
  uint64_t result = (void *)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5) {
    uint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  }
  uint64_t v30 = v1 + 64;
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v11) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v30 + 8 * v26);
    ++v7;
    if (!v27)
    {
      int64_t v7 = v26 + 1;
      if (v26 + 1 >= v11) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v30 + 8 * v7);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v10 = (v27 - 1) & v27;
    unint64_t v13 = __clz(__rbit64(v27)) + (v7 << 6);
LABEL_12:
    uint64_t v14 = *(void *)(v1 + 56) + 80 * v13;
    char v15 = *(unsigned char *)v14;
    uint64_t v16 = *(void *)(v14 + 8);
    uint64_t v17 = *(void *)(v14 + 16);
    uint64_t v18 = *(void *)(v14 + 24);
    uint64_t v19 = *(void *)(v14 + 32);
    uint64_t v20 = *(void *)(v14 + 40);
    uint64_t v21 = *(void *)(v14 + 48);
    uint64_t v22 = *(void *)(v14 + 56);
    uint64_t v23 = *(void *)(v14 + 64);
    uint64_t v24 = *(void *)(v14 + 72);
    *(unsigned char *)(*(void *)(v3 + 48) + v13) = *(unsigned char *)(*(void *)(v1 + 48) + v13);
    uint64_t v25 = *(void *)(v3 + 56) + 80 * v13;
    *(unsigned char *)uint64_t v25 = v15;
    *(void *)(v25 + 8) = v16;
    *(void *)(v25 + 16) = v17;
    *(void *)(v25 + 24) = v18;
    *(void *)(v25 + 32) = v19;
    *(void *)(v25 + 40) = v20;
    *(void *)(v25 + 48) = v21;
    *(void *)(v25 + 56) = v22;
    *(void *)(v25 + 64) = v23;
    *(void *)(v25 + 72) = v24;
    sub_98F4(v16, v17, v18, v19);
    sub_98F4(v20, v21, v22, v23);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v11) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v30 + 8 * v28);
  if (v27)
  {
    int64_t v7 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v7 >= v11) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v30 + 8 * v7);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10214()
{
  uint64_t v1 = v0;
  sub_4890(&qword_67250);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4C9E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_103CC()
{
  uint64_t v1 = v0;
  sub_4890(&qword_67260);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4C9E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10578()
{
  uint64_t v1 = v0;
  sub_4890(&qword_67258);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4C9E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10D3C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_10D98(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10DF4(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10760(uint64_t a1)
{
  uint64_t v69 = *(void *)(a1 + 16);
  if (v69)
  {
    uint64_t v68 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v1 = 0;
    uint64_t v2 = _swiftEmptyDictionarySingleton;
    while (1)
    {
      uint64_t v89 = v2;
      uint64_t v73 = v1;
      uint64_t v6 = (void *)(v68 + 80 * v1);
      uint64_t v7 = *(unsigned __int8 *)v6;
      uint64_t v8 = v6[1];
      uint64_t v9 = v6[2];
      uint64_t v11 = v6[3];
      uint64_t v10 = v6[4];
      uint64_t v4 = v6[5];
      uint64_t v5 = v6[6];
      uint64_t v13 = v6[7];
      uint64_t v12 = v6[8];
      uint64_t v14 = v6[9];
      sub_98F4(v8, v9, v11, v10);
      sub_98F4(v4, v5, v13, v12);
      swift_bridgeObjectRetain();
      uint64_t v76 = v9;
      uint64_t v77 = v8;
      uint64_t v74 = v10;
      uint64_t v75 = v11;
      sub_98F4(v8, v9, v11, v10);
      uint64_t v78 = v12;
      sub_98F4(v4, v5, v13, v12);
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v17 = sub_1F304(v7);
      uint64_t v18 = _swiftEmptyDictionarySingleton[2];
      BOOL v19 = (v16 & 1) == 0;
      uint64_t v20 = v18 + v19;
      if (__OFADD__(v18, v19)) {
        break;
      }
      char v21 = v16;
      if (_swiftEmptyDictionarySingleton[3] >= v20)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_10000();
        }
      }
      else
      {
        sub_F140(v20, isUniquelyReferenced_nonNull_native);
        uint64_t v22 = sub_1F304(v7);
        if ((v21 & 1) != (v23 & 1)) {
          goto LABEL_35;
        }
        unint64_t v17 = v22;
      }
      uint64_t v71 = v5;
      uint64_t v72 = v13;
      if (v21)
      {
        uint64_t v24 = _swiftEmptyDictionarySingleton[7] + 80 * v17;
        uint64_t v25 = *(void *)(v24 + 40);
        uint64_t v26 = *(void *)(v24 + 48);
        uint64_t v27 = *(void *)(v24 + 56);
        uint64_t v28 = *(void *)(v24 + 64);
        sub_9938(*(void *)(v24 + 8), *(void *)(v24 + 16), *(void *)(v24 + 24), *(void *)(v24 + 32));
        sub_9938(v25, v26, v27, v28);
        swift_bridgeObjectRelease();
        *(unsigned char *)uint64_t v24 = v7;
        *(void *)(v24 + 8) = v77;
        *(void *)(v24 + 16) = v76;
        *(void *)(v24 + 24) = v75;
        *(void *)(v24 + 32) = v10;
        *(void *)(v24 + 40) = v4;
        *(void *)(v24 + 48) = v5;
        *(void *)(v24 + 56) = v72;
        *(void *)(v24 + 64) = v78;
        *(void *)(v24 + 72) = v14;
      }
      else
      {
        _swiftEmptyDictionarySingleton[(v17 >> 6) + 8] |= 1 << v17;
        *(unsigned char *)(_swiftEmptyDictionarySingleton[6] + v17) = v7;
        uint64_t v29 = _swiftEmptyDictionarySingleton[7] + 80 * v17;
        *(unsigned char *)uint64_t v29 = v7;
        *(void *)(v29 + 8) = v77;
        *(void *)(v29 + 16) = v76;
        *(void *)(v29 + 24) = v75;
        *(void *)(v29 + 32) = v10;
        *(void *)(v29 + 40) = v4;
        *(void *)(v29 + 48) = v5;
        *(void *)(v29 + 56) = v13;
        *(void *)(v29 + 64) = v12;
        *(void *)(v29 + 72) = v14;
        uint64_t v30 = _swiftEmptyDictionarySingleton[2];
        BOOL v31 = __OFADD__(v30, 1);
        uint64_t v32 = v30 + 1;
        if (v31) {
          goto LABEL_33;
        }
        _swiftEmptyDictionarySingleton[2] = v32;
      }
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void *)(v14 + 16);
      uint64_t v2 = v89;
      uint64_t v3 = v73;
      if (v33)
      {
        uint64_t v70 = v4;
        swift_bridgeObjectRetain();
        uint64_t v34 = (uint64_t *)(v14 + 64);
        while (1)
        {
          uint64_t v79 = v33;
          unsigned int v88 = *((unsigned __int8 *)v34 - 32);
          uint64_t v45 = *(v34 - 2);
          uint64_t v87 = *(v34 - 3);
          uint64_t v47 = *(v34 - 1);
          uint64_t v46 = *v34;
          uint64_t v48 = v34[1];
          uint64_t v49 = v34[3];
          unint64_t v91 = v34[4];
          uint64_t v92 = v34[2];
          uint64_t v51 = v34[5];
          uint64_t v50 = v34[6];
          uint64_t v52 = v34[7];
          __int16 v53 = *((_WORD *)v34 + 32);
          sub_87DC(v87, v45, v47, *v34, v48, v92, v49, v91, v51, v50, v52, v53);
          __int16 v80 = v53;
          uint64_t v81 = v52;
          uint64_t v82 = v50;
          uint64_t v83 = v51;
          uint64_t v85 = v47;
          uint64_t v86 = v45;
          char v90 = v46;
          uint64_t v84 = v49;
          sub_87DC(v87, v45, v47, v46, v48, v92, v49, v91, v51, v50, v52, v53);
          char v54 = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v56 = sub_1F304(v88);
          uint64_t v57 = v89[2];
          BOOL v58 = (v55 & 1) == 0;
          uint64_t v59 = v57 + v58;
          if (__OFADD__(v57, v58)) {
            break;
          }
          char v60 = v55;
          if (v89[3] >= v59)
          {
            if ((v54 & 1) == 0) {
              sub_FE04();
            }
          }
          else
          {
            sub_ED80(v59, v54);
            uint64_t v61 = sub_1F304(v88);
            if ((v60 & 1) != (v62 & 1)) {
              goto LABEL_34;
            }
            unint64_t v56 = v61;
          }
          if (v60)
          {
            uint64_t v35 = v89[7] + 104 * v56;
            sub_8998(*(void *)(v35 + 8), *(void *)(v35 + 16), *(void *)(v35 + 24), *(void *)(v35 + 32), *(void *)(v35 + 40), *(void *)(v35 + 48), *(void *)(v35 + 56), *(void *)(v35 + 64), *(void *)(v35 + 72), *(void *)(v35 + 80), *(void *)(v35 + 88), *(_WORD *)(v35 + 96));
            *(unsigned char *)uint64_t v35 = v88;
            uint64_t v37 = v85;
            uint64_t v36 = v86;
            *(void *)(v35 + 8) = v87;
            *(void *)(v35 + 16) = v86;
            *(void *)(v35 + 24) = v85;
            *(void *)(v35 + 32) = v46;
            uint64_t v39 = v49;
            uint64_t v38 = v48;
            *(void *)(v35 + 40) = v48;
            *(void *)(v35 + 48) = v92;
            *(void *)(v35 + 56) = v49;
            *(void *)(v35 + 64) = v91;
            uint64_t v40 = v82;
            *(void *)(v35 + 72) = v51;
            *(void *)(v35 + 80) = v82;
            uint64_t v41 = v87;
            uint64_t v42 = v81;
            *(void *)(v35 + 88) = v81;
            char v43 = v80;
            *(_WORD *)(v35 + 96) = v80;
            uint64_t v44 = v83;
          }
          else
          {
            v89[(v56 >> 6) + 8] |= 1 << v56;
            *(unsigned char *)(v89[6] + v56) = v88;
            uint64_t v63 = v89[7] + 104 * v56;
            *(unsigned char *)uint64_t v63 = v88;
            uint64_t v41 = v87;
            uint64_t v37 = v85;
            uint64_t v36 = v86;
            *(void *)(v63 + 8) = v87;
            *(void *)(v63 + 16) = v86;
            *(void *)(v63 + 24) = v85;
            *(void *)(v63 + 32) = v46;
            uint64_t v39 = v84;
            uint64_t v38 = v48;
            *(void *)(v63 + 40) = v48;
            *(void *)(v63 + 48) = v92;
            *(void *)(v63 + 56) = v84;
            *(void *)(v63 + 64) = v91;
            uint64_t v40 = v82;
            uint64_t v44 = v51;
            *(void *)(v63 + 72) = v51;
            *(void *)(v63 + 80) = v82;
            uint64_t v42 = v81;
            *(void *)(v63 + 88) = v81;
            char v43 = v80;
            *(_WORD *)(v63 + 96) = v80;
            uint64_t v64 = v89[2];
            BOOL v31 = __OFADD__(v64, 1);
            uint64_t v65 = v64 + 1;
            if (v31) {
              goto LABEL_31;
            }
            v89[2] = v65;
          }
          v34 += 13;
          swift_bridgeObjectRelease();
          sub_8998(v41, v36, v37, v90, v38, v92, v39, v91, v44, v40, v42, v43);
          uint64_t v33 = v79 - 1;
          if (v79 == 1)
          {
            swift_bridgeObjectRelease();
            uint64_t v3 = v73;
            uint64_t v4 = v70;
            uint64_t v5 = v71;
            uint64_t v2 = v89;
            goto LABEL_4;
          }
        }
        __break(1u);
LABEL_31:
        __break(1u);
        break;
      }
LABEL_4:
      uint64_t v1 = v3 + 1;
      sub_9938(v77, v76, v75, v74);
      sub_9938(v4, v5, v72, v78);
      swift_bridgeObjectRelease();
      if (v1 == v69) {
        return a1;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    sub_4CA80();
    __break(1u);
LABEL_35:
    uint64_t result = sub_4CA80();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  return result;
}

uint64_t sub_10D3C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10D98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10DF4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10E04()
{
  unint64_t result = qword_67268;
  if (!qword_67268)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67268);
  }
  return result;
}

uint64_t *sub_10E5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = sub_4BB80();
    }
    else {
      uint64_t v6 = sub_4BB60();
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10F8C(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = sub_4BB80();
  }
  else {
    uint64_t v2 = sub_4BB60();
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_11008(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_4BB80();
  }
  else {
    uint64_t v4 = sub_4BB60();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_110B4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_11170(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_4BB80();
    }
    else {
      uint64_t v4 = sub_4BB60();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_11170(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for PrivacyAndSecuritySettingsDestinationOption()
{
  uint64_t result = qword_672E0;
  if (!qword_672E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_11218(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v4 = sub_4BB80();
  }
  else {
    uint64_t v4 = sub_4BB60();
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_112C4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_11170(a1);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v4 = sub_4BB80();
    }
    else {
      uint64_t v4 = sub_4BB60();
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_11380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_113A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_113D4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_113E4()
{
  uint64_t result = sub_4BB60();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_4BB80();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_114A8@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 1:
      sub_1222C(0, &qword_673F8);
      char v3 = 1;
      goto LABEL_44;
    case 2:
      sub_1222C(0, &qword_673E8);
      char v3 = 2;
      goto LABEL_44;
    case 3:
      sub_1222C(0, &qword_673E0);
      char v3 = 3;
      goto LABEL_44;
    case 4:
      sub_1222C(0, &qword_673D8);
      char v3 = 4;
      goto LABEL_44;
    case 5:
      sub_6CC4(5);
      uint64_t v24 = sub_4C790();
      __chkstk_darwin(v24 - 8, v25);
      sub_4C780();
      goto LABEL_49;
    case 6:
      sub_1222C(0, &qword_673B8);
      char v3 = 6;
      goto LABEL_44;
    case 7:
      sub_1222C(0, &qword_673D0);
      char v3 = 7;
      goto LABEL_44;
    case 8:
      sub_1222C(0, &qword_673B8);
      char v3 = 8;
      goto LABEL_44;
    case 9:
      sub_1222C(0, &qword_673F0);
      char v3 = 9;
      goto LABEL_44;
    case 10:
      sub_1222C(0, &qword_673B8);
      char v3 = 10;
      goto LABEL_44;
    case 11:
      sub_1222C(0, &qword_673B8);
      char v3 = 11;
      goto LABEL_44;
    case 12:
      sub_6CC4(12);
      uint64_t v20 = sub_4C790();
      __chkstk_darwin(v20 - 8, v21);
      sub_4C770();
      goto LABEL_49;
    case 13:
      sub_1222C(0, &qword_673B8);
      char v3 = 13;
      goto LABEL_44;
    case 14:
      sub_6CC4(14);
      uint64_t v16 = sub_4C790();
      __chkstk_darwin(v16 - 8, v17);
      sub_4C770();
      goto LABEL_49;
    case 15:
      sub_1222C(0, &qword_673B8);
      char v3 = 15;
      goto LABEL_44;
    case 16:
      uint64_t v9 = type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
      __chkstk_darwin(v9, v10);
      uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (!MOSettingsManager) {
        goto LABEL_56;
      }
      uint64_t v13 = (NSString *)sub_4C4D0();
      Class v14 = NSClassFromString(v13);

      if (!v14) {
        goto LABEL_54;
      }
      swift_getObjCClassMetadata();
      v30[0] = &OBJC_PROTOCOL___PSController;
      swift_dynamicCastTypeToObjCProtocolUnconditional();
      sub_1222C(0, &qword_67390);
      if (!swift_dynamicCastMetatype()) {
        goto LABEL_55;
      }
      sub_6CC4(16);
      sub_4BB40();
      swift_storeEnumTagMultiPayload();
      return sub_121C8((uint64_t)v12, a2);
    case 17:
      sub_1222C(0, &qword_673C8);
      char v3 = 17;
      goto LABEL_44;
    case 18:
      sub_1222C(0, &qword_673B8);
      char v3 = 18;
      goto LABEL_44;
    case 19:
      sub_1222C(0, &qword_673C0);
      char v3 = 19;
      goto LABEL_44;
    case 20:
      sub_1222C(0, &qword_673B8);
      char v3 = 20;
      goto LABEL_44;
    case 21:
      sub_1222C(0, &qword_673B8);
      char v3 = 21;
      goto LABEL_44;
    case 22:
      sub_6CC4(22);
      uint64_t v26 = sub_4C790();
      __chkstk_darwin(v26 - 8, v27);
      sub_4C780();
      goto LABEL_49;
    case 23:
      sub_1222C(0, &qword_673B8);
      char v3 = 23;
      goto LABEL_44;
    case 24:
      sub_1222C(0, &qword_673B8);
      char v3 = 24;
      goto LABEL_44;
    case 25:
      sub_6CC4(25);
      uint64_t v22 = sub_4C790();
      __chkstk_darwin(v22 - 8, v23);
      sub_4C780();
      goto LABEL_49;
    case 26:
      sub_6CC4(26);
      uint64_t v28 = sub_4C790();
      __chkstk_darwin(v28 - 8, v29);
      sub_4C770();
      goto LABEL_49;
    case 27:
      sub_6CC4(27);
      id v4 = [self classForNudityDetectionSettings];
      sub_4C500();

      uint64_t v5 = sub_4C790();
      __chkstk_darwin(v5 - 8, v6);
      sub_4C770();
      sub_4BB50();
      goto LABEL_50;
    case 28:
      sub_1222C(0, &qword_673B0);
      char v3 = 28;
      goto LABEL_44;
    case 29:
      sub_1222C(0, &qword_673A8);
      char v3 = 29;
      goto LABEL_44;
    case 30:
      sub_1222C(0, &qword_673A0);
      char v3 = 30;
      goto LABEL_44;
    case 31:
      type metadata accessor for AppleIntelligenceReportView();
      sub_12170();
      sub_4BB70();
      type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
      goto LABEL_45;
    case 32:
      sub_1222C(0, &qword_67320);
      char v3 = 32;
      goto LABEL_44;
    case 33:
      sub_6CC4(33);
      uint64_t v18 = sub_4C790();
      __chkstk_darwin(v18 - 8, v19);
      sub_4C770();
LABEL_49:
      sub_4BB50();
      goto LABEL_50;
    case 34:
      uint64_t v7 = (NSString *)sub_4C4D0();
      Class v8 = NSClassFromString(v7);

      if (!v8)
      {
        __break(1u);
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        sub_4C9C0();
        __break(1u);
        JUMPOUT(0x12024);
      }
      swift_getObjCClassMetadata();
      v30[1] = &OBJC_PROTOCOL___PSController;
      swift_dynamicCastTypeToObjCProtocolUnconditional();
      sub_1222C(0, &qword_67390);
      if (!swift_dynamicCastMetatype()) {
        goto LABEL_53;
      }
      sub_6CC4(34);
      sub_4BB40();
LABEL_50:
      type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
      return swift_storeEnumTagMultiPayload();
    case 35:
      sub_1222C(0, &qword_67328);
      char v3 = 35;
      goto LABEL_44;
    default:
      sub_1222C(0, &qword_67400);
      char v3 = 0;
LABEL_44:
      sub_6CC4(v3);
      sub_4BB40();
      type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
LABEL_45:
      return swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_120B4@<X0>(void *a1@<X8>)
{
  type metadata accessor for AppleIntelligenceReportViewModel();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  *(unsigned char *)(v2 + 24) = 0;
  sub_4BA50();
  sub_4C2A0();
  *a1 = v5;
  a1[1] = v6;
  char v3 = (void *)((char *)a1 + *(int *)(type metadata accessor for AppleIntelligenceReportView() + 20));
  *char v3 = swift_getKeyPath();
  sub_4890(&qword_67408);
  return swift_storeEnumTagMultiPayload();
}

unint64_t sub_12170()
{
  unint64_t result = qword_67398;
  if (!qword_67398)
  {
    type metadata accessor for AppleIntelligenceReportView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67398);
  }
  return result;
}

uint64_t sub_121C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1222C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_12268()
{
  return sub_4BF00();
}

Swift::Int sub_1228C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_14FAC(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_138D8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_122F8(uint64_t result)
{
  uint64_t v2 = result;
  uint64_t v3 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessCount;
  if (*(void *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessCount) != result)
  {
    sub_78AC((void *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_invalidator), *(void *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_invalidator + 24));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v4._countAndFlagsBits = sub_7144(*(unsigned char *)(v1
                                              + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_id));
    sub_4C570(v4);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    Swift::Int result = swift_release();
  }
  *(void *)(v1 + v3) = v2;
  return result;
}

unint64_t sub_12400(void *a1, char *a2)
{
  unint64_t result = (unint64_t)[a1 eventType];
  if (result <= 0x2A && ((1 << result) & 0x60000000400) != 0)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_3B0B4((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v6 = *(void **)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session];
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a2;
    *(void *)(v7 + 24) = v5;
    v10[4] = sub_13784;
    v10[5] = v7;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_13110;
    v10[3] = &unk_5E788;
    Class v8 = _Block_copy(v10);
    uint64_t v9 = a2;
    swift_retain();
    swift_release();
    [v6 getDevicesWithFlags:8 completionHandler:v8];
    _Block_release(v8);
    return swift_release();
  }
  return result;
}

id sub_12550()
{
  ObjectType = (objc_class *)swift_getObjectType();
  [*(id *)&v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session] invalidate];
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_12678(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v5 = result;
    sub_1222C(0, (unint64_t *)&qword_67540);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_4C710();
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = v6;
    v7[3] = v5;
    v7[4] = a4;
    aBlock[4] = sub_13824;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_130CC;
    aBlock[3] = &unk_5E800;
    Class v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v9 = sub_4C3E0();
    uint64_t v20 = (uint64_t)&v20;
    uint64_t v10 = *(void *)(v9 - 8);
    __chkstk_darwin(v9, v11);
    uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4C3C0();
    uint64_t v14 = sub_4C3A0();
    uint64_t v15 = *(void *)(v14 - 8);
    __chkstk_darwin(v14, v16);
    uint64_t v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_13830();
    sub_4890(&qword_67550);
    sub_1387C();
    sub_4C850();
    uint64_t v19 = (void *)v21;
    sub_4C720();
    _Block_release(v8);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  return result;
}

void sub_12960(uint64_t a1, unint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v46 = (char *)Strong;
    if (a2 >> 62) {
      goto LABEL_60;
    }
    uint64_t v6 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    uint64_t v7 = (unint64_t *)(a3 + 16);
    if (!v6)
    {
LABEL_61:
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v45 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessoriesAccessMap;
      *(void *)&v46[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessoriesAccessMap] = *v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_122F8(*(void *)(*(void *)&v46[v45] + 16));

      return;
    }
LABEL_4:
    unint64_t v8 = 0;
    __int16 v53 = v7;
    unint64_t v50 = a2;
    unint64_t v51 = a2 & 0xC000000000000001;
    unint64_t v47 = a2 + 32;
    uint64_t v48 = a2 & 0xFFFFFFFFFFFFFF8;
    uint64_t v49 = v6;
    while (1)
    {
      while (1)
      {
        if (v51)
        {
          id v9 = (id)sub_4C920();
        }
        else
        {
          if (v8 >= *(void *)(v48 + 16)) {
            goto LABEL_59;
          }
          id v9 = *(id *)(v47 + 8 * v8);
        }
        uint64_t v10 = v9;
        BOOL v11 = __OFADD__(v8++, 1);
        if (v11) {
          goto LABEL_56;
        }
        id v12 = [v9 appAccessInfoMap];
        if (v12) {
          break;
        }

        if (v8 == v6) {
          goto LABEL_61;
        }
      }
      uint64_t v13 = v12;
      char v54 = v10;
      sub_1222C(0, &qword_67560);
      uint64_t v14 = sub_4C450();

      a3 = *(void *)(v14 + 16);
      unint64_t v52 = v8;
      if (a3)
      {
        sub_4890(&qword_67568);
        uint64_t v15 = (void *)swift_allocObject();
        int64_t v16 = j__malloc_size(v15);
        uint64_t v17 = v16 - 32;
        if (v16 < 32) {
          uint64_t v17 = v16 - 17;
        }
        v15[2] = a3;
        v15[3] = 2 * (v17 >> 4);
        a2 = sub_14DA0((uint64_t)&v58, v15 + 4, a3, v14);
        swift_bridgeObjectRetain_n();
        sub_14FA0();
        if (a2 != a3) {
          goto LABEL_57;
        }
        swift_bridgeObjectRelease();
        uint64_t v7 = v53;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = _swiftEmptyArrayStorage;
      }
      BOOL v58 = v15;
      sub_1228C((uint64_t *)&v58);
      swift_bridgeObjectRelease();
      uint64_t v18 = v58;
      a2 = v58[2];
      if (a2) {
        break;
      }
LABEL_5:

      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v6 = v49;
      a2 = v50;
      unint64_t v8 = v52;
      if (v52 == v49) {
        goto LABEL_61;
      }
    }
    if (!*(void *)(v14 + 16)) {
      goto LABEL_58;
    }
    uint64_t v19 = v58[4];
    a3 = v58[5];
    swift_bridgeObjectRetain_n();
    unint64_t v20 = sub_1F370(v19, a3);
    if (v21)
    {
      uint64_t v22 = 0;
      uint64_t v23 = v18 + 7;
      char v55 = v18;
      unint64_t v56 = a2 - 1;
      while (1)
      {
        id v24 = *(id *)(*(void *)(v14 + 56) + 8 * v20);
        swift_bridgeObjectRelease();
        a2 = (unint64_t)[v24 state];

        if (a2 != 25) {
          goto LABEL_47;
        }
        swift_beginAccess();
        if (!*(void *)(*v7 + 16)) {
          goto LABEL_29;
        }
        swift_bridgeObjectRetain();
        sub_1F370(v19, a3);
        if ((v25 & 1) == 0) {
          break;
        }
        swift_endAccess();
        swift_bridgeObjectRelease();
LABEL_41:
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_12FF8(&v58, v19, a3);
        if (*v40)
        {
          uint64_t v42 = v40;
          id v43 = v54;
          sub_4C5B0();
          if (*(void *)((char *)&dword_10 + (*v42 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                          + (*v42 & 0xFFFFFFFFFFFFFF8)) >> 1)
            sub_4C5F0();
          sub_4C610();
          sub_4C5E0();
          ((void (*)(void **, void))v41)(&v58, 0);
          swift_endAccess();
          uint64_t v18 = v55;
        }
        else
        {
          ((void (*)(void **, void))v41)(&v58, 0);
          swift_endAccess();
        }
        swift_bridgeObjectRelease();
LABEL_47:
        swift_bridgeObjectRelease();
        if (v56 == v22) {
          goto LABEL_5;
        }
        if ((unint64_t)++v22 >= v18[2])
        {
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          swift_bridgeObjectRetain();
          uint64_t v6 = sub_4C9D0();
          uint64_t v7 = (unint64_t *)(a3 + 16);
          if (!v6) {
            goto LABEL_61;
          }
          goto LABEL_4;
        }
        if (!*(void *)(v14 + 16)) {
          goto LABEL_53;
        }
        uint64_t v19 = *(v23 - 1);
        a3 = *v23;
        swift_bridgeObjectRetain_n();
        unint64_t v20 = sub_1F370(v19, a3);
        v23 += 2;
        if ((v44 & 1) == 0) {
          goto LABEL_63;
        }
      }
      swift_bridgeObjectRelease();
LABEL_29:
      swift_endAccess();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v27 = *v7;
      unint64_t v57 = *v7;
      *uint64_t v7 = 0x8000000000000000;
      unint64_t v29 = sub_1F370(v19, a3);
      uint64_t v30 = *(void *)(v27 + 16);
      BOOL v31 = (v28 & 1) == 0;
      uint64_t v32 = v30 + v31;
      if (__OFADD__(v30, v31)) {
        goto LABEL_54;
      }
      char v33 = v28;
      if (*(void *)(v27 + 24) < v32)
      {
        sub_F4D0(v32, isUniquelyReferenced_nonNull_native);
        unint64_t v34 = sub_1F370(v19, a3);
        if ((v33 & 1) != (v35 & 1)) {
          goto LABEL_64;
        }
        unint64_t v29 = v34;
        a2 = v57;
        if ((v33 & 1) == 0) {
          goto LABEL_38;
        }
LABEL_36:
        uint64_t v36 = *(void *)(a2 + 56);
        swift_bridgeObjectRelease();
        *(void *)(v36 + 8 * v29) = _swiftEmptyArrayStorage;
LABEL_40:
        uint64_t v7 = v53;
        *__int16 v53 = a2;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        uint64_t v18 = v55;
        goto LABEL_41;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        a2 = v57;
        if (v28) {
          goto LABEL_36;
        }
      }
      else
      {
        sub_10214();
        a2 = v57;
        if (v33) {
          goto LABEL_36;
        }
      }
LABEL_38:
      *(void *)(a2 + 8 * (v29 >> 6) + 64) |= 1 << v29;
      uint64_t v37 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v29);
      *uint64_t v37 = v19;
      v37[1] = a3;
      *(void *)(*(void *)(a2 + 56) + 8 * v29) = _swiftEmptyArrayStorage;
      uint64_t v38 = *(void *)(a2 + 16);
      BOOL v11 = __OFADD__(v38, 1);
      uint64_t v39 = v38 + 1;
      if (v11) {
        goto LABEL_55;
      }
      *(void *)(a2 + 16) = v39;
      swift_bridgeObjectRetain();
      goto LABEL_40;
    }
LABEL_63:
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_64:
    sub_4CA80();
    __break(1u);
    swift_release();
    __break(1u);
  }
}

void (*sub_12FF8(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_14868(v6, a2, a3);
  return sub_13078;
}

void sub_13078(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t sub_130CC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_13110(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1222C(0, &qword_67538);
    uint64_t v4 = sub_4C5D0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_131B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  sub_4BFE0();
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_4BFD0(v30);
  v28[1] = *(void *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessCount);
  uint64_t v6 = sub_4890(&qword_67520);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_4BA20();
  __chkstk_darwin(v11 - 8, v12);
  sub_4BA00();
  sub_1358C();
  sub_4B8E0();
  sub_135E0();
  sub_4C840();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_4BFC0(v29);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_4BFD0(v31);
  sub_4C010();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_6B268;
  uint64_t v14 = sub_4C160();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19 & 1;
  uint64_t v21 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_id);
  uint64_t v22 = sub_4B980();
  __chkstk_darwin(v22 - 8, v23);
  sub_51D0(v21);
  uint64_t result = sub_4C180();
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v21;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 32) = v25 & 1;
  *(void *)(a1 + 40) = v27;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v16;
  *(void *)(a1 + 64) = v20 | 0x4000000000000000;
  *(void *)(a1 + 72) = v18;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 511;
  return result;
}

uint64_t type metadata accessor for AccessoriesListItemProvider()
{
  return self;
}

uint64_t sub_1354C@<X0>(uint64_t a1@<X8>)
{
  sub_131B4((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

unint64_t sub_1358C()
{
  unint64_t result = qword_67528;
  if (!qword_67528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67528);
  }
  return result;
}

unint64_t sub_135E0()
{
  unint64_t result = qword_67530;
  if (!qword_67530)
  {
    sub_4950(&qword_67520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67530);
  }
  return result;
}

uint64_t sub_13630()
{
  return 1;
}

Swift::Int sub_13638()
{
  return sub_4CAF0();
}

void sub_1367C()
{
}

Swift::Int sub_136A4()
{
  return sub_4CAF0();
}

const char *sub_136E4()
{
  return "DeviceAccess";
}

const char *sub_136F8()
{
  return "AccessorySetupKit";
}

uint64_t sub_1370C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_13744()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_13784(uint64_t a1, uint64_t a2)
{
  return sub_12678(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_1378C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1379C()
{
  return swift_release();
}

uint64_t sub_137A4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_137DC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_13824()
{
  sub_12960(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

unint64_t sub_13830()
{
  unint64_t result = qword_67548;
  if (!qword_67548)
  {
    sub_4C3A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67548);
  }
  return result;
}

unint64_t sub_1387C()
{
  unint64_t result = qword_67558;
  if (!qword_67558)
  {
    sub_4950(&qword_67550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67558);
  }
  return result;
}

Swift::Int sub_138D8(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_4CA30(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_13FC4(0, v3, 1, a1);
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
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      unint64_t v94 = v11;
      char v104 = v8;
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
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_14094((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_145B8((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          unint64_t v100 = &v97[16 * v96 + 32];
          *(void *)unint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          unint64_t v94 = v97;
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
    char v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_4C600();
    *(void *)(v7 + 16) = v6;
    char v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
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
      int v19 = sub_4CA60();
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
      else if ((v19 ^ sub_4CA60()))
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
      uint64_t v11 = sub_14330(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_14330((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    id v43 = &v11[16 * v41 + 32];
    *(void *)id v43 = v13;
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
          unint64_t v57 = &v42[16 * v12 - 32];
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
            uint64_t v79 = &v42[16 * v44];
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
        char v62 = &v42[16 * v12 - 32];
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
        uint64_t v75 = &v42[16 * v44];
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
        unsigned int v88 = v42;
        unint64_t v89 = v44;
        char v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_14094((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
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
        uint64_t v42 = v88;
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
      char v33 = (void *)(v10 + 16 * v9);
      do
      {
        unint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_4CA60() & 1) == 0) {
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
  Swift::Int result = sub_4C9B0();
  __break(1u);
  return result;
}

uint64_t sub_13FC4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
      if (v13 || (Swift::Int result = sub_4CA60(), (result & 1) == 0))
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

uint64_t sub_14094(char *__src, char *a2, unint64_t a3, char *__dst)
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
          if (v23 || (sub_4CA60() & 1) == 0)
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
        if (v15 || (sub_4CA60() & 1) == 0)
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
    sub_144FC((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

char *sub_14330(char *result, int64_t a2, char a3, char *a4)
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
    sub_4890(&qword_67570);
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

char *sub_1442C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -104)
  {
    uint64_t result = (char *)sub_4CA10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 104 * (v4 / 104);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

char *sub_144FC(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_4CA10();
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

char *sub_145B8(uint64_t a1)
{
  return sub_14330(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_145CC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_4C860();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_4CAD0();
        swift_bridgeObjectRetain();
        sub_4C560();
        Swift::Int v9 = sub_4CAF0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          BOOL v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *BOOL v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_147A4(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v4 = 8 * result;
  *(void *)(a4[6] + v4) = a2;
  *(void *)(a4[7] + v4) = a3;
  uint64_t v5 = a4[2];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6) {
    __break(1u);
  }
  else {
    a4[2] = v7;
  }
  return result;
}

_OWORD *sub_147EC(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_10DF4(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void (*sub_14868(void *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  long long v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_14B20(v6);
  v6[10] = sub_14988(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_14914;
}

void sub_14914(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);

  free(v1);
}

void (*sub_14988(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_1F370(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        void *v10 = v19;
        return sub_14AD0;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_10214();
      goto LABEL_7;
    }
    sub_F4D0(v16, a4 & 1);
    unint64_t v20 = sub_1F370(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **))sub_4CA80();
  __break(1u);
  return result;
}

void sub_14AD0(uint64_t **a1)
{
  uint64_t v1 = *a1;
  sub_14B5C(*a1, *((unsigned char *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t (*sub_14B20(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_14B50;
}

uint64_t sub_14B50(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t *sub_14B5C(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    BOOL v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      uint64_t v10 = (void *)(v9[6] + 16 * a4);
      void *v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_145CC(a4, *a3);
  }

  return (uint64_t *)swift_bridgeObjectRetain();
}

uint64_t sub_14C34(char a1, int64_t a2, char a3, char *a4)
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
    sub_4890(&qword_67568);
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
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_14DA0(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
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

uint64_t sub_14FA0()
{
  return swift_release();
}

uint64_t sub_14FAC(uint64_t a1)
{
  return sub_14C34(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t getEnumTagSinglePayload for AccessoriesFeatureFlags(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AccessoriesFeatureFlags(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x150B0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_150D8()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccessoriesFeatureFlags()
{
  return &type metadata for AccessoriesFeatureFlags;
}

unint64_t sub_150F4()
{
  unint64_t result = qword_67580;
  if (!qword_67580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67580);
  }
  return result;
}

uint64_t sub_15150(uint64_t result)
{
  uint64_t v2 = result;
  if (*(void *)(v1 + 24) != result)
  {
    sub_78AC((void *)(v1 + 40), *(void *)(v1 + 64));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = sub_7144(*(unsigned char *)(v1 + 16));
    sub_4C570(v3);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    unint64_t result = swift_release();
  }
  *(void *)(v1 + 24) = v2;
  return result;
}

uint64_t sub_15240()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v18 = v0;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_15BFC();
    uint64_t result = sub_4C680();
    uint64_t v1 = v20;
    uint64_t v3 = v21;
    uint64_t v4 = v22;
    uint64_t v5 = v23;
    unint64_t v6 = v24;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v3 = v1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
      uint64_t v13 = v5;
      goto LABEL_27;
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v14 >= v10) {
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    uint64_t v13 = v5 + 1;
    if (!v15)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        goto LABEL_30;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v13);
      if (!v15)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          goto LABEL_30;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v13);
        if (!v15)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            goto LABEL_30;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v13);
          if (!v15)
          {
            uint64_t v16 = v5 + 5;
            while (v10 != v16)
            {
              unint64_t v15 = *(void *)(v3 + 8 * v16++);
              if (v15)
              {
                uint64_t v13 = v16 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *(void *)(v18 + 32) = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            sub_78F0(v18 + 40);
            return v18;
          }
        }
      }
    }
LABEL_26:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_27:
    uint64_t v17 = *(void *)(*(void *)(v1 + 48) + 8 * v12);
    swift_retain();
    if (!v17) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      uint64_t result = swift_release();
      uint64_t v5 = v13;
      unint64_t v6 = v11;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v13 = v5;
        uint64_t v11 = v6;
        if (v19) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_154CC()
{
  sub_15240();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CriticalMessagesListItemProvider()
{
  return self;
}

uint64_t sub_15524@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  sub_4BFE0();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_4BFD0(v36);
  uint64_t v34 = *(void *)(v1 + 24);
  uint64_t v6 = sub_4890(&qword_67520);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  int64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_4BA20();
  __chkstk_darwin(v11 - 8, v12);
  sub_4BA00();
  sub_1358C();
  sub_4B8E0();
  sub_135E0();
  sub_4C840();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_4BFC0(v35);
  swift_bridgeObjectRelease();
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  sub_4BFD0(v37);
  sub_4C010();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_6B268;
  uint64_t v14 = sub_4C160();
  uint64_t v32 = v15;
  uint64_t v33 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18 & 1;
  uint64_t v20 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v21 = sub_4B980();
  __chkstk_darwin(v21 - 8, v22);
  sub_51D0(v20);
  uint64_t v23 = sub_4C180();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28 & 1;
  uint64_t result = sub_15874(v2);
  *(void *)a1 = v20;
  *(void *)(a1 + 8) = v20;
  *(void *)(a1 + 16) = v23;
  *(void *)(a1 + 24) = v25;
  *(void *)(a1 + 32) = v29;
  *(void *)(a1 + 40) = v27;
  uint64_t v31 = v32;
  *(void *)(a1 + 48) = v33;
  *(void *)(a1 + 56) = v31;
  *(void *)(a1 + 64) = v19 | 0x4000000000000000;
  *(void *)(a1 + 72) = v17;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 511;
  return result;
}

uint64_t sub_15874(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(a1 + 32);
  if ((v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_4C880();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      return result;
    }
  }
  else if (*(void *)(v3 + 16))
  {
    return result;
  }
  uint64_t v5 = sub_4C750();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v10 = [self defaultCenter];
  if (qword_66E98 != -1) {
    swift_once();
  }
  sub_4C760();

  swift_allocObject();
  swift_weakInit();
  sub_15BB0();
  sub_4BD60();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_15A9C@<X0>(uint64_t a1@<X8>)
{
  sub_15524((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

uint64_t sub_15ADC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_15B14()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v1 = [self numberOfAppsUsingBackgroundMessaging];
    uint64_t v2 = sub_4C690();

    sub_15150(v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_15BA8()
{
  return sub_15B14();
}

unint64_t sub_15BB0()
{
  unint64_t result = qword_67640;
  if (!qword_67640)
  {
    sub_4C750();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67640);
  }
  return result;
}

unint64_t sub_15BFC()
{
  unint64_t result = qword_67770;
  if (!qword_67770)
  {
    sub_4BCA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67770);
  }
  return result;
}

uint64_t sub_15C54(uint64_t result, uint64_t a2)
{
  if (*(void *)(v2
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString) != result
    || *(void *)(v2
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString
                 + 8) != a2)
  {
    unint64_t result = sub_4CA60();
    if ((result & 1) == 0)
    {
      sub_78AC((void *)(v2 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_invalidator), *(void *)(v2+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_invalidator+ 24));
      sub_4C900(16);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = sub_7144(*(unsigned char *)(v2
                                                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_id));
      sub_4C570(v4);
      swift_bridgeObjectRelease();
      swift_retain();
      sub_4BCC0();
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_15D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_15D80, 0, 0);
}

uint64_t sub_15D80()
{
  sub_4C640();
  *(void *)(v0 + 24) = sub_4C630();
  uint64_t v2 = sub_4C620();
  return _swift_task_switch(sub_15E14, v2, v1);
}

uint64_t sub_15E14()
{
  swift_release();
  sub_15E78();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_15E78()
{
  uint64_t v1 = v0;
  id v2 = [self enumeratorWithOptions:128];
  id v3 = [v2 nextObject];
  if (v3)
  {
    id v4 = v3;
    do
    {
      id v5 = [v4 bundleIdentifier];
      if (v5)
      {
        uint64_t v6 = v5;
        sub_4C500();

        Swift::Int v7 = sub_4C540();
        Swift::Int v9 = v8;
        swift_bridgeObjectRelease();
        swift_beginAccess();
        sub_22440(&v14, v7, v9);
        swift_endAccess();

        swift_bridgeObjectRelease();
      }
      else
      {
      }
      id v4 = [v2 nextObject];
    }
    while (v4);
  }
  id v10 = *(void **)&v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_accessManager];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  aBlock[4] = sub_186AC;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_16CC4;
  aBlock[3] = &unk_5EA10;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v1;
  swift_release();
  [v10 bundleIdentifiersWithAccessToAnyItemCompletionHandler:v12];
  _Block_release(v12);
}

uint64_t sub_16074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_4C670();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_4C660();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_17E28(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_4C620();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_16218()
{
  uint64_t ObjectType = swift_getObjectType();
  id v2 = &v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_cancellables];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v20 = (objc_class *)ObjectType;
  uint64_t v21 = v0;
  if ((*(void *)v2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_15BFC();
    id result = (id)sub_4C680();
    uint64_t v3 = v24;
    uint64_t v5 = v25;
    uint64_t v6 = v26;
    uint64_t v7 = v27;
    unint64_t v8 = v28;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    uint64_t v5 = v3 + 56;
    uint64_t v6 = ~v9;
    uint64_t v10 = -v9;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v8 = v11 & *(void *)(v3 + 56);
    id result = (id)swift_bridgeObjectRetain();
    uint64_t v7 = 0;
  }
  int64_t v12 = (unint64_t)(v6 + 64) >> 6;
  if (v3 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v8)
    {
      uint64_t v13 = (v8 - 1) & v8;
      unint64_t v14 = __clz(__rbit64(v8)) | (v7 << 6);
      uint64_t v15 = v7;
      goto LABEL_27;
    }
    int64_t v16 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (v16 >= v12) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    uint64_t v15 = v7 + 1;
    if (!v17)
    {
      uint64_t v15 = v7 + 2;
      if (v7 + 2 >= v12) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v5 + 8 * v15);
      if (!v17)
      {
        uint64_t v15 = v7 + 3;
        if (v7 + 3 >= v12) {
          goto LABEL_30;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v15);
        if (!v17)
        {
          uint64_t v15 = v7 + 4;
          if (v7 + 4 >= v12) {
            goto LABEL_30;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v15);
          if (!v17)
          {
            uint64_t v18 = v7 + 5;
            while (v12 != v18)
            {
              unint64_t v17 = *(void *)(v5 + 8 * v18++);
              if (v17)
              {
                uint64_t v15 = v18 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *(void *)id v2 = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            v23.receiver = v21;
            v23.super_class = v20;
            return objc_msgSendSuper2(&v23, "dealloc");
          }
        }
      }
    }
LABEL_26:
    uint64_t v13 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v15 << 6);
LABEL_27:
    uint64_t v19 = *(void *)(*(void *)(v3 + 48) + 8 * v14);
    swift_retain();
    if (!v19) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      id result = (id)swift_release();
      uint64_t v7 = v15;
      unint64_t v8 = v13;
      if ((v3 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v15 = v7;
        uint64_t v13 = v8;
        if (v22) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1658C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_4890(&qword_67720);
  __chkstk_darwin(v5 - 8, v6);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_4C670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_4C640();
  swift_bridgeObjectRetain();
  id v10 = a3;
  uint64_t v11 = sub_4C630();
  int64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = a1;
  v12[5] = v10;
  sub_16074((uint64_t)v8, (uint64_t)&unk_67730, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_166BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _OWORD v5[6] = a4;
  v5[7] = a5;
  sub_4C640();
  v5[8] = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_16754, v7, v6);
}

uint64_t sub_16754()
{
  uint64_t v1 = (void *)v0[6];
  swift_release();
  if (v1) {
    id v2 = v1;
  }
  else {
    id v2 = _swiftEmptyArrayStorage;
  }
  uint64_t v3 = v2[2];
  if (!v3)
  {
    swift_bridgeObjectRetain();
    goto LABEL_31;
  }
  Swift::String v37 = v0;
  uint64_t v4 = v0[7];
  uint64_t v5 = (uint64_t *)(v4
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_installedAppsBundleIdentifiers);
  uint64_t v6 = *(void *)(v4
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_documentsBundleID);
  uint64_t v7 = *(void *)(v4
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_documentsBundleID
                 + 8);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  unint64_t v8 = v2;
  uint64_t v9 = 0;
  id v10 = v8 + 5;
  while (1)
  {
    if (sub_4C540() != v6 || v11 != v7)
    {
      char v13 = sub_4CA60();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0) {
        break;
      }
    }
    swift_bridgeObjectRelease();
LABEL_7:
    v10 += 2;
    if (!--v3) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = *v5;
  uint64_t v15 = sub_4C540();
  uint64_t v17 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v18 = sub_16B8C(v15, v17, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_7;
  }
  if (!__OFADD__(v9++, 1)) {
    goto LABEL_7;
  }
  __break(1u);
LABEL_17:
  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v0 = v37;
    if (v9 == 1)
    {
      if (qword_66ED0 != -1) {
        swift_once();
      }
      uint64_t v20 = v37[7];
      uint64_t v21 = (void *)qword_6B268;
      v37[5] = 1;
      sub_4CA40();
      v39._countAndFlagsBits = 1886413088;
      v39._object = (void *)0xE400000000000000;
      sub_4C570(v39);
      uint64_t v22 = (void *)sub_4C4D0();
      swift_bridgeObjectRelease();
      id v23 = [v21 localizedStringForKey:v22 value:0 table:0];
    }
    else
    {
      if (qword_66ED0 != -1) {
        swift_once();
      }
      uint64_t v20 = v37[7];
      uint64_t v32 = (void *)qword_6B268;
      v37[5] = v9;
      sub_4CA40();
      v40._countAndFlagsBits = 0x7370706120;
      v40._object = (void *)0xE500000000000000;
      sub_4C570(v40);
      uint64_t v22 = (void *)sub_4C4D0();
      swift_bridgeObjectRelease();
      id v23 = [v32 localizedStringForKey:v22 value:0 table:0];
    }
    id v33 = v23;

    uint64_t v28 = sub_4C500();
    uint64_t v30 = v34;

    sub_15C54(v28, v30);
    uint64_t v31 = (uint64_t *)(v20
                    + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString);
  }
  else
  {
    uint64_t v0 = v37;
    if (qword_66ED0 != -1) {
      swift_once();
    }
    uint64_t v24 = v37[7];
    uint64_t v25 = (void *)qword_6B268;
    uint64_t v26 = (void *)sub_4C4D0();
    id v27 = [v25 localizedStringForKey:v26 value:0 table:0];

    uint64_t v28 = sub_4C500();
    uint64_t v30 = v29;

    sub_15C54(v28, v30);
    uint64_t v31 = (uint64_t *)(v24
                    + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString);
  }
  uint64_t *v31 = v28;
  v31[1] = v30;
LABEL_31:
  swift_bridgeObjectRelease();
  Swift::String v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t sub_16B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_4CAD0();
    sub_4C560();
    Swift::Int v6 = sub_4CAF0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_4CA60() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_4CA60() & 1) != 0) {
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

uint64_t sub_16CC4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_4C5D0();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_16D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  unsigned __int8 v6 = *(unsigned char *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_id);
  uint64_t v7 = v6;
  uint64_t v8 = sub_4B980();
  __chkstk_darwin(v8 - 8, v9);
  sub_51D0(v6);
  uint64_t v10 = sub_4C180();
  uint64_t v28 = v11;
  uint64_t v29 = v10;
  uint64_t v13 = v12;
  char v15 = v14;
  sub_4BFE0();
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_4BFD0(v30);
  uint64_t v16 = *(void *)(v1
                  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString);
  BOOL v17 = *(void **)(v1
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString
                 + 8);
  swift_bridgeObjectRetain();
  v31._countAndFlagsBits = v16;
  v31._object = v17;
  sub_4BFC0(v31);
  swift_bridgeObjectRelease();
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  sub_4BFD0(v32);
  sub_4C010();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  uint64_t v18 = v15 & 1;
  id v19 = (id)qword_6B268;
  uint64_t v20 = sub_4C160();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  unint64_t v26 = v25 & 1 | 0x8000000000000000;
  uint64_t result = sub_16F90(v2);
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v13;
  *(void *)(a1 + 32) = v18;
  *(void *)(a1 + 40) = v28;
  *(void *)(a1 + 48) = v20;
  *(void *)(a1 + 56) = v22;
  *(void *)(a1 + 64) = v26;
  *(void *)(a1 + 72) = v24;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 255;
  return result;
}

uint64_t sub_16F90(uint64_t a1)
{
  uint64_t v1 = a1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_cancellables;
  uint64_t result = swift_beginAccess();
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_4C880();
    uint64_t result = swift_bridgeObjectRelease();
    if (v3) {
      return result;
    }
  }
  else if (*(void *)(*(void *)v1 + 16))
  {
    return result;
  }
  uint64_t v4 = sub_4C750();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = [self defaultCenter];
  if (qword_66E90 != -1) {
    swift_once();
  }
  sub_4C760();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_15BB0();
  sub_4BD60();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  return swift_release();
}

uint64_t type metadata accessor for FilesAndFoldersSubtitleListItemProvider()
{
  return self;
}

uint64_t sub_17214@<X0>(uint64_t a1@<X8>)
{
  sub_16D5C((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

uint64_t sub_17254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  sub_4C640();
  v5[10] = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_172EC, v7, v6);
}

id sub_172EC()
{
  uint64_t v28 = v0;
  uint64_t v1 = v0[8];
  swift_release();
  if (!v1 || (unint64_t v2 = (unint64_t)sub_1AF0C(v0[8])) == 0)
  {
LABEL_20:
    uint64_t v24 = (uint64_t (*)(void))v0[1];
    return (id)v24();
  }
  unint64_t v3 = v2;
  char v25 = v0;
  aBlock = v0 + 2;
  if (!(v2 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_4C9D0();
  if (!v4)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
    uint64_t v0 = v25;
    id v19 = (char *)v25[9];
    uint64_t v20 = *(void **)&v19[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_accessManager];
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v19;
    v25[6] = sub_186AC;
    v25[7] = v21;
    _OWORD v25[2] = _NSConcreteStackBlock;
    v25[3] = 1107296256;
    v25[4] = sub_16CC4;
    v25[5] = &unk_5EB00;
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = v19;
    swift_release();
    [v20 bundleIdentifiersWithAccessToAnyItemCompletionHandler:v22];
    _Block_release(v22);
    goto LABEL_20;
  }
LABEL_5:
  uint64_t v5 = 0;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_4C920();
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5 + 32);
    }
    uint64_t v7 = v6;
    uint64_t v8 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    id result = [v6 bundleIdentifier];
    if (!result) {
      break;
    }
    uint64_t v10 = result;
    uint64_t v11 = sub_4C500();
    unint64_t v13 = v12;

    swift_bridgeObjectRelease();
    uint64_t v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0) {
      uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      id result = [v7 bundleIdentifier];
      if (!result) {
        goto LABEL_24;
      }
      char v15 = result;
      sub_4C500();

      Swift::Int v16 = sub_4C540();
      Swift::Int v18 = v17;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_22440(&v27, v16, v18);
      swift_endAccess();
      swift_bridgeObjectRelease();
    }

    ++v5;
    if (v8 == v4) {
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_175E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  sub_4C640();
  v5[10] = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_17680, v7, v6);
}

id sub_17680()
{
  uint64_t v1 = v0[8];
  swift_release();
  if (!v1 || (unint64_t v2 = (unint64_t)sub_1AF0C(v0[8])) == 0)
  {
LABEL_21:
    uint64_t v24 = (uint64_t (*)(void))v0[1];
    return (id)v24();
  }
  unint64_t v3 = v2;
  char v25 = v0;
  aBlock = v0 + 2;
  if (!(v2 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_4C9D0();
  if (!v4)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    uint64_t v0 = v25;
    id v19 = (char *)v25[9];
    uint64_t v20 = *(void **)&v19[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_accessManager];
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v19;
    v25[6] = sub_186AC;
    v25[7] = v21;
    _OWORD v25[2] = _NSConcreteStackBlock;
    v25[3] = 1107296256;
    v25[4] = sub_16CC4;
    v25[5] = &unk_5EA88;
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = v19;
    swift_release();
    [v20 bundleIdentifiersWithAccessToAnyItemCompletionHandler:v22];
    _Block_release(v22);
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v5 = 0;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_4C920();
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5 + 32);
    }
    uint64_t v7 = v6;
    uint64_t v8 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    id result = [v6 bundleIdentifier];
    if (!result) {
      break;
    }
    uint64_t v10 = result;
    uint64_t v11 = sub_4C500();
    unint64_t v13 = v12;

    swift_bridgeObjectRelease();
    uint64_t v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0) {
      uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      id result = [v7 bundleIdentifier];
      if (!result) {
        goto LABEL_25;
      }
      char v15 = result;
      sub_4C500();

      uint64_t v16 = sub_4C540();
      uint64_t v18 = v17;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_18248(v16, v18);
      swift_endAccess();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
    }
    ++v5;
    if (v8 == v4) {
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_17988(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = sub_4890(&qword_67720);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    a3 = sub_4C5D0();
  }
  uint64_t v12 = sub_4C670();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_4C640();
  swift_bridgeObjectRetain();
  id v13 = a1;
  uint64_t v14 = sub_4C630();
  char v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = a3;
  v15[5] = v13;
  sub_16074((uint64_t)v11, a5, (uint64_t)v15);

  swift_bridgeObjectRelease();
  return swift_release();
}

id sub_17AE8()
{
  qword_6B220 = PUIFileAccessChangeNotificationName;
  return PUIFileAccessChangeNotificationName;
}

uint64_t sub_17B00()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_17B38()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    unint64_t v2 = *(void **)(Strong
                  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_accessManager);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    aBlock[4] = sub_17C50;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_16CC4;
    aBlock[3] = &unk_5E970;
    uint64_t v4 = _Block_copy(aBlock);
    id v5 = v1;
    swift_release();
    [v2 bundleIdentifiersWithAccessToAnyItemCompletionHandler:v4];
    _Block_release(v4);
  }
}

void sub_17C48()
{
}

uint64_t sub_17C50(uint64_t a1, uint64_t a2)
{
  return sub_1658C(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_17C58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_17C68()
{
  return swift_release();
}

uint64_t sub_17C74(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_17D34;
  return sub_166BC(a1, v4, v5, v7, v6);
}

uint64_t sub_17D34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_17E28(uint64_t a1)
{
  uint64_t v2 = sub_4890(&qword_67720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_17E88(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_17F64;
  return v6(a1);
}

uint64_t sub_17F64()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1805C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_18094(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_17D34;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_67738 + dword_67738);
  return v6(a1, v4);
}

uint64_t sub_1814C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_18188(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_175E8(a1, v4, v5, v7, v6);
}

uint64_t sub_18248(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_4CAD0();
  swift_bridgeObjectRetain();
  sub_4C560();
  Swift::Int v6 = sub_4CAF0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_4CA60() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_4CA60() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_22A6C();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_183D8(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_183D8(unint64_t result)
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
    uint64_t v8 = sub_4C860();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_4CAD0();
        swift_bridgeObjectRetain();
        sub_4C560();
        Swift::Int v10 = sub_4CAF0();
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
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
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
    id result = swift_release();
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

uint64_t sub_185A4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_185EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_17254(a1, v4, v5, v7, v6);
}

uint64_t sub_186D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v9 = v4 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString;
  uint64_t v10 = *(void *)(v4 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString);
  uint64_t v11 = *(void *)(v4
                  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString
                  + 8);
  char v12 = *(unsigned char *)(v4
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString
                 + 16);
  sub_87BC(v10, v11, v12);
  swift_bridgeObjectRetain();
  char v13 = a3 & 1;
  uint64_t v18 = a4;
  LOBYTE(a4) = sub_4C140();
  sub_87CC(v10, v11, v12);
  swift_bridgeObjectRelease();
  if ((a4 & 1) == 0)
  {
    sub_78AC((void *)(v4 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_invalidator), *(void *)(v4 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_invalidator + 24));
    swift_retain();
    sub_4BCC0();
    swift_release();
  }
  uint64_t v14 = *(void *)v9;
  uint64_t v15 = *(void *)(v9 + 8);
  char v16 = *(unsigned char *)(v9 + 16);
  *(void *)uint64_t v9 = a1;
  *(void *)(v9 + 8) = a2;
  *(unsigned char *)(v9 + 16) = v13;
  *(void *)(v9 + 24) = v18;
  sub_87CC(v14, v15, v16);
  return swift_bridgeObjectRelease();
}

id sub_18828(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_sourceListDataSource) fetchSources];
}

id sub_18840()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v3 = result;
    [result removeObserver:v0];

    [*(id *)&v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_sourceListDataSource] unregisterObserver:v0];
    v4.receiver = v0;
    v4.super_class = ObjectType;
    return objc_msgSendSuper2(&v4, "dealloc");
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_189B4(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return _swift_task_switch(sub_189D4, 0, 0);
}

uint64_t sub_189D4()
{
  unint64_t v1 = v0[16];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_4C9D0();
    v0[18] = v3;
    if (v3)
    {
LABEL_3:
      uint64_t v4 = v0[16];
      uint64_t v5 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthAuthorizationStore;
      v0[19] = OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthAuthorizationStore;
      v0[20] = 0;
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v6 = (id)sub_4C920();
        uint64_t v5 = v0[19];
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          return _swift_continuation_await(v3);
        }
        id v6 = *(id *)(v4 + 32);
      }
      v0[21] = v6;
      v0[22] = 1;
      uint64_t v7 = *(void **)(v0[17] + v5);
      v0[23] = v7;
      id v8 = v7;
      id v9 = [v6 source];
      id v10 = [v9 bundleIdentifier];

      if (!v10)
      {
        sub_4C500();
        id v10 = (id)sub_4C4D0();
        swift_bridgeObjectRelease();
      }
      v0[24] = v10;
      v0[2] = v0;
      v0[7] = v0 + 15;
      v0[3] = sub_18C20;
      uint64_t v11 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = sub_196A0;
      v0[13] = &unk_5EB98;
      v0[14] = v11;
      [v8 fetchAuthorizationRecordsForBundleIdentifier:v10 completion:v0 + 10];
      uint64_t v3 = (uint64_t)(v0 + 2);
      return _swift_continuation_await(v3);
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v3 = swift_bridgeObjectRetain();
    v0[18] = v2;
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  char v12 = (uint64_t (*)(void))v0[1];
  return v12(0);
}

uint64_t sub_18C20()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_19234;
  }
  else {
    uint64_t v2 = sub_18D30;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_18D30()
{
  uint64_t v1 = (uint64_t *)(v0 + 120);
  unint64_t v2 = *(void *)(v0 + 120);
  Swift::String v40 = (id *)(v0 + 80);
  uint64_t v3 = *(void **)(v0 + 192);

  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_4C990();
    unint64_t v42 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v2 = v4 | 0x8000000000000000;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v42 = v2 + 64;
    uint64_t v5 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v2 + 64);
  }
  uint64_t v10 = 0;
  int64_t v41 = (unint64_t)(v5 + 64) >> 6;
  while (1)
  {
    uint64_t v11 = v10;
    if ((v2 & 0x8000000000000000) != 0)
    {
      uint64_t v14 = sub_4C9A0();
      if (!v14) {
        goto LABEL_33;
      }
      uint64_t v16 = v15;
      *uint64_t v1 = v14;
      sub_1222C(0, &qword_67890);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v17 = *v40;
      swift_unknownObjectRelease();
      *uint64_t v1 = v16;
      sub_1222C(0, &qword_67898);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v18 = *v40;
      swift_unknownObjectRelease();
      uint64_t v10 = v11;
      if (!v17) {
        goto LABEL_33;
      }
      goto LABEL_29;
    }
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_28;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v19 >= v41) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v42 + 8 * v19);
    ++v10;
    if (!v20)
    {
      uint64_t v10 = v11 + 2;
      if (v11 + 2 >= v41) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v42 + 8 * v10);
      if (!v20)
      {
        uint64_t v10 = v11 + 3;
        if (v11 + 3 >= v41) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v42 + 8 * v10);
        if (!v20)
        {
          uint64_t v10 = v11 + 4;
          if (v11 + 4 >= v41) {
            goto LABEL_33;
          }
          unint64_t v20 = *(void *)(v42 + 8 * v10);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v6 = (v20 - 1) & v20;
    unint64_t v13 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_28:
    uint64_t v22 = 8 * v13;
    uint64_t v23 = *(void **)(*(void *)(v2 + 56) + v22);
    id v17 = *(id *)(*(void *)(v2 + 48) + v22);
    id v18 = v23;
    if (!v17) {
      goto LABEL_33;
    }
LABEL_29:

    uint64_t v24 = (section_64 *)[v18 status];
    if (v24 != &stru_68)
    {
      uint64_t v25 = *(void *)(v0 + 160);
      unint64_t v26 = *(void **)(v0 + 168);
      sub_14FA0();

      BOOL v27 = __OFADD__(v25, 1);
      uint64_t v28 = v25 + 1;
      if (v27)
      {
        __break(1u);
        goto LABEL_33;
      }
      goto LABEL_34;
    }
  }
  uint64_t v21 = v11 + 5;
  while (v41 != v21)
  {
    unint64_t v20 = *(void *)(v42 + 8 * v21++);
    if (v20)
    {
      uint64_t v10 = v21 - 1;
      goto LABEL_27;
    }
  }
LABEL_33:
  uint64_t v29 = *(void **)(v0 + 168);
  sub_14FA0();

  uint64_t v28 = *(void *)(v0 + 160);
LABEL_34:
  unint64_t v30 = *(void *)(v0 + 176);
  if (v30 != *(void *)(v0 + 144))
  {
    *(void *)(v0 + 160) = v28;
    uint64_t v33 = *(void *)(v0 + 128);
    if ((v33 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = sub_4C920();
    }
    else
    {
      if (v30 >= *(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8)))
      {
LABEL_50:
        __break(1u);
        return _swift_continuation_await(v4);
      }
      uint64_t v4 = (uint64_t)*(id *)(v33 + 8 * v30 + 32);
    }
    uint64_t v34 = (void *)v4;
    *(void *)(v0 + 168) = v4;
    *(void *)(v0 + 176) = v30 + 1;
    if (!__OFADD__(v30, 1))
    {
      Swift::String v35 = *(void **)(*(void *)(v0 + 136) + *(void *)(v0 + 152));
      *(void *)(v0 + 184) = v35;
      id v36 = v35;
      id v37 = [v34 source];
      id v38 = [v37 bundleIdentifier];

      if (!v38)
      {
        sub_4C500();
        id v38 = (id)sub_4C4D0();
        swift_bridgeObjectRelease();
      }
      *(void *)(v0 + 192) = v38;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v1;
      *(void *)(v0 + 24) = sub_18C20;
      uint64_t v39 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_196A0;
      *(void *)(v0 + 104) = &unk_5EB98;
      *(void *)(v0 + 112) = v39;
      objc_msgSend(v36, "fetchAuthorizationRecordsForBundleIdentifier:completion:", v38);
      uint64_t v4 = v0 + 16;
      return _swift_continuation_await(v4);
    }
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  swift_bridgeObjectRelease();
  Swift::String v31 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v31(v28);
}

uint64_t sub_19234()
{
  uint64_t v33 = v0;
  uint64_t v1 = (void *)v0[24];
  unint64_t v2 = (void *)v0[23];
  swift_willThrow();

  if (qword_66EF0 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)v0[21];
  uint64_t v4 = sub_4BC10();
  sub_7874(v4, (uint64_t)qword_6B2B8);
  id v5 = v3;
  swift_errorRetain();
  id v6 = v5;
  swift_errorRetain();
  uint64_t v7 = sub_4BBF0();
  os_log_type_t v8 = sub_4C6A0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[25];
  uint64_t v11 = (void *)v0[21];
  if (v9)
  {
    uint64_t v12 = swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    id v13 = [v11 source];
    id v14 = [v13 bundleIdentifier];

    uint64_t v15 = sub_4C500();
    unint64_t v17 = v16;

    *(void *)(v12 + 4) = sub_1C340(v15, v17, v32);
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2080;
    v0[10] = v10;
    swift_errorRetain();
    sub_4890(&qword_67888);
    uint64_t v18 = sub_4C530();
    *(void *)(v12 + 14) = sub_1C340(v18, v19, v32);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v7, v8, "Could not get authorization records for %s with error: %s", (uint8_t *)v12, 0x16u);
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
  unint64_t v21 = v0[22];
  uint64_t v22 = v0[16];
  if (v21 != v0[18])
  {
    if ((v22 & 0xC000000000000001) != 0)
    {
      id v20 = (id)sub_4C920();
    }
    else
    {
      if (v21 >= *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_21;
      }
      id v20 = *(id *)(v22 + 8 * v21 + 32);
    }
    unint64_t v26 = v20;
    v0[21] = v20;
    v0[22] = v21 + 1;
    if (!__OFADD__(v21, 1))
    {
      BOOL v27 = *(void **)(v0[17] + v0[19]);
      v0[23] = v27;
      id v28 = v27;
      id v29 = [v26 source];
      id v30 = [v29 bundleIdentifier];

      if (!v30)
      {
        sub_4C500();
        id v30 = (id)sub_4C4D0();
        swift_bridgeObjectRelease();
      }
      v0[24] = v30;
      v0[2] = v0;
      v0[7] = v0 + 15;
      v0[3] = sub_18C20;
      uint64_t v31 = swift_continuation_init();
      v0[10] = _NSConcreteStackBlock;
      v0[11] = 0x40000000;
      v0[12] = sub_196A0;
      v0[13] = &unk_5EB98;
      v0[14] = v31;
      [v28 fetchAuthorizationRecordsForBundleIdentifier:v30 completion:v0 + 10];
      id v20 = v0 + 2;
      return _swift_continuation_await(v20);
    }
    __break(1u);
LABEL_21:
    __break(1u);
    return _swift_continuation_await(v20);
  }
  uint64_t v23 = v0[20];
  swift_bridgeObjectRelease();
  uint64_t v24 = (uint64_t (*)(uint64_t))v0[1];
  return v24(v23);
}

uint64_t sub_196A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_4890(&qword_67888);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_1222C(0, &qword_67890);
    sub_1222C(0, &qword_67898);
    sub_1AEB0();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_4C450();
    return _swift_continuation_throwingResume(v3);
  }
}

void sub_197A8(void *a1)
{
  uint64_t v3 = sub_4890(&qword_67720);
  __chkstk_darwin(v3 - 8, v4);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 sources];
  if (v7)
  {
    os_log_type_t v8 = v7;
    sub_4C650();
    uint64_t v9 = sub_4C670();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = v1;
    v10[5] = v8;
    id v11 = v1;
    id v12 = v8;
    sub_1C9E8((uint64_t)v6, (uint64_t)&unk_67860, (uint64_t)v10);
    swift_release();

    sub_17E28((uint64_t)v6);
  }
  else
  {
    if (qword_66EF0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_4BC10();
    sub_7874(v13, (uint64_t)qword_6B2B8);
    os_log_t v18 = (os_log_t)sub_4BBF0();
    os_log_type_t v14 = sub_4C6A0();
    if (os_log_type_enabled(v18, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v18, v14, "App data sources did not get fetched.", v15, 2u);
      swift_slowDealloc();
    }
    os_log_t v16 = v18;
  }
}

uint64_t sub_199BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5[2] = a4;
  v5[3] = a5;
  sub_4890(&qword_67720);
  v5[4] = swift_task_alloc();
  return _swift_task_switch(sub_19A50, 0, 0);
}

uint64_t sub_19A50()
{
  id v1 = [*(id *)(v0 + 24) orderedAppSources];
  *(void *)(v0 + 40) = sub_1222C(0, &qword_67868);
  uint64_t v2 = sub_4C5D0();
  *(void *)(v0 + 48) = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_19B4C;
  uint64_t v4 = *(void *)(v0 + 16);
  v3[16] = v2;
  v3[17] = v4;
  return _swift_task_switch(sub_189D4, 0, 0);
}

uint64_t sub_19B4C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_19C6C, 0, 0);
}

uint64_t sub_19C6C()
{
  id v1 = [*(id *)(v0 + 24) orderedResearchStudySources];
  uint64_t v2 = sub_4C5D0();
  *(void *)(v0 + 72) = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_19D4C;
  uint64_t v4 = *(void *)(v0 + 16);
  v3[16] = v2;
  v3[17] = v4;
  return _swift_task_switch(sub_189D4, 0, 0);
}

uint64_t sub_19D4C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_19E6C, 0, 0);
}

uint64_t sub_19E6C()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[4];
  uint64_t v4 = (void *)v0[2];
  uint64_t v5 = sub_4C670();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  sub_4C640();
  id v6 = v4;
  uint64_t v7 = sub_4C630();
  os_log_type_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v2;
  _OWORD v8[5] = v1;
  _OWORD v8[6] = v6;
  sub_16074(v3, (uint64_t)&unk_67880, (uint64_t)v8);
  swift_release();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_19F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  sub_4BFF0();
  v6[15] = swift_task_alloc();
  sub_4C640();
  v6[16] = sub_4C630();
  uint64_t v8 = sub_4C620();
  return _swift_task_switch(sub_1A05C, v8, v7);
}

uint64_t sub_1A05C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  swift_release();
  if (v1)
  {
    if (v2)
    {
      uint64_t v3 = v0[12];
      uint64_t v4 = v0[13];
      if (v3 == 1)
      {
        if (v4 == 1)
        {
          sub_4BFE0();
          v18._countAndFlagsBits = 0;
          v18._object = (void *)0xE000000000000000;
          sub_4BFD0(v18);
          v0[8] = 1;
          sub_4BFB0();
          v19._countAndFlagsBits = 0x202C70706120;
          v19._object = (void *)0xE600000000000000;
          sub_4BFD0(v19);
          v0[9] = 1;
          sub_4BFB0();
          v20._countAndFlagsBits = 0x796475747320;
          v20._object = (void *)0xE600000000000000;
          sub_4BFD0(v20);
          sub_4C010();
          if (qword_66ED0 == -1) {
            goto LABEL_20;
          }
LABEL_23:
          swift_once();
          goto LABEL_20;
        }
        uint64_t v8 = v0 + 7;
        sub_4BFE0();
        v27._countAndFlagsBits = 0;
        v27._object = (void *)0xE000000000000000;
        sub_4BFD0(v27);
        v0[6] = 1;
        sub_4BFB0();
        v9._countAndFlagsBits = 0x202C70706120;
        v9._object = (void *)0xE600000000000000;
      }
      else
      {
        if (v4 == 1)
        {
          sub_4BFE0();
          v25._countAndFlagsBits = 0;
          v25._object = (void *)0xE000000000000000;
          sub_4BFD0(v25);
          v0[4] = v3;
          sub_4BFB0();
          v26._countAndFlagsBits = 0x202C7370706120;
          v26._object = (void *)0xE700000000000000;
          sub_4BFD0(v26);
          v0[5] = 1;
          sub_4BFB0();
          v7._countAndFlagsBits = 0x796475747320;
          v7._object = (void *)0xE600000000000000;
          goto LABEL_19;
        }
        uint64_t v8 = v0 + 3;
        sub_4BFE0();
        v28._countAndFlagsBits = 0;
        v28._object = (void *)0xE000000000000000;
        sub_4BFD0(v28);
        v0[2] = v3;
        sub_4BFB0();
        v9._countAndFlagsBits = 0x202C7370706120;
        v9._object = (void *)0xE700000000000000;
      }
      sub_4BFD0(v9);
      void *v8 = v4;
      sub_4BFB0();
      v7._countAndFlagsBits = 0x7365696475747320;
      v7._object = (void *)0xE800000000000000;
LABEL_19:
      sub_4BFD0(v7);
      sub_4C010();
      if (qword_66ED0 == -1) {
        goto LABEL_20;
      }
      goto LABEL_23;
    }
    uint64_t v6 = v0[12];
    sub_4BFE0();
    v23._countAndFlagsBits = 0;
    v23._object = (void *)0xE000000000000000;
    sub_4BFD0(v23);
    v0[11] = v6;
    sub_4BFB0();
    v24._countAndFlagsBits = 0x7370706120;
    v24._object = (void *)0xE500000000000000;
    sub_4BFD0(v24);
    sub_4C010();
    if (qword_66ED0 != -1) {
      goto LABEL_23;
    }
  }
  else if (v2)
  {
    uint64_t v5 = v0[13];
    sub_4BFE0();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_4BFD0(v21);
    v0[10] = v5;
    sub_4BFB0();
    v22._countAndFlagsBits = 0x7365696475747320;
    v22._object = (void *)0xE800000000000000;
    sub_4BFD0(v22);
    sub_4C010();
    if (qword_66ED0 != -1) {
      goto LABEL_23;
    }
  }
  else
  {
    sub_4C000();
    if (qword_66ED0 != -1) {
      goto LABEL_23;
    }
  }
LABEL_20:
  id v10 = (id)qword_6B268;
  uint64_t v11 = sub_4C160();
  sub_186D8(v11, v13, v12 & 1, v14);
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

id sub_1A708@<X0>(uint64_t a1@<X8>)
{
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)sub_4C4D0();
    unsigned int v6 = [v4 applicationIsInstalled:v5];

    if (v6)
    {
      char v7 = *(unsigned char *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_id);
      uint64_t v8 = sub_4B980();
      __chkstk_darwin(v8 - 8, v9);
      sub_51D0(v7);
      uint64_t v10 = sub_4C180();
      uint64_t v29 = v12;
      uint64_t v30 = v10;
      uint64_t v14 = v13;
      __int16 v31 = 255;
      unint64_t v15 = 0;
      unint64_t v16 = 0;
    }
    else
    {
      sub_4C000();
      if (qword_66ED0 != -1) {
        swift_once();
      }
      id v17 = (id)qword_6B268;
      __int16 v31 = 2;
      uint64_t v18 = sub_4C160();
      uint64_t v29 = v19;
      uint64_t v30 = v18;
      uint64_t v14 = v20;
      unint64_t v15 = 0xD000000000000022;
      unint64_t v16 = 0x8000000000051060;
    }
    uint64_t v21 = v11 & 1;
    uint64_t v22 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_id);
    uint64_t v23 = v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString;
    uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString);
    uint64_t v25 = *(void *)(v23 + 8);
    uint64_t v26 = *(unsigned __int8 *)(v23 + 16);
    uint64_t v27 = *(void *)(v23 + 24);
    unint64_t v28 = v26 | 0x8000000000000000;
    sub_87BC(v24, v25, v26);
    *(void *)a1 = v22;
    *(void *)(a1 + 8) = v22;
    *(void *)(a1 + 16) = v30;
    *(void *)(a1 + 24) = v29;
    *(void *)(a1 + 32) = v21;
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 48) = v24;
    *(void *)(a1 + 56) = v25;
    *(void *)(a1 + 64) = v28;
    *(void *)(a1 + 72) = v27;
    *(void *)(a1 + 80) = v15;
    *(void *)(a1 + 88) = v16;
    *(_WORD *)(a1 + 96) = v31;
    return (id)swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for HealthDataListItemProvider()
{
  return self;
}

uint64_t sub_1A9D8@<X0>(uint64_t a1@<X8>)
{
  sub_1A708((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

unint64_t sub_1AA1C(unint64_t result)
{
  if (result)
  {
    id result = (unint64_t)sub_1AF0C(result);
    if (result)
    {
      unint64_t v2 = result;
      if (result >> 62) {
        goto LABEL_20;
      }
      uint64_t v3 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      for (; v3; uint64_t v3 = sub_4C9D0())
      {
        uint64_t v4 = 4;
        uint64_t v13 = v1;
        while (1)
        {
          id v6 = (v2 & 0xC000000000000001) != 0 ? (id)sub_4C920() : *(id *)(v2 + 8 * v4);
          char v7 = v6;
          uint64_t v1 = v4 - 3;
          if (__OFADD__(v4 - 4, 1)) {
            break;
          }
          id v8 = [v6 bundleIdentifier];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = sub_4C500();
            uint64_t v12 = v11;

            if (v10 == 0xD000000000000010 && v12 == 0x80000000000501F0)
            {
              swift_bridgeObjectRelease_n();

LABEL_18:
              swift_bridgeObjectRelease();
              sub_78AC((void *)(v13 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_invalidator), *(void *)(v13+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_invalidator+ 24));
              swift_retain();
              sub_4BCC0();
              return swift_release();
            }
            char v5 = sub_4CA60();

            swift_bridgeObjectRelease();
            if (v5)
            {
              swift_bridgeObjectRelease();
              goto LABEL_18;
            }
          }
          else
          {
          }
          ++v4;
          if (v1 == v3) {
            return swift_bridgeObjectRelease_n();
          }
        }
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
      }
      return swift_bridgeObjectRelease_n();
    }
  }
  return result;
}

uint64_t sub_1ACA0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1ACE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_17D34;
  return sub_199BC(a1, v4, v5, v7, v6);
}

uint64_t sub_1ADA8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1ADE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_186D4;
  return sub_19F94(a1, v4, v5, v6, v7, v8);
}

unint64_t sub_1AEB0()
{
  unint64_t result = qword_678A0;
  if (!qword_678A0)
  {
    sub_1222C(255, &qword_67890);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_678A0);
  }
  return result;
}

void *sub_1AF0C(uint64_t a1)
{
  return sub_1AF20(a1, &qword_67990);
}

void *sub_1AF20(uint64_t a1, unint64_t *a2)
{
  uint64_t v8 = _swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  sub_4C960();
  if (!v4) {
    return v8;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_10D98(i, (uint64_t)v7);
    sub_1222C(0, a2);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_4C940();
    sub_4C970();
    sub_4C980();
    sub_4C950();
    if (!--v4) {
      return v8;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_1B034(uint64_t result)
{
  uint64_t v2 = result;
  if (*(void *)(v1 + 24) != result)
  {
    sub_78AC((void *)(v1 + 48), *(void *)(v1 + 72));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = sub_7144(*(unsigned char *)(v1 + 16));
    sub_4C570(v3);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    unint64_t result = swift_release();
  }
  *(void *)(v1 + 24) = v2;
  return result;
}

void sub_1B124()
{
  uint64_t v1 = v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  Swift::String v3 = *(void **)(v0 + 40);
  if (v3)
  {
    sub_1222C(0, (unint64_t *)&qword_67540);
    uint64_t v4 = (void *)sub_4C710();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v2;
    *(void *)(v5 + 24) = v1;
    v7[4] = sub_1C9E4;
    v7[5] = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_1C054;
    v7[3] = &unk_5EC98;
    uint64_t v6 = _Block_copy(v7);
    swift_retain();
    swift_retain();
    swift_release();
    [v3 loadConfigurationsWithCompletionQueue:v4 handler:v6];
    _Block_release(v6);
    swift_release();
  }
  else
  {
    swift_release();
  }
}

uint64_t sub_1B294()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v18 = v0;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_15BFC();
    uint64_t result = sub_4C680();
    uint64_t v1 = v20;
    uint64_t v3 = v21;
    uint64_t v4 = v22;
    uint64_t v5 = v23;
    unint64_t v6 = v24;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v3 = v1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
      uint64_t v13 = v5;
      goto LABEL_27;
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v14 >= v10) {
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    uint64_t v13 = v5 + 1;
    if (!v15)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        goto LABEL_30;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v13);
      if (!v15)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          goto LABEL_30;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v13);
        if (!v15)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            goto LABEL_30;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v13);
          if (!v15)
          {
            uint64_t v16 = v5 + 5;
            while (v10 != v16)
            {
              unint64_t v15 = *(void *)(v3 + 8 * v16++);
              if (v15)
              {
                uint64_t v13 = v16 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *(void *)(v18 + 32) = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();

            sub_78F0(v18 + 48);
            return v18;
          }
        }
      }
    }
LABEL_26:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_27:
    uint64_t v17 = *(void *)(*(void *)(v1 + 48) + 8 * v12);
    swift_retain();
    if (!v17) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      uint64_t result = swift_release();
      uint64_t v5 = v13;
      unint64_t v6 = v11;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v13 = v5;
        uint64_t v11 = v6;
        if (v19) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B528()
{
  sub_1B294();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocalNetworkListValueItemProvider()
{
  return self;
}

uint64_t sub_1B580@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  sub_4BFE0();
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_4BFD0(v38);
  uint64_t v36 = *(void *)(v1 + 24);
  uint64_t v6 = sub_4890(&qword_67520);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  int64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_4BA20();
  __chkstk_darwin(v11 - 8, v12);
  sub_4BA00();
  sub_1358C();
  sub_4B8E0();
  sub_135E0();
  sub_4C840();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_4BFC0(v37);
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_4BFD0(v39);
  sub_4C010();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_6B268;
  uint64_t v14 = sub_4C160();
  uint64_t v34 = v15;
  uint64_t v35 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18 & 1;
  uint64_t v20 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v21 = sub_4B980();
  uint64_t v22 = v1;
  __chkstk_darwin(v21 - 8, v23);
  sub_51D0(v20);
  uint64_t v24 = sub_4C180();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29 & 1;
  uint64_t v31 = *(unsigned __int8 *)(v2 + 16);
  uint64_t result = sub_1B8D4(v22);
  *(void *)a1 = v31;
  *(void *)(a1 + 8) = v20;
  *(void *)(a1 + 16) = v24;
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 32) = v30;
  *(void *)(a1 + 40) = v28;
  uint64_t v33 = v34;
  *(void *)(a1 + 48) = v35;
  *(void *)(a1 + 56) = v33;
  *(void *)(a1 + 64) = v19 | 0x4000000000000000;
  *(void *)(a1 + 72) = v17;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 511;
  return result;
}

uint64_t sub_1B8D4(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(a1 + 32);
  if ((v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_4C880();
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      return result;
    }
  }
  else if (*(void *)(v3 + 16))
  {
    return result;
  }
  uint64_t v5 = sub_4C750();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v10 = [self defaultCenter];
  if (qword_66E98 != -1) {
    swift_once();
  }
  sub_4C760();

  swift_allocObject();
  swift_weakInit();
  sub_15BB0();
  sub_4BD60();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  return swift_release();
}

void sub_1BAFC(uint64_t a1, uint64_t a2, __objc2_ivar *a3)
{
  if (!a1) {
    goto LABEL_44;
  }
  unint64_t v4 = (unint64_t)sub_1AF20(a1, &qword_67980);
  if (!v4) {
    goto LABEL_44;
  }
  unint64_t v5 = v4;
  if (v4 >> 62)
  {
LABEL_42:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_4C9D0();
    if (v6) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_43:
    swift_bridgeObjectRelease_n();
LABEL_44:
    if (qword_66EF0 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_4BC10();
    sub_7874(v29, (uint64_t)qword_6B2B8);
    swift_errorRetain();
    swift_errorRetain();
    osloga = sub_4BBF0();
    os_log_type_t v30 = sub_4C6A0();
    if (os_log_type_enabled(osloga, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      v36[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      swift_errorRetain();
      sub_4890(&qword_67970);
      uint64_t v32 = sub_4C530();
      sub_1C340(v32, v33, v36);
      sub_4C800();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, osloga, v30, "Failed to load network configurations %s.", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    return;
  }
LABEL_5:
  os_log_t oslog = (os_log_t)&a3->type;
  a3 = (__objc2_ivar *)&dword_4;
  while (1)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_4C920();
    }
    else {
      id v7 = *(id *)(v5 + 8 * (void)a3);
    }
    uint64_t v8 = v7;
    uint64_t v9 = (char *)&a3[-1].size + 1;
    if (__OFADD__(&a3[-1].size, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    id v10 = [v7 name];
    if (!v10)
    {
      sub_4C500();
LABEL_7:

      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    uint64_t v11 = v10;
    uint64_t v12 = sub_4C500();
    uint64_t v14 = v13;

    uint64_t v15 = sub_4C500();
    if (!v14) {
      goto LABEL_7;
    }
    if (v12 == v15 && v14 == v16) {
      break;
    }
    char v18 = sub_4CA60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_23;
    }

LABEL_8:
    a3 = (__objc2_ivar *)((char *)a3 + 1);
    if (v9 == (char *)v6) {
      goto LABEL_43;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_23:
  swift_bridgeObjectRelease_n();
  id v19 = [v8 pathController];
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = [v19 pathRules];

    if (!v21
      || (uint64_t v22 = sub_4C5D0(),
          v21,
          unint64_t v5 = (unint64_t)sub_1AF20(v22, &qword_67978),
          swift_bridgeObjectRelease(),
          !v5))
    {

      goto LABEL_44;
    }
    if (!(v5 >> 62))
    {
      uint64_t v23 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
      uint64_t v24 = (uint64_t *)oslog;
      if (v23) {
        goto LABEL_28;
      }
LABEL_52:
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_1B034(*v24);

      return;
    }
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_4C9D0();
    swift_bridgeObjectRelease();
    uint64_t v24 = (uint64_t *)oslog;
    if (!v23) {
      goto LABEL_52;
    }
LABEL_28:
    if (v23 >= 1)
    {
      swift_beginAccess();
      uint64_t v25 = 0;
      a3 = &stru_66000;
      while (1)
      {
        if ((v5 & 0xC000000000000001) != 0) {
          id v26 = (id)sub_4C920();
        }
        else {
          id v26 = *(id *)(v5 + 8 * v25 + 32);
        }
        uint64_t v27 = v26;
        unsigned __int8 v28 = [v26 denyMulticast];

        uint64_t v24 = (uint64_t *)oslog;
        if ((v28 & 1) == 0)
        {
          if (__OFADD__(oslog->isa, 1)) {
            goto LABEL_41;
          }
          ++oslog->isa;
        }
        if (v23 == ++v25) {
          goto LABEL_52;
        }
      }
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C054(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_4C5D0();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C0F0@<X0>(uint64_t a1@<X8>)
{
  sub_1B580((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

id sub_1C130()
{
  qword_6B228 = PUINetworkConfigChangeNotificationName;
  return PUINetworkConfigChangeNotificationName;
}

uint64_t sub_1C148()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1C180()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = 0;
    uint64_t v3 = *(void **)(v1 + 40);
    if (v3)
    {
      sub_1222C(0, (unint64_t *)&qword_67540);
      unint64_t v4 = (void *)sub_4C710();
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v2;
      *(void *)(v5 + 24) = v1;
      aBlock[4] = sub_1C320;
      aBlock[5] = v5;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1C054;
      aBlock[3] = &unk_5EC48;
      id v6 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      [v3 loadConfigurationsWithCompletionQueue:v4 handler:v6];
      _Block_release(v6);
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
    }
  }
}

void sub_1C304()
{
}

uint64_t sub_1C30C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1C320(uint64_t a1, uint64_t a2)
{
  sub_1BAFC(a1, a2, *(__objc2_ivar **)(v2 + 16));
}

uint64_t sub_1C328(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1C338()
{
  return swift_release();
}

uint64_t sub_1C340(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C414(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10D98((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10D98((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_78F0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C414(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_4C810();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C5D0(a5, a6);
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
  uint64_t v8 = sub_4C930();
  if (!v8)
  {
    sub_4C9B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_4CA10();
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

uint64_t sub_1C5D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1C668(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C848(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C848(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1C668(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C7E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_4C910();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_4C9B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_4C590();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_4CA10();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_4C9B0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1C7E0(uint64_t a1, uint64_t a2)
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
  sub_4890(&qword_67988);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C848(char a1, int64_t a2, char a3, char *a4)
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
    sub_4890(&qword_67988);
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
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_1C99C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1C9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_4890(&qword_67720);
  __chkstk_darwin(v6 - 8, v7);
  int64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1F29C(a1, (uint64_t)v9);
  uint64_t v10 = sub_4C670();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_4B7C((uint64_t)v9, &qword_67720);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_4C620();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_4C660();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v14;
  }
  return swift_task_create();
}

id sub_1CBD4()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_cancellables];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v20 = (objc_class *)ObjectType;
  id v21 = v0;
  if ((*(void *)v2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_1FD1C((unint64_t *)&qword_67770, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    id result = (id)sub_4C680();
    uint64_t v3 = v24;
    uint64_t v5 = v25;
    uint64_t v6 = v26;
    uint64_t v7 = v27;
    unint64_t v8 = v28;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    uint64_t v5 = v3 + 56;
    uint64_t v6 = ~v9;
    uint64_t v10 = -v9;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v8 = v11 & *(void *)(v3 + 56);
    id result = (id)swift_bridgeObjectRetain();
    uint64_t v7 = 0;
  }
  int64_t v12 = (unint64_t)(v6 + 64) >> 6;
  if (v3 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v8)
    {
      uint64_t v13 = (v8 - 1) & v8;
      unint64_t v14 = __clz(__rbit64(v8)) | (v7 << 6);
      uint64_t v15 = v7;
      goto LABEL_27;
    }
    int64_t v16 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      break;
    }
    if (v16 >= v12) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    uint64_t v15 = v7 + 1;
    if (!v17)
    {
      uint64_t v15 = v7 + 2;
      if (v7 + 2 >= v12) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v5 + 8 * v15);
      if (!v17)
      {
        uint64_t v15 = v7 + 3;
        if (v7 + 3 >= v12) {
          goto LABEL_30;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v15);
        if (!v17)
        {
          uint64_t v15 = v7 + 4;
          if (v7 + 4 >= v12) {
            goto LABEL_30;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v15);
          if (!v17)
          {
            uint64_t v18 = v7 + 5;
            while (v12 != v18)
            {
              unint64_t v17 = *(void *)(v5 + 8 * v18++);
              if (v17)
              {
                uint64_t v15 = v18 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *(void *)uint64_t v2 = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            v23.receiver = v21;
            v23.super_class = v20;
            return objc_msgSendSuper2(&v23, "dealloc");
          }
        }
      }
    }
LABEL_26:
    uint64_t v13 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v15 << 6);
LABEL_27:
    uint64_t v19 = *(void *)(*(void *)(v3 + 48) + 8 * v14);
    swift_retain();
    if (!v19) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      id result = (id)swift_release();
      uint64_t v7 = v15;
      unint64_t v8 = v13;
      if ((v3 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v15 = v7;
        uint64_t v13 = v8;
        if (v22) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1CF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_4890(&qword_67720);
  *(void *)(v4 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_1D000, 0, 0);
}

uint64_t sub_1D000()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = self;
  unsigned __int8 v4 = [v3 locationServicesEnabled];
  unsigned __int8 v5 = [v3 isStatusBarIconEnabledForLocationEntityClass:4];
  uint64_t v6 = sub_4C670();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
  sub_4C640();
  id v7 = v2;
  uint64_t v8 = sub_4C630();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = &protocol witness table for MainActor;
  *(void *)(v9 + 32) = v7;
  *(unsigned char *)(v9 + 40) = v4;
  *(unsigned char *)(v9 + 41) = v5;
  sub_16074(v1, (uint64_t)&unk_67A38, v9);
  swift_release();
  sub_1D380();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1D160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  *(unsigned char *)(v6 + 49) = a6;
  *(unsigned char *)(v6 + 48) = a5;
  *(void *)(v6 + 32) = a4;
  sub_4C640();
  *(void *)(v6 + 40) = sub_4C630();
  uint64_t v8 = sub_4C620();
  return _swift_task_switch(sub_1D200, v8, v7);
}

uint64_t sub_1D200()
{
  int v1 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v3 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isServiceEnabled;
  if (v1 != *(unsigned __int8 *)(v2
                                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isServiceEnabled))
  {
    sub_78AC((void *)(*(void *)(v0 + 32)+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator), *(void *)(*(void *)(v0 + 32)+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator+ 24));
    *(void *)(v0 + 16) = 0xD000000000000024;
    *(void *)(v0 + 24) = 0x8000000000051660;
    swift_retain();
    sub_4BCC0();
    swift_release();
  }
  int v4 = *(unsigned __int8 *)(v0 + 49);
  uint64_t v5 = *(void *)(v0 + 32);
  *(unsigned char *)(v2 + v3) = *(unsigned char *)(v0 + 48);
  uint64_t v6 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isStatusBarIconEnabled;
  if (v4 != *(unsigned __int8 *)(v5
                                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isStatusBarIconEnabled))
  {
    sub_78AC((void *)(*(void *)(v0 + 32)+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator), *(void *)(*(void *)(v0 + 32)+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator+ 24));
    *(void *)(v0 + 16) = 0xD000000000000033;
    *(void *)(v0 + 24) = 0x8000000000051690;
    swift_retain();
    sub_4BCC0();
    swift_release();
  }
  uint64_t v7 = *(void *)(v0 + 32);
  *(unsigned char *)(v5 + v6) = *(unsigned char *)(v0 + 49);
  *(unsigned char *)(v7 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_gotLocationState) = 1;
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

id sub_1D380()
{
  uint64_t v1 = sub_4890(&qword_67720);
  __chkstk_darwin(v1 - 8, v2);
  int v4 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  id result = [v5 activeLocationClientsWithInfo];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v70 = v4;
    uint64_t v8 = sub_4C450();

    uint64_t v9 = v8 + 64;
    uint64_t v10 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v11 = -1;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    unint64_t v12 = v11 & *(void *)(v8 + 64);
    uint64_t v76 = &v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_bundlePath];
    uint64_t v75 = &v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_bundleId];
    id v69 = v0;
    uint64_t v74 = &v0[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_findMy];
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    swift_bridgeObjectRetain();
    uint64_t v72 = 0;
    uint64_t v71 = 0;
    uint64_t v14 = 0;
    int64_t v15 = 0;
    uint64_t v67 = 0;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v15 << 6);
      }
      else
      {
        BOOL v18 = __OFADD__(v15++, 1);
        if (v18)
        {
          __break(1u);
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
LABEL_102:
          __break(1u);
LABEL_103:
          __break(1u);
LABEL_104:
          __break(1u);
LABEL_105:
          __break(1u);
        }
        if (v15 >= v13) {
          goto LABEL_97;
        }
        unint64_t v19 = *(void *)(v9 + 8 * v15);
        if (!v19)
        {
          int64_t v20 = v15 + 1;
          if (v15 + 1 >= v13) {
            goto LABEL_97;
          }
          unint64_t v19 = *(void *)(v9 + 8 * v20);
          if (!v19)
          {
            int64_t v20 = v15 + 2;
            if (v15 + 2 >= v13) {
              goto LABEL_97;
            }
            unint64_t v19 = *(void *)(v9 + 8 * v20);
            if (!v19)
            {
              int64_t v20 = v15 + 3;
              if (v15 + 3 >= v13) {
                goto LABEL_97;
              }
              unint64_t v19 = *(void *)(v9 + 8 * v20);
              if (!v19)
              {
                int64_t v20 = v15 + 4;
                if (v15 + 4 >= v13) {
                  goto LABEL_97;
                }
                unint64_t v19 = *(void *)(v9 + 8 * v20);
                if (!v19)
                {
                  int64_t v20 = v15 + 5;
                  if (v15 + 5 >= v13)
                  {
LABEL_97:
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v60 = sub_4C670();
                    uint64_t v61 = (uint64_t)v70;
                    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v70, 1, 1, v60);
                    sub_4C640();
                    id v62 = v69;
                    uint64_t v63 = sub_4C630();
                    uint64_t v64 = (void *)swift_allocObject();
                    v64[2] = v63;
                    v64[3] = &protocol witness table for MainActor;
                    v64[4] = v62;
                    v64[5] = v14;
                    uint64_t v65 = v72;
                    v64[6] = v71;
                    v64[7] = v65;
                    sub_16074(v61, (uint64_t)&unk_67A58, (uint64_t)v64);
                    return (id)swift_release();
                  }
                  unint64_t v19 = *(void *)(v9 + 8 * v20);
                  if (!v19)
                  {
                    while (1)
                    {
                      int64_t v15 = v20 + 1;
                      if (__OFADD__(v20, 1)) {
                        goto LABEL_101;
                      }
                      if (v15 >= v13) {
                        goto LABEL_97;
                      }
                      unint64_t v19 = *(void *)(v9 + 8 * v15);
                      ++v20;
                      if (v19) {
                        goto LABEL_24;
                      }
                    }
                  }
                }
              }
            }
          }
          int64_t v15 = v20;
        }
LABEL_24:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v15 << 6);
      }
      sub_10D3C(*(void *)(v8 + 48) + 40 * v17, (uint64_t)v83);
      uint64_t v80 = v84;
      v79[0] = v83[0];
      v79[1] = v83[1];
      if (*(void *)(v8 + 16) && (unint64_t v21 = sub_1F3E8((uint64_t)v79), (v22 & 1) != 0))
      {
        sub_10D98(*(void *)(v8 + 56) + 32 * v21, (uint64_t)&v81);
      }
      else
      {
        long long v81 = 0u;
        long long v82 = 0u;
      }
      sub_1FBA0((uint64_t)v79);
      if (*((void *)&v82 + 1))
      {
        sub_4890(&qword_67A48);
        if (swift_dynamicCast())
        {
          uint64_t v23 = v77;
          uint64_t v24 = (void *)sub_4C440();
          id v25 = [v5 primaryEntityClassForLocationDictionary:v24];

          switch((unint64_t)v25)
          {
            case 1uLL:
              uint64_t v31 = *((void *)v75 + 1);
              uint64_t v77 = *(void *)v75;
              uint64_t v78 = v31;
              swift_bridgeObjectRetain();
              sub_4C8C0();
              if (*(void *)(v23 + 16))
              {
                unint64_t v32 = sub_1F3E8((uint64_t)v79);
                if (v33)
                {
                  sub_10D98(*(void *)(v23 + 56) + 32 * v32, (uint64_t)&v81);
                }
                else
                {
                  long long v81 = 0u;
                  long long v82 = 0u;
                }
              }
              else
              {
                long long v81 = 0u;
                long long v82 = 0u;
              }
              sub_1FBA0((uint64_t)v79);
              if (!*((void *)&v82 + 1)) {
                goto LABEL_6;
              }
              if ((swift_dynamicCast() & 1) == 0) {
                goto LABEL_73;
              }
              uint64_t v73 = v14;
              uint64_t v68 = v5;
              uint64_t v46 = v77;
              id v47 = objc_allocWithZone((Class)LSApplicationRecord);
              swift_bridgeObjectRetain();
              uint64_t v66 = v46;
              char v48 = (void *)sub_4C4D0();
              swift_bridgeObjectRelease();
              *(void *)&v79[0] = 0;
              id v49 = [v47 initWithBundleIdentifier:v48 allowPlaceholder:0 error:v79];

              if (v49)
              {
                id v50 = *(id *)&v79[0];
                id v51 = [v49 applicationState];
                unsigned __int8 v52 = [v51 isInstalled];

                if (v52) {
                  goto LABEL_80;
                }
                if (!PUILocationIsActivePairedDevice()) {
                  goto LABEL_95;
                }
              }
              else
              {
                id v53 = *(id *)&v79[0];
                sub_4B960();

                swift_willThrow();
                swift_errorRelease();
                uint64_t v67 = 0;
                if (!PUILocationIsActivePairedDevice())
                {
LABEL_95:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v5 = v68;
                  goto LABEL_96;
                }
              }
              uint64_t v54 = (void *)sub_4C4D0();
              char IsDisplayNameForWatchApp = PUILocationIsDisplayNameForWatchApp();

              if (IsDisplayNameForWatchApp)
              {
LABEL_80:
                swift_bridgeObjectRelease();
                uint64_t v5 = v68;
                uint64_t v14 = v73;
                goto LABEL_81;
              }
              uint64_t v58 = (void *)sub_4C4D0();
              swift_bridgeObjectRelease();
              char IsWatchBundleIDForBundleID = PUILocationIsWatchBundleIDForBundleID();

              uint64_t v5 = v68;
              uint64_t v14 = v73;
              if ((IsWatchBundleIDForBundleID & 1) == 0) {
                goto LABEL_73;
              }
LABEL_81:
              unint64_t v56 = (void *)sub_4C440();
              swift_bridgeObjectRelease();
              unint64_t v57 = (int *)[v5 entityAuthorizationForLocationDictionary:v56];

              if (v57 == (int *)((char *)&dword_0 + 2))
              {
                BOOL v18 = __OFADD__(v72++, 1);
                if (v18) {
                  goto LABEL_105;
                }
              }
              else if (v57 == &dword_4)
              {
                BOOL v18 = __OFADD__(v71++, 1);
                if (v18) {
                  goto LABEL_104;
                }
              }
              continue;
            case 2uLL:
              uint64_t v34 = *((void *)v76 + 1);
              uint64_t v77 = *(void *)v76;
              uint64_t v78 = v34;
              swift_bridgeObjectRetain();
              sub_4C8C0();
              if (*(void *)(v23 + 16) && (unint64_t v35 = sub_1F3E8((uint64_t)v79), (v36 & 1) != 0))
              {
                sub_10D98(*(void *)(v23 + 56) + 32 * v35, (uint64_t)&v81);
              }
              else
              {
                long long v81 = 0u;
                long long v82 = 0u;
              }
              sub_1FBA0((uint64_t)v79);
              if (!*((void *)&v82 + 1))
              {
LABEL_6:
                swift_bridgeObjectRelease();
                goto LABEL_7;
              }
              if ((swift_dynamicCast() & 1) == 0) {
                goto LABEL_73;
              }
              uint64_t v73 = v14;
              Swift::String v37 = v5;
              id v38 = objc_allocWithZone((Class)NSBundle);
              Swift::String v39 = (void *)sub_4C4D0();
              swift_bridgeObjectRelease();
              id v40 = [v38 initWithPath:v39];

              if (v40)
              {
                int64_t v41 = (void *)sub_4C440();
                swift_bridgeObjectRelease();
                uint64_t v5 = v37;
                unint64_t v42 = (int *)[v37 entityAuthorizationForLocationDictionary:v41];

                if (v42 == (int *)((char *)&dword_0 + 2))
                {
                  BOOL v18 = __OFADD__(v72++, 1);
                  uint64_t v14 = v73;
                  if (v18) {
                    goto LABEL_103;
                  }
                }
                else
                {
                  uint64_t v14 = v73;
                  if (v42 == &dword_4)
                  {
                    BOOL v18 = __OFADD__(v71++, 1);
                    if (v18) {
                      goto LABEL_102;
                    }
                  }
                }
              }
              else
              {
                swift_bridgeObjectRelease();
                uint64_t v5 = v37;
LABEL_96:
                uint64_t v14 = v73;
              }
              continue;
            case 4uLL:
            case 8uLL:
            case 0x10uLL:
              uint64_t v26 = *((void *)v76 + 1);
              uint64_t v77 = *(void *)v76;
              uint64_t v78 = v26;
              swift_bridgeObjectRetain();
              sub_4C8C0();
              if (*(void *)(v23 + 16) && (unint64_t v27 = sub_1F3E8((uint64_t)v79), (v28 & 1) != 0))
              {
                sub_10D98(*(void *)(v23 + 56) + 32 * v27, (uint64_t)&v81);
              }
              else
              {
                long long v81 = 0u;
                long long v82 = 0u;
              }
              sub_1FBA0((uint64_t)v79);
              if (!*((void *)&v82 + 1))
              {
                sub_4B7C((uint64_t)&v81, &qword_67A40);
                goto LABEL_42;
              }
              if ((swift_dynamicCast() & 1) == 0) {
                goto LABEL_42;
              }
              if (v77 == *(void *)v74 && v78 == *((void *)v74 + 1))
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                char v43 = sub_4CA60();
                swift_bridgeObjectRelease();
                if ((v43 & 1) == 0) {
                  goto LABEL_42;
                }
              }
              id v44 = [self currentDevice];
              unsigned int v45 = objc_msgSend(v44, "sf_inRetailKioskMode");

              if (v45 || PSIsInEDUMode())
              {
LABEL_73:
                swift_bridgeObjectRelease();
                continue;
              }
LABEL_42:
              uint64_t v29 = (void *)sub_4C440();
              swift_bridgeObjectRelease();
              os_log_type_t v30 = (int *)[v5 entityAuthorizationForLocationDictionary:v29];

              if (v30 == &dword_4)
              {
                BOOL v18 = __OFADD__(v14++, 1);
                if (v18) {
                  goto LABEL_100;
                }
              }
              break;
            default:
              goto LABEL_73;
          }
        }
      }
      else
      {
LABEL_7:
        sub_4B7C((uint64_t)&v81, &qword_67A40);
      }
    }
  }
  return result;
}

uint64_t sub_1DEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  sub_4C640();
  v7[8] = sub_4C630();
  uint64_t v9 = sub_4C620();
  return _swift_task_switch(sub_1DF40, v9, v8);
}

uint64_t sub_1DF40()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  swift_release();
  uint64_t v3 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_systemServicesCount;
  if (*(void *)(v2
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_systemServicesCount) != v1)
  {
    sub_78AC((void *)(v0[4] + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator), *(void *)(v0[4]+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator+ 24));
    v0[2] = 0xD00000000000002CLL;
    v0[3] = 0x8000000000051630;
    swift_retain();
    sub_4BCC0();
    swift_release();
  }
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[4];
  *(void *)(v2 + v3) = v0[5];
  uint64_t v6 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedAlwaysCount;
  if (*(void *)(v5
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedAlwaysCount) != v4)
  {
    sub_78AC((void *)(v0[4] + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator), *(void *)(v0[4]+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator+ 24));
    v0[2] = 0xD00000000000002CLL;
    v0[3] = 0x8000000000051630;
    swift_retain();
    sub_4BCC0();
    swift_release();
  }
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[4];
  *(void *)(v5 + v6) = v0[6];
  uint64_t v9 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedWhenInUseCount;
  if (*(void *)(v8
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedWhenInUseCount) != v7)
  {
    sub_78AC((void *)(v0[4] + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator), *(void *)(v0[4]+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator+ 24));
    v0[2] = 0xD00000000000002CLL;
    v0[3] = 0x8000000000051630;
    swift_retain();
    sub_4BCC0();
    swift_release();
  }
  *(void *)(v8 + v9) = v0[7];
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1E108()
{
  uint64_t v1 = sub_4BFF0();
  __chkstk_darwin(v1 - 8, v2);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isServiceEnabled) == 1)
  {
    uint64_t v3 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedAlwaysCount;
    uint64_t v4 = *(void *)(v0
                   + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedAlwaysCount);
    uint64_t v5 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedWhenInUseCount;
    uint64_t v6 = *(void *)(v0
                   + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedWhenInUseCount);
    if (*(unsigned char *)(v0
                  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isStatusBarIconEnabled) == 1)
    {
      BOOL v7 = __OFADD__(v4, v6);
      uint64_t v8 = v4 + v6;
      if (v7)
      {
        __break(1u);
      }
      else
      {
        uint64_t v9 = *(void *)(v0
                       + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_systemServicesCount);
        uint64_t v10 = v8 + v9;
        if (!__OFADD__(v8, v9))
        {
          sub_4BFE0();
          v46._countAndFlagsBits = 0;
          v46._object = (void *)0xE000000000000000;
          sub_4BFD0(v46);
          v45._countAndFlagsBits = v10;
          sub_4BFB0();
          v47._countAndFlagsBits = 0;
          v47._object = (void *)0xE000000000000000;
          sub_4BFD0(v47);
          sub_4C010();
          if (qword_66ED0 == -1) {
            goto LABEL_15;
          }
          goto LABEL_26;
        }
      }
      __break(1u);
      goto LABEL_26;
    }
    if (v4)
    {
      if (v6)
      {
        sub_4BFE0();
        v48._countAndFlagsBits = 0;
        v48._object = (void *)0xE000000000000000;
        sub_4BFD0(v48);
        uint64_t v44 = *(void *)(v0 + v3);
        uint64_t v11 = sub_4890(&qword_67520);
        v41[2] = v41;
        uint64_t v43 = *(void *)(v11 - 8);
        v41[1] = *(void *)(v43 + 64);
        __chkstk_darwin(v11, v12);
        unint64_t v42 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v14 = (char *)v41 - v42;
        uint64_t v15 = sub_4BA20();
        uint64_t v16 = *(void *)(*(void *)(v15 - 8) + 64);
        __chkstk_darwin(v15 - 8, v17);
        v41[3] = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
        sub_4BA00();
        sub_1358C();
        sub_4B8E0();
        v41[0] = sub_135E0();
        sub_4C840();
        BOOL v18 = *(void (**)(char *, uint64_t))(v43 + 8);
        v43 += 8;
        v18(v14, v11);
        sub_4BFC0(v45);
        swift_bridgeObjectRelease();
        v49._countAndFlagsBits = 0x2C737961776C6120;
        v49._object = (void *)0xE900000000000020;
        sub_4BFD0(v49);
        uint64_t v44 = *(void *)(v0 + v5);
        uint64_t v21 = __chkstk_darwin(v19, v20);
        char v22 = (char *)v41 - v42;
        __chkstk_darwin(v21, v23);
        sub_4BA00();
        sub_4B8E0();
        sub_4C840();
        v18(v22, v11);
        sub_4BFC0(v45);
        swift_bridgeObjectRelease();
        v50._countAndFlagsBits = 0x7520656C69687720;
        v50._object = (void *)0xEC000000676E6973;
        sub_4BFD0(v50);
        sub_4C010();
        if (qword_66ED0 == -1) {
          goto LABEL_21;
        }
        goto LABEL_29;
      }
      sub_4BFE0();
      v53._countAndFlagsBits = 0;
      v53._object = (void *)0xE000000000000000;
      sub_4BFD0(v53);
      uint64_t v44 = *(void *)(v0 + v3);
      uint64_t v33 = sub_4890(&qword_67520);
      uint64_t v34 = *(void *)(v33 - 8);
      __chkstk_darwin(v33, v35);
      Swift::String v37 = (char *)v41 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v38 = sub_4BA20();
      __chkstk_darwin(v38 - 8, v39);
      sub_4BA00();
      sub_1358C();
      sub_4B8E0();
      sub_135E0();
      sub_4C840();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
      sub_4BFC0(v45);
      swift_bridgeObjectRelease();
      v54._countAndFlagsBits = 0x737961776C6120;
      v54._object = (void *)0xE700000000000000;
      sub_4BFD0(v54);
      sub_4C010();
      if (qword_66ED0 == -1)
      {
LABEL_21:
        id v40 = (id)qword_6B268;
        return sub_4C160();
      }
    }
    else
    {
      if (!v6)
      {
        sub_4C000();
        if (qword_66ED0 == -1) {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
      sub_4BFE0();
      v51._countAndFlagsBits = 0;
      v51._object = (void *)0xE000000000000000;
      sub_4BFD0(v51);
      uint64_t v44 = *(void *)(v0 + v5);
      uint64_t v26 = sub_4890(&qword_67520);
      uint64_t v27 = *(void *)(v26 - 8);
      __chkstk_darwin(v26, v28);
      os_log_type_t v30 = (char *)v41 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v31 = sub_4BA20();
      __chkstk_darwin(v31 - 8, v32);
      sub_4BA00();
      sub_1358C();
      sub_4B8E0();
      sub_135E0();
      sub_4C840();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
      sub_4BFC0(v45);
      swift_bridgeObjectRelease();
      v52._countAndFlagsBits = 0x7520656C69687720;
      v52._object = (void *)0xEC000000676E6973;
      sub_4BFD0(v52);
      sub_4C010();
      if (qword_66ED0 == -1) {
        goto LABEL_21;
      }
    }
LABEL_29:
    swift_once();
    goto LABEL_21;
  }
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_gotLocationState) == 1)
  {
    sub_4C000();
    if (qword_66ED0 == -1) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
  sub_4C000();
  if (qword_66ED0 != -1) {
LABEL_26:
  }
    swift_once();
LABEL_15:
  id v24 = (id)qword_6B268;
  return sub_4C160();
}

uint64_t sub_1EBB8@<X0>(uint64_t a1@<X8>)
{
  if ((*(unsigned char *)(v1
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isStatusBarIconEnabled) & 1) != 0
    || (*(unsigned char *)(v1
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isServiceEnabled) & 1) == 0)
  {
    unsigned int v14 = *(unsigned __int8 *)(v1
                             + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_id);
    uint64_t v15 = sub_4B980();
    __chkstk_darwin(v15 - 8, v16);
    unsigned int v29 = v14;
    sub_51D0(v14);
    uint64_t v28 = sub_4C180();
    uint64_t v7 = v17;
    char v9 = v18;
    uint64_t v11 = v19;
    __int16 v12 = 511;
    unint64_t v13 = 0x4000000000000000;
  }
  else
  {
    unsigned int v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_id);
    uint64_t v4 = sub_4B980();
    __chkstk_darwin(v4 - 8, v5);
    unsigned int v29 = v3;
    sub_51D0(v3);
    uint64_t v28 = sub_4C180();
    uint64_t v7 = v6;
    char v9 = v8;
    uint64_t v11 = v10;
    __int16 v12 = 255;
    unint64_t v13 = 0x8000000000000000;
  }
  uint64_t v20 = sub_1E108();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  unint64_t v26 = v13 | v25 & 1;
  uint64_t result = sub_1ED7C(v1);
  *(void *)a1 = v29;
  *(void *)(a1 + 8) = v29;
  *(void *)(a1 + 16) = v28;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v9 & 1;
  *(void *)(a1 + 40) = v11;
  *(void *)(a1 + 48) = v20;
  *(void *)(a1 + 56) = v22;
  *(void *)(a1 + 64) = v26;
  *(void *)(a1 + 72) = v24;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = v12;
  return result;
}

uint64_t sub_1ED7C(uint64_t a1)
{
  uint64_t v1 = a1 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_cancellables;
  uint64_t result = swift_beginAccess();
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_4C880();
    uint64_t result = swift_bridgeObjectRelease();
    if (v3) {
      return result;
    }
  }
  else if (*(void *)(*(void *)v1 + 16))
  {
    return result;
  }
  uint64_t v4 = sub_4C750();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  char v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = [self defaultCenter];
  if (qword_66EA0 != -1) {
    swift_once();
  }
  sub_4C760();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_15BB0();
  sub_4BD60();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  return swift_release();
}

uint64_t type metadata accessor for LocationServicesStateListItemProvider()
{
  return self;
}

uint64_t sub_1F000@<X0>(uint64_t a1@<X8>)
{
  sub_1EBB8((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

id sub_1F040()
{
  qword_6B230 = PUILocationStatusChangeNotificationName;
  return PUILocationStatusChangeNotificationName;
}

uint64_t sub_1F058()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1F090()
{
  uint64_t v0 = sub_4890(&qword_67720);
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_4C650();
    uint64_t v6 = sub_4C670();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 0, 1, v6);
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = v5;
    id v8 = v5;
    sub_1C9E8((uint64_t)v3, (uint64_t)&unk_67A28, (uint64_t)v7);
    swift_release();
    sub_4B7C((uint64_t)v3, &qword_67720);
  }
}

void sub_1F1D8()
{
}

uint64_t sub_1F1E0()
{
  return sub_1FBFC(40);
}

uint64_t sub_1F1E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_17D34;
  return sub_1CF6C(a1, v4, v5, v6);
}

uint64_t sub_1F29C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_67720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1F308(unsigned __int8 a1)
{
  sub_4CAD0();
  sub_4CAE0(a1);
  Swift::Int v2 = sub_4CAF0();
  return sub_1F574(a1, v2);
}

unint64_t sub_1F370(uint64_t a1, uint64_t a2)
{
  sub_4CAD0();
  sub_4C560();
  Swift::Int v4 = sub_4CAF0();

  return sub_1F614(a1, a2, v4);
}

unint64_t sub_1F3E8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_4C8A0(*(void *)(v2 + 40));

  return sub_1F6F8(a1, v4);
}

unint64_t sub_1F42C(uint64_t a1)
{
  sub_4CAD0();
  type metadata accessor for CFString(0);
  sub_1FD1C((unint64_t *)&qword_67268, type metadata accessor for CFString);
  sub_4BAC0();
  Swift::Int v2 = sub_4CAF0();

  return sub_1F7C0(a1, v2);
}

unint64_t sub_1F4E0(uint64_t a1)
{
  sub_4C500();
  sub_4CAD0();
  sub_4C560();
  Swift::Int v2 = sub_4CAF0();
  swift_bridgeObjectRelease();

  return sub_1F91C(a1, v2);
}

unint64_t sub_1F574(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1F614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_4CA60() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_4CA60() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1F6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10D3C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_4C8B0();
      sub_1FBA0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1F7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    char v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_1FD1C((unint64_t *)&qword_67268, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_4BAB0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_4BAB0();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1F91C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_4C500();
    uint64_t v8 = v7;
    if (v6 == sub_4C500() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_4CA60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_4C500();
          uint64_t v15 = v14;
          if (v13 == sub_4C500() && v15 == v16) {
            break;
          }
          char v18 = sub_4CA60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_1FA94()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1FACC()
{
  return sub_1FBFC(42);
}

uint64_t sub_1FAD4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 41);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_186D4;
  return sub_1D160(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1FBA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1FBF4()
{
  return sub_1FBFC(64);
}

uint64_t sub_1FBFC(uint64_t a1)
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_1FC48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  id v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_186D4;
  return sub_1DEA4(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1FD1C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1FD64(uint64_t a1, uint64_t a2)
{
  if (&_SRIsDataCollectionEnabled)
  {
    uint64_t v3 = sub_4890(&qword_67720);
    __chkstk_darwin(v3 - 8, v4);
    uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4C650();
    uint64_t v7 = sub_4C670();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = a2;
    swift_retain();
    sub_1C9E8((uint64_t)v6, (uint64_t)&unk_67B78, (uint64_t)v8);
    swift_release();
    sub_17E28((uint64_t)v6);
  }
}

uint64_t sub_1FE8C(uint64_t a1, uint64_t a2)
{
  sub_1222C(0, (unint64_t *)&qword_67540);
  uint64_t v27 = sub_4C710();
  uint64_t v3 = sub_4C400();
  uint64_t v26 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v6 = __chkstk_darwin(v3, v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v24 - v10;
  sub_4C3F0();
  sub_4C410();
  char v25 = *(void (**)(char *, uint64_t))(v4 + 8);
  v25(v11, v3);
  aBlock[4] = sub_213FC;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_130CC;
  aBlock[3] = &unk_5EE90;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v24 = sub_4C3E0();
  uint64_t v13 = *(void *)(v24 - 8);
  __chkstk_darwin(v24, v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4C3C0();
  uint64_t v17 = sub_4C3A0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_13830();
  sub_4890(&qword_67550);
  sub_1387C();
  sub_4C850();
  uint64_t v22 = (void *)v27;
  sub_4C6E0();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v24);
  return ((uint64_t (*)(char *, uint64_t))v25)(v8, v26);
}

uint64_t sub_201E8(uint64_t result)
{
  if (&_SRIsDataCollectionEnabled)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_4890(&qword_67720);
    __chkstk_darwin(v2 - 8, v3);
    uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4C650();
    uint64_t v6 = sub_4C670();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
    uint64_t v7 = (void *)swift_allocObject();
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = v1;
    swift_retain();
    sub_1C9E8((uint64_t)v5, (uint64_t)&unk_67B70, (uint64_t)v7);
    swift_release();
    return sub_17E28((uint64_t)v5);
  }
  return result;
}

uint64_t sub_20310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  sub_4BFE0();
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  sub_4BFD0(v30);
  v28[1] = *(void *)(v1 + 24);
  uint64_t v6 = sub_4890(&qword_67520);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_4BA20();
  __chkstk_darwin(v11 - 8, v12);
  sub_4BA00();
  sub_1358C();
  sub_4B8E0();
  sub_135E0();
  sub_4C840();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_4BFC0(v29);
  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  sub_4BFD0(v31);
  sub_4C010();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_6B268;
  uint64_t v14 = sub_4C160();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19 & 1;
  uint64_t v21 = *(unsigned __int8 *)(v2 + 16);
  uint64_t v22 = sub_4B980();
  __chkstk_darwin(v22 - 8, v23);
  sub_51D0(v21);
  uint64_t result = sub_4C180();
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v21;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v26;
  *(void *)(a1 + 32) = v25 & 1;
  *(void *)(a1 + 40) = v27;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v16;
  *(void *)(a1 + 64) = v20 | 0x4000000000000000;
  *(void *)(a1 + 72) = v18;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 511;
  return result;
}

uint64_t sub_20644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 64) = a4;
  sub_4890(&qword_67720);
  *(void *)(v4 + 72) = swift_task_alloc();
  return _swift_task_switch(sub_206D8, 0, 0);
}

uint64_t sub_206D8()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  if (SRIsDataCollectionEnabled())
  {
    uint64_t v2 = v0[8];
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    v0[6] = sub_21314;
    v0[7] = v3;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_21094;
    v0[5] = &unk_5EE40;
    uint64_t v4 = _Block_copy(v0 + 2);
    swift_retain();
    swift_retain();
    swift_release();
    SRAuthorizationFetchSnapshot();
    _Block_release(v4);
  }
  else
  {
    uint64_t v6 = v0[8];
    uint64_t v5 = v0[9];
    uint64_t v7 = sub_4C670();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
    uint64_t v8 = *(void *)(v1 + 16);
    sub_4C640();
    swift_retain();
    uint64_t v9 = sub_4C630();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = &protocol witness table for MainActor;
    v10[4] = v6;
    v10[5] = v8;
    sub_16074(v5, (uint64_t)&unk_67B48, (uint64_t)v10);
    swift_release();
  }
  swift_release();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_208D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5[2] = a4;
  v5[3] = a5;
  sub_4C640();
  v5[4] = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_215C8, v7, v6);
}

void sub_20968(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_4890(&qword_67720);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_66EF0 != -1) {
      goto LABEL_59;
    }
    goto LABEL_3;
  }
  Swift::String v50 = v11;
  uint64_t v51 = a4;
  uint64_t v17 = (void *)(a3 + 16);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v52 = a1 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(a1 + 32);
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  else {
    uint64_t v20 = -1;
  }
  a2 = v20 & v18;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  id v21 = 0;
  int64_t v53 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v54 = a1;
  BOOL v55 = v17;
LABEL_11:
  if (!a2)
  {
    int64_t v23 = (int64_t)v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_57;
    }
    if (v23 >= v53) {
      goto LABEL_53;
    }
    unint64_t v24 = *(void *)(v52 + 8 * v23);
    int64_t v25 = (int64_t)v21 + 1;
    if (!v24)
    {
      int64_t v25 = (int64_t)v21 + 2;
      if ((uint64_t)v21 + 2 >= v53) {
        goto LABEL_53;
      }
      unint64_t v24 = *(void *)(v52 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = (int64_t)v21 + 3;
        if ((uint64_t)v21 + 3 >= v53) {
          goto LABEL_53;
        }
        unint64_t v24 = *(void *)(v52 + 8 * v25);
        if (!v24)
        {
          uint64_t v26 = (char *)v21 + 4;
          if ((uint64_t)v21 + 4 < v53)
          {
            unint64_t v24 = *(void *)(v52 + 8 * (void)v26);
            if (v24)
            {
              int64_t v25 = (int64_t)v21 + 4;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v25 = (int64_t)(v26 + 1);
              if (__OFADD__(v26, 1)) {
                goto LABEL_58;
              }
              if (v25 >= v53) {
                break;
              }
              unint64_t v24 = *(void *)(v52 + 8 * v25);
              ++v26;
              if (v24) {
                goto LABEL_26;
              }
            }
          }
LABEL_53:
          swift_release();
          uint64_t v44 = sub_4C670();
          uint64_t v45 = (uint64_t)v50;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v50, 1, 1, v44);
          swift_beginAccess();
          uint64_t v46 = *v17;
          sub_4C640();
          uint64_t v47 = v51;
          swift_retain();
          uint64_t v48 = sub_4C630();
          Swift::String v49 = (void *)swift_allocObject();
          v49[2] = v48;
          v49[3] = &protocol witness table for MainActor;
          v49[4] = v47;
          v49[5] = v46;
          sub_16074(v45, (uint64_t)&unk_67B68, (uint64_t)v49);
          swift_release();
          return;
        }
      }
    }
LABEL_26:
    uint64_t v56 = (v24 - 1) & v24;
    unint64_t v57 = v25;
    unint64_t v22 = __clz(__rbit64(v24)) + (v25 << 6);
    goto LABEL_27;
  }
  uint64_t v56 = (a2 - 1) & a2;
  unint64_t v57 = v21;
  unint64_t v22 = __clz(__rbit64(a2)) | ((void)v21 << 6);
LABEL_27:
  uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8 * v22);
  uint64_t v28 = v27 + 64;
  uint64_t v29 = 1 << *(unsigned char *)(v27 + 32);
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  else {
    uint64_t v30 = -1;
  }
  unint64_t v31 = v30 & *(void *)(v27 + 64);
  a2 = (unint64_t)(v29 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v32 = 0;
  while (v31)
  {
    unint64_t v33 = __clz(__rbit64(v31));
    v31 &= v31 - 1;
    unint64_t v34 = v33 | (v32 << 6);
LABEL_32:
    uint64_t v35 = *(void **)(*(void *)(v27 + 56) + 8 * v34);
    sub_1222C(0, &qword_67B58);
    id v36 = objc_allocWithZone((Class)NSNumber);
    id v37 = v35;
    id v38 = [v36 initWithInteger:1];
    char v39 = sub_4C7A0();

    if (v39)
    {
      swift_release();
      uint64_t v17 = v55;
      if (__OFADD__(*v55, 1)) {
        goto LABEL_56;
      }
      ++*v55;
LABEL_10:
      a1 = v54;
      a2 = v56;
      id v21 = v57;
      goto LABEL_11;
    }
  }
  int64_t v40 = v32 + 1;
  if (__OFADD__(v32, 1))
  {
    __break(1u);
    goto LABEL_55;
  }
  if (v40 >= a2) {
    goto LABEL_9;
  }
  unint64_t v41 = *(void *)(v28 + 8 * v40);
  ++v32;
  if (v41) {
    goto LABEL_47;
  }
  int64_t v32 = v40 + 1;
  if (v40 + 1 >= a2) {
    goto LABEL_9;
  }
  unint64_t v41 = *(void *)(v28 + 8 * v32);
  if (v41) {
    goto LABEL_47;
  }
  int64_t v32 = v40 + 2;
  if (v40 + 2 >= a2) {
    goto LABEL_9;
  }
  unint64_t v41 = *(void *)(v28 + 8 * v32);
  if (v41)
  {
LABEL_47:
    unint64_t v31 = (v41 - 1) & v41;
    unint64_t v34 = __clz(__rbit64(v41)) + (v32 << 6);
    goto LABEL_32;
  }
  int64_t v42 = v40 + 3;
  if (v42 >= a2)
  {
LABEL_9:
    swift_release();
    uint64_t v17 = v55;
    goto LABEL_10;
  }
  unint64_t v41 = *(void *)(v28 + 8 * v42);
  if (v41)
  {
    int64_t v32 = v42;
    goto LABEL_47;
  }
  while (1)
  {
    int64_t v32 = v42 + 1;
    if (__OFADD__(v42, 1)) {
      break;
    }
    if (v32 >= a2) {
      goto LABEL_9;
    }
    unint64_t v41 = *(void *)(v28 + 8 * v32);
    ++v42;
    if (v41) {
      goto LABEL_47;
    }
  }
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  swift_once();
LABEL_3:
  uint64_t v12 = sub_4BC10();
  sub_7874(v12, (uint64_t)qword_6B2B8);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v57 = sub_4BBF0();
  os_log_type_t v13 = sub_4C6A0();
  if (os_log_type_enabled(v57, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    v59[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v58 = a2;
    swift_errorRetain();
    sub_4890(&qword_67970);
    uint64_t v15 = sub_4C530();
    uint64_t v58 = sub_1C340(v15, v16, v59);
    sub_4C800();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v57, v13, "Failed to fetch SR authorization snapshot with error: %s.", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    uint64_t v43 = v57;
  }
}

uint64_t sub_20F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5[2] = a4;
  v5[3] = a5;
  sub_4C640();
  v5[4] = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_21028, v7, v6);
}

uint64_t sub_21028()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  sub_1B034(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_21094(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_4890(&qword_67B50);
  uint64_t v5 = sub_4C450();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_21148()
{
  swift_bridgeObjectRelease();
  sub_78F0(v0 + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResearchSensorUsageDataListValueItemProvider()
{
  return self;
}

uint64_t sub_211BC@<X0>(uint64_t a1@<X8>)
{
  sub_20310((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

uint64_t sub_211FC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2120C()
{
  return sub_214C8(48);
}

uint64_t sub_21214(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_208D0(a1, v4, v5, v7, v6);
}

uint64_t sub_212D4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_21314(uint64_t a1, int64_t a2)
{
  sub_20968(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_2131C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2132C()
{
  return swift_release();
}

uint64_t sub_21334()
{
  return sub_214C8(48);
}

uint64_t sub_2133C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_20F90(a1, v4, v5, v7, v6);
}

uint64_t sub_213FC()
{
  return sub_201E8(v0);
}

uint64_t sub_21404()
{
  return sub_214C8(40);
}

uint64_t sub_2140C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_186D4;
  return sub_20644(a1, v4, v5, v6);
}

uint64_t sub_214C0()
{
  return sub_214C8(40);
}

uint64_t sub_214C8(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_21514(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_17D34;
  return sub_20644(a1, v4, v5, v6);
}

uint64_t sub_215D4(uint64_t result)
{
  uint64_t v2 = result;
  if (*(void *)(v1 + 32) != result)
  {
    sub_78AC((void *)(v1 + 56), *(void *)(v1 + 80));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = sub_7144(*(unsigned char *)(v1 + 16));
    sub_4C570(v3);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
  }
  *(void *)(v1 + 32) = v2;
  return result;
}

void sub_216C4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    Swift::String v3 = sub_7530(*(unsigned char *)(Strong + 16));
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = &_swiftEmptySetSingleton;
      sub_21FBC(v3, v1, (uint64_t *)&v6, &v5);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_215D4(v5);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_21784()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_217DC();
    return swift_release();
  }
  return result;
}

void sub_217DC()
{
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    id v1 = [objc_allocWithZone((Class)ADTrackingTransparency) init];
    if ([v1 crossAppTrackingAllowedSwitchEnabled])
    {
      unsigned int v2 = [v1 crossAppTrackingAllowed];
      Swift::String v3 = (unsigned char *)(v0 + 52);
      char v4 = v2;
      if (v2 == *(unsigned __int8 *)(v0 + 52)) {
        goto LABEL_7;
      }
    }
    else
    {
      LOBYTE(v2) = 0;
      char v4 = 0;
      Swift::String v3 = (unsigned char *)(v0 + 52);
      if ((*(unsigned char *)(v0 + 52) & 1) == 0)
      {
LABEL_7:
        *Swift::String v3 = v4;

        return;
      }
    }
    sub_78AC((void *)(v0 + 56), *(void *)(v0 + 80));
    swift_retain();
    sub_4BCC0();
    swift_release();
    char v4 = v2;
    goto LABEL_7;
  }
}

uint64_t sub_218DC()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v18 = v0;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_15BFC();
    uint64_t result = sub_4C680();
    uint64_t v1 = v20;
    uint64_t v3 = v21;
    uint64_t v4 = v22;
    uint64_t v5 = v23;
    unint64_t v6 = v24;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v3 = v1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
      uint64_t v13 = v5;
      goto LABEL_27;
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v14 >= v10) {
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    uint64_t v13 = v5 + 1;
    if (!v15)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        goto LABEL_30;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v13);
      if (!v15)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          goto LABEL_30;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v13);
        if (!v15)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            goto LABEL_30;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v13);
          if (!v15)
          {
            uint64_t v16 = v5 + 5;
            while (v10 != v16)
            {
              unint64_t v15 = *(void *)(v3 + 8 * v16++);
              if (v15)
              {
                uint64_t v13 = v16 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *(void *)(v18 + 40) = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            sub_78F0(v18 + 56);
            swift_bridgeObjectRelease();
            return v18;
          }
        }
      }
    }
LABEL_26:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_27:
    uint64_t v17 = *(void *)(*(void *)(v1 + 48) + 8 * v12);
    swift_retain();
    if (!v17) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      uint64_t result = swift_release();
      uint64_t v5 = v13;
      unint64_t v6 = v11;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v13 = v5;
        uint64_t v11 = v6;
        if (v19) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21B80()
{
  sub_218DC();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TCCAuthorizationListValueItemProvider()
{
  return self;
}

uint64_t sub_21BD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  sub_4C000();
  uint64_t v6 = sub_4C160();
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v9;
  if (*(unsigned char *)(v1 + 16) == 1 && *(unsigned char *)(v1 + 52) != 1)
  {
    unsigned int v24 = v8 & 1;
    unsigned int v25 = 1;
  }
  else
  {
    int v33 = v8;
    uint64_t v34 = v7;
    uint64_t v35 = v6;
    uint64_t v36 = v9;
    sub_4BFE0();
    v39._countAndFlagsBits = 0;
    v39._object = (void *)0xE000000000000000;
    sub_4BFD0(v39);
    uint64_t v37 = *(void *)(v1 + 32);
    uint64_t v13 = sub_4890(&qword_67520);
    uint64_t v32 = (uint64_t)&v32;
    uint64_t v14 = *(void *)(v13 - 8);
    __chkstk_darwin(v13, v15);
    uint64_t v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v18 = sub_4BA20();
    __chkstk_darwin(v18 - 8, v19);
    sub_4BA00();
    sub_1358C();
    sub_4B8E0();
    sub_135E0();
    sub_4C840();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    sub_4BFC0(v38);
    swift_bridgeObjectRelease();
    v40._countAndFlagsBits = 0;
    v40._object = (void *)0xE000000000000000;
    sub_4BFD0(v40);
    sub_4C010();
    if (qword_66ED0 != -1) {
      swift_once();
    }
    id v20 = (id)qword_6B268;
    uint64_t v10 = sub_4C160();
    uint64_t v11 = v21;
    uint64_t v12 = v22;
    unsigned int v24 = v23 & 1;
    sub_87CC(v35, v34, v33 & 1);
    swift_bridgeObjectRelease();
    unsigned int v25 = *(unsigned __int8 *)(v1 + 16);
  }
  uint64_t v26 = sub_4B980();
  __chkstk_darwin(v26 - 8, v27);
  sub_51D0(v25);
  uint64_t result = sub_4C180();
  *(void *)a1 = *(unsigned __int8 *)(v2 + 16);
  *(void *)(a1 + 8) = v25;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v30;
  *(void *)(a1 + 32) = v29 & 1;
  *(void *)(a1 + 40) = v31;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v24 | 0x4000000000000000;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 511;
  return result;
}

void sub_21FBC(void *a1, uint64_t a2, uint64_t *a3, void *a4)
{
  if (!*(void *)(a2 + 16)) {
    return;
  }
  id v43 = a1;
  unint64_t v7 = sub_1F42C((uint64_t)v43);
  if ((v8 & 1) == 0)
  {

    return;
  }
  uint64_t v9 = *(void *)(*(void *)(a2 + 56) + 8 * v7);
  swift_bridgeObjectRetain();

  uint64_t v37 = *(void *)(v9 + 16);
  if (!v37)
  {
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v10 = 0;
  uint64_t v35 = v9;
  uint64_t v36 = v9 + 32;
  Swift::String v39 = a4;
  Swift::String v40 = a3;
  while (2)
  {
    if (v10 >= *(void *)(v9 + 16))
    {
LABEL_61:
      __break(1u);
      return;
    }
    uint64_t v11 = *(void *)(v36 + 8 * v10);
    unint64_t v38 = v10 + 1;
    uint64_t v41 = v11 + 64;
    uint64_t v12 = 1 << *(unsigned char *)(v11 + 32);
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & *(void *)(v11 + 64);
    uint64_t v44 = (void *)v11;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    swift_beginAccess();
    int64_t v15 = 0;
    int64_t v42 = (unint64_t)(v12 + 63) >> 6;
    while (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v15 << 6);
LABEL_28:
      uint64_t v21 = (Swift::Int *)(v44[6] + 16 * v17);
      Swift::Int v23 = *v21;
      Swift::Int v22 = v21[1];
      uint64_t v24 = *(void *)(v44[7] + 8 * v17);
      uint64_t v25 = *a3;
      if (*(void *)(*a3 + 16))
      {
        sub_4CAD0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_4C560();
        Swift::Int v26 = sub_4CAF0();
        uint64_t v27 = -1 << *(unsigned char *)(v25 + 32);
        unint64_t v28 = v26 & ~v27;
        if (((*(void *)(v25 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
        {
          swift_bridgeObjectRelease();
          a3 = v40;
          goto LABEL_45;
        }
        uint64_t v29 = *(void *)(v25 + 48);
        uint64_t v30 = (void *)(v29 + 16 * v28);
        BOOL v31 = *v30 == v23 && v30[1] == v22;
        if (!v31 && (sub_4CA60() & 1) == 0)
        {
          uint64_t v32 = ~v27;
          while (1)
          {
            unint64_t v28 = (v28 + 1) & v32;
            if (((*(void *)(v25 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
              break;
            }
            int v33 = (void *)(v29 + 16 * v28);
            BOOL v34 = *v33 == v23 && v33[1] == v22;
            if (v34 || (sub_4CA60() & 1) != 0) {
              goto LABEL_11;
            }
          }
          swift_bridgeObjectRelease();
          a4 = v39;
          a3 = v40;
          goto LABEL_45;
        }
LABEL_11:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a4 = v39;
        a3 = v40;
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_45:
        if ((unint64_t)(v24 - 2) >= 3)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          if (__OFADD__(*a4, 1)) {
            goto LABEL_59;
          }
          ++*a4;
          swift_beginAccess();
          sub_22440(&v45, v23, v22);
          swift_endAccess();
          swift_bridgeObjectRelease();
        }
      }
    }
    int64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    if (v18 >= v42) {
      goto LABEL_5;
    }
    unint64_t v19 = *(void *)(v41 + 8 * v18);
    ++v15;
    if (v19) {
      goto LABEL_27;
    }
    int64_t v15 = v18 + 1;
    if (v18 + 1 >= v42) {
      goto LABEL_5;
    }
    unint64_t v19 = *(void *)(v41 + 8 * v15);
    if (v19) {
      goto LABEL_27;
    }
    int64_t v15 = v18 + 2;
    if (v18 + 2 >= v42) {
      goto LABEL_5;
    }
    unint64_t v19 = *(void *)(v41 + 8 * v15);
    if (v19)
    {
LABEL_27:
      unint64_t v14 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v15 << 6);
      goto LABEL_28;
    }
    int64_t v20 = v18 + 3;
    if (v20 < v42)
    {
      unint64_t v19 = *(void *)(v41 + 8 * v20);
      if (!v19)
      {
        while (1)
        {
          int64_t v15 = v20 + 1;
          if (__OFADD__(v20, 1)) {
            goto LABEL_60;
          }
          if (v15 >= v42) {
            goto LABEL_5;
          }
          unint64_t v19 = *(void *)(v41 + 8 * v15);
          ++v20;
          if (v19) {
            goto LABEL_27;
          }
        }
      }
      int64_t v15 = v20;
      goto LABEL_27;
    }
LABEL_5:
    swift_release();
    uint64_t v9 = v35;
    unint64_t v10 = v38;
    if (v38 != v37) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_223E8@<X0>(uint64_t a1@<X8>)
{
  sub_21BD8((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

id sub_22428()
{
  qword_6B238 = PUITrackingStatusChangeNotificationName;
  return PUITrackingStatusChangeNotificationName;
}

uint64_t sub_22440(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_4CAD0();
  swift_bridgeObjectRetain();
  sub_4C560();
  Swift::Int v8 = sub_4CAF0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_4CA60() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      int64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_4CA60() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_228D0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_225F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4890(&qword_67C58);
  uint64_t v3 = sub_4C8E0();
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_4CAD0();
      sub_4C560();
      uint64_t result = sub_4CAF0();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_228D0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_225F0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_22A6C();
      goto LABEL_22;
    }
    sub_22C20();
  }
  uint64_t v11 = *v4;
  sub_4CAD0();
  sub_4C560();
  uint64_t result = sub_4CAF0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_4CA60(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_4CA70();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_4CA60();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_22A6C()
{
  uint64_t v1 = v0;
  sub_4890(&qword_67C58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4C8D0();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_22C20()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4890(&qword_67C58);
  uint64_t v3 = sub_4C8E0();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_4CAD0();
    swift_bridgeObjectRetain();
    sub_4C560();
    uint64_t result = sub_4CAF0();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
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

uint64_t sub_22ED0(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_4BD00();
  swift_release();
  swift_release();
  LOBYTE(a1) = sub_E880(a1, v5);
  uint64_t result = swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
  {
    uint64_t result = swift_beginAccess();
    uint64_t v4 = *(void *)(v1 + 72);
    if (v4)
    {
      sub_78AC((void *)(v1 + 48), v4);
      swift_retain();
      sub_4BCC0();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22FD0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_4BD00();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23044@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_4BD00();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_230C4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_22ED0(v0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_4BD10();
}

uint64_t sub_23144()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = 0xD00000000000001CLL;
  *(void *)(v0 + 24) = 0x8000000000051B90;
  *(_DWORD *)(v0 + 32) = 0;
  uint64_t v2 = (int *)(v0 + 32);
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  uint64_t v3 = v0 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings24TCCAuthorizationProvider__authorizationDictionary;
  unint64_t v4 = sub_3B1D0((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v5 = sub_4890(&qword_67D68);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = v4;
  sub_4890((uint64_t *)&unk_67CA8);
  sub_4BCE0();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3, v9, v5);
  sub_2431C();
  uint64_t v10 = sub_4C710();
  aBlock[4] = sub_2435C;
  aBlock[5] = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3B6C0;
  aBlock[3] = &unk_5EFC8;
  int64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  unint64_t v12 = (const char *)(sub_4C550() + 32);
  swift_beginAccess();
  notify_register_dispatch(v12, v2, v10, v11);
  swift_endAccess();
  swift_release();
  _Block_release(v11);

  sub_24364();
  int64_t v13 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = v14;

  return v1;
}

uint64_t sub_23388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_4890(&qword_67720);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4C650();
  uint64_t v7 = sub_4C670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  swift_retain();
  sub_1C9E8((uint64_t)v6, (uint64_t)&unk_67D78, (uint64_t)v8);
  swift_release();
  return sub_4B7C((uint64_t)v6, &qword_67720);
}

uint64_t sub_234A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_234C0, 0, 0);
}

uint64_t sub_234C0()
{
  sub_23520();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23520()
{
  uint64_t result = tcc_server_create();
  if (result)
  {
    if (tcc_message_options_create())
    {
      uint64_t v2 = swift_allocObject();
      *(void *)(v2 + 16) = sub_3B1D0((uint64_t)_swiftEmptyArrayStorage);
      tcc_message_options_set_reply_handler_policy();
      uint64_t v3 = *(void **)(v0 + 40);
      if (v3) {
        uint64_t v4 = *(void **)(v0 + 40);
      }
      else {
        uint64_t v4 = (void *)sub_4C5C0();
      }
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v2;
      *(void *)(v5 + 24) = v0;
      v8[4] = sub_241A0;
      _OWORD v8[5] = v5;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 1107296256;
      v8[2] = sub_23E1C;
      v8[3] = &unk_5EF78;
      uint64_t v6 = _Block_copy(v8);
      id v7 = v3;
      swift_unknownObjectRetain();
      swift_retain();
      swift_retain();
      swift_release();
      tcc_server_message_get_authorization_records_by_services();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      _Block_release(v6);
      swift_release();

      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void sub_236EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_4890(&qword_67720);
  __chkstk_darwin(v8 - 8, v9);
  int64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v12 = qword_66EF0;
    id v13 = a2;
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_4BC10();
    sub_7874(v14, (uint64_t)qword_6B2B8);
    Swift::String v49 = v13;
    unint64_t v15 = sub_4BBF0();
    os_log_type_t v16 = sub_4C6A0();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v17 = 136315138;
      Swift::String v50 = v49;
      type metadata accessor for CFError(0);
      sub_242C8();
      uint64_t v18 = sub_4CAB0();
      Swift::String v50 = (void *)sub_1C340(v18, v19, v51);
      sub_4C800();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v15, v16, "Failed tcc request with error %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v39 = v49;
    }
    return;
  }
  uint64_t v20 = (void *)(a3 + 16);
  if (!a1)
  {
    uint64_t v40 = sub_4C670();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v11, 1, 1, v40);
    swift_beginAccess();
    uint64_t v41 = (void *)*v20;
    sub_4C640();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v42 = sub_4C630();
    id v43 = (void *)swift_allocObject();
    v43[2] = v42;
    v43[3] = &protocol witness table for MainActor;
    v43[4] = a4;
    v43[5] = v41;
    sub_16074((uint64_t)v11, (uint64_t)&unk_67D50, (uint64_t)v43);
    swift_release();
    return;
  }
  swift_unknownObjectRetain();
  if ((id)tcc_authorization_record_get_subject_identity())
  {
    if ((id)tcc_authorization_record_get_service())
    {
      uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
      tcc_service_get_name();
      sub_4C580();
      uint64_t v22 = (void *)sub_4C4D0();
      swift_bridgeObjectRelease();
      tcc_identity_get_identifier();
      uint64_t v23 = sub_4C580();
      uint64_t v25 = v24;
      sub_4890(&qword_67D58);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_4E890;
      *(void *)(inited + 32) = v23;
      *(void *)(inited + 40) = v25;
      *(void *)(inited + 48) = authorization_right;
      id v27 = v22;
      unint64_t v28 = sub_3B2DC(inited);
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::String v50 = (void *)*v20;
      uint64_t v30 = v50;
      *uint64_t v20 = 0x8000000000000000;
      unint64_t v32 = sub_1F42C((uint64_t)v27);
      uint64_t v33 = v30[2];
      BOOL v34 = (v31 & 1) == 0;
      uint64_t v35 = v33 + v34;
      if (__OFADD__(v33, v34))
      {
        __break(1u);
      }
      else
      {
        char v36 = v31;
        if (v30[3] >= v35)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_103CC();
            uint64_t v30 = v50;
          }
        }
        else
        {
          sub_F7E8(v35, isUniquelyReferenced_nonNull_native);
          uint64_t v30 = v50;
          unint64_t v37 = sub_1F42C((uint64_t)v27);
          if ((v36 & 1) != (v38 & 1))
          {
            type metadata accessor for CFString(0);
            sub_4CA80();
            __break(1u);
            return;
          }
          unint64_t v32 = v37;
        }
        *uint64_t v20 = v30;
        swift_bridgeObjectRelease();
        uint64_t v44 = (void *)*v20;
        swift_bridgeObjectRetain();
        if ((v36 & 1) == 0)
        {
          sub_147A4(v32, (uint64_t)v27, (uint64_t)_swiftEmptyArrayStorage, v44);
          id v45 = v27;
        }
        uint64_t inited = v44[7];
        swift_bridgeObjectRelease();
        uint64_t v30 = *(void **)(inited + 8 * v32);
        char v46 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(inited + 8 * v32) = v30;
        if (v46) {
          goto LABEL_26;
        }
      }
      uint64_t v30 = sub_46BA0(0, v30[2] + 1, 1, v30);
      *(void *)(inited + 8 * v32) = v30;
LABEL_26:
      unint64_t v48 = v30[2];
      unint64_t v47 = v30[3];
      if (v48 >= v47 >> 1)
      {
        uint64_t v30 = sub_46BA0((void *)(v47 > 1), v48 + 1, 1, v30);
        *(void *)(inited + 8 * v32) = v30;
      }
      void v30[2] = v48 + 1;
      v30[v48 + 4] = v28;
      swift_endAccess();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    swift_unknownObjectRelease();
  }

  swift_unknownObjectRelease();
}

uint64_t sub_23CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  sub_4C640();
  v5[5] = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_23D58, v7, v6);
}

uint64_t sub_23D58()
{
  uint64_t v1 = v0[4];
  swift_release();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_22ED0(v2);
  swift_getKeyPath();
  swift_getKeyPath();
  v0[2] = v1;
  swift_retain();
  sub_4BD10();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_23E1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_23E9C()
{
  swift_bridgeObjectRelease();

  sub_4B7C(v0 + 48, &qword_67D80);
  uint64_t v1 = v0 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings24TCCAuthorizationProvider__authorizationDictionary;
  uint64_t v2 = sub_4890(&qword_67D68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_23F60()
{
  return type metadata accessor for TCCAuthorizationProvider();
}

uint64_t type metadata accessor for TCCAuthorizationProvider()
{
  uint64_t result = qword_67C90;
  if (!qword_67C90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_23FB4()
{
  sub_24070();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24070()
{
  if (!qword_67CA0)
  {
    sub_4950((uint64_t *)&unk_67CA8);
    unint64_t v0 = sub_4BD20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_67CA0);
    }
  }
}

void *sub_240CC()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_240D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_4BCB0();
  *a1 = result;
  return result;
}

uint64_t sub_24128()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_24160()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_241A0(uint64_t a1, void *a2)
{
  sub_236EC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_241A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_241B8()
{
  return swift_release();
}

uint64_t sub_241C0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_24208(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_17D34;
  return sub_23CC0(a1, v4, v5, v7, v6);
}

unint64_t sub_242C8()
{
  unint64_t result = qword_67D60;
  if (!qword_67D60)
  {
    type metadata accessor for CFError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67D60);
  }
  return result;
}

unint64_t sub_2431C()
{
  unint64_t result = qword_67540;
  if (!qword_67540)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_67540);
  }
  return result;
}

uint64_t sub_2435C(uint64_t a1)
{
  return sub_23388(a1, v1);
}

void sub_24364()
{
  uint64_t v0 = 36;
  uint64_t v1 = &byte_5E0A0;
  do
  {
    char v2 = *v1++;
    uint64_t v3 = sub_7530(v2);
    if (v3)
    {
      id v4 = v3;
      sub_4C5B0();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_4C5F0();
      }
      sub_4C610();
      sub_4C5E0();
    }
    --v0;
  }
  while (v0);
  if (kTCCServicePhotosAdd)
  {
    id v5 = kTCCServicePhotosAdd;
    sub_4C5B0();
    if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
      sub_4C5F0();
    }
    sub_4C610();
    sub_4C5E0();
    type metadata accessor for CFString(0);
    sub_4C5C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_244C0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_24500()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_186D4;
  v3[2] = v2;
  return _swift_task_switch(sub_234C0, 0, 0);
}

id sub_245B0()
{
  id result = (id)kTCCServicePhotosAdd;
  if (kTCCServicePhotosAdd)
  {
    qword_67D88 = kTCCServicePhotosAdd;
    return kTCCServicePhotosAdd;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_245D0(uint64_t result)
{
  uint64_t v2 = result;
  if (*(void *)(v1 + 32) != result)
  {
    sub_78AC((void *)(v1 + 72), *(void *)(v1 + 96));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = sub_7144(*(unsigned char *)(v1 + 16));
    sub_4C570(v3);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    id result = swift_release();
  }
  *(void *)(v1 + 32) = v2;
  return result;
}

uint64_t sub_246C0(uint64_t result)
{
  uint64_t v2 = result;
  if (*(void *)(v1 + 40) != result)
  {
    sub_78AC((void *)(v1 + 72), *(void *)(v1 + 96));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = sub_7144(*(unsigned char *)(v1 + 16));
    sub_4C570(v3);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    id result = swift_release();
  }
  *(void *)(v1 + 40) = v2;
  return result;
}

uint64_t sub_247B0(uint64_t result)
{
  uint64_t v2 = result;
  if (*(void *)(v1 + 48) != result)
  {
    sub_78AC((void *)(v1 + 72), *(void *)(v1 + 96));
    sub_4C900(16);
    swift_bridgeObjectRelease();
    v3._countAndFlagsBits = sub_7144(*(unsigned char *)(v1 + 16));
    sub_4C570(v3);
    swift_bridgeObjectRelease();
    swift_retain();
    sub_4BCC0();
    swift_bridgeObjectRelease();
    id result = swift_release();
  }
  *(void *)(v1 + 48) = v2;
  return result;
}

uint64_t sub_248A0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_24900(v1);
    return swift_release();
  }
  return result;
}

void sub_24900(uint64_t a1)
{
  Swift::String v3 = sub_7530(*(unsigned char *)(v1 + 16));
  if (v3)
  {
    id v4 = v3;
    uint64_t v7 = 0;
    uint64_t v8 = &_swiftEmptySetSingleton;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    sub_25650(v3, a1, (uint64_t *)&v8, &v6, &v7, &v5);
    if (*(unsigned char *)(v1 + 16) == 7)
    {
      if (qword_66EB0 != -1) {
        swift_once();
      }
      sub_25650((void *)qword_67D88, a1, (uint64_t *)&v8, &v6, &v7, &v5);
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_245D0(v7);
    swift_beginAccess();
    sub_246C0(v6);
    swift_beginAccess();
    sub_247B0(v5);
  }
}

uint64_t sub_24A24()
{
  if (*(void *)(v0 + 56))
  {
    swift_retain();
    sub_4BC90();
    swift_release();
  }
  swift_release();
  swift_release();
  sub_78F0(v0 + 72);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TCCAuthorizationSubtitleListItemProvider()
{
  return self;
}

uint64_t sub_24AC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4BFF0();
  __chkstk_darwin(v4 - 8, v5);
  sub_4C000();
  uint64_t v6 = sub_4C160();
  uint64_t v9 = v6;
  uint64_t v10 = v7;
  uint64_t v11 = *(void *)(v1 + 40);
  uint64_t v12 = *(void *)(v1 + 48);
  char v41 = v8;
  if (!*(void *)(v1 + 32))
  {
    if (v12)
    {
      if (v11)
      {
        sub_4BFE0();
        v44._countAndFlagsBits = 0;
        v44._object = (void *)0xE000000000000000;
        sub_4BFD0(v44);
        sub_4BFB0();
        v45._countAndFlagsBits = 0x646574696D696C20;
        v45._object = (void *)0xEA0000000000202CLL;
        sub_4BFD0(v45);
        sub_4BFB0();
        v46._countAndFlagsBits = 0x6C6E6F2064646120;
        v46._object = (void *)0xE900000000000079;
        sub_4BFD0(v46);
        sub_4C010();
        if (qword_66ED0 == -1) {
          goto LABEL_28;
        }
      }
      else
      {
        sub_4BFE0();
        v56._countAndFlagsBits = 0;
        v56._object = (void *)0xE000000000000000;
        sub_4BFD0(v56);
        sub_4BFB0();
        v57._countAndFlagsBits = 0x646574696D696C20;
        v57._object = (void *)0xE800000000000000;
        sub_4BFD0(v57);
        sub_4C010();
        if (qword_66ED0 == -1) {
          goto LABEL_28;
        }
      }
    }
    else
    {
      if (!v11)
      {
        char v22 = v8;
        sub_4C000();
        if (qword_66ED0 != -1) {
          swift_once();
        }
        id v23 = (id)qword_6B268;
        uint64_t v15 = sub_4C160();
        uint64_t v17 = v24;
        char v19 = v25;
        uint64_t v21 = v26;
        char v27 = v22 & 1;
        goto LABEL_29;
      }
      sub_4BFE0();
      v51._countAndFlagsBits = 0;
      v51._object = (void *)0xE000000000000000;
      sub_4BFD0(v51);
      sub_4BFB0();
      v52._countAndFlagsBits = 0x6C6E6F2064646120;
      v52._object = (void *)0xE900000000000079;
      sub_4BFD0(v52);
      sub_4C010();
      if (qword_66ED0 == -1) {
        goto LABEL_28;
      }
    }
    goto LABEL_34;
  }
  if (!(v12 | v11))
  {
    unsigned int v13 = *(unsigned __int8 *)(v1 + 16);
    if (v13 <= 0x15 && ((1 << v13) & 0x20C140) != 0)
    {
      sub_4BFE0();
      v42._countAndFlagsBits = 0;
      v42._object = (void *)0xE000000000000000;
      sub_4BFD0(v42);
      sub_4BFB0();
      v43._countAndFlagsBits = 0x7370706120;
      v43._object = (void *)0xE500000000000000;
      sub_4BFD0(v43);
      sub_4C010();
      if (qword_66ED0 == -1) {
        goto LABEL_28;
      }
      goto LABEL_34;
    }
    sub_4BFE0();
    v61._countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    sub_4BFD0(v61);
    sub_4BFB0();
    v62._countAndFlagsBits = 0x6361206C6C756620;
    v62._object = (void *)0xEC00000073736563;
    sub_4BFD0(v62);
    sub_4C010();
    if (qword_66ED0 == -1)
    {
LABEL_28:
      id v28 = (id)qword_6B268;
      uint64_t v15 = sub_4C160();
      uint64_t v17 = v29;
      char v19 = v30;
      uint64_t v21 = v31;
      char v27 = v41 & 1;
LABEL_29:
      sub_87CC(v9, v10, v27);
      goto LABEL_30;
    }
LABEL_34:
    swift_once();
    goto LABEL_28;
  }
  if (!v12)
  {
    sub_4BFE0();
    v53._countAndFlagsBits = 0;
    v53._object = (void *)0xE000000000000000;
    sub_4BFD0(v53);
    sub_4BFB0();
    v54._countAndFlagsBits = 0x6361206C6C756620;
    v54._object = (void *)0xEE00202C73736563;
    sub_4BFD0(v54);
    sub_4BFB0();
    v55._countAndFlagsBits = 0x6C6E6F2064646120;
    v55._object = (void *)0xE900000000000079;
    sub_4BFD0(v55);
    sub_4C010();
    if (qword_66ED0 == -1) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
  uint64_t v39 = v6;
  uint64_t v40 = v7;
  if (v11)
  {
    sub_4BFE0();
    v47._countAndFlagsBits = 0;
    v47._object = (void *)0xE000000000000000;
    sub_4BFD0(v47);
    sub_4BFB0();
    v48._countAndFlagsBits = 0x6361206C6C756620;
    v48._object = (void *)0xEE00202C73736563;
    sub_4BFD0(v48);
    sub_4BFB0();
    v49._countAndFlagsBits = 0x646574696D696C20;
    v49._object = (void *)0xEA0000000000202CLL;
    sub_4BFD0(v49);
    sub_4BFB0();
    v50._countAndFlagsBits = 0x6C6E6F2064646120;
    v50._object = (void *)0xE900000000000079;
    sub_4BFD0(v50);
    sub_4C010();
    if (qword_66ED0 == -1) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
  sub_4BFE0();
  v58._countAndFlagsBits = 0;
  v58._object = (void *)0xE000000000000000;
  sub_4BFD0(v58);
  sub_4BFB0();
  v59._countAndFlagsBits = 0x6361206C6C756620;
  v59._object = (void *)0xEE00202C73736563;
  sub_4BFD0(v59);
  sub_4BFB0();
  v60._countAndFlagsBits = 0x646574696D696C20;
  v60._object = (void *)0xE800000000000000;
  sub_4BFD0(v60);
  sub_4C010();
  if (qword_66ED0 != -1) {
LABEL_35:
  }
    swift_once();
LABEL_23:
  id v14 = (id)qword_6B268;
  uint64_t v15 = sub_4C160();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  sub_87CC(v39, v40, v41 & 1);
LABEL_30:
  swift_bridgeObjectRelease();
  uint64_t v32 = *(unsigned __int8 *)(v2 + 16);
  uint64_t v33 = sub_4B980();
  __chkstk_darwin(v33 - 8, v34);
  sub_51D0(v32);
  uint64_t result = sub_4C180();
  *(void *)a1 = *(unsigned __int8 *)(v2 + 16);
  *(void *)(a1 + 8) = v32;
  *(void *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v37;
  *(void *)(a1 + 32) = v36 & 1;
  *(void *)(a1 + 40) = v38;
  *(void *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v17;
  *(void *)(a1 + 64) = v19 & 1 | 0x8000000000000000;
  *(void *)(a1 + 72) = v21;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 255;
  return result;
}

uint64_t sub_25610@<X0>(uint64_t a1@<X8>)
{
  sub_24AC0((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

void sub_25650(void *a1, uint64_t a2, uint64_t *a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (!*(void *)(a2 + 16)) {
    return;
  }
  id v53 = a1;
  unint64_t v11 = sub_1F42C((uint64_t)v53);
  if ((v12 & 1) == 0)
  {

    return;
  }
  uint64_t v13 = *(void *)(*(void *)(a2 + 56) + 8 * v11);
  swift_bridgeObjectRetain();

  uint64_t v51 = *(void *)(v13 + 16);
  if (!v51)
  {
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v14 = 0;
  uint64_t v49 = v13;
  uint64_t v50 = v13 + 32;
  Swift::String v55 = a6;
  Swift::String v56 = a5;
  Swift::String v57 = a4;
  while (2)
  {
    if (v14 >= *(void *)(v13 + 16))
    {
LABEL_89:
      __break(1u);
      return;
    }
    uint64_t v15 = *(void *)(v50 + 8 * v14);
    unint64_t v52 = v14 + 1;
    uint64_t v58 = v15 + 64;
    uint64_t v16 = 1 << *(unsigned char *)(v15 + 32);
    if (v16 < 64) {
      uint64_t v17 = ~(-1 << v16);
    }
    else {
      uint64_t v17 = -1;
    }
    unint64_t v18 = v17 & *(void *)(v15 + 64);
    uint64_t v60 = v15;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    swift_beginAccess();
    swift_beginAccess();
    swift_beginAccess();
    swift_beginAccess();
    swift_beginAccess();
    swift_beginAccess();
    swift_beginAccess();
    int64_t v19 = 0;
    unint64_t v20 = v16 + 63;
    unint64_t v21 = v18;
    char v22 = v56;
    int64_t v59 = v20 >> 6;
    while (1)
    {
      if (v21)
      {
        unint64_t v23 = __clz(__rbit64(v21));
        v21 &= v21 - 1;
        unint64_t v24 = v23 | (v19 << 6);
        goto LABEL_28;
      }
      int64_t v25 = v19 + 1;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
        goto LABEL_89;
      }
      if (v25 >= v59) {
        goto LABEL_5;
      }
      unint64_t v26 = *(void *)(v58 + 8 * v25);
      ++v19;
      if (!v26)
      {
        int64_t v19 = v25 + 1;
        if (v25 + 1 >= v59) {
          goto LABEL_5;
        }
        unint64_t v26 = *(void *)(v58 + 8 * v19);
        if (!v26)
        {
          int64_t v19 = v25 + 2;
          if (v25 + 2 >= v59) {
            goto LABEL_5;
          }
          unint64_t v26 = *(void *)(v58 + 8 * v19);
          if (!v26) {
            break;
          }
        }
      }
LABEL_27:
      unint64_t v21 = (v26 - 1) & v26;
      unint64_t v24 = __clz(__rbit64(v26)) + (v19 << 6);
LABEL_28:
      id v28 = (Swift::Int *)(*(void *)(v60 + 48) + 16 * v24);
      Swift::Int v30 = *v28;
      Swift::Int v29 = v28[1];
      uint64_t v31 = *(void *)(*(void *)(v60 + 56) + 8 * v24);
      uint64_t v32 = *a3;
      if (!*(void *)(*a3 + 16))
      {
        swift_bridgeObjectRetain();
        if (v31 == 4) {
          goto LABEL_69;
        }
        goto LABEL_40;
      }
      uint64_t v61 = v19;
      uint64_t v33 = a3;
      sub_4CAD0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_4C560();
      Swift::Int v34 = sub_4CAF0();
      uint64_t v35 = -1 << *(unsigned char *)(v32 + 32);
      unint64_t v36 = v34 & ~v35;
      uint64_t v37 = v32 + 56;
      if (((*(void *)(v32 + 56 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
      uint64_t v38 = *(void *)(v32 + 48);
      uint64_t v39 = (void *)(v38 + 16 * v36);
      BOOL v40 = *v39 == v30 && v39[1] == v29;
      if (v40 || (sub_4CA60() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char v22 = v56;
        a4 = v57;
        a3 = v33;
        int64_t v19 = v61;
      }
      else
      {
        uint64_t v54 = ~v35;
        unint64_t v43 = (v36 + 1) & ~v35;
        if ((*(void *)(v37 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43))
        {
          Swift::String v44 = (void *)(v38 + 16 * v43);
          BOOL v45 = *v44 == v30 && v44[1] == v29;
          a3 = v33;
          int64_t v19 = v61;
          if (!v45)
          {
            while ((sub_4CA60() & 1) == 0)
            {
              unint64_t v43 = (v43 + 1) & v54;
              if (((*(void *)(v37 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0)
              {
                swift_bridgeObjectRelease();
                char v22 = v56;
                a4 = v57;
                if (v31 != 4) {
                  goto LABEL_40;
                }
                goto LABEL_69;
              }
              Swift::String v46 = (void *)(v38 + 16 * v43);
              if (*v46 == v30 && v46[1] == v29) {
                break;
              }
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          char v22 = v56;
          a4 = v57;
        }
        else
        {
          swift_bridgeObjectRelease();
          char v22 = v56;
LABEL_39:
          a4 = v57;
          a3 = v33;
          int64_t v19 = v61;
          if (v31 == 4)
          {
LABEL_69:
            uint64_t v41 = *a4 + 1;
            if (__OFADD__(*a4, 1)) {
              goto LABEL_85;
            }
            goto LABEL_70;
          }
LABEL_40:
          if (v31 == 3)
          {
            Swift::String v42 = v55;
            uint64_t v41 = *v55 + 1;
            if (__OFADD__(*v55, 1)) {
              goto LABEL_84;
            }
LABEL_71:
            *Swift::String v42 = v41;
            if (*v22 > 0) {
              goto LABEL_11;
            }
LABEL_72:
            if ((uint64_t)*a4 > 0 || *v55 >= 1) {
              goto LABEL_11;
            }
LABEL_74:
            swift_bridgeObjectRelease();
          }
          else
          {
            if (v31 != 2) {
              goto LABEL_74;
            }
            type metadata accessor for CFString(0);
            if (qword_66EB0 != -1) {
              swift_once();
            }
            sub_10E04();
            if (sub_4BAB0())
            {
              uint64_t v41 = *a4 + 1;
              if (__OFADD__(*a4, 1)) {
                goto LABEL_87;
              }
LABEL_70:
              Swift::String v42 = a4;
              goto LABEL_71;
            }
            uint64_t v48 = *v22 + 1;
            if (__OFADD__(*v22, 1)) {
              goto LABEL_88;
            }
            *char v22 = v48;
            if (v48 <= 0) {
              goto LABEL_72;
            }
LABEL_11:
            swift_beginAccess();
            sub_22440(&v62, v30, v29);
            swift_endAccess();
            swift_bridgeObjectRelease();
          }
        }
      }
    }
    int64_t v27 = v25 + 3;
    if (v27 < v59)
    {
      unint64_t v26 = *(void *)(v58 + 8 * v27);
      if (!v26)
      {
        while (1)
        {
          int64_t v19 = v27 + 1;
          if (__OFADD__(v27, 1)) {
            goto LABEL_86;
          }
          if (v19 >= v59) {
            goto LABEL_5;
          }
          unint64_t v26 = *(void *)(v58 + 8 * v19);
          ++v27;
          if (v26) {
            goto LABEL_27;
          }
        }
      }
      int64_t v19 = v27;
      goto LABEL_27;
    }
LABEL_5:
    swift_release();
    uint64_t v13 = v49;
    unint64_t v14 = v52;
    if (v52 != v51) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
}

id sub_25C78@<X0>(uint64_t a1@<X8>)
{
  id v3 = [self currentDevice];
  unsigned int v4 = objc_msgSend(v3, "sf_isiPhone");

  if (!v4) {
    goto LABEL_4;
  }
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v6 = result;
    unsigned __int8 v7 = [result isPhoneMirroringActive];

    if ((v7 & 1) == 0)
    {
      sub_4C000();
      if (qword_66ED0 != -1) {
        swift_once();
      }
      uint64_t v35 = v1;
      id v13 = (id)qword_6B268;
      uint64_t v9 = sub_4C160();
      uint64_t v10 = v14;
      uint64_t v12 = v15;
      uint64_t v11 = v16 & 1;
      uint64_t v17 = sub_4B980();
      v34[3] = v34;
      __chkstk_darwin(v17 - 8, v18);
      uint64_t v19 = sub_4C4C0();
      v34[2] = v34;
      __chkstk_darwin(v19 - 8, v20);
      sub_4C4B0();
      if (qword_66ED8 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_4B970();
      uint64_t v22 = sub_7874(v21, (uint64_t)qword_6B270);
      v34[1] = v34;
      __chkstk_darwin(v22, v22);
      (*(void (**)(char *))(v24 + 16))((char *)v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v25 = sub_4BA20();
      __chkstk_darwin(v25 - 8, v26);
      sub_4BA10();
      sub_4B990();
      uint64_t v27 = sub_4C180();
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      uint64_t v33 = v32 & 1;
      uint64_t v8 = *(unsigned __int8 *)(v35 + 16);
      sub_4890(&qword_67578);
      id result = (id)swift_allocObject();
      *((_OWORD *)result + 1) = xmmword_4E890;
      *((unsigned char *)result + 32) = 26;
      *((void *)result + 5) = 26;
      *((void *)result + 6) = v27;
      *((void *)result + 7) = v29;
      *((void *)result + 8) = v33;
      *((void *)result + 9) = v31;
      *((void *)result + 10) = 0;
      *((void *)result + 11) = 0;
      *((void *)result + 12) = 255;
      *((void *)result + 14) = 0;
      *((void *)result + 15) = 0;
      *((void *)result + 13) = 0;
      *((_WORD *)result + 64) = 0;
      goto LABEL_10;
    }
LABEL_4:
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    id result = 0;
LABEL_10:
    *(void *)a1 = v8;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    *(void *)(a1 + 72) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for SafetyCheckListSectionModelProvider()
{
  return self;
}

uint64_t sub_260F0@<X0>(uint64_t a1@<X8>)
{
  sub_25C78((uint64_t)v3);
  return sub_26130((uint64_t)v3, a1);
}

uint64_t sub_26130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_67230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26198@<X0>(uint64_t a1@<X8>)
{
  if (AMFIShouldShowDeveloperModeSettings())
  {
    id v3 = [self currentDevice];
    objc_msgSend(v3, "sf_isDeveloperModeEnabled");

    unsigned __int8 v4 = *(unsigned char *)(v1 + 16);
    uint64_t v5 = v4;
    uint64_t v6 = sub_4B980();
    __chkstk_darwin(v6 - 8, v7);
    sub_51D0(v4);
    uint64_t v8 = sub_4C180();
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13 & 1;
    sub_4C000();
    if (qword_66ED0 != -1) {
      swift_once();
    }
    id v21 = (id)qword_6B268;
    uint64_t result = sub_4C160();
    uint64_t v17 = v22 & 1 | 0x4000000000000000;
    __int16 v19 = 511;
    uint64_t v20 = v5;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    uint64_t v14 = 0;
    uint64_t v12 = 0;
    uint64_t result = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    __int16 v19 = 0;
    uint64_t v20 = 0x3FFFFFFFC0;
  }
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v20;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v14;
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = result;
  *(void *)(a1 + 56) = v16;
  *(void *)(a1 + 64) = v17;
  *(void *)(a1 + 72) = v18;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = v19;
  return result;
}

uint64_t type metadata accessor for DeveloperModeListItemProvider()
{
  return self;
}

uint64_t sub_263C4@<X0>(uint64_t a1@<X8>)
{
  sub_26198((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

id sub_26404@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  id result = [self sharedManager];
  if (result)
  {
    uint64_t v5 = result;
    unsigned __int8 v6 = [result isSharedIPad];

    if (v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      id result = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      __int16 v15 = 0;
      uint64_t v16 = 0x3FFFFFFFC0;
    }
    else
    {
      sub_4BAA0();
      uint64_t v17 = (void *)sub_4BA80();
      sub_4BA90();

      LOBYTE(v17) = *(unsigned char *)(v2 + 16);
      uint64_t v7 = v17;
      uint64_t v18 = sub_4B980();
      __chkstk_darwin(v18 - 8, v19);
      sub_51D0((char)v17);
      uint64_t v8 = sub_4C180();
      uint64_t v9 = v20;
      uint64_t v11 = v21;
      uint64_t v10 = v22 & 1;
      sub_4C000();
      if (qword_66ED0 != -1) {
        swift_once();
      }
      id v23 = (id)qword_6B268;
      id result = (id)sub_4C160();
      uint64_t v13 = v24 & 1 | 0x4000000000000000;
      __int16 v15 = 511;
      uint64_t v16 = v7;
    }
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v16;
    *(void *)(a1 + 16) = v8;
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = result;
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    *(void *)(a1 + 72) = v14;
    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 88) = 0;
    *(_WORD *)(a1 + 96) = v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for LockdownModeListItemProvider()
{
  return self;
}

uint64_t sub_26658@<X0>(uint64_t a1@<X8>)
{
  sub_26404((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

void sub_26698(uint64_t a1@<X8>)
{
  id v3 = [self currentDevice];
  unsigned int v4 = objc_msgSend(v3, "sf_isiPhone");

  if (v4 && (uint64_t v5 = self, [v5 isRatchetFeatureAvailable]))
  {
    [v5 isRatchetEnabled];
    char v32 = v1;
    unsigned __int8 v6 = v1[16];
    uint64_t v7 = v6;
    uint64_t v8 = sub_4B980();
    __chkstk_darwin(v8 - 8, v9);
    sub_51D0(v6);
    uint64_t v10 = sub_4C180();
    uint64_t v30 = v11;
    uint64_t v31 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14 & 1;
    sub_4C000();
    if (qword_66ED0 != -1) {
      swift_once();
    }
    id v24 = (id)qword_6B268;
    uint64_t v18 = sub_4C160();
    uint64_t v19 = v25;
    uint64_t v21 = v26;
    uint64_t v20 = v27 & 1 | 0x4000000000000000;
    uint64_t v28 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v29 = (__CFString *)sub_4C4D0();
    CFNotificationCenterAddObserver(v28, v32, (CFNotificationCallback)sub_269DC, v29, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    __int16 v22 = 511;
    uint64_t v23 = v7;
    uint64_t v17 = v30;
    uint64_t v16 = v31;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v13 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    __int16 v22 = 0;
    uint64_t v23 = 0x3FFFFFFFC0;
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v23;
  *(void *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v17;
  *(void *)(a1 + 32) = v15;
  *(void *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v19;
  *(void *)(a1 + 64) = v20;
  *(void *)(a1 + 72) = v21;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = v22;
}

uint64_t sub_26940()
{
  sub_78F0(v0 + 24);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StolenDeviceProtectionListItemProvider()
{
  return self;
}

uint64_t sub_2699C@<X0>(uint64_t a1@<X8>)
{
  sub_26698((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

uint64_t sub_269DC(uint64_t result, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    uint64_t v7 = (void *)result;
    uint64_t v8 = (void *)(a2 + 24);
    uint64_t v9 = *(void *)(a2 + 48);
    swift_retain();
    sub_78AC(v8, v9);
    id v10 = v7;
    id v11 = a3;
    id v12 = a5;
    swift_retain();
    sub_4BCC0();

    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_26AB8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_A2E4(result + 24, (uint64_t)v1);
    swift_release();
    sub_78AC(v1, v1[3]);
    type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
    sub_467E0();
    return sub_78F0((uint64_t)v1);
  }
  return result;
}

uint64_t sub_26B7C()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v18 = v0;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_15BFC();
    uint64_t result = sub_4C680();
    uint64_t v1 = v20;
    uint64_t v3 = v21;
    uint64_t v4 = v22;
    uint64_t v5 = v23;
    unint64_t v6 = v24;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v3 = v1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v10 = (unint64_t)(v4 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
      uint64_t v13 = v5;
      goto LABEL_27;
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v14 >= v10) {
      goto LABEL_30;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    uint64_t v13 = v5 + 1;
    if (!v15)
    {
      uint64_t v13 = v5 + 2;
      if (v5 + 2 >= v10) {
        goto LABEL_30;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v13);
      if (!v15)
      {
        uint64_t v13 = v5 + 3;
        if (v5 + 3 >= v10) {
          goto LABEL_30;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v13);
        if (!v15)
        {
          uint64_t v13 = v5 + 4;
          if (v5 + 4 >= v10) {
            goto LABEL_30;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v13);
          if (!v15)
          {
            uint64_t v16 = v5 + 5;
            while (v10 != v16)
            {
              unint64_t v15 = *(void *)(v3 + 8 * v16++);
              if (v15)
              {
                uint64_t v13 = v16 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *(void *)(v18 + 64) = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            sub_78F0(v18 + 24);
            swift_bridgeObjectRelease();
            return v18;
          }
        }
      }
    }
LABEL_26:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_27:
    uint64_t v17 = *(void *)(*(void *)(v1 + 48) + 8 * v12);
    swift_retain();
    if (!v17) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      uint64_t result = swift_release();
      uint64_t v5 = v13;
      unint64_t v6 = v11;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v13 = v5;
        uint64_t v11 = v6;
        if (v19) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_26E10()
{
  sub_26B7C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SensitiveContentWarningListSectionModelProvider()
{
  return self;
}

uint64_t sub_26E68@<X0>(void *a1@<X8>)
{
  uint64_t v85 = a1;
  uint64_t v1 = sub_4B8C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1, v4);
  unsigned int v88 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4890(&qword_681A8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v80 = self;
  id v9 = [v80 mainNudityDetectionFooterText];
  sub_4C500();

  uint64_t v10 = sub_4890(&qword_681B0);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_4B9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = sub_4B8A0();
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v17 = sub_4B880();
  __chkstk_darwin(v17, v18);
  (*(void (**)(char *, void))(v20 + 104))((char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:));
  uint64_t v21 = sub_4B870();
  __chkstk_darwin(v21, v22);
  (*(void (**)(char *, void))(v24 + 104))((char *)&v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:));
  sub_4B890();
  sub_4B8B0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v8, 0, 1, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1) == 1)
  {
    sub_27804((uint64_t)v8);
    uint64_t result = sub_4C9C0();
    __break(1u);
  }
  else
  {
    uint64_t v25 = v88;
    uint64_t v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v2 + 32))(v88, v8, v1);
    __chkstk_darwin(v26, v27);
    uint64_t v86 = v2;
    uint64_t v87 = v1;
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))((char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v1);
    uint64_t v81 = sub_4C170();
    uint64_t v82 = v28;
    uint64_t v83 = v29;
    char v31 = v30;
    sub_4C000();
    uint64_t v32 = sub_4C160();
    uint64_t v34 = v33;
    char v36 = v35;
    id v37 = v80;
    unsigned int v79 = [v80 nudityDetectionRowEnabled];
    if (v79)
    {
      id v38 = [v37 nudityDetectionOnOffLabel];
      uint64_t v39 = sub_4C500();
      uint64_t v41 = v40;

      uint64_t v89 = v39;
      uint64_t v90 = v41;
      sub_CD9C();
      uint64_t v77 = sub_4C190();
      uint64_t v78 = v42;
      id v80 = v43;
      char v45 = v44;
      sub_87CC(v32, v34, v36 & 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_4C000();
      if (qword_66ED0 != -1) {
        swift_once();
      }
      id v46 = (id)qword_6B268;
      uint64_t v77 = sub_4C160();
      uint64_t v78 = v47;
      id v80 = v48;
      char v45 = v49;
      sub_87CC(v32, v34, v36 & 1);
      swift_bridgeObjectRelease();
    }
    uint64_t v50 = sub_4B980();
    __chkstk_darwin(v50 - 8, v51);
    uint64_t v52 = sub_4C4C0();
    __chkstk_darwin(v52 - 8, v53);
    sub_4C4B0();
    if (qword_66ED8 != -1) {
      swift_once();
    }
    uint64_t v54 = v45 & 1;
    uint64_t v55 = v31 & 1;
    uint64_t v56 = sub_4B970();
    uint64_t v57 = sub_7874(v56, (uint64_t)qword_6B270);
    __chkstk_darwin(v57, v57);
    (*(void (**)(char *))(v59 + 16))((char *)&v77 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v60 = sub_4BA20();
    __chkstk_darwin(v60 - 8, v61);
    sub_4BA10();
    sub_4B990();
    uint64_t v62 = sub_4C180();
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v68 = v67 & 1;
    if (v79) {
      __int16 v69 = 511;
    }
    else {
      __int16 v69 = 255;
    }
    uint64_t v70 = *(unsigned __int8 *)(v84 + 16);
    sub_4890(&qword_67578);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_4E890;
    *(unsigned char *)(v71 + 32) = 27;
    *(void *)(v71 + 40) = 27;
    *(void *)(v71 + 48) = v62;
    *(void *)(v71 + 56) = v64;
    *(void *)(v71 + 64) = v68;
    uint64_t v72 = v77;
    *(void *)(v71 + 72) = v66;
    *(void *)(v71 + 80) = v72;
    *(void *)(v71 + 88) = v80;
    *(void *)(v71 + 96) = v54 | 0x4000000000000000;
    *(void *)(v71 + 112) = 0;
    *(void *)(v71 + 120) = 0;
    *(void *)(v71 + 104) = v78;
    *(_WORD *)(v71 + 128) = v69;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v86 + 8))(v88, v87);
    uint64_t v74 = v85;
    *uint64_t v85 = v70;
    *(_OWORD *)(v74 + 1) = 0u;
    *(_OWORD *)(v74 + 3) = 0u;
    uint64_t v75 = v83;
    v74[5] = v81;
    v74[6] = v75;
    uint64_t v76 = v82;
    v74[7] = v55;
    v74[8] = v76;
    v74[9] = v71;
  }
  return result;
}

uint64_t sub_277C4@<X0>(uint64_t a1@<X8>)
{
  sub_26E68(v3);
  return sub_26130((uint64_t)v3, a1);
}

uint64_t sub_27804(uint64_t a1)
{
  uint64_t v2 = sub_4890(&qword_681A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_27864()
{
  uint64_t result = sub_4C4D0();
  qword_6B240 = result;
  return result;
}

uint64_t sub_2789C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 48) = a4;
  sub_4890(&qword_67720);
  *(void *)(v4 + 56) = swift_task_alloc();
  return _swift_task_switch(sub_2795C, 0, 0);
}

uint64_t sub_2795C()
{
  uint64_t v1 = v0[7];
  v0[5] = 0;
  if (os_eligibility_get_domain_answer()) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = v0[5] == 4;
  }
  char v3 = v2;
  uint64_t v4 = sub_4C670();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  sub_4C640();
  swift_retain();
  uint64_t v6 = sub_4C630();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = &protocol witness table for MainActor;
  *(void *)(v7 + 32) = v5;
  *(unsigned char *)(v7 + 40) = v3;
  swift_release();
  sub_16074(v1, (uint64_t)&unk_68280, v7);
  swift_release();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_27B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 56) = a5;
  *(void *)(v5 + 40) = a4;
  sub_4C640();
  *(void *)(v5 + 48) = sub_4C630();
  uint64_t v7 = sub_4C620();
  return _swift_task_switch(sub_27BDC, v7, v6);
}

uint64_t sub_27BDC()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(unsigned char *)(Strong + 72) = *(unsigned char *)(v0 + 56);
    sub_78AC((void *)(Strong + 24), *(void *)(Strong + 48));
    type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
    sub_467E0();
    swift_release();
  }
  BOOL v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_27CDC()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_A2E4(result + 24, (uint64_t)v1);
    swift_release();
    sub_78AC(v1, v1[3]);
    type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
    sub_467E0();
    return sub_78F0((uint64_t)v1);
  }
  return result;
}

uint64_t sub_27DA0()
{
  sub_26B7C();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppleIntelligenceReportListItemProvider()
{
  return self;
}

uint64_t sub_27DF8@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 72) == 1)
  {
    uint64_t v3 = *(unsigned __int8 *)(v1 + 16);
    uint64_t v4 = sub_4B980();
    __chkstk_darwin(v4 - 8, v5);
    sub_51D0(v3);
    uint64_t v6 = sub_4C180();
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11 & 1;
    uint64_t result = sub_27F8C();
    uint64_t v17 = v16 & 1 | 0x4000000000000000;
    __int16 v18 = 511;
    uint64_t v19 = v3;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    uint64_t result = 0;
    uint64_t v14 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    __int16 v18 = 0;
    uint64_t v19 = 0x3FFFFFFFC0;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v19;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = result;
  *(void *)(a1 + 56) = v14;
  *(void *)(a1 + 64) = v17;
  *(void *)(a1 + 72) = v15;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = v18;
  return result;
}

uint64_t sub_27F14@<X0>(uint64_t a1@<X8>)
{
  sub_27DF8((uint64_t)v3);
  return sub_780C((uint64_t)v3, a1);
}

uint64_t sub_27F54()
{
  uint64_t result = sub_4C4D0();
  qword_6B248 = result;
  return result;
}

uint64_t sub_27F8C()
{
  sub_4BC70();
  swift_allocObject();
  sub_4BC60();
  sub_4BC30();
  swift_release();
  sub_4C000();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_6B268;
  return sub_4C160();
}

uint64_t sub_28098()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_280D0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_28110(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_17D34;
  return sub_27B40(a1, v4, v5, v6, v7);
}

uint64_t sub_281D4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_A2E4(result + 24, (uint64_t)v1);
    swift_release();
    sub_78AC(v1, v1[3]);
    type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
    sub_467E0();
    return sub_78F0((uint64_t)v1);
  }
  return result;
}

uint64_t type metadata accessor for AppPrivacyReportListItemProvider()
{
  return self;
}

uint64_t sub_282BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v1 + 16);
  uint64_t v4 = sub_4B980();
  __chkstk_darwin(v4 - 8, v5);
  sub_51D0(v3);
  uint64_t v6 = sub_4C180();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11 & 1;
  uint64_t result = sub_2838C();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = result;
  *(void *)(a1 + 56) = v15;
  *(void *)(a1 + 64) = v14 & 1 | 0x4000000000000000;
  *(void *)(a1 + 72) = v16;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 96) = 511;
  return result;
}

uint64_t sub_2838C()
{
  [self isRecordActivityEnabled];
  sub_4C000();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_6B268;
  return sub_4C160();
}

uint64_t *sub_28480(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain();
    swift_retain();
    sub_4890(&qword_67408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_4C0E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_285A8(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_4890(&qword_67408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_4C0E0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_28668(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  swift_retain();
  sub_4890(&qword_67408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_4C0E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    void *v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_28738(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_4B7C((uint64_t)a1 + v6, &qword_67408);
    sub_4890(&qword_67408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_4C0E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_28844(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_4890(&qword_67408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_4C0E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_28918(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_4B7C((uint64_t)a1 + v6, &qword_67408);
    uint64_t v9 = sub_4890(&qword_67408);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_4C0E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_28A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_28A38);
}

uint64_t sub_28A38(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_4890(&qword_68338);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    char v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_28AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_28B00);
}

void *sub_28B00(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_4890(&qword_68338);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AppleIntelligenceReportView()
{
  uint64_t result = qword_68398;
  if (!qword_68398) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_28BF8()
{
  sub_28C90();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_28C90()
{
  if (!qword_683A8)
  {
    sub_4C0E0();
    unint64_t v0 = sub_4BDB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_683A8);
    }
  }
}

uint64_t sub_28CE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_28D04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v2 = sub_4BF70();
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v41 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4890(&qword_683D8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_4890(&qword_683E0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  char v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_4890(&qword_683E8);
  uint64_t v40 = *(void *)(v39 - 8);
  __chkstk_darwin(v39, v15);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_4890(&qword_683F0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v44 = v18;
  uint64_t v45 = v19;
  __chkstk_darwin(v18, v20);
  uint64_t v47 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = v1;
  sub_4890(&qword_683F8);
  sub_2AD94();
  sub_4C120();
  uint64_t v22 = sub_4C14(&qword_68438, &qword_683D8);
  sub_4C1A0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_4C000();
  uint64_t v52 = v5;
  uint64_t v53 = v22;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_4C220();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  uint64_t v24 = v41;
  uint64_t v25 = v42;
  uint64_t v26 = v43;
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v41, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v43);
  uint64_t v52 = v10;
  uint64_t v53 = OpaqueTypeConformance2;
  uint64_t v27 = swift_getOpaqueTypeConformance2();
  uint64_t v28 = v39;
  sub_4C250();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v24, v26);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v28);
  uint64_t v43 = sub_4C000();
  LODWORD(v42) = v29;
  char v30 = v38;
  uint64_t v31 = v38[1];
  uint64_t v50 = *v38;
  uint64_t v51 = v31;
  sub_4890(&qword_68440);
  sub_4C2D0();
  uint64_t v32 = v52;
  uint64_t v33 = v53;
  uint64_t v34 = v54;
  swift_getKeyPath();
  uint64_t v52 = v32;
  uint64_t v53 = v33;
  uint64_t v54 = v34;
  sub_4890(&qword_68448);
  sub_4C330();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v48 = v30;
  sub_4890(&qword_68450);
  uint64_t v52 = v28;
  uint64_t v53 = v27;
  swift_getOpaqueTypeConformance2();
  sub_4C14(&qword_68458, &qword_68450);
  uint64_t v35 = v44;
  char v36 = v47;
  sub_4C260();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v36, v35);
}

uint64_t sub_29388(uint64_t a1)
{
  uint64_t v2 = sub_4890(&qword_68420);
  __chkstk_darwin(v2, v3);
  uint64_t v7 = a1;
  sub_29E68(a1, (uint64_t)&v6[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  sub_4890(&qword_68410);
  sub_4C14(&qword_68408, &qword_68410);
  sub_2AE40();
  return sub_4C370();
}

uint64_t sub_29498@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  char v67 = a2;
  uint64_t v3 = sub_4890(&qword_68498);
  __chkstk_darwin(v3 - 8, v4);
  v57[1] = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4890(&qword_684A0);
  uint64_t v64 = *(void *)(v6 - 8);
  uint64_t v65 = v6;
  __chkstk_darwin(v6, v7);
  uint64_t v62 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_4890(&qword_684A8);
  uint64_t v10 = __chkstk_darwin(v59, v9);
  uint64_t v66 = (uint64_t)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v58 = (char *)v57 - v14;
  __chkstk_darwin(v13, v15);
  uint64_t v63 = (uint64_t)v57 - v16;
  uint64_t v17 = sub_4890(&qword_684B0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v20 = __chkstk_darwin(v17, v19);
  uint64_t v61 = (char *)v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20, v22);
  uint64_t v60 = (char *)v57 - v23;
  uint64_t v24 = sub_4C4C0();
  __chkstk_darwin(v24 - 8, v25);
  sub_4C4B0();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  uint64_t v26 = (void *)qword_6B268;
  uint64_t v27 = sub_4BA20();
  __chkstk_darwin(v27 - 8, v28);
  id v29 = v26;
  sub_4BA10();
  uint64_t v74 = sub_4C510();
  uint64_t v75 = v30;
  uint64_t v31 = a1[1];
  uint64_t v68 = *a1;
  uint64_t v32 = v68;
  uint64_t v69 = v31;
  sub_4890(&qword_68440);
  sub_4C2D0();
  uint64_t v33 = v71;
  uint64_t v34 = v72;
  uint64_t v35 = v73;
  swift_getKeyPath();
  uint64_t v71 = v33;
  uint64_t v72 = v34;
  uint64_t v73 = v35;
  sub_4890(&qword_68448);
  sub_4C330();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v71 = v68;
  uint64_t v72 = v69;
  LOBYTE(v73) = v70;
  sub_4890(&qword_684B8);
  sub_2B2F4();
  sub_2B348();
  sub_CD9C();
  char v36 = v60;
  sub_4C320();
  uint64_t v71 = v32;
  uint64_t v72 = v31;
  sub_4C2B0();
  sub_4C000();
  sub_4BDD0();
  type metadata accessor for AppleIntelligenceReportViewModel();
  sub_2B3B4(&qword_684D0);
  id v37 = v62;
  sub_4C390();
  uint64_t v71 = v32;
  uint64_t v72 = v31;
  sub_4C2B0();
  uint64_t v38 = v68;
  swift_getKeyPath();
  uint64_t v71 = v38;
  sub_2B3B4(&qword_68490);
  sub_4BA40();
  swift_release();
  sub_2BDA0();
  sub_4BC40();
  double v40 = v39;
  swift_release();
  swift_release();
  BOOL v41 = v40 != 604800.0 && v40 != 900.0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v43 = swift_allocObject();
  *(unsigned char *)(v43 + 16) = v41;
  uint64_t v45 = v64;
  uint64_t v44 = v65;
  uint64_t v46 = v58;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v58, v37, v65);
  uint64_t v47 = (uint64_t *)&v46[*(int *)(v59 + 36)];
  *uint64_t v47 = KeyPath;
  v47[1] = (uint64_t)sub_2B4CC;
  v47[2] = v43;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v44);
  uint64_t v48 = (uint64_t)v46;
  uint64_t v49 = v63;
  sub_2B4E4(v48, v63);
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  uint64_t v51 = v61;
  v50(v61, v36, v17);
  uint64_t v52 = v66;
  sub_4B18(v49, v66, &qword_684A8);
  uint64_t v53 = v67;
  v50(v67, v51, v17);
  uint64_t v54 = sub_4890(&qword_684D8);
  sub_4B18(v52, (uint64_t)&v53[*(int *)(v54 + 48)], &qword_684A8);
  sub_4B7C(v49, &qword_684A8);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v18 + 8);
  v55(v36, v17);
  sub_4B7C(v52, &qword_684A8);
  return ((uint64_t (*)(char *, uint64_t))v55)(v51, v17);
}

uint64_t sub_29C30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2B740();
  *a1 = result;
  return result;
}

uint64_t sub_29C5C()
{
  return swift_release();
}

uint64_t sub_29D18()
{
  return sub_4C340();
}

uint64_t sub_29DDC@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2B818(*a1);
  sub_CD9C();
  uint64_t result = sub_4C190();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_29E38@<X0>(uint64_t a1@<X8>)
{
  return sub_2ACB0(a1);
}

uint64_t sub_29E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v33 = a2;
  uint64_t v30 = sub_4890(&qword_68430);
  __chkstk_darwin(v30, v2);
  uint64_t v4 = (uint64_t *)((char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for AppleIntelligenceReportView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8, v8);
  uint64_t v9 = sub_4BE30();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4C000();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v13 = (id)qword_6B268;
  uint64_t v14 = sub_4C160();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  sub_2AEF0(v29, (uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v22 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v23 = swift_allocObject();
  sub_2AF58((uint64_t)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_4BE20();
  uint64_t v24 = v31;
  uint64_t v25 = v32;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))((char *)v4 + *(int *)(v30 + 28), v12, v32);
  uint64_t *v4 = KeyPath;
  uint64_t v26 = sub_4890(&qword_68420);
  uint64_t v27 = v33;
  sub_4B18((uint64_t)v4, v33 + *(int *)(v26 + 36), &qword_68430);
  *(void *)uint64_t v27 = v14;
  *(void *)(v27 + 8) = v16;
  *(unsigned char *)(v27 + 16) = v20;
  *(void *)(v27 + 24) = v18;
  sub_87BC(v14, v16, v20);
  swift_bridgeObjectRetain();
  sub_4B7C((uint64_t)v4, &qword_68430);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  sub_87CC(v14, v16, v20);
  return swift_bridgeObjectRelease();
}

void sub_2A1C8()
{
  uint64_t v0 = sub_4C0E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)sub_4C4D0();
  id v6 = [self presenterForPrivacySplashWithIdentifier:v5];

  if (v6)
  {
    type metadata accessor for AppleIntelligenceReportView();
    uint64_t v7 = sub_3A0A0((uint64_t)v4);
    __chkstk_darwin(v7, v8);
    *(&v9 - 2) = (uint64_t)v6;
    sub_4C0D0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    sub_4BE00();
  }
  else
  {
    static OpenURLAction.Result.discarded.getter();
  }
}

uint64_t sub_2A384@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_2B3B4(&qword_68490);
  sub_4BA40();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 24);
  return result;
}

uint64_t sub_2A418()
{
  return swift_release();
}

uint64_t sub_2A4D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_4BF80();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_4890(&qword_68460);
  return sub_2A524(a1, (char *)(a2 + *(int *)(v4 + 44)));
}

uint64_t sub_2A524@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_4BEB0();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = (void (*)(char *, uint64_t))v3;
  __chkstk_darwin(v3, v4);
  uint64_t v54 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_4890(&qword_68468);
  uint64_t v62 = *(void *)(v56 - 8);
  uint64_t v7 = __chkstk_darwin(v56, v6);
  uint64_t v55 = (char *)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  uint64_t v61 = (char *)v50 - v10;
  uint64_t v11 = type metadata accessor for AppleIntelligenceReportView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11 - 8, v14);
  uint64_t v15 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_4890(&qword_68470);
  __chkstk_darwin(v16 - 8, v17);
  char v19 = (char *)v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_4890(&qword_68478);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v52 = v20;
  uint64_t v53 = v21;
  uint64_t v23 = __chkstk_darwin(v20, v22);
  uint64_t v51 = (char *)v50 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23, v25);
  uint64_t v60 = (char *)v50 - v26;
  uint64_t v27 = sub_4C000();
  v50[0] = v28;
  v50[1] = v27;
  sub_4BD80();
  uint64_t v29 = sub_4BD90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v19, 0, 1, v29);
  sub_2AEF0(a1, (uint64_t)v15);
  unint64_t v30 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v31 = swift_allocObject();
  sub_2AF58((uint64_t)v15, v31 + v30);
  sub_4C2F0();
  sub_4C000();
  sub_2AEF0(a1, (uint64_t)v15);
  uint64_t v32 = swift_allocObject();
  sub_2AF58((uint64_t)v15, v32 + v30);
  uint64_t v33 = v51;
  sub_4C300();
  uint64_t v34 = v54;
  sub_4BEA0();
  sub_4C14(&qword_68480, &qword_68478);
  uint64_t v35 = v55;
  uint64_t v36 = v52;
  sub_4C230();
  (*(void (**)(char *, void))(v57 + 8))(v34, v58);
  uint64_t v37 = v53;
  uint64_t v58 = *(void (**)(char *, uint64_t))(v53 + 8);
  v58(v33, v36);
  double v39 = v61;
  uint64_t v38 = v62;
  uint64_t v40 = v56;
  (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v35, v56);
  BOOL v41 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
  v41(v33, v60, v36);
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  uint64_t v43 = v39;
  uint64_t v44 = v40;
  v42(v35, v43, v40);
  uint64_t v45 = v59;
  v41(v59, v33, v36);
  uint64_t v46 = sub_4890(&qword_68488);
  v42(&v45[*(int *)(v46 + 48)], v35, v44);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v62 + 8);
  v47(v61, v44);
  uint64_t v48 = (uint64_t (*)(char *, uint64_t))v58;
  v58(v60, v36);
  v47(v35, v44);
  return v48(v33, v36);
}

uint64_t sub_2AAD0()
{
  return swift_release();
}

uint64_t sub_2ABB0()
{
  return swift_release();
}

uint64_t sub_2AC88@<X0>(uint64_t a1@<X8>)
{
  return sub_2ACB0(a1);
}

uint64_t sub_2ACB0@<X0>(uint64_t a1@<X8>)
{
  sub_4C000();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_6B268;
  uint64_t result = sub_4C160();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_2AD8C()
{
  return sub_29388(*(void *)(v0 + 16));
}

unint64_t sub_2AD94()
{
  unint64_t result = qword_68400;
  if (!qword_68400)
  {
    sub_4950(&qword_683F8);
    sub_4C14(&qword_68408, &qword_68410);
    sub_2AE40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68400);
  }
  return result;
}

unint64_t sub_2AE40()
{
  unint64_t result = qword_68418;
  if (!qword_68418)
  {
    sub_4950(&qword_68420);
    sub_4C14(&qword_68428, &qword_68430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68418);
  }
  return result;
}

uint64_t sub_2AEE8@<X0>(uint64_t a1@<X8>)
{
  return sub_2A4D4(*(void *)(v1 + 16), a1);
}

uint64_t sub_2AEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppleIntelligenceReportView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2AF58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppleIntelligenceReportView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2AFBC()
{
  return sub_2AFF0((uint64_t (*)(uint64_t))sub_2AAD0);
}

uint64_t sub_2AFD8()
{
  return sub_2AFF0((uint64_t (*)(uint64_t))sub_2ABB0);
}

uint64_t sub_2AFF0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AppleIntelligenceReportView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_2B064@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2B740();
  *a1 = result;
  return result;
}

void sub_2B094()
{
}

void sub_2B0B0()
{
  sub_2BE1C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2B0D0()
{
  return sub_2BE14(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_2B0F0@<X0>(char *a1@<X8>)
{
  return sub_29498(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_2B104()
{
  uint64_t v1 = (int *)(type metadata accessor for AppleIntelligenceReportView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[7];
  sub_4890(&qword_67408);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4C0E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_2B224()
{
  type metadata accessor for AppleIntelligenceReportView();

  sub_2A1C8();
}

id sub_2B2A4(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  [v2 setPresentingViewController:a1];

  return [v2 present];
}

unint64_t sub_2B2F4()
{
  unint64_t result = qword_684C0;
  if (!qword_684C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_684C0);
  }
  return result;
}

unint64_t sub_2B348()
{
  unint64_t result = qword_684C8;
  if (!qword_684C8)
  {
    sub_4950(&qword_684B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_684C8);
  }
  return result;
}

uint64_t sub_2B3B4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppleIntelligenceReportViewModel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2B3F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_4BF30();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2B428@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_4BF30();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2B458()
{
  return sub_4BF40();
}

uint64_t sub_2B480()
{
  return sub_4BF40();
}

unsigned char *sub_2B4A8(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_2B4BC()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_2B4CC(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_2B4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_684A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2B54C()
{
  unint64_t result = qword_684F0;
  if (!qword_684F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_684F0);
  }
  return result;
}

uint64_t sub_2B5A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2B728()
{
  return sub_2B0D0();
}

uint64_t sub_2B740()
{
  swift_getKeyPath();
  sub_2B3B4(&qword_68490);
  sub_4BA40();
  swift_release();
  sub_2BDA0();
  sub_4BC40();
  double v1 = v0;
  swift_release();
  if (v1 == 604800.0) {
    unsigned int v2 = 1;
  }
  else {
    unsigned int v2 = 2;
  }
  if (v1 == 900.0) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t sub_2B818(char a1)
{
  if (!a1)
  {
    unint64_t v32 = 0xCA024F987B900000;
    uint64_t v1 = 48;
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    unint64_t v32 = 0x4610F0445A000000;
    uint64_t v1 = 32786;
LABEL_5:
    uint64_t v31 = v1;
    uint64_t v2 = sub_4CBA0();
    unint64_t v30 = v24;
    uint64_t v3 = *(void *)(v2 - 8);
    uint64_t v28 = v2;
    uint64_t v29 = v3;
    __chkstk_darwin(v2, v4);
    uint64_t v27 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4890(&qword_68630);
    sub_4CB70();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_4EDC0;
    sub_4CB60();
    sub_4CB50();
    sub_4CB40();
    sub_2D3CC(v6);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v25 = sub_4CB90();
    uint64_t v26 = v24;
    uint64_t v7 = *(void *)(v25 - 8);
    __chkstk_darwin(v25, v8);
    uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4CB80();
    uint64_t v11 = sub_4CB10();
    v24[1] = v24;
    uint64_t v12 = *(void *)(v11 - 8);
    __chkstk_darwin(v11, v13);
    uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4CB00();
    uint64_t v16 = sub_4CB30();
    v24[0] = v24;
    uint64_t v17 = *(void *)(v16 - 8);
    __chkstk_darwin(v16, v18);
    uint64_t v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4CB20();
    uint64_t v21 = v27;
    sub_4B860();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v25);
    sub_2D6C8(&qword_68638, (void (*)(uint64_t))&type metadata accessor for Duration.UnitsFormatStyle);
    uint64_t v22 = v28;
    sub_4CBB0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v21, v22);
    return v33;
  }
  if (qword_66ED0 != -1) {
    swift_once();
  }
  return sub_4B8D0();
}

uint64_t sub_2BD04()
{
  swift_getKeyPath();
  sub_2B3B4(&qword_68490);
  sub_4BA40();
  swift_release();
  return *(unsigned __int8 *)(v0 + 24);
}

void sub_2BD90(void *a1@<X8>)
{
  *a1 = &off_5E0F0;
}

uint64_t sub_2BDA0()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    uint64_t v2 = v0;
    sub_4BC70();
    swift_allocObject();
    uint64_t v1 = sub_4BC60();
    *(void *)(v2 + 16) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_2BE14(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

void sub_2BE1C(uint64_t a1, char a2)
{
  swift_getKeyPath();
  sub_2B3B4(&qword_68490);
  sub_4BA40();
  swift_release();
  sub_2BDA0();
  sub_4BC40();
  double v4 = v3;
  swift_release();
  if (v4 == 900.0 || v4 == 604800.0)
  {
    if (a2 != 2)
    {
      sub_2BDA0();
      sub_4CBC0();
      sub_4BC50();
      swift_release();
      return;
    }
    int v5 = 0;
LABEL_5:
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath, v7);
    sub_4BA30();
    swift_release();
    if (!v5) {
      return;
    }
    goto LABEL_11;
  }
  if (a2 == 2)
  {
    int v5 = 1;
    goto LABEL_5;
  }
  sub_2BDA0();
  sub_4CBC0();
  sub_4BC50();
  swift_release();
LABEL_11:
  id v8 = [self defaultCenter];
  if (qword_66EC0 != -1) {
    swift_once();
  }
  [v8 postNotificationName:qword_6B248 object:0];
}

void sub_2C0DC()
{
  sub_2BDA0();
  sub_4BC50();
  swift_release();
  id v0 = [self defaultCenter];
  if (qword_66EC0 != -1) {
    swift_once();
  }
  [v0 postNotificationName:qword_6B248 object:0];
}

uint64_t sub_2C190()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings32AppleIntelligenceReportViewModel___observationRegistrar;
  uint64_t v2 = sub_4BA60();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2C238()
{
  return type metadata accessor for AppleIntelligenceReportViewModel();
}

uint64_t type metadata accessor for AppleIntelligenceReportViewModel()
{
  uint64_t result = qword_68528;
  if (!qword_68528) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2C28C()
{
  uint64_t result = sub_4BA60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2C334@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v1 = sub_4890(&qword_685C8);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  int v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4890(&qword_685D0);
  uint64_t v42 = *(void *)(v6 - 8);
  uint64_t v7 = v42;
  uint64_t v43 = v6;
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v40 - v13;
  BOOL v41 = (char *)&v40 - v13;
  uint64_t v15 = sub_4BBE0();
  __chkstk_darwin(v15 - 8, v16);
  sub_4BBD0();
  uint64_t v45 = sub_2B3B4(&qword_684D0);
  sub_4BAE0();
  sub_4C14(&qword_685E0, &qword_685C8);
  sub_4BB10();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v11, v6);
  uint64_t v17 = sub_4890(&qword_685E8);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v20 = __chkstk_darwin(v17, v19);
  uint64_t v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20, v23);
  uint64_t v25 = (char *)&v40 - v24;
  uint64_t v26 = sub_4890(&qword_685F0);
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v28);
  unint64_t v30 = (char *)&v40 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4B9F0();
  sub_2D6C8(&qword_68600, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_4BAF0();
  sub_4C14(&qword_68608, &qword_685F0);
  sub_4BB10();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v22, v25, v17);
  uint64_t v31 = sub_4890(&qword_68610);
  uint64_t v33 = __chkstk_darwin(v31, v32);
  uint64_t v35 = (char *)&v40 + *(int *)(v33 + 48) - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v41;
  uint64_t v37 = v42;
  uint64_t v38 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))((char *)&v40 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0), v41, v43);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v35, v22, v17);
  sub_4BB20();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v36, v38);
}

uint64_t sub_2C8A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return _swift_task_switch(sub_2C8C8, 0, 0);
}

uint64_t sub_2C8C8()
{
  uint64_t v1 = sub_4B9F0();
  v0[4] = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  v0[5] = v2;
  v0[6] = *(void *)(v2 + 64);
  v0[7] = swift_task_alloc();
  uint64_t v3 = NSTemporaryDirectory();
  sub_4C500();

  sub_4B9A0();
  swift_bridgeObjectRelease();
  uint64_t v4 = swift_task_alloc();
  v0[8] = v4;
  sub_4B9C0();
  v0[9] = sub_2BDA0();
  int v5 = (void *)swift_task_alloc();
  v0[10] = v5;
  *int v5 = v0;
  v5[1] = sub_2CA5C;
  return TransparencyReport.export(to:)(v4);
}

uint64_t sub_2CA5C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_2CC88;
  }
  else {
    uint64_t v2 = sub_2CB8C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2CB8C()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[4];
  swift_task_alloc();
  (*(void (**)(void))(v3 + 16))();
  sub_4BB00();
  int v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v5(v2, v4);
  v5(v1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2CC88()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0[5] + 8);
  v3(v0[8], v2);
  v3(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2CD38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return _swift_task_switch(sub_2CD5C, 0, 0);
}

uint64_t sub_2CD5C()
{
  uint64_t v1 = sub_4B9F0();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  uint64_t v2 = NSTemporaryDirectory();
  sub_4C500();

  sub_4B9A0();
  swift_bridgeObjectRelease();
  sub_4B9C0();
  v0[7] = sub_2BDA0();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2CED8;
  uint64_t v4 = v0[2];
  return TransparencyReport.export(to:)(v4);
}

uint64_t sub_2CED8()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_2D088;
  }
  else {
    uint64_t v2 = sub_2D008;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2D008()
{
  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2D088()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0[5] + 8);
  v3(v0[2], v2);
  v3(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

unint64_t sub_2D130()
{
  unint64_t result = qword_685C0;
  if (!qword_685C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_685C0);
  }
  return result;
}

uint64_t sub_2D184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for AppleIntelligenceReportViewModel.SupportedDuration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppleIntelligenceReportViewModel.SupportedDuration(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x2D2FCLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleIntelligenceReportViewModel.SupportedDuration()
{
  return &type metadata for AppleIntelligenceReportViewModel.SupportedDuration;
}

uint64_t sub_2D334()
{
  return sub_4C14(&qword_68618, &qword_68620);
}

uint64_t sub_2D370()
{
  return sub_4C14(&qword_68628, &qword_684E0);
}

void sub_2D3BC()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 24) = *(unsigned char *)(v0 + 24);
}

void *sub_2D3CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_4890(&qword_68640);
    uint64_t v3 = sub_4C8F0();
    uint64_t v37 = v3 + 56;
    unint64_t result = (void *)sub_4CB70();
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = *(result - 1);
    int v8 = *(void (**)(char *))(v7 + 16);
    uint64_t v35 = v7 + 16;
    uint64_t v36 = v8;
    uint64_t v30 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = v3;
    uint64_t v38 = *(void *)(v7 + 72);
    uint64_t v34 = *(void *)(v7 + 64);
    uint64_t v10 = (uint64_t (**)(char *, void *))(v7 + 8);
    uint64_t v28 = v1;
    uint64_t v29 = (uint64_t (**)(unint64_t, char *, void *))(v7 + 32);
    while (1)
    {
      __chkstk_darwin(result, v30 + v38 * v6);
      unint64_t v33 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v12 = (char *)&v27 - v33;
      v36((char *)&v27 - v33);
      sub_2D6C8(&qword_68648, (void (*)(uint64_t))&type metadata accessor for Duration.UnitsFormatStyle.Unit);
      uint64_t v13 = sub_4C470();
      uint64_t v15 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v16 = v13 & v15;
      unint64_t v17 = (v13 & (unint64_t)v15) >> 6;
      uint64_t v18 = *(void *)(v37 + 8 * v17);
      uint64_t v19 = 1 << (v13 & v15);
      if ((v19 & v18) != 0)
      {
        uint64_t v31 = &v27;
        uint64_t v32 = v6;
        do
        {
          __chkstk_darwin(v13, v14);
          uint64_t v20 = (char *)&v27 - v33;
          uint64_t v21 = v9;
          ((void (*)(char *, unint64_t, void *))v36)((char *)&v27 - v33, *(void *)(v9 + 48) + v16 * v38, v5);
          sub_2D6C8(qword_68650, (void (*)(uint64_t))&type metadata accessor for Duration.UnitsFormatStyle.Unit);
          char v22 = sub_4C4A0();
          uint64_t v23 = *v10;
          uint64_t v13 = (*v10)(v20, v5);
          if (v22)
          {
            unint64_t result = (void *)v23(v12, v5);
            uint64_t v1 = v28;
            uint64_t v9 = v21;
            uint64_t v6 = v32;
            goto LABEL_4;
          }
          unint64_t v16 = (v16 + 1) & v15;
          unint64_t v17 = v16 >> 6;
          uint64_t v18 = *(void *)(v37 + 8 * (v16 >> 6));
          uint64_t v19 = 1 << v16;
          uint64_t v9 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        uint64_t v1 = v28;
        uint64_t v6 = v32;
      }
      *(void *)(v37 + 8 * v17) = v19 | v18;
      unint64_t result = (void *)(*v29)(*(void *)(v9 + 48) + v16 * v38, v12, v5);
      uint64_t v24 = *(void *)(v9 + 16);
      BOOL v25 = __OFADD__(v24, 1);
      uint64_t v26 = v24 + 1;
      if (v25) {
        break;
      }
      *(void *)(v9 + 16) = v26;
LABEL_4:
      if (++v6 == v1) {
        return (void *)v9;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

uint64_t sub_2D6C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2D710@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  type metadata accessor for AuthenticatedNavigationLink();
  uint64_t v6 = swift_retain();
  a4(v6);

  return swift_release();
}

uint64_t type metadata accessor for AuthenticatedNavigationLink()
{
  return sub_303F8();
}

uint64_t sub_2D7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_2D7AC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2D854(unint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 24) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *(void *)a2;
    *(void *)unint64_t v3 = *(void *)a2;
    unint64_t v3 = v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    unint64_t v10 = a1 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
    *(void *)(v10 + 8) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 8);
    *(void *)(v10 + 16) = v11;
    unint64_t v12 = ((v3 & 0xFFFFFFFFFFFFFFF8) + v6 + 24) & ~v6;
    unint64_t v13 = ((a2 & 0xFFFFFFFFFFFFFFF8) + v6 + 24) & ~v6;
    uint64_t v14 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v14(v12, v13, v4);
  }
  return v3;
}

uint64_t sub_2D970(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (v3 + *(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

unint64_t sub_2D9E4(unint64_t a1, unint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(void *)(v4 + 8) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(void *)(v4 + 16) = v5;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v9 = (v8 + 24 + v4) & ~v8;
  unint64_t v10 = (v8 + 24 + (a2 & 0xFFFFFFFFFFFFFFF8)) & ~v8;
  swift_retain();
  v7(v9, v10, v6);
  return a1;
}

unint64_t sub_2DA84(unint64_t a1, unint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(void *)(v5 + 8) = *(void *)((a2 & 0xFFFFFFFFFFFFFFF8) + 8);
  *(void *)(v5 + 16) = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))((*(unsigned __int8 *)(v8 + 80) + 24 + v5) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(unsigned __int8 *)(v8 + 80) + 24 + v6) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

unint64_t sub_2DB28(unint64_t a1, unint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 8);
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 24 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 24 + (a2 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

unint64_t sub_2DBA8(unint64_t a1, unint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(unsigned __int8 *)(v7 + 80) + 24 + v5) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 24 + v6) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_2DC3C(unint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 24) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)(a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((v15 + v6 + 24) & ~v6);
      }
      unint64_t v16 = *(void *)(v15 + 8);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(unsigned char *)(a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *(unsigned __int16 *)a1;
        break;
      case 3:
        LODWORD(v9) = *(unsigned __int16 *)a1 | (*(unsigned __int8 *)(a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_2DDE0(unint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 24) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero((void *)a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          *(unsigned char *)(a1 + 2) = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *(unsigned char *)a1 = v17;
        }
      }
    }
    else
    {
      bzero((void *)a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        *(unsigned char *)(a1 + v10) = v15;
        return;
      case 2:
        *(_WORD *)(a1 + v10) = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)(a1 + v10) = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      *(unsigned char *)(a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)(a1 + v10) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x2E044);
    case 4:
      *(_DWORD *)(a1 + v10) = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        unint64_t v18 = a1 & 0xFFFFFFFFFFFFFFF8;
        if ((v7 & 0x80000000) != 0)
        {
          uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
          v20((v18 + v9 + 24) & ~v9);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v19 = a2 ^ 0x80000000;
            *(void *)(v18 + 16) = 0;
          }
          else
          {
            uint64_t v19 = a2 - 1;
          }
          *(void *)(v18 + 8) = v19;
        }
      }
      return;
  }
}

uint64_t sub_2E06C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_2E0B0()
{
  int v1 = *v0;
  if (v1 != 7 && v1 != 2) {
    return 0;
  }
  int v2 = self;
  unint64_t v3 = (void *)sub_4C4D0();
  id v4 = [v2 applicationWithBundleIdentifier:v3];

  return v4;
}

uint64_t sub_2E16C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v50 = a2;
  uint64_t v5 = sub_4890(&qword_686D8);
  uint64_t v43 = v5;
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v48 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v7, v11);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v39 = *(void *)(a1 + 16);
  uint64_t v38 = v12;
  uint64_t v13 = sub_4C310();
  uint64_t v47 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v14);
  uint64_t v44 = (char *)&v37 - v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = WitnessTable;
  unint64_t v41 = sub_2FAD4();
  uint64_t v54 = v13;
  uint64_t v55 = v5;
  uint64_t v56 = WitnessTable;
  unint64_t v57 = v41;
  uint64_t v45 = &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v46 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v19 = __chkstk_darwin(OpaqueTypeMetadata2, v18);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v22);
  uint64_t v40 = (char *)&v37 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v39;
  uint64_t v27 = v38;
  *(void *)(v25 + 16) = v39;
  *(void *)(v25 + 24) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v25 + v24, (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v51 = v26;
  uint64_t v52 = v27;
  uint64_t v53 = v37;
  uint64_t v28 = v44;
  sub_4C2E0();
  uint64_t v29 = v48;
  sub_4C090();
  uint64_t v31 = v42;
  uint64_t v30 = v43;
  unint64_t v32 = v41;
  sub_4C1E0();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v29, v30);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v28, v13);
  uint64_t v54 = v13;
  uint64_t v55 = v30;
  uint64_t v56 = v31;
  unint64_t v57 = v32;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v34 = v40;
  sub_34298(v21, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v46 + 8);
  v35(v21, OpaqueTypeMetadata2);
  sub_34298(v34, OpaqueTypeMetadata2, OpaqueTypeConformance2);
  return ((uint64_t (*)(char *, uint64_t))v35)(v34, OpaqueTypeMetadata2);
}

uint64_t sub_2E5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for AuthenticatedNavigationLink();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v21 - v9;
  uint64_t v11 = sub_4890(&qword_67720);
  __chkstk_darwin(v11 - 8, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = sub_2E0B0();
  sub_4C650();
  uint64_t v16 = sub_4C670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 0, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0;
  *((void *)v18 + 4) = a2;
  *((void *)v18 + 5) = a3;
  *((void *)v18 + 6) = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v18[v17], v10, v6);
  id v19 = v15;
  sub_1C9E8((uint64_t)v14, (uint64_t)&unk_686F0, (uint64_t)v18);

  swift_release();
  return sub_17E28((uint64_t)v14);
}

uint64_t sub_2E7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  sub_4890(&qword_67720);
  v7[31] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for AuthenticatedNavigationLink();
  unsigned char v7[32] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[33] = v9;
  v7[34] = *(void *)(v9 + 64);
  v7[35] = swift_task_alloc();
  return _swift_task_switch(sub_2E8EC, 0, 0);
}

uint64_t sub_2E8EC()
{
  int v1 = (void *)v0[27];
  if (v1)
  {
    uint64_t v2 = v0[35];
    uint64_t v3 = v0[32];
    uint64_t v4 = v0[33];
    uint64_t v5 = v0[28];
    long long v19 = *(_OWORD *)(v0 + 29);
    uint64_t v6 = self;
    id v7 = v1;
    id v8 = [v6 sharedGuard];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
    unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = v19;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v10 + v9, v2, v3);
    v0[14] = sub_30140;
    v0[15] = v10;
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 1107296256;
    v0[12] = sub_2F814;
    v0[13] = &unk_5F3C0;
    uint64_t v11 = _Block_copy(v0 + 10);
    swift_release();
    [v8 authenticateForSubject:v7 completion:v11];
    _Block_release(v11);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  else
  {
    id v14 = [objc_allocWithZone((Class)LAContext) init];
    v0[36] = v14;
    sub_4C4C0();
    swift_task_alloc();
    sub_4C4B0();
    if (qword_66ED0 != -1) {
      swift_once();
    }
    id v15 = (void *)qword_6B268;
    sub_4BA20();
    swift_task_alloc();
    id v16 = v15;
    sub_4BA10();
    sub_4C510();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = sub_4C4D0();
    v0[37] = v17;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[7] = v0 + 39;
    v0[3] = sub_2ECDC;
    uint64_t v18 = swift_continuation_init();
    v0[16] = _NSConcreteStackBlock;
    v0[17] = 0x40000000;
    v0[18] = sub_2F88C;
    v0[19] = &unk_5F330;
    v0[20] = v18;
    [v14 evaluatePolicy:2 localizedReason:v17 reply:v0 + 16];
    return _swift_continuation_await(v0 + 2);
  }
}

uint64_t sub_2ECDC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 304) = v1;
  if (v1) {
    uint64_t v2 = sub_2EF88;
  }
  else {
    uint64_t v2 = sub_2EDEC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_2EDEC()
{
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v6 = *(void *)(v0 + 224);
  long long v13 = *(_OWORD *)(v0 + 232);

  uint64_t v7 = sub_4C670();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v6, v3);
  sub_4C640();
  uint64_t v8 = sub_4C630();
  unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = &protocol witness table for MainActor;
  *(_OWORD *)(v10 + 32) = v13;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v10 + v9, v2, v3);
  sub_16074(v5, (uint64_t)&unk_68710, v10);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_2EF88()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void **)(v0 + 296);
  uint64_t v2 = *(void **)(v0 + 288);
  swift_willThrow();

  type metadata accessor for Code(0);
  *(void *)(v0 + 200) = -5;
  swift_errorRetain();
  sub_2FDDC();
  LOBYTE(v1) = sub_4B8F0();
  swift_errorRelease();
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 280);
    uint64_t v4 = *(void *)(v0 + 256);
    uint64_t v5 = *(void *)(v0 + 264);
    uint64_t v6 = *(void *)(v0 + 248);
    uint64_t v7 = *(void *)(v0 + 224);
    long long v20 = *(_OWORD *)(v0 + 232);
    swift_errorRelease();
    uint64_t v8 = sub_4C670();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    sub_4C640();
    uint64_t v9 = sub_4C630();
    unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    *(void *)(v11 + 24) = &protocol witness table for MainActor;
    *(_OWORD *)(v11 + 32) = v20;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v11 + v10, v3, v4);
    sub_16074(v6, (uint64_t)&unk_68700, v11);
    swift_release();
  }
  else
  {
    if (qword_66EE0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_4BC10();
    sub_7874(v12, (uint64_t)qword_6B288);
    swift_errorRetain();
    swift_errorRetain();
    long long v13 = sub_4BBF0();
    os_log_type_t v14 = sub_4C6A0();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      swift_getErrorValue();
      uint64_t v16 = sub_4CAB0();
      *(void *)(v0 + 208) = sub_1C340(v16, v17, &v21);
      sub_4C800();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v13, v14, "An error occured while evaluating device owner authentication policy: %s", v15, 0xCu);
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
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

void sub_2F334(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for AuthenticatedNavigationLink();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  os_log_type_t v14 = (char *)&v30 - v13;
  uint64_t v15 = sub_4890(&qword_67720);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v19 = sub_4C670();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a3, v10);
    sub_4C640();
    uint64_t v20 = sub_4C630();
    unint64_t v21 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v22 = (char *)swift_allocObject();
    *((void *)v22 + 2) = v20;
    *((void *)v22 + 3) = &protocol witness table for MainActor;
    *((void *)v22 + 4) = a4;
    *((void *)v22 + 5) = a5;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v22[v21], v14, v10);
    sub_16074((uint64_t)v18, (uint64_t)&unk_68720, (uint64_t)v22);
    swift_release();
  }
  else
  {
    if (qword_66EE0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_4BC10();
    sub_7874(v23, (uint64_t)qword_6B288);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v31 = sub_4BBF0();
    os_log_type_t v24 = sub_4C6A0();
    if (os_log_type_enabled(v31, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      if (a2)
      {
        swift_getErrorValue();
        uint64_t v26 = sub_4CAB0();
        unint64_t v28 = v27;
      }
      else
      {
        unint64_t v28 = 0xE500000000000000;
        uint64_t v26 = 0x3E6C696E3CLL;
      }
      uint64_t v32 = sub_1C340(v26, v28, &v33);
      sub_4C800();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v31, v24, "An error occured while evaluating app protection authentication: %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      uint64_t v29 = v31;
    }
  }
}

uint64_t sub_2F710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_4C640();
  *(void *)(v4 + 24) = sub_4C630();
  uint64_t v6 = sub_4C620();
  return _swift_task_switch(sub_2F7A8, v6, v5);
}

uint64_t sub_2F7A8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_release();
  (*(void (**)(uint64_t))(v1 + 8))(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_2F814(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2F88C(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_4890(&qword_67888);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_2F940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_4C640();
  *(void *)(v4 + 24) = sub_4C630();
  uint64_t v6 = sub_4C620();
  return _swift_task_switch(sub_304C0, v6, v5);
}

uint64_t sub_2F9D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a2);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AuthenticatedNavigationLink();
  sub_34298(a1 + *(int *)(v9 + 40), a2, a3);
  sub_34298(v8, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

unint64_t sub_2FAD4()
{
  unint64_t result = qword_686E0;
  if (!qword_686E0)
  {
    sub_4950(&qword_686D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_686E0);
  }
  return result;
}

uint64_t sub_2FB34()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_2E5D4(v4, v1, v2);
}

uint64_t sub_2FBB8()
{
  return sub_2F9D8(v0[4], v0[2], v0[3]);
}

uint64_t sub_2FBC4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + v2[12], v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_2FCC4(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[6];
  uint64_t v10 = (uint64_t)v1 + ((*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_17D34;
  return sub_2E7E0(a1, v7, v8, v9, v10, v4, v5);
}

unint64_t sub_2FDDC()
{
  unint64_t result = qword_67030;
  if (!qword_67030)
  {
    type metadata accessor for Code(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_67030);
  }
  return result;
}

uint64_t sub_2FE38(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_2F940(a1, v5, v6, v7);
}

uint64_t sub_2FF44(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_2F940(a1, v5, v6, v7);
}

uint64_t sub_30050()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[12], v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_30140(char a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = *(void *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  sub_2F334(a1, a2, v8, v5, v6);
}

uint64_t sub_301DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_301EC()
{
  return swift_release();
}

uint64_t sub_301F8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + v2[12], v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_302F0(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AuthenticatedNavigationLink() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_186D4;
  return sub_2F710(a1, v5, v6, v7);
}

uint64_t sub_303F8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_30428()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PrivacyAndSecuritySettingsListLinkModel(uint64_t a1)
{
  sub_87CC(*(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    return sub_40A8(v4, v5, v3);
  }
  return result;
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  int v7 = *(unsigned __int8 *)(a2 + 56);
  swift_bridgeObjectRetain();
  if (v7 == 255)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 40);
    uint64_t v8 = *(void *)(a2 + 48);
    sub_4048(v9, v8, v7);
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v8;
    *(unsigned char *)(a1 + 56) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  char v9 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_87CC(v7, v8, v9);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (long long *)(a1 + 40);
  uint64_t v11 = (long long *)(a2 + 40);
  int v12 = *(unsigned __int8 *)(a2 + 56);
  if (*(unsigned __int8 *)(a1 + 56) == 255)
  {
    if (v12 == 255)
    {
      long long v21 = *v11;
      *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
      long long *v10 = v21;
    }
    else
    {
      uint64_t v19 = *(void *)(a2 + 40);
      uint64_t v18 = *(void *)(a2 + 48);
      sub_4048(v19, v18, v12);
      *(void *)(a1 + 40) = v19;
      *(void *)(a1 + 48) = v18;
      *(unsigned char *)(a1 + 56) = v12;
    }
  }
  else if (v12 == 255)
  {
    sub_306FC(a1 + 40);
    char v20 = *(unsigned char *)(a2 + 56);
    long long *v10 = *v11;
    *(unsigned char *)(a1 + 56) = v20;
  }
  else
  {
    uint64_t v14 = *(void *)(a2 + 40);
    uint64_t v13 = *(void *)(a2 + 48);
    sub_4048(v14, v13, v12);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 48) = v13;
    char v17 = *(unsigned char *)(a1 + 56);
    *(unsigned char *)(a1 + 56) = v12;
    sub_40A8(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_306FC(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListLinkModel(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PrivacyAndSecuritySettingsListLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = v4;
  sub_87CC(v5, v6, v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v8 = (_OWORD *)(a2 + 40);
  int v9 = *(unsigned __int8 *)(a1 + 56);
  if (v9 == 255) {
    goto LABEL_5;
  }
  int v10 = *(unsigned __int8 *)(a2 + 56);
  if (v10 == 255)
  {
    sub_306FC(a1 + 40);
LABEL_5:
    *(_OWORD *)(a1 + 40) = *v8;
    *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
    return a1;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *v8;
  *(unsigned char *)(a1 + 56) = v10;
  sub_40A8(v11, v12, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListLinkModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListLinkModel(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListLink()
{
  return &type metadata for PrivacyAndSecuritySettingsListLink;
}

uint64_t sub_308CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_308E8@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  *(_OWORD *)uint64_t v5 = *a1;
  *(_OWORD *)&v5[16] = a1[1];
  *(_OWORD *)&v5[32] = a1[2];
  long long v6 = *(_OWORD *)&v5[8];
  long long v7 = *(_OWORD *)&v5[24];
  sub_30B10((uint64_t)&v6, (uint64_t)v9);
  uint64_t v8 = *((void *)&v7 + 1);
  long long v3 = v7;
  *a2 = v6;
  a2[1] = v3;
  sub_30B6C((uint64_t)v9);
  return sub_30BA0((uint64_t)&v8);
}

uint64_t sub_30960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(a1 + 56);
  unint64_t v6 = v3;
  uint64_t v7 = v4;
  char v8 = *(unsigned char *)(a1 + 56);
  if (v5 == 255)
  {
    unint64_t v6 = sub_622C(*(unsigned char *)a1);
    uint64_t v7 = v9;
    char v8 = v10;
  }
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v8;

  return sub_8920(v3, v4, v5);
}

uint64_t sub_30A00()
{
  return sub_4C290();
}

uint64_t sub_30AA4@<X0>(_OWORD *a1@<X8>)
{
  return sub_308E8(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_30AAC@<X0>(uint64_t a1@<X8>)
{
  return sub_30960(*(void *)(v1 + 16), a1);
}

unint64_t sub_30AB4()
{
  unint64_t result = qword_68728;
  if (!qword_68728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68728);
  }
  return result;
}

uint64_t sub_30B10(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_30B6C(uint64_t a1)
{
  return a1;
}

uint64_t sub_30BA0(uint64_t a1)
{
  return a1;
}

unint64_t sub_30BD0()
{
  unint64_t result = qword_68730;
  if (!qword_68730)
  {
    sub_4950(&qword_68738);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68730);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListLinkModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListLinkModel;
}

BOOL sub_30C3C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 41);
  long long v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a2 + 41);
  return sub_30C98((unsigned __int8 *)v5, (unsigned __int8 *)v7);
}

BOOL sub_30C98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2 && (sub_4C140() & 1) != 0)
  {
    uint64_t v4 = a1[56];
    int v5 = a2[56];
    if (v4 == 255)
    {
      if (v5 == 255) {
        return 1;
      }
    }
    else if (v5 != 255)
    {
      uint64_t v8 = *((void *)a1 + 5);
      uint64_t v7 = *((void *)a1 + 6);
      uint64_t v10 = *((void *)a2 + 5);
      uint64_t v9 = *((void *)a2 + 6);
      switch(v4)
      {
        case 1:
          if (v5 != 1) {
            return 0;
          }
          break;
        case 2:
          if (v5 != 2) {
            return 0;
          }
          break;
        case 3:
          if (v5 != 3) {
            return 0;
          }
          break;
        case 4:
          return v5 == 4 && !(v9 | v10);
        default:
          if (v5) {
            return 0;
          }
          sub_8920(v10, v9, 0);
          sub_8920(v8, v7, 0);
          char v11 = sub_4C280();
          sub_8ADC(v10, v9, 0);
          sub_8ADC(v8, v7, 0);
          return (v11 & 1) != 0;
      }
      if (v8 == v10 && v7 == v9 || (sub_4CA60() & 1) != 0) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t destroy for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t a1)
{
  sub_87CC(*(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  swift_bridgeObjectRelease();
  sub_87CC(*(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 88);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    return sub_40A8(v4, v5, v3);
  }
  return result;
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListSubtitleLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  char v9 = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  sub_87BC(v7, v8, v9);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  int v10 = *(unsigned __int8 *)(a2 + 88);
  swift_bridgeObjectRetain();
  if (v10 == 255)
  {
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  }
  else
  {
    uint64_t v12 = *(void *)(a2 + 72);
    uint64_t v11 = *(void *)(a2 + 80);
    sub_4048(v12, v11, v10);
    *(void *)(a1 + 72) = v12;
    *(void *)(a1 + 80) = v11;
    *(unsigned char *)(a1 + 88) = v10;
  }
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListSubtitleLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  char v9 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_87CC(v7, v8, v9);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  char v12 = *(unsigned char *)(a2 + 56);
  sub_87BC(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 56) = v12;
  sub_87CC(v13, v14, v15);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = (long long *)(a1 + 72);
  char v17 = (long long *)(a2 + 72);
  int v18 = *(unsigned __int8 *)(a2 + 88);
  if (*(unsigned __int8 *)(a1 + 88) == 255)
  {
    if (v18 == 255)
    {
      long long v27 = *v17;
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *uint64_t v16 = v27;
    }
    else
    {
      uint64_t v25 = *(void *)(a2 + 72);
      uint64_t v24 = *(void *)(a2 + 80);
      sub_4048(v25, v24, v18);
      *(void *)(a1 + 72) = v25;
      *(void *)(a1 + 80) = v24;
      *(unsigned char *)(a1 + 88) = v18;
    }
  }
  else if (v18 == 255)
  {
    sub_306FC(a1 + 72);
    char v26 = *(unsigned char *)(a2 + 88);
    *uint64_t v16 = *v17;
    *(unsigned char *)(a1 + 88) = v26;
  }
  else
  {
    uint64_t v20 = *(void *)(a2 + 72);
    uint64_t v19 = *(void *)(a2 + 80);
    sub_4048(v20, v19, v18);
    uint64_t v21 = *(void *)(a1 + 72);
    uint64_t v22 = *(void *)(a1 + 80);
    *(void *)(a1 + 72) = v20;
    *(void *)(a1 + 80) = v19;
    char v23 = *(unsigned char *)(a1 + 88);
    *(unsigned char *)(a1 + 88) = v18;
    sub_40A8(v21, v22, v23);
  }
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListSubtitleLinkModel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListSubtitleLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = v4;
  sub_87CC(v5, v6, v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  char v8 = *(unsigned char *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = v8;
  sub_87CC(v9, v10, v11);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  char v12 = (_OWORD *)(a2 + 72);
  int v13 = *(unsigned __int8 *)(a1 + 88);
  if (v13 == 255) {
    goto LABEL_5;
  }
  int v14 = *(unsigned __int8 *)(a2 + 88);
  if (v14 == 255)
  {
    sub_306FC(a1 + 72);
LABEL_5:
    *(_OWORD *)(a1 + 72) = *v12;
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    return a1;
  }
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *v12;
  *(unsigned char *)(a1 + 88) = v14;
  sub_40A8(v15, v16, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListSubtitleLinkModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListSubtitleLinkModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 89) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListSubtitleLink()
{
  return &type metadata for PrivacyAndSecuritySettingsListSubtitleLink;
}

uint64_t sub_312A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_312C0@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_4C030();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_4890(&qword_68750);
  sub_4890(&qword_68758);
  sub_4C14(&qword_68760, &qword_68758);
  return sub_4BDA0();
}

uint64_t sub_3137C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)uint64_t v15 = *(_OWORD *)a1;
  *(_OWORD *)&v15[16] = *(_OWORD *)(a1 + 16);
  *(void *)&v15[32] = *(void *)(a1 + 32);
  long long v16 = *(_OWORD *)&v15[8];
  long long v17 = *(_OWORD *)&v15[24];
  sub_30B10((uint64_t)&v16, (uint64_t)v19);
  uint64_t v18 = *((void *)&v17 + 1);
  sub_30B6C((uint64_t)v19);
  sub_30BA0((uint64_t)&v18);
  sub_4C110();
  uint64_t v3 = sub_4C150();
  uint64_t v5 = v4;
  char v7 = v6;
  uint64_t v9 = v8;
  swift_release();
  v7 &= 1u;
  long long v10 = v16;
  char v14 = v17;
  uint64_t v11 = *((void *)&v17 + 1);
  char v12 = v17 & 1;
  *(_OWORD *)a2 = v16;
  *(unsigned char *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v9;
  sub_87BC(v10, *((uint64_t *)&v10 + 1), v12);
  swift_bridgeObjectRetain();
  sub_87BC(v3, v5, v7);
  swift_bridgeObjectRetain();
  sub_87CC(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_87CC(v10, *((uint64_t *)&v10 + 1), v14);
  return swift_bridgeObjectRelease();
}

uint64_t sub_314C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  int v5 = *(unsigned __int8 *)(a1 + 88);
  unint64_t v6 = v3;
  uint64_t v7 = v4;
  char v8 = *(unsigned char *)(a1 + 88);
  if (v5 == 255)
  {
    unint64_t v6 = sub_622C(*(unsigned char *)a1);
    uint64_t v7 = v9;
    char v8 = v10;
  }
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v8;

  return sub_8920(v3, v4, v5);
}

uint64_t sub_31568()
{
  return sub_4C290();
}

uint64_t sub_31650@<X0>(uint64_t a1@<X8>)
{
  return sub_312C0(a1);
}

uint64_t sub_31658@<X0>(uint64_t a1@<X8>)
{
  return sub_314C8(*(void *)(v1 + 16), a1);
}

uint64_t sub_31660@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_4BEC0();
  *a1 = v3;
  return result;
}

uint64_t sub_3168C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_4BEC0();
  *a1 = v3;
  return result;
}

uint64_t sub_316B8()
{
  return sub_4BED0();
}

uint64_t sub_316E0()
{
  return sub_4BED0();
}

uint64_t sub_31708@<X0>(uint64_t a1@<X8>)
{
  return sub_3137C(*(void *)(v1 + 16), a1);
}

uint64_t sub_31710()
{
  return sub_4C14(&qword_68768, &qword_68770);
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListSubtitleLinkModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListSubtitleLinkModel;
}

BOOL sub_3175C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  _OWORD v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a1 + 73);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)a2 + 73);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_317C8((unsigned __int8 *)v7, (unsigned __int8 *)v9);
}

BOOL sub_317C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2 && (sub_4C140() & 1) != 0 && (sub_4C140() & 1) != 0)
  {
    uint64_t v4 = a1[88];
    int v5 = a2[88];
    if (v4 == 255)
    {
      if (v5 == 255) {
        return 1;
      }
    }
    else if (v5 != 255)
    {
      uint64_t v8 = *((void *)a1 + 9);
      uint64_t v7 = *((void *)a1 + 10);
      uint64_t v10 = *((void *)a2 + 9);
      uint64_t v9 = *((void *)a2 + 10);
      switch(v4)
      {
        case 1:
          if (v5 != 1) {
            return 0;
          }
          break;
        case 2:
          if (v5 != 2) {
            return 0;
          }
          break;
        case 3:
          if (v5 != 3) {
            return 0;
          }
          break;
        case 4:
          return v5 == 4 && !(v9 | v10);
        default:
          if (v5) {
            return 0;
          }
          sub_8920(v10, v9, 0);
          sub_8920(v8, v7, 0);
          char v11 = sub_4C280();
          sub_8ADC(v10, v9, 0);
          sub_8ADC(v8, v7, 0);
          return (v11 & 1) != 0;
      }
      if (v8 == v10 && v7 == v9 || (sub_4CA60() & 1) != 0) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  char v9 = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  sub_87BC(v7, v8, v9);
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  int v10 = *(unsigned __int8 *)(a2 + 88);
  swift_bridgeObjectRetain();
  if (v10 == 255)
  {
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  }
  else
  {
    uint64_t v11 = *(void *)(a2 + 72);
    uint64_t v12 = *(void *)(a2 + 80);
    sub_4048(v11, v12, v10);
    *(void *)(a1 + 72) = v11;
    *(void *)(a1 + 80) = v12;
    *(unsigned char *)(a1 + 88) = v10;
  }
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  char v9 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_87CC(v7, v8, v9);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  char v12 = *(unsigned char *)(a2 + 56);
  sub_87BC(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 56) = v12;
  sub_87CC(v13, v14, v15);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v16 = (long long *)(a1 + 72);
  long long v17 = (long long *)(a2 + 72);
  int v18 = *(unsigned __int8 *)(a2 + 88);
  if (*(unsigned __int8 *)(a1 + 88) == 255)
  {
    if (v18 == 255)
    {
      long long v27 = *v17;
      *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
      *long long v16 = v27;
    }
    else
    {
      uint64_t v24 = *(void *)(a2 + 72);
      uint64_t v25 = *(void *)(a2 + 80);
      sub_4048(v24, v25, *(unsigned char *)(a2 + 88));
      *(void *)(a1 + 72) = v24;
      *(void *)(a1 + 80) = v25;
      *(unsigned char *)(a1 + 88) = v18;
    }
  }
  else if (v18 == 255)
  {
    sub_306FC(a1 + 72);
    char v26 = *(unsigned char *)(a2 + 88);
    *long long v16 = *v17;
    *(unsigned char *)(a1 + 88) = v26;
  }
  else
  {
    uint64_t v19 = *(void *)(a2 + 72);
    uint64_t v20 = *(void *)(a2 + 80);
    sub_4048(v19, v20, *(unsigned char *)(a2 + 88));
    uint64_t v21 = *(void *)(a1 + 72);
    uint64_t v22 = *(void *)(a1 + 80);
    *(void *)(a1 + 72) = v19;
    *(void *)(a1 + 80) = v20;
    char v23 = *(unsigned char *)(a1 + 88);
    *(unsigned char *)(a1 + 88) = v18;
    sub_40A8(v21, v22, v23);
  }
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  return a1;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = v4;
  sub_87CC(v5, v6, v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  char v8 = *(unsigned char *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = v8;
  sub_87CC(v9, v10, v11);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  char v12 = (_OWORD *)(a2 + 72);
  int v13 = *(unsigned __int8 *)(a1 + 88);
  if (v13 == 255) {
    goto LABEL_5;
  }
  int v14 = *(unsigned __int8 *)(a2 + 88);
  if (v14 == 255)
  {
    sub_306FC(a1 + 72);
LABEL_5:
    *(_OWORD *)(a1 + 72) = *v12;
    *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
    goto LABEL_6;
  }
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *v12;
  *(unsigned char *)(a1 + 88) = v14;
  sub_40A8(v15, v16, v13);
LABEL_6:
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 90)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListValueLinkModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 88) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 90) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 90) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListValueLink()
{
  return &type metadata for PrivacyAndSecuritySettingsListValueLink;
}

uint64_t sub_31D70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_31D8C@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  *(_OWORD *)uint64_t v5 = a1[2];
  *(_OWORD *)&v5[16] = a1[3];
  *(_OWORD *)&v5[32] = a1[4];
  long long v6 = *(_OWORD *)&v5[8];
  long long v7 = *(_OWORD *)&v5[24];
  sub_30B10((uint64_t)&v6, (uint64_t)v9);
  uint64_t v8 = *((void *)&v7 + 1);
  long long v3 = v7;
  *a2 = v6;
  a2[1] = v3;
  sub_30B6C((uint64_t)v9);
  return sub_30BA0((uint64_t)&v8);
}

uint64_t sub_31E0C()
{
  return sub_4C290();
}

uint64_t sub_31E94@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  *(_OWORD *)uint64_t v5 = *a1;
  *(_OWORD *)&v5[16] = a1[1];
  *(_OWORD *)&v5[32] = a1[2];
  long long v6 = *(_OWORD *)&v5[8];
  long long v7 = *(_OWORD *)&v5[24];
  sub_30B10((uint64_t)&v6, (uint64_t)v9);
  uint64_t v8 = *((void *)&v7 + 1);
  long long v3 = v7;
  *a2 = v6;
  a2[1] = v3;
  sub_30B6C((uint64_t)v9);
  return sub_30BA0((uint64_t)&v8);
}

uint64_t sub_31F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  int v5 = *(unsigned __int8 *)(a1 + 88);
  unint64_t v6 = v3;
  uint64_t v7 = v4;
  char v8 = *(unsigned char *)(a1 + 88);
  if (v5 == 255)
  {
    unint64_t v6 = sub_622C(*(unsigned char *)a1);
    uint64_t v7 = v9;
    char v8 = v10;
  }
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = v6;
  *(void *)(a2 + 24) = v7;
  *(unsigned char *)(a2 + 32) = v8;

  return sub_8920(v3, v4, v5);
}

uint64_t sub_31FB4()
{
  return sub_4BE50();
}

uint64_t sub_3206C@<X0>(_OWORD *a1@<X8>)
{
  return sub_31D8C(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_32074()
{
  return sub_31E0C();
}

uint64_t sub_3207C@<X0>(_OWORD *a1@<X8>)
{
  return sub_31E94(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_32084@<X0>(uint64_t a1@<X8>)
{
  return sub_31F14(*(void *)(v1 + 16), a1);
}

unint64_t sub_32098()
{
  unint64_t result = qword_68778;
  if (!qword_68778)
  {
    sub_4950(&qword_68780);
    sub_30BD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68778);
  }
  return result;
}

uint64_t sub_32114(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  _OWORD v7[2] = a1[2];
  v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)((char *)a1 + 74);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 10) = *(_OWORD *)((char *)a2 + 74);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return sub_32180((unsigned __int8 *)v7, (unsigned __int8 *)v9) & 1;
}

uint64_t sub_32180(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2 && (sub_4C140() & 1) != 0 && (sub_4C140() & 1) != 0)
  {
    int v4 = a2[88];
    if (a1[88] == 255)
    {
      if (v4 == 255)
      {
LABEL_6:
        int v5 = a1[89];
        int v6 = a2[89];
        if (v5 == 2)
        {
          if (v6 == 2) {
            return 1;
          }
        }
        else
        {
          BOOL v13 = (v5 & 1) == 0;
          if (v6 != 2 && ((v13 ^ v6) & 1) != 0) {
            return 1;
          }
        }
      }
    }
    else if (v4 != 255)
    {
      uint64_t v9 = *((void *)a1 + 9);
      uint64_t v8 = *((void *)a1 + 10);
      uint64_t v11 = *((void *)a2 + 9);
      uint64_t v10 = *((void *)a2 + 10);
      switch(a1[88])
      {
        case 1u:
          if (v4 != 1) {
            return 0;
          }
          goto LABEL_24;
        case 2u:
          if (v4 != 2) {
            return 0;
          }
          goto LABEL_24;
        case 3u:
          if (v4 != 3) {
            return 0;
          }
LABEL_24:
          if (v9 != v11 || v8 != v10)
          {
            char v14 = sub_4CA60();
            uint64_t result = 0;
            if ((v14 & 1) == 0) {
              return result;
            }
          }
          goto LABEL_6;
        case 4u:
          uint64_t result = 0;
          if (v4 == 4 && !(v10 | v11)) {
            goto LABEL_6;
          }
          return result;
        default:
          if (a2[88]) {
            return 0;
          }
          sub_8920(*((void *)a2 + 9), *((void *)a2 + 10), 0);
          sub_8920(v9, v8, 0);
          char v12 = sub_4C280();
          sub_8ADC(v11, v10, 0);
          sub_8ADC(v9, v8, 0);
          uint64_t result = 0;
          if (v12) {
            goto LABEL_6;
          }
          return result;
      }
    }
  }
  return 0;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListValueLinkModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListValueLinkModel;
}

uint64_t destroy for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t a1)
{
  sub_87CC(*(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_87BC(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  char v9 = *(unsigned char *)(a1 + 24);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_87CC(v7, v8, v9);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v7 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = v4;
  sub_87CC(v5, v6, v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivacyAndSecuritySettingsListImagelessLinkModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListImagelessLink()
{
  return &type metadata for PrivacyAndSecuritySettingsListImagelessLink;
}

uint64_t sub_325DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_325F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  char v4 = *(unsigned char *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  sub_87BC(v2, v3, v4);

  return swift_bridgeObjectRetain();
}

void *sub_32644()
{
  return &protocol witness table for Text;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListImagelessLinkModel()
{
  return &type metadata for PrivacyAndSecuritySettingsListImagelessLinkModel;
}

uint64_t sub_32660(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2) {
    return sub_4C140();
  }
  else {
    return 0;
  }
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListItem()
{
  return &type metadata for PrivacyAndSecuritySettingsListItem;
}

uint64_t sub_326B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_326CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v2 = sub_4C0C0();
  uint64_t v57 = *(void *)(v2 - 8);
  uint64_t v58 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v54 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4890(&qword_68788);
  uint64_t v6 = (int *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  char v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_4890(&qword_68790);
  __chkstk_darwin(v53, v10);
  char v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_4890(&qword_68798);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v55 = v13;
  uint64_t v56 = v14;
  __chkstk_darwin(v13, v15);
  long long v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_4890(&qword_687A0);
  __chkstk_darwin(v18 - 8, v19);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_4890(&qword_687A8);
  __chkstk_darwin(v49, v22);
  uint64_t v50 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v12 = sub_4C020();
  *((void *)v12 + 1) = 0;
  v12[16] = 1;
  uint64_t v52 = &v12[*(int *)(sub_4890(&qword_687B0) + 44)];
  long long v24 = *(_OWORD *)(v1 + 80);
  v59[4] = *(_OWORD *)(v1 + 64);
  v59[5] = v24;
  __int16 v60 = *(_WORD *)(v1 + 96);
  long long v25 = *(_OWORD *)(v1 + 48);
  v59[2] = *(_OWORD *)(v1 + 32);
  uint64_t v59[3] = v25;
  long long v26 = *(_OWORD *)(v1 + 16);
  v59[0] = *(_OWORD *)v1;
  v59[1] = v26;
  char v27 = v59[0];
  uint64_t v28 = swift_allocObject();
  long long v29 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v28 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v28 + 96) = v29;
  *(_WORD *)(v28 + 112) = *(_WORD *)(v1 + 96);
  long long v30 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v28 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v28 + 32) = v30;
  long long v31 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v28 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v28 + 64) = v31;
  type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  sub_33410(v1);
  sub_33880(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  *(void *)char v9 = sub_4BDC0();
  v9[8] = v32 & 1;
  uint64_t v33 = (uint64_t *)&v9[v6[11]];
  *uint64_t v33 = swift_getKeyPath();
  sub_4890(&qword_687C0);
  swift_storeEnumTagMultiPayload();
  v9[v6[12]] = v27;
  uint64_t v34 = v6[13];
  uint64_t v35 = (uint64_t)v21;
  uint64_t v36 = (double (**)@<D0>(uint64_t@<X8>))&v9[v34];
  *uint64_t v36 = sub_333EC;
  v36[1] = (double (*)@<D0>(uint64_t@<X8>))v28;
  sub_A348((uint64_t)v9, (uint64_t)v52, &qword_68788);
  uint64_t v37 = v54;
  sub_4C0B0();
  uint64_t v38 = sub_4C14(&qword_687C8, &qword_68790);
  uint64_t v39 = v53;
  sub_4C240();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v58);
  sub_4B7C((uint64_t)v12, &qword_68790);
  sub_6680(v27);
  *(void *)&long long v62 = v39;
  *((void *)&v62 + 1) = v38;
  swift_getOpaqueTypeConformance2();
  uint64_t v40 = v55;
  sub_4C200();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v17, v40);
  sub_8794((_OWORD *)((char *)v59 + 8), v61);
  sub_8794(v61, &v62);
  if (v63 >> 62 == 1)
  {
    v63 &= 0x3FFFFFFFFFFFFFFFuLL;
    BOOL v41 = (v64 & 1) == 0;
  }
  else
  {
    BOOL v41 = 0;
    v63 &= 0x3FFFFFFFFFFFFFFFuLL;
  }
  uint64_t v43 = (uint64_t)v50;
  uint64_t v42 = v51;
  uint64_t v44 = v49;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v46 = swift_allocObject();
  *(unsigned char *)(v46 + 16) = v41;
  sub_33490(v35, v43);
  uint64_t v47 = (uint64_t *)(v43 + *(int *)(v44 + 36));
  *uint64_t v47 = KeyPath;
  v47[1] = (uint64_t)sub_33488;
  v47[2] = v46;
  sub_4B7C(v35, &qword_687A0);
  return sub_A348(v43, v42, &qword_687A8);
}

double sub_32C88@<D0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 80);
  v19[4] = *(_OWORD *)(v1 + 64);
  v19[5] = v3;
  __int16 v20 = *(_WORD *)(v1 + 96);
  long long v4 = *(_OWORD *)(v1 + 16);
  v19[0] = *(_OWORD *)v1;
  v19[1] = v4;
  long long v5 = *(_OWORD *)(v1 + 48);
  v19[2] = *(_OWORD *)(v1 + 32);
  v19[3] = v5;
  sub_8794((_OWORD *)((char *)v19 + 8), v21);
  sub_8794(v21, &v22);
  unsigned __int8 v6 = v26;
  switch(v26 >> 62)
  {
    case 1uLL:
      v26 &= 0x3FFFFFFFFFFFFFFFuLL;
      *(_OWORD *)&v16[8] = v23;
      *(void *)uint64_t v16 = v22;
      *(void *)&v16[24] = v24;
      *(void *)long long v17 = *(void *)v25;
      *(_OWORD *)&v17[8] = *(_OWORD *)&v25[8];
      *(void *)&v17[24] = v6 & 1;
      *(void *)&v17[32] = v27;
      *(_OWORD *)&v17[40] = v28;
      *(_WORD *)&v17[56] = v29;
      v17[58] = 1;
      sub_33410(v1);
      sub_335A0();
      sub_335F4();
      sub_4C060();
      goto LABEL_6;
    case 2uLL:
      v26 &= 0x3FFFFFFFFFFFFFFFuLL;
      *(_OWORD *)&v16[8] = v23;
      *(void *)uint64_t v16 = v22;
      *(void *)&v16[24] = v24;
      *(void *)long long v17 = *(void *)v25;
      *(_OWORD *)&v17[8] = *(_OWORD *)&v25[8];
      *(void *)&v17[24] = v6 & 1;
      *(void *)&v17[32] = v27;
      *(_OWORD *)&v17[40] = v28;
      *(_WORD *)&v17[56] = v29;
      sub_33410(v1);
      sub_334F8();
      sub_3354C();
      sub_4C060();
LABEL_6:
      sub_4890(&qword_687E0);
      sub_4890(&qword_687E8);
      sub_33648(&qword_687F0, &qword_687E0, (void (*)(void))sub_335A0, (void (*)(void))sub_335F4);
      sub_33648(&qword_68808, &qword_687E8, (void (*)(void))sub_334F8, (void (*)(void))sub_3354C);
      sub_4C060();
      break;
    case 3uLL:
      v26 &= 0x3FFFFFFFFFFFFFFFuLL;
      long long v11 = v23;
      char v12 = v24;
      *(void *)uint64_t v16 = v22;
      *(_OWORD *)&v16[8] = v23;
      *(void *)&v16[24] = v24;
      *(void *)long long v17 = *(void *)v25;
      memset(&v17[8], 0, 48);
      *(_WORD *)&v17[56] = 256;
      sub_33410(v1);
      sub_87BC(v11, *((uint64_t *)&v11 + 1), v12);
      sub_334F8();
      sub_3354C();
      swift_bridgeObjectRetain();
      sub_4C060();
      sub_4890(&qword_687E0);
      sub_4890(&qword_687E8);
      sub_33648(&qword_687F0, &qword_687E0, (void (*)(void))sub_335A0, (void (*)(void))sub_335F4);
      sub_33648(&qword_68808, &qword_687E8, (void (*)(void))sub_334F8, (void (*)(void))sub_3354C);
      sub_4C060();
      sub_87CC(v11, *((uint64_t *)&v11 + 1), v12);
      swift_bridgeObjectRelease();
      break;
    default:
      v26 &= 0x3FFFFFFFFFFFFFFFuLL;
      long long v7 = v23;
      char v8 = v24;
      uint64_t v9 = *(void *)&v25[8];
      uint64_t v10 = *(void *)&v25[16];
      *(void *)uint64_t v16 = v22;
      *(_OWORD *)&v16[8] = v23;
      *(void *)&v16[24] = v24;
      *(_OWORD *)long long v17 = *(_OWORD *)v25;
      uint64_t v14 = *(void *)&v25[16];
      uint64_t v15 = *(void *)&v25[8];
      *(void *)&v17[16] = *(void *)&v25[16];
      *(void *)&v17[24] = v6;
      memset(&v17[32], 0, 27);
      sub_33410(v1);
      sub_87BC(v7, *((uint64_t *)&v7 + 1), v8);
      swift_bridgeObjectRetain();
      sub_8920(v9, v10, v6);
      sub_335A0();
      sub_335F4();
      sub_4C060();
      sub_4890(&qword_687E0);
      sub_4890(&qword_687E8);
      sub_33648(&qword_687F0, &qword_687E0, (void (*)(void))sub_335A0, (void (*)(void))sub_335F4);
      sub_33648(&qword_68808, &qword_687E8, (void (*)(void))sub_334F8, (void (*)(void))sub_3354C);
      sub_4C060();
      sub_87CC(v7, *((uint64_t *)&v7 + 1), v8);
      swift_bridgeObjectRelease();
      sub_8ADC(v15, v14, v6);
      break;
  }
  double result = *(double *)v16;
  *(_OWORD *)a1 = *(_OWORD *)v16;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)&v16[16];
  *(_OWORD *)(a1 + 32) = *(_OWORD *)v17;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)&v17[16];
  *(_OWORD *)(a1 + 64) = *(_OWORD *)&v17[32];
  *(void *)(a1 + 80) = *(void *)&v17[48];
  *(_WORD *)(a1 + 88) = *(_WORD *)&v17[56];
  *(unsigned char *)(a1 + 90) = v17[58];
  *(unsigned char *)(a1 + 91) = v18;
  return result;
}

uint64_t sub_3333C@<X0>(uint64_t a1@<X8>)
{
  return sub_326CC(a1);
}

uint64_t sub_33388()
{
  sub_8998(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(_WORD *)(v0 + 112));

  return _swift_deallocObject(v0, 114, 7);
}

double sub_333EC@<D0>(uint64_t a1@<X8>)
{
  return sub_32C88(a1);
}

uint64_t sub_33410(uint64_t a1)
{
  return a1;
}

uint64_t sub_33478()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_33488(unsigned char *a1)
{
  return sub_2B4A8(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_33490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_687A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_334F8()
{
  unint64_t result = qword_687D0;
  if (!qword_687D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_687D0);
  }
  return result;
}

unint64_t sub_3354C()
{
  unint64_t result = qword_687D8;
  if (!qword_687D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_687D8);
  }
  return result;
}

unint64_t sub_335A0()
{
  unint64_t result = qword_687F8;
  if (!qword_687F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_687F8);
  }
  return result;
}

unint64_t sub_335F4()
{
  unint64_t result = qword_68800;
  if (!qword_68800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68800);
  }
  return result;
}

uint64_t sub_33648(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_4950(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_336D4()
{
  unint64_t result = qword_68810;
  if (!qword_68810)
  {
    sub_4950(&qword_687A8);
    sub_33774();
    sub_4C14(&qword_68828, &qword_68830);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68810);
  }
  return result;
}

unint64_t sub_33774()
{
  unint64_t result = qword_68818;
  if (!qword_68818)
  {
    sub_4950(&qword_687A0);
    sub_4950(&qword_68790);
    sub_4C14(&qword_687C8, &qword_68790);
    swift_getOpaqueTypeConformance2();
    sub_33880(&qword_68820, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68818);
  }
  return result;
}

uint64_t sub_33880(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_338C8()
{
  sub_341FC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_33978(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    char v7 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v7;
    uint64_t v8 = a3[9];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    sub_4890(&qword_687C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_4BBB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[11];
    *((unsigned char *)v4 + a3[10]) = *((unsigned char *)a2 + a3[10]);
    uint64_t v14 = (void *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
  }
  swift_retain();
  return v4;
}

uint64_t sub_33AC4(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_4BBB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t sub_33B80(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  uint64_t v7 = a3[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  swift_retain();
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_4BBB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  return a1;
}

uint64_t sub_33C80(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[9];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    sub_33DAC(a1 + v7);
    sub_4890(&qword_687C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_4BBB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v11 = a3[11];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_33DAC(uint64_t a1)
{
  uint64_t v2 = sub_4890(&qword_687C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_33E0C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[9];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_4BBB0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_33F0C(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[9];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_33DAC(a1 + v7);
    uint64_t v10 = sub_4890(&qword_687C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_4BBB0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  swift_release();
  return a1;
}

uint64_t sub_34030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_34044);
}

uint64_t sub_34044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_4890(qword_68838);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 36);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 44));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_3410C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_34120);
}

uint64_t sub_34120(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_4890(qword_68838);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 36);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 44)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for PrivacyAndSecuritySettingsListItemNavigationLink()
{
  return sub_303F8();
}

void sub_341FC()
{
  if (!qword_688C0)
  {
    sub_4BBB0();
    unint64_t v0 = sub_4BDB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_688C0);
    }
  }
}

uint64_t sub_34254()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_3429C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_342D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4C050();
  __chkstk_darwin(v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_4C060();
}

uint64_t sub_343CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_4C050();
  __chkstk_darwin(v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_4C060();
}

uint64_t sub_344C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v81 = a2;
  uint64_t v5 = *(char **)(a1 + 16);
  uint64_t v6 = *(char **)(a1 + 24);
  uint64_t v7 = sub_4BF90();
  uint64_t WitnessTable = swift_getWitnessTable();
  v86[0] = v7;
  v86[1] = (uint64_t)&type metadata for Never;
  v86[2] = WitnessTable;
  uint64_t v87 = &protocol witness table for Never;
  uint64_t v9 = sub_4BE70();
  uint64_t v70 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9, v10);
  uint64_t v69 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11, v13);
  uint64_t v68 = (char *)&v68 - v15;
  uint64_t v72 = a1;
  uint64_t v71 = *(void *)(a1 - 8);
  uint64_t v16 = *(void *)(v71 + 64);
  __chkstk_darwin(v14, v17);
  char v18 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = WitnessTable;
  uint64_t v77 = v7;
  uint64_t v19 = type metadata accessor for AuthenticatedNavigationLink();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19, v19);
  long long v23 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v24);
  unint64_t v26 = (char *)&v68 - v25;
  uint64_t v73 = v27;
  uint64_t v80 = v9;
  uint64_t v28 = sub_4C070();
  uint64_t v79 = *(void *)(v28 - 8);
  __chkstk_darwin(v28, v29);
  uint64_t v78 = (char *)&v68 - v30;
  uint64_t v74 = v6;
  uint64_t v75 = v5;
  sub_34CD4(v3, v86);
  uint64_t v31 = *(int *)(a1 + 40);
  uint64_t v82 = (char *)v3;
  unsigned int v32 = *(unsigned __int8 *)(v3 + v31);
  if (v32 <= 0x1F && ((1 << v32) & 0x80000084) != 0)
  {
    sub_A2E4((uint64_t)v86, (uint64_t)v83);
    uint64_t v33 = v71;
    uint64_t v34 = v72;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))((char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v82, v72);
    uint64_t v35 = *(unsigned __int8 *)(v33 + 80);
    uint64_t v70 = v28;
    uint64_t v36 = (v35 + 72) & ~v35;
    uint64_t v37 = swift_allocObject();
    uint64_t v69 = v26;
    uint64_t v39 = v74;
    uint64_t v38 = v75;
    *(void *)(v37 + 16) = v75;
    *(void *)(v37 + 24) = v39;
    sub_352AC(v83, v37 + 32);
    uint64_t v40 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v37 + v36, v18, v34);
    __chkstk_darwin(v40, v41);
    *(&v68 - 4) = v38;
    *(&v68 - 3) = v39;
    *(&v68 - 2) = v82;
    sub_2D710(v32, (uint64_t)sub_352C4, v37, (void (*)(uint64_t))sub_3534C, (uint64_t)v23);
    uint64_t v42 = v73;
    swift_getWitnessTable();
    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    uint64_t v44 = v69;
    v43(v69, v23, v42);
    uint64_t v45 = *(void (**)(char *, uint64_t))(v20 + 8);
    v45(v23, v42);
    v43(v23, v44, v42);
    uint64_t v28 = v70;
    swift_getWitnessTable();
    uint64_t v46 = v78;
    sub_342D4((uint64_t)v23, v42);
    v45(v23, v42);
    v45(v44, v42);
  }
  else
  {
    uint64_t v47 = v87;
    uint64_t v48 = sub_78AC(v86, (uint64_t)v87);
    uint64_t v49 = sub_4C7F0();
    __chkstk_darwin(v49 - 8, v50);
    uint64_t v52 = (char *)&v68 - v51;
    uint64_t v53 = *(v47 - 1);
    (*(void (**)(char *, void *, void *))(v53 + 16))((char *)&v68 - v51, v48, v47);
    uint64_t v54 = (*(uint64_t (**)(char *, void, uint64_t, void *))(v53 + 56))(v52, 0, 1, v47);
    __chkstk_darwin(v54, v55);
    uint64_t v56 = v74;
    *(&v68 - 4) = v75;
    *(&v68 - 3) = v56;
    *(&v68 - 2) = v82;
    uint64_t v57 = (uint64_t)v69;
    sub_4BE60();
    uint64_t v58 = v80;
    swift_getWitnessTable();
    uint64_t v59 = v70;
    __int16 v60 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 16);
    uint64_t v61 = v68;
    v60(v68, v57, v58);
    long long v62 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v62(v57, v58);
    v60((char *)v57, (uint64_t)v61, v58);
    uint64_t v63 = v73;
    swift_getWitnessTable();
    uint64_t v46 = v78;
    sub_343CC(v57, v63, v58);
    v62(v57, v58);
    v62((uint64_t)v61, v58);
  }
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v65 = swift_getWitnessTable();
  uint64_t v84 = v64;
  uint64_t v85 = v65;
  swift_getWitnessTable();
  uint64_t v66 = v79;
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 16))(v81, v46, v28);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v46, v28);
  return sub_78F0((uint64_t)v86);
}

uint64_t sub_34CD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for PrivacyAndSecuritySettingsListItemNavigationLink();
  sub_114A8(*(unsigned char *)(a1 + *(int *)(v8 + 40)), (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_4BB80();
    a2[3] = v9;
    uint64_t v10 = (unint64_t *)&unk_688C8;
    uint64_t v11 = &type metadata accessor for SettingsAnyViewRecipe;
  }
  else
  {
    uint64_t v9 = sub_4BB60();
    a2[3] = v9;
    uint64_t v10 = (unint64_t *)&unk_688D0;
    uint64_t v11 = &type metadata accessor for PreferencesControllerRecipe;
  }
  a2[4] = sub_353D0(v10, (void (*)(uint64_t))v11);
  uint64_t v12 = sub_3536C(a2);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v12, v7, v9);
}

uint64_t sub_34E54(void *a1)
{
  uint64_t v2 = sub_4BBB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_78AC(a1, a1[3]);
  type metadata accessor for PrivacyAndSecuritySettingsListItemNavigationLink();
  sub_3A0D8((uint64_t)v6);
  sub_4BBA0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_34F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  __chkstk_darwin(a1, a2);
  uint64_t v5 = sub_4BF90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  uint64_t v13 = (char *)&v18 - v12;
  uint64_t v14 = type metadata accessor for PrivacyAndSecuritySettingsListItemNavigationLink();
  (*(void (**)(void))(a1 + *(int *)(v14 + 44)))();
  sub_4BFA0();
  swift_getWitnessTable();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v15(v13, v10, v5);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v10, v5);
  v15(a3, v13, v5);
  return ((uint64_t (*)(char *, uint64_t))v16)(v13, v5);
}

uint64_t sub_35164()
{
  uint64_t v1 = type metadata accessor for PrivacyAndSecuritySettingsListItemNavigationLink();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_78F0(v0 + 32);
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 36);
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4BBB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_352AC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_352C4()
{
  type metadata accessor for PrivacyAndSecuritySettingsListItemNavigationLink();

  return sub_34E54((void *)(v0 + 32));
}

uint64_t sub_3534C@<X0>(char *a1@<X8>)
{
  return sub_34F7C(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t *sub_3536C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_353D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_35418()
{
  return swift_getWitnessTable();
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsListSection()
{
  return &type metadata for PrivacyAndSecuritySettingsListSection;
}

uint64_t sub_35538()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_35554@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_4BE30();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_4890(&qword_688D8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = v1;
  long long v13 = v1[3];
  v24[0] = v1[2];
  v24[1] = v13;
  void v24[2] = v1[4];
  long long v14 = v1[1];
  v23[0] = *v1;
  v23[1] = v14;
  sub_35A88((uint64_t)v23 + 8, (uint64_t)v26);
  sub_35A88((uint64_t)v26, (uint64_t)v22);
  sub_35A88((uint64_t)v24 + 8, (uint64_t)v25);
  sub_35A88((uint64_t)v25, (uint64_t)v21);
  sub_35AF0(v26);
  sub_35AF0(v25);
  sub_4890(&qword_688E0);
  sub_4890(&qword_688E8);
  sub_35B24();
  sub_35B90();
  sub_4C350();
  uint64_t KeyPath = swift_getKeyPath();
  sub_4BE20();
  uint64_t v16 = (uint64_t *)(a1 + *(int *)(sub_4890(&qword_68908) + 36));
  uint64_t v17 = sub_4890(&qword_68430);
  (*(void (**)(char *, unsigned char *, uint64_t))(v4 + 16))((char *)v16 + *(int *)(v17 + 28), v7, v3);
  *uint64_t v16 = KeyPath;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v9 + 16))(a1, v12, v8);
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v12, v8);
}

uint64_t sub_35828()
{
  return sub_4C340();
}

uint64_t sub_358F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  unint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  __int16 v13 = *(_WORD *)(a1 + 96);
  *(unsigned char *)a2 = *(unsigned char *)a1;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v2;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v11;
  *(void *)(a2 + 88) = v12;
  *(_WORD *)(a2 + 96) = v13;
  return sub_87DC(v3, v2, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

id sub_35960()
{
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (void *)sub_4B9B0();
    sub_3B3F0((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v3 = (void *)sub_4C440();
    swift_bridgeObjectRelease();
    [v1 openSensitiveURL:v2 withOptions:v3];

    return (id)sub_4BE00();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_35A3C@<X0>(uint64_t a1@<X8>)
{
  return sub_35554(a1);
}

uint64_t sub_35A80()
{
  return sub_35828();
}

uint64_t sub_35A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_688E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_35AF0(uint64_t *a1)
{
  return a1;
}

unint64_t sub_35B24()
{
  unint64_t result = qword_688F0;
  if (!qword_688F0)
  {
    sub_4950(&qword_688E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_688F0);
  }
  return result;
}

unint64_t sub_35B90()
{
  unint64_t result = qword_688F8;
  if (!qword_688F8)
  {
    sub_4950(&qword_688E8);
    sub_35C04();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_688F8);
  }
  return result;
}

unint64_t sub_35C04()
{
  unint64_t result = qword_68900;
  if (!qword_68900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68900);
  }
  return result;
}

unint64_t sub_35C60()
{
  unint64_t result = qword_68920;
  if (!qword_68920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68920);
  }
  return result;
}

unint64_t sub_35CB8()
{
  unint64_t result = qword_68928;
  if (!qword_68928)
  {
    sub_4950(&qword_68908);
    sub_35D58();
    sub_4C14(&qword_68428, &qword_68430);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68928);
  }
  return result;
}

unint64_t sub_35D58()
{
  unint64_t result = qword_68930;
  if (!qword_68930)
  {
    sub_4950(&qword_688D8);
    sub_35B24();
    sub_35B90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68930);
  }
  return result;
}

uint64_t *sub_35DD8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_4890(&qword_687C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_4BBB0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      uint64_t *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)v4 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_4890(&qword_68938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_4BB90();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    long long v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    sub_4890(&qword_68940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_4BE30();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *long long v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = (uint64_t *)((char *)v4 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = (uint64_t *)((char *)v4 + v18);
    long long v23 = (char *)a2 + v18;
    uint64_t v25 = *(void **)v23;
    uint64_t v24 = *((void *)v23 + 1);
    *uint64_t v22 = *(void *)v23;
    v22[1] = v24;
    uint64_t v26 = a3[9];
    uint64_t v27 = (char *)v4 + v26;
    uint64_t v28 = (char *)a2 + v26;
    long long v29 = *((_OWORD *)v28 + 1);
    *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
    *((_OWORD *)v27 + 1) = v29;
    *((void *)v27 + 4) = *((void *)v28 + 4);
    swift_retain();
    swift_retain();
    id v30 = v25;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_3607C(uint64_t a1, int *a2)
{
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_4BBB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  sub_4890(&qword_68938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4BB90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + a2[6];
  sub_4890(&qword_68940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_4BE30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  swift_release();

  return swift_release();
}

void *sub_36230(void *a1, void *a2, int *a3)
{
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4BBB0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_4890(&qword_68938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_4BB90();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  sub_4890(&qword_68940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_4BE30();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)((char *)a1 + v15);
  uint64_t v18 = (void *)((char *)a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)((char *)a1 + v16);
  uint64_t v21 = (char *)a2 + v16;
  long long v23 = *(void **)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *uint64_t v20 = *(void *)v21;
  v20[1] = v22;
  uint64_t v24 = a3[9];
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  long long v27 = *((_OWORD *)v26 + 1);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *((_OWORD *)v25 + 1) = v27;
  *((void *)v25 + 4) = *((void *)v26 + 4);
  swift_retain();
  swift_retain();
  id v28 = v23;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_36488(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_4B7C((uint64_t)a1, &qword_687C0);
    sub_4890(&qword_687C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_4BBB0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_4B7C((uint64_t)a1 + v7, &qword_68938);
    sub_4890(&qword_68938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_4BB90();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)((char *)a1 + v11);
    uint64_t v13 = (void *)((char *)a2 + v11);
    sub_4B7C((uint64_t)a1 + v11, &qword_68940);
    sub_4890(&qword_68940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_4BE30();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
  swift_retain();
  swift_release();
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_retain();
  swift_release();
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = *(void **)((char *)a2 + v18);
  uint64_t v22 = *(void **)v19;
  *(void *)uint64_t v19 = v21;
  id v23 = v21;

  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_release();
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  _OWORD v25[2] = v26[2];
  v25[3] = v26[3];
  uint64_t v25[4] = v26[4];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_36770(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_4BBB0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_4890(&qword_68938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_4BB90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = sub_4890(&qword_68940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_4BE30();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  uint64_t v18 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  long long v22 = *((_OWORD *)v21 + 1);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *((_OWORD *)v20 + 1) = v22;
  *((void *)v20 + 4) = *((void *)v21 + 4);
  return a1;
}

char *sub_369B0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_4B7C((uint64_t)a1, &qword_687C0);
    uint64_t v6 = sub_4890(&qword_687C0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_4BBB0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_4B7C((uint64_t)&a1[v8], &qword_68938);
    uint64_t v11 = sub_4890(&qword_68938);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_4BB90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v13 = a3[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    sub_4B7C((uint64_t)&a1[v13], &qword_68940);
    uint64_t v16 = sub_4890(&qword_68940);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_4BE30();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  swift_release();
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_release();
  uint64_t v21 = a3[8];
  long long v22 = &a1[v21];
  id v23 = &a2[v21];
  uint64_t v24 = *(void **)&a1[v21];
  *(void *)&a1[v21] = *(void *)&a2[v21];

  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_release();
  uint64_t v25 = a3[9];
  uint64_t v26 = &a1[v25];
  long long v27 = &a2[v25];
  long long v28 = *((_OWORD *)v27 + 1);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  *((_OWORD *)v26 + 1) = v28;
  *((void *)v26 + 4) = *((void *)v27 + 4);
  swift_release();
  return a1;
}

uint64_t sub_36C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_36C88);
}

uint64_t sub_36C88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_4890(qword_68838);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_4890(&qword_68948);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = sub_4890(&qword_68950);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_36DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_36E08);
}

uint64_t sub_36E08(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_4890(qword_68838);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = sub_4890(&qword_68948);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = sub_4890(&qword_68950);
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for PrivacyAndSecuritySettingsList()
{
  uint64_t result = qword_689B0;
  if (!qword_689B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_36FBC()
{
  sub_37128(319, (unint64_t *)&qword_688C0, (void (*)(uint64_t))&type metadata accessor for AppendSettingsNavigationPathAction);
  if (v0 <= 0x3F)
  {
    sub_37128(319, &qword_689C0, (void (*)(uint64_t))&type metadata accessor for ClearSettingsNavigationPathAction);
    if (v1 <= 0x3F)
    {
      sub_37128(319, (unint64_t *)&unk_689C8, (void (*)(uint64_t))&type metadata accessor for OpenURLAction);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_37128(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_4BDB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_3717C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_37198()
{
  return sub_4BF10();
}

uint64_t sub_371BC(uint64_t a1)
{
  uint64_t v2 = sub_4BE30();
  __chkstk_darwin(v2, v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_4BF20();
}

uint64_t sub_37284@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_4890(&qword_687C0);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (int *)type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v3 = (uint64_t *)((char *)a1 + v2[5]);
  *uint64_t v3 = swift_getKeyPath();
  sub_4890(&qword_68938);
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (uint64_t *)((char *)a1 + v2[6]);
  uint64_t *v4 = swift_getKeyPath();
  sub_4890(&qword_68940);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  swift_retain();
  sub_4C2A0();
  *(_OWORD *)((char *)a1 + v2[7]) = v7;
  sub_4C2A0();
  uint64_t v5 = (char *)a1 + v2[9];
  *(_OWORD *)uint64_t v5 = v7;
  *((_OWORD *)v5 + 1) = v8;
  *((void *)v5 + 4) = v9;
  sub_1222C(0, &qword_68B30);
  sub_4C2A0();
  uint64_t result = swift_release();
  *(_OWORD *)((char *)a1 + v2[8]) = v7;
  return result;
}

uint64_t sub_37414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v106 = a1;
  uint64_t v96 = a3;
  uint64_t v115 = sub_4C420();
  uint64_t v117 = *(void *)(v115 - 8);
  __chkstk_darwin(v115, v4);
  unint64_t v116 = (uint64_t *)((char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v7 = v6 - 8;
  uint64_t v111 = *(void *)(v6 - 8);
  uint64_t v110 = *(void *)(v111 + 64);
  __chkstk_darwin(v6, v8);
  uint64_t v108 = (uint64_t)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_4BE90();
  uint64_t v10 = *(void *)(v100 - 8);
  uint64_t v99 = *(void *)(v10 + 64);
  __chkstk_darwin(v100, v11);
  uint64_t v13 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_4890(&qword_68A08);
  uint64_t v101 = *(void *)(v103 - 8);
  __chkstk_darwin(v103, v14);
  unint64_t v16 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_4890(&qword_68A10);
  uint64_t v18 = v17 - 8;
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_4890(&qword_68A18);
  __chkstk_darwin(v104, v22);
  uint64_t v102 = (uint64_t)&v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_4890(&qword_68A20);
  uint64_t v112 = *(void *)(v24 - 8);
  uint64_t v113 = v24;
  __chkstk_darwin(v24, v25);
  Swift::Int v105 = (char *)&v90 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_4890(&qword_68A28);
  __chkstk_darwin(v107, v27);
  uint64_t v109 = (char *)&v90 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_4890(&qword_68A30);
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95, v29);
  uint64_t v114 = (char *)&v90 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_4890(&qword_68A38);
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93, v31);
  uint64_t v91 = (char *)&v90 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = a2;
  uint64_t v118 = a2;
  sub_4890(&qword_68A40);
  sub_4C14(&qword_68A48, &qword_68A40);
  sub_4C120();
  uint64_t v33 = (uint64_t *)(a2 + *(int *)(v7 + 36));
  unint64_t v34 = v33[1];
  uint64_t v119 = *v33;
  unint64_t v120 = v34;
  uint64_t v98 = sub_4890(&qword_68A50);
  sub_4C2B0();
  uint64_t v35 = *(void *)(v121
                  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_scrollToItemSubject);
  swift_retain();
  swift_release();
  uint64_t v36 = v13;
  uint64_t v37 = v13;
  uint64_t v38 = v100;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v106, v100);
  unint64_t v39 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v40 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v40 + v39, v36, v38);
  uint64_t v41 = v101;
  uint64_t v42 = v103;
  (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v21, v16, v103);
  *(void *)&v21[*(int *)(v18 + 60)] = v35;
  uint64_t v43 = (uint64_t (**)())&v21[*(int *)(v18 + 64)];
  char *v43 = sub_39BFC;
  v43[1] = (uint64_t (*)())v40;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v42);
  uint64_t v44 = v108;
  sub_39A18(v97, v108);
  unint64_t v45 = (*(unsigned __int8 *)(v111 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v111 + 80);
  uint64_t v46 = swift_allocObject();
  sub_39A80(v44, v46 + v45);
  uint64_t v47 = v102;
  sub_4B18((uint64_t)v21, v102, &qword_68A10);
  uint64_t v48 = (uint64_t (**)())(v47 + *(int *)(v104 + 36));
  void *v48 = sub_39C70;
  v48[1] = (uint64_t (*)())v46;
  v48[2] = 0;
  v48[3] = 0;
  sub_4B7C((uint64_t)v21, &qword_68A10);
  unint64_t v49 = v33[1];
  uint64_t v119 = *v33;
  unint64_t v120 = v49;
  sub_4C2B0();
  type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  sub_39CD0();
  sub_3ACD4(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  uint64_t v50 = v105;
  sub_4C1F0();
  swift_release();
  sub_4B7C(v47, &qword_68A18);
  uint64_t v51 = sub_4C380();
  unint64_t v52 = v33[1];
  uint64_t v119 = *v33;
  unint64_t v120 = v52;
  uint64_t v53 = v107;
  sub_4C2B0();
  uint64_t v54 = sub_3B714();
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  swift_release();
  uint64_t v60 = v112;
  uint64_t v59 = v113;
  uint64_t v61 = (uint64_t)v109;
  (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v109, v50, v113);
  long long v62 = (uint64_t *)(v61 + *(int *)(v53 + 36));
  *long long v62 = v51;
  v62[1] = v54;
  v62[2] = v56;
  v62[3] = v58;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v50, v59);
  unint64_t v63 = sub_39D70();
  sub_4C1A0();
  sub_4B7C(v61, &qword_68A28);
  uint64_t v64 = v116;
  *unint64_t v116 = 0xD00000000000001ELL;
  v64[1] = 0x8000000000050240;
  (*(void (**)(void))(v117 + 104))();
  uint64_t v113 = sub_4B980();
  uint64_t v65 = *(void *)(v113 - 8);
  __chkstk_darwin(v113, v66);
  uint64_t v68 = (char *)&v90 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_4C4C0();
  __chkstk_darwin(v69 - 8, v70);
  sub_4C4B0();
  uint64_t v71 = sub_4B970();
  uint64_t v72 = *(void *)(v71 - 8);
  __chkstk_darwin(v71, v73);
  uint64_t v75 = (char *)&v90 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v76 = [(id)qword_6B268 bundleURL];
  sub_4B9D0();

  (*(void (**)(char *, void, uint64_t))(v72 + 104))(v75, enum case for LocalizedStringResource.BundleDescription.atURL(_:), v71);
  uint64_t v77 = sub_4BA20();
  __chkstk_darwin(v77 - 8, v78);
  sub_4BA10();
  sub_4B990();
  uint64_t v79 = sub_4890(&qword_681B0);
  __chkstk_darwin(v79 - 8, v80);
  uint64_t v82 = (char *)&v90 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4B9E0();
  uint64_t v83 = sub_4B9F0();
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v84 + 48))(v82, 1, v83);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v119 = v53;
    unint64_t v120 = v63;
    swift_getOpaqueTypeConformance2();
    uint64_t v86 = v91;
    uint64_t v87 = v116;
    uint64_t v88 = v95;
    uint64_t v89 = v114;
    sub_4C1B0();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v113);
    (*(void (**)(void *, uint64_t))(v117 + 8))(v87, v115);
    (*(void (**)(char *, uint64_t))(v94 + 8))(v89, v88);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v82, v83);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v92 + 32))(v96, v86, v93);
  }
  return result;
}

uint64_t sub_38108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = sub_4890(&qword_68A90);
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  uint64_t v5 = __chkstk_darwin(v3, v4);
  uint64_t v47 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  uint64_t v46 = (char *)&v43 - v8;
  uint64_t v9 = type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v10 = v9 - 8;
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v45 + 64);
  __chkstk_darwin(v9, v12);
  uint64_t v13 = sub_4890(&qword_68A98);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_4890(&qword_68AA0);
  uint64_t v19 = v18 - 8;
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v24);
  uint64_t v43 = a1;
  uint64_t v44 = (uint64_t)&v43 - v25;
  uint64_t v51 = a1;
  sub_4890(&qword_68AA8);
  sub_3A4B8();
  sub_4C360();
  sub_39A18(a1, (uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v26 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  uint64_t v27 = swift_allocObject();
  sub_39A80((uint64_t)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v23, v17, v13);
  uint64_t v28 = (CGFloat (**)@<D0>(uint64_t@<X8>))&v23[*(int *)(v19 + 44)];
  *uint64_t v28 = sub_391AC;
  v28[1] = 0;
  void v28[2] = (CGFloat (*)@<D0>(uint64_t@<X8>))sub_3A5FC;
  v28[3] = (CGFloat (*)@<D0>(uint64_t@<X8>))v27;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  uint64_t v29 = v44;
  sub_3A66C((uint64_t)v23, v44);
  uint64_t v30 = (uint64_t *)(v43 + *(int *)(v10 + 36));
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  uint64_t v52 = v32;
  uint64_t v53 = v31;
  sub_4890(&qword_68A50);
  sub_4C2B0();
  uint64_t v33 = sub_3B714();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v52 = v33;
  sub_4890(&qword_68AE8);
  sub_4C14(&qword_68AF0, &qword_68AE8);
  sub_3A6D4();
  sub_3A728();
  unint64_t v34 = v46;
  sub_4C340();
  sub_4B18(v29, (uint64_t)v23, &qword_68AA0);
  uint64_t v36 = v47;
  uint64_t v35 = v48;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  uint64_t v38 = v49;
  v37(v47, v34, v49);
  uint64_t v39 = v50;
  sub_4B18((uint64_t)v23, v50, &qword_68AA0);
  uint64_t v40 = sub_4890(&qword_68B08);
  v37((char *)(v39 + *(int *)(v40 + 48)), v36, v38);
  uint64_t v41 = *(void (**)(char *, uint64_t))(v35 + 8);
  v41(v34, v38);
  sub_4B7C(v29, &qword_68AA0);
  v41(v36, v38);
  return sub_4B7C((uint64_t)v23, &qword_68AA0);
}

uint64_t sub_385FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  *(void *)&long long v51 = type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v45 = *(void *)(v51 - 8);
  uint64_t v3 = *(void *)(v45 + 64);
  uint64_t v5 = __chkstk_darwin(v51, v4);
  uint64_t v46 = (uint64_t)v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)v44 - v7;
  uint64_t v9 = sub_4890(&qword_68AD0);
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v50 = v9;
  __chkstk_darwin(v9, v10);
  uint64_t v48 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_4890(&qword_68AC0);
  __chkstk_darwin(v47, v12);
  uint64_t v14 = (char *)v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_66ED0 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)qword_6B268;
  uint64_t v16 = (void *)sub_4C4D0();
  id v17 = [v15 localizedStringForKey:v16 value:0 table:0];

  uint64_t v18 = sub_4C500();
  uint64_t v20 = v19;

  uint64_t v21 = (void *)qword_6B268;
  uint64_t v22 = (void *)sub_4C4D0();
  id v23 = [v21 localizedStringForKey:v22 value:0 table:0];

  uint64_t v24 = sub_4C500();
  v44[0] = v25;
  v44[1] = v24;

  sub_39A18(a1, (uint64_t)v8);
  uint64_t v26 = a1;
  uint64_t v27 = *(unsigned __int8 *)(v45 + 80);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v18;
  *(void *)(v28 + 24) = v20;
  sub_39A80((uint64_t)v8, v28 + ((v27 + 32) & ~v27));
  uint64_t v29 = v46;
  sub_39A18(v26, v46);
  uint64_t v30 = (v27 + 16) & ~v27;
  uint64_t v31 = swift_allocObject();
  sub_39A80(v29, v31 + v30);
  swift_bridgeObjectRetain();
  uint64_t v32 = v48;
  sub_4C430();
  uint64_t v34 = v49;
  uint64_t v33 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v14, v32, v50);
  uint64_t v35 = &v14[*(int *)(v47 + 36)];
  v35[32] = 0;
  *(_OWORD *)uint64_t v35 = 0u;
  *((_OWORD *)v35 + 1) = 0u;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v33);
  uint64_t v36 = v26 + *(int *)(v51 + 36);
  uint64_t v37 = *(void *)(v36 + 32);
  long long v38 = *(_OWORD *)(v36 + 16);
  long long v53 = *(_OWORD *)v36;
  long long v54 = v38;
  uint64_t v55 = v37;
  sub_4890(&qword_68B10);
  sub_4C2B0();
  long long v51 = v56;
  uint64_t v39 = v57;
  uint64_t v40 = v58;
  LOBYTE(v33) = sub_4C100();
  uint64_t v41 = v52;
  sub_4B18((uint64_t)v14, v52, &qword_68AC0);
  uint64_t v42 = v41 + *(int *)(sub_4890(&qword_68AA8) + 36);
  *(unsigned char *)uint64_t v42 = v33;
  *(_OWORD *)(v42 + 8) = v51;
  *(void *)(v42 + 24) = v39;
  *(void *)(v42 + 32) = v40;
  *(unsigned char *)(v42 + 40) = 0;
  return sub_4B7C((uint64_t)v14, &qword_68AC0);
}

uint64_t sub_38A88(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = a4;
  uint64_t v5 = type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5 - 8, v8);
  id v9 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v10 = self;
  uint64_t v11 = (void *)sub_4C4D0();
  id v12 = [v10 preferredFontForTextStyle:v11];

  [v9 setFont:v12];
  sub_4890(&qword_68B18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_4E890;
  *(void *)(inited + 32) = NSForegroundColorAttributeName;
  uint64_t v14 = self;
  id v15 = v9;
  swift_bridgeObjectRetain();
  uint64_t v16 = NSForegroundColorAttributeName;
  id v17 = [v14 labelColor];
  id v18 = [v17 colorWithAlphaComponent:a1];

  *(void *)(inited + 64) = sub_1222C(0, &qword_68B20);
  *(void *)(inited + 40) = v18;
  sub_3B528(inited);
  id v19 = objc_allocWithZone((Class)NSAttributedString);
  uint64_t v20 = (void *)sub_4C4D0();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_3ACD4(&qword_66F68, type metadata accessor for Key);
  uint64_t v21 = (void *)sub_4C440();
  swift_bridgeObjectRelease();
  id v22 = [v19 initWithString:v20 attributes:v21];

  id v23 = v15;
  id v40 = v15;
  [v15 setAttributedText:v22];

  sub_1222C(0, (unint64_t *)&qword_67540);
  uint64_t v41 = sub_4C710();
  sub_39A18(v42, (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v24 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v25 = swift_allocObject();
  sub_39A80((uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
  *(void *)(v25 + ((v7 + v24 + 7) & 0xFFFFFFFFFFFFFFF8)) = v23;
  aBlock[4] = sub_3AF64;
  aBlock[5] = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_130CC;
  aBlock[3] = &unk_5FB58;
  uint64_t v26 = _Block_copy(aBlock);
  swift_release();
  uint64_t v27 = sub_4C3E0();
  uint64_t v28 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v29);
  uint64_t v31 = (char *)&v39 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4C3C0();
  uint64_t v32 = sub_4C3A0();
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32, v34);
  uint64_t v36 = (char *)&v39 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_13830();
  sub_4890(&qword_67550);
  sub_4C14((unint64_t *)&qword_67558, &qword_67550);
  sub_4C850();
  uint64_t v37 = (void *)v41;
  sub_4C720();

  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v31, v27);
}

void sub_3900C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for PrivacyAndSecuritySettingsList();
  sub_4890(&qword_68B28);
  sub_4C2B0();
  [v3 setTitleView:a2];
}

uint64_t sub_39084()
{
  uint64_t v0 = sub_4BE30();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PrivacyAndSecuritySettingsList();
  sub_3A110(&qword_68940, (uint64_t (*)(void))&type metadata accessor for OpenURLAction, 0x414C52556E65704FLL, 0xED00006E6F697463, (uint64_t)v4);
  sub_4BDF0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

CGFloat sub_391AC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_4C080();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4C0A0();
  sub_4BDE0();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  id v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v6, v2);
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  CGFloat v16 = CGRectGetWidth(v28) * 0.05;
  sub_4C0A0();
  sub_4BDE0();
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v15(v6, v2);
  v29.origin.x = v18;
  v29.origin.y = v20;
  v29.size.width = v22;
  v29.size.height = v24;
  CGFloat Width = CGRectGetWidth(v29);
  *(void *)a1 = 0;
  CGFloat result = Width * 0.05;
  *(CGFloat *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = 0;
  *(CGFloat *)(a1 + 24) = result;
  return result;
}

uint64_t sub_39348()
{
  return sub_4C2C0();
}

uint64_t sub_393CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  *(unsigned char *)a2 = *(unsigned char *)a1;
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v2;
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(void *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  sub_98F4(v3, v2, v4, v5);
  sub_98F4(v6, v7, v8, v9);

  return swift_bridgeObjectRetain();
}

uint64_t sub_39458()
{
  return swift_release();
}

uint64_t sub_394CC(uint64_t a1)
{
  uint64_t v2 = sub_4890(&qword_68A80);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4890(&qword_68A88);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_66EE0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_4BC10();
  sub_7874(v10, (uint64_t)qword_6B288);
  double v11 = sub_4BBF0();
  os_log_type_t v12 = sub_4C6C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v27 = sub_1C340(0xD00000000000001ELL, 0x800000000004F6F0, &v25);
    sub_4C800();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v27 = sub_1C340(2036625250, 0xE400000000000000, &v25);
    sub_4C800();
    _os_log_impl(&dword_0, v11, v12, "%s.%s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  CGFloat v14 = (uint64_t *)(a1 + *(int *)(type metadata accessor for PrivacyAndSecuritySettingsList() + 28));
  uint64_t v15 = v14[1];
  uint64_t v25 = *v14;
  uint64_t v26 = v15;
  sub_4890(&qword_68A50);
  sub_4C2B0();
  uint64_t v16 = v27;
  sub_3A110(&qword_687C0, (uint64_t (*)(void))&type metadata accessor for AppendSettingsNavigationPathAction, 0xD000000000000022, 0x8000000000052900, (uint64_t)v9);
  uint64_t v17 = sub_4BBB0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 0, 1, v17);
  uint64_t v18 = v16
      + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_appendSettingsNavigationPath;
  swift_beginAccess();
  sub_3A3C8((uint64_t)v9, v18, &qword_68A88);
  swift_endAccess();
  swift_release();
  uint64_t v19 = v14[1];
  uint64_t v25 = *v14;
  uint64_t v26 = v19;
  sub_4C2B0();
  uint64_t v20 = v27;
  sub_3A110(&qword_68938, (uint64_t (*)(void))&type metadata accessor for ClearSettingsNavigationPathAction, 0xD000000000000021, 0x80000000000528D0, (uint64_t)v5);
  uint64_t v21 = sub_4BB90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v5, 0, 1, v21);
  uint64_t v22 = v20
      + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_clearSettingsNavigationPath;
  swift_beginAccess();
  sub_3A3C8((uint64_t)v5, v22, &qword_68A80);
  swift_endAccess();
  swift_release();
  uint64_t v23 = v14[1];
  uint64_t v25 = *v14;
  uint64_t v26 = v23;
  sub_4C2B0();
  sub_3BC94();
  return swift_release();
}

uint64_t sub_3992C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(a1 - 8, a2);
  sub_39A18(v3, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  uint64_t result = sub_39A80((uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a3 = sub_39AE4;
  a3[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v8;
  return result;
}

uint64_t sub_39A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrivacyAndSecuritySettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_39A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PrivacyAndSecuritySettingsList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_39AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PrivacyAndSecuritySettingsList() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_37414(a1, v6, a2);
}

uint64_t sub_39B64@<X0>(uint64_t a1@<X8>)
{
  return sub_38108(*(void *)(v1 + 16), a1);
}

uint64_t sub_39B6C()
{
  uint64_t v1 = sub_4BE90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_39BFC()
{
  sub_4BE90();

  return sub_39458();
}

uint64_t sub_39C70()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivacyAndSecuritySettingsList() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_394CC(v2);
}

unint64_t sub_39CD0()
{
  unint64_t result = qword_68A58;
  if (!qword_68A58)
  {
    sub_4950(&qword_68A18);
    sub_4C14(&qword_68A60, &qword_68A10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68A58);
  }
  return result;
}

unint64_t sub_39D70()
{
  unint64_t result = qword_68A68;
  if (!qword_68A68)
  {
    sub_4950(&qword_68A28);
    sub_4950(&qword_68A18);
    type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
    sub_39CD0();
    sub_3ACD4(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
    swift_getOpaqueTypeConformance2();
    sub_4C14(&qword_68A70, &qword_68A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68A68);
  }
  return result;
}

double sub_39E94(uint64_t a1, char a2)
{
  uint64_t v4 = sub_4BF60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_4C6B0();
  uint64_t v9 = sub_4C0F0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)double v11 = 136315138;
    uint64_t v13 = sub_1C340(0x74616F6C464743, 0xE700000000000000, &v14);
    sub_4C800();
    _os_log_impl(&dword_0, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_4BF50();
  swift_getAtKeyPath();
  sub_4664(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v14;
}

uint64_t sub_3A0A0@<X0>(uint64_t a1@<X8>)
{
  return sub_3A110(&qword_67408, (uint64_t (*)(void))&type metadata accessor for WithCurrentHostingControllerAction, 0xD000000000000022, 0x8000000000052980, a1);
}

uint64_t sub_3A0D8@<X0>(uint64_t a1@<X8>)
{
  return sub_3A110(&qword_687C0, (uint64_t (*)(void))&type metadata accessor for AppendSettingsNavigationPathAction, 0xD000000000000022, 0x8000000000052900, a1);
}

uint64_t sub_3A110@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_4BF60();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_4890(a1);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4B18(v9, (uint64_t)v19, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(a5, v19, v20);
  }
  else
  {
    os_log_type_t v22 = sub_4C6B0();
    uint64_t v23 = sub_4C0F0();
    if (os_log_type_enabled(v23, v22))
    {
      unint64_t v27 = a4;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v28 = a5;
      uint64_t v25 = (uint8_t *)v24;
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v30 = sub_1C340(v29, v27, &v31);
      sub_4C800();
      _os_log_impl(&dword_0, v23, v22, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_4BF50();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
}

uint64_t sub_3A3C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4890(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_3A42C()
{
  return sub_4BEF0();
}

uint64_t sub_3A450()
{
  return sub_4BE80();
}

uint64_t sub_3A4B0@<X0>(uint64_t a1@<X8>)
{
  return sub_385FC(*(void *)(v1 + 16), a1);
}

unint64_t sub_3A4B8()
{
  unint64_t result = qword_68AB0;
  if (!qword_68AB0)
  {
    sub_4950(&qword_68AA8);
    sub_3A534();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68AB0);
  }
  return result;
}

unint64_t sub_3A534()
{
  unint64_t result = qword_68AB8;
  if (!qword_68AB8)
  {
    sub_4950(&qword_68AC0);
    sub_4C14(&qword_68AC8, &qword_68AD0);
    sub_4C14(&qword_68AD8, &qword_68AE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68AB8);
  }
  return result;
}

uint64_t sub_3A5FC()
{
  type metadata accessor for PrivacyAndSecuritySettingsList();

  return sub_39348();
}

uint64_t sub_3A66C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_68AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_3A6D4()
{
  unint64_t result = qword_68AF8;
  if (!qword_68AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68AF8);
  }
  return result;
}

unint64_t sub_3A728()
{
  unint64_t result = qword_68B00;
  if (!qword_68B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68B00);
  }
  return result;
}

uint64_t sub_3A77C()
{
  uint64_t v1 = (int *)type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4BBB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_4890(&qword_68938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_4BB90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v5 + v1[6];
  sub_4890(&qword_68940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_4BE30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_3A9B8(double a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for PrivacyAndSecuritySettingsList() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_38A88(a1, v4, v5, v6);
}

uint64_t sub_3AA30()
{
  uint64_t v1 = (int *)type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4BBB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_4890(&qword_68938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_4BB90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v5 + v1[6];
  sub_4890(&qword_68940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_4BE30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_3AC64()
{
  type metadata accessor for PrivacyAndSecuritySettingsList();

  return sub_39084();
}

uint64_t sub_3ACD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3AD1C()
{
  uint64_t v1 = (int *)type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_4890(&qword_687C0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_4BBB0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  sub_4890(&qword_68938);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_4BB90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v5 + v1[6];
  sub_4890(&qword_68940);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_4BE30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  unint64_t v11 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v11 + 8, v2 | 7);
}

void sub_3AF64()
{
  uint64_t v1 = *(void *)(type metadata accessor for PrivacyAndSecuritySettingsList() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_3900C(v0 + v2, v3);
}

uint64_t sub_3AFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_3B000()
{
  return swift_release();
}

uint64_t sub_3B008()
{
  return sub_4BEF0();
}

uint64_t sub_3B02C()
{
  return sub_4BEE0();
}

uint64_t sub_3B050()
{
  return sub_4BF10();
}

uint64_t sub_3B078()
{
  return sub_4C14(&qword_68B38, &qword_68B40);
}

unint64_t sub_3B0B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4890(&qword_67250);
  uint64_t v2 = (void *)sub_4CA00();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1F370(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_3B1D0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4890(&qword_67260);
  uint64_t v2 = (void *)sub_4CA00();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_1F42C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_3B2DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4890(&qword_68DF0);
  uint64_t v2 = (void *)sub_4CA00();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1F370(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_3B3F0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4890(&qword_68DF8);
  uint64_t v2 = sub_4CA00();
  uint64_t v3 = (void *)v2;
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
    sub_4B18(v6, (uint64_t)&v15, &qword_68E00);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1F370(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10DF4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_3B528(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4890(&qword_68D58);
  uint64_t v2 = sub_4CA00();
  uint64_t v3 = (void *)v2;
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
    sub_4B18(v6, (uint64_t)&v13, &qword_68D60);
    uint64_t v7 = v13;
    unint64_t result = sub_1F4E0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10DF4(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

void sub_3B658(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_3B6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_3B714()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  v38[0] = v0;
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v2 = *(void *)(v0 + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 24);
LABEL_22:
    sub_49B98(v2);
    return v3;
  }
  if (qword_66EE8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_4BC10();
  sub_7874(v4, (uint64_t)qword_6B2A0);
  uint64_t v5 = sub_4BBF0();
  os_log_type_t v6 = sub_4C6C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "No cached data model found, requesting new snapshot.", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = sub_3CECC();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = (void *)(v8 + 32);
    uint64_t v31 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel__communicationSafetySetupHasCompleted;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v35 = _swiftEmptyArrayStorage;
    uint64_t v30 = v1;
    do
    {
      sub_A2E4((uint64_t)v10, (uint64_t)v36);
      sub_4890(&qword_68C98);
      type metadata accessor for SensitiveContentWarningListSectionModelProvider();
      if (!swift_dynamicCast()
        || (swift_release(),
            swift_getKeyPath(),
            v36[0] = v1,
            sub_4BA40(),
            swift_release(),
            (*(unsigned char *)(v1 + v31) & 1) != 0))
      {
        uint64_t v12 = v10[3];
        uint64_t v13 = v10[4];
        sub_78AC(v10, v12);
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 16))(v37, v12, v13);
        char v14 = v37[0];
        uint64_t v15 = v37[1];
        uint64_t v17 = v37[2];
        uint64_t v16 = v37[3];
        uint64_t v19 = v37[4];
        uint64_t v18 = v37[5];
        uint64_t v20 = v37[6];
        uint64_t v34 = v37[7];
        uint64_t v33 = v37[8];
        uint64_t v32 = v37[9];
        sub_26130((uint64_t)v37, (uint64_t)v38);
        if (v38[9])
        {
          uint64_t v21 = v35;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v21 = sub_46CB0(0, v35[2] + 1, 1, v35);
          }
          os_log_type_t v22 = v21;
          unint64_t v23 = v21[2];
          uint64_t v35 = v22;
          unint64_t v24 = v22[3];
          if (v23 >= v24 >> 1) {
            uint64_t v35 = sub_46CB0((void *)(v24 > 1), v23 + 1, 1, v35);
          }
          v35[2] = v23 + 1;
          BOOL v11 = &v35[10 * v23];
          *((unsigned char *)v11 + 32) = v14;
          v11[5] = v15;
          v11[6] = v17;
          v11[7] = v16;
          v11[8] = v19;
          v11[9] = v18;
          v11[10] = v20;
          v11[11] = v34;
          v11[12] = v33;
          v11[13] = v32;
          uint64_t v1 = v30;
        }
      }
      v10 += 5;
      --v9;
    }
    while (v9);
    swift_release();
    swift_bridgeObjectRelease_n();
    uint64_t v25 = v1;
    uint64_t v26 = v35;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = _swiftEmptyArrayStorage;
    uint64_t v25 = v1;
  }
  sub_10760((uint64_t)v26);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath, v28);
  v36[0] = v25;
  sub_4BA30();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v36[0] = v25;
  sub_4BA40();
  uint64_t result = swift_release();
  uint64_t v3 = *(void *)(v25 + 24);
  if (v3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v2 = 0;
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_3BC94()
{
  uint64_t v1 = (void *)v0;
  swift_getKeyPath();
  uint64_t v16 = (void *)v0;
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  uint64_t result = swift_release();
  if (*(void *)(v0 + 56))
  {
    if (qword_66EE0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_4BC10();
    sub_7874(v3, (uint64_t)qword_6B288);
    swift_retain_n();
    uint64_t v4 = sub_4BBF0();
    os_log_type_t v5 = sub_4C6C0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315394;
      uint64_t v7 = sub_4CBD0();
      sub_1C340(v7, v8, (uint64_t *)&v16);
      sub_4C800();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2080;
      sub_1C340(0xD000000000000012, 0x8000000000052CE0, (uint64_t *)&v16);
      sub_4C800();
      _os_log_impl(&dword_0, v4, v5, "%s.%s: resuming url load", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    swift_getKeyPath();
    uint64_t v16 = v1;
    sub_4BA40();
    swift_release();
    uint64_t v9 = v1[7];
    swift_getKeyPath();
    uint64_t v16 = v1;
    swift_bridgeObjectRetain();
    sub_4BA40();
    swift_release();
    uint64_t v10 = (void (*)(void))v1[8];
    uint64_t v11 = v1[9];
    sub_4A278((uint64_t)v10);
    sub_43668(v9, v10, v11);
    sub_4A288((uint64_t)v10);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath, v13);
    uint64_t v16 = v1;
    sub_4BA30();
    swift_release();
    uint64_t v14 = swift_getKeyPath();
    __chkstk_darwin(v14, v15);
    uint64_t v16 = v1;
    sub_4BA30();
    return swift_release();
  }
  return result;
}

uint64_t sub_3C0C0()
{
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_3C160@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_3C208()
{
  return swift_release();
}

uint64_t sub_3C2D8()
{
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  sub_49B98(v1);
  return v1;
}

uint64_t sub_3C398@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  uint64_t v6 = v3[5];
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  return sub_49B98(v4);
}

uint64_t sub_3C44C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_49B98(v1);
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA30();
  sub_49C04(v1);
  return swift_release();
}

uint64_t sub_3C548()
{
  return swift_retain();
}

uint64_t sub_3C5EC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  *a2 = *(void *)(v3 + 48);
  return swift_retain();
}

uint64_t sub_3C698()
{
  return swift_release();
}

uint64_t sub_3C778()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_3C81C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  *a2 = *(void *)(v3 + 56);
  return swift_bridgeObjectRetain();
}

uint64_t sub_3C8C8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_3C9A8()
{
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  sub_4A278(v1);
  return v1;
}

uint64_t sub_3CA5C@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(v3 + 72);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_4A5EC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_4A278(v4);
}

uint64_t sub_3CB48(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = sub_4A5C4;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath, v6);
  sub_4A278(v2);
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA30();
  sub_4A288((uint64_t)v4);
  return swift_release();
}

uint64_t sub_3CCA4()
{
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel__communicationSafetySetupHasCompleted);
}

uint64_t sub_3CD4C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel__communicationSafetySetupHasCompleted);
  return result;
}

uint64_t sub_3CDFC()
{
  return swift_release();
}

uint64_t sub_3CECC()
{
  uint64_t v1 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel____lazy_storage___sectionModelProviders;
  if (*(uint64_t *)((char *)v0
                  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel____lazy_storage___sectionModelProviders))
  {
    uint64_t v2 = *(uint64_t *)((char *)v0
                    + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel____lazy_storage___sectionModelProviders);
  }
  else
  {
    uint64_t v2 = sub_3CF34(v0);
    *(uint64_t *)((char *)v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_3CF34(uint64_t *a1)
{
  uint64_t v2 = *a1;
  sub_4890(&qword_68CA8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_4F850;
  uint64_t v4 = sub_3D560(a1);
  uint64_t v5 = type metadata accessor for StaticPrivacyAndSecuritySettingsListSectionProvider();
  uint64_t v6 = swift_allocObject();
  *(_WORD *)(v6 + 16) = 0;
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v6 + 88) = v4;
  *(void *)(v3 + 56) = v5;
  *(void *)(v3 + 64) = &off_5E678;
  *(void *)(v3 + 32) = v6;
  uint64_t v7 = sub_3DAB0(a1);
  uint64_t v8 = swift_allocObject();
  *(_WORD *)(v8 + 16) = 257;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v8 + 88) = v7;
  *(void *)(v3 + 96) = v5;
  *(void *)(v3 + 104) = &off_5E678;
  *(void *)(v3 + 72) = v8;
  uint64_t v9 = sub_3EB6C((ValueMetadata **)a1);
  uint64_t v10 = swift_allocObject();
  *(_WORD *)(v10 + 16) = 258;
  *(_OWORD *)(v10 + 24) = 0u;
  *(_OWORD *)(v10 + 40) = 0u;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v10 + 88) = v9;
  *(void *)(v3 + 136) = v5;
  *(void *)(v3 + 144) = &off_5E678;
  *(void *)(v3 + 112) = v10;
  uint64_t v11 = sub_4048C();
  uint64_t v12 = swift_allocObject();
  *(_WORD *)(v12 + 16) = 3;
  *(_OWORD *)(v12 + 24) = 0u;
  *(_OWORD *)(v12 + 40) = 0u;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v12 + 72) = 0u;
  *(_OWORD *)(v12 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v12 + 88) = v11;
  *(void *)(v3 + 176) = v5;
  *(void *)(v3 + 184) = &off_5E678;
  *(void *)(v3 + 152) = v12;
  uint64_t v13 = type metadata accessor for SafetyCheckListSectionModelProvider();
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = 4;
  *(void *)(v3 + 216) = v13;
  *(void *)(v3 + 224) = &off_5F038;
  *(void *)(v3 + 192) = v14;
  v47[3] = v2;
  v47[4] = &off_5FB80;
  v47[0] = a1;
  uint64_t v15 = type metadata accessor for SensitiveContentWarningListSectionModelProvider();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = sub_49C50((uint64_t)v47, v2);
  __chkstk_darwin(v17, v17);
  uint64_t v19 = (void *)((char *)&v47[-1] - v18);
  (*(void (**)(char *))(v20 + 16))((char *)&v47[-1] - v18);
  uint64_t v21 = *v19;
  swift_retain();
  uint64_t v22 = sub_48AB8(v21, v16);
  sub_78F0((uint64_t)v47);
  *(void *)(v3 + 256) = v15;
  *(void *)(v3 + 264) = &off_5F0B0;
  *(void *)(v3 + 232) = v22;
  uint64_t v23 = sub_407F0();
  uint64_t v24 = swift_allocObject();
  *(_WORD *)(v24 + 16) = 6;
  *(_OWORD *)(v24 + 24) = 0u;
  *(_OWORD *)(v24 + 40) = 0u;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v24 + 72) = 0u;
  *(_OWORD *)(v24 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v24 + 88) = v23;
  *(void *)(v3 + 296) = v5;
  *(void *)(v3 + 304) = &off_5E678;
  *(void *)(v3 + 272) = v24;
  sub_4C000();
  if (qword_66ED0 != -1) {
    swift_once();
  }
  id v25 = (id)qword_6B268;
  uint64_t v26 = sub_4C160();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31 & 1;
  uint64_t v33 = sub_40B10(a1);
  uint64_t v34 = swift_allocObject();
  *(_WORD *)(v34 + 16) = 7;
  *(void *)(v34 + 24) = v26;
  *(void *)(v34 + 32) = v28;
  *(void *)(v34 + 40) = v32;
  *(void *)(v34 + 48) = v30;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v34 + 72) = 0u;
  *(_OWORD *)(v34 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v34 + 88) = v33;
  *(void *)(v3 + 336) = v5;
  *(void *)(v3 + 344) = &off_5E678;
  *(void *)(v3 + 312) = v34;
  sub_4C000();
  id v35 = (id)qword_6B268;
  uint64_t v36 = sub_4C160();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41 & 1;
  uint64_t v43 = sub_4125C(a1);
  uint64_t v44 = swift_allocObject();
  *(_WORD *)(v44 + 16) = 9;
  *(void *)(v44 + 24) = v36;
  *(void *)(v44 + 32) = v38;
  *(void *)(v44 + 40) = v42;
  *(void *)(v44 + 48) = v40;
  sub_9938(0, 0, 0, 0);
  *(_OWORD *)(v44 + 72) = 0u;
  *(_OWORD *)(v44 + 56) = 0u;
  sub_9938(0, 0, 0, 0);
  *(void *)(v44 + 88) = v43;
  *(void *)(v3 + 376) = v5;
  *(void *)(v3 + 384) = &off_5E678;
  *(void *)(v3 + 352) = v44;
  return v3;
}

uint64_t sub_3D560(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v41 = v2;
  uint64_t v42 = &off_5FB80;
  *(void *)&long long v40 = a1;
  uint64_t v3 = (objc_class *)type metadata accessor for LocationServicesStateListItemProvider();
  uint64_t v4 = objc_allocWithZone(v3);
  uint64_t v5 = sub_49C50((uint64_t)&v40, v2);
  uint64_t v6 = *(void *)(v2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5, v5);
  uint64_t v38 = *(void (**)(char *))(v6 + 16);
  unint64_t v39 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v38((char *)&v37 - v39);
  uint64_t v8 = *(void *)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_retain();
  id v9 = sub_47AD4(v8, v4);
  sub_78F0((uint64_t)&v40);
  uint64_t v41 = (uint64_t)v3;
  uint64_t v42 = &off_5ECC0;
  *(void *)&long long v40 = v9;
  uint64_t v10 = sub_4890(&qword_68CB0);
  uint64_t v11 = swift_allocObject();
  long long v37 = xmmword_4E890;
  *(_OWORD *)(v11 + 16) = xmmword_4E890;
  unint64_t v12 = v11 + 32;
  sub_352AC(&v40, v11 + 32);
  swift_getKeyPath();
  *(void *)&long long v40 = a1;
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v13 = a1[6];
  uint64_t v41 = v2;
  uint64_t v42 = &off_5FB80;
  *(void *)&long long v40 = a1;
  uint64_t v14 = type metadata accessor for TCCAuthorizationListValueItemProvider();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = sub_49C50((uint64_t)&v40, v2);
  __chkstk_darwin(v16, v16);
  uint64_t v17 = (uint64_t *)((char *)&v37 - v39);
  v38((char *)&v37 - v39);
  uint64_t v18 = *v17;
  swift_retain();
  swift_retain();
  uint64_t v19 = sub_480E8(1u, v13, v18, v15);
  sub_78F0((uint64_t)&v40);
  uint64_t v41 = v14;
  uint64_t v42 = &off_5EF08;
  *(void *)&long long v40 = v19;
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v37;
  sub_352AC(&v40, v20 + 32);
  sub_4890(&qword_68CB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_4F860;
  *(void *)(inited + 32) = v11;
  *(void *)(inited + 40) = v20;
  int64_t v22 = *(void *)(v11 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_46EE4(0, v22, 1, _swiftEmptyArrayStorage);
  uint64_t v24 = v23;
  if (*(void *)(v11 + 16))
  {
    uint64_t v25 = v23[2];
    if ((v23[3] >> 1) - v25 < v22)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    unint64_t v26 = (unint64_t)&v23[5 * v25 + 4];
    if (v12 < v26 + 40 * v22 && v26 < v12 + 40 * v22) {
      goto LABEL_31;
    }
    sub_4890(&qword_68CC0);
    swift_arrayInitWithCopy();
    if (v22)
    {
      uint64_t v27 = v24[2];
      BOOL v28 = __OFADD__(v27, v22);
      uint64_t v29 = v27 + v22;
      if (v28)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      void v24[2] = v29;
    }
  }
  else if (v22)
  {
    __break(1u);
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(inited + 40);
  unint64_t v12 = *(void *)(v11 + 16);
  int64_t v22 = v24[2];
  uint64_t v10 = v22 + v12;
  if (__OFADD__(v22, v12))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v30 = v24[3];
  swift_bridgeObjectRetain();
  if (v10 <= (uint64_t)(v30 >> 1))
  {
    if (v12) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_20:
  if (v22 <= v10) {
    int64_t v35 = v10;
  }
  else {
    int64_t v35 = v22;
  }
  uint64_t v24 = sub_46EE4((int *)((char *)&dword_0 + 1), v35, 1, v24);
  if (!*(void *)(v11 + 16))
  {
LABEL_24:
    if (!v12) {
      goto LABEL_25;
    }
    __break(1u);
    goto LABEL_27;
  }
LABEL_12:
  uint64_t v31 = v24[2];
  if ((v24[3] >> 1) - v31 < (uint64_t)v12)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unint64_t v32 = (unint64_t)&v24[5 * v31 + 4];
  if (v11 + 32 < v32 + 40 * v12 && v32 < v11 + 32 + 40 * v12) {
    goto LABEL_31;
  }
  sub_4890(&qword_68CC0);
  swift_arrayInitWithCopy();
  if (!v12)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    return (uint64_t)v24;
  }
  uint64_t v33 = v24[2];
  BOOL v28 = __OFADD__(v33, v12);
  uint64_t v34 = v33 + v12;
  if (!v28)
  {
    void v24[2] = v34;
    goto LABEL_25;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_3DAB0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_getKeyPath();
  uint64_t v137 = (char *)a1
       + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel___observationRegistrar;
  *(void *)&long long v141 = a1;
  uint64_t v136 = sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v3 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v4 = type metadata accessor for TCCAuthorizationSubtitleListItemProvider();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = sub_49C50((uint64_t)&v141, v2);
  uint64_t v7 = *(void *)(*(void *)(v2 - 8) + 64);
  __chkstk_darwin(v6, v6);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v138 = v8;
  uint64_t v139 = v7;
  uint64_t v10 = *(void (**)(char *))(v9 + 16);
  uint64_t v133 = v9 + 16;
  v10((char *)&v122 - v8);
  uint64_t v11 = *(uint64_t *)((char *)&v122 - v8);
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_486C8(2, v3, v11, v5);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v4;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v12;
  uint64_t v135 = sub_4890(&qword_68CB0);
  uint64_t v13 = swift_allocObject();
  long long v140 = xmmword_4E890;
  *(_OWORD *)(v13 + 16) = xmmword_4E890;
  uint64_t v131 = v13;
  sub_352AC(&v141, v13 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v14 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v132 = v4;
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v16, v16);
  v10((char *)&v122 - v8);
  uint64_t v134 = v10;
  uint64_t v17 = *(uint64_t *)((char *)&v122 - v8);
  swift_retain();
  swift_retain();
  uint64_t v18 = sub_486C8(3, v14, v17, v15);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v4;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v18;
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = v140;
  uint64_t v130 = v19;
  sub_352AC(&v141, v19 + 32);
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v20 = (objc_class *)type metadata accessor for FilesAndFoldersSubtitleListItemProvider();
  uint64_t v21 = objc_allocWithZone(v20);
  uint64_t v22 = sub_49C50((uint64_t)&v141, v142);
  __chkstk_darwin(v22, v22);
  uint64_t v24 = (uint64_t *)((char *)&v122 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  uint64_t v26 = *v24;
  swift_retain();
  id v27 = sub_47484(v26, v21);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = (uint64_t)v20;
  uint64_t v143 = &off_5E900;
  *(void *)&long long v141 = v27;
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v140;
  uint64_t v129 = v28;
  sub_352AC(&v141, v28 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v29 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v30 = v132;
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v32, v32);
  uint64_t v33 = (uint64_t *)((char *)&v122 - v138);
  v10((char *)&v122 - v138);
  uint64_t v34 = *v33;
  swift_retain();
  swift_retain();
  uint64_t v35 = sub_486C8(14, v29, v34, v31);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v30;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v35;
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = v140;
  uint64_t v128 = v36;
  sub_352AC(&v141, v36 + 32);
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  long long v37 = (objc_class *)type metadata accessor for HealthDataListItemProvider();
  uint64_t v38 = objc_allocWithZone(v37);
  uint64_t v39 = sub_49C50((uint64_t)&v141, v142);
  __chkstk_darwin(v39, v39);
  uint64_t v41 = (uint64_t *)((char *)&v122 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v42 + 16))(v41);
  uint64_t v43 = *v41;
  swift_retain();
  uint64_t v44 = sub_47764(v43, v38);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = (uint64_t)v37;
  uint64_t v143 = &off_5EB28;
  *(void *)&long long v141 = v44;
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = v140;
  uint64_t v127 = v45;
  sub_352AC(&v141, v45 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v46 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v48, v48);
  unint64_t v49 = v138;
  v134((char *)&v122 - v138);
  uint64_t v50 = *(uint64_t *)((char *)&v122 - v49);
  swift_retain();
  swift_retain();
  uint64_t v51 = sub_486C8(15, v46, v50, v47);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v30;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v51;
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = v140;
  uint64_t v126 = v52;
  sub_352AC(&v141, v52 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v53 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v54 = swift_allocObject();
  uint64_t v55 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v55, v55);
  long long v56 = (uint64_t *)((char *)&v122 - v49);
  uint64_t v57 = (char *)&v122 - v49;
  uint64_t v58 = v134;
  v134(v57);
  uint64_t v59 = *v56;
  swift_retain();
  swift_retain();
  uint64_t v60 = sub_486C8(6, v53, v59, v54);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v30;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v60;
  uint64_t v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = v140;
  uint64_t v125 = v61;
  sub_352AC(&v141, v61 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v62 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v63 = swift_allocObject();
  uint64_t v64 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v64, v64);
  uint64_t v65 = (uint64_t *)((char *)&v122 - v138);
  v58((char *)&v122 - v138);
  uint64_t v66 = *v65;
  swift_retain();
  swift_retain();
  uint64_t v67 = sub_486C8(21, v62, v66, v63);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v30;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v67;
  uint64_t v68 = swift_allocObject();
  *(_OWORD *)(v68 + 16) = v140;
  uint64_t v124 = v68;
  sub_352AC(&v141, v68 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v69 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v70 = swift_allocObject();
  uint64_t v71 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v71, v71);
  uint64_t v72 = (uint64_t *)((char *)&v122 - v138);
  v134((char *)&v122 - v138);
  uint64_t v73 = *v72;
  swift_retain();
  swift_retain();
  uint64_t v74 = sub_486C8(7, v69, v73, v70);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v30;
  uint64_t v143 = &off_5F018;
  *(void *)&long long v141 = v74;
  uint64_t v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = v140;
  uint64_t v123 = v75;
  sub_352AC(&v141, v75 + 32);
  swift_getKeyPath();
  *(void *)&long long v141 = a1;
  sub_4BA40();
  swift_release();
  uint64_t v76 = a1[6];
  uint64_t v142 = v2;
  uint64_t v143 = &off_5FB80;
  *(void *)&long long v141 = a1;
  uint64_t v77 = swift_allocObject();
  uint64_t v78 = sub_49C50((uint64_t)&v141, v2);
  __chkstk_darwin(v78, v78);
  uint64_t v79 = (uint64_t *)((char *)&v122 - v138);
  v80((char *)&v122 - v138);
  uint64_t v81 = *v79;
  swift_retain();
  swift_retain();
  uint64_t v82 = sub_486C8(8, v76, v81, v77);
  sub_78F0((uint64_t)&v141);
  uint64_t v142 = v30;
  uint64_t v143 = &off_5F018;
  uint64_t v83 = v30;
  *(void *)&long long v141 = v82;
  uint64_t v84 = swift_allocObject();
  *(_OWORD *)(v84 + 16) = v140;
  sub_352AC(&v141, v84 + 32);
  id v85 = [self currentDevice];
  LODWORD(v76) = objc_msgSend(v85, "sf_isiPhone");

  if (v76)
  {
    uint64_t v122 = v84;
    swift_getKeyPath();
    *(void *)&long long v141 = a1;
    sub_4BA40();
    swift_release();
    uint64_t v86 = a1[6];
    uint64_t v142 = v2;
    uint64_t v143 = &off_5FB80;
    *(void *)&long long v141 = a1;
    uint64_t v87 = swift_allocObject();
    uint64_t v88 = sub_49C50((uint64_t)&v141, v2);
    __chkstk_darwin(v88, v88);
    uint64_t v89 = (uint64_t *)((char *)&v122 - v138);
    v134((char *)&v122 - v138);
    uint64_t v90 = *v89;
    swift_retain();
    swift_retain();
    uint64_t v91 = sub_486C8(25, v86, v90, v87);
    sub_78F0((uint64_t)&v141);
    uint64_t v142 = v83;
    uint64_t v143 = &off_5F018;
    *(void *)&long long v141 = v91;
    uint64_t v92 = swift_allocObject();
    *(_OWORD *)(v92 + 16) = v140;
    unint64_t v93 = v92 + 32;
    sub_352AC(&v141, v92 + 32);
    sub_4890(&qword_68CB8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v140;
    *(void *)(inited + 32) = v92;
    int64_t v95 = *(void *)(v92 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v96 = sub_46EE4(0, v95, 1, _swiftEmptyArrayStorage);
    uint64_t v97 = v96;
    if (*(void *)(v92 + 16))
    {
      uint64_t v98 = v96[2];
      if ((v96[3] >> 1) - v98 < v95) {
        goto LABEL_39;
      }
      unint64_t v99 = (unint64_t)&v96[5 * v98 + 4];
      if (v93 < v99 + 40 * v95 && v99 < v93 + 40 * v95) {
        goto LABEL_41;
      }
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      if (v95)
      {
        uint64_t v100 = v97[2];
        BOOL v101 = __OFADD__(v100, v95);
        uint64_t v102 = v100 + v95;
        if (v101) {
          goto LABEL_40;
        }
        v97[2] = v102;
      }
    }
    else if (v95)
    {
      goto LABEL_38;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    uint64_t v84 = v122;
  }
  else
  {
    uint64_t v97 = _swiftEmptyArrayStorage;
  }
  sub_4890(&qword_68CB8);
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_4F870;
  *(void *)(v103 + 32) = v131;
  uint64_t v104 = v129;
  *(void *)(v103 + 40) = v130;
  *(void *)(v103 + 48) = v104;
  uint64_t v105 = v127;
  *(void *)(v103 + 56) = v128;
  *(void *)(v103 + 64) = v105;
  uint64_t v106 = v125;
  *(void *)(v103 + 72) = v126;
  *(void *)(v103 + 80) = v106;
  uint64_t v107 = v123;
  *(void *)(v103 + 88) = v124;
  *(void *)(v103 + 96) = v107;
  *(void *)(v103 + 104) = v84;
  *(void *)(v103 + 112) = v97;
  swift_bridgeObjectRetain();
  uint64_t v108 = _swiftEmptyArrayStorage;
  uint64_t v109 = 32;
  while (1)
  {
    uint64_t v110 = *(void *)(v103 + v109);
    uint64_t v111 = *(void *)(v110 + 16);
    int64_t v112 = v108[2];
    int64_t v113 = v112 + v111;
    if (__OFADD__(v112, v111)) {
      break;
    }
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v113 <= v108[3] >> 1)
    {
      if (*(void *)(v110 + 16)) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v112 <= v113) {
        int64_t v115 = v112 + v111;
      }
      else {
        int64_t v115 = v112;
      }
      uint64_t v108 = sub_46EE4(isUniquelyReferenced_nonNull_native, v115, 1, v108);
      if (*(void *)(v110 + 16))
      {
LABEL_24:
        uint64_t v116 = v108[2];
        if ((v108[3] >> 1) - v116 < v111) {
          goto LABEL_36;
        }
        unint64_t v117 = (unint64_t)&v108[5 * v116 + 4];
        if (v110 + 32 < v117 + 40 * v111 && v117 < v110 + 32 + 40 * v111) {
          goto LABEL_41;
        }
        sub_4890(&qword_68CC0);
        swift_arrayInitWithCopy();
        if (v111)
        {
          uint64_t v119 = v108[2];
          BOOL v101 = __OFADD__(v119, v111);
          uint64_t v120 = v119 + v111;
          if (v101) {
            goto LABEL_37;
          }
          v108[2] = v120;
        }
        goto LABEL_14;
      }
    }
    if (v111) {
      goto LABEL_35;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    v109 += 8;
    if (v109 == 120)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_4890(&qword_68CC8);
      swift_arrayDestroy();
      swift_deallocClassInstance();
      return (uint64_t)v108;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_3EB6C(ValueMetadata **a1)
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v2 = *a1;
  uint64_t v194 = &type metadata for AccessoriesFeatureFlags;
  uint64_t v195 = (_UNKNOWN **)sub_4A008();
  char v3 = sub_4BA70();
  sub_78F0((uint64_t)&v193);
  int64_t v4 = (int64_t)&off_5FB80;
  uint64_t v187 = v2;
  if (v3)
  {
    uint64_t v194 = v2;
    uint64_t v195 = &off_5FB80;
    *(void *)&long long v193 = v1;
    uint64_t v5 = (objc_class *)type metadata accessor for AccessoriesListItemProvider();
    uint64_t v6 = objc_allocWithZone(v5);
    uint64_t v7 = sub_49C50((uint64_t)&v193, (uint64_t)v194);
    __chkstk_darwin(v7, v7);
    uint64_t v9 = (uint64_t *)((char *)&v173 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v10 + 16))(v9);
    uint64_t v11 = *v9;
    swift_retain();
    uint64_t v12 = sub_472B0(v11, v6);
    sub_78F0((uint64_t)&v193);
    uint64_t v194 = (ValueMetadata *)v5;
    uint64_t v195 = &off_5E718;
    *(void *)&long long v193 = v12;
    sub_4890(&qword_68CB0);
    uint64_t v13 = (uint64_t *)swift_allocObject();
    long long v191 = xmmword_4E890;
    *((_OWORD *)v13 + 1) = xmmword_4E890;
    unint64_t v14 = (unint64_t)(v13 + 4);
    sub_352AC(&v193, (uint64_t)(v13 + 4));
    sub_4890(&qword_68CB8);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = v191;
    *(void *)(v15 + 32) = v13;
    uint64_t v16 = v15 + 32;
    int64_t v17 = v13[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_46EE4(0, v17, 1, _swiftEmptyArrayStorage);
    uint64_t v19 = v18;
    if (v13[2])
    {
      uint64_t v20 = v18[2];
      if ((v18[3] >> 1) - v20 < v17)
      {
LABEL_107:
        __break(1u);
        goto LABEL_108;
      }
      unint64_t v21 = (unint64_t)&v18[5 * v20 + 4];
      if (v14 < v21 + 40 * v17 && v21 < v14 + 40 * v17) {
        goto LABEL_120;
      }
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      if (v17)
      {
        uint64_t v23 = v19[2];
        BOOL v24 = __OFADD__(v23, v17);
        uint64_t v25 = v23 + v17;
        if (v24)
        {
LABEL_113:
          __break(1u);
          goto LABEL_114;
        }
        v19[2] = v25;
      }
    }
    else if (v17)
    {
      goto LABEL_97;
    }
    BOOL v179 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    swift_deallocClassInstance();
  }
  else
  {
    BOOL v179 = _swiftEmptyArrayStorage;
  }
  swift_getKeyPath();
  uint64_t v190 = v1
       + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel___observationRegistrar;
  *(void *)&long long v193 = v1;
  uint64_t v189 = sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v26 = *(void *)(v1 + 48);
  id v27 = v187;
  uint64_t v194 = v187;
  uint64_t v195 = &off_5FB80;
  *(void *)&long long v193 = v1;
  uint64_t v28 = (ValueMetadata *)type metadata accessor for TCCAuthorizationListValueItemProvider();
  uint64_t v29 = swift_allocObject();
  uint64_t v30 = sub_49C50((uint64_t)&v193, (uint64_t)v27);
  Description = v27[-1].Description;
  uint64_t v32 = Description[8];
  __chkstk_darwin(v30, v30);
  unint64_t v33 = (v32 + 15) & 0xFFFFFFFFFFFFFFF0;
  v186 = (void (*)(char *))Description[2];
  v186((char *)&v173 - v33);
  uint64_t v34 = *(uint64_t *)((char *)&v173 - v33);
  swift_retain();
  swift_retain();
  uint64_t v35 = sub_480E8(0xAu, v26, v34, v29);
  sub_78F0((uint64_t)&v193);
  uint64_t v194 = v28;
  uint64_t v195 = &off_5EF08;
  *(void *)&long long v193 = v35;
  uint64_t v36 = sub_4890(&qword_68CB0);
  uint64_t v37 = swift_allocObject();
  long long v191 = xmmword_4E890;
  *(_OWORD *)(v37 + 16) = xmmword_4E890;
  uint64_t v178 = v37;
  sub_352AC(&v193, v37 + 32);
  swift_getKeyPath();
  *(void *)&long long v193 = v1;
  sub_4BA40();
  swift_release();
  uint64_t v38 = *(void *)(v1 + 48);
  uint64_t v194 = v27;
  uint64_t v195 = &off_5FB80;
  *(void *)&long long v193 = v1;
  uint64_t v39 = v28;
  uint64_t v40 = swift_allocObject();
  uint64_t v41 = sub_49C50((uint64_t)&v193, (uint64_t)v27);
  uint64_t v185 = v32;
  __chkstk_darwin(v41, v41);
  v181 = (char *)v33;
  uint64_t v42 = (uint64_t *)((char *)&v173 - v33);
  uint64_t v43 = v186;
  v186((char *)v42);
  uint64_t v44 = *v42;
  swift_retain();
  swift_retain();
  uint64_t v45 = v40;
  uint64_t v46 = v39;
  uint64_t v47 = sub_480E8(0xBu, v38, v44, v45);
  sub_78F0((uint64_t)&v193);
  uint64_t v194 = v39;
  uint64_t v195 = &off_5EF08;
  *(void *)&long long v193 = v47;
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = v191;
  uint64_t v177 = v48;
  sub_352AC(&v193, v48 + 32);
  unint64_t v49 = (uint64_t *)swift_retain();
  uint64_t v50 = sub_49810(v49);
  uint64_t v194 = (ValueMetadata *)type metadata accessor for CriticalMessagesListItemProvider();
  uint64_t v195 = &off_5E8B8;
  *(void *)&long long v193 = v50;
  uint64_t v51 = v43;
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = v191;
  uint64_t v176 = v52;
  sub_352AC(&v193, v52 + 32);
  uint64_t v53 = self;
  unsigned int v54 = [v53 isContactlessTCCServiceEligible];
  uint64_t v183 = v36;
  uint64_t v184 = v46;
  uint64_t v188 = (char *)(Description + 2);
  uint64_t v182 = v1;
  if (v54)
  {
    unint64_t v180 = (unint64_t)v53;
    swift_getKeyPath();
    *(void *)&long long v193 = v1;
    sub_4BA40();
    swift_release();
    uint64_t v55 = *(void *)(v1 + 48);
    long long v56 = v187;
    uint64_t v194 = v187;
    uint64_t v195 = &off_5FB80;
    *(void *)&long long v193 = v1;
    uint64_t v16 = swift_allocObject();
    uint64_t v57 = sub_49C50((uint64_t)&v193, (uint64_t)v56);
    __chkstk_darwin(v57, v57);
    uint64_t v58 = (uint64_t *)((char *)&v173 - v181);
    v43((char *)((char *)&v173 - v181));
    uint64_t v59 = *v58;
    swift_retain();
    swift_retain();
    uint64_t v60 = sub_480E8(0xDu, v55, v59, v16);
    sub_78F0((uint64_t)&v193);
    uint64_t v194 = v46;
    uint64_t v195 = &off_5EF08;
    *(void *)&long long v193 = v60;
    unint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = v191;
    int64_t v4 = v14 + 32;
    sub_352AC(&v193, v14 + 32);
    sub_4890(&qword_68CB8);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = v191;
    *(void *)(v61 + 32) = v14;
    int64_t v17 = v61 + 32;
    int64_t v62 = *(void *)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v63 = (char *)sub_46EE4(0, v62, 1, _swiftEmptyArrayStorage);
    uint64_t v64 = *(void *)(v14 + 16);
    uint64_t v65 = v185;
    v181 = v63;
    if (v64)
    {
      uint64_t v66 = *((void *)v63 + 2);
      if ((*((void *)v63 + 3) >> 1) - v66 < v62)
      {
LABEL_108:
        __break(1u);
        goto LABEL_109;
      }
      unint64_t v67 = (unint64_t)&v63[40 * v66 + 32];
      if (v4 < v67 + 40 * v62 && v67 < v4 + 40 * v62) {
        goto LABEL_120;
      }
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      uint64_t v1 = v182;
      if (v62)
      {
        uint64_t v68 = *((void *)v181 + 2);
        BOOL v24 = __OFADD__(v68, v62);
        uint64_t v69 = v68 + v62;
        if (v24)
        {
LABEL_114:
          __break(1u);
          goto LABEL_115;
        }
        *((void *)v181 + 2) = v69;
      }
    }
    else
    {
      uint64_t v13 = (uint64_t *)&off_5FB80;
      uint64_t v1 = v182;
      if (v62) {
        goto LABEL_98;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v51 = v186;
    uint64_t v53 = (void *)v180;
  }
  else
  {
    v181 = (char *)_swiftEmptyArrayStorage;
    long long v56 = v187;
    uint64_t v65 = v185;
  }
  if ([v53 isSecureElementTCCServiceEligible])
  {
    swift_getKeyPath();
    *(void *)&long long v193 = v1;
    sub_4BA40();
    swift_release();
    uint64_t v70 = *(void *)(v1 + 48);
    uint64_t v194 = v56;
    uint64_t v195 = &off_5FB80;
    *(void *)&long long v193 = v1;
    uint64_t v71 = v184;
    uint64_t v72 = swift_allocObject();
    uint64_t v73 = sub_49C50((uint64_t)&v193, (uint64_t)v56);
    __chkstk_darwin(v73, v73);
    v51((char *)&v173 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v16 = *(uint64_t *)((char *)&v173 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0));
    swift_retain();
    swift_retain();
    uint64_t v74 = sub_480E8(0x17u, v70, v16, v72);
    sub_78F0((uint64_t)&v193);
    uint64_t v194 = v71;
    uint64_t v195 = &off_5EF08;
    *(void *)&long long v193 = v74;
    uint64_t v13 = (uint64_t *)swift_allocObject();
    *((_OWORD *)v13 + 1) = v191;
    int64_t v17 = (int64_t)(v13 + 4);
    sub_352AC(&v193, (uint64_t)(v13 + 4));
    sub_4890(&qword_68CB8);
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = v191;
    *(void *)(v75 + 32) = v13;
    unint64_t v14 = v75 + 32;
    int64_t v4 = v13[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_46EE4(0, v4, 1, _swiftEmptyArrayStorage);
    uint64_t v77 = v76;
    if (v13[2])
    {
      uint64_t v78 = v76[2];
      if ((v76[3] >> 1) - v78 < v4)
      {
LABEL_109:
        __break(1u);
        goto LABEL_110;
      }
      unint64_t v79 = (unint64_t)&v76[5 * v78 + 4];
      if (v17 < v79 + 40 * v4 && v79 < v17 + 40 * v4) {
        goto LABEL_120;
      }
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      if (v4)
      {
        uint64_t v80 = v77[2];
        BOOL v24 = __OFADD__(v80, v4);
        uint64_t v81 = v80 + v4;
        if (v24)
        {
LABEL_115:
          __break(1u);
          goto LABEL_116;
        }
        v77[2] = v81;
      }
    }
    else if (v4)
    {
      goto LABEL_99;
    }
    uint64_t v175 = v77;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    long long v56 = v187;
  }
  else
  {
    uint64_t v175 = _swiftEmptyArrayStorage;
  }
  uint64_t v194 = v56;
  uint64_t v195 = &off_5FB80;
  *(void *)&long long v193 = v1;
  uint64_t v82 = (ValueMetadata *)type metadata accessor for LocalNetworkListValueItemProvider();
  uint64_t v83 = swift_allocObject();
  uint64_t v84 = sub_49C50((uint64_t)&v193, (uint64_t)v56);
  __chkstk_darwin(v84, v84);
  unint64_t v180 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v85 = (uint64_t *)((char *)&v173 - v180);
  uint64_t v86 = v186;
  v186((char *)&v173 - v180);
  uint64_t v87 = *v85;
  v192[3] = v56;
  v192[4] = &off_5FB80;
  v192[0] = v87;
  *(void *)(v83 + 24) = 0;
  *(void *)(v83 + 32) = &_swiftEmptySetSingleton;
  uint64_t v88 = self;
  swift_retain();
  *(void *)(v83 + 40) = [v88 sharedManagerForAllUsers];
  *(unsigned char *)(v83 + 16) = 17;
  sub_A2E4((uint64_t)v192, v83 + 48);
  sub_1B124();
  sub_78F0((uint64_t)v192);
  sub_78F0((uint64_t)&v193);
  uint64_t v194 = v82;
  uint64_t v195 = &off_5EBB0;
  *(void *)&long long v193 = v83;
  uint64_t v89 = swift_allocObject();
  *(_OWORD *)(v89 + 16) = v191;
  uint64_t v174 = v89;
  sub_352AC(&v193, v89 + 32);
  swift_getKeyPath();
  *(void *)&long long v193 = v1;
  sub_4BA40();
  swift_release();
  uint64_t v90 = *(void *)(v1 + 48);
  uint64_t v194 = v56;
  uint64_t v195 = &off_5FB80;
  *(void *)&long long v193 = v1;
  uint64_t v91 = v184;
  uint64_t v92 = swift_allocObject();
  uint64_t v93 = sub_49C50((uint64_t)&v193, (uint64_t)v56);
  __chkstk_darwin(v93, v93);
  uint64_t v94 = (uint64_t *)((char *)&v173 - v180);
  v86((char *)&v173 - v180);
  uint64_t v95 = *v94;
  swift_retain();
  swift_retain();
  uint64_t v96 = sub_480E8(0x12u, v90, v95, v92);
  sub_78F0((uint64_t)&v193);
  uint64_t v194 = v91;
  uint64_t v195 = &off_5EF08;
  *(void *)&long long v193 = v96;
  uint64_t v97 = swift_allocObject();
  *(_OWORD *)(v97 + 16) = v191;
  sub_352AC(&v193, v97 + 32);
  char v98 = PSIsInEDUMode();
  unint64_t v180 = v97;
  if ((v98 & 1) != 0
    || (id v99 = [self currentDevice],
        unsigned __int8 v100 = objc_msgSend(v99, "sf_inRetailKioskMode"),
        v99,
        (v100 & 1) != 0))
  {
    v173 = _swiftEmptyArrayStorage;
    uint64_t v101 = v185;
    uint64_t v1 = v182;
    uint64_t v102 = v187;
LABEL_49:
    id v122 = [self currentDevice];
    id v123 = [v122 userInterfaceIdiom];

    if (v123)
    {
      unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
      uint64_t v124 = v184;
LABEL_71:
      swift_getKeyPath();
      *(void *)&long long v193 = v1;
      sub_4BA40();
      swift_release();
      uint64_t v153 = *(void *)(v1 + 48);
      uint64_t v194 = v102;
      uint64_t v195 = &off_5FB80;
      *(void *)&long long v193 = v1;
      uint64_t v154 = swift_allocObject();
      uint64_t v155 = sub_49C50((uint64_t)&v193, (uint64_t)v102);
      __chkstk_darwin(v155, v155);
      v186((char *)&v173 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v156 = *(uint64_t *)((char *)&v173 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0));
      swift_retain();
      swift_retain();
      uint64_t v157 = sub_480E8(0x18u, v153, v156, v154);
      sub_78F0((uint64_t)&v193);
      uint64_t v194 = v124;
      uint64_t v195 = &off_5EF08;
      *(void *)&long long v193 = v157;
      uint64_t v158 = swift_allocObject();
      *(_OWORD *)(v158 + 16) = v191;
      sub_352AC(&v193, v158 + 32);
      sub_4890(&qword_68CB8);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_4F870;
      *(void *)(v1 + 32) = v179;
      uint64_t v159 = v177;
      *(void *)(v1 + 40) = v178;
      *(void *)(v1 + 48) = v159;
      uint64_t v160 = v181;
      *(void *)(v1 + 56) = v176;
      *(void *)(v1 + 64) = v160;
      uint64_t v161 = v174;
      *(void *)(v1 + 72) = v175;
      *(void *)(v1 + 80) = v161;
      uint64_t v162 = v173;
      *(void *)(v1 + 88) = v180;
      *(void *)(v1 + 96) = v162;
      *(void *)(v1 + 104) = v14;
      *(void *)(v1 + 112) = v158;
      swift_bridgeObjectRetain();
      uint64_t v163 = _swiftEmptyArrayStorage;
      uint64_t v164 = 32;
      uint64_t v13 = &qword_68CC0;
      while (1)
      {
        uint64_t v16 = *(void *)(v1 + v164);
        unint64_t v14 = *(void *)(v16 + 16);
        int64_t v17 = v163[2];
        int64_t v4 = v17 + v14;
        if (__OFADD__(v17, v14))
        {
          __break(1u);
LABEL_94:
          __break(1u);
LABEL_95:
          __break(1u);
LABEL_96:
          __break(1u);
LABEL_97:
          __break(1u);
LABEL_98:
          __break(1u);
LABEL_99:
          __break(1u);
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
          goto LABEL_102;
        }
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
        if (isUniquelyReferenced_nonNull_native && v4 <= v163[3] >> 1)
        {
          if (*(void *)(v16 + 16)) {
            goto LABEL_83;
          }
        }
        else
        {
          if (v17 <= v4) {
            int64_t v166 = v17 + v14;
          }
          else {
            int64_t v166 = v17;
          }
          uint64_t v163 = sub_46EE4(isUniquelyReferenced_nonNull_native, v166, 1, v163);
          if (*(void *)(v16 + 16))
          {
LABEL_83:
            uint64_t v167 = v163[2];
            if ((v163[3] >> 1) - v167 < (uint64_t)v14) {
              goto LABEL_95;
            }
            int64_t v17 = (int64_t)&v163[5 * v167 + 4];
            int64_t v4 = v16 + 32;
            if (v16 + 32 < v17 + 40 * v14 && v17 < v16 + 32 + 40 * v14) {
              goto LABEL_120;
            }
            sub_4890(&qword_68CC0);
            swift_arrayInitWithCopy();
            if (v14)
            {
              uint64_t v169 = v163[2];
              BOOL v24 = __OFADD__(v169, v14);
              uint64_t v170 = v169 + v14;
              if (v24) {
                goto LABEL_96;
              }
              v163[2] = v170;
            }
            goto LABEL_73;
          }
        }
        if (v14) {
          goto LABEL_94;
        }
LABEL_73:
        swift_bridgeObjectRelease();
        v164 += 8;
        if (v164 == 120)
        {
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          sub_4890(&qword_68CC8);
          swift_arrayDestroy();
          swift_deallocClassInstance();
          return (uint64_t)v163;
        }
      }
    }
    swift_getKeyPath();
    *(void *)&long long v193 = v1;
    sub_4BA40();
    swift_release();
    uint64_t v125 = *(void *)(v1 + 48);
    uint64_t v194 = v102;
    uint64_t v195 = &off_5FB80;
    *(void *)&long long v193 = v1;
    uint64_t v126 = v184;
    uint64_t v127 = swift_allocObject();
    uint64_t v128 = sub_49C50((uint64_t)&v193, (uint64_t)v102);
    __chkstk_darwin(v128, v128);
    uint64_t v129 = (uint64_t *)((char *)&v173 - ((v101 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v130 = (v101 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v131 = (void (*)(uint64_t *))v186;
    v186((char *)v129);
    uint64_t v132 = *v129;
    swift_retain();
    swift_retain();
    uint64_t v133 = sub_480E8(0x14u, v125, v132, v127);
    sub_78F0((uint64_t)&v193);
    uint64_t v194 = v126;
    uint64_t v195 = &off_5EF08;
    *(void *)&long long v193 = v133;
    int64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = v191;
    uint64_t v13 = (uint64_t *)(v4 + 32);
    sub_352AC(&v193, v4 + 32);
    uint64_t v194 = v102;
    uint64_t v195 = &off_5FB80;
    *(void *)&long long v193 = v1;
    uint64_t v134 = (ValueMetadata *)type metadata accessor for ResearchSensorUsageDataListValueItemProvider();
    uint64_t v135 = swift_allocObject();
    uint64_t v136 = sub_49C50((uint64_t)&v193, (uint64_t)v102);
    int64_t v17 = (int64_t)&v173;
    __chkstk_darwin(v136, v136);
    uint64_t v137 = (uint64_t *)((char *)&v173 - v130);
    v131(v137);
    uint64_t v138 = *v137;
    swift_retain();
    uint64_t v139 = sub_47D40(v138, v135);
    sub_78F0((uint64_t)&v193);
    uint64_t v194 = v134;
    uint64_t v195 = &off_5EDA8;
    *(void *)&long long v193 = v139;
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = v191;
    sub_352AC(&v193, v16 + 32);
    sub_4890(&qword_68CB8);
    uint64_t v140 = swift_allocObject();
    *(_OWORD *)(v140 + 16) = xmmword_4F860;
    *(void *)(v140 + 32) = v4;
    *(void *)(v140 + 40) = v16;
    int64_t v141 = *(void *)(v4 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v142 = sub_46EE4(0, v141, 1, _swiftEmptyArrayStorage);
    unint64_t v14 = (unint64_t)v142;
    if (*(void *)(v4 + 16))
    {
      uint64_t v143 = v142[2];
      if ((v142[3] >> 1) - v143 < v141)
      {
LABEL_111:
        __break(1u);
LABEL_112:
        __break(1u);
        goto LABEL_113;
      }
      unint64_t v144 = (unint64_t)&v142[5 * v143 + 4];
      uint64_t v1 = v182;
      if ((unint64_t)v13 < v144 + 40 * v141 && v144 < (unint64_t)&v13[5 * v141]) {
        goto LABEL_120;
      }
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      if (v141)
      {
        uint64_t v145 = *(void *)(v14 + 16);
        BOOL v24 = __OFADD__(v145, v141);
        uint64_t v146 = v145 + v141;
        if (v24)
        {
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
          goto LABEL_119;
        }
        *(void *)(v14 + 16) = v146;
      }
    }
    else
    {
      uint64_t v1 = v182;
      if (v141) {
        goto LABEL_100;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = *(uint64_t **)(v140 + 40);
    int64_t v4 = v13[2];
    uint64_t v16 = *(void *)(v14 + 16);
    int64_t v17 = v16 + v4;
    if (__OFADD__(v16, v4)) {
      goto LABEL_101;
    }
    unint64_t v147 = *(void *)(v14 + 24);
    swift_bridgeObjectRetain();
    if (v17 > (uint64_t)(v147 >> 1))
    {
LABEL_102:
      if (v16 <= v17) {
        int64_t v172 = v17;
      }
      else {
        int64_t v172 = v16;
      }
      unint64_t v14 = (unint64_t)sub_46EE4((int *)((char *)&dword_0 + 1), v172, 1, (void *)v14);
      int64_t v148 = v13[2];
    }
    else
    {
      int64_t v148 = v4;
    }
    uint64_t v124 = v184;
    if (v148)
    {
      uint64_t v149 = *(void *)(v14 + 16);
      if ((*(void *)(v14 + 24) >> 1) - v149 >= v4)
      {
        unint64_t v150 = v14 + 40 * v149 + 32;
        if ((unint64_t)(v13 + 4) < v150 + 40 * v4 && v150 < (unint64_t)&v13[5 * v4 + 4]) {
          goto LABEL_120;
        }
        sub_4890(&qword_68CC0);
        swift_arrayInitWithCopy();
        uint64_t v124 = v184;
        if (!v4)
        {
LABEL_70:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          sub_4890(&qword_68CC8);
          swift_arrayDestroy();
          swift_deallocClassInstance();
          uint64_t v102 = v187;
          uint64_t v101 = v185;
          goto LABEL_71;
        }
        uint64_t v151 = *(void *)(v14 + 16);
        BOOL v24 = __OFADD__(v151, v4);
        uint64_t v152 = v151 + v4;
        if (!v24)
        {
          *(void *)(v14 + 16) = v152;
          goto LABEL_70;
        }
        goto LABEL_118;
      }
      goto LABEL_112;
    }
    if (!v4) {
      goto LABEL_70;
    }
    __break(1u);
    goto LABEL_107;
  }
  swift_getKeyPath();
  uint64_t v1 = v182;
  *(void *)&long long v193 = v182;
  uint64_t v103 = v187;
  sub_4BA40();
  swift_release();
  uint64_t v104 = *(void *)(v1 + 48);
  uint64_t v194 = v103;
  uint64_t v195 = &off_5FB80;
  *(void *)&long long v193 = v1;
  uint64_t v105 = v184;
  uint64_t v106 = swift_allocObject();
  uint64_t v107 = sub_49C50((uint64_t)&v193, (uint64_t)v103);
  __chkstk_darwin(v107, v107);
  uint64_t v109 = (uint64_t *)((char *)&v173 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0));
  v186((char *)v109);
  uint64_t v110 = *v109;
  swift_retain();
  swift_retain();
  uint64_t v111 = sub_480E8(0x13u, v104, v110, v106);
  sub_78F0((uint64_t)&v193);
  uint64_t v194 = v105;
  uint64_t v195 = &off_5EF08;
  *(void *)&long long v193 = v111;
  uint64_t v112 = swift_allocObject();
  *(_OWORD *)(v112 + 16) = v191;
  unint64_t v113 = v112 + 32;
  sub_352AC(&v193, v112 + 32);
  sub_4890(&qword_68CB8);
  uint64_t v114 = swift_allocObject();
  *(_OWORD *)(v114 + 16) = v191;
  *(void *)(v114 + 32) = v112;
  int64_t v115 = *(void *)(v112 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v116 = sub_46EE4(0, v115, 1, _swiftEmptyArrayStorage);
  unint64_t v117 = v116;
  if (!*(void *)(v112 + 16))
  {
    if (v115)
    {
LABEL_110:
      __break(1u);
      goto LABEL_111;
    }
    goto LABEL_48;
  }
  uint64_t v118 = v116[2];
  if ((v116[3] >> 1) - v118 < v115)
  {
LABEL_116:
    __break(1u);
    goto LABEL_117;
  }
  unint64_t v119 = (unint64_t)&v116[5 * v118 + 4];
  if (v113 < v119 + 40 * v115 && v119 < v113 + 40 * v115) {
    goto LABEL_120;
  }
  sub_4890(&qword_68CC0);
  swift_arrayInitWithCopy();
  if (!v115)
  {
LABEL_48:
    v173 = v117;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v102 = v187;
    uint64_t v101 = v185;
    goto LABEL_49;
  }
  uint64_t v120 = v117[2];
  BOOL v24 = __OFADD__(v120, v115);
  uint64_t v121 = v120 + v115;
  if (!v24)
  {
    v117[2] = v121;
    goto LABEL_48;
  }
LABEL_119:
  __break(1u);
LABEL_120:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_4048C()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1)
  {
    uint64_t v2 = _swiftEmptyArrayStorage;
    goto LABEL_15;
  }
  uint64_t v25 = &type metadata for PrivacyAndSecuritySettingsListItemIdentifier;
  uint64_t v26 = &off_5E400;
  LOBYTE(v24) = 16;
  sub_4890(&qword_68CB0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_4E890;
  unint64_t v4 = v3 + 32;
  sub_352AC(&v24, v3 + 32);
  sub_4890(&qword_68CB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_4E890;
  *(void *)(inited + 32) = v3;
  int64_t v6 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_46EE4(0, v6, 1, _swiftEmptyArrayStorage);
  uint64_t v2 = v7;
  if (!*(void *)(v3 + 16))
  {
    if (v6)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    goto LABEL_14;
  }
  uint64_t v8 = v7[2];
  if ((v7[3] >> 1) - v8 < v6)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v9 = (unint64_t)&v7[5 * v8 + 4];
  if (v4 < v9 + 40 * v6 && v9 < v4 + 40 * v6) {
    goto LABEL_33;
  }
  sub_4890(&qword_68CC0);
  swift_arrayInitWithCopy();
  if (!v6)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
LABEL_15:
    sub_4890(&qword_68CB8);
    uint64_t v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_4E890;
    *(void *)(v14 + 32) = v2;
    int64_t v15 = v2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_46EE4(0, v15, 1, _swiftEmptyArrayStorage);
    int64_t v17 = v16;
    if (v2[2])
    {
      uint64_t v18 = v16[2];
      if ((v16[3] >> 1) - v18 >= v15)
      {
        unint64_t v19 = (unint64_t)&v16[5 * v18 + 4];
        if ((unint64_t)(v2 + 4) < v19 + 40 * v15 && v19 < (unint64_t)&v2[5 * v15 + 4]) {
          goto LABEL_33;
        }
        sub_4890(&qword_68CC0);
        swift_arrayInitWithCopy();
        if (!v15)
        {
LABEL_26:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_setDeallocating();
          sub_4890(&qword_68CC8);
          swift_arrayDestroy();
          return (uint64_t)v17;
        }
        uint64_t v21 = v17[2];
        BOOL v12 = __OFADD__(v21, v15);
        uint64_t v22 = v21 + v15;
        if (!v12)
        {
          v17[2] = v22;
          goto LABEL_26;
        }
        goto LABEL_29;
      }
    }
    else
    {
      if (!v15) {
        goto LABEL_26;
      }
      __break(1u);
    }
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v11 = v2[2];
  BOOL v12 = __OFADD__(v11, v6);
  uint64_t v13 = v11 + v6;
  if (!v12)
  {
    v2[2] = v13;
    goto LABEL_14;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_407F0()
{
  uint64_t v23 = &type metadata for PrivacyAndSecuritySettingsListItemIdentifier;
  long long v24 = &off_5E400;
  LOBYTE(v22) = 28;
  sub_4890(&qword_68CB0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_4E890;
  unint64_t v2 = v1 + 32;
  sub_352AC(&v22, v1 + 32);
  uint64_t v23 = &type metadata for PrivacyAndSecuritySettingsListItemIdentifier;
  long long v24 = &off_5E400;
  LOBYTE(v22) = 29;
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_4E890;
  sub_352AC(&v22, v3 + 32);
  sub_4890(&qword_68CB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_4F860;
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v3;
  int64_t v5 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v6 = sub_46EE4(0, v5, 1, _swiftEmptyArrayStorage);
  uint64_t v7 = v6;
  if (*(void *)(v1 + 16))
  {
    uint64_t v8 = v6[2];
    if ((v6[3] >> 1) - v8 < v5)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    unint64_t v9 = (unint64_t)&v6[5 * v8 + 4];
    if (v2 < v9 + 40 * v5 && v9 < v2 + 40 * v5) {
      goto LABEL_37;
    }
    sub_4890(&qword_68CC0);
    swift_arrayInitWithCopy();
    if (v5)
    {
      uint64_t v11 = v7[2];
      BOOL v12 = __OFADD__(v11, v5);
      uint64_t v13 = v11 + v5;
      if (v12)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      _OWORD v7[2] = v13;
    }
  }
  else if (v5)
  {
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(inited + 40);
  unint64_t v2 = *(void *)(v1 + 16);
  int64_t v5 = v7[2];
  int64_t v0 = v5 + v2;
  if (__OFADD__(v5, v2))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v14 = v7[3];
  swift_bridgeObjectRetain();
  if (v0 <= (uint64_t)(v14 >> 1))
  {
    if (v2) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_26:
  if (v5 <= v0) {
    int64_t v20 = v0;
  }
  else {
    int64_t v20 = v5;
  }
  uint64_t v7 = sub_46EE4((int *)((char *)&dword_0 + 1), v20, 1, v7);
  if (!*(void *)(v1 + 16))
  {
LABEL_30:
    if (!v2) {
      goto LABEL_31;
    }
    __break(1u);
    goto LABEL_33;
  }
LABEL_15:
  uint64_t v15 = v7[2];
  if ((v7[3] >> 1) - v15 < (uint64_t)v2)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  unint64_t v16 = (unint64_t)&v7[5 * v15 + 4];
  if (v1 + 32 < v16 + 40 * v2 && v16 < v1 + 32 + 40 * v2) {
    goto LABEL_37;
  }
  sub_4890(&qword_68CC0);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    return (uint64_t)v7;
  }
  uint64_t v18 = v7[2];
  BOOL v12 = __OFADD__(v18, v2);
  uint64_t v19 = v18 + v2;
  if (!v12)
  {
    _OWORD v7[2] = v19;
    goto LABEL_31;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_40B10(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unsigned int v54 = (ValueMetadata *)v2;
  uint64_t v55 = &off_5FB80;
  *(void *)&long long v53 = a1;
  uint64_t v3 = type metadata accessor for AppPrivacyReportListItemProvider();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = sub_49C50((uint64_t)&v53, v2);
  uint64_t v6 = *(void *)(v2 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5, v5);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v51 = *(void (**)(char *))(v6 + 16);
  v51((char *)&v50 - v8);
  uint64_t v9 = *(uint64_t *)((char *)&v50 - v8);
  swift_retain();
  uint64_t v10 = sub_4941C(v9, v4);
  sub_78F0((uint64_t)&v53);
  unsigned int v54 = (ValueMetadata *)v3;
  uint64_t v55 = &off_5F138;
  *(void *)&long long v53 = v10;
  sub_4890(&qword_68CB0);
  uint64_t v11 = swift_allocObject();
  long long v52 = xmmword_4E890;
  *(_OWORD *)(v11 + 16) = xmmword_4E890;
  int64_t v12 = v11 + 32;
  sub_352AC(&v53, v11 + 32);
  unsigned int v54 = (ValueMetadata *)v2;
  uint64_t v55 = &off_5FB80;
  *(void *)&long long v53 = a1;
  uint64_t inited = type metadata accessor for AppleIntelligenceReportListItemProvider();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = sub_49C50((uint64_t)&v53, v2);
  __chkstk_darwin(v15, v15);
  v51((char *)&v50 - v8);
  uint64_t v16 = *(uint64_t *)((char *)&v50 - v8);
  swift_retain();
  uint64_t v17 = sub_48EE4(v16, v14);
  sub_78F0((uint64_t)&v53);
  unsigned int v54 = (ValueMetadata *)inited;
  uint64_t v55 = &off_5F0C8;
  *(void *)&long long v53 = v17;
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v52;
  sub_352AC(&v53, v18 + 32);
  if (![self shouldShowDataAndSensors])
  {
    uint64_t v23 = _swiftEmptyArrayStorage;
    goto LABEL_12;
  }
  unsigned int v54 = &type metadata for PrivacyAndSecuritySettingsListItemIdentifier;
  uint64_t v55 = &off_5E400;
  LOBYTE(v53) = 32;
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = v52;
  unint64_t v20 = v19 + 32;
  sub_352AC(&v53, v19 + 32);
  sub_4890(&qword_68CB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v52;
  *(void *)(inited + 32) = v19;
  int64_t v21 = *(void *)(v19 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  long long v22 = sub_46EE4(0, v21, 1, _swiftEmptyArrayStorage);
  uint64_t v23 = v22;
  if (!*(void *)(v19 + 16))
  {
    if (v21)
    {
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    goto LABEL_11;
  }
  uint64_t v24 = v22[2];
  if ((v22[3] >> 1) - v24 < v21)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  unint64_t v25 = (unint64_t)&v22[5 * v24 + 4];
  if (v20 < v25 + 40 * v21 && v25 < v20 + 40 * v21) {
    goto LABEL_63;
  }
  sub_4890(&qword_68CC0);
  swift_arrayInitWithCopy();
  if (!v21)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
LABEL_12:
    sub_4890(&qword_68CB8);
    uint64_t v29 = swift_initStackObject();
    *(_OWORD *)(v29 + 16) = xmmword_4EDC0;
    *(void *)(v29 + 32) = v11;
    *(void *)(v29 + 40) = v18;
    *(void *)(v29 + 48) = v23;
    int64_t v30 = *(void *)(v11 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_46EE4(0, v30, 1, _swiftEmptyArrayStorage);
    uint64_t v32 = v31;
    if (*(void *)(v11 + 16))
    {
      uint64_t v33 = v31[2];
      if ((v31[3] >> 1) - v33 < v30)
      {
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      unint64_t v34 = (unint64_t)&v31[5 * v33 + 4];
      if (v12 < v34 + 40 * v30 && v34 < v12 + 40 * v30) {
        goto LABEL_63;
      }
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      if (v30)
      {
        uint64_t v35 = v32[2];
        BOOL v27 = __OFADD__(v35, v30);
        uint64_t v36 = v35 + v30;
        if (v27)
        {
LABEL_58:
          __break(1u);
          goto LABEL_59;
        }
        uint64_t v32[2] = v36;
      }
    }
    else if (v30)
    {
      __break(1u);
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v29 + 40);
    int64_t v12 = *(void *)(v11 + 16);
    int64_t v30 = v32[2];
    uint64_t inited = v30 + v12;
    if (!__OFADD__(v30, v12))
    {
      unint64_t v37 = v32[3];
      swift_bridgeObjectRetain();
      if (inited <= (uint64_t)(v37 >> 1))
      {
        if (v12)
        {
LABEL_23:
          uint64_t v38 = v32[2];
          if ((v32[3] >> 1) - v38 < v12)
          {
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
            goto LABEL_57;
          }
          unint64_t v39 = (unint64_t)&v32[5 * v38 + 4];
          if (v11 + 32 < v39 + 40 * v12 && v39 < v11 + 32 + 40 * v12) {
            goto LABEL_63;
          }
          sub_4890(&qword_68CC0);
          swift_arrayInitWithCopy();
          if (v12)
          {
            uint64_t v40 = v32[2];
            BOOL v27 = __OFADD__(v40, v12);
            uint64_t v41 = v40 + v12;
            if (v27)
            {
LABEL_59:
              __break(1u);
LABEL_60:
              __break(1u);
              goto LABEL_61;
            }
            uint64_t v32[2] = v41;
          }
          goto LABEL_36;
        }
LABEL_35:
        if (v12)
        {
          __break(1u);
          goto LABEL_46;
        }
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v11 = *(void *)(v29 + 48);
        int64_t v12 = *(void *)(v11 + 16);
        int64_t v30 = v32[2];
        uint64_t inited = v30 + v12;
        if (!__OFADD__(v30, v12))
        {
          unint64_t v43 = v32[3];
          swift_bridgeObjectRetain();
          if (inited <= (uint64_t)(v43 >> 1))
          {
            if (v12) {
              goto LABEL_39;
            }
LABEL_51:
            if (!v12) {
              goto LABEL_52;
            }
            __break(1u);
            goto LABEL_54;
          }
LABEL_47:
          if (v30 <= inited) {
            int64_t v48 = inited;
          }
          else {
            int64_t v48 = v30;
          }
          uint64_t v32 = sub_46EE4((int *)((char *)&dword_0 + 1), v48, 1, v32);
          if (*(void *)(v11 + 16))
          {
LABEL_39:
            uint64_t v44 = v32[2];
            if ((v32[3] >> 1) - v44 >= v12)
            {
              unint64_t v45 = (unint64_t)&v32[5 * v44 + 4];
              if (v11 + 32 < v45 + 40 * v12 && v45 < v11 + 32 + 40 * v12) {
                goto LABEL_63;
              }
              sub_4890(&qword_68CC0);
              swift_arrayInitWithCopy();
              if (!v12)
              {
LABEL_52:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_setDeallocating();
                sub_4890(&qword_68CC8);
                swift_arrayDestroy();
                return (uint64_t)v32;
              }
              uint64_t v46 = v32[2];
              BOOL v27 = __OFADD__(v46, v12);
              uint64_t v47 = v46 + v12;
              if (!v27)
              {
                uint64_t v32[2] = v47;
                goto LABEL_52;
              }
              goto LABEL_60;
            }
            goto LABEL_56;
          }
          goto LABEL_51;
        }
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
LABEL_31:
      if (v30 <= inited) {
        int64_t v42 = inited;
      }
      else {
        int64_t v42 = v30;
      }
      uint64_t v32 = sub_46EE4((int *)((char *)&dword_0 + 1), v42, 1, v32);
      if (*(void *)(v11 + 16)) {
        goto LABEL_23;
      }
      goto LABEL_35;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v26 = v23[2];
  BOOL v27 = __OFADD__(v26, v21);
  uint64_t v28 = v26 + v21;
  if (!v27)
  {
    _OWORD v23[2] = v28;
    goto LABEL_11;
  }
LABEL_62:
  __break(1u);
LABEL_63:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_4125C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = type metadata accessor for DeveloperModeListItemProvider();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = 33;
  uint64_t v42 = v3;
  unint64_t v43 = &off_5F050;
  *(void *)&long long v41 = v4;
  sub_4890(&qword_68CB0);
  uint64_t v5 = swift_allocObject();
  long long v40 = xmmword_4E890;
  *(_OWORD *)(v5 + 16) = xmmword_4E890;
  int64_t v6 = v5 + 32;
  sub_352AC(&v41, v5 + 32);
  uint64_t v42 = v2;
  unint64_t v43 = &off_5FB80;
  *(void *)&long long v41 = a1;
  uint64_t v7 = type metadata accessor for StolenDeviceProtectionListItemProvider();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = sub_49C50((uint64_t)&v41, v2);
  __chkstk_darwin(v9, v9);
  uint64_t v11 = (uint64_t *)((char *)&v40 - v10);
  (*(void (**)(char *))(v12 + 16))((char *)&v40 - v10);
  uint64_t v13 = *v11;
  *(void *)(v8 + 48) = v2;
  *(void *)(v8 + 56) = &off_5FB80;
  *(void *)(v8 + 24) = v13;
  *(unsigned char *)(v8 + 16) = 34;
  swift_retain();
  sub_78F0((uint64_t)&v41);
  uint64_t v42 = v7;
  unint64_t v43 = &off_5F090;
  *(void *)&long long v41 = v8;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = v40;
  sub_352AC(&v41, v14 + 32);
  uint64_t v15 = type metadata accessor for LockdownModeListItemProvider();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = 35;
  uint64_t v42 = v15;
  unint64_t v43 = &off_5F070;
  *(void *)&long long v41 = v16;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v40;
  sub_352AC(&v41, v17 + 32);
  sub_4890(&qword_68CB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_4EDC0;
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v14;
  *(void *)(inited + 48) = v17;
  int64_t v19 = *(void *)(v5 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_46EE4(0, v19, 1, _swiftEmptyArrayStorage);
  int64_t v21 = v20;
  if (*(void *)(v5 + 16))
  {
    uint64_t v22 = v20[2];
    if ((v20[3] >> 1) - v22 < v19)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    unint64_t v23 = (unint64_t)&v20[5 * v22 + 4];
    if (v6 < v23 + 40 * v19 && v23 < v6 + 40 * v19) {
      goto LABEL_49;
    }
    sub_4890(&qword_68CC0);
    swift_arrayInitWithCopy();
    if (v19)
    {
      uint64_t v24 = v21[2];
      BOOL v25 = __OFADD__(v24, v19);
      uint64_t v26 = v24 + v19;
      if (v25)
      {
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
      v21[2] = v26;
    }
  }
  else if (v19)
  {
    __break(1u);
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(inited + 40);
  int64_t v6 = *(void *)(v5 + 16);
  int64_t v19 = v21[2];
  uint64_t v8 = v19 + v6;
  if (__OFADD__(v19, v6))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    if (v19 <= v8) {
      int64_t v32 = v8;
    }
    else {
      int64_t v32 = v19;
    }
    int64_t v21 = sub_46EE4((int *)((char *)&dword_0 + 1), v32, 1, v21);
    if (*(void *)(v5 + 16)) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
  unint64_t v27 = v21[3];
  swift_bridgeObjectRetain();
  if (v8 > (uint64_t)(v27 >> 1)) {
    goto LABEL_20;
  }
  if (v6)
  {
LABEL_12:
    uint64_t v28 = v21[2];
    if ((v21[3] >> 1) - v28 < v6)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    unint64_t v29 = (unint64_t)&v21[5 * v28 + 4];
    if (v5 + 32 < v29 + 40 * v6 && v29 < v5 + 32 + 40 * v6) {
      goto LABEL_49;
    }
    sub_4890(&qword_68CC0);
    swift_arrayInitWithCopy();
    if (v6)
    {
      uint64_t v30 = v21[2];
      BOOL v25 = __OFADD__(v30, v6);
      uint64_t v31 = v30 + v6;
      if (v25)
      {
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      v21[2] = v31;
    }
    goto LABEL_25;
  }
LABEL_24:
  if (v6)
  {
    __break(1u);
    goto LABEL_35;
  }
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(inited + 48);
  int64_t v6 = *(void *)(v5 + 16);
  int64_t v19 = v21[2];
  uint64_t v8 = v19 + v6;
  if (__OFADD__(v19, v6))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  unint64_t v33 = v21[3];
  swift_bridgeObjectRetain();
  if (v8 <= (uint64_t)(v33 >> 1))
  {
    if (v6) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_36:
  if (v19 <= v8) {
    int64_t v38 = v8;
  }
  else {
    int64_t v38 = v19;
  }
  int64_t v21 = sub_46EE4((int *)((char *)&dword_0 + 1), v38, 1, v21);
  if (!*(void *)(v5 + 16))
  {
LABEL_40:
    if (!v6) {
      goto LABEL_41;
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  uint64_t v34 = v21[2];
  if ((v21[3] >> 1) - v34 < v6)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  unint64_t v35 = (unint64_t)&v21[5 * v34 + 4];
  if (v5 + 32 < v35 + 40 * v6 && v35 < v5 + 32 + 40 * v6) {
    goto LABEL_49;
  }
  sub_4890(&qword_68CC0);
  swift_arrayInitWithCopy();
  if (!v6)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_4890(&qword_68CC8);
    swift_arrayDestroy();
    return (uint64_t)v21;
  }
  uint64_t v36 = v21[2];
  BOOL v25 = __OFADD__(v36, v6);
  uint64_t v37 = v36 + v6;
  if (!v25)
  {
    v21[2] = v37;
    goto LABEL_41;
  }
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

void *sub_417FC()
{
  uint64_t v1 = (void *)v0;
  uint64_t v2 = *(void **)v0;
  *(unsigned char *)(v0 + 16) = 36;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 56) = 0;
  uint64_t v3 = v0
     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_appendSettingsNavigationPath;
  uint64_t v4 = sub_4BBB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (char *)v1
     + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_clearSettingsNavigationPath;
  uint64_t v6 = sub_4BB90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_invalidationSubject;
  uint64_t v79 = sub_4890(&qword_68D68);
  swift_allocObject();
  *(void *)((char *)v1 + v7) = sub_4BCD0();
  *(void *)((char *)v1
            + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_cancellables) = &_swiftEmptySetSingleton;
  *((unsigned char *)v1
  + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel__communicationSafetySetupHasCompleted) = 0;
  uint64_t v8 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_scrollToItemSubject;
  sub_4890(&qword_68D70);
  swift_allocObject();
  *(void *)((char *)v1 + v8) = sub_4BCD0();
  *(void *)((char *)v1
            + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel____lazy_storage___sectionModelProviders) = 0;
  sub_4BA50();
  type metadata accessor for TCCAuthorizationProvider();
  swift_allocObject();
  v1[6] = sub_23144();
  swift_getKeyPath();
  aBlock[0] = v1;
  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
  sub_4BA40();
  swift_release();
  uint64_t v9 = v1[6];
  uint64_t v87 = v2;
  uint64_t v88 = (uint64_t (*)())&off_5FB80;
  aBlock[0] = v1;
  sub_A2E4((uint64_t)aBlock, (uint64_t)v90);
  swift_beginAccess();
  swift_retain_n();
  swift_retain();
  sub_4A650((uint64_t)v90, v9 + 48);
  swift_endAccess();
  sub_23520();
  sub_78F0((uint64_t)aBlock);
  swift_release();
  swift_release();
  uint64_t v10 = sub_4890(&qword_68D78);
  uint64_t v84 = *(void **)(v10 - 8);
  uint64_t v85 = v10;
  __chkstk_darwin(v10, v11);
  uint64_t v83 = (char *)v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_4890(&qword_68D80);
  uint64_t v81 = *(void *)(v13 - 8);
  uint64_t v82 = (void *)v13;
  __chkstk_darwin(v13, v14);
  uint64_t v80 = (char *)v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_4890(&qword_68D88);
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78, v16);
  uint64_t v76 = (char *)v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_4890(&qword_68D90);
  uint64_t v73 = *(void *)(v74 - 8);
  __chkstk_darwin(v74, v18);
  unint64_t v20 = (char *)v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = *(id *)((char *)v1
                    + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_invalidationSubject);
  uint64_t v21 = sub_4C7E0();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v23);
  BOOL v25 = (char *)v68 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_4C7D0();
  id v75 = self;
  v90[0] = [v75 mainRunLoop];
  uint64_t v26 = sub_4890(&qword_68CE0);
  __chkstk_darwin(v26 - 8, v27);
  uint64_t v72 = v28;
  unint64_t v71 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v29 = (char *)v68 - v71;
  uint64_t v30 = sub_4C7C0();
  uint64_t v31 = *(void *)(v30 - 8);
  int64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v70 = v30;
  uint64_t v69 = v32;
  v68[1] = v31 + 56;
  ((void (*)(char *, uint64_t, uint64_t))v32)(v29, 1, 1);
  uint64_t v33 = sub_1222C(0, &qword_68CE8);
  sub_4C14(&qword_68D98, &qword_68D68);
  uint64_t v34 = sub_49FAC(&qword_68CF0, &qword_68CE8);
  uint64_t v79 = v33;
  v68[0] = v34;
  sub_4BD50();
  sub_4B7C((uint64_t)v29, &qword_68CE0);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  swift_release();
  if (qword_66EC8 != -1) {
    swift_once();
  }
  unint64_t v35 = (void *)qword_68B48;
  aBlock[0] = (id)qword_68B48;
  uint64_t v36 = sub_4890(&qword_68D18);
  __chkstk_darwin(v36 - 8, v37);
  unint64_t v39 = (char *)v68 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_4C6F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 1, 1, v40);
  sub_1222C(0, (unint64_t *)&qword_67540);
  sub_4C14(&qword_68DA0, &qword_68D90);
  sub_49FAC(&qword_68D28, (unint64_t *)&qword_67540);
  id v41 = v35;
  uint64_t v42 = v76;
  uint64_t v43 = v74;
  sub_4BD40();
  sub_4B7C((uint64_t)v39, &qword_68D18);

  (*(void (**)(char *, uint64_t))(v73 + 8))(v20, v43);
  swift_allocObject();
  swift_weakInit();
  sub_4890(&qword_68DA8);
  sub_4C14(&qword_68DB0, &qword_68D88);
  uint64_t v44 = v80;
  uint64_t v45 = v78;
  sub_4BD30();
  swift_release();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v42, v45);
  aBlock[0] = [v75 mainRunLoop];
  __chkstk_darwin(aBlock[0], v46);
  uint64_t v47 = (char *)v68 - v71;
  v69((char *)v68 - v71, 1, 1, v70);
  sub_4C14(&qword_68DB8, &qword_68D80);
  unint64_t v49 = v82;
  int64_t v48 = v83;
  sub_4BD40();
  sub_4B7C((uint64_t)v47, &qword_68CE0);

  (*(void (**)(char *, void *))(v81 + 8))(v44, v49);
  swift_getKeyPath();
  aBlock[0] = v1;
  sub_4C14(&qword_68DC0, &qword_68D78);
  uint64_t v50 = v85;
  sub_4BD70();
  swift_release();
  ((void (*)(char *, uint64_t))v84[1])(v48, v50);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  swift_release();
  uint64_t v51 = sub_4C3B0();
  uint64_t v52 = *(void *)(v51 - 8);
  __chkstk_darwin(v51, v53);
  uint64_t v55 = (char *)v68 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v55, enum case for DispatchQoS.QoSClass.userInitiated(_:), v51);
  uint64_t v85 = sub_4C740();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v55, v51);
  uint64_t v88 = sub_4A6C0;
  uint64_t v89 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_130CC;
  uint64_t v87 = &unk_5FE70;
  long long v56 = _Block_copy(aBlock);
  uint64_t v83 = (char *)sub_4C3E0();
  uint64_t v84 = v68;
  uint64_t v57 = *((void *)v83 - 1);
  __chkstk_darwin(v83, v58);
  uint64_t v60 = (char *)v68 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_4C3C0();
  uint64_t v61 = sub_4C3A0();
  uint64_t v82 = v68;
  uint64_t v62 = *(void *)(v61 - 8);
  __chkstk_darwin(v61, v63);
  uint64_t v65 = (char *)v68 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90[0] = _swiftEmptyArrayStorage;
  sub_4A6C8((unint64_t *)&qword_67548, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4890(&qword_67550);
  sub_4C14((unint64_t *)&qword_67558, &qword_67550);
  sub_4C850();
  uint64_t v66 = (void *)v85;
  sub_4C720();
  _Block_release(v56);

  (*(void (**)(char *, uint64_t))(v62 + 8))(v65, v61);
  (*(void (**)(char *, char *))(v57 + 8))(v60, v83);
  swift_release();
  return v1;
}

uint64_t sub_42660@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  if (qword_66EE8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_4BC10();
  sub_7874(v4, (uint64_t)qword_6B2A0);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_4BBF0();
  os_log_type_t v6 = sub_4C6C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136446210;
    swift_bridgeObjectRetain();
    v43[0] = sub_1C340(v3, v2, v44);
    sub_4C800();
    swift_bridgeObjectRelease_n();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = sub_4BBF0();
    os_log_type_t v11 = sub_4C6C0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "Requesting new snapshot for data model due to invalidation.", v12, 2u);
      swift_slowDealloc();
    }

    uint64_t v13 = sub_3CECC();
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      uint64_t v15 = (void *)(v13 + 32);
      uint64_t v37 = v9;
      uint64_t v36 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel__communicationSafetySetupHasCompleted;
      swift_retain();
      swift_bridgeObjectRetain();
      id v41 = _swiftEmptyArrayStorage;
      do
      {
        sub_A2E4((uint64_t)v15, (uint64_t)v42);
        sub_4890(&qword_68C98);
        type metadata accessor for SensitiveContentWarningListSectionModelProvider();
        if (!swift_dynamicCast()
          || (swift_release(),
              swift_getKeyPath(),
              v42[0] = v37,
              sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel), sub_4BA40(), swift_release(), (*(unsigned char *)(v37 + v36) & 1) != 0))
        {
          uint64_t v17 = v15[3];
          uint64_t v18 = v15[4];
          sub_78AC(v15, v17);
          (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v18 + 16))(v43, v17, v18);
          char v19 = v43[0];
          uint64_t v20 = v43[1];
          uint64_t v21 = v43[2];
          uint64_t v22 = v43[3];
          uint64_t v24 = v43[4];
          uint64_t v23 = v43[5];
          uint64_t v26 = v43[6];
          uint64_t v25 = v43[7];
          uint64_t v39 = v43[9];
          uint64_t v40 = v43[8];
          sub_26130((uint64_t)v43, (uint64_t)v44);
          if (v44[9])
          {
            uint64_t v38 = v23;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              id v41 = sub_46CB0(0, v41[2] + 1, 1, v41);
            }
            unint64_t v28 = v41[2];
            unint64_t v27 = v41[3];
            if (v28 >= v27 >> 1) {
              id v41 = sub_46CB0((void *)(v27 > 1), v28 + 1, 1, v41);
            }
            v41[2] = v28 + 1;
            uint64_t v16 = &v41[10 * v28];
            *((unsigned char *)v16 + 32) = v19;
            v16[5] = v20;
            v16[6] = v21;
            v16[7] = v22;
            v16[8] = v24;
            v16[9] = v38;
            v16[10] = v26;
            v16[11] = v25;
            v16[12] = v40;
            v16[13] = v39;
          }
        }
        v15 += 5;
        --v14;
      }
      while (v14);
      swift_release();
      swift_bridgeObjectRelease_n();
      unint64_t v29 = v41;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v29 = _swiftEmptyArrayStorage;
    }
    uint64_t v30 = sub_10760((uint64_t)v29);
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = v30;
    a2[1] = v32;
    a2[2] = v34;
  }
  else
  {
    a2[1] = 0;
    a2[2] = 0;
    *a2 = 1;
  }
  return result;
}

uint64_t sub_42B38()
{
  [self initializeNudityDetection];
  sub_1222C(0, (unint64_t *)&qword_67540);
  uint64_t v15 = sub_4C710();
  uint64_t v0 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_4A710;
  aBlock[5] = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_130CC;
  id aBlock[3] = &unk_5FE98;
  uint64_t v1 = _Block_copy(aBlock);
  swift_release();
  uint64_t v2 = sub_4C3E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  os_log_type_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4C3C0();
  uint64_t v7 = sub_4C3A0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  os_log_type_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_4A6C8((unint64_t *)&qword_67548, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_4890(&qword_67550);
  sub_4C14((unint64_t *)&qword_67558, &qword_67550);
  sub_4C850();
  uint64_t v12 = (void *)v15;
  sub_4C720();
  _Block_release(v1);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_42E1C()
{
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath, v1);
    sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
    sub_4BA30();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = swift_getKeyPath();
    __chkstk_darwin(v3, v4);
    sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
    sub_4BA30();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_43038()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_cancellables);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v21 = v1;
  uint64_t v22 = v0;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_4C870();
    sub_4BCA0();
    sub_4A770((unint64_t *)&qword_67770, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    uint64_t result = sub_4C680();
    uint64_t v2 = v24;
    uint64_t v4 = v25;
    uint64_t v5 = v26;
    uint64_t v6 = v27;
    unint64_t v7 = v28;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v4 = v2 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v2 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v6 = 0;
  }
  int64_t v11 = (unint64_t)(v5 + 64) >> 6;
  if (v2 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v7)
    {
      uint64_t v12 = (v7 - 1) & v7;
      unint64_t v13 = __clz(__rbit64(v7)) | (v6 << 6);
      uint64_t v14 = v6;
      goto LABEL_27;
    }
    int64_t v15 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      break;
    }
    if (v15 >= v11) {
      goto LABEL_30;
    }
    unint64_t v16 = *(void *)(v4 + 8 * v15);
    uint64_t v14 = v6 + 1;
    if (!v16)
    {
      uint64_t v14 = v6 + 2;
      if (v6 + 2 >= v11) {
        goto LABEL_30;
      }
      unint64_t v16 = *(void *)(v4 + 8 * v14);
      if (!v16)
      {
        uint64_t v14 = v6 + 3;
        if (v6 + 3 >= v11) {
          goto LABEL_30;
        }
        unint64_t v16 = *(void *)(v4 + 8 * v14);
        if (!v16)
        {
          uint64_t v14 = v6 + 4;
          if (v6 + 4 >= v11) {
            goto LABEL_30;
          }
          unint64_t v16 = *(void *)(v4 + 8 * v14);
          if (!v16)
          {
            uint64_t v17 = v6 + 5;
            while (v11 != v17)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v17++);
              if (v16)
              {
                uint64_t v14 = v17 - 1;
                goto LABEL_26;
              }
            }
LABEL_30:
            sub_14FA0();
            *uint64_t v21 = &_swiftEmptySetSingleton;
            swift_bridgeObjectRelease();
            sub_49C04(*(void *)(v22 + 24));
            swift_release();
            swift_bridgeObjectRelease();
            sub_4A288(*(void *)(v22 + 64));
            sub_4B7C(v22+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_appendSettingsNavigationPath, &qword_68A88);
            sub_4B7C(v22+ OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_clearSettingsNavigationPath, &qword_68A80);
            swift_release();
            swift_bridgeObjectRelease();
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v19 = v22
                + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel___observationRegistrar;
            uint64_t v20 = sub_4BA60();
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
            return v22;
          }
        }
      }
    }
LABEL_26:
    uint64_t v12 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v14 << 6);
LABEL_27:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
    swift_retain();
    if (!v18) {
      goto LABEL_30;
    }
    while (1)
    {
      sub_4BC90();
      uint64_t result = swift_release();
      uint64_t v6 = v14;
      unint64_t v7 = v12;
      if ((v2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_4C890())
      {
        sub_4BCA0();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        uint64_t v14 = v6;
        uint64_t v12 = v7;
        if (v23) {
          continue;
        }
      }
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_433CC()
{
  sub_43038();

  return swift_deallocClassInstance();
}

uint64_t sub_43424()
{
  return type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
}

uint64_t type metadata accessor for PrivacyAndSecuritySettingsListViewModel()
{
  uint64_t result = qword_68BA0;
  if (!qword_68BA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_43478()
{
  sub_43614(319, &qword_68BB0, (void (*)(uint64_t))&type metadata accessor for AppendSettingsNavigationPathAction);
  if (v0 <= 0x3F)
  {
    sub_43614(319, (unint64_t *)&unk_68BB8, (void (*)(uint64_t))&type metadata accessor for ClearSettingsNavigationPathAction);
    if (v1 <= 0x3F)
    {
      sub_4BA60();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_43614(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_4C7F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_43668(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  unint64_t v223 = (void *)sub_4BC10();
  uint64_t v221 = *(v223 - 1);
  __chkstk_darwin(v223, v7);
  uint64_t v220 = (char *)&v202 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_4BB60();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v210 = (char *)&v202 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v14);
  unint64_t v16 = (char *)&v202 - v15;
  uint64_t v218 = type metadata accessor for PrivacyAndSecuritySettingsDestinationOption();
  uint64_t v18 = __chkstk_darwin(v218, v17);
  uint64_t v219 = (uint64_t)&v202 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v20);
  uint64_t v215 = (uint64_t)&v202 - v21;
  uint64_t v22 = sub_4890(&qword_68A88);
  uint64_t v24 = __chkstk_darwin(v22 - 8, v23);
  v214 = (char *)&v202 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v24, v26);
  uint64_t v211 = (uint64_t)&v202 - v28;
  __chkstk_darwin(v27, v29);
  uint64_t v31 = (char *)&v202 - v30;
  uint64_t v224 = v3;
  uint64_t v32 = (uint64_t)v3
      + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel_appendSettingsNavigationPath;
  swift_beginAccess();
  uint64_t v213 = v32;
  sub_4B18(v32, (uint64_t)v31, &qword_68A88);
  uint64_t v33 = sub_4BBB0();
  uint64_t v212 = *(void *)(v33 - 8);
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v212 + 48);
  uint64_t v217 = v212 + 48;
  unint64_t v216 = v34;
  int v35 = v34((uint64_t)v31, 1, v33);
  uint64_t result = (void *)sub_4B7C((uint64_t)v31, &qword_68A88);
  if (v35 == 1)
  {
    if (qword_66EE0 != -1) {
      swift_once();
    }
    uint64_t v222 = a3;
    sub_7874((uint64_t)v223, (uint64_t)qword_6B288);
    swift_retain_n();
    uint64_t v37 = sub_4BBF0();
    os_log_type_t v38 = sub_4C6C0();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      unint64_t v231 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315394;
      uint64_t v40 = sub_4CBD0();
      *(void *)&long long v233 = sub_1C340(v40, v41, (uint64_t *)&v231);
      sub_4C800();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
      sub_4C800();
      _os_log_impl(&dword_0, v37, v38, "%s.%s: deferring url load", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath, v54);
    uint64_t v55 = v224;
    *(&v202 - 2) = (uint64_t)v224;
    *(&v202 - 1) = a1;
    unint64_t v231 = v55;
    sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
    swift_bridgeObjectRetain();
    sub_4BA30();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v56 = swift_getKeyPath();
    __chkstk_darwin(v56, v57);
    *(&v202 - 4) = (uint64_t)v55;
    *(&v202 - 3) = (uint64_t)a2;
    *(&v202 - 2) = v222;
    unint64_t v231 = v55;
    sub_4A278((uint64_t)a2);
    sub_4BA30();
    sub_4A288((uint64_t)a2);
    return (void *)swift_release();
  }
  if (a1)
  {
    uint64_t v204 = v33;
    if (qword_66EE0 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_7874((uint64_t)v223, (uint64_t)qword_6B288);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v43 = sub_4BBF0();
    os_log_type_t v44 = sub_4C6C0();
    BOOL v45 = os_log_type_enabled(v43, v44);
    uint64_t v206 = v9;
    unint64_t v207 = v16;
    uint64_t v209 = a1;
    uint64_t v222 = a3;
    uint64_t v205 = v10;
    if (v45)
    {
      uint64_t v46 = swift_slowAlloc();
      v208 = a2;
      uint64_t v47 = v46;
      v203 = (void *)swift_slowAlloc();
      unint64_t v231 = v203;
      *(_DWORD *)uint64_t v47 = 136315907;
      uint64_t v48 = sub_4CBD0();
      *(void *)&long long v233 = sub_1C340(v48, v49, (uint64_t *)&v231);
      sub_4C800();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
      sub_4C800();
      *(_WORD *)(v47 + 22) = 2160;
      *(void *)&long long v233 = 1752392040;
      sub_4C800();
      *(_WORD *)(v47 + 32) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_4C460();
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      *(void *)&long long v233 = sub_1C340(v50, v52, (uint64_t *)&v231);
      sub_4C800();
      a2 = v208;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v43, v44, "Start (%s.%s) url: '%{private,mask.hash}s'…", (uint8_t *)v47, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    swift_retain_n();
    uint64_t v58 = sub_4BBF0();
    os_log_type_t v59 = sub_4C6C0();
    BOOL v60 = os_log_type_enabled(v58, v59);
    if (a2)
    {
      if (v60)
      {
        uint64_t v61 = swift_slowAlloc();
        uint64_t v62 = a2;
        unint64_t v231 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v61 = 136315394;
        uint64_t v63 = sub_4CBD0();
        *(void *)&long long v233 = sub_1C340(v63, v64, (uint64_t *)&v231);
        sub_4C800();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v61 + 12) = 2080;
        *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
        sub_4C800();
        os_log_type_t v65 = v59;
        uint64_t v66 = "%s.%s: completion block present";
LABEL_21:
        _os_log_impl(&dword_0, v58, v65, v66, (uint8_t *)v61, 0x16u);
        swift_arrayDestroy();
        a2 = v62;
        swift_slowDealloc();
        swift_slowDealloc();

LABEL_23:
        uint64_t v69 = v221;
        uint64_t v70 = v220;
        v225[0] = 1752457584;
        v225[1] = 0xE400000000000000;
        sub_4C8C0();
        uint64_t v71 = v209;
        if (*(void *)(v209 + 16) && (unint64_t v72 = sub_1F3E8((uint64_t)&v231), (v73 & 1) != 0))
        {
          sub_10D98(*(void *)(v71 + 56) + 32 * v72, (uint64_t)&v233);
        }
        else
        {
          long long v234 = 0u;
          long long v233 = 0u;
        }
        sub_1FBA0((uint64_t)&v231);
        if (*((void *)&v234 + 1))
        {
          if (swift_dynamicCast())
          {
            v208 = a2;
            uint64_t v74 = v231;
            unint64_t v75 = v232;
            swift_retain_n();
            uint64_t v76 = sub_4BBF0();
            os_log_type_t v77 = sub_4C6C0();
            if (os_log_type_enabled(v76, v77))
            {
              uint64_t v78 = swift_slowAlloc();
              unint64_t v231 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v78 = 136315394;
              unint64_t v223 = v74;
              uint64_t v79 = sub_4CBD0();
              *(void *)&long long v233 = sub_1C340(v79, v80, (uint64_t *)&v231);
              sub_4C800();
              swift_release_n();
              swift_bridgeObjectRelease();
              *(_WORD *)(v78 + 12) = 2080;
              *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
              uint64_t v74 = v223;
              sub_4C800();
              _os_log_impl(&dword_0, v76, v77, "%s.%s: path component is present.", (uint8_t *)v78, 0x16u);
              swift_arrayDestroy();
              uint64_t v71 = v209;
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              swift_release_n();
            }
            unint64_t v231 = v74;
            unint64_t v232 = v75;
            *(void *)&long long v233 = 47;
            *((void *)&v233 + 1) = 0xE100000000000000;
            unint64_t v91 = sub_CD9C();
            uint64_t v92 = (void *)sub_4C820();
            swift_bridgeObjectRelease();
            v230 = v92;
            if (v92[2])
            {
              unint64_t v223 = (void *)v91;
              uint64_t v94 = v92[4];
              unint64_t v93 = v92[5];
              swift_bridgeObjectRetain();
              sub_4A3D4(0, 1);
              uint64_t v95 = 36;
              uint64_t v96 = (void (*)(void))v208;
              uint64_t v97 = &byte_5E0A0;
              while (1)
              {
                int v99 = *v97++;
                int v98 = v99;
                if (sub_6680(v99) == v94 && v100 == v93) {
                  break;
                }
                char v102 = sub_4CA60();
                swift_bridgeObjectRelease();
                if (v102) {
                  goto LABEL_67;
                }
                if (!--v95)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRetain_n();
                  uint64_t v103 = sub_4BBF0();
                  uint64_t v104 = sub_4C6C0();
                  if (os_log_type_enabled(v103, (os_log_type_t)v104))
                  {
                    uint64_t v105 = (uint8_t *)swift_slowAlloc();
                    unint64_t v231 = (void *)swift_slowAlloc();
                    *(_DWORD *)uint64_t v105 = 136446210;
                    swift_bridgeObjectRetain();
                    *(void *)&long long v233 = sub_1C340(v94, v93, (uint64_t *)&v231);
                    uint64_t v96 = (void (*)(void))v208;
                    sub_4C800();
                    swift_bridgeObjectRelease_n();
                    _os_log_impl(&dword_0, v103, (os_log_type_t)v104, "Cannot find enum for identifier %{public}s", v105, 0xCu);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();
                  }
                  else
                  {

                    swift_bridgeObjectRelease_n();
                  }
                  v235._countAndFlagsBits = 35;
                  v235._object = (void *)0xE100000000000000;
                  if (sub_4C5A0(v235))
                  {
                    unint64_t v231 = (void *)v94;
                    unint64_t v232 = v93;
                    *(void *)&long long v233 = 35;
                    *((void *)&v233 + 1) = 0xE100000000000000;
                    uint64_t v111 = sub_4C820();
                    swift_bridgeObjectRelease();
                    uint64_t v112 = *(void *)(v111 + 16);
                    if (v112)
                    {
                      uint64_t v113 = v111 + 16 * v112;
                      uint64_t v114 = *(void *)(v113 + 16);
                      uint64_t v115 = *(void *)(v113 + 24);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRelease();
                      sub_4623C(v114, v115);
                    }
                  }
                  uint64_t v144 = swift_bridgeObjectRelease();
                  if (v96) {
                    ((void (*)(uint64_t))v96)(v144);
                  }
                  goto LABEL_94;
                }
              }
              swift_bridgeObjectRelease();
LABEL_67:
              swift_bridgeObjectRelease();
              unint64_t v223 = (void *)v42;
              LOBYTE(v231) = v98;
              sub_4BCC0();
              uint64_t v116 = sub_3B714();
              unint64_t v231 = _swiftEmptyArrayStorage;
              uint64_t v117 = *(void *)(v116 + 16);
              uint64_t v118 = v207;
              if (v117)
              {
                unint64_t v119 = v207;
                int v120 = v98;
                swift_bridgeObjectRetain();
                uint64_t v121 = 104;
                do
                {
                  uint64_t v122 = swift_bridgeObjectRetain();
                  sub_47008(v122);
                  v121 += 80;
                  --v117;
                }
                while (v117);
                swift_bridgeObjectRelease();
                int v98 = v120;
                uint64_t v118 = v119;
                uint64_t v96 = (void (*)(void))v208;
              }
              swift_bridgeObjectRelease();
              id v123 = v231;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v124 = v123[2];
              uint64_t v125 = v206;
              if (v124)
              {
                uint64_t v126 = 4;
                while (LOBYTE(v123[v126]) != v98)
                {
                  v126 += 13;
                  if (!--v124) {
                    goto LABEL_75;
                  }
                }
                swift_bridgeObjectRelease();
                uint64_t v141 = v215;
                LODWORD(v221) = v98;
                sub_114A8(v98, v215);
                if (swift_getEnumCaseMultiPayload() == 1)
                {
                  sub_11170(v141);
                  uint64_t v142 = 0;
                  uint64_t v143 = v219;
                }
                else
                {
                  (*(void (**)(uint64_t, uint64_t))(v205 + 8))(v141, v125);
                  *(void *)&long long v233 = 0x6574616D696E61;
                  *((void *)&v233 + 1) = 0xE700000000000000;
                  swift_bridgeObjectRetain();
                  sub_4C8C0();
                  *((void *)&v234 + 1) = &type metadata for Bool;
                  LOBYTE(v233) = 1;
                  sub_10DF4(&v233, v225);
                  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  uint64_t v226 = v71;
                  sub_47164(v225, (uint64_t)&v231, isUniquelyReferenced_nonNull_native);
                  uint64_t v142 = v226;
                  swift_bridgeObjectRelease();
                  sub_1FBA0((uint64_t)&v231);
                  unint64_t v231 = v230;
                  swift_bridgeObjectRetain();
                  sub_4890(&qword_68D48);
                  sub_4C14(&qword_68D50, &qword_68D48);
                  uint64_t v149 = sub_4C490();
                  unint64_t v151 = v150;
                  swift_bridgeObjectRelease();
                  uint64_t v152 = HIBYTE(v151) & 0xF;
                  if ((v151 & 0x2000000000000000) == 0) {
                    uint64_t v152 = v149 & 0xFFFFFFFFFFFFLL;
                  }
                  if (v152)
                  {
                    *(void *)&long long v233 = 1752457584;
                    *((void *)&v233 + 1) = 0xE400000000000000;
                    sub_4C8C0();
                    *((void *)&v234 + 1) = &type metadata for String;
                    *(void *)&long long v233 = v149;
                    *((void *)&v233 + 1) = v151;
                    sub_10DF4(&v233, v225);
                    char v153 = swift_isUniquelyReferenced_nonNull_native();
                    uint64_t v226 = v142;
                    sub_47164(v225, (uint64_t)&v231, v153);
                    uint64_t v142 = v226;
                    swift_bridgeObjectRelease();
                    sub_1FBA0((uint64_t)&v231);
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                  }
                  uint64_t v143 = v219;
                }
                sub_114A8(v221, v143);
                if (swift_getEnumCaseMultiPayload() == 1)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v154 = sub_4BBF0();
                  os_log_type_t v155 = sub_4C6C0();
                  if (os_log_type_enabled(v154, v155))
                  {
                    uint64_t v156 = (uint8_t *)swift_slowAlloc();
                    unint64_t v231 = (void *)swift_slowAlloc();
                    *(_DWORD *)uint64_t v156 = 136446210;
                    unint64_t v157 = sub_7144(v221);
                    *(void *)&long long v233 = sub_1C340(v157, v158, (uint64_t *)&v231);
                    sub_4C800();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_0, v154, v155, "Attempting to deep link into %{public}s which is not supported.", v156, 0xCu);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();
                  }

                  if (v96) {
                    v96();
                  }
                  sub_11170(v219);
                  goto LABEL_127;
                }
                (*(void (**)(char *, uint64_t, uint64_t))(v205 + 32))(v118, v143, v125);
                swift_retain_n();
                uint64_t v159 = sub_4BBF0();
                os_log_type_t v160 = sub_4C6C0();
                if (os_log_type_enabled(v159, v160))
                {
                  uint64_t v161 = swift_slowAlloc();
                  unint64_t v231 = (void *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v161 = 136315394;
                  uint64_t v162 = sub_4CBD0();
                  *(void *)&long long v233 = sub_1C340(v162, v163, (uint64_t *)&v231);
                  sub_4C800();
                  swift_release_n();
                  uint64_t v118 = v207;
                  swift_bridgeObjectRelease();
                  *(_WORD *)(v161 + 12) = 2080;
                  *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
                  uint64_t v96 = (void (*)(void))v208;
                  sub_4C800();
                  _os_log_impl(&dword_0, v159, v160, "%s.%s: found recipe", (uint8_t *)v161, 0x16u);
                  swift_arrayDestroy();
                  uint64_t v125 = v206;
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_release_n();
                }
                if (v142)
                {
                  swift_retain_n();
                  swift_bridgeObjectRetain_n();
                  uint64_t v164 = sub_4BBF0();
                  os_log_type_t v165 = sub_4C6C0();
                  int v166 = v165;
                  if (os_log_type_enabled(v164, v165))
                  {
                    uint64_t v167 = swift_slowAlloc();
                    uint64_t v220 = (char *)swift_slowAlloc();
                    unint64_t v231 = v220;
                    *(_DWORD *)uint64_t v167 = 136315907;
                    LODWORD(v219) = v166;
                    uint64_t v168 = sub_4CBD0();
                    *(void *)&long long v233 = sub_1C340(v168, v169, (uint64_t *)&v231);
                    sub_4C800();
                    swift_release_n();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v167 + 12) = 2080;
                    *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
                    sub_4C800();
                    *(_WORD *)(v167 + 22) = 2081;
                    swift_bridgeObjectRetain();
                    uint64_t v170 = sub_4C460();
                    uint64_t v171 = v71;
                    unint64_t v173 = v172;
                    swift_bridgeObjectRelease();
                    *(void *)&long long v233 = sub_1C340(v170, v173, (uint64_t *)&v231);
                    sub_4C800();
                    swift_bridgeObjectRelease_n();
                    uint64_t v71 = v171;
                    uint64_t v96 = (void (*)(void))v208;
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v167 + 32) = 2081;
                    swift_beginAccess();
                    sub_4A770(&qword_68D40, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
                    uint64_t v174 = sub_4CA40();
                    *(void *)&long long v233 = sub_1C340(v174, v175, (uint64_t *)&v231);
                    sub_4C800();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_0, v164, (os_log_type_t)v219, "%s.%s: calling pending url dict: %{private}s, on recipe: %{private}s", (uint8_t *)v167, 0x2Au);
                    uint64_t v118 = v207;
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    uint64_t v125 = v206;
                    swift_slowDealloc();
                  }
                  else
                  {

                    swift_bridgeObjectRelease_n();
                    swift_release_n();
                  }
                  uint64_t v176 = v210;
                  swift_beginAccess();
                  sub_4BB30();
                  swift_bridgeObjectRelease();
                  swift_beginAccess();
                  (*(void (**)(char *, char *, uint64_t))(v205 + 40))(v118, v176, v125);
                }
                swift_retain_n();
                uint64_t v177 = sub_4BBF0();
                os_log_type_t v178 = sub_4C6C0();
                if (os_log_type_enabled(v177, v178))
                {
                  uint64_t v179 = swift_slowAlloc();
                  unint64_t v231 = (void *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v179 = 136315394;
                  uint64_t v180 = sub_4CBD0();
                  uint64_t v229 = sub_1C340(v180, v181, (uint64_t *)&v231);
                  sub_4C800();
                  swift_release_n();
                  uint64_t v125 = v206;
                  swift_bridgeObjectRelease();
                  *(_WORD *)(v179 + 12) = 2080;
                  uint64_t v229 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
                  uint64_t v118 = v207;
                  sub_4C800();
                  _os_log_impl(&dword_0, v177, v178, "%s.%s: appending recipe to path", (uint8_t *)v179, 0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  swift_release_n();
                }
                uint64_t v182 = (uint64_t)v214;
                uint64_t v183 = v213;
                uint64_t v184 = v211;
                sub_4B18(v213, v211, &qword_68A88);
                int v185 = v216(v184, 1, v204);
                sub_4B7C(v184, &qword_68A88);
                if (v185 == 1)
                {
                  swift_retain_n();
                  v186 = sub_4BBF0();
                  os_log_type_t v187 = sub_4C6A0();
                  if (os_log_type_enabled(v186, v187))
                  {
                    uint64_t v188 = swift_slowAlloc();
                    unint64_t v231 = (void *)swift_slowAlloc();
                    *(_DWORD *)uint64_t v188 = 136315394;
                    uint64_t v189 = sub_4CBD0();
                    uint64_t v229 = sub_1C340(v189, v190, (uint64_t *)&v231);
                    sub_4C800();
                    swift_release_n();
                    uint64_t v125 = v206;
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v188 + 12) = 2080;
                    uint64_t v229 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
                    uint64_t v118 = v207;
                    sub_4C800();
                    _os_log_impl(&dword_0, v186, v187, "%s.%s: appendSettingsNavigationPath function is nil", (uint8_t *)v188, 0x16u);
                    swift_arrayDestroy();
                    uint64_t v183 = v213;
                    swift_slowDealloc();
                    uint64_t v182 = (uint64_t)v214;
                    swift_slowDealloc();
                  }
                  else
                  {

                    swift_release_n();
                  }
                }
                sub_4B18(v183, v182, &qword_68A88);
                uint64_t v191 = v204;
                uint64_t result = (void *)v216(v182, 1, v204);
                if (result != 1)
                {
                  swift_bridgeObjectRelease();
                  swift_beginAccess();
                  sub_4A770(&qword_688D0, (void (*)(uint64_t))&type metadata accessor for PreferencesControllerRecipe);
                  sub_4BBA0();
                  (*(void (**)(uint64_t, uint64_t))(v212 + 8))(v182, v191);
                  (*(void (**)(char *, uint64_t))(v205 + 8))(v118, v125);
LABEL_127:
                  swift_retain_n();
                  v192 = sub_4BBF0();
                  os_log_type_t v193 = sub_4C6C0();
                  if (os_log_type_enabled(v192, v193))
                  {
                    uint64_t v194 = swift_slowAlloc();
                    uint64_t v229 = swift_slowAlloc();
                    *(_DWORD *)uint64_t v194 = 136315394;
                    uint64_t v195 = sub_4CBD0();
                    uint64_t v228 = sub_1C340(v195, v196, &v229);
                    sub_4C800();
                    swift_release_n();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v194 + 12) = 2080;
                    uint64_t v228 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, &v229);
                    sub_4C800();
                    _os_log_impl(&dword_0, v192, v193, "%s.%s: updating selection", (uint8_t *)v194, 0x16u);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();
                  }
                  else
                  {

                    swift_release_n();
                  }
                  char v197 = v221;
                  uint64_t v198 = swift_getKeyPath();
                  __chkstk_darwin(v198, v199);
                  uint64_t v200 = (uint64_t)v224;
                  *(&v202 - 2) = (uint64_t)v224;
                  *((unsigned char *)&v202 - 8) = v197;
                  uint64_t v229 = v200;
                  sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
                  sub_4BA30();
                  uint64_t v201 = swift_release();
                  if (v96) {
                    ((void (*)(uint64_t))v96)(v201);
                  }
                  uint64_t v147 = (uint64_t)v224;
                  return (void *)sub_46444(v147, v71);
                }
LABEL_134:
                __break(1u);
                return result;
              }
LABEL_75:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v127 = sub_4BBF0();
              os_log_type_t v128 = sub_4C6C0();
              if (os_log_type_enabled(v127, v128))
              {
                uint64_t v129 = (uint8_t *)swift_slowAlloc();
                unint64_t v231 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v129 = 136446210;
                unint64_t v130 = sub_7144(v98);
                *(void *)&long long v233 = sub_1C340(v130, v131, (uint64_t *)&v231);
                sub_4C800();
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_0, v127, v128, "Cannot link to '%{public}s' as it is not an item in the list.", v129, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }

              if (v96) {
                v96();
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v106 = sub_4BBF0();
              os_log_type_t v107 = sub_4C6C0();
              BOOL v108 = os_log_type_enabled(v106, v107);
              uint64_t v109 = (void (*)(void))v208;
              if (v108)
              {
                uint64_t v110 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v110 = 0;
                _os_log_impl(&dword_0, v106, v107, "No first path component (likely linking to root of pane).", v110, 2u);
                swift_slowDealloc();
              }

              if (v109) {
                v109();
              }
            }
LABEL_94:
            uint64_t v145 = swift_getKeyPath();
            __chkstk_darwin(v145, v146);
            uint64_t v140 = v224;
            *(&v202 - 2) = (uint64_t)v224;
            *((unsigned char *)&v202 - 8) = 36;
            unint64_t v231 = v140;
            sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
            goto LABEL_95;
          }
        }
        else
        {
          sub_4B7C((uint64_t)&v233, &qword_67A40);
        }
        uint64_t v81 = sub_4BBF0();
        os_log_type_t v82 = sub_4C6C0();
        if (os_log_type_enabled(v81, v82))
        {
          uint64_t v83 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v83 = 0;
          _os_log_impl(&dword_0, v81, v82, "No path component.", v83, 2u);
          swift_slowDealloc();
        }

        *(_OWORD *)v225 = 0uLL;
        uint64_t v226 = 1953460082;
        unint64_t v227 = 0xE400000000000000;
        sub_4C8C0();
        if (*(void *)(v71 + 16) && (unint64_t v84 = sub_1F3E8((uint64_t)&v231), (v85 & 1) != 0))
        {
          sub_10D98(*(void *)(v71 + 56) + 32 * v84, (uint64_t)&v233);
        }
        else
        {
          long long v234 = 0u;
          long long v233 = 0u;
        }
        sub_1FBA0((uint64_t)&v231);
        if (*((void *)&v234 + 1))
        {
          if (swift_dynamicCast())
          {
            *(void *)&long long v233 = 35;
            *((void *)&v233 + 1) = 0xE100000000000000;
            sub_CD9C();
            uint64_t v86 = sub_4C820();
            swift_bridgeObjectRelease();
            if (*(void *)(v86 + 16) == 2)
            {
              swift_bridgeObjectRelease();
              uint64_t v87 = *(void *)(v86 + 16);
              if (v87)
              {
                uint64_t v88 = v86 + 16 * v87;
                uint64_t v90 = *(void *)(v88 + 16);
                unint64_t v89 = *(void *)(v88 + 24);
                swift_bridgeObjectRetain();
              }
              else
              {
                uint64_t v90 = 0;
                unint64_t v89 = 0;
              }
              swift_bridgeObjectRelease();
              v225[0] = v90;
              v225[1] = v89;
              uint64_t v132 = v42;
              uint64_t v133 = (uint64_t)v223;
              (*(void (**)(char *, uint64_t, void *))(v69 + 16))(v70, v132, v223);
              swift_bridgeObjectRetain_n();
              uint64_t v134 = sub_4BBF0();
              os_log_type_t v135 = sub_4C6C0();
              if (os_log_type_enabled(v134, v135))
              {
                v208 = a2;
                uint64_t v136 = (uint8_t *)swift_slowAlloc();
                uint64_t result = (void *)swift_slowAlloc();
                unint64_t v231 = result;
                *(_DWORD *)uint64_t v136 = 136446210;
                if (!v89)
                {
                  __break(1u);
                  goto LABEL_134;
                }
                swift_bridgeObjectRetain();
                *(void *)&long long v233 = sub_1C340(v90, v89, (uint64_t *)&v231);
                sub_4C800();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_0, v134, v135, "Found scroll offset string %{public}s", v136, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                (*(void (**)(char *, void *))(v221 + 8))(v220, v223);
                a2 = v208;
              }
              else
              {

                swift_bridgeObjectRelease_n();
                (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v133);
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
        }
        else
        {
          sub_4B7C((uint64_t)&v233, &qword_67A40);
        }
        uint64_t v137 = swift_beginAccess();
        if (v225[1])
        {
          sub_4623C(v225[0], v225[1]);
          uint64_t v137 = swift_bridgeObjectRelease();
        }
        if (a2) {
          a2(v137);
        }
        uint64_t v138 = swift_getKeyPath();
        __chkstk_darwin(v138, v139);
        uint64_t v140 = v224;
        *(&v202 - 2) = (uint64_t)v224;
        *((unsigned char *)&v202 - 8) = 36;
        *(void *)&long long v233 = v140;
        sub_4A770(&qword_687B8, (void (*)(uint64_t))type metadata accessor for PrivacyAndSecuritySettingsListViewModel);
LABEL_95:
        sub_4BA30();
        swift_release();
        uint64_t v147 = (uint64_t)v140;
        return (void *)sub_46444(v147, v71);
      }
    }
    else if (v60)
    {
      uint64_t v61 = swift_slowAlloc();
      uint64_t v62 = 0;
      unint64_t v231 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v61 = 136315394;
      uint64_t v67 = sub_4CBD0();
      *(void *)&long long v233 = sub_1C340(v67, v68, (uint64_t *)&v231);
      sub_4C800();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 12) = 2080;
      *(void *)&long long v233 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, (uint64_t *)&v231);
      sub_4C800();
      os_log_type_t v65 = v59;
      uint64_t v66 = "%s.%s: completion block not present";
      goto LABEL_21;
    }

    swift_release_n();
    goto LABEL_23;
  }
  if (a2) {
    return (void *)((uint64_t (*)(void *))a2)(result);
  }
  return result;
}

uint64_t sub_4623C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 36;
  uint64_t v5 = &byte_5E0A0;
  while (1)
  {
    char v7 = *v5++;
    char v6 = v7;
    if (sub_6680(v7) == a1 && v8 == a2) {
      break;
    }
    char v10 = sub_4CA60();
    uint64_t result = swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_10;
    }
    if (!--v2) {
      return result;
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  if (qword_66EE0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_4BC10();
  sub_7874(v12, (uint64_t)qword_6B288);
  uint64_t v13 = sub_4BBF0();
  os_log_type_t v14 = sub_4C6C0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136446210;
    uint64_t v16 = sub_6680(v6);
    sub_1C340(v16, v17, &v18);
    sub_4C800();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v13, v14, "Scrolling to offset %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  LOBYTE(v18) = v6;
  return sub_4BCC0();
}

uint64_t sub_46444(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_4BC10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  char v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_66EE0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_7874(v3, (uint64_t)qword_6B288);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v8, v3);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v9 = sub_4BBF0();
  int v10 = sub_4C6C0();
  if (!os_log_type_enabled(v9, (os_log_type_t)v10))
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  int v21 = v10;
  os_log_t v22 = v9;
  uint64_t v11 = swift_slowAlloc();
  uint64_t v20 = swift_slowAlloc();
  uint64_t v24 = v20;
  *(_DWORD *)uint64_t v11 = 136315907;
  uint64_t v12 = sub_4CBD0();
  uint64_t v23 = sub_1C340(v12, v13, &v24);
  sub_4C800();
  swift_release_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v11 + 12) = 2080;
  uint64_t v23 = sub_1C340(0xD00000000000001CLL, 0x8000000000052D00, &v24);
  sub_4C800();
  *(_WORD *)(v11 + 22) = 2160;
  uint64_t v23 = 1752392040;
  uint64_t result = sub_4C800();
  *(_WORD *)(v11 + 32) = 2081;
  if (a2)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_4C460();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_1C340(v15, v17, &v24);
    sub_4C800();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v18 = v22;
    _os_log_impl(&dword_0, v22, (os_log_type_t)v21, "…Complete (%s.%s) url: '%{private,mask.hash}s'", (uint8_t *)v11, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_467E0()
{
  return swift_release();
}

uint64_t sub_46838()
{
  sub_1222C(0, (unint64_t *)&qword_67540);
  uint64_t v0 = sub_4C3E0();
  __chkstk_darwin(v0 - 8, v1);
  sub_4C3D0();
  uint64_t v2 = sub_4C6D0();
  __chkstk_darwin(v2, v3);
  v9[1] = _swiftEmptyArrayStorage;
  sub_4A6C8(&qword_68DC8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_4890(&qword_68DD0);
  sub_4C14(&qword_68DD8, &qword_68DD0);
  sub_4C850();
  uint64_t v4 = sub_4C700();
  __chkstk_darwin(v4, v5);
  (*(void (**)(char *, void))(v7 + 104))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  uint64_t result = sub_4C730();
  qword_68B48 = result;
  return result;
}

void *sub_46A78(void *result, int64_t a2, char a3, void *a4)
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
      sub_4890(&qword_67578);
      int v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 104);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[13 * v8 + 4]) {
          memmove(v12, a4 + 4, 104 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_49994(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_46BA0(void *result, int64_t a2, char a3, void *a4)
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
      sub_4890(&qword_68DE0);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = _swiftEmptyArrayStorage;
      unint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_49CA0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_46CB0(void *result, int64_t a2, char a3, void *a4)
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
      sub_4890(&qword_68CA0);
      int v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 80);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[10 * v8 + 4]) {
          memmove(v12, a4 + 4, 80 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_49A88(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_46DD4(void *result, int64_t a2, char a3, void *a4)
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
      sub_4890(&qword_67568);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      _OWORD v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = _swiftEmptyArrayStorage;
      unint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_4A2E0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_46EE4(void *result, int64_t a2, char a3, void *a4)
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
      sub_4890(&qword_68CB0);
      int v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      _OWORD v10[2] = v8;
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
      int v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_49DAC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_47008(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_46A78(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[13 * v8 + 4];
  if (a1 + 32 < v9 + 104 * v2 && v9 < a1 + 32 + 104 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

_OWORD *sub_47164(_OWORD *a1, uint64_t a2, char a3)
{
  int64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_1F3E8(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_10578();
      goto LABEL_7;
    }
    sub_FAEC(v13, a3 & 1);
    unint64_t v19 = sub_1F3E8(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_10D3C(a2, (uint64_t)v21);
      return sub_147EC(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_4CA80();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_78F0((uint64_t)v17);

  return sub_10DF4(a1, v17);
}

char *sub_472B0(uint64_t a1, unsigned char *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v18[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v18[4] = &off_5FB80;
  v18[0] = a1;
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_id] = 9;
  uint64_t v5 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessoriesAccessMap;
  unint64_t v6 = a2;
  *(void *)&a2[v5] = sub_3B0B4((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v6[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_accessCount] = 0;
  sub_A2E4((uint64_t)v18, (uint64_t)&v6[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_invalidator]);
  id v7 = [objc_allocWithZone((Class)DASession) init];
  *(void *)&v6[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session] = v7;

  v17.receiver = v6;
  v17.super_class = ObjectType;
  uint64_t v8 = (char *)objc_msgSendSuper2(&v17, "init");
  uint64_t v9 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session;
  unint64_t v10 = *(void **)&v8[OBJC_IVAR____TtC26PrivacyAndSecuritySettings27AccessoriesListItemProvider_session];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  aBlock[4] = sub_4A09C;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3B658;
  id aBlock[3] = &unk_5FC68;
  BOOL v12 = _Block_copy(aBlock);
  uint64_t v13 = v8;
  id v14 = v10;
  swift_release();
  [v14 setEventHandler:v12];
  _Block_release(v12);

  [*(id *)&v8[v9] activate];
  sub_78F0((uint64_t)v18);
  return v13;
}

id sub_47484(uint64_t a1, unsigned char *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_4890(&qword_67720);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v30[4] = &off_5FB80;
  v30[3] = v9;
  v30[0] = a1;
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_id] = 4;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_cancellables] = &_swiftEmptySetSingleton;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_installedAppsBundleIdentifiers] = &_swiftEmptySetSingleton;
  unint64_t v10 = &a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_documentsBundleID];
  void *v10 = 0xD000000000000016;
  v10[1] = 0x8000000000052C90;
  uint64_t v11 = (uint64_t *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_appsCountString];
  uint64_t v12 = qword_66ED0;
  uint64_t v13 = a2;
  if (v12 != -1) {
    swift_once();
  }
  id v14 = (void *)qword_6B268;
  uint64_t v15 = (void *)sub_4C4D0();
  id v16 = [v14 localizedStringForKey:v15 value:0 table:0];

  uint64_t v17 = sub_4C500();
  uint64_t v19 = v18;

  *uint64_t v11 = v17;
  v11[1] = v19;
  sub_A2E4((uint64_t)v30, (uint64_t)&v13[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_invalidator]);
  id v20 = [objc_allocWithZone((Class)FPAccessControlManager) init];
  *(void *)&v13[OBJC_IVAR____TtC26PrivacyAndSecuritySettings39FilesAndFoldersSubtitleListItemProvider_accessManager] = v20;

  v29.receiver = v13;
  v29.super_class = ObjectType;
  id v21 = objc_msgSendSuper2(&v29, "init");
  os_log_t v22 = self;
  id v23 = v21;
  id result = [v22 defaultWorkspace];
  if (result)
  {
    uint64_t v25 = result;
    [result addObserver:v23];

    uint64_t v26 = sub_4C670();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v8, 1, 1, v26);
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = 0;
    v27[3] = 0;
    v27[4] = v23;
    sub_16074((uint64_t)v8, (uint64_t)&unk_68D38, (uint64_t)v27);
    swift_release();
    sub_78F0((uint64_t)v30);
    return v23;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_47764(uint64_t a1, unsigned char *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v31[4] = &off_5FB80;
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_id] = 5;
  uint64_t v6 = &a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthKitUIAuthorizationDidUpdateNotification];
  void *v6 = 0xD000000000000026;
  v6[1] = 0x8000000000052C60;
  *(_DWORD *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_notifyToken] = 0;
  v31[3] = v5;
  v31[0] = a1;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsCount] = 0;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_studiesCount] = 0;
  uint64_t v7 = &a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_appsAndStudiesString];
  uint64_t v8 = a2;
  sub_4C000();
  LOWORD(v28) = 256;
  *(void *)uint64_t v7 = sub_4C160();
  *((void *)v7 + 1) = v9;
  v7[16] = v10 & 1;
  *((void *)v7 + 3) = v11;
  sub_A2E4((uint64_t)v31, (uint64_t)&v8[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_invalidator]);
  id v12 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init", 0, v28);
  uint64_t v13 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthStore;
  *(void *)&v8[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthStore] = v12;
  id v14 = [objc_allocWithZone((Class)HKSourceListDataSource) initWithHealthStore:v12];
  *(void *)&v8[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_sourceListDataSource] = v14;
  id v15 = [objc_allocWithZone((Class)HKAuthorizationStore) initWithHealthStore:*(void *)&v8[v13]];
  *(void *)&v8[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_healthAuthorizationStore] = v15;

  v30.receiver = v8;
  v30.super_class = ObjectType;
  id v16 = (char *)objc_msgSendSuper2(&v30, "init");
  uint64_t v17 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_sourceListDataSource;
  uint64_t v18 = *(void **)&v16[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_sourceListDataSource];
  uint64_t v19 = v16;
  [v18 fetchSources];
  [*(id *)&v16[v17] registerObserver:v19];
  sub_1222C(0, (unint64_t *)&qword_67540);
  id v20 = sub_4C710();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  aBlock[4] = sub_4A15C;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3B6C0;
  id aBlock[3] = &unk_5FD58;
  os_log_t v22 = _Block_copy(aBlock);
  id v23 = v19;
  swift_release();
  uint64_t v24 = (const char *)(sub_4C550() + 32);
  uint64_t v25 = (int *)&v23[OBJC_IVAR____TtC26PrivacyAndSecuritySettings26HealthDataListItemProvider_notifyToken];
  swift_beginAccess();
  notify_register_dispatch(v24, v25, v20, v22);
  swift_endAccess();
  swift_release();
  _Block_release(v22);

  id result = (char *)[self defaultWorkspace];
  if (result)
  {
    uint64_t v27 = result;
    [result addObserver:v23];

    sub_78F0((uint64_t)v31);
    return v23;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_47AD4(uint64_t a1, unsigned char *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_4890(&qword_67720);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_id] = 0;
  char v10 = &a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_findMy];
  void *v10 = 0xD00000000000002FLL;
  v10[1] = 0x8000000000052CB0;
  uint64_t v11 = &a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_bundleId];
  *uint64_t v11 = 0x6449656C646E7542;
  v11[1] = 0xE800000000000000;
  id v12 = &a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_bundlePath];
  *id v12 = 0x6150656C646E7542;
  v12[1] = 0xEA00000000006874;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_cancellables] = &_swiftEmptySetSingleton;
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_gotLocationState] = 0;
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isServiceEnabled] = 0;
  a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_isStatusBarIconEnabled] = 0;
  v20[3] = v9;
  v20[4] = &off_5FB80;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedAlwaysCount] = 0;
  v20[0] = a1;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_authorizedWhenInUseCount] = 0;
  *(void *)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_systemServicesCount] = 0;
  sub_A2E4((uint64_t)v20, (uint64_t)&a2[OBJC_IVAR____TtC26PrivacyAndSecuritySettings37LocationServicesStateListItemProvider_invalidator]);
  v19.receiver = a2;
  v19.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v19, "init");
  sub_4C650();
  uint64_t v14 = sub_4C670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 0, 1, v14);
  id v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v13;
  id v16 = v13;
  sub_1C9E8((uint64_t)v8, (uint64_t)&unk_67A28, (uint64_t)v15);
  swift_release();
  sub_4B7C((uint64_t)v8, &qword_67720);

  sub_78F0((uint64_t)v20);
  return v16;
}

uint64_t sub_47D40(uint64_t a1, uint64_t a2)
{
  _OWORD v24[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v24[4] = &off_5FB80;
  v24[0] = a1;
  *(unsigned char *)(a2 + 16) = 22;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = &_swiftEmptySetSingleton;
  *(_DWORD *)(a2 + 40) = 0;
  *(_DWORD *)(a2 + 44) = 0;
  *(void *)(a2 + 88) = 0xD00000000000001CLL;
  *(void *)(a2 + 96) = 0x8000000000051B90;
  *(void *)(a2 + 104) = 0xD000000000000028;
  *(void *)(a2 + 112) = 0x8000000000052C30;
  sub_A2E4((uint64_t)v24, a2 + 48);
  sub_1222C(0, (unint64_t *)&qword_67540);
  int64_t v4 = sub_4C710();
  os_log_t v22 = sub_4A0BC;
  uint64_t v23 = a2;
  aBlock = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  id v20 = sub_3B6C0;
  uint64_t v21 = &unk_5FC90;
  uint64_t v5 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v6 = (const char *)(sub_4C550() + 32);
  swift_beginAccess();
  notify_register_dispatch(v6, (int *)(a2 + 44), v4, v5);
  swift_endAccess();
  swift_release();
  _Block_release(v5);

  uint64_t v7 = sub_4C710();
  os_log_t v22 = sub_4A0C4;
  uint64_t v23 = a2;
  aBlock = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  id v20 = sub_3B6C0;
  uint64_t v21 = &unk_5FCB8;
  uint64_t v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  uint64_t v9 = (const char *)(sub_4C550() + 32);
  swift_beginAccess();
  notify_register_dispatch(v9, (int *)(a2 + 40), v7, v8);
  swift_endAccess();
  swift_release();
  _Block_release(v8);

  if (&_SRIsDataCollectionEnabled)
  {
    uint64_t v10 = sub_4890(&qword_67720);
    __chkstk_darwin(v10 - 8, v11);
    id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_4C650();
    uint64_t v14 = sub_4C670();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
    id v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = a2;
    swift_retain();
    sub_1C9E8((uint64_t)v13, (uint64_t)&unk_67B70, (uint64_t)v15);
    swift_release();
    sub_4B7C((uint64_t)v13, &qword_67720);
  }
  sub_78F0((uint64_t)v24);
  return a2;
}

uint64_t sub_480E8(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v33 = a1;
  uint64_t v36[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v36[4] = &off_5FB80;
  v36[0] = a3;
  *(void *)(a4 + 40) = &_swiftEmptySetSingleton;
  *(_DWORD *)(a4 + 48) = 0;
  *(unsigned char *)(a4 + 52) = 0;
  *(void *)(a4 + 96) = 0xD00000000000001CLL;
  *(void *)(a4 + 104) = 0x8000000000051B90;
  *(unsigned char *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  *(void *)(a4 + 32) = 0;
  sub_A2E4((uint64_t)v36, a4 + 56);
  uint64_t v8 = sub_4890(&qword_68D08);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_4890(&qword_68D10);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v34 = a2;
  swift_retain();
  sub_4890(&qword_67D68);
  sub_4BCF0();
  swift_endAccess();
  sub_1222C(0, (unint64_t *)&qword_67540);
  id v35 = (id)sub_4C710();
  uint64_t v18 = sub_4890(&qword_68D18);
  __chkstk_darwin(v18 - 8, v19);
  uint64_t v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_4C6F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  sub_4C14(&qword_68D20, &qword_68D10);
  sub_49FAC(&qword_68D28, (unint64_t *)&qword_67540);
  sub_4BD40();
  sub_4B7C((uint64_t)v21, &qword_68D18);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  swift_allocObject();
  swift_weakInit();
  sub_4C14(&qword_68D30, &qword_68D08);
  uint64_t v23 = v31;
  sub_4BD60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v12, v23);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  swift_release();
  if (v33 == 1)
  {
    uint64_t v24 = sub_4C750();
    uint64_t v25 = *(void *)(v24 - 8);
    __chkstk_darwin(v24, v26);
    uint64_t v28 = (char *)&v31 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v29 = [self defaultCenter];
    if (qword_66EA8 != -1) {
      swift_once();
    }
    sub_4C760();

    swift_allocObject();
    swift_weakInit();
    sub_4A6C8((unint64_t *)&qword_67640, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
    sub_4BD60();
    swift_release();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
    swift_beginAccess();
    sub_4BC80();
    swift_endAccess();
    swift_release();
    sub_217DC();
  }
  swift_release();
  sub_78F0((uint64_t)v36);
  return a4;
}

uint64_t sub_486C8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v29[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v29[4] = &off_5FB80;
  v29[0] = a3;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_DWORD *)(a4 + 64) = 0;
  *(void *)(a4 + 112) = 0xD00000000000001CLL;
  *(void *)(a4 + 120) = 0x8000000000051B90;
  *(unsigned char *)(a4 + 16) = a1;
  *(void *)(a4 + 24) = a2;
  sub_A2E4((uint64_t)v29, a4 + 72);
  uint64_t v8 = sub_4890(&qword_68D08);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_4890(&qword_68D10);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_retain();
  sub_4890(&qword_67D68);
  sub_4BCF0();
  swift_endAccess();
  sub_1222C(0, (unint64_t *)&qword_67540);
  id v28 = (id)sub_4C710();
  uint64_t v18 = sub_4890(&qword_68D18);
  __chkstk_darwin(v18 - 8, v19);
  uint64_t v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_4C6F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  sub_4C14(&qword_68D20, &qword_68D10);
  sub_49FAC(&qword_68D28, (unint64_t *)&qword_67540);
  sub_4BD40();
  sub_4B7C((uint64_t)v21, &qword_68D18);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  swift_allocObject();
  swift_weakInit();
  sub_4C14(&qword_68D30, &qword_68D08);
  uint64_t v23 = v26;
  uint64_t v24 = sub_4BD60();
  swift_release();
  swift_release();
  sub_78F0((uint64_t)v29);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v23);
  *(void *)(a4 + 56) = v24;
  swift_release();
  return a4;
}

uint64_t sub_48AB8(uint64_t a1, uint64_t a2)
{
  v27[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v27[4] = &off_5FB80;
  v27[0] = a1;
  uint64_t v25 = a2;
  *(void *)(a2 + 64) = &_swiftEmptySetSingleton;
  a2 += 64;
  *(unsigned char *)(a2 - 48) = 5;
  sub_A2E4((uint64_t)v27, a2 - 40);
  uint64_t v4 = sub_4890(&qword_68CD8);
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4C750();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [self defaultCenter];
  if (qword_66EB8 != -1) {
    swift_once();
  }
  sub_4C760();

  id v26 = [self mainRunLoop];
  uint64_t v14 = sub_4890(&qword_68CE0);
  uint64_t v22 = (uint64_t)&v22;
  __chkstk_darwin(v14 - 8, v15);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_4C7C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  sub_1222C(0, &qword_68CE8);
  sub_4A6C8((unint64_t *)&qword_67640, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  sub_49FAC(&qword_68CF0, &qword_68CE8);
  sub_4BD40();
  sub_4B7C((uint64_t)v17, &qword_68CE0);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  swift_allocObject();
  uint64_t v19 = v25;
  swift_weakInit();
  sub_4C14(&qword_68CF8, &qword_68CD8);
  uint64_t v20 = v24;
  sub_4BD60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v20);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  swift_release();
  sub_78F0((uint64_t)v27);
  return v19;
}

uint64_t sub_48EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_67720);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v33[4] = &off_5FB80;
  v33[0] = a1;
  *(unsigned char *)(a2 + 16) = 31;
  *(void *)(a2 + 64) = &_swiftEmptySetSingleton;
  uint64_t v31 = a2 + 64;
  *(unsigned char *)(a2 + 72) = 0;
  sub_A2E4((uint64_t)v33, a2 + 24);
  sub_4C650();
  uint64_t v8 = sub_4C670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_weakInit();
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = 0;
  v10[3] = 0;
  v10[4] = v9;
  sub_1C9E8((uint64_t)v7, (uint64_t)&unk_68CD0, (uint64_t)v10);
  swift_release();
  sub_4B7C((uint64_t)v7, &qword_67720);
  uint64_t v11 = sub_4890(&qword_68CD8);
  uint64_t v29 = *(void *)(v11 - 8);
  uint64_t v30 = v11;
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_4C750();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = [self defaultCenter];
  if (qword_66EC0 != -1) {
    swift_once();
  }
  sub_4C760();

  id v32 = [self mainRunLoop];
  uint64_t v21 = sub_4890(&qword_68CE0);
  uint64_t v28 = (uint64_t)&v28;
  __chkstk_darwin(v21 - 8, v22);
  uint64_t v24 = (char *)&v28 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_4C7C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
  sub_1222C(0, &qword_68CE8);
  sub_4A6C8((unint64_t *)&qword_67640, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  sub_49FAC(&qword_68CF0, &qword_68CE8);
  sub_4BD40();
  sub_4B7C((uint64_t)v24, &qword_68CE0);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  swift_allocObject();
  swift_weakInit();
  sub_4C14(&qword_68CF8, &qword_68CD8);
  uint64_t v26 = v30;
  sub_4BD60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v26);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  swift_release();
  sub_78F0((uint64_t)v33);
  return a2;
}

uint64_t sub_4941C(uint64_t a1, uint64_t a2)
{
  v27[3] = type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
  v27[4] = &off_5FB80;
  v27[0] = a1;
  *(unsigned char *)(a2 + 16) = 30;
  *(void *)(a2 + 64) = &_swiftEmptySetSingleton;
  uint64_t v25 = a2 + 64;
  sub_A2E4((uint64_t)v27, a2 + 24);
  uint64_t v4 = sub_4890(&qword_68CD8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v23 = v4;
  uint64_t v24 = v5;
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_4C750();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = [self defaultCenter];
  sub_4C760();

  id v26 = [self mainRunLoop];
  uint64_t v15 = sub_4890(&qword_68CE0);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_4C7C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  sub_1222C(0, &qword_68CE8);
  sub_4A6C8((unint64_t *)&qword_67640, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  sub_49FAC(&qword_68CF0, &qword_68CE8);
  sub_4BD40();
  sub_4B7C((uint64_t)v18, &qword_68CE0);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  swift_allocObject();
  swift_weakInit();
  sub_4C14(&qword_68CF8, &qword_68CD8);
  uint64_t v20 = v23;
  sub_4BD60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v20);
  swift_beginAccess();
  sub_4BC80();
  swift_endAccess();
  swift_release();
  sub_78F0((uint64_t)v27);
  return a2;
}

uint64_t sub_49810(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v12[3] = v1;
  v12[4] = &off_5FB80;
  v12[0] = a1;
  type metadata accessor for CriticalMessagesListItemProvider();
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = sub_49C50((uint64_t)v12, v1);
  __chkstk_darwin(v3, v3);
  uint64_t v5 = (void *)((char *)v11 - v4);
  (*(void (**)(char *))(v6 + 16))((char *)v11 - v4);
  uint64_t v7 = *v5;
  v11[3] = v1;
  v11[4] = &off_5FB80;
  v11[0] = v7;
  *(unsigned char *)(v2 + 16) = 12;
  *(void *)(v2 + 24) = 0;
  *(void *)(v2 + 32) = &_swiftEmptySetSingleton;
  sub_A2E4((uint64_t)v11, v2 + 40);
  id v8 = [self numberOfAppsUsingBackgroundMessaging];
  uint64_t v9 = sub_4C690();

  sub_15150(v9);
  sub_78F0((uint64_t)v11);
  sub_78F0((uint64_t)v12);
  return v2;
}

uint64_t sub_49994(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 104 * a1 + 32;
    unint64_t v6 = a3 + 104 * v4;
    if (v5 >= v6 || v5 + 104 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_49A88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 80 * a1 + 32;
    unint64_t v6 = a3 + 80 * v4;
    if (v5 >= v6 || v5 + 80 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_49B80()
{
  return sub_4A718();
}

uint64_t sub_49B98(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_49BEC()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC26PrivacyAndSecuritySettings39PrivacyAndSecuritySettingsListViewModel__communicationSafetySetupHasCompleted) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_49C04(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_49C50(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_49CA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_4890(&qword_68DE8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_49DAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_4890(&qword_68CC0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_49EBC()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_49EF8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_186D4;
  return sub_2789C(a1, v4, v5, v6);
}

uint64_t sub_49FAC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1222C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_49FF0()
{
  return sub_27CDC();
}

uint64_t sub_49FF8()
{
  return sub_281D4();
}

uint64_t sub_4A000()
{
  return sub_26AB8();
}

unint64_t sub_4A008()
{
  unint64_t result = qword_68D00;
  if (!qword_68D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68D00);
  }
  return result;
}

uint64_t sub_4A064()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_4A09C(void *a1)
{
  return sub_12400(a1, *(char **)(v1 + 16));
}

uint64_t sub_4A0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_4A0B4()
{
  return swift_release();
}

void sub_4A0BC(uint64_t a1)
{
  sub_1FD64(a1, v1);
}

uint64_t sub_4A0C4(uint64_t a1)
{
  return sub_1FE8C(a1, v1);
}

uint64_t sub_4A0D0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_4A110(uint64_t *a1)
{
}

uint64_t sub_4A118()
{
  return sub_21784();
}

uint64_t sub_4A120()
{
  *(void *)(*(void *)(v0 + 16) + 48) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

id sub_4A15C(uint64_t a1)
{
  return sub_18828(a1, *(void *)(v1 + 16));
}

uint64_t sub_4A168(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_17D34;
  return sub_15D60(a1, v4, v5, v6);
}

uint64_t sub_4A21C(uint64_t *a1)
{
  return sub_248A0(a1);
}

uint64_t sub_4A228()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_4A278(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_4A288(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_4A298()
{
  return sub_4A614();
}

uint64_t sub_4A2B0()
{
  return sub_4A540();
}

void sub_4A2D0()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_4A2E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_4A3D4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_46DD4(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (void *)&v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_4CA10();
  __break(1u);
  return result;
}

uint64_t sub_4A540()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = v1;
  *(void *)(v2 + 72) = v3;
  sub_4A278(v1);
  return sub_4A288(v4);
}

uint64_t sub_4A58C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_4A5C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_4A5EC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_4A614()
{
  *(void *)(*(void *)(v0 + 16) + 56) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_4A650(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_67D80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_4A6B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_42660(a1, a2);
}

uint64_t sub_4A6C0()
{
  return sub_42B38();
}

uint64_t sub_4A6C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_4A710()
{
  return sub_42E1C();
}

uint64_t sub_4A718()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v2[3];
  v2[3] = v1;
  v2[4] = v3;
  v2[5] = v4;
  sub_49B98(v1);
  return sub_49C04(v5);
}

uint64_t sub_4A770(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_4A7FC()
{
}

void sub_4A814()
{
}

uint64_t sub_4A82C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FindPrivacyAndSecuritySettingsClass()
{
  return self;
}

id sub_4A860()
{
  type metadata accessor for FindPrivacyAndSecuritySettingsClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_6B268 = (uint64_t)result;
  return result;
}

uint64_t sub_4A8B8()
{
  uint64_t v0 = sub_4B970();
  sub_4A954(v0, qword_6B270);
  uint64_t v1 = (void *)sub_7874(v0, (uint64_t)qword_6B270);
  *uint64_t v1 = type metadata accessor for FindPrivacyAndSecuritySettingsClass();
  uint64_t v2 = enum case for LocalizedStringResource.BundleDescription.forClass(_:);
  uint64_t v3 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t *sub_4A954(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_4A9B8(uint64_t a1)
{
  return sub_4AA28(a1, qword_6B288);
}

uint64_t sub_4A9D8(uint64_t a1)
{
  return sub_4AA28(a1, qword_6B2A0);
}

uint64_t sub_4AA04(uint64_t a1)
{
  return sub_4AA28(a1, qword_6B2B8);
}

uint64_t sub_4AA28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4BC10();
  sub_4A954(v3, a2);
  sub_7874(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_4BC00();
}

BOOL static Text.< infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  return sub_4ABA4(a1, a2, a3 & 1, a4, a5, a6, a7 & 1, a8);
}

BOOL sub_4AAC4(uint64_t a1, uint64_t a2)
{
  return sub_4ABA4(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16), *(void *)(a2 + 24));
}

BOOL sub_4AAF0(uint64_t a1, uint64_t a2)
{
  return !sub_4ABA4(*(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16), *(void *)(a2 + 24), *(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)(a1 + 24));
}

BOOL sub_4AB34(uint64_t a1, uint64_t a2)
{
  return !sub_4ABA4(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16), *(void *)(a2 + 24));
}

BOOL sub_4AB7C(uint64_t a1, uint64_t a2)
{
  return sub_4ABA4(*(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16), *(void *)(a2 + 24), *(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)(a1 + 24));
}

BOOL sub_4ABA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v22[1] = a8;
  uint64_t v8 = sub_4BF60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4BF50();
  uint64_t v13 = sub_4C130();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v22[5] = v13;
  v22[6] = v15;
  sub_4BF50();
  uint64_t v17 = sub_4C130();
  uint64_t v19 = v18;
  v16(v12, v8);
  v22[2] = v17;
  v22[3] = v19;
  sub_CD9C();
  uint64_t v20 = sub_4C830();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20 == -1;
}

unint64_t sub_4AD48()
{
  unint64_t result = qword_68EB0;
  if (!qword_68EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_68EB0);
  }
  return result;
}

void *sub_4AD9C()
{
  uint64_t v1 = OBJC_IVAR____TtC26PrivacyAndSecuritySettings26PrivacyAndSecuritySettings____lazy_storage___privacyAndSecuritySettingsListViewModel;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26PrivacyAndSecuritySettings____lazy_storage___privacyAndSecuritySettingsListViewModel))
  {
    uint64_t v2 = *(void **)(v0
                    + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26PrivacyAndSecuritySettings____lazy_storage___privacyAndSecuritySettingsListViewModel);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for PrivacyAndSecuritySettingsListViewModel();
    swift_allocObject();
    uint64_t v2 = sub_417FC();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_4AE18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_4890(&qword_68F10);
  uint64_t v5 = __chkstk_darwin(v3 - 8, v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5, v8);
  uint64_t v10 = &v16[-v9];
  uint64_t v11 = (uint64_t)v1
      + OBJC_IVAR____TtC26PrivacyAndSecuritySettings26PrivacyAndSecuritySettings____lazy_storage___privacyAndSecuritySettingsList;
  swift_beginAccess();
  sub_4B70C(v11, (uint64_t)v10);
  uint64_t v12 = type metadata accessor for PrivacyAndSecuritySettingsList();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1) {
    return sub_39A80((uint64_t)v10, (uint64_t)a1);
  }
  sub_4B774((uint64_t)v10);
  sub_4AD9C();
  id v14 = [v1 navigationItem];
  sub_37284(a1);
  sub_39A18((uint64_t)a1, (uint64_t)v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v13 + 56))(v7, 0, 1, v12);
  swift_beginAccess();
  sub_4B7D4((uint64_t)v7, v11);
  return swift_endAccess();
}

void sub_4AFE8()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = type metadata accessor for PrivacyAndSecuritySettingsList();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (uint64_t *)((char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19.receiver = v1;
  v19.super_class = ObjectType;
  objc_msgSendSuper2(&v19, "viewDidLoad");
  sub_4AE18(v6);
  id v7 = objc_allocWithZone((Class)sub_4890(&qword_68F08));
  uint64_t v8 = (void *)sub_4C040();
  id v9 = [v8 view];
  if (!v9)
  {
    uint64_t v10 = v8;
    goto LABEL_6;
  }
  uint64_t v10 = v9;
  id v11 = [v1 view];
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 addSubview:v10];

    id v13 = [v1 view];
    if (v13)
    {
      id v14 = v13;
      [v13 bounds];
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(v10, "setFrame:", 0.0, 0.0, v16, v18);
      [v10 setAutoresizingMask:18];
      [v1 addChildViewController:v8];
      [v8 didMoveToParentViewController:v1];

LABEL_6:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_4B4F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_4B57C()
{
  return type metadata accessor for PrivacyAndSecuritySettings();
}

uint64_t type metadata accessor for PrivacyAndSecuritySettings()
{
  uint64_t result = qword_68EF0;
  if (!qword_68EF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_4B5D0()
{
  sub_4B66C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_4B66C()
{
  if (!qword_68F00)
  {
    type metadata accessor for PrivacyAndSecuritySettingsList();
    unint64_t v0 = sub_4C7F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_68F00);
    }
  }
}

uint64_t sub_4B6C4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_4B6FC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_4B70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_68F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_4B774(uint64_t a1)
{
  uint64_t v2 = sub_4890(&qword_68F10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_4B7D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4890(&qword_68F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_4B860()
{
  return static FormatStyle<>.units(allowed:width:maximumUnitCount:zeroValueUnits:valueLength:fractionalPart:)();
}

uint64_t sub_4B870()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
}

uint64_t sub_4B880()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
}

uint64_t sub_4B890()
{
  return AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
}

uint64_t sub_4B8A0()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions();
}

uint64_t sub_4B8B0()
{
  return AttributedString.init(markdown:options:baseURL:)();
}

uint64_t sub_4B8C0()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_4B8D0()
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)();
}

uint64_t sub_4B8E0()
{
  return IntegerFormatStyle.init(locale:)();
}

uint64_t sub_4B8F0()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_4B900()
{
  return _BridgedStoredNSError._getEmbeddedNSError()();
}

uint64_t sub_4B910()
{
  return _BridgedStoredNSError.init(_bridgedNSError:)();
}

uint64_t sub_4B920()
{
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t sub_4B930()
{
  return static _BridgedStoredNSError.== infix(_:_:)();
}

uint64_t sub_4B940()
{
  return _BridgedStoredNSError.hash(into:)();
}

uint64_t sub_4B950()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t sub_4B960()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_4B970()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_4B980()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_4B990()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_4B9A0()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_4B9B0()
{
  return URL._bridgeToObjectiveC()();
}

uint64_t sub_4B9C0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_4B9D0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4B9E0()
{
  return URL.init(string:)();
}

uint64_t sub_4B9F0()
{
  return type metadata accessor for URL();
}

uint64_t sub_4BA00()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_4BA10()
{
  return static Locale.current.getter();
}

uint64_t sub_4BA20()
{
  return type metadata accessor for Locale();
}

uint64_t sub_4BA30()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_4BA40()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_4BA50()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_4BA60()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_4BA70()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_4BA80()
{
  return static LockdownModeManager.shared.getter();
}

uint64_t sub_4BA90()
{
  return LockdownModeManager.enabled.getter();
}

uint64_t sub_4BAA0()
{
  return type metadata accessor for LockdownModeManager();
}

uint64_t sub_4BAB0()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_4BAC0()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_4BAD0()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_4BAE0()
{
  return FileRepresentation.init(exportedContentType:shouldAllowToOpenInPlace:exporting:)();
}

uint64_t sub_4BAF0()
{
  return ProxyRepresentation.init(exporting:)();
}

uint64_t sub_4BB00()
{
  return SentTransferredFile.init(_:allowAccessingOriginalFile:)();
}

uint64_t sub_4BB10()
{
  return TransferRepresentation.suggestedFileName(_:)();
}

uint64_t sub_4BB20()
{
  return TupleTransferRepresentation.init(_:)();
}

uint64_t sub_4BB30()
{
  return PreferencesControllerRecipe.controllerRecipeWithPendingURLPayload(_:pendingURLCompletion:)();
}

uint64_t sub_4BB40()
{
  return PreferencesControllerRecipe.init(viewControllerClass:specifier:)();
}

uint64_t sub_4BB50()
{
  return PreferencesControllerRecipe.init(specifier:bundleName:location:viewControllerClassName:)();
}

uint64_t sub_4BB60()
{
  return type metadata accessor for PreferencesControllerRecipe();
}

uint64_t sub_4BB70()
{
  return SettingsAnyViewRecipe.init<A>(content:)();
}

uint64_t sub_4BB80()
{
  return type metadata accessor for SettingsAnyViewRecipe();
}

uint64_t sub_4BB90()
{
  return type metadata accessor for ClearSettingsNavigationPathAction();
}

uint64_t sub_4BBA0()
{
  return AppendSettingsNavigationPathAction.callAsFunction<A>(_:)();
}

uint64_t sub_4BBB0()
{
  return type metadata accessor for AppendSettingsNavigationPathAction();
}

uint64_t sub_4BBC0()
{
  return AsyncIconImage.init<>(icon:descriptor:)();
}

uint64_t sub_4BBD0()
{
  return static UTType.json.getter();
}

uint64_t sub_4BBE0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_4BBF0()
{
  return Logger.logObject.getter();
}

uint64_t sub_4BC00()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_4BC10()
{
  return type metadata accessor for Logger();
}

uint64_t sub_4BC30()
{
  return TransparencyReport.enabled.getter();
}

uint64_t sub_4BC40()
{
  return TransparencyReport.duration.getter();
}

uint64_t sub_4BC50()
{
  return TransparencyReport.duration.setter();
}

uint64_t sub_4BC60()
{
  return TransparencyReport.init()();
}

uint64_t sub_4BC70()
{
  return type metadata accessor for TransparencyReport();
}

uint64_t sub_4BC80()
{
  return AnyCancellable.store(in:)();
}

void sub_4BC90()
{
}

uint64_t sub_4BCA0()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_4BCB0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_4BCC0()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_4BCD0()
{
  return PassthroughSubject.init()();
}

uint64_t sub_4BCE0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_4BCF0()
{
  return Published.projectedValue.getter();
}

uint64_t sub_4BD00()
{
  return static Published.subscript.getter();
}

uint64_t sub_4BD10()
{
  return static Published.subscript.setter();
}

uint64_t sub_4BD20()
{
  return type metadata accessor for Published();
}

uint64_t sub_4BD30()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t sub_4BD40()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_4BD50()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t sub_4BD60()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_4BD70()
{
  return Publisher<>.assign<A>(to:on:)();
}

uint64_t sub_4BD80()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_4BD90()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_4BDA0()
{
  return LabelGroup.init(content:)();
}

uint64_t sub_4BDB0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_4BDC0()
{
  return Environment.init<A>(_:)();
}

uint64_t sub_4BDD0()
{
  return SharePreview<>.init(_:)();
}

uint64_t sub_4BDE0()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t sub_4BDF0()
{
  return OpenURLAction.callAsFunction(_:)();
}

uint64_t sub_4BE00()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_4BE20()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_4BE30()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_4BE40()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_4BE50()
{
  return LabeledContent<>.init(content:label:)();
}

uint64_t sub_4BE60()
{
  return NavigationLink<>.init<A>(value:label:)();
}

uint64_t sub_4BE70()
{
  return type metadata accessor for NavigationLink();
}

uint64_t sub_4BE80()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_4BE90()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_4BEA0()
{
  return static KeyboardShortcut.defaultAction.getter();
}

uint64_t sub_4BEB0()
{
  return type metadata accessor for KeyboardShortcut();
}

uint64_t sub_4BEC0()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_4BED0()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_4BEE0()
{
  return EnvironmentValues.clearSettingsNavigationPath.getter();
}

uint64_t sub_4BEF0()
{
  return EnvironmentValues.appendSettingsNavigationPath.getter();
}

uint64_t sub_4BF00()
{
  return EnvironmentValues.withCurrentHostingController.getter();
}

uint64_t sub_4BF10()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_4BF20()
{
  return EnvironmentValues.openURL.setter();
}

uint64_t sub_4BF30()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_4BF40()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_4BF50()
{
  return EnvironmentValues.init()();
}

uint64_t sub_4BF60()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_4BF70()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_4BF80()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_4BF90()
{
  return type metadata accessor for _UnaryViewAdaptor();
}

uint64_t sub_4BFA0()
{
  return _UnaryViewAdaptor.init(_:)();
}

uint64_t sub_4BFB0()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_4BFC0(Swift::String a1)
{
}

void sub_4BFD0(Swift::String a1)
{
}

uint64_t sub_4BFE0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_4BFF0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_4C000()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_4C010()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_4C020()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_4C030()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_4C040()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_4C050()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_4C060()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_4C070()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_4C080()
{
  return type metadata accessor for LocalCoordinateSpace();
}

uint64_t sub_4C090()
{
  return static PrimitiveButtonStyle<>.navigationLink.getter();
}

uint64_t sub_4C0A0()
{
  return static CoordinateSpaceProtocol<>.local.getter();
}

uint64_t sub_4C0B0()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_4C0C0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_4C0D0()
{
  return WithCurrentHostingControllerAction.callAsFunction(_:)();
}

uint64_t sub_4C0E0()
{
  return type metadata accessor for WithCurrentHostingControllerAction();
}

uint64_t sub_4C0F0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_4C100()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_4C110()
{
  return static Font.caption.getter();
}

uint64_t sub_4C120()
{
  return List<>.init(content:)();
}

uint64_t sub_4C130()
{
  return Text._resolveText(in:)();
}

uint64_t sub_4C140()
{
  return static Text.== infix(_:_:)();
}

uint64_t sub_4C150()
{
  return Text.font(_:)();
}

uint64_t sub_4C160()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_4C170()
{
  return Text.init(_:)();
}

uint64_t sub_4C180()
{
  return Text.init(_:)();
}

uint64_t sub_4C190()
{
  return Text.init<A>(_:)();
}

uint64_t sub_4C1A0()
{
  return View.settingsListAppearance()();
}

uint64_t sub_4C1B0()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_4C1C0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_4C1D0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_4C1E0()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_4C1F0()
{
  return View.environment<A>(_:)();
}

uint64_t sub_4C200()
{
  return View.accessibility(identifier:)();
}

uint64_t sub_4C210()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_4C220()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_4C230()
{
  return View.keyboardShortcut(_:)();
}

uint64_t sub_4C240()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_4C250()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_4C260()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t sub_4C270()
{
  return Image.init(uiImage:)();
}

uint64_t sub_4C280()
{
  return static Image.== infix(_:_:)();
}

uint64_t sub_4C290()
{
  return Label.init(title:icon:)();
}

uint64_t sub_4C2A0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_4C2B0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_4C2C0()
{
  return State.wrappedValue.setter();
}

uint64_t sub_4C2D0()
{
  return State.projectedValue.getter();
}

uint64_t sub_4C2E0()
{
  return Button.init(action:label:)();
}

uint64_t sub_4C2F0()
{
  return Button<>.init(_:role:action:)();
}

uint64_t sub_4C300()
{
  return Button<>.init(_:action:)();
}

uint64_t sub_4C310()
{
  return type metadata accessor for Button();
}

uint64_t sub_4C320()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_4C330()
{
  return Binding.subscript.getter();
}

uint64_t sub_4C340()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_4C350()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_4C360()
{
  return Section<>.init(content:)();
}

uint64_t sub_4C370()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_4C380()
{
  return static Animation.default.getter();
}

uint64_t sub_4C390()
{
  return ShareLink.init<A>(item:subject:message:preview:label:)();
}

uint64_t sub_4C3A0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_4C3B0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_4C3C0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_4C3D0()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t sub_4C3E0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_4C3F0()
{
  return static DispatchTime.now()();
}

uint64_t sub_4C400()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_4C410()
{
  return + infix(_:_:)();
}

uint64_t sub_4C420()
{
  return type metadata accessor for SettingsEventImage();
}

uint64_t sub_4C430()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:graphicIconTypeIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

uint64_t sub_4C440()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_4C450()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4C460()
{
  return Dictionary.description.getter();
}

uint64_t sub_4C470()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_4C480()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_4C490()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_4C4A0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_4C4B0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_4C4C0()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_4C4D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_4C4E0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_4C4F0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_4C500()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4C510()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_4C520()
{
  return String.init(localized:)();
}

uint64_t sub_4C530()
{
  return String.init<A>(describing:)();
}

uint64_t sub_4C540()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_4C550()
{
  return String.utf8CString.getter();
}

uint64_t sub_4C560()
{
  return String.hash(into:)();
}

void sub_4C570(Swift::String a1)
{
}

uint64_t sub_4C580()
{
  return String.init(cString:)();
}

Swift::Int sub_4C590()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_4C5A0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_4C5B0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_4C5C0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_4C5D0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4C5E0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_4C5F0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_4C600()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_4C610()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_4C620()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_4C630()
{
  return static MainActor.shared.getter();
}

uint64_t sub_4C640()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_4C650()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_4C660()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_4C670()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_4C680()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_4C690()
{
  return Int.init(truncating:)();
}

uint64_t sub_4C6A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_4C6B0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_4C6C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_4C6D0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_4C6E0()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_4C6F0()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_4C700()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_4C710()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_4C720()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_4C730()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_4C740()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_4C750()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_4C760()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_4C770()
{
  return static NSBundle.PreferencesPluginLocation.default.getter();
}

uint64_t sub_4C780()
{
  return static NSBundle.PreferencesPluginLocation.privacy.getter();
}

uint64_t sub_4C790()
{
  return type metadata accessor for NSBundle.PreferencesPluginLocation();
}

uint64_t sub_4C7A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_4C7B0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_4C7C0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_4C7D0()
{
  return static NSRunLoop.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t sub_4C7E0()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t sub_4C7F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_4C800()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_4C810()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_4C820()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_4C830()
{
  return StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
}

uint64_t sub_4C840()
{
  return BinaryInteger.formatted<A>(_:)();
}

uint64_t sub_4C850()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_4C860()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_4C870()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_4C880()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_4C890()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int sub_4C8A0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_4C8B0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_4C8C0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_4C8D0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_4C8E0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_4C8F0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_4C900(Swift::Int a1)
{
}

uint64_t sub_4C910()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_4C920()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_4C930()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_4C940()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_4C950()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_4C960()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_4C970()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_4C980()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_4C990()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_4C9A0()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_4C9B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_4C9C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_4C9D0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_4C9E0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_4C9F0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_4CA00()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_4CA10()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_4CA30(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_4CA40()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_4CA50()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_4CA60()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_4CA70()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_4CA80()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_4CA90()
{
  return Error<>._code.getter();
}

uint64_t sub_4CAA0()
{
  return Error<>._domain.getter();
}

uint64_t sub_4CAB0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_4CAC0()
{
  return Error._userInfo.getter();
}

uint64_t sub_4CAD0()
{
  return Hasher.init(_seed:)();
}

void sub_4CAE0(Swift::UInt a1)
{
}

Swift::Int sub_4CAF0()
{
  return Hasher._finalize()();
}

uint64_t sub_4CB00()
{
  return static Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy.hide.getter();
}

uint64_t sub_4CB10()
{
  return type metadata accessor for Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy();
}

uint64_t sub_4CB20()
{
  return static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.hide.getter();
}

uint64_t sub_4CB30()
{
  return type metadata accessor for Duration.UnitsFormatStyle.FractionalPartDisplayStrategy();
}

uint64_t sub_4CB40()
{
  return static Duration.UnitsFormatStyle.Unit.days.getter();
}

uint64_t sub_4CB50()
{
  return static Duration.UnitsFormatStyle.Unit.hours.getter();
}

uint64_t sub_4CB60()
{
  return static Duration.UnitsFormatStyle.Unit.minutes.getter();
}

uint64_t sub_4CB70()
{
  return type metadata accessor for Duration.UnitsFormatStyle.Unit();
}

uint64_t sub_4CB80()
{
  return static Duration.UnitsFormatStyle.UnitWidth.wide.getter();
}

uint64_t sub_4CB90()
{
  return type metadata accessor for Duration.UnitsFormatStyle.UnitWidth();
}

uint64_t sub_4CBA0()
{
  return type metadata accessor for Duration.UnitsFormatStyle();
}

uint64_t sub_4CBB0()
{
  return Duration.formatted<A>(_:)();
}

uint64_t sub_4CBC0()
{
  return Duration.components.getter();
}

uint64_t sub_4CBD0()
{
  return _typeName(_:qualified:)();
}

uint64_t AMFIShouldShowDeveloperModeSettings()
{
  return _AMFIShouldShowDeveloperModeSettings();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PSIsInEDUMode()
{
  return _PSIsInEDUMode();
}

uint64_t PUILocationIsActivePairedDevice()
{
  return _PUILocationIsActivePairedDevice();
}

uint64_t PUILocationIsDisplayNameForWatchApp()
{
  return _PUILocationIsDisplayNameForWatchApp();
}

uint64_t PUILocationIsWatchBundleIDForBundleID()
{
  return _PUILocationIsWatchBundleIDForBundleID();
}

uint64_t SRAuthorizationFetchSnapshot()
{
  return _SRAuthorizationFetchSnapshot();
}

uint64_t SRIsDataCollectionEnabled()
{
  return _SRIsDataCollectionEnabled();
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

uint64_t os_eligibility_get_domain_answer()
{
  return _os_eligibility_get_domain_answer();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastTypeToObjCProtocolUnconditional()
{
  return _swift_dynamicCastTypeToObjCProtocolUnconditional();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return _tcc_authorization_record_get_authorization_right();
}

uint64_t tcc_authorization_record_get_service()
{
  return _tcc_authorization_record_get_service();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return _tcc_authorization_record_get_subject_identity();
}

uint64_t tcc_identity_get_identifier()
{
  return _tcc_identity_get_identifier();
}

uint64_t tcc_message_options_create()
{
  return _tcc_message_options_create();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return _tcc_message_options_set_reply_handler_policy();
}

uint64_t tcc_server_create()
{
  return _tcc_server_create();
}

uint64_t tcc_server_message_get_authorization_records_by_services()
{
  return _tcc_server_message_get_authorization_records_by_services();
}

uint64_t tcc_service_get_name()
{
  return _tcc_service_get_name();
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}