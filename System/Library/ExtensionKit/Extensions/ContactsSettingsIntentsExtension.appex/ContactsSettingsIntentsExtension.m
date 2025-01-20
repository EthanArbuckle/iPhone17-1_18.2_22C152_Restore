uint64_t sub_10000424C(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_1000043A0();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000042F8()
{
  unint64_t result = qword_100010050;
  if (!qword_100010050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010050);
  }
  return result;
}

uint64_t sub_100004350()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000043A0()
{
  unint64_t result = qword_100010058;
  if (!qword_100010058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010058);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactsSettingsIntentsExtensionExtension()
{
  return &type metadata for ContactsSettingsIntentsExtensionExtension;
}

uint64_t sub_100004404()
{
  uint64_t v0 = sub_100009F20();
  sub_100004484(v0, qword_100011070);
  sub_1000044E8(v0, (uint64_t)qword_100011070);
  return sub_100009F10();
}

uint64_t *sub_100004484(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000044E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_100004520()
{
  qword_100011088 = 0x614E6E6F73726550;
  unk_100011090 = 0xEF726564724F656DLL;
}

void sub_100004550()
{
  qword_100011098 = 0x68536E6F73726550;
  unk_1000110A0 = 0xEF656D614E74726FLL;
}

void sub_100004580()
{
  qword_1000110A8 = 0x64726143654DLL;
  unk_1000110B0 = 0xE600000000000000;
}

void sub_1000045A0()
{
  qword_1000110B8 = 0x43746C7561666544;
  unk_1000110C0 = 0xEF73746361746E6FLL;
}

unint64_t sub_1000045D0(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x614E6E6F73726550;
      break;
    case 3:
      unint64_t result = 0x68536E6F73726550;
      break;
    case 4:
      unint64_t result = 0x64726143654DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x43746C7561666544;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000046E4(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x614E6E6F73726550;
      break;
    case 3:
      unint64_t result = 0x68536E6F73726550;
      break;
    case 4:
      unint64_t result = 0x64726143654DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x43746C7561666544;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000047F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000485C(*a1, *a2);
}

unint64_t sub_100004808()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

uint64_t sub_10000485C(unint64_t a1, unsigned __int8 a2)
{
  a1 = a1;
  unint64_t v2 = 0xE000000000000000;
  switch((char)a1)
  {
    case 1:
      uint64_t v3 = "ContactsSortOrder";
      goto LABEL_9;
    case 2:
      a1 = 0x614E6E6F73726550;
      unint64_t v2 = 0xEF726564724F656DLL;
      break;
    case 3:
      a1 = 0x68536E6F73726550;
      unint64_t v2 = 0xEF656D614E74726FLL;
      break;
    case 4:
      unint64_t v2 = 0xE600000000000000;
      a1 = 0x64726143654DLL;
      break;
    case 5:
      a1 = 0xD000000000000012;
      unint64_t v2 = 0x800000010000A2F0;
      break;
    case 6:
      a1 = 0x43746C7561666544;
      unint64_t v2 = 0xEF73746361746E6FLL;
      break;
    case 7:
      uint64_t v3 = "ImportSimContacts";
LABEL_9:
      unint64_t v2 = (unint64_t)(v3 - 32) | 0x8000000000000000;
      a1 = 0xD000000000000011;
      break;
    default:
      break;
  }
  unint64_t v4 = a2;
  unint64_t v5 = 0xE000000000000000;
  switch(a2)
  {
    case 1u:
      v6 = "ContactsSortOrder";
      goto LABEL_18;
    case 2u:
      unint64_t v4 = 0x614E6E6F73726550;
      unint64_t v5 = 0xEF726564724F656DLL;
      break;
    case 3u:
      unint64_t v4 = 0x68536E6F73726550;
      unint64_t v5 = 0xEF656D614E74726FLL;
      break;
    case 4u:
      unint64_t v5 = 0xE600000000000000;
      unint64_t v4 = 0x64726143654DLL;
      break;
    case 5u:
      unint64_t v4 = 0xD000000000000012;
      unint64_t v5 = 0x800000010000A2F0;
      break;
    case 6u:
      unint64_t v4 = 0x43746C7561666544;
      unint64_t v5 = 0xEF73746361746E6FLL;
      break;
    case 7u:
      v6 = "ImportSimContacts";
LABEL_18:
      unint64_t v5 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v4 = 0xD000000000000011;
      break;
    default:
      break;
  }
  if (a1 == v4 && v2 == v5) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10000A010();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_100004AE4()
{
  return sub_100004C48();
}

uint64_t sub_100004AF0()
{
  return sub_100004AF8();
}

uint64_t sub_100004AF8()
{
  sub_100009F50();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004C40()
{
  return sub_100004C48();
}

Swift::Int sub_100004C48()
{
  return sub_10000A040();
}

uint64_t sub_100004DA4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000090F4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100004DD4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000046E4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004E00()
{
  return sub_100007684(&qword_100010068, &qword_100010070);
}

uint64_t sub_100004E3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100004E84(void *a1@<X8>)
{
  *a1 = &off_10000C948;
}

unint64_t sub_100004E94()
{
  return sub_1000045D0(*v0);
}

uint64_t sub_100004E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100008E08(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_100004EC8()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010078);
  }
  return result;
}

unint64_t sub_100004F20()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010080);
  }
  return result;
}

unint64_t sub_100004F78()
{
  unint64_t result = qword_100010088[0];
  if (!qword_100010088[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010088);
  }
  return result;
}

uint64_t sub_100004FCC()
{
  uint64_t v0 = sub_100009EA0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009EE0();
  __chkstk_darwin();
  sub_100009F40();
  __chkstk_darwin();
  uint64_t v4 = sub_100009EB0();
  sub_100004484(v4, qword_1000110C8);
  sub_1000044E8(v4, (uint64_t)qword_1000110C8);
  sub_100009F30();
  sub_100009ED0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100009EC0();
}

uint64_t sub_1000051AC()
{
  uint64_t v0 = sub_100009DA0();
  sub_100004484(v0, qword_1000110E0);
  sub_1000044E8(v0, (uint64_t)qword_1000110E0);
  return sub_100009D90();
}

uint64_t sub_100005210@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v92 = a2;
  sub_100009A8C(&qword_1000101A0);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v85 = (char *)v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  v88 = (char *)v83 - v6;
  __chkstk_darwin(v5);
  v84 = (char *)v83 - v7;
  uint64_t v8 = sub_100009EB0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v89 = v8;
  uint64_t v90 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v83[3] = (char *)v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  v86 = (char *)v83 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v83[1] = (char *)v83 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v83[4] = (char *)v83 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v20 = __chkstk_darwin(v19);
  v91 = (char *)v83 - v21;
  __chkstk_darwin(v20);
  v83[2] = (char *)v83 - v22;
  uint64_t v23 = sub_100009A8C(&qword_100010178);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  v26 = (char *)v83 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v24);
  v87 = (char *)v83 - v28;
  __chkstk_darwin(v27);
  v30 = (char *)v83 - v29;
  uint64_t v31 = sub_100009EA0();
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  v34 = (char *)v83 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100009EE0();
  __chkstk_darwin(v35 - 8);
  uint64_t v36 = sub_100009F40();
  __chkstk_darwin(v36 - 8);
  switch(a1)
  {
    case 1:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v43 = v89;
      uint64_t v44 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v45 = v90;
      v46 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v44, v43);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v46, 0, 1, v43);
      if (qword_100010040 != -1) {
        goto LABEL_39;
      }
      goto LABEL_29;
    case 2:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v47 = v89;
      uint64_t v48 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v49 = v90;
      v50 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v48, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v50, 0, 1, v47);
      if (qword_100010040 == -1) {
        goto LABEL_29;
      }
      goto LABEL_39;
    case 3:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v51 = v89;
      uint64_t v52 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v53 = v90;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v26, v52, v51);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v26, 0, 1, v51);
      if (qword_100010040 != -1) {
        swift_once();
      }
      uint64_t v54 = sub_100009DA0();
      uint64_t v55 = sub_1000044E8(v54, (uint64_t)qword_1000110E0);
      uint64_t v56 = *(void *)(v54 - 8);
      v57 = v85;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v85, v55, v54);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v56 + 56))(v57, 0, 1, v54);
      sub_100009A8C(&qword_1000101A8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000B040;
      sub_100009E90();
      sub_100009E90();
      sub_100009E90();
      sub_100009E90();
      sub_100009E90();
      return sub_100009DB0();
    case 4:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v58 = v89;
      uint64_t v59 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v60 = v90;
      v61 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v59, v58);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v61, 0, 1, v58);
      if (qword_100010040 == -1) {
        goto LABEL_29;
      }
      goto LABEL_39;
    case 5:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v62 = v89;
      uint64_t v63 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v64 = v90;
      v65 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v63, v62);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v64 + 56))(v65, 0, 1, v62);
      if (qword_100010040 == -1) {
        goto LABEL_33;
      }
      goto LABEL_40;
    case 6:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v66 = v89;
      uint64_t v67 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v68 = v90;
      v69 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v67, v66);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v69, 0, 1, v66);
      if (qword_100010040 == -1) {
        goto LABEL_29;
      }
LABEL_39:
      swift_once();
LABEL_29:
      uint64_t v70 = sub_100009DA0();
      uint64_t v71 = sub_1000044E8(v70, (uint64_t)qword_1000110E0);
      uint64_t v72 = *(void *)(v70 - 8);
      v73 = v88;
      (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v88, v71, v70);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v73, 0, 1, v70);
      sub_100009E90();
      break;
    case 7:
      sub_100009F30();
      sub_100009ED0();
      (*(void (**)(char *, void, uint64_t))(v32 + 104))(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      if (qword_100010038 != -1) {
        swift_once();
      }
      uint64_t v74 = v89;
      uint64_t v75 = sub_1000044E8(v89, (uint64_t)qword_1000110C8);
      uint64_t v76 = v90;
      v77 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v87, v75, v74);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v76 + 56))(v77, 0, 1, v74);
      if (qword_100010040 != -1) {
LABEL_40:
      }
        swift_once();
LABEL_33:
      uint64_t v78 = sub_100009DA0();
      uint64_t v79 = sub_1000044E8(v78, (uint64_t)qword_1000110E0);
      uint64_t v80 = *(void *)(v78 - 8);
      v81 = v88;
      (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v88, v79, v78);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v80 + 56))(v81, 0, 1, v78);
      sub_100009E90();
      break;
    default:
      sub_100009F30();
      sub_100009ED0();
      uint64_t v37 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v38 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 104);
      v38(v34, enum case for LocalizedStringResource.BundleDescription.main(_:), v31);
      sub_100009EC0();
      sub_100009F30();
      sub_100009ED0();
      v38(v34, v37, v31);
      sub_100009EC0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v90 + 56))(v30, 0, 1, v89);
      if (qword_100010040 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_100009DA0();
      uint64_t v40 = sub_1000044E8(v39, (uint64_t)qword_1000110E0);
      uint64_t v41 = *(void *)(v39 - 8);
      v42 = v84;
      (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v84, v40, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v42, 0, 1, v39);
      sub_100009A8C(&qword_1000101A8);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10000B050;
      sub_100009E90();
      sub_100009E90();
      sub_100009E90();
      sub_100009E90();
      break;
  }
  return sub_100009DB0();
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
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101C8 + dword_1000101C8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000699C;
  return v4();
}

uint64_t sub_10000699C(uint64_t a1)
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

unint64_t sub_100006AB0()
{
  unint64_t result = qword_1000100A0;
  if (!qword_1000100A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A0);
  }
  return result;
}

unint64_t sub_100006B08()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }
  return result;
}

unint64_t sub_100006B60()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    sub_100004E3C(qword_1000100B8);
    sub_100006B08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }
  return result;
}

uint64_t sub_100006BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007258();
  *uint64_t v5 = v2;
  v5[1] = sub_100006C88;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100006C88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006D7C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000101C0 + dword_1000101C0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100006E20;
  return v4();
}

uint64_t sub_100006E20(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_100006F3C()
{
  unint64_t result = qword_1000100D0;
  if (!qword_1000100D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D0);
  }
  return result;
}

uint64_t sub_100006F90()
{
  uint64_t v0 = sub_100009A8C(&qword_1000101B0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009A8C(&qword_1000101B8);
  __chkstk_darwin();
  sub_100004F78();
  sub_100009E20();
  v6._object = (void *)0x800000010000A9E0;
  v6._countAndFlagsBits = 0xD00000000000001BLL;
  sub_100009E10(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100009E00();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  sub_100009E10(v7);
  return sub_100009E30();
}

unint64_t sub_100007150()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }
  return result;
}

unint64_t sub_1000071A8()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }
  return result;
}

unint64_t sub_100007200()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }
  return result;
}

unint64_t sub_100007258()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }
  return result;
}

unint64_t sub_1000072B0()
{
  unint64_t result = qword_1000100F8;
  if (!qword_1000100F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000100F8);
  }
  return result;
}

uint64_t sub_100007304()
{
  sub_100009B78();
  uint64_t v2 = sub_100009DD0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009BCC(v3, v0, v2, v1);
}

unint64_t sub_10000739C()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010108);
  }
  return result;
}

unint64_t sub_1000073F4()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010110);
  }
  return result;
}

unint64_t sub_10000744C()
{
  unint64_t result = qword_100010118;
  if (!qword_100010118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010118);
  }
  return result;
}

unint64_t sub_1000074A4()
{
  unint64_t result = qword_100010120;
  if (!qword_100010120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010120);
  }
  return result;
}

void sub_1000074F8(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100007504()
{
  sub_100009A8C(&qword_100010178);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v5 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100009EB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  sub_100009E90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100009E60();
}

uint64_t sub_100007648()
{
  return sub_100007684(&qword_100010128, &qword_100010130);
}

uint64_t sub_100007684(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004E3C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000076C8(uint64_t a1)
{
  unint64_t v2 = sub_100004F78();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007718()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010138);
  }
  return result;
}

uint64_t sub_10000776C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005210(*v1, a1);
}

uint64_t sub_100007774(uint64_t a1)
{
  unint64_t v2 = sub_10000744C();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000077C4()
{
  unint64_t result = qword_100010140;
  if (!qword_100010140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010140);
  }
  return result;
}

uint64_t sub_100007818()
{
  uint64_t v0 = sub_100009EA0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009EE0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100009F40();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100009EB0();
  sub_100004484(v6, qword_1000110F8);
  sub_1000044E8(v6, (uint64_t)qword_1000110F8);
  sub_100009F30();
  sub_100009ED0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_100009EC0();
}

uint64_t sub_1000079F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100009D60();
  *a1 = v3;
  return result;
}

uint64_t sub_100007A34()
{
  return sub_100009D70();
}

void (*sub_100007A6C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100009D50();
  return sub_100007AC8;
}

void sub_100007AC8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100007B18()
{
  unint64_t result = qword_100010148;
  if (!qword_100010148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010148);
  }
  return result;
}

uint64_t sub_100007B6C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100009AD0();
  unint64_t v5 = sub_100009B78();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100007BE4()
{
  unint64_t result = qword_100010150;
  if (!qword_100010150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010150);
  }
  return result;
}

unint64_t sub_100007C3C()
{
  unint64_t result = qword_100010158;
  if (!qword_100010158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010158);
  }
  return result;
}

unint64_t sub_100007C94()
{
  unint64_t result = qword_100010160;
  if (!qword_100010160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010160);
  }
  return result;
}

uint64_t sub_100007CE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007D38@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010048 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009EB0();
  uint64_t v3 = sub_1000044E8(v2, (uint64_t)qword_1000110F8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100007DE0()
{
  return 0;
}

uint64_t sub_100007DF8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009AD0();
  unint64_t v6 = sub_100009B24();
  unint64_t v7 = sub_100009B78();
  *unint64_t v4 = v2;
  v4[1] = sub_100007EC4;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100007EC4()
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

uint64_t sub_100007FCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009640();
  *a1 = result;
  return result;
}

uint64_t sub_100007FF4(uint64_t a1)
{
  unint64_t v2 = sub_100007B18();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenContactsDynamicDeepLinks()
{
  return &type metadata for OpenContactsDynamicDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for ContactsDynamicDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ContactsDynamicDeepLinks()
{
  return &type metadata for ContactsDynamicDeepLinks;
}

ValueMetadata *type metadata accessor for ContactsDynamicDeepLinks.AvailableContactsDynamicDestinationQuery()
{
  return &type metadata for ContactsDynamicDeepLinks.AvailableContactsDynamicDestinationQuery;
}

uint64_t _s32ContactsSettingsIntentsExtension26ContactsDynamicDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s32ContactsSettingsIntentsExtension26ContactsDynamicDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x1000081D4);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_1000081FC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100008204(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContactsDynamicDestination()
{
  return &type metadata for ContactsDynamicDestination;
}

uint64_t sub_10000821C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000082F0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009C34((uint64_t)v12, *a3);
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
      sub_100009C34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009BE4((uint64_t)v12);
  return v7;
}

uint64_t sub_1000082F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009FB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000084AC(a5, a6);
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
  uint64_t v8 = sub_100009FD0();
  if (!v8)
  {
    sub_100009FE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009FF0();
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

uint64_t sub_1000084AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008544(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008724(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008724(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008544(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000086BC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009FC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009FE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009F60();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100009FF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009FE0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000086BC(uint64_t a1, uint64_t a2)
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
  sub_100009A8C(&qword_1000101E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008724(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009A8C(&qword_1000101E0);
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
  uint64_t result = sub_100009FF0();
  __break(1u);
  return result;
}

uint64_t sub_100008874(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000088B4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100008894(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008A04(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000088B4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009A8C(&qword_1000101D0);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100009FF0();
  __break(1u);
  return result;
}

uint64_t sub_100008A04(char a1, int64_t a2, char a3, char *a4)
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
    sub_100009A8C(&qword_1000101D8);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100009FF0();
  __break(1u);
  return result;
}

BOOL sub_100008B54()
{
  id v0 = [objc_allocWithZone((Class)CNContactStore) init];
  id v15 = 0;
  id v1 = [v0 accountsMatchingPredicate:0 error:&v15];
  id v2 = v15;
  if (v1)
  {
    unint64_t v3 = v1;
    uint64_t v4 = sub_100009F70();
    id v5 = v2;

    unint64_t v6 = *(void *)(v4 + 16);
    swift_bridgeObjectRelease();
    return v6 > 1;
  }
  else
  {
    id v8 = v15;
    sub_100009E80();

    swift_willThrow();
    if (qword_100010010 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100009F20();
    sub_1000044E8(v9, (uint64_t)qword_100011070);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = sub_100009F00();
    os_log_type_t v11 = sub_100009F90();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      id v15 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_getErrorValue();
      uint64_t v13 = sub_10000A020();
      sub_10000821C(v13, v14, (uint64_t *)&v15);
      sub_100009FA0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to fetch accounts: %s", v12, 0xCu);
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
    return 0;
  }
}

uint64_t sub_100008E08(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000010000A2B0 || (sub_10000A010() & 1) != 0) {
    return 1;
  }
  if (qword_100010018 != -1) {
    swift_once();
  }
  BOOL v5 = qword_100011088 == a1 && unk_100011090 == a2;
  if (v5 || (sub_10000A010() & 1) != 0) {
    return 2;
  }
  if (qword_100010020 != -1) {
    swift_once();
  }
  if (qword_100011098 == a1 && unk_1000110A0 == a2 || (sub_10000A010() & 1) != 0) {
    return 3;
  }
  if (qword_100010028 != -1) {
    swift_once();
  }
  if (qword_1000110A8 == a1 && unk_1000110B0 == a2 || (sub_10000A010() & 1) != 0) {
    return 4;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x800000010000A2F0 || (sub_10000A010() & 1) != 0) {
    return 5;
  }
  if (qword_100010030 != -1) {
    swift_once();
  }
  if (qword_1000110B8 == a1 && unk_1000110C0 == a2 || (sub_10000A010() & 1) != 0) {
    return 6;
  }
  if (a1 == 0xD000000000000011 && a2 == 0x800000010000A320 || (sub_10000A010() & 1) != 0) {
    return 7;
  }
  if (!a1 && a2 == 0xE000000000000000) {
    return 0;
  }
  if (sub_10000A010()) {
    return 0;
  }
  return 8;
}

uint64_t sub_1000090F4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10000C868;
  v6._object = a2;
  unint64_t v4 = sub_10000A000(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 8) {
    return 8;
  }
  else {
    return v4;
  }
}

uint64_t sub_100009140()
{
  return _swift_task_switch(sub_10000915C, 0, 0);
}

uint64_t sub_10000915C()
{
  uint64_t v1 = sub_10000929C((uint64_t)&off_10000C948);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_100008874(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *(unsigned char *)(v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_100008874(v6 > 1, v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  int64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

uint64_t sub_10000929C(uint64_t result)
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
    unint64_t v5 = v1;
    if (v4 == v1) {
      break;
    }
    int v6 = *(unsigned __int8 *)(v3 + v1);
    if (v6 == 6)
    {
      uint64_t result = sub_100008B54();
      unint64_t v1 = v5 + 1;
      if ((result & 1) == 0) {
        continue;
      }
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      uint64_t result = sub_100008894(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
    }
    unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v8 >= v7 >> 1) {
      uint64_t result = sub_100008894(v7 > 1, v8 + 1, 1);
    }
    unint64_t v1 = v5 + 1;
    *((void *)&_swiftEmptyArrayStorage + 2) = v8 + 1;
    *((unsigned char *)&_swiftEmptyArrayStorage + v8 + 32) = v6;
    goto LABEL_2;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000093A0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000093C0, 0, 0);
}

uint64_t sub_1000093C0()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_10000929C(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    sub_100008874(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100008874(v7 > 1, v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  unint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_10000950C()
{
  return _swift_task_switch(sub_100009528, 0, 0);
}

uint64_t sub_100009528()
{
  if (qword_100010010 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100009F20();
  sub_1000044E8(v1, (uint64_t)qword_100011070);
  uint64_t v2 = sub_100009F00();
  os_log_type_t v3 = sub_100009F80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Falling back to default result", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5(0);
}

uint64_t sub_100009640()
{
  uint64_t v0 = sub_100009E40();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100009A8C(&qword_100010170);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_100009A8C(&qword_100010178);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100009EA0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100009EE0();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100009F40();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_100009EB0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_100009A8C(&qword_100010180);
  sub_100009F30();
  sub_100009ED0();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_100009EC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 8;
  uint64_t v18 = sub_100009D40();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_100004F78();
  return sub_100009D80();
}

uint64_t sub_100009A8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100009AD0()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010188);
  }
  return result;
}

unint64_t sub_100009B24()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010190);
  }
  return result;
}

unint64_t sub_100009B78()
{
  unint64_t result = qword_100010198;
  if (!qword_100010198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010198);
  }
  return result;
}

uint64_t sub_100009BCC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100009BE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009C34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009C90()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100009CA0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100009CB0()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100009CD0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100009CE0()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100009CF0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100009D00()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100009D40()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009D50()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100009D60()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009D70()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100009D80()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009D90()
{
  return DisplayRepresentation.Image.init(appBundleIdentifier:)();
}

uint64_t sub_100009DA0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009DB0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100009DC0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100009DD0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100009E00()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100009E10(Swift::String a1)
{
}

uint64_t sub_100009E20()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009E30()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100009E40()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009E50()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009E60()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009E80()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100009E90()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009EA0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100009EB0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009EC0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100009ED0()
{
  return static Locale.current.getter();
}

uint64_t sub_100009EE0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100009EF0()
{
  return static AppExtension.main()();
}

uint64_t sub_100009F00()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009F10()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009F20()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009F30()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100009F40()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100009F50()
{
  return String.hash(into:)();
}

Swift::Int sub_100009F60()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009F70()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009F80()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100009F90()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009FA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009FB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009FC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009FD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009FE0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009FF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10000A000(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10000A010()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A020()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A030()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A040()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}