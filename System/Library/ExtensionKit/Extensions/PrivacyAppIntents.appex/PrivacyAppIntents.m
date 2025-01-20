uint64_t sub_1000027B4(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100002964();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

void __swiftcall DELETE_ME_AFTER_123714910.init()()
{
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000028BC()
{
  unint64_t result = qword_100010058;
  if (!qword_100010058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010058);
  }
  return result;
}

uint64_t sub_100002914()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100002964()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

ValueMetadata *type metadata accessor for DELETE_ME_AFTER_123714910()
{
  return &type metadata for DELETE_ME_AFTER_123714910;
}

ValueMetadata *type metadata accessor for PrivacyAppIntentsExtension()
{
  return &type metadata for PrivacyAppIntentsExtension;
}

id sub_1000029D8(char a1)
{
  uint64_t v1 = 1;
  switch(a1)
  {
    case 24:
      id v3 = (id)MobileGestalt_get_current_device();
      if (!v3) {
        goto LABEL_12;
      }
      goto LABEL_16;
    case 26:
    case 29:
      goto LABEL_13;
    case 27:
      id v15 = [self currentDevice];
      id deviceProximityCapability = objc_msgSend(v15, "sf_inRetailKioskMode");
      goto LABEL_24;
    case 28:
      id v3 = (id)MobileGestalt_get_current_device();
      if (v3) {
        goto LABEL_16;
      }
LABEL_12:
      __break(1u);
LABEL_13:
      id v13 = [self currentDevice];
      unsigned int iPadCapability = objc_msgSend(v13, "sf_inRetailKioskMode");
      goto LABEL_20;
    case 30:
      id v3 = (id)MobileGestalt_get_current_device();
      if (!v3)
      {
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
        JUMPOUT(0x100002D10);
      }
LABEL_16:
      id v13 = v3;
      unsigned int iPadCapability = MobileGestalt_get_iPadCapability();
LABEL_20:
      unsigned int v18 = iPadCapability;

      return (id)(v18 ^ 1);
    case 31:
      return (id)AMFIShouldShowDeveloperModeSettings();
    case 32:
      id v17 = [self sharedManager];
      if (!v17) {
        goto LABEL_35;
      }
      id v13 = v17;
      unsigned int iPadCapability = [v17 isSharedIPad];
      goto LABEL_20;
    case 33:
      id v19 = [self currentDevice];
      unsigned __int8 v20 = objc_msgSend(v19, "sf_inRetailKioskMode");

      if (v20) {
        return 0;
      }
      id v21 = (id)MobileGestalt_get_current_device();
      if (!v21) {
        goto LABEL_37;
      }
      id v15 = v21;
      id deviceProximityCapability = (id)MobileGestalt_get_deviceProximityCapability();
LABEL_24:
      uint64_t v1 = (uint64_t)deviceProximityCapability;

      return (id)v1;
    case 34:
      return [self shouldShowDataAndSensors];
    case 35:
      id v4 = [self currentDevice];
      unsigned __int8 v5 = objc_msgSend(v4, "sf_inRetailKioskMode");

      if (v5) {
        return 0;
      }
      id v6 = (id)MobileGestalt_get_current_device();
      if (!v6) {
        goto LABEL_36;
      }
      v7 = v6;
      char v8 = MobileGestalt_get_iPadCapability();

      if (v8) {
        return 0;
      }
      id v9 = (id)MobileGestalt_get_current_device();
      if (!v9) {
        goto LABEL_39;
      }
      v10 = v9;
      char isSimulator = MobileGestalt_get_isSimulator();

      if (isSimulator) {
        return 0;
      }
      return [self isContactlessTCCServiceEligible];
    case 36:
      id v22 = [self currentDevice];
      unsigned __int8 v23 = objc_msgSend(v22, "sf_inRetailKioskMode");

      if (v23) {
        return 0;
      }
      id v24 = (id)MobileGestalt_get_current_device();
      if (!v24) {
        goto LABEL_38;
      }
      v25 = v24;
      char v26 = MobileGestalt_get_iPadCapability();

      if (v26) {
        return 0;
      }
      id v27 = (id)MobileGestalt_get_current_device();
      if (!v27) {
        goto LABEL_40;
      }
      v28 = v27;
      char v29 = MobileGestalt_get_isSimulator();

      if (v29) {
        return 0;
      }
      return [self isSecureElementTCCServiceEligible];
    default:
      return (id)v1;
  }
}

unint64_t sub_100002DA4(char a1)
{
  unint64_t result = 0x746F6F7223;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4152545F52455355;
      break;
    case 2:
      unint64_t result = 0x53544341544E4F43;
      break;
    case 3:
      unint64_t result = 0x5241444E454C4143;
      break;
    case 4:
      unint64_t result = 0x5245444E494D4552;
      break;
    case 5:
      unint64_t result = 0x534F544F4850;
      break;
    case 6:
      unint64_t result = 0x524F535345434341;
      break;
    case 7:
      unint64_t result = 0x50495245505F5442;
      break;
    case 8:
      unint64_t result = 0x4F48504F5243494DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0x4152454D4143;
      break;
    case 11:
      unint64_t result = 0x574F4C4C4957;
      break;
    case 12:
      unint64_t result = 0x42494C414944454DLL;
      break;
    case 13:
      unint64_t result = 0x45434341454C4946;
      break;
    case 14:
      unint64_t result = 0xD000000000000011;
      break;
    case 15:
      unint64_t result = 0x5349545245564441;
      break;
    case 16:
      unint64_t result = 0x5F59434156495250;
      break;
    case 17:
      unint64_t result = 0x4E4F495441434F4CLL;
      break;
    case 18:
      unint64_t result = 0xD000000000000018;
      break;
    case 19:
      unint64_t result = 0xD000000000000018;
      break;
    case 20:
      unint64_t result = 0xD000000000000019;
      break;
    case 21:
      unint64_t result = 0x454E5F4C41434F4CLL;
      break;
    case 22:
      unint64_t result = 0x54454C4C4157;
      break;
    case 23:
      unint64_t result = 0x5355434F46;
      break;
    case 24:
      unint64_t result = 0x435F595445464153;
      break;
    case 25:
    case 34:
      unint64_t result = 0xD000000000000010;
      break;
    case 26:
      unint64_t result = 0x48544C414548;
      break;
    case 27:
      unint64_t result = 0x445F48544C414548;
      break;
    case 28:
      unint64_t result = 0x43414E414D4C41;
      break;
    case 29:
      unint64_t result = 0x5359454B53534150;
      break;
    case 30:
      unint64_t result = 0xD000000000000016;
      break;
    case 31:
      unint64_t result = 0xD000000000000017;
      break;
    case 32:
      unint64_t result = 0x4E574F444B434F4CLL;
      break;
    case 33:
      unint64_t result = 0xD000000000000013;
      break;
    case 35:
      unint64_t result = 0x4C544341544E4F43;
      break;
    case 36:
      unint64_t result = 0x455F455255434553;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100003244(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100002DA4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100002DA4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_1000088C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_1000032D4()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

Swift::Int sub_100003328()
{
  char v1 = *v0;
  sub_1000088E0();
  sub_100002DA4(v1);
  sub_1000088A0();
  swift_bridgeObjectRelease();
  return sub_1000088F0();
}

uint64_t sub_10000338C()
{
  sub_100002DA4(*v0);
  sub_1000088A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000033E0()
{
  char v1 = *v0;
  sub_1000088E0();
  sub_100002DA4(v1);
  sub_1000088A0();
  swift_bridgeObjectRelease();
  return sub_1000088F0();
}

uint64_t sub_100003440@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100007D2C();
  *a1 = result;
  return result;
}

unint64_t sub_100003470@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100002DA4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000349C()
{
  return sub_1000076A4(&qword_100010080, &qword_100010088);
}

uint64_t sub_1000034D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100003520(void *a1@<X8>)
{
  *a1 = &off_10000CB78;
}

unint64_t sub_100003530()
{
  return sub_100002DA4(*v0);
}

uint64_t sub_100003538@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100007D2C();
  *a1 = result;
  return result;
}

unint64_t sub_100003584()
{
  unint64_t result = qword_100010090;
  if (!qword_100010090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010090);
  }
  return result;
}

unint64_t sub_1000035DC()
{
  unint64_t result = qword_100010098;
  if (!qword_100010098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010098);
  }
  return result;
}

uint64_t sub_100003630()
{
  uint64_t v0 = sub_100008880();
  sub_100007A48(v0, qword_100011110);
  sub_100007A10(v0, (uint64_t)qword_100011110);
  return sub_100008870();
}

uint64_t sub_100003694@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100008730();
  *a1 = v3;
  return result;
}

uint64_t sub_1000036D0()
{
  return sub_100008740();
}

void (*sub_100003708(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100008720();
  return sub_100003764;
}

void sub_100003764(void *a1)
{
  char v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_1000037B4()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

unint64_t sub_10000380C()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

uint64_t sub_100003860(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000085F4();
  unint64_t v5 = sub_100007AAC();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000038CC()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

unint64_t sub_100003924()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }
  return result;
}

uint64_t sub_100003978()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000039C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000075C4(&qword_100010038, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100011110, a1);
}

uint64_t sub_100003A00()
{
  return 0;
}

uint64_t sub_100003A0C()
{
  return 1;
}

uint64_t sub_100003A1C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000085F4();
  unint64_t v7 = sub_100008648();
  unint64_t v8 = sub_100007AAC();
  *unint64_t v5 = v2;
  v5[1] = sub_100003AF0;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100003AF0()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100003BF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007D80();
  *a1 = result;
  return result;
}

uint64_t sub_100003C20(uint64_t a1)
{
  unint64_t v2 = sub_1000037B4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100003C60()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100C8);
  }
  return result;
}

unint64_t sub_100003CB8()
{
  unint64_t result = qword_1000100D0;
  if (!qword_1000100D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D0);
  }
  return result;
}

unint64_t sub_100003D10()
{
  unint64_t result = qword_1000100D8[0];
  if (!qword_1000100D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000100D8);
  }
  return result;
}

uint64_t sub_100003D64()
{
  uint64_t v0 = sub_1000079CC(&qword_100010198);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008880();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100008850();
  sub_100007A48(v5, qword_100011128);
  sub_100007A10(v5, (uint64_t)qword_100011128);
  sub_100008870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100008840();
}

uint64_t sub_100003ED0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000079CC(&qword_100010190);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000079CC(&qword_100010198);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100008880();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  __chkstk_darwin(v12);
  switch(a1)
  {
    case 1:
    case 7:
    case 12:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v14 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 0, 1, v14);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C70;
      sub_100008870();
      sub_100008870();
      goto LABEL_11;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 17:
    case 18:
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v19 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 0, 1, v19);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C20;
      sub_100008870();
      goto LABEL_11;
    case 13:
    case 25:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v20 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 0, 1, v20);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C10;
      sub_100008870();
      sub_100008870();
      sub_100008870();
      goto LABEL_11;
    case 14:
      uint64_t v24 = a2;
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v15 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 0, 1, v15);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C60;
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      goto LABEL_7;
    case 15:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v16 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 0, 1, v16);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C50;
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      goto LABEL_11;
    case 16:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v17 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 0, 1, v17);
      sub_1000079CC(&qword_1000101A0);
      uint64_t v24 = a2;
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C40;
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
LABEL_7:
      sub_100008870();
      break;
    case 20:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v18 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 0, 1, v18);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C30;
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      sub_100008870();
      break;
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
      sub_100008870();
      sub_100008870();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100008760();
      uint64_t v21 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v6, 0, 1, v21);
      sub_100008870();
      break;
    default:
      sub_100008870();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      sub_100008760();
      uint64_t v13 = sub_100008770();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
      sub_1000079CC(&qword_1000101A0);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C70;
      sub_100008870();
      sub_100008870();
LABEL_11:
      sub_100008870();
      break;
  }
  return sub_100008780();
}

uint64_t sub_100006750(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_1000101E8 + dword_1000101E8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000067F8;
  return v5(a1);
}

uint64_t sub_1000067F8(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_1000068F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101E0 + dword_1000101E0);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_10000869C;
  return v4();
}

unint64_t sub_1000069A0()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

uint64_t sub_1000069F4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101D0 + dword_1000101D0);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100006A98;
  return v4();
}

uint64_t sub_100006A98(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_100006BB0()
{
  unint64_t result = qword_100010100;
  if (!qword_100010100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010100);
  }
  return result;
}

unint64_t sub_100006C08()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

unint64_t sub_100006C60()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    sub_1000034D8(qword_100010118);
    sub_100006C08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

uint64_t sub_100006CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000069A0();
  *uint64_t v5 = v2;
  v5[1] = sub_100006D88;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100006D88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006E7C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101C0 + dword_1000101C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100006F20;
  return v4();
}

uint64_t sub_100006F20(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_10000703C()
{
  unint64_t result = qword_100010130;
  if (!qword_100010130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010130);
  }
  return result;
}

uint64_t sub_100007090()
{
  uint64_t v0 = sub_1000079CC(&qword_1000101B0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000079CC(&qword_1000101B8);
  __chkstk_darwin(v4);
  sub_100003D10();
  sub_100008820();
  v7._object = (void *)0x800000010000AF90;
  v7._countAndFlagsBits = 0xD00000000000003CLL;
  sub_100008810(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100008800();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100008810(v8);
  return sub_100008830();
}

uint64_t sub_10000724C()
{
  uint64_t v0 = qword_100010068;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100007288()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

unint64_t sub_1000072E0()
{
  unint64_t result = qword_100010140;
  if (!qword_100010140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010140);
  }
  return result;
}

unint64_t sub_100007338()
{
  unint64_t result = qword_100010148;
  if (!qword_100010148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010148);
  }
  return result;
}

uint64_t sub_10000738C()
{
  sub_100007AAC();
  uint64_t v2 = sub_1000087C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007B00(v3, v0, v2, v1);
}

unint64_t sub_100007424()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

unint64_t sub_10000747C()
{
  unint64_t result = qword_100010160;
  if (!qword_100010160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010160);
  }
  return result;
}

unint64_t sub_1000074D4()
{
  unint64_t result = qword_100010168;
  if (!qword_100010168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010168);
  }
  return result;
}

unint64_t sub_10000752C()
{
  unint64_t result = qword_100010170;
  if (!qword_100010170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010170);
  }
  return result;
}

void sub_100007580(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000758C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000075C4(&qword_100010040, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100011128, a1);
}

uint64_t sub_1000075C4@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100007A10(v7, a3);
  id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100007668()
{
  return sub_1000076A4(&qword_100010178, &qword_100010180);
}

uint64_t sub_1000076A4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000034D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000076E8(uint64_t a1)
{
  unint64_t v2 = sub_100003D10();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007738()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

uint64_t sub_10000778C@<X0>(uint64_t a1@<X8>)
{
  return sub_100003ED0(*v1, a1);
}

uint64_t sub_100007794(uint64_t a1)
{
  unint64_t v2 = sub_1000074D4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsDeepLink.AvailableLinksQuery()
{
  return &type metadata for PrivacyAndSecuritySettingsDeepLink.AvailableLinksQuery;
}

unsigned char *initializeBufferWithCopyOfBuffer for PrivacyAndSecuritySettingsDestination(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsDeepLink()
{
  return &type metadata for PrivacyAndSecuritySettingsDeepLink;
}

ValueMetadata *type metadata accessor for OpenPrivacyAndSecuritySettingsDeepLink()
{
  return &type metadata for OpenPrivacyAndSecuritySettingsDeepLink;
}

uint64_t _s17PrivacyAppIntents37PrivacyAndSecuritySettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDC) {
    goto LABEL_17;
  }
  if (a2 + 36 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 36) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 36;
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
      return (*a1 | (v4 << 8)) - 36;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 36;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x25;
  int v8 = v6 - 37;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s17PrivacyAppIntents37PrivacyAndSecuritySettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 36 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 36) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDB)
  {
    unsigned int v6 = ((a2 - 220) >> 8) + 1;
    *unint64_t result = a2 + 36;
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
        JUMPOUT(0x100007984);
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
          *unint64_t result = a2 + 36;
        break;
    }
  }
  return result;
}

uint64_t sub_1000079AC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000079B4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrivacyAndSecuritySettingsDestination()
{
  return &type metadata for PrivacyAndSecuritySettingsDestination;
}

uint64_t sub_1000079CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007A10(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100007A48(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100007AAC()
{
  unint64_t result = qword_1000101A8;
  if (!qword_1000101A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101A8);
  }
  return result;
}

uint64_t sub_100007B00(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

char *sub_100007B14(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100007B54(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100007B34(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100007C40(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100007B54(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000079CC(&qword_1000101D8);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_100007C40(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000079CC(&qword_1000101C8);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_100007D2C()
{
  unint64_t v0 = sub_1000088D0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x25) {
    return 37;
  }
  else {
    return v0;
  }
}

uint64_t sub_100007D80()
{
  uint64_t v16 = sub_1000087B0();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000079CC(&qword_1000101F0);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_1000079CC(&qword_100010198);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100008880();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_1000079CC(&qword_1000101F8);
  sub_100008870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 37;
  uint64_t v13 = sub_100008710();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100003D10();
  return sub_100008750();
}

uint64_t sub_100008068()
{
  return _swift_task_switch(sub_100008084, 0, 0);
}

uint64_t sub_100008084()
{
  uint64_t v1 = 37;
  sub_100007B14(0, 37, 0);
  int v2 = &_swiftEmptyArrayStorage;
  unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  uint64_t v4 = &byte_10000CB98;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_100007B14((char *)(v7 > 1), v3 + 1, 1);
      int v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100008188(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000081A8, 0, 0);
}

uint64_t sub_1000081A8()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000082F4(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    sub_100007B14(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100007B14((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_1000082F4(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 32;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
    if (v4 == v1) {
      break;
    }
    char v5 = *(unsigned char *)(v3 + v1++);
    unint64_t result = (uint64_t)sub_1000029D8(v5);
    if (result)
    {
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        unint64_t result = (uint64_t)sub_100007B34(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v7 >= v6 >> 1) {
        unint64_t result = (uint64_t)sub_100007B34((char *)(v6 > 1), v7 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v7 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v7 + 32) = v5;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000083EC()
{
  return _swift_task_switch(sub_100008408, 0, 0);
}

uint64_t sub_100008408()
{
  uint64_t v1 = sub_1000082F4((uint64_t)&off_10000CB78);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_100007B14(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *(unsigned char *)(v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_100007B14((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  unint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

uint64_t sub_100008548()
{
  return _swift_task_switch(sub_100008564, 0, 0);
}

uint64_t sub_100008564()
{
  uint64_t v1 = sub_1000082F4((uint64_t)&off_10000CB78);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 37;
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

unint64_t sub_1000085F4()
{
  unint64_t result = qword_100010200;
  if (!qword_100010200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010200);
  }
  return result;
}

unint64_t sub_100008648()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010208);
  }
  return result;
}

uint64_t sub_1000086B0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000086C0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_1000086D0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100008710()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100008720()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100008730()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100008740()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100008750()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100008760()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100008770()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100008780()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100008790()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000087A0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000087B0()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000087C0()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000087F0()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100008800()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100008810(Swift::String a1)
{
}

uint64_t sub_100008820()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100008830()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100008840()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100008850()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100008870()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100008880()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100008890()
{
  return static AppExtension.main()();
}

uint64_t sub_1000088A0()
{
  return String.hash(into:)();
}

uint64_t sub_1000088B0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000088C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000088D0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1000088E0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000088F0()
{
  return Hasher._finalize()();
}

uint64_t AMFIShouldShowDeveloperModeSettings()
{
  return _AMFIShouldShowDeveloperModeSettings();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_deviceProximityCapability()
{
  return _MobileGestalt_get_deviceProximityCapability();
}

uint64_t MobileGestalt_get_iPadCapability()
{
  return _MobileGestalt_get_iPadCapability();
}

uint64_t MobileGestalt_get_isSimulator()
{
  return _MobileGestalt_get_isSimulator();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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