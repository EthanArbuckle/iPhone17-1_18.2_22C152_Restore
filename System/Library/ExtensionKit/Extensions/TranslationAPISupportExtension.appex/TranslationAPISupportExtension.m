uint64_t variable initialization expression of LanguageDownloadView._openSensitiveURL@<X0>(uint64_t *a1@<X8>)
{
  uint64_t vars8;

  *a1 = swift_getKeyPath();
  sub_100002030(&qword_100028C58);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100001FF4()
{
  return sub_10001E3B8();
}

uint64_t sub_100002018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000039B0(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues._openSensitiveURL.setter);
}

uint64_t sub_100002030(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t LanguageDownloadView.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v4 = (void *)((char *)a2 + *(int *)(type metadata accessor for LanguageDownloadView(0) + 20));
  uint64_t *v4 = swift_getKeyPath();
  sub_100002030(&qword_100028C58);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *a2 = a1;
  return result;
}

uint64_t type metadata accessor for LanguageDownloadView(uint64_t a1)
{
  return sub_100005E44(a1, (uint64_t *)&unk_100028D18);
}

uint64_t LanguageDownloadView.body.getter()
{
  return sub_10001E548();
}

uint64_t sub_100002168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v43 = sub_100002030(&qword_100028CB0);
  __chkstk_darwin(v43);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001E1B8();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10001E7B8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v39 - v11;
  uint64_t v40 = sub_100002030(&qword_100028C88);
  __chkstk_darwin(v40);
  uint64_t v41 = sub_100002030(&qword_100028C78);
  uint64_t v13 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a1;
  uint64_t v45 = a1;
  sub_10001E7A8();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  if (qword_100028C40 != -1) {
    swift_once();
  }
  id v16 = (id)qword_100029EB0;
  sub_10001E1A8();
  uint64_t v17 = sub_10001E7F8();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  uint64_t v46 = v17;
  uint64_t v47 = v19;
  sub_1000060AC();
  uint64_t v20 = sub_10001E598();
  uint64_t v22 = v21;
  uint64_t v46 = v20;
  uint64_t v47 = v21;
  char v24 = v23 & 1;
  char v48 = v23 & 1;
  uint64_t v49 = v25;
  sub_10001E5F8();
  sub_10000609C(v20, v22, v24);
  swift_bridgeObjectRelease();
  *(void *)v4 = sub_10001E498();
  *((void *)v4 + 1) = 0x4028000000000000;
  v4[16] = 0;
  uint64_t v26 = sub_100002030(&qword_100028EA8);
  sub_100002D74(v42, (uint64_t)&v4[*(int *)(v26 + 44)]);
  sub_100002030(&qword_100028CA0);
  sub_100002814();
  sub_100006488(&qword_100028C98, &qword_100028CA0);
  sub_100006488(&qword_100028CA8, &qword_100028CB0);
  sub_10001E6F8();
  LOBYTE(v20) = sub_10001E538();
  sub_10001E2D8();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v35 = v44;
  uint64_t v36 = v41;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v44, v15, v41);
  uint64_t v37 = v35 + *(int *)(sub_100002030(&qword_100028C60) + 36);
  *(unsigned char *)uint64_t v37 = v20;
  *(void *)(v37 + 8) = v28;
  *(void *)(v37 + 16) = v30;
  *(void *)(v37 + 24) = v32;
  *(void *)(v37 + 32) = v34;
  *(unsigned char *)(v37 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v36);
}

uint64_t sub_100002670@<X0>(uint64_t a1@<X8>)
{
  return sub_100002168(*(void *)(v1 + 16), a1);
}

unint64_t sub_100002678()
{
  unint64_t result = qword_100028C68;
  if (!qword_100028C68)
  {
    sub_1000026F4(&qword_100028C60);
    sub_10000273C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C68);
  }
  return result;
}

uint64_t sub_1000026F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000273C()
{
  unint64_t result = qword_100028C70;
  if (!qword_100028C70)
  {
    sub_1000026F4(&qword_100028C78);
    sub_100002814();
    sub_100006488(&qword_100028C98, &qword_100028CA0);
    sub_100006488(&qword_100028CA8, &qword_100028CB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C70);
  }
  return result;
}

unint64_t sub_100002814()
{
  unint64_t result = qword_100028C80;
  if (!qword_100028C80)
  {
    sub_1000026F4(&qword_100028C88);
    sub_10000656C(&qword_100028C90, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C80);
  }
  return result;
}

uint64_t sub_1000028C0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_100002030(&qword_100028EF0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v47 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v40 - v6;
  uint64_t v48 = type metadata accessor for DownloadRow(0);
  uint64_t v8 = __chkstk_darwin(v48);
  uint64_t v45 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v44 = (uint64_t)&v40 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v41 = (char *)&v40 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v42 = (uint64_t)&v40 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v40 - v17;
  __chkstk_darwin(v16);
  uint64_t v49 = (uint64_t)&v40 - v19;
  uint64_t v43 = a1;
  uint64_t v20 = *a1;
  swift_getKeyPath();
  v51 = v20;
  sub_10000656C(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v21 = (uint64_t)v20 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale;
  swift_beginAccess();
  sub_100006CE0(v21, (uint64_t)v7, &qword_100028EF0);
  uint64_t v22 = sub_10001E1B8();
  uint64_t v23 = *(void *)(v22 - 8);
  char v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  uint64_t result = v24(v7, 1, v22);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v26(v18, v7, v22);
    type metadata accessor for LanguageSupportRemoteModel();
    uint64_t v27 = v20;
    sub_10001E718();
    sub_100006B40((uint64_t)v18, v49, type metadata accessor for DownloadRow);
    swift_getKeyPath();
    v50 = v27;
    sub_10001E1D8();
    swift_release();
    uint64_t v28 = &v27[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale];
    swift_beginAccess();
    uint64_t v29 = (uint64_t)v28;
    uint64_t v30 = v47;
    sub_100006CE0(v29, v47, &qword_100028EF0);
    uint64_t result = v24((char *)v30, 1, v22);
    if (result != 1)
    {
      uint64_t v31 = *v43;
      uint64_t v32 = (uint64_t)v41;
      v26(v41, (char *)v30, v22);
      id v33 = v31;
      sub_10001E718();
      uint64_t v34 = v42;
      sub_100006B40(v32, v42, type metadata accessor for DownloadRow);
      uint64_t v35 = v49;
      uint64_t v36 = v44;
      sub_1000069C0(v49, v44, type metadata accessor for DownloadRow);
      uint64_t v37 = v45;
      sub_1000069C0(v34, v45, type metadata accessor for DownloadRow);
      uint64_t v38 = v46;
      sub_1000069C0(v36, v46, type metadata accessor for DownloadRow);
      uint64_t v39 = sub_100002030(&qword_100028EF8);
      sub_1000069C0(v37, v38 + *(int *)(v39 + 48), type metadata accessor for DownloadRow);
      sub_100006D4C(v34);
      sub_100006D4C(v35);
      sub_100006D4C(v37);
      return sub_100006D4C(v36);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100002D74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v51 = sub_100002030(&qword_100028EB0);
  __chkstk_darwin(v51);
  uint64_t v4 = (uint64_t *)((char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for LanguageDownloadView(0);
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v50 + 64);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = sub_10001E348();
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002030(&qword_100028EB8);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v54 = (uint64_t)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v46 - v16;
  uint64_t v18 = sub_10000323C();
  if (v21)
  {
    uint64_t v22 = v19;
    uint64_t v23 = v21;
    uint64_t v48 = v18;
    uint64_t v49 = v20 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    sub_1000069C0(a1, (uint64_t)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for LanguageDownloadView);
    uint64_t v24 = *(unsigned __int8 *)(v50 + 80);
    uint64_t v50 = a1;
    uint64_t v25 = (v24 + 16) & ~v24;
    uint64_t v26 = swift_allocObject();
    sub_100006B40((uint64_t)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25, type metadata accessor for LanguageDownloadView);
    sub_10001E338();
    uint64_t v27 = v52;
    uint64_t v28 = v53;
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))((char *)v4 + *(int *)(v51 + 28), v9, v53);
    uint64_t *v4 = KeyPath;
    uint64_t v29 = sub_100002030(&qword_100028EC0);
    sub_100006CE0((uint64_t)v4, (uint64_t)&v15[*(int *)(v29 + 36)], &qword_100028EB0);
    uint64_t v30 = v48;
    char v31 = v49;
    *(void *)uint64_t v15 = v48;
    *((void *)v15 + 1) = v22;
    v15[16] = v31;
    *((void *)v15 + 3) = v23;
    uint64_t v51 = (uint64_t)v17;
    uint64_t v32 = v30;
    sub_100006048(v30, v22, v31);
    swift_bridgeObjectRetain();
    sub_100006C7C((uint64_t)v4, &qword_100028EB0);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
    uint64_t v33 = v32;
    uint64_t v17 = (char *)v51;
    sub_10000609C(v33, v22, v31);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v15, 0, 1, v29);
  }
  else
  {
    uint64_t v34 = sub_100002030(&qword_100028EC0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v15, 1, 1, v34);
  }
  sub_10000695C((uint64_t)v15, (uint64_t)v17, &qword_100028EB8);
  uint64_t v35 = sub_100003B80();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  char v41 = v40 & 1;
  uint64_t v42 = v54;
  sub_100006CE0((uint64_t)v17, v54, &qword_100028EB8);
  uint64_t v43 = v55;
  sub_100006CE0(v42, v55, &qword_100028EB8);
  uint64_t v44 = v43 + *(int *)(sub_100002030(&qword_100028EC8) + 48);
  *(void *)uint64_t v44 = v35;
  *(void *)(v44 + 8) = v37;
  *(unsigned char *)(v44 + 16) = v41;
  *(void *)(v44 + 24) = v39;
  sub_100006048(v35, v37, v41);
  swift_bridgeObjectRetain();
  sub_100006C7C((uint64_t)v17, &qword_100028EB8);
  sub_10000609C(v35, v37, v41);
  swift_bridgeObjectRelease();
  return sub_100006C7C(v42, &qword_100028EB8);
}

uint64_t sub_10000323C()
{
  uint64_t v0 = sub_10001E0A8();
  uint64_t v47 = *(void *)(v0 - 8);
  uint64_t v48 = v0;
  __chkstk_darwin(v0);
  uint64_t v46 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10001E0B8();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  __chkstk_darwin(v2);
  uint64_t v43 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001E0D8();
  __chkstk_darwin(v4 - 8);
  char v40 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002030(&qword_100028ED0);
  __chkstk_darwin(v6 - 8);
  uint64_t v39 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002030(&qword_100028ED8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001E0F8();
  uint64_t v44 = *(void *)(v11 - 8);
  uint64_t v45 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v37 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v38 = (char *)&v37 - v14;
  uint64_t v15 = sub_10001E138();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10001E1B8();
  __chkstk_darwin(v19 - 8);
  uint64_t v20 = sub_10001E7B8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v37 - v25;
  sub_10001E7A8();
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
  if (qword_100028C40 != -1) {
    swift_once();
  }
  id v27 = (id)qword_100029EB0;
  sub_10001E1A8();
  sub_10001E7F8();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  sub_100002030(&qword_100028EE0);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_10001F260;
  sub_10001E118();
  uint64_t v29 = sub_10001E128();
  uint64_t v31 = v30;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  *(void *)(v28 + 56) = &type metadata for String;
  *(void *)(v28 + 64) = sub_100006C28();
  *(void *)(v28 + 32) = v29;
  *(void *)(v28 + 40) = v31;
  sub_10001E7E8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v39, 1, 1, v15);
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v43, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v42);
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v46, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v48);
  sub_10001E0C8();
  sub_10001E0E8();
  uint64_t v33 = v44;
  uint64_t v32 = v45;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v44 + 56))(v10, 0, 1, v45);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v10, 1, v32) == 1)
  {
    sub_100006C7C((uint64_t)v10, &qword_100028ED8);
    return 0;
  }
  else
  {
    uint64_t v36 = v38;
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v38, v10, v32);
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v37, v36, v32);
    uint64_t v34 = sub_10001E588();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
  }
  return v34;
}

uint64_t sub_100003974()
{
  return sub_10001E3F8();
}

uint64_t sub_100003998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000039B0(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.openURL.setter);
}

uint64_t sub_1000039B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = sub_10001E348();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, a1);
  return a5(v9);
}

uint64_t sub_100003A80()
{
  uint64_t v0 = sub_10001E348();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LanguageDownloadView(0);
  sub_1000065B4((uint64_t)v3);
  sub_10001E318();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10001E328();
}

uint64_t sub_100003B80()
{
  uint64_t v0 = sub_10001E1B8();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_10001E7B8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v13 - v6;
  sub_10001E7A8();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  if (qword_100028C40 != -1) {
    swift_once();
  }
  id v8 = (id)qword_100029EB0;
  sub_10001E1A8();
  uint64_t v9 = sub_10001E7F8();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  v13[1] = v9;
  v13[2] = v11;
  sub_1000060AC();
  return sub_10001E598();
}

uint64_t sub_100003D84()
{
  return sub_10001E548();
}

uint64_t sub_100003DEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DownloadRow(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  sub_1000069C0(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for DownloadRow);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_100006B40((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5, type metadata accessor for DownloadRow);
  uint64_t v9 = a1;
  sub_100002030(&qword_100028E30);
  sub_100006290();
  return sub_10001E6B8();
}

void sub_100003F50()
{
  type metadata accessor for DownloadRow(0);
  sub_100002030(&qword_100028D68);
  sub_10001E708();
  swift_getKeyPath();
  sub_10000656C(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  int v0 = v3[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState];

  if (v0 == 1)
  {
    sub_10001E708();
    uint64_t v1 = v3;
    LanguageSupportRemoteModel.cancel()();
  }
  else
  {
    sub_10001E708();
    swift_getKeyPath();
    sub_10001E1D8();
    swift_release();
    int v2 = v3[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState];

    if (v2) {
      return;
    }
    sub_10001E708();
    uint64_t v1 = v3;
    sub_10000E580();
  }
}

uint64_t sub_1000040D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v51 = sub_100002030(&qword_100028E60);
  uint64_t v3 = __chkstk_darwin(v51);
  uint64_t v49 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v50 = (char *)&v49 - v5;
  uint64_t v57 = sub_100002030(&qword_100028E88);
  __chkstk_darwin(v57);
  v59 = (uint64_t *)((char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v53 = sub_100002030(&qword_100028E90);
  __chkstk_darwin(v53);
  uint64_t v55 = (uint64_t)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100002030(&qword_100028E48);
  __chkstk_darwin(v58);
  uint64_t v52 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10001E278();
  uint64_t v54 = *(void *)(v56 - 8);
  uint64_t v9 = __chkstk_darwin(v56);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v49 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v49 - v15;
  uint64_t v17 = a1;
  type metadata accessor for DownloadRow(0);
  sub_100002030(&qword_100028D68);
  sub_10001E708();
  uint64_t v18 = v61;
  swift_getKeyPath();
  v61 = v18;
  sub_10000656C(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  LODWORD(a1) = v18[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState];

  if (a1 == 1)
  {
    uint64_t v19 = v14;
    uint64_t v50 = (char *)v17;
    sub_10001E708();
    uint64_t v20 = (char *)v61;
    swift_getKeyPath();
    v61 = (unsigned __int8 *)v20;
    sub_10001E1D8();
    swift_release();
    uint64_t v21 = *(void **)&v20[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus];
    if (v21)
    {
      id v22 = [v21 cachedStatus];
      uint64_t v23 = v16;
      uint64_t v24 = v19;
      if (!v22) {
        goto LABEL_9;
      }
      uint64_t v25 = v22;
      sub_1000068D4();
      unint64_t v26 = sub_10001E858();

      __chkstk_darwin(v27);
      *(&v49 - 2) = v50;
      uint64_t v28 = sub_10000C574(sub_100006914, (uint64_t)(&v49 - 4), v26);
      swift_bridgeObjectRelease();
      if (v28)
      {
        [v28 progress];
      }
      else
      {
LABEL_9:
      }
      uint64_t v36 = v59;
      uint64_t v37 = (uint64_t)v52;
    }
    else
    {

      uint64_t v36 = v59;
      uint64_t v37 = (uint64_t)v52;
      uint64_t v23 = v16;
      uint64_t v24 = v19;
    }
    sub_10001E268();
    uint64_t v38 = v54;
    uint64_t v39 = v56;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v23, v24, v56);
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v55, v23, v39);
    swift_storeEnumTagMultiPayload();
    sub_10000656C(&qword_100028E50, (void (*)(uint64_t))&type metadata accessor for DownloadProgressView);
    sub_1000063B8();
    sub_10001E4C8();
    sub_100006CE0(v37, (uint64_t)v36, &qword_100028E48);
    swift_storeEnumTagMultiPayload();
    sub_100002030(&qword_100028E80);
    sub_10000630C();
    sub_1000064CC();
    sub_10001E4C8();
    sub_100006C7C(v37, &qword_100028E48);
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v23, v39);
  }
  else
  {
    sub_10001E708();
    uint64_t v29 = v61;
    swift_getKeyPath();
    v61 = v29;
    sub_10001E1D8();
    swift_release();
    int v30 = v29[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState];

    if (v30)
    {
      uint64_t v31 = sub_10001E658();
      uint64_t v32 = sub_10001E648();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v34 = v59;
      uint64_t *v59 = v31;
      v34[1] = KeyPath;
      v34[2] = v32;
      swift_storeEnumTagMultiPayload();
      sub_100002030(&qword_100028E80);
      sub_10000630C();
      sub_1000064CC();
      return sub_10001E4C8();
    }
    else
    {
      sub_10001E268();
      uint64_t v40 = sub_10001E628();
      uint64_t v41 = swift_getKeyPath();
      uint64_t v42 = v54;
      uint64_t v43 = v49;
      uint64_t v44 = v56;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v49, v11, v56);
      uint64_t v45 = (uint64_t *)&v43[*(int *)(v51 + 36)];
      *uint64_t v45 = v41;
      v45[1] = v40;
      (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v44);
      uint64_t v46 = (uint64_t)v43;
      uint64_t v47 = (uint64_t)v50;
      sub_10000695C(v46, (uint64_t)v50, &qword_100028E60);
      sub_100006CE0(v47, v55, &qword_100028E60);
      swift_storeEnumTagMultiPayload();
      sub_10000656C(&qword_100028E50, (void (*)(uint64_t))&type metadata accessor for DownloadProgressView);
      sub_1000063B8();
      uint64_t v48 = (uint64_t)v52;
      sub_10001E4C8();
      sub_100006CE0(v48, (uint64_t)v59, &qword_100028E48);
      swift_storeEnumTagMultiPayload();
      sub_100002030(&qword_100028E80);
      sub_10000630C();
      sub_1000064CC();
      sub_10001E4C8();
      sub_100006C7C(v48, &qword_100028E48);
      return sub_100006C7C(v47, &qword_100028E60);
    }
  }
}

uint64_t sub_100004930@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_10001E1B8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E1A8();
  uint64_t v8 = sub_10001E178();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10)
  {
    uint64_t v40 = (void *)v8;
    uint64_t v41 = v10;
    sub_1000060AC();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_10001E598();
    uint64_t v38 = a1;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v16 = v15 & 1;
    sub_10001E638();
    uint64_t v39 = sub_10001E558();
    uint64_t v18 = v17;
    char v20 = v19;
    uint64_t v22 = v21;
    swift_release();
    uint64_t v23 = v20 & 1;
    uint64_t v24 = v12;
    a1 = v38;
    sub_10000609C(v24, v14, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v18 = 0;
    uint64_t v23 = 0;
    uint64_t v22 = 0;
  }
  type metadata accessor for DownloadRow(0);
  sub_100002030(&qword_100028D68);
  sub_10001E708();
  uint64_t v25 = v40;
  unint64_t v26 = LanguageSupportRemoteModel.debugStatusString(for:)(a1);
  uint64_t v28 = v27;

  if (v28)
  {
    uint64_t v40 = (void *)v26;
    uint64_t v41 = v28;
    sub_1000060AC();
    uint64_t v29 = sub_10001E598();
    uint64_t v28 = v30;
    uint64_t v32 = v31;
    uint64_t v34 = v33 & 1;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v34 = 0;
    uint64_t v32 = 0;
  }
  uint64_t v35 = v39;
  *a2 = v39;
  a2[1] = v18;
  a2[2] = v23;
  a2[3] = v22;
  a2[4] = v29;
  a2[5] = v28;
  a2[6] = v34;
  a2[7] = v32;
  sub_100006004(v35, v18, v23, v22);
  sub_100006004(v29, v28, v34, v32);
  sub_100006058(v29, v28, v34, v32);
  return sub_100006058(v35, v18, v23, v22);
}

uint64_t sub_100004BBC()
{
  return sub_10001E5D8();
}

uint64_t sub_100004BD8()
{
  return sub_10001E368();
}

unint64_t variable initialization expression of ExtensionScene.sceneID()
{
  return 0xD00000000000001ALL;
}

id variable initialization expression of ExtensionScene.model()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for LanguageSupportRemoteModel());

  return [v0 init];
}

void *variable initialization expression of LanguageSupportRemoteModel.lowConfidenceLocales()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of LanguageSupportRemoteModel.downloadState()
{
  return 0;
}

uint64_t sub_100004D40@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_10000656C(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState);
  return result;
}

uint64_t sub_100004DF0()
{
  return swift_release();
}

uint64_t variable initialization expression of LanguageSupportRemoteModel.currentStep()
{
  return 3;
}

uint64_t variable initialization expression of LanguageSupportRemoteModel._currentConfiguration()
{
  return 0;
}

uint64_t variable initialization expression of LanguageSupportRemoteModel._cachedCheckerCompletion()
{
  return 0;
}

uint64_t _s30TranslationAPISupportExtension26LanguageSupportRemoteModelC18_unsupportedLocale33_3FCA5AFE04A8478E67D6CE01CB995DEALL10Foundation0I0VSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10001E1B8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_100004F4C()
{
  return swift_getOpaqueTypeConformance2();
}

void **initializeBufferWithCopyOfBuffer for LanguageDownloadView(void **a1, void **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void **)((char *)a1 + v6);
    uint64_t v8 = (void **)((char *)a2 + v6);
    uint64_t v9 = v5;
    sub_100002030(&qword_100028C58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_10001E348();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
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

uint64_t destroy for LanguageDownloadView(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  sub_100002030(&qword_100028C58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_10001E348();
    uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void **initializeWithCopy for LanguageDownloadView(void **a1, void **a2, uint64_t a3)
{
  int v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (void **)((char *)a1 + v5);
  uint64_t v7 = (void **)((char *)a2 + v5);
  id v8 = v4;
  sub_100002030(&qword_100028C58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_10001E348();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v6, v7, v9);
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **assignWithCopy for LanguageDownloadView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  if (a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void **)((char *)a1 + v9);
    uint64_t v11 = (void **)((char *)a2 + v9);
    sub_100006C7C((uint64_t)a1 + v9, &qword_100028C58);
    sub_100002030(&qword_100028C58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_10001E348();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for LanguageDownloadView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100002030(&qword_100028C58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_10001E348();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void **assignWithTake for LanguageDownloadView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_100006C7C((uint64_t)a1 + v7, &qword_100028C58);
    uint64_t v10 = sub_100002030(&qword_100028C58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_10001E348();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageDownloadView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000054D4);
}

uint64_t sub_1000054D4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100002030(&qword_100028CB8);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LanguageDownloadView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000559C);
}

void *sub_10000559C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100002030(&qword_100028CB8);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100005648()
{
  sub_100005F74(319, (unint64_t *)&unk_100028D28, (uint64_t (*)(uint64_t))&type metadata accessor for OpenURLAction, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100005714()
{
  return sub_100006488(&qword_100028D58, &qword_100028D60);
}

uint64_t *sub_100005750(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10001E1B8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100002030(&qword_100028D68);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_10000585C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001E1B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100002030(&qword_100028D68);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100005908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E1B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100002030(&qword_100028D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_1000059C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E1B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100002030(&qword_100028D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E1B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100002030(&qword_100028D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E1B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100002030(&qword_100028D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100005BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005C0C);
}

uint64_t sub_100005C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E1B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100002030(&qword_100028D68);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_100005D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005D1C);
}

uint64_t sub_100005D1C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_10001E1B8();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100002030(&qword_100028D68);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for DownloadRow(uint64_t a1)
{
  return sub_100005E44(a1, (uint64_t *)&unk_100028DC8);
}

uint64_t sub_100005E44(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100005E7C()
{
  sub_10001E1B8();
  if (v0 <= 0x3F)
  {
    sub_100005F74(319, (unint64_t *)&unk_100028DD8, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Bindable);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_100005F74(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100005FD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005FF4()
{
  return sub_100003DEC(*(void *)(v0 + 16));
}

uint64_t sub_100005FFC@<X0>(uint64_t *a1@<X8>)
{
  return sub_100004930(*(void *)(v1 + 16), a1);
}

uint64_t sub_100006004(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100006048(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100006048(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100006058(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000609C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000609C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_1000060AC()
{
  unint64_t result = qword_100028E28;
  if (!qword_100028E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028E28);
  }
  return result;
}

uint64_t sub_100006100()
{
  uint64_t v1 = (int *)(type metadata accessor for DownloadRow(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_10001E1B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = sub_100002030(&qword_100028D68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return _swift_deallocObject(v0, v4, v5);
}

void sub_100006228()
{
  type metadata accessor for DownloadRow(0);

  sub_100003F50();
}

uint64_t sub_100006288@<X0>(uint64_t a1@<X8>)
{
  return sub_1000040D4(*(void *)(v1 + 16), a1);
}

unint64_t sub_100006290()
{
  unint64_t result = qword_100028E38;
  if (!qword_100028E38)
  {
    sub_1000026F4(&qword_100028E30);
    sub_10000630C();
    sub_1000064CC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028E38);
  }
  return result;
}

unint64_t sub_10000630C()
{
  unint64_t result = qword_100028E40;
  if (!qword_100028E40)
  {
    sub_1000026F4(&qword_100028E48);
    sub_10000656C(&qword_100028E50, (void (*)(uint64_t))&type metadata accessor for DownloadProgressView);
    sub_1000063B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028E40);
  }
  return result;
}

unint64_t sub_1000063B8()
{
  unint64_t result = qword_100028E58;
  if (!qword_100028E58)
  {
    sub_1000026F4(&qword_100028E60);
    sub_10000656C(&qword_100028E50, (void (*)(uint64_t))&type metadata accessor for DownloadProgressView);
    sub_100006488(&qword_100028E68, &qword_100028E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028E58);
  }
  return result;
}

uint64_t sub_100006488(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000026F4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000064CC()
{
  unint64_t result = qword_100028E78;
  if (!qword_100028E78)
  {
    sub_1000026F4(&qword_100028E80);
    sub_100006488(&qword_100028E68, &qword_100028E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028E78);
  }
  return result;
}

uint64_t sub_10000656C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000065B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001E428();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002030(&qword_100028C58);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CE0(v2, (uint64_t)v10, &qword_100028C58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_10001E348();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_10001E938();
    uint64_t v14 = sub_10001E518();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      char v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)char v16 = 136315138;
      v18[2] = sub_100011AFC(0x414C52556E65704FLL, 0xED00006E6F697463, &v19);
      sub_10001E9A8();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10001E418();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100006874@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001E398();
  *a1 = result;
  return result;
}

uint64_t sub_1000068A0()
{
  return sub_10001E3A8();
}

unint64_t sub_1000068D4()
{
  unint64_t result = qword_100028EA0;
  if (!qword_100028EA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100028EA0);
  }
  return result;
}

uint64_t sub_100006914(id *a1)
{
  return sub_10000C844(a1) & 1;
}

uint64_t sub_100006934()
{
  return sub_100009C5C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_100006954@<X0>(uint64_t a1@<X8>)
{
  return sub_1000028C0(*(void ***)(v1 + 16), a1);
}

uint64_t sub_10000695C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002030(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000069C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006A28()
{
  uint64_t v1 = (int *)(type metadata accessor for LanguageDownloadView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  uint64_t v5 = v0 + v3 + v1[7];
  sub_100002030(&qword_100028C58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_10001E348();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100006B40(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006BA8()
{
  type metadata accessor for LanguageDownloadView(0);

  return sub_100003A80();
}

unint64_t sub_100006C28()
{
  unint64_t result = qword_100028EE8;
  if (!qword_100028EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028EE8);
  }
  return result;
}

uint64_t sub_100006C7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002030(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006CE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002030(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006D4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DownloadRow(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for _LTPreflightConfigurationStep()
{
  if (!qword_100028F00)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100028F00);
    }
  }
}

unint64_t sub_100006E04()
{
  unint64_t result = qword_100028F08;
  if (!qword_100028F08)
  {
    sub_1000026F4(&qword_100028F10);
    sub_100006488(&qword_100028E18, &qword_100028E08);
    sub_100006488(&qword_100028E20, &qword_100028E10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028F08);
  }
  return result;
}

uint64_t LanguageSupportExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(a1);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v8((char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v14[3] = a1;
  v14[4] = a2;
  uint64_t v11 = sub_100007184(v14);
  v8((char *)v11, v3, a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_1000071E8();
  return sub_10001E238();
}

uint64_t sub_100007090()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100007118()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t *sub_100007184(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1000071E8()
{
  unint64_t result = qword_100028F18[0];
  if (!qword_100028F18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100028F18);
  }
  return result;
}

id ExtensionScene.init(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  id result = [objc_allocWithZone((Class)type metadata accessor for LanguageSupportRemoteModel()) init];
  *a3 = 0xD00000000000001ALL;
  a3[1] = 0x8000000100021170;
  a3[2] = a1;
  a3[3] = a2;
  a3[4] = result;
  return result;
}

uint64_t ExtensionScene.body.getter(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(v5 + 16) = v6;
  *(void *)(v5 + 24) = v7;
  long long v8 = *((_OWORD *)v1 + 1);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(v5 + 48) = v8;
  *(void *)(v5 + 64) = v1[4];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  *(void *)(v9 + 24) = v7;
  long long v10 = *((_OWORD *)v1 + 1);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)v1;
  *(_OWORD *)(v9 + 48) = v10;
  uint64_t v11 = (void *)v1[4];
  *(void *)(v9 + 64) = v11;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  id v12 = v11;

  return PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)(v4, v3, sub_100007508, v5, sub_10000765C, v9, v6, v7);
}

uint64_t sub_1000073C0@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  long long v10 = (char *)&v14 - v9;
  (*(void (**)(void))(v8 + 16))(*(void *)(v8 + 32));
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, a1);
  id v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, a1);
  v11(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, a1);
}

uint64_t sub_100007508@<X0>(char *a1@<X8>)
{
  return sub_1000073C0(*(void *)(v1 + 16), a1);
}

id sub_100007514(uint64_t a1, uint64_t a2)
{
  if (qword_100028C50 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10001E2C8();
  sub_10000774C(v4, (uint64_t)qword_100029ED0);
  uint64_t v5 = sub_10001E2A8();
  os_log_type_t v6 = sub_10001E918();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "entering onConnection(connection:)", v7, 2u);
    swift_slowDealloc();
  }

  return [*(id *)(a2 + 32) shouldAcceptWithConnection:a1];
}

uint64_t sub_100007614()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

id sub_10000765C(uint64_t a1)
{
  return sub_100007514(a1, v1 + 32);
}

Swift::Bool __swiftcall LanguageSupportConfiguration.accept(connection:)(NSXPCConnection connection)
{
  if (qword_100028C50 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001E2C8();
  sub_10000774C(v1, (uint64_t)qword_100029ED0);
  uint64_t v2 = sub_10001E2A8();
  os_log_type_t v3 = sub_10001E918();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "entering accept(conection:)", v4, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_10000774C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007784(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1000077C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t _s30TranslationAPISupportExtension28LanguageSupportConfigurationVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void sub_100007840(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t sub_100007884(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void **)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  id v4 = v3;
  return a1;
}

void *sub_1000078DC(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = (void *)a2[4];
  os_log_type_t v6 = (void *)a1[4];
  a1[4] = v5;
  id v7 = v5;

  return a1;
}

__n128 initializeWithTake for LanguageSupportConfiguration(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_10000796C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  uint64_t v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  return a1;
}

uint64_t sub_1000079C4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100007A0C(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ExtensionScene()
{
  return sub_100007E58();
}

uint64_t sub_100007A70(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for LanguageSupportConfiguration(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for LanguageSupportConfiguration(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_100007B40(uint64_t *result, uint64_t *a2)
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
      result[4] = a2[4];
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

uint64_t assignWithTake for LanguageSupportConfiguration(uint64_t a1, uint64_t a2)
{
  sub_100007A70(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageSupportConfiguration(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LanguageSupportConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LanguageSupportConfiguration()
{
  return &type metadata for LanguageSupportConfiguration;
}

void *sub_100007E4C()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

uint64_t sub_100007E58()
{
  return swift_getGenericMetadata();
}

BOOL static LanguageSupportRemoteModel.Step.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void LanguageSupportRemoteModel.Step.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int LanguageSupportRemoteModel.Step.hashValue.getter(unsigned __int8 a1)
{
  return sub_10001EB08();
}

BOOL sub_100007F14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100007F28()
{
  Swift::UInt v1 = *v0;
  sub_10001EAE8();
  sub_10001EAF8(v1);
  return sub_10001EB08();
}

void sub_100007F70()
{
  sub_10001EAF8(*v0);
}

Swift::Int sub_100007F9C()
{
  Swift::UInt v1 = *v0;
  sub_10001EAE8();
  sub_10001EAF8(v1);
  return sub_10001EB08();
}

void (*sub_100007FE0(void *a1))(uint64_t a1, char a2)
{
  long long v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[9] = v1;
  size_t v4 = *(void *)(*(void *)(sub_100002030(&qword_100028EF0) - 8) + 64);
  v3[10] = malloc(v4);
  v3[11] = malloc(v4);
  uint64_t v5 = malloc(v4);
  uint64_t v6 = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale;
  v3[12] = v5;
  v3[13] = v6;
  uint64_t v7 = v1 + v6;
  swift_beginAccess();
  sub_10000829C(v7, (uint64_t)v5);
  return sub_1000080AC;
}

void sub_1000080AC(uint64_t a1, char a2)
{
}

uint64_t LanguageSupportRemoteModel.sourceLocale.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AFC(&OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale, a1);
}

uint64_t sub_1000080D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008BDC(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale, a2);
}

uint64_t sub_1000080E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008BDC(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale, a2);
}

uint64_t sub_100008110(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000829C(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  swift_release();
  return sub_100006C7C((uint64_t)v6, &qword_100028EF0);
}

uint64_t type metadata accessor for LanguageSupportRemoteModel()
{
  uint64_t result = qword_1000290E8;
  if (!qword_1000290E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000829C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t LanguageSupportRemoteModel.sourceLocale.setter(uint64_t a1)
{
  return sub_100006C7C(a1, &qword_100028EF0);
}

uint64_t sub_1000083E0()
{
  return sub_100008EF0(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale, (uint64_t)&unk_10001F650);
}

void (*LanguageSupportRemoteModel.sourceLocale.modify(void *a1))(void *a1)
{
  long long v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  *long long v3 = v1;
  v3[6] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  *long long v3 = v1;
  swift_getKeyPath();
  sub_10001E1F8();
  swift_release();
  v3[7] = sub_100007FE0(v3);
  return sub_100008528;
}

void sub_100008528(void *a1)
{
}

uint64_t sub_100008534(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = a1;
  uint64_t v5 = sub_10001E1B8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100002030((uint64_t *)&unk_1000291A0);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  os_log_type_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v23 = v3;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v16 = v3 + *a3;
  swift_beginAccess();
  uint64_t v17 = (uint64_t)&v15[*(int *)(v13 + 56)];
  sub_10000829C(v16, (uint64_t)v15);
  sub_10000829C(v22, v17);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v18((uint64_t)v15, 1, v5) == 1)
  {
    if (v18(v17, 1, v5) == 1) {
      return sub_100006C7C((uint64_t)v15, &qword_100028EF0);
    }
  }
  else
  {
    sub_10000829C((uint64_t)v15, (uint64_t)v11);
    if (v18(v17, 1, v5) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v17, v5);
      sub_100016D04(&qword_100029110, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v20 = sub_10001E798();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
      v21(v8, v5);
      v21(v11, v5);
      uint64_t result = sub_100006C7C((uint64_t)v15, &qword_100028EF0);
      if (v20) {
        return result;
      }
      return sub_10000B9A4();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  sub_100006C7C((uint64_t)v15, (uint64_t *)&unk_1000291A0);
  return sub_10000B9A4();
}

void (*sub_1000088A4(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x70uLL);
  *a1 = v3;
  v3[9] = v1;
  size_t v4 = *(void *)(*(void *)(sub_100002030(&qword_100028EF0) - 8) + 64);
  v3[10] = malloc(v4);
  v3[11] = malloc(v4);
  uint64_t v5 = malloc(v4);
  uint64_t v6 = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale;
  v3[12] = v5;
  v3[13] = v6;
  uint64_t v7 = v1 + v6;
  swift_beginAccess();
  sub_10000829C(v7, (uint64_t)v5);
  return sub_100008970;
}

void sub_100008970(uint64_t a1, char a2)
{
}

void sub_100008984(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v8 = *(void **)(*(void *)a1 + 96);
  uint64_t v7 = *(void *)(*(void *)a1 + 104);
  uint64_t v9 = *(void **)(*(void *)a1 + 80);
  uint64_t v10 = *(void **)(*(void *)a1 + 88);
  uint64_t v11 = *(void *)(*(void *)a1 + 72) + v7;
  if (a2)
  {
    sub_10000829C(*(void *)(*(void *)a1 + 96), (uint64_t)v10);
    sub_10000829C(v11, (uint64_t)v9);
    swift_beginAccess();
    sub_100017258((uint64_t)v10, v11);
    swift_endAccess();
    sub_100008534((uint64_t)v9, a3, a4);
    sub_100006C7C((uint64_t)v10, &qword_100028EF0);
    uint64_t v12 = (uint64_t)v9;
    uint64_t v13 = (uint64_t)v8;
  }
  else
  {
    sub_10000829C(*(void *)(*(void *)a1 + 72) + v7, (uint64_t)v10);
    swift_beginAccess();
    sub_100017258((uint64_t)v8, v11);
    swift_endAccess();
    sub_100008534((uint64_t)v10, a3, a4);
    uint64_t v12 = (uint64_t)v8;
    uint64_t v13 = (uint64_t)v10;
  }
  sub_100006C7C(v12, &qword_100028EF0);
  sub_100006C7C(v13, &qword_100028EF0);
  free(v8);
  free(v10);
  free(v9);

  free(v6);
}

uint64_t LanguageSupportRemoteModel.targetLocale.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AFC(&OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale, a1);
}

uint64_t sub_100008AFC@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v5 = v2 + *a1;
  swift_beginAccess();
  return sub_10000829C(v5, a2);
}

uint64_t sub_100008BC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008BDC(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale, a2);
}

uint64_t sub_100008BDC@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v6 = v5 + *a2;
  swift_beginAccess();
  return sub_10000829C(v6, a3);
}

uint64_t sub_100008CAC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008BDC(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale, a2);
}

uint64_t sub_100008CD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000829C(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  swift_release();
  return sub_100006C7C((uint64_t)v6, &qword_100028EF0);
}

uint64_t LanguageSupportRemoteModel.targetLocale.setter(uint64_t a1)
{
  return sub_100006C7C(a1, &qword_100028EF0);
}

uint64_t sub_100008EF0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_100002030(&qword_100028EF0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v13 = &v16[-v12];
  sub_10000829C(a2, (uint64_t)&v16[-v12]);
  uint64_t v14 = a1 + *a3;
  swift_beginAccess();
  sub_10000829C(v14, (uint64_t)v11);
  swift_beginAccess();
  sub_100017258((uint64_t)v13, v14);
  swift_endAccess();
  sub_100008534((uint64_t)v11, a4, a3);
  sub_100006C7C((uint64_t)v13, &qword_100028EF0);
  return sub_100006C7C((uint64_t)v11, &qword_100028EF0);
}

uint64_t sub_100009034()
{
  return sub_100008EF0(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale, (uint64_t)&unk_10001F678);
}

void (*LanguageSupportRemoteModel.targetLocale.modify(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_10001E1F8();
  swift_release();
  v3[7] = sub_1000088A4(v3);
  return sub_10000917C;
}

void sub_10000917C(void *a1)
{
}

uint64_t (*sub_100009188())()
{
  return j_j__swift_endAccess;
}

uint64_t LanguageSupportRemoteModel.lowConfidenceLocales.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000092A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v4 = (void *)(v3 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100009378()
{
  return swift_release();
}

uint64_t LanguageSupportRemoteModel.lowConfidenceLocales.setter()
{
  return swift_release();
}

uint64_t sub_100009530(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales);
  swift_beginAccess();
  *uint64_t v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000095A0()
{
  return sub_100009530(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void (*LanguageSupportRemoteModel.lowConfidenceLocales.modify(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_10001E1F8();
  swift_release();
  v3[7] = sub_100009188();
  return sub_1000096D8;
}

void sub_1000096D8(void *a1)
{
}

uint64_t (*sub_1000096E4())()
{
  return j_j__swift_endAccess;
}

uint64_t LanguageSupportRemoteModel.unsupportedLocale.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100008AFC(&OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale, a1);
}

uint64_t sub_100009754@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008BDC(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale, a2);
}

uint64_t sub_100009768@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100008BDC(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale, a2);
}

uint64_t sub_100009790(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10000829C(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  swift_release();
  return sub_100006C7C((uint64_t)v6, &qword_100028EF0);
}

uint64_t LanguageSupportRemoteModel.unsupportedLocale.setter(uint64_t a1)
{
  return sub_100006C7C(a1, &qword_100028EF0);
}

uint64_t sub_1000099AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000829C(a2, (uint64_t)v6);
  uint64_t v7 = a1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale;
  swift_beginAccess();
  sub_1000171F0((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t sub_100009A70()
{
  return sub_1000099AC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void (*LanguageSupportRemoteModel.unsupportedLocale.modify(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_10001E1F8();
  swift_release();
  v3[7] = sub_1000096E4();
  return sub_100009BA8;
}

void sub_100009BA8(void *a1)
{
}

uint64_t sub_100009BB4()
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState);
}

uint64_t sub_100009C5C(uint64_t result, char a2)
{
  *(unsigned char *)(result + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState) = a2;
  return result;
}

uint64_t (*sub_100009C6C())()
{
  return j__swift_endAccess;
}

uint64_t LanguageSupportRemoteModel.currentStep.getter()
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentStep);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_100009D8C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v4 = (unsigned char *)(v3 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentStep);
  uint64_t result = swift_beginAccess();
  *a2 = *v4;
  return result;
}

uint64_t sub_100009E58()
{
  return swift_release();
}

uint64_t LanguageSupportRemoteModel.currentStep.setter()
{
  return swift_release();
}

uint64_t sub_100009FFC()
{
  return sub_100017190();
}

void (*LanguageSupportRemoteModel.currentStep.modify(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_10001E1F8();
  swift_release();
  v3[7] = sub_100009C6C();
  return sub_10000A130;
}

void sub_10000A130(void *a1)
{
}

void sub_10000A13C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_10001E1E8();
  swift_release();

  free(v1);
}

void *sub_10000A1C8()
{
  return sub_10000A2CC((uint64_t)&unk_10001F790, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__xpcConnection);
}

uint64_t sub_10000A1DC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  id v2 = v1;
  sub_10001E1C8();

  return swift_release();
}

void *sub_10000A2B8()
{
  return sub_10000A2CC((uint64_t)&unk_10001F718, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus);
}

void *sub_10000A2CC(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v4 = *(void **)(v2 + *a2);
  id v5 = v4;
  return v4;
}

id sub_10000A374@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000A388(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus, a2);
}

id sub_10000A388@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v6 = *(void **)(v5 + *a2);
  *a3 = v6;

  return v6;
}

uint64_t sub_10000A44C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  id v2 = v1;
  sub_10001E1C8();

  return swift_release();
}

uint64_t sub_10000A528()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000A5D4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  *a2 = *(void *)(v3
                  + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedOriginallyInstalledLanguageIdentifiers);
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000A688()
{
  return swift_release();
}

id sub_10000A768()
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker);

  return v1;
}

id sub_10000A820@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker);
  *a2 = v4;

  return v4;
}

uint64_t sub_10000A8E0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  id v2 = v1;
  sub_10001E1C8();

  return swift_release();
}

void *sub_10000A9BC()
{
  return sub_10000A2CC((uint64_t)&unk_10001F988, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration);
}

uint64_t sub_10000A9D0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  id v2 = v1;
  sub_10001E1C8();

  return swift_release();
}

uint64_t sub_10000AAAC()
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
  sub_10000D168(v1);
  return v1;
}

uint64_t sub_10000AB6C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v4 = *(void *)(v3
                 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
  uint64_t v5 = *(void *)(v3
                 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion
                 + 8);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_1000170CC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_10000D168(v4);
}

uint64_t sub_10000AC64(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = sub_100017090;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_10000D168(v2);
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  sub_10000D178((uint64_t)v4);
  return swift_release();
}

char *sub_10000ADC0()
{
  uint64_t v1 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t)&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale];
  uint64_t v5 = sub_10001E1B8();
  uint64_t v6 = *(void (**)(void))(*(void *)(v5 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6)(v4, 1, 1, v5);
  uint64_t v22 = &v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale];
  v6();
  uint64_t v23 = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales;
  *(void *)&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales] = &_swiftEmptyArrayStorage;
  uint64_t v7 = (uint64_t)&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale];
  ((void (*)(unsigned char *, uint64_t, uint64_t, uint64_t))v6)(&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale], 1, 1, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6)(v7, 1, 1, v5);
  v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState] = 0;
  v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentStep] = 3;
  uint64_t v8 = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__xpcConnection;
  *(void *)&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__xpcConnection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus] = 0;
  *(void *)&v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration] = 0;
  uint64_t v9 = &v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion];
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = v0;
  _s30TranslationAPISupportExtension26LanguageSupportRemoteModelC22__observationRegistrar33_3FCA5AFE04A8478E67D6CE01CB995DEALL11Observation0rI0Vvpfi_0();
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v6)(v3, 1, 1, v5);
  sub_100006C7C(v4, &qword_100028EF0);
  sub_1000169A4((uint64_t)v3, v4);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v6)(v3, 1, 1, v5);
  uint64_t v11 = (uint64_t)v22;
  sub_100006C7C((uint64_t)v22, &qword_100028EF0);
  sub_1000169A4((uint64_t)v3, v11);
  uint64_t v12 = v23;
  swift_bridgeObjectRelease();
  *(void *)&v0[v12] = &_swiftEmptyArrayStorage;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v6)(v3, 1, 1, v5);
  sub_100006C7C(v7, &qword_100028EF0);
  sub_1000169A4((uint64_t)v3, v7);

  *(void *)&v0[v8] = 0;
  id v13 = [objc_allocWithZone((Class)_LTPreflightChecker) init];
  *(void *)&v10[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker] = v13;
  *(void *)&v10[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedOriginallyInstalledLanguageIdentifiers] = &_swiftEmptySetSingleton;

  uint64_t v14 = (objc_class *)type metadata accessor for LanguageSupportRemoteModel();
  v27.receiver = v10;
  v27.super_class = v14;
  id v15 = objc_msgSendSuper2(&v27, "init");
  swift_getKeyPath();
  aBlock[0] = v15;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  uint64_t v16 = (char *)v15;
  sub_10001E1D8();
  swift_release();
  [*(id *)&v16[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker] setDelegate:v16];
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v18 = objc_allocWithZone((Class)_LTLanguageStatus);
  aBlock[4] = sub_100016A44;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011790;
  aBlock[3] = &unk_1000253C0;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  id v20 = [v18 initWithObservationType:1 useDedicatedMachPort:0 observations:v19];
  _Block_release(v19);
  swift_release();
  swift_release();
  swift_getKeyPath();
  uint64_t v24 = v16;
  id v25 = v20;
  aBlock[0] = v16;
  sub_10001E1C8();

  swift_release();
  return v16;
}

uint64_t sub_10000B27C(uint64_t a1)
{
  uint64_t v2 = sub_100002030(&qword_100029018);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v6 = (void *)result;
    uint64_t v7 = sub_10001E8C8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_10001E8A8();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v9 = sub_10001E898();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = &protocol witness table for MainActor;
    v10[4] = v8;
    v10[5] = a1;
    swift_release();
    sub_10000B7D4((uint64_t)v4, (uint64_t)&unk_100029138, (uint64_t)v10);

    return swift_release();
  }
  return result;
}

uint64_t sub_10000B410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  sub_10001E8A8();
  v5[8] = sub_10001E898();
  uint64_t v7 = sub_10001E888();
  return _swift_task_switch(sub_10000B4A8, v7, v6);
}

uint64_t sub_10000B4A8()
{
  id v18 = v0;
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    if (v0[7])
    {
      uint64_t v3 = qword_100028C48;
      swift_bridgeObjectRetain();
      if (v3 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_10001E2C8();
      sub_10000774C(v4, (uint64_t)qword_100029EB8);
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_10001E2A8();
      os_log_type_t v6 = sub_10001E908();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        *(_DWORD *)uint64_t v7 = 136446210;
        sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_10001E868();
        unint64_t v10 = v9;
        swift_bridgeObjectRelease();
        v0[5] = sub_100011AFC(v8, v10, &v17);
        sub_10001E9A8();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Language status was updated: %{public}s", v7, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_10000B9A4();
    }
    else
    {
      if (qword_100028C48 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_10001E2C8();
      sub_10000774C(v11, (uint64_t)qword_100029EB8);
      uint64_t v12 = sub_10001E2A8();
      os_log_type_t v13 = sub_10001E928();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Not updating cached language status since latest update had nil observations", v14, 2u);
        swift_slowDealloc();
      }
    }
  }
  id v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_10000B7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10001E8C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10001E8B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100006C7C(a1, &qword_100029018);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10001E888();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10000B9A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100002030(&qword_100029018);
  __chkstk_darwin(v2 - 8);
  uint64_t v50 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v48 = (uint64_t)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v45 - v7;
  uint64_t v9 = sub_10001E1B8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v46 = (char *)&v45 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v49 = (char *)&v45 - v16;
  __chkstk_darwin(v15);
  uint64_t v52 = (char *)&v45 - v17;
  swift_getKeyPath();
  uint64_t v55 = v0;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v18 = (uint64_t)v0 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale;
  swift_beginAccess();
  sub_10000829C(v18, (uint64_t)v8);
  uint64_t v51 = v10;
  uint64_t v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v19((uint64_t)v8, 1, v9) == 1)
  {
    uint64_t v20 = (uint64_t)v8;
    uint64_t v21 = v1;
  }
  else
  {
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
    v45(v52, v8, v9);
    swift_getKeyPath();
    uint64_t v53 = v1;
    sub_10001E1D8();
    swift_release();
    uint64_t v22 = (uint64_t)v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale;
    swift_beginAccess();
    uint64_t v23 = v22;
    uint64_t v20 = v48;
    sub_10000829C(v23, v48);
    uint64_t v21 = v1;
    if (v19(v20, 1, v9) != 1)
    {
      uint64_t v30 = v49;
      v45(v49, (char *)v20, v9);
      uint64_t v31 = sub_10001E8C8();
      uint64_t v32 = v9;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v50, 1, 1, v31);
      uint64_t v33 = v51;
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
      uint64_t v35 = v46;
      v34(v46, v52, v9);
      uint64_t v36 = v47;
      v34(v47, v30, v32);
      sub_10001E8A8();
      id v37 = v21;
      uint64_t v38 = sub_10001E898();
      uint64_t v39 = *(unsigned __int8 *)(v33 + 80);
      uint64_t v40 = (v39 + 40) & ~v39;
      uint64_t v41 = (v11 + v39 + v40) & ~v39;
      uint64_t v42 = (char *)swift_allocObject();
      *((void *)v42 + 2) = v38;
      *((void *)v42 + 3) = &protocol witness table for MainActor;
      *((void *)v42 + 4) = v37;
      uint64_t v43 = v45;
      v45(&v42[v40], v35, v32);
      v43(&v42[v41], v36, v32);
      sub_10000B7D4(v50, (uint64_t)&unk_100029188, (uint64_t)v42);
      swift_release();
      uint64_t v44 = *(void (**)(char *, uint64_t))(v33 + 8);
      v44(v49, v32);
      return ((uint64_t (*)(char *, uint64_t))v44)(v52, v32);
    }
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v9);
  }
  sub_100006C7C(v20, &qword_100028EF0);
  if (qword_100028C48 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_10001E2C8();
  sub_10000774C(v24, (uint64_t)qword_100029EB8);
  id v25 = sub_10001E2A8();
  os_log_type_t v26 = sub_10001E908();
  if (os_log_type_enabled(v25, v26))
  {
    objc_super v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)objc_super v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Download state determination requires that both source and target be non-nil", v27, 2u);
    swift_slowDealloc();
  }

  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(&v45 - 2) = (void (*)(char *, char *, uint64_t))v21;
  *((unsigned char *)&v45 - 8) = 0;
  uint64_t v54 = v21;
  sub_10001E1C8();
  return swift_release();
}

uint64_t sub_10000C008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  sub_10001E8A8();
  v6[6] = sub_10001E898();
  uint64_t v8 = sub_10001E888();
  return _swift_task_switch(sub_10000C0A4, v8, v7);
}

uint64_t sub_10000C0A4()
{
  uint64_t v1 = v0[3];
  swift_release();
  swift_getKeyPath();
  v0[2] = v1;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v2 = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus);
  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 cachedStatus];
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = v0[4];
  sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
  unint64_t v6 = sub_10001E858();

  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = sub_10000C574(sub_1000172C4, v7, v6);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v8)
  {
    unsigned __int8 v9 = sub_1000157DC((unint64_t)[v8 status]);
  }
  else
  {
LABEL_5:
    unsigned __int8 v9 = 0;
  }
  uint64_t v10 = v0[3];
  swift_getKeyPath();
  v0[2] = v10;
  sub_10001E1D8();
  swift_release();
  uint64_t v11 = *(void **)(v1 + v2);
  if (!v11) {
    goto LABEL_11;
  }
  id v12 = [v11 cachedStatus];
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = v12;
  uint64_t v14 = v0[5];
  sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
  unint64_t v15 = sub_10001E858();

  uint64_t v16 = swift_task_alloc();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = sub_10000C574(sub_100016FD0, v16, v15);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v17)
  {
    char v18 = sub_1000157DC((unint64_t)[v17 status]);

    int v19 = v9;
    if (!v9) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_11:
    char v18 = 0;
    int v19 = v9;
    if (!v9) {
      goto LABEL_18;
    }
  }
  if (v19 == 1)
  {
    if (v18)
    {
LABEL_14:
      uint64_t v20 = v0[3];
      swift_getKeyPath();
      uint64_t v21 = swift_task_alloc();
      *(void *)(v21 + 16) = v20;
      *(unsigned char *)(v21 + 24) = 1;
      v0[2] = v20;
LABEL_19:
      sub_10001E1C8();
      swift_release();
      swift_task_dealloc();
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v22 = v0[3];
    swift_getKeyPath();
    uint64_t v23 = swift_task_alloc();
    *(void *)(v23 + 16) = v22;
    *(unsigned char *)(v23 + 24) = 0;
    v0[2] = v22;
    goto LABEL_19;
  }
  if (!v18) {
    goto LABEL_18;
  }
  if (v18 == 1) {
    goto LABEL_14;
  }
  uint64_t v26 = v0[3];
  swift_getKeyPath();
  uint64_t v27 = swift_task_alloc();
  *(void *)(v27 + 16) = v26;
  *(unsigned char *)(v27 + 24) = 2;
  v0[2] = v26;
  sub_10001E1C8();
  swift_release();
  swift_task_dealloc();
  sub_10000CCB4(0);
LABEL_20:
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

void *sub_10000C574(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_10001EA78())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0 ? (id)sub_10001EA38() : *(id *)(a3 + 8 * v7);
      unsigned __int8 v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

double LanguageSupportRemoteModel.downloadPercentage(for:)(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v13 = v1;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus);
  double v4 = 0.0;
  if (v3)
  {
    id v5 = [v3 cachedStatus];
    if (v5)
    {
      uint64_t v6 = v5;
      sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
      unint64_t v7 = sub_10001E858();

      __chkstk_darwin(v8);
      v12[2] = a1;
      unsigned __int8 v9 = sub_10000C574(sub_1000172C4, (uint64_t)v12, v7);
      swift_bridgeObjectRelease();
      if (v9)
      {
        [v9 progress];
        double v4 = v10;
      }
    }
  }
  return v4;
}

id sub_10000C818@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000A388(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus, a2);
}

uint64_t sub_10000C844(id *a1)
{
  return sub_10000CB50(a1) & 1;
}

unint64_t LanguageSupportRemoteModel.debugStatusString(for:)(uint64_t a1)
{
  unint64_t v2 = v1;
  sub_100016C7C(0, &qword_100028FF0);
  double v4 = (void *)sub_10001E958();
  char v5 = sub_10001E968();

  unint64_t result = 0;
  if (v5)
  {
    swift_getKeyPath();
    unint64_t v12 = v2;
    sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
    sub_10001E1D8();
    swift_release();
    unint64_t result = *(void *)(v2
                       + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus);
    if (result)
    {
      unint64_t result = (unint64_t)[(id)result cachedStatus];
      if (result)
      {
        unint64_t v7 = (void *)result;
        sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
        unint64_t v8 = sub_10001E858();

        __chkstk_darwin(v9);
        v11[2] = a1;
        double v10 = sub_10000C574(sub_1000172C4, (uint64_t)v11, v8);
        swift_bridgeObjectRelease();
        if (v10)
        {
          switch((unint64_t)[v10 status])
          {
            case 0uLL:

              unint64_t result = 0x74736E4920746F4ELL;
              break;
            case 1uLL:
              unint64_t v12 = 0;
              unint64_t v13 = 0xE000000000000000;
              sub_10001EA18(16);
              v14._countAndFlagsBits = 0x64616F6C6E776F44;
              v14._object = (void *)0xED00002820676E69;
              sub_10001E828(v14);
              [v10 progress];
              sub_10001E8D8();
              v15._countAndFlagsBits = 41;
              v15._object = (void *)0xE100000000000000;
              sub_10001E828(v15);

              unint64_t result = v12;
              break;
            case 2uLL:

              unint64_t result = 0x656C6C6174736E49;
              break;
            case 3uLL:

              unint64_t result = 0x6E776F6E6B6E55;
              break;
            default:

              unint64_t result = 0xD000000000000010;
              break;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000CB50(id *a1)
{
  uint64_t v2 = sub_10001E1B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [*a1 locale];
  sub_10001E198();

  uint64_t v7 = sub_10001E168();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v7 == sub_10001E168() && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = sub_10001EAB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_10000CCB4(void *a1)
{
  if (a1)
  {
    swift_getKeyPath();
    sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
    id v3 = a1;
    sub_10001E1D8();
    swift_release();
    uint64_t v4 = *(void (**)(void, void *))(v1
                                               + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
    if (!v4)
    {
LABEL_7:

      goto LABEL_8;
    }
    id v3 = v3;
    sub_10000D168((uint64_t)v4);
    v4(0, a1);

    uint64_t v5 = (uint64_t)v4;
LABEL_6:
    sub_10000D178(v5);
    goto LABEL_7;
  }
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  id v6 = *(void (**)(void *, void))(v1
                                             + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
  if (v6)
  {
    swift_getKeyPath();
    swift_retain();
    sub_10001E1D8();
    swift_release();
    uint64_t v7 = *(void **)(v1
                  + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration);
    id v3 = v7;
    v6(v7, 0);
    uint64_t v5 = (uint64_t)v6;
    goto LABEL_6;
  }
LABEL_8:
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  return swift_release();
}

Swift::Void __swiftcall LanguageSupportRemoteModel.userDismissed()()
{
  uint64_t v1 = v0;
  sub_10001E7D8();
  id v2 = objc_allocWithZone((Class)NSError);
  NSString v3 = sub_10001E7C8();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithDomain:v3 code:20 userInfo:0];

  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  id v5 = v4;
  sub_10001E1D8();
  swift_release();
  id v6 = *(void (**)(void, id))(v1
                                         + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
  if (v6)
  {
    id v7 = v5;
    sub_10000D168((uint64_t)v6);
    v6(0, v5);

    sub_10000D178((uint64_t)v6);
  }

  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_10001E1C8();
  swift_release();
}

uint64_t sub_10000D168(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000D178(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000D188()
{
  return sub_1000170FC();
}

uint64_t sub_10000D1A0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  id v7 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)v45 - v9;
  __chkstk_darwin(v8);
  char v12 = (char *)v45 - v11;
  id v13 = [a1 resolvedSourceLocale];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_10001E198();

    uint64_t v15 = sub_10001E1B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_10001E1B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v12, 1, 1, v16);
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  v45[-2] = v2;
  v45[-1] = v12;
  uint64_t v46 = v2;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  swift_release();
  sub_100006C7C((uint64_t)v12, &qword_100028EF0);
  id v18 = [a1 resolvedTargetLocale];
  if (v18)
  {
    int v19 = v18;
    sub_10001E198();

    uint64_t v20 = sub_10001E1B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v10, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_10001E1B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
  }
  uint64_t v22 = swift_getKeyPath();
  __chkstk_darwin(v22);
  v45[-2] = v2;
  v45[-1] = v10;
  uint64_t v46 = v2;
  sub_10001E1C8();
  swift_release();
  sub_100006C7C((uint64_t)v10, &qword_100028EF0);
  id v23 = [a1 lidUnsupportedLocale];
  if (v23)
  {
    uint64_t v24 = v23;
    sub_10001E198();

    uint64_t v25 = sub_10001E1B8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v7, 0, 1, v25);
  }
  else
  {
    uint64_t v26 = sub_10001E1B8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 1, 1, v26);
  }
  uint64_t v27 = swift_getKeyPath();
  __chkstk_darwin(v27);
  v45[-2] = v2;
  v45[-1] = v7;
  uint64_t v46 = v2;
  sub_10001E1C8();
  swift_release();
  sub_100006C7C((uint64_t)v7, &qword_100028EF0);
  id v28 = [a1 lowConfidenceLocales];
  if (v28)
  {
    uint64_t v29 = v28;
    v45[1] = (char *)&type metadata for () + 8;
    sub_10001E1B8();
    uint64_t v30 = sub_10001E858();

    uint64_t v31 = sub_10001E258();
    uint64_t v33 = sub_10000D830(v31, v30);
    uint64_t v35 = v34;
    unint64_t v37 = v36;
    if (v36)
    {
      v45[0] = v32;
      sub_10001EAC8();
      swift_unknownObjectRetain_n();
      uint64_t v39 = (void *)swift_dynamicCastClass();
      if (!v39)
      {
        swift_unknownObjectRelease();
        uint64_t v39 = &_swiftEmptyArrayStorage;
      }
      uint64_t v40 = v39[2];
      swift_release();
      if (__OFSUB__(v37 >> 1, v35))
      {
        __break(1u);
      }
      else if (v40 == (v37 >> 1) - v35)
      {
        uint64_t v38 = (void *)swift_dynamicCastClass();
        if (!v38)
        {
          swift_unknownObjectRelease();
          uint64_t v38 = &_swiftEmptyArrayStorage;
        }
        goto LABEL_19;
      }
      swift_unknownObjectRelease();
      uint64_t v32 = v45[0];
    }
    uint64_t v38 = sub_100012154(v33, v32, v35, v37);
LABEL_19:
    swift_unknownObjectRelease();
    uint64_t v41 = swift_getKeyPath();
    __chkstk_darwin(v41);
    v45[-2] = v2;
    v45[-1] = v38;
    uint64_t v46 = v2;
    sub_10001E1C8();
    swift_release();
    swift_release();
  }
  uint64_t v42 = swift_getKeyPath();
  __chkstk_darwin(v42);
  v45[-2] = v2;
  v45[-1] = a1;
  uint64_t v46 = v2;
  id v43 = a1;
  sub_10001E1C8();

  return swift_release();
}

uint64_t sub_10000D830(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 16);
    if ((uint64_t)v3 >= result) {
      unint64_t v4 = result;
    }
    else {
      unint64_t v4 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    if (v3 >= v5)
    {
      sub_10001E1B8();
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D8C4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100002030(&qword_100029018);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v25 = v1;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  uint64_t result = swift_release();
  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration];
  if (v11)
  {
    uint64_t v12 = sub_10001E1B8();
    uint64_t v13 = *(void *)(v12 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v9, a1, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v24 = v6;
    __chkstk_darwin(KeyPath);
    *(&v23 - 2) = (uint64_t)v1;
    *(&v23 - 1) = (uint64_t)v9;
    uint64_t v25 = v1;
    id v15 = v11;
    sub_10001E1C8();
    swift_release();
    sub_100006C7C((uint64_t)v9, &qword_100028EF0);
    Class isa = sub_10001E188().super.isa;
    [v15 setResolvedSourceLocale:isa];

    uint64_t v17 = sub_10001E8C8();
    uint64_t v18 = (uint64_t)v24;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v24, 1, 1, v17);
    sub_10001E8A8();
    id v19 = v15;
    id v20 = v2;
    uint64_t v21 = sub_10001E898();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v21;
    v22[3] = &protocol witness table for MainActor;
    v22[4] = v20;
    v22[5] = v19;
    sub_10000B7D4(v18, (uint64_t)&unk_100029120, (uint64_t)v22);

    return swift_release();
  }
  return result;
}

uint64_t sub_10000DC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  sub_10001E8A8();
  v5[18] = sub_10001E898();
  uint64_t v7 = sub_10001E888();
  v5[19] = v7;
  v5[20] = v6;
  return _swift_task_switch(sub_10000DCC4, v7, v6);
}

uint64_t sub_10000DCC4()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  swift_getKeyPath();
  v0[21] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  v0[10] = v2;
  v0[22] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  unint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker);
  v0[23] = v3;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10000DE5C;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000E318;
  v0[13] = &unk_100025358;
  v0[14] = v4;
  [v3 resolveTargetLocaleIfNeeded:v1 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000DE5C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 192) = v2;
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  if (v2) {
    uint64_t v5 = sub_10000E0A0;
  }
  else {
    uint64_t v5 = sub_10000DF8C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000DF8C()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = v0[16];
  swift_release();
  uint64_t v3 = (void *)v0[15];

  sub_10000D1A0(v3);
  swift_getKeyPath();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v2;
  *(unsigned char *)(v4 + 24) = 1;
  v0[10] = v2;
  sub_10001E1C8();

  swift_release();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10000E0A0()
{
  uint64_t v1 = (void *)v0[23];
  swift_release();
  swift_willThrow();

  if (qword_100028C48 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001E2C8();
  sub_10000774C(v2, (uint64_t)qword_100029EB8);
  swift_errorRetain();
  uint64_t v3 = sub_10001E2A8();
  os_log_type_t v4 = sub_10001E928();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    uint64_t v7 = sub_10001E108();
    v0[10] = v7;
    sub_10001E9A8();
    *uint64_t v6 = v7;
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to resolve target locale or supported pairing: %@", v5, 0xCu);
    sub_100002030(&qword_100029030);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
  }
  uint64_t v8 = v0[16];

  swift_getKeyPath();
  v0[10] = v8;
  sub_10001E1D8();
  swift_release();
  uint64_t v9 = *(void (**)(void, uint64_t))(v8
                                              + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
  uint64_t v10 = v0[24];
  if (v9)
  {
    sub_10000D168(*(void *)(v8
                            + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion));
    swift_errorRetain();
    v9(0, v10);
    swift_errorRelease();
    sub_10000D178((uint64_t)v9);
  }
  swift_errorRelease();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10000E318(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100002030(&qword_100029128);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

void *sub_10000E3D8()
{
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v1 = *(void **)((char *)v0
                + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  id v2 = v1;
  id v3 = [v2 supportedLocales];
  sub_10001E1B8();
  uint64_t v4 = sub_10001E858();

  swift_getKeyPath();
  v9[2] = v0;
  sub_10001E1D8();
  swift_release();
  uint64_t v5 = (void *)((char *)v0
                + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales);
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_bridgeObjectRetain();
  id v7 = (void *)sub_1000158B4(v4, v6);
  swift_bridgeObjectRelease();
  v9[0] = v7;
  swift_bridgeObjectRetain();
  sub_100013710(v9);
  swift_bridgeObjectRelease();

  return v9[0];
}

void sub_10000E580()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001E1B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v75 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002030(&qword_100028EF0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v70 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v72 = (uint64_t)&v64 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v64 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v64 - v13;
  swift_getKeyPath();
  uint64_t v15 = v0 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  v79[4] = v1;
  uint64_t v16 = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v17 = v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale;
  swift_beginAccess();
  uint64_t v71 = v17;
  sub_10000829C(v17, (uint64_t)v14);
  uint64_t v73 = v3;
  uint64_t v18 = v3 + 48;
  id v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  unsigned int v20 = v19(v14, 1, v2);
  sub_100006C7C((uint64_t)v14, &qword_100028EF0);
  if (v20 == 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  swift_getKeyPath();
  v79[1] = v1;
  sub_10001E1D8();
  swift_release();
  uint64_t v14 = (char *)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale);
  swift_beginAccess();
  sub_10000829C((uint64_t)v14, (uint64_t)v12);
  unsigned int v21 = v19(v12, 1, v2);
  sub_100006C7C((uint64_t)v12, &qword_100028EF0);
  if (v21 == 1)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  swift_getKeyPath();
  v79[0] = v1;
  sub_10001E1D8();
  swift_release();
  uint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus);
  uint64_t v68 = v15;
  uint64_t v74 = v16;
  if (v22 && (id v23 = [v22 cachedStatus]) != 0)
  {
    uint64_t v24 = v23;
    sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
    uint64_t v25 = sub_10001E858();

    unint64_t v26 = v25;
  }
  else
  {
    unint64_t v26 = (unint64_t)&_swiftEmptyArrayStorage;
  }
  v76 = (char *)v26;
  if (!(v26 >> 62))
  {
    uint64_t v27 = *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
LABEL_34:
  swift_bridgeObjectRetain();
  unint64_t v26 = (unint64_t)v76;
  uint64_t v27 = sub_10001EA78();
LABEL_9:
  uint64_t v77 = v2;
  uint64_t v69 = v1;
  v66 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v19;
  uint64_t v67 = v18;
  v65 = v14;
  if (v27)
  {
    if (v27 < 1)
    {
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v28 = 0;
    unint64_t v29 = v26 & 0xC000000000000001;
    uint64_t v30 = (void (**)(char *, uint64_t))(v73 + 8);
    uint64_t v31 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if (v29) {
        id v32 = (id)sub_10001EA38();
      }
      else {
        id v32 = *(id *)(v26 + 8 * v28 + 32);
      }
      uint64_t v33 = v32;
      if ([v32 status] == (id)2)
      {
        id v34 = [v33 locale];
        uint64_t v35 = v75;
        sub_10001E198();

        uint64_t v36 = sub_10001E168();
        uint64_t v38 = v37;
        (*v30)(v35, v77);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v31 = sub_1000119EC(0, *((void *)v31 + 2) + 1, 1, v31);
        }
        unint64_t v40 = *((void *)v31 + 2);
        unint64_t v39 = *((void *)v31 + 3);
        if (v40 >= v39 >> 1) {
          uint64_t v31 = sub_1000119EC((char *)(v39 > 1), v40 + 1, 1, v31);
        }
        *((void *)v31 + 2) = v40 + 1;
        uint64_t v41 = &v31[16 * v40];
        *((void *)v41 + 4) = v36;
        *((void *)v41 + 5) = v38;
        unint64_t v26 = (unint64_t)v76;
      }
      else
      {
      }
      ++v28;
    }
    while (v27 != v28);
  }
  else
  {
    uint64_t v31 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease_n();
  uint64_t v42 = sub_100015730((uint64_t)v31);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  uint64_t v44 = v69;
  *(&v64 - 2) = v69;
  *(&v64 - 1) = v42;
  v79[0] = v44;
  sub_10001E1C8();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v45 = sub_10001E758();
  __chkstk_darwin(v45);
  *(&v64 - 2) = v44;
  sub_10001E358();
  swift_release();
  sub_100002030(&qword_100029008);
  uint64_t v46 = v73;
  unint64_t v47 = (*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80);
  v76 = *(char **)(v73 + 72);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10001F640;
  swift_getKeyPath();
  v79[0] = v44;
  sub_10001E1D8();
  swift_release();
  uint64_t v49 = v72;
  sub_10000829C(v71, v72);
  uint64_t v50 = v77;
  uint64_t v51 = v66;
  if (v66(v49, 1, v77) == 1)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  unint64_t v52 = v48 + v47;
  uint64_t v53 = *(void (**)(unint64_t, uint64_t, uint64_t))(v46 + 32);
  v53(v52, v49, v50);
  swift_getKeyPath();
  v79[0] = v44;
  sub_10001E1D8();
  swift_release();
  uint64_t v54 = v70;
  sub_10000829C((uint64_t)v65, v70);
  if (v51(v54, 1, v50) == 1)
  {
LABEL_37:
    __break(1u);
    return;
  }
  v53((unint64_t)&v76[v52], v54, v50);
  uint64_t v55 = self;
  Class isa = sub_10001E848().super.isa;
  [v55 addLanguages:isa useCellular:0];

  if (qword_100028C48 != -1) {
    swift_once();
  }
  uint64_t v57 = sub_10001E2C8();
  sub_10000774C(v57, (uint64_t)qword_100029EB8);
  swift_bridgeObjectRetain();
  uint64_t v58 = sub_10001E2A8();
  os_log_type_t v59 = sub_10001E948();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    v79[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v60 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_10001E868();
    unint64_t v63 = v62;
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_100011AFC(v61, v63, v79);
    sub_10001E9A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "User approved downloads; requested download of: %{public}s",
      v60,
      0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10000EEA8()
{
  return swift_release();
}

Swift::Void __swiftcall LanguageSupportRemoteModel.cancel()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100002030(&qword_100028EF0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v139 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v155 = (uint64_t)&v139 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v139 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v139 - v11;
  uint64_t v13 = sub_10001E1B8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v142 = (char *)&v139 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  id v19 = (char *)&v139 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v143 = (char *)&v139 - v21;
  __chkstk_darwin(v20);
  v145 = (char *)&v139 - v22;
  swift_getKeyPath();
  id v23 = &v0[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar];
  v162[1] = (uint64_t)v1;
  uint64_t v24 = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  v148 = v23;
  sub_10001E1D8();
  swift_release();
  uint64_t v25 = (uint64_t)&v1[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__sourceLocale];
  swift_beginAccess();
  uint64_t v153 = v25;
  sub_10000829C(v25, (uint64_t)v12);
  uint64_t v27 = (void (*)(char *, char *, uint64_t))(v14 + 48);
  unint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  unsigned int v28 = v26(v12, 1, v13);
  v146 = v1;
  uint64_t v147 = v24;
  uint64_t v144 = v14;
  if (v28 == 1)
  {
    uint64_t v10 = v12;
LABEL_5:
    v156 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v26;
    sub_100006C7C((uint64_t)v10, &qword_100028EF0);
    if (qword_100028C48 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_10001E2C8();
    sub_10000774C(v34, (uint64_t)qword_100029EB8);
    uint64_t v35 = v146;
    uint64_t v36 = sub_10001E2A8();
    int v37 = sub_10001E938();
    if (os_log_type_enabled(v36, (os_log_type_t)v37))
    {
      LODWORD(v150) = v37;
      v151 = v36;
      uint64_t v38 = v27;
      uint64_t v39 = v13;
      uint64_t v40 = swift_slowAlloc();
      v152 = (char *)swift_slowAlloc();
      v162[0] = (uint64_t)v152;
      *(_DWORD *)uint64_t v40 = 136315394;
      swift_getKeyPath();
      v161[0] = (uint64_t)v35;
      sub_10001E1D8();
      swift_release();
      uint64_t v41 = v155;
      sub_10000829C(v153, v155);
      v154 = v38;
      if (v156(v41, 1, v39))
      {
        sub_100006C7C(v41, &qword_100028EF0);
        uint64_t v42 = 0;
        uint64_t v43 = 0;
      }
      else
      {
        uint64_t v72 = v144;
        (*(void (**)(char *, uint64_t, uint64_t))(v144 + 16))(v19, v41, v39);
        sub_100006C7C(v41, &qword_100028EF0);
        uint64_t v42 = sub_10001E168();
        uint64_t v43 = v73;
        (*(void (**)(char *, uint64_t))(v72 + 8))(v19, v39);
      }
      v161[0] = v42;
      v161[1] = v43;
      sub_100002030(&qword_100029000);
      uint64_t v74 = sub_10001E808();
      v161[0] = sub_100011AFC(v74, v75, v162);
      sub_10001E9A8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v40 + 12) = 2080;
      swift_getKeyPath();
      v161[0] = (uint64_t)v35;
      sub_10001E1D8();
      swift_release();
      uint64_t v76 = (uint64_t)&v35[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale];
      swift_beginAccess();
      sub_10000829C(v76, (uint64_t)v5);
      if (v156((uint64_t)v5, 1, v39))
      {
        sub_100006C7C((uint64_t)v5, &qword_100028EF0);
        uint64_t v77 = 0;
        uint64_t v78 = 0;
      }
      else
      {
        uint64_t v79 = v144;
        (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v19, v5, v39);
        sub_100006C7C((uint64_t)v5, &qword_100028EF0);
        uint64_t v77 = sub_10001E168();
        uint64_t v78 = v80;
        (*(void (**)(char *, uint64_t))(v79 + 8))(v19, v39);
      }
      v81 = v151;
      os_log_type_t v82 = v150;
      uint64_t v157 = v77;
      uint64_t v158 = v78;
      uint64_t v83 = sub_10001E808();
      uint64_t v157 = sub_100011AFC(v83, v84, v162);
      sub_10001E9A8();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v81, v82, "Unable to cancel downloads because unexpectedly have nil source or target locale when trying to cancel downloads, which shouldn't happen; source: %s; target: %s",
        (uint8_t *)v40,
        0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  v152 = v5;
  unint64_t v29 = (v14 + 32);
  v154 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v154(v145, v12, v13);
  swift_getKeyPath();
  uint64_t v30 = (void (*)(void, void, void))(v14 + 48);
  v161[0] = (uint64_t)v1;
  uint64_t v31 = v26;
  sub_10001E1D8();
  uint64_t v27 = (void (*)(char *, char *, uint64_t))v30;
  swift_release();
  id v32 = &v1[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__targetLocale];
  swift_beginAccess();
  uint64_t v33 = (uint64_t)v32;
  unint64_t v26 = v31;
  sub_10000829C(v33, (uint64_t)v10);
  if (v31(v10, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v144 + 8))(v145, v13);
    uint64_t v5 = v152;
    goto LABEL_5;
  }
  uint64_t v44 = v143;
  v151 = v29;
  v154(v143, v10, v13);
  sub_100002030(&qword_100029008);
  uint64_t v45 = v144;
  uint64_t v46 = *(void *)(v144 + 72);
  unint64_t v47 = (*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10001F640;
  uint64_t v140 = v48;
  unint64_t v150 = v47;
  unint64_t v49 = v48 + v47;
  uint64_t v50 = *(void (**)(unint64_t, char *, uint64_t))(v45 + 16);
  v50(v48 + v47, v145, v13);
  uint64_t v155 = v46;
  v152 = (char *)v50;
  uint64_t v153 = v45 + 16;
  v50(v49 + v46, v44, v13);
  swift_getKeyPath();
  v161[0] = (uint64_t)v1;
  sub_10001E1D8();
  swift_release();
  uint64_t v51 = *(void **)&v1[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__languageStatus];
  v156 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v13;
  uint64_t v52 = v45;
  if (!v51 || (id v53 = [v51 cachedStatus]) == 0)
  {
    v149 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_37;
  }
  uint64_t v54 = v53;
  sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
  unint64_t v55 = sub_10001E858();

  if (v55 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_10001EA78();
    if (v56) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v56 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v56)
    {
LABEL_15:
      if (v56 < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v57 = 0;
      unint64_t v58 = v55 & 0xC000000000000001;
      v141 = (void (**)(char *, uint64_t))(v52 + 8);
      v149 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v59 = &LanguageSupportRemoteModel;
      do
      {
        if (v58) {
          id v60 = (id)sub_10001EA38();
        }
        else {
          id v60 = *(id *)(v55 + 8 * v57 + 32);
        }
        uint64_t v61 = v60;
        if ([v60 (SEL)v59[233].count] == (id)2)
        {
          unint64_t v62 = v55;
          id v63 = [v61 locale];
          sub_10001E198();

          uint64_t v64 = sub_10001E168();
          uint64_t v66 = v65;
          (*v141)(v19, v13);

          uint64_t v67 = v149;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v67 = sub_1000119EC(0, *((void *)v67 + 2) + 1, 1, v67);
          }
          v149 = v67;
          unint64_t v69 = *((void *)v67 + 2);
          unint64_t v68 = *((void *)v67 + 3);
          if (v69 >= v68 >> 1) {
            v149 = sub_1000119EC((char *)(v68 > 1), v69 + 1, 1, v149);
          }
          uint64_t v70 = v149;
          *((void *)v149 + 2) = v69 + 1;
          uint64_t v71 = &v70[16 * v69];
          *((void *)v71 + 4) = v64;
          *((void *)v71 + 5) = v66;
          uint64_t v13 = (uint64_t)v156;
          unint64_t v55 = v62;
          os_log_type_t v59 = &LanguageSupportRemoteModel;
        }
        else
        {
        }
        ++v57;
      }
      while (v56 != v57);
      goto LABEL_36;
    }
  }
  v149 = (char *)&_swiftEmptyArrayStorage;
LABEL_36:
  swift_bridgeObjectRelease_n();
  uint64_t v52 = v144;
  uint64_t v1 = v146;
LABEL_37:
  int64_t v85 = *(void *)(v140 + 16);
  v86 = &_swiftEmptyArrayStorage;
  v141 = (void (**)(char *, uint64_t))v85;
  if (v85)
  {
    v161[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_1000123B4(0, v85, 0);
    do
    {
      v87 = v156;
      ((void (*)(char *, unint64_t, unsigned int (*)(uint64_t, uint64_t, uint64_t)))v152)(v19, v49, v156);
      uint64_t v88 = sub_10001E168();
      uint64_t v90 = v89;
      (*(void (**)(char *, unsigned int (*)(uint64_t, uint64_t, uint64_t)))(v52 + 8))(v19, v87);
      v86 = (void *)v161[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000123B4(0, v86[2] + 1, 1);
        v86 = (void *)v161[0];
      }
      unint64_t v92 = v86[2];
      unint64_t v91 = v86[3];
      if (v92 >= v91 >> 1)
      {
        sub_1000123B4(v91 > 1, v92 + 1, 1);
        v86 = (void *)v161[0];
      }
      v86[2] = v92 + 1;
      v93 = (char *)&v86[2 * v92];
      *((void *)v93 + 4) = v88;
      *((void *)v93 + 5) = v90;
      v49 += v155;
      --v85;
    }
    while (v85);
    uint64_t v13 = (uint64_t)v156;
    uint64_t v1 = v146;
  }
  uint64_t v94 = sub_100015730((uint64_t)v86);
  swift_bridgeObjectRelease();
  v162[0] = v94;
  swift_getKeyPath();
  v161[0] = (uint64_t)v1;
  sub_10001E1D8();
  swift_release();
  uint64_t v95 = swift_bridgeObjectRetain();
  sub_100013210(v95);
  swift_bridgeObjectRelease();
  if (*(void *)(v162[0] + 16) && (uint64_t v96 = *((void *)v149 + 2)) != 0)
  {
    v97 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      uint64_t v98 = *(v97 - 1);
      uint64_t v99 = *v97;
      swift_bridgeObjectRetain();
      sub_1000133B8(v98, v99);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v97 += 2;
      --v96;
    }
    while (v96);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v100 = v162[0];
  int64_t v101 = *(void *)(v162[0] + 16);
  v102 = &_swiftEmptyArrayStorage;
  if (v101)
  {
    v161[0] = (uint64_t)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100012394(0, v101, 0);
    v102 = (void *)v161[0];
    int64_t v103 = sub_1000154A4(v100);
    int v105 = v104;
    char v107 = v106 & 1;
    uint64_t v153 = v100 + 56;
    v108 = v142;
    while ((v103 & 0x8000000000000000) == 0 && v103 < 1 << *(unsigned char *)(v100 + 32))
    {
      if (((*(void *)(v153 + (((unint64_t)v103 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v103) & 1) == 0) {
        goto LABEL_73;
      }
      if (*(_DWORD *)(v100 + 36) != v105) {
        goto LABEL_74;
      }
      swift_bridgeObjectRetain();
      sub_10001E148();
      v161[0] = (uint64_t)v102;
      unint64_t v110 = v102[2];
      unint64_t v109 = v102[3];
      if (v110 >= v109 >> 1)
      {
        sub_100012394(v109 > 1, v110 + 1, 1);
        v102 = (void *)v161[0];
      }
      v102[2] = v110 + 1;
      uint64_t v111 = (uint64_t)v102 + v150 + v110 * v155;
      uint64_t v13 = (uint64_t)v156;
      v154((char *)v111, v108, (uint64_t)v156);
      int64_t v112 = sub_100015544(v103, v105, v107 & 1, v100);
      int64_t v103 = v112;
      int v105 = v113;
      char v107 = v114 & 1;
      if (!--v101)
      {
        sub_1000157D0(v112, v113, v114 & 1);
        swift_bridgeObjectRelease();
        goto LABEL_61;
      }
    }
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
  }
  else
  {
LABEL_61:
    v115 = &LanguageSupportRemoteModel;
    if ((void (**)(char *, uint64_t))v102[2] == v141)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100028C48 != -1) {
        swift_once();
      }
      uint64_t v116 = sub_10001E2C8();
      sub_10000774C(v116, (uint64_t)qword_100029EB8);
      swift_bridgeObjectRetain();
      v117 = sub_10001E2A8();
      os_log_type_t v118 = sub_10001E908();
      if (os_log_type_enabled(v117, v118))
      {
        uint64_t v119 = swift_slowAlloc();
        v161[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v119 = 136446466;
        swift_bridgeObjectRetain();
        v120 = v156;
        uint64_t v121 = sub_10001E868();
        unint64_t v123 = v122;
        swift_bridgeObjectRelease();
        uint64_t v157 = sub_100011AFC(v121, v123, v161);
        sub_10001E9A8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v119 + 12) = 2082;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v124 = sub_10001E8E8();
        unint64_t v126 = v125;
        swift_bridgeObjectRelease();
        uint64_t v160 = sub_100011AFC(v124, v126, v161);
        v115 = &LanguageSupportRemoteModel;
        sub_10001E9A8();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v117, v118, "User wants to cancel downloads; some languages are already installed so not removing all languages; languages "
          "shown: %{public}s; languages to remove: %{public}s",
          (uint8_t *)v119,
          0x16u);
        swift_arrayDestroy();
        uint64_t v13 = (uint64_t)v120;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();

        uint64_t v13 = (uint64_t)v156;
      }
    }
    if (v115[393].count == -1) {
      goto LABEL_69;
    }
  }
  swift_once();
LABEL_69:
  uint64_t v127 = sub_10001E2C8();
  sub_10000774C(v127, (uint64_t)qword_100029EB8);
  v128 = sub_10001E2A8();
  os_log_type_t v129 = sub_10001E948();
  if (os_log_type_enabled(v128, v129))
  {
    v130 = (uint8_t *)swift_slowAlloc();
    uint64_t v160 = swift_slowAlloc();
    *(_DWORD *)v130 = 136446210;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v131 = sub_10001E8E8();
    unint64_t v133 = v132;
    swift_bridgeObjectRelease();
    uint64_t v159 = sub_100011AFC(v131, v133, &v160);
    sub_10001E9A8();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v128, v129, "User cancelled downloads; requesting removal of: %{public}s",
      v130,
      0xCu);
    swift_arrayDestroy();
    uint64_t v13 = (uint64_t)v156;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v134 = v144;
  v135 = v145;
  v136 = self;
  Class isa = sub_10001E848().super.isa;
  swift_bridgeObjectRelease();
  [v136 removeLanguages:isa];

  sub_10000B9A4();
  v138 = *(void (**)(char *, uint64_t))(v134 + 8);
  v138(v143, v13);
  v138(v135, v13);
  swift_bridgeObjectRelease();
}

uint64_t LanguageSupportRemoteModel.preflightChecker(_:continueCheckingFrom:for:completion:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  return sub_100015DE0(a2, a3, a4, a5);
}

void sub_10001027C(uint64_t a1, void *a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    sub_10000D1A0(a2);
    if (a3 == 2)
    {
      uint64_t KeyPath = swift_getKeyPath();
      __chkstk_darwin(KeyPath);
      sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
    }
    else if (a3 == 1)
    {
      uint64_t v7 = swift_getKeyPath();
      __chkstk_darwin(v7);
      sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
    }
    else
    {
      if (a3)
      {
        sub_10001EA68();
        __break(1u);
        return;
      }
      uint64_t v9 = swift_getKeyPath();
      __chkstk_darwin(v9);
      sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
      sub_10001E1C8();
      swift_release();
      uint64_t v10 = swift_getKeyPath();
      __chkstk_darwin(v10);
    }
    sub_10001E1C8();
    swift_release();
  }
}

uint64_t sub_100010604(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100010718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_10001E108();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id LanguageSupportRemoteModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSupportRemoteModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t LanguageSupportRemoteModel.startRequest(configuration:)(void *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_100002030(&qword_100029018);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028C50 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10001E2C8();
  sub_10000774C(v7, (uint64_t)qword_100029ED0);
  id v8 = a1;
  uint64_t v9 = sub_10001E2A8();
  os_log_type_t v10 = sub_10001E948();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v6;
    uint64_t v13 = (void *)v12;
    *(_DWORD *)uint64_t v11 = 138543362;
    id v23 = v8;
    id v14 = v8;
    sub_10001E9A8();
    *uint64_t v13 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "UI extension received request for configuration: %{public}@", v11, 0xCu);
    sub_100002030(&qword_100029030);
    swift_arrayDestroy();
    id v6 = v22;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_10000D1A0(v8);
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  *(&v21 - 3) = 0;
  *(&v21 - 2) = 0;
  *(&v21 - 4) = (uint64_t)v2;
  id v23 = v2;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1C8();
  swift_release();
  uint64_t v16 = sub_10001E8C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v2;
  v17[5] = v8;
  id v18 = v8;
  id v19 = v2;
  sub_10000B7D4((uint64_t)v6, (uint64_t)&unk_100029028, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_100010C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 128) = a4;
  *(void *)(v5 + 136) = a5;
  return _swift_task_switch(sub_100010C58, 0, 0);
}

uint64_t sub_100010C58()
{
  uint64_t v1 = v0[16];
  swift_getKeyPath();
  v0[15] = v1;
  v0[18] = OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel___observationRegistrar;
  v0[19] = sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  objc_super v2 = *(void **)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__xpcConnection);
  if (v2
    && (id v3 = [v2 remoteObjectProxy],
        sub_10001E9C8(),
        swift_unknownObjectRelease(),
        sub_100002030(&qword_100029150),
        (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v5 = v0[16];
    uint64_t v4 = v0[17];
    v0[20] = v0[15];
    swift_getKeyPath();
    v0[10] = v5;
    sub_10001E1D8();
    swift_release();
    id v6 = *(void **)(v5 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker);
    v0[21] = v6;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_100010ECC;
    uint64_t v7 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10000E318;
    v0[13] = &unk_100025438;
    v0[14] = v7;
    [v6 preflightConfiguration:v4 completion:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    id v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_100010ECC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    objc_super v2 = sub_100011270;
  }
  else {
    objc_super v2 = sub_100010FDC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100010FDC()
{
  uint64_t v1 = *(void **)(v0 + 120);

  if (qword_100028C48 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001E2C8();
  sub_10000774C(v2, (uint64_t)qword_100029EB8);
  id v3 = v1;
  uint64_t v4 = sub_10001E2A8();
  os_log_type_t v5 = sub_10001E948();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)id v6 = 138543362;
    *(void *)(v0 + 80) = v3;
    id v7 = v3;
    sub_10001E9A8();
    void *v15 = v3;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Finished preflight configuration with configuration: %{public}@", v6, 0xCu);
    sub_100002030(&qword_100029030);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v8 = *(void **)(v0 + 160);
  uint64_t v9 = *(void *)(v0 + 128);
  swift_getKeyPath();
  uint64_t v10 = swift_task_alloc();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v3;
  *(void *)(v0 + 80) = v9;
  id v11 = v3;
  sub_10001E1C8();

  swift_release();
  swift_task_dealloc();
  id v12 = v11;
  [v8 didFinishWithFinalConfiguration:v12 error:0];
  swift_unknownObjectRelease();

  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_100011270()
{
  uint64_t v1 = (void *)v0[21];
  swift_willThrow();

  if (qword_100028C48 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001E2C8();
  sub_10000774C(v2, (uint64_t)qword_100029EB8);
  swift_errorRetain();
  id v3 = sub_10001E2A8();
  os_log_type_t v4 = sub_10001E928();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 138412290;
    uint64_t v7 = sub_10001E108();
    v0[10] = v7;
    sub_10001E9A8();
    *id v6 = v7;
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed preflight configuration with error: %@", v5, 0xCu);
    sub_100002030(&qword_100029030);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
  }
  id v8 = (void *)v0[20];

  uint64_t v9 = (void *)sub_10001E108();
  [v8 didFinishWithFinalConfiguration:0 error:v9];

  swift_unknownObjectRelease();
  swift_errorRelease();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

Swift::Bool __swiftcall LanguageSupportRemoteModel.shouldAccept(connection:)(NSXPCConnection connection)
{
  [(objc_class *)connection.super.isa setExportedObject:v1];
  id v3 = self;
  os_log_type_t v4 = [v3 interfaceWithProtocol:&OBJC_PROTOCOL____TtP21TranslationAPISupport32LanguageSupportXPCRemoteProtocol_];
  [(objc_class *)connection.super.isa setExportedInterface:v4];
  id v5 = [v3 interfaceWithProtocol:&OBJC_PROTOCOL____TtP21TranslationAPISupport30LanguageSupportXPCHostProtocol_];
  [(objc_class *)connection.super.isa setRemoteObjectInterface:v5];

  [(objc_class *)connection.super.isa resume];
  swift_getKeyPath();
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  id v6 = connection.super.isa;
  sub_10001E1C8();
  swift_release();

  if (qword_100028C50 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10001E2C8();
  sub_10000774C(v7, (uint64_t)qword_100029ED0);
  id v8 = sub_10001E2A8();
  os_log_type_t v9 = sub_10001E918();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Remote Connection established", v10, 2u);
    swift_slowDealloc();
    id v11 = v4;
  }
  else
  {
    id v11 = v8;
    id v8 = v4;
  }

  return 1;
}

uint64_t sub_100011790(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_100016C7C(0, (unint64_t *)&qword_100028EA0);
    uint64_t v2 = sub_10001E858();
  }
  swift_retain();
  v3(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100011818(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  os_log_type_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000118F4;
  return v6(a1);
}

uint64_t sub_1000118F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_1000119EC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100002030(&qword_100029178);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001563C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100011AFC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100011BD0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100017034((uint64_t)v12, *a3);
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
      sub_100017034((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007A70((uint64_t)v12);
  return v7;
}

uint64_t sub_100011BD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001E9B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100011D8C(a5, a6);
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
  uint64_t v8 = sub_10001EA48();
  if (!v8)
  {
    sub_10001EA58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001EA88();
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

uint64_t sub_100011D8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100011E24(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100012004(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100012004(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100011E24(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100011F9C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001EA28();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001EA58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001E838();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001EA88();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001EA58();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100011F9C(uint64_t a1, uint64_t a2)
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
  sub_100002030(&qword_100029198);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100012004(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002030(&qword_100029198);
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
  uint64_t result = sub_10001EA88();
  __break(1u);
  return result;
}

void *sub_100012154(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return &_swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    size_t v11 = &_swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(sub_10001E1B8() - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      id v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_100002030(&qword_100029008);
  uint64_t v8 = *(void *)(sub_10001E1B8() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  size_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = (void *)sub_10001EA88();
  __break(1u);
  return result;
}

uint64_t sub_100012394(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000123D4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1000123B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100012614(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000123D4(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100002030(&qword_100029008);
  uint64_t v10 = *(void *)(sub_10001E1B8() - 8);
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
  uint64_t v16 = *(void *)(sub_10001E1B8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  id v19 = (char *)a4 + v17;
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
  uint64_t result = sub_10001EA88();
  __break(1u);
  return result;
}

uint64_t sub_100012614(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002030(&qword_100029178);
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
  uint64_t result = sub_10001EA88();
  __break(1u);
  return result;
}

uint64_t sub_100012780(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10001EAE8();
  swift_bridgeObjectRetain();
  sub_10001E818();
  Swift::Int v8 = sub_10001EB08();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10001EAB8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_10001EAB8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100012C10(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100012930()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100002030(&qword_100029190);
  uint64_t v3 = sub_10001EA08();
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
      sub_10001EAE8();
      sub_10001E818();
      uint64_t result = sub_10001EB08();
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

Swift::Int sub_100012C10(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100012930();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100012DAC();
      goto LABEL_22;
    }
    sub_100012F60();
  }
  uint64_t v11 = *v4;
  sub_10001EAE8();
  sub_10001E818();
  uint64_t result = sub_10001EB08();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10001EAB8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10001EAD8();
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
          uint64_t result = sub_10001EAB8();
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

void *sub_100012DAC()
{
  uint64_t v1 = v0;
  sub_100002030(&qword_100029190);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001E9F8();
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

uint64_t sub_100012F60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100002030(&qword_100029190);
  uint64_t v3 = sub_10001EA08();
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
    sub_10001EAE8();
    swift_bridgeObjectRetain();
    sub_10001E818();
    uint64_t result = sub_10001EB08();
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

uint64_t sub_100013210(uint64_t result)
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
    int64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1000133B8(v12, v13);
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

uint64_t sub_1000133B8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_10001EAE8();
  swift_bridgeObjectRetain();
  sub_10001E818();
  Swift::Int v6 = sub_10001EB08();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_10001EAB8() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_10001EAB8() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100012DAC();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_100013548(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_100013548(unint64_t result)
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
    uint64_t v8 = sub_10001E9E8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_10001EAE8();
        swift_bridgeObjectRetain();
        sub_10001E818();
        Swift::Int v10 = sub_10001EB08();
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

Swift::Int sub_100013710(void **a1)
{
  uint64_t v2 = *(void *)(sub_10001E1B8() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_100015628(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_1000137B8(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_1000137B8(uint64_t *a1)
{
  uint64_t v2 = sub_10001E1B8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  v169 = (char *)&v161 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v184 = (char *)&v161 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v190 = (char *)&v161 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v189 = (char *)&v161 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v172 = (char *)&v161 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v171 = (char *)&v161 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v181 = (char *)&v161 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v166 = (char *)&v161 - v19;
  __chkstk_darwin(v18);
  v165 = (char *)&v161 - v20;
  v191 = a1;
  Swift::Int v21 = a1[1];
  Swift::Int result = sub_10001EA98(v21);
  if (result >= v21)
  {
    if (v21 < 0) {
      goto LABEL_185;
    }
    if (v21) {
      return sub_100014680(0, v21, 1, v191);
    }
    return result;
  }
  if (v21 >= 0) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v21 + 1;
  }
  if (v21 < -1) {
    goto LABEL_193;
  }
  uint64_t v174 = v3;
  Swift::Int v163 = result;
  if (v21 < 2)
  {
    BOOL v27 = (char *)_swiftEmptyArrayStorage;
    unint64_t v173 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v162 = _swiftEmptyArrayStorage;
    if (v21 != 1)
    {
      unint64_t v29 = _swiftEmptyArrayStorage[2];
LABEL_152:
      uint64_t v152 = v175;
      if (v29 >= 2)
      {
        uint64_t v153 = *v191;
        do
        {
          unint64_t v154 = v29 - 2;
          if (v29 < 2) {
            goto LABEL_180;
          }
          if (!v153) {
            goto LABEL_192;
          }
          uint64_t v155 = v27;
          v156 = v27 + 32;
          uint64_t v157 = *(void *)&v27[16 * v154 + 32];
          uint64_t v158 = *(void *)&v27[16 * v29 + 24];
          sub_100014A7C(v153 + *(void *)(v174 + 72) * v157, v153 + *(void *)(v174 + 72) * *(void *)&v156[16 * v29 - 16], v153 + *(void *)(v174 + 72) * v158, v173);
          if (v152) {
            break;
          }
          if (v158 < v157) {
            goto LABEL_181;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v155 = sub_100015490((uint64_t)v155);
          }
          if (v154 >= *((void *)v155 + 2)) {
            goto LABEL_182;
          }
          uint64_t v159 = &v155[16 * v154 + 32];
          *(void *)uint64_t v159 = v157;
          *((void *)v159 + 1) = v158;
          unint64_t v160 = *((void *)v155 + 2);
          if (v29 > v160) {
            goto LABEL_183;
          }
          BOOL v27 = v155;
          memmove(&v155[16 * v29 + 16], &v155[16 * v29 + 32], 16 * (v160 - v29));
          *((void *)v155 + 2) = v160 - 1;
          unint64_t v29 = v160 - 1;
        }
        while (v160 > 2);
      }
LABEL_163:
      swift_bridgeObjectRelease();
      v162[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v24 = v23 >> 1;
    uint64_t v25 = sub_10001E878();
    *(void *)(v25 + 16) = v24;
    unint64_t v26 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v162 = (void *)v25;
    unint64_t v173 = v25 + v26;
  }
  Swift::Int v28 = 0;
  uint64_t v180 = v3 + 16;
  v192 = (void (**)(char *, uint64_t))(v3 + 8);
  v188 = (char **)(v3 + 32);
  BOOL v27 = (char *)_swiftEmptyArrayStorage;
  uint64_t v182 = v2;
  while (1)
  {
    Swift::Int v30 = v28;
    Swift::Int v31 = v28 + 1;
    if (v28 + 1 < v21)
    {
      Swift::Int v179 = v21;
      uint64_t v32 = *v191;
      Swift::Int v33 = *(void *)(v3 + 72);
      Swift::Int v183 = v28 + 1;
      uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      v34(v165, v32 + v33 * v31, v2);
      Swift::Int v170 = v30;
      uint64_t v167 = v32;
      Swift::Int v186 = v33;
      uint64_t v177 = (uint64_t)v34;
      v34(v166, v32 + v33 * v30, v2);
      uint64_t v35 = v181;
      sub_10001E1A8();
      uint64_t v36 = sub_10001E178();
      unint64_t v38 = v37;
      uint64_t v39 = *(void (**)(char *, uint64_t))(v3 + 8);
      v39(v35, v2);
      if (v38) {
        uint64_t v40 = v36;
      }
      else {
        uint64_t v40 = 0;
      }
      uint64_t v185 = v40;
      if (v38) {
        unint64_t v41 = v38;
      }
      else {
        unint64_t v41 = 0xE000000000000000;
      }
      sub_10001E1A8();
      uint64_t v42 = sub_10001E178();
      unint64_t v44 = v43;
      v187 = (char *)v39;
      v39(v35, v2);
      if (v44) {
        uint64_t v45 = v42;
      }
      else {
        uint64_t v45 = 0;
      }
      if (v44) {
        unint64_t v46 = v44;
      }
      else {
        unint64_t v46 = 0xE000000000000000;
      }
      if (v185 == v45 && v41 == v46) {
        LODWORD(v178) = 0;
      }
      else {
        LODWORD(v178) = sub_10001EAB8();
      }
      Swift::Int v21 = v179;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v47 = (void (*)(char *, uint64_t))v187;
      ((void (*)(char *, uint64_t))v187)(v166, v2);
      v47(v165, v2);
      Swift::Int v31 = v170 + 2;
      if (v170 + 2 >= v21)
      {
        uint64_t v3 = v174;
      }
      else
      {
        v164 = v27;
        Swift::Int v176 = v186 * v183;
        uint64_t v48 = v167;
        Swift::Int v168 = v186 * v31;
        while (1)
        {
          Swift::Int v183 = v31;
          unint64_t v49 = (void (*)(char *, uint64_t, uint64_t))v177;
          ((void (*)(char *, uint64_t, uint64_t))v177)(v171, v48 + v168, v2);
          v49(v172, v48 + v176, v2);
          uint64_t v50 = v181;
          sub_10001E1A8();
          uint64_t v51 = sub_10001E178();
          unint64_t v53 = v52;
          uint64_t v54 = (void (*)(char *, uint64_t))v187;
          ((void (*)(char *, uint64_t))v187)(v50, v2);
          uint64_t v55 = v2;
          uint64_t v56 = v53 ? v51 : 0;
          uint64_t v185 = v56;
          unint64_t v57 = v53 ? v53 : 0xE000000000000000;
          sub_10001E1A8();
          uint64_t v58 = sub_10001E178();
          unint64_t v60 = v59;
          v54(v50, v55);
          uint64_t v61 = v60 ? v58 : 0;
          unint64_t v62 = v60 ? v60 : 0xE000000000000000;
          int v63 = v185 == v61 && v57 == v62 ? 0 : sub_10001EAB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v2 = v182;
          uint64_t v64 = (void (*)(char *, uint64_t))v187;
          ((void (*)(char *, uint64_t))v187)(v172, v182);
          v64(v171, v2);
          Swift::Int v21 = v179;
          if ((v178 ^ v63)) {
            break;
          }
          Swift::Int v31 = v183 + 1;
          v48 += v186;
          if (v179 == v183 + 1)
          {
            Swift::Int v31 = v179;
            uint64_t v3 = v174;
            BOOL v27 = v164;
            goto LABEL_55;
          }
        }
        uint64_t v3 = v174;
        BOOL v27 = v164;
        Swift::Int v31 = v183;
      }
LABEL_55:
      Swift::Int v30 = v170;
      if (v178)
      {
        if (v31 < v170) {
          goto LABEL_186;
        }
        if (v170 < v31)
        {
          v164 = v27;
          uint64_t v65 = 0;
          uint64_t v66 = v186 * (v31 - 1);
          Swift::Int v67 = v31 * v186;
          Swift::Int v68 = v170;
          uint64_t v69 = v170 * v186;
          do
          {
            if (v68 != v31 + v65 - 1)
            {
              uint64_t v70 = v167;
              if (!v167) {
                goto LABEL_191;
              }
              unint64_t v71 = v167 + v69;
              uint64_t v72 = v167 + v66;
              v187 = *v188;
              ((void (*)(char *, uint64_t, uint64_t))v187)(v169, v167 + v69, v182);
              if (v69 < v66 || v71 >= v70 + v67)
              {
                uint64_t v2 = v182;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v2 = v182;
                if (v69 != v66) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              ((void (*)(uint64_t, char *, uint64_t))v187)(v72, v169, v2);
            }
            ++v68;
            --v65;
            v66 -= v186;
            v67 -= v186;
            v69 += v186;
          }
          while (v68 < v31 + v65);
          uint64_t v3 = v174;
          BOOL v27 = v164;
          Swift::Int v30 = v170;
          Swift::Int v21 = v179;
        }
      }
    }
    if (v31 < v21)
    {
      if (__OFSUB__(v31, v30)) {
        goto LABEL_184;
      }
      if (v31 - v30 < v163) {
        break;
      }
    }
LABEL_102:
    if (v31 < v30) {
      goto LABEL_179;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v183 = v31;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      BOOL v27 = sub_100015254(0, *((void *)v27 + 2) + 1, 1, v27);
    }
    unint64_t v101 = *((void *)v27 + 2);
    unint64_t v100 = *((void *)v27 + 3);
    unint64_t v29 = v101 + 1;
    if (v101 >= v100 >> 1) {
      BOOL v27 = sub_100015254((char *)(v100 > 1), v101 + 1, 1, v27);
    }
    *((void *)v27 + 2) = v29;
    v102 = v27 + 32;
    int64_t v103 = &v27[16 * v101 + 32];
    Swift::Int v104 = v183;
    *(void *)int64_t v103 = v30;
    *((void *)v103 + 1) = v104;
    if (v101)
    {
      while (1)
      {
        unint64_t v105 = v29 - 1;
        if (v29 >= 4)
        {
          unint64_t v110 = &v102[16 * v29];
          uint64_t v111 = *((void *)v110 - 8);
          uint64_t v112 = *((void *)v110 - 7);
          BOOL v116 = __OFSUB__(v112, v111);
          uint64_t v113 = v112 - v111;
          if (v116) {
            goto LABEL_168;
          }
          uint64_t v115 = *((void *)v110 - 6);
          uint64_t v114 = *((void *)v110 - 5);
          BOOL v116 = __OFSUB__(v114, v115);
          uint64_t v108 = v114 - v115;
          char v109 = v116;
          if (v116) {
            goto LABEL_169;
          }
          unint64_t v117 = v29 - 2;
          os_log_type_t v118 = &v102[16 * v29 - 32];
          uint64_t v120 = *(void *)v118;
          uint64_t v119 = *((void *)v118 + 1);
          BOOL v116 = __OFSUB__(v119, v120);
          uint64_t v121 = v119 - v120;
          if (v116) {
            goto LABEL_171;
          }
          BOOL v116 = __OFADD__(v108, v121);
          uint64_t v122 = v108 + v121;
          if (v116) {
            goto LABEL_174;
          }
          if (v122 >= v113)
          {
            uint64_t v140 = &v102[16 * v105];
            uint64_t v142 = *(void *)v140;
            uint64_t v141 = *((void *)v140 + 1);
            BOOL v116 = __OFSUB__(v141, v142);
            uint64_t v143 = v141 - v142;
            if (v116) {
              goto LABEL_178;
            }
            BOOL v133 = v108 < v143;
            goto LABEL_139;
          }
        }
        else
        {
          if (v29 != 3)
          {
            uint64_t v134 = *((void *)v27 + 4);
            uint64_t v135 = *((void *)v27 + 5);
            BOOL v116 = __OFSUB__(v135, v134);
            uint64_t v127 = v135 - v134;
            char v128 = v116;
            goto LABEL_133;
          }
          uint64_t v107 = *((void *)v27 + 4);
          uint64_t v106 = *((void *)v27 + 5);
          BOOL v116 = __OFSUB__(v106, v107);
          uint64_t v108 = v106 - v107;
          char v109 = v116;
        }
        if (v109) {
          goto LABEL_170;
        }
        unint64_t v117 = v29 - 2;
        unint64_t v123 = &v102[16 * v29 - 32];
        uint64_t v125 = *(void *)v123;
        uint64_t v124 = *((void *)v123 + 1);
        BOOL v126 = __OFSUB__(v124, v125);
        uint64_t v127 = v124 - v125;
        char v128 = v126;
        if (v126) {
          goto LABEL_173;
        }
        os_log_type_t v129 = &v102[16 * v105];
        uint64_t v131 = *(void *)v129;
        uint64_t v130 = *((void *)v129 + 1);
        BOOL v116 = __OFSUB__(v130, v131);
        uint64_t v132 = v130 - v131;
        if (v116) {
          goto LABEL_176;
        }
        if (__OFADD__(v127, v132)) {
          goto LABEL_177;
        }
        if (v127 + v132 >= v108)
        {
          BOOL v133 = v108 < v132;
LABEL_139:
          if (v133) {
            unint64_t v105 = v117;
          }
          goto LABEL_141;
        }
LABEL_133:
        if (v128) {
          goto LABEL_172;
        }
        v136 = &v102[16 * v105];
        uint64_t v138 = *(void *)v136;
        uint64_t v137 = *((void *)v136 + 1);
        BOOL v116 = __OFSUB__(v137, v138);
        uint64_t v139 = v137 - v138;
        if (v116) {
          goto LABEL_175;
        }
        if (v139 < v127) {
          goto LABEL_14;
        }
LABEL_141:
        unint64_t v144 = v105 - 1;
        if (v105 - 1 >= v29)
        {
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
LABEL_186:
          __break(1u);
LABEL_187:
          __break(1u);
          goto LABEL_188;
        }
        if (!*v191) {
          goto LABEL_190;
        }
        v145 = v27;
        v146 = &v102[16 * v144];
        uint64_t v147 = *(void *)v146;
        v148 = &v102[16 * v105];
        uint64_t v149 = *((void *)v148 + 1);
        uint64_t v150 = v175;
        sub_100014A7C(*v191 + *(void *)(v174 + 72) * *(void *)v146, *v191 + *(void *)(v174 + 72) * *(void *)v148, *v191 + *(void *)(v174 + 72) * v149, v173);
        uint64_t v175 = v150;
        if (v150) {
          goto LABEL_163;
        }
        if (v149 < v147) {
          goto LABEL_165;
        }
        if (v105 > *((void *)v145 + 2)) {
          goto LABEL_166;
        }
        *(void *)v146 = v147;
        *(void *)&v102[16 * v144 + 8] = v149;
        unint64_t v151 = *((void *)v145 + 2);
        if (v105 >= v151) {
          goto LABEL_167;
        }
        BOOL v27 = v145;
        unint64_t v29 = v151 - 1;
        memmove(&v102[16 * v105], v148 + 16, 16 * (v151 - 1 - v105));
        *((void *)v145 + 2) = v151 - 1;
        if (v151 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v29 = 1;
LABEL_14:
    Swift::Int v21 = v191[1];
    Swift::Int v28 = v183;
    uint64_t v3 = v174;
    if (v183 >= v21) {
      goto LABEL_152;
    }
  }
  if (__OFADD__(v30, v163)) {
    goto LABEL_187;
  }
  if (v30 + v163 >= v21) {
    Swift::Int v73 = v21;
  }
  else {
    Swift::Int v73 = v30 + v163;
  }
  if (v73 >= v30)
  {
    if (v31 != v73)
    {
      Swift::Int v170 = v30;
      v164 = v27;
      uint64_t v74 = *(void *)(v3 + 72);
      Swift::Int v176 = *(void *)(v3 + 16);
      uint64_t v177 = v74;
      uint64_t v75 = v74 * (v31 - 1);
      Swift::Int v76 = v31 * v74;
      Swift::Int v168 = v73;
      do
      {
        uint64_t v78 = 0;
        uint64_t v79 = (char *)v170;
        Swift::Int v183 = v31;
        Swift::Int v178 = v76;
        Swift::Int v179 = v75;
        while (1)
        {
          v187 = v79;
          uint64_t v80 = *v191;
          Swift::Int v186 = v76 + v78;
          v81 = (void (*)(char *, uint64_t, uint64_t))v176;
          ((void (*)(char *, Swift::Int, uint64_t))v176)(v189, v76 + v78 + v80, v2);
          uint64_t v185 = v75 + v78;
          v81(v190, v75 + v78 + v80, v2);
          os_log_type_t v82 = v181;
          sub_10001E1A8();
          uint64_t v83 = sub_10001E178();
          unint64_t v85 = v84;
          v86 = *v192;
          (*v192)(v82, v2);
          uint64_t v87 = v2;
          uint64_t v88 = v85 ? v83 : 0;
          unint64_t v89 = v85 ? v85 : 0xE000000000000000;
          sub_10001E1A8();
          uint64_t v90 = sub_10001E178();
          unint64_t v92 = v91;
          v86(v82, v87);
          uint64_t v93 = v92 ? v90 : 0;
          unint64_t v94 = v92 ? v92 : 0xE000000000000000;
          if (v88 == v93 && v89 == v94) {
            break;
          }
          char v95 = sub_10001EAB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v2 = v182;
          v86(v190, v182);
          v86(v189, v2);
          if ((v95 & 1) == 0) {
            goto LABEL_80;
          }
          uint64_t v96 = *v191;
          Swift::Int v76 = v178;
          uint64_t v75 = v179;
          if (!*v191) {
            goto LABEL_189;
          }
          uint64_t v97 = v96 + v179 + v78;
          uint64_t v98 = *v188;
          ((void (*)(char *, uint64_t, uint64_t))*v188)(v184, v96 + v178 + v78, v2);
          swift_arrayInitWithTakeFrontToBack();
          ((void (*)(uint64_t, char *, uint64_t))v98)(v97, v184, v2);
          v78 -= v177;
          uint64_t v79 = v187 + 1;
          Swift::Int v77 = v183;
          if ((char *)v183 == v187 + 1) {
            goto LABEL_81;
          }
        }
        swift_bridgeObjectRelease_n();
        uint64_t v2 = v182;
        v86(v190, v182);
        v86(v189, v2);
LABEL_80:
        Swift::Int v77 = v183;
        Swift::Int v76 = v178;
        uint64_t v75 = v179;
LABEL_81:
        Swift::Int v31 = v77 + 1;
        v75 += v177;
        v76 += v177;
      }
      while (v31 != v168);
      Swift::Int v31 = v168;
      BOOL v27 = v164;
      Swift::Int v30 = v170;
    }
    goto LABEL_102;
  }
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  Swift::Int result = sub_10001EA58();
  __break(1u);
  return result;
}

uint64_t sub_100014680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v58 = a4;
  uint64_t v45 = a1;
  uint64_t v6 = sub_10001E1B8();
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v55 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v49 = (char *)&v43 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v62 = (char *)&v43 - v12;
  uint64_t result = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v43 - v14;
  uint64_t v53 = a3;
  uint64_t v44 = a2;
  if (a3 != a2)
  {
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v17 = v15 + 16;
    unint64_t v46 = v18;
    unint64_t v47 = (char *)&v43 - v14;
    uint64_t v19 = *(void *)(v17 + 56);
    uint64_t v60 = v6;
    uint64_t v61 = (void (**)(char *, uint64_t))(v17 - 8);
    uint64_t v48 = v17;
    uint64_t v54 = (void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    uint64_t v20 = v19 * (v53 - 1);
    uint64_t v50 = v19;
    uint64_t v21 = v19 * v53;
    uint64_t v22 = v62;
LABEL_6:
    uint64_t v23 = 0;
    uint64_t v59 = v45;
    uint64_t v51 = v21;
    uint64_t v52 = v20;
    while (1)
    {
      uint64_t v24 = *v58;
      uint64_t v57 = v21 + v23;
      uint64_t v25 = v21 + v23 + v24;
      unint64_t v26 = v46;
      v46(v16, v25, v6);
      uint64_t v56 = v20 + v23;
      v26(v22, v20 + v23 + v24, v6);
      BOOL v27 = v49;
      sub_10001E1A8();
      uint64_t v28 = sub_10001E178();
      unint64_t v30 = v29;
      Swift::Int v31 = *v61;
      (*v61)(v27, v60);
      if (v30) {
        uint64_t v32 = v28;
      }
      else {
        uint64_t v32 = 0;
      }
      if (!v30) {
        unint64_t v30 = 0xE000000000000000;
      }
      sub_10001E1A8();
      uint64_t v33 = sub_10001E178();
      unint64_t v35 = v34;
      uint64_t v36 = v27;
      uint64_t v6 = v60;
      v31(v36, v60);
      if (v35) {
        uint64_t v37 = v33;
      }
      else {
        uint64_t v37 = 0;
      }
      if (v35) {
        unint64_t v38 = v35;
      }
      else {
        unint64_t v38 = 0xE000000000000000;
      }
      if (v32 == v37 && v30 == v38)
      {
        swift_bridgeObjectRelease_n();
        v31(v62, v6);
        uint64_t v16 = v47;
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v47, v6);
        uint64_t v21 = v51;
        uint64_t v20 = v52;
LABEL_5:
        v20 += v50;
        v21 += v50;
        if (++v53 == v44) {
          return result;
        }
        goto LABEL_6;
      }
      char v39 = sub_10001EAB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v31(v62, v6);
      uint64_t v16 = v47;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v47, v6);
      uint64_t v21 = v51;
      uint64_t v20 = v52;
      if ((v39 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v40 = *v58;
      if (!*v58) {
        break;
      }
      uint64_t v41 = v40 + v52 + v23;
      uint64_t v42 = *v54;
      (*v54)(v55, v40 + v51 + v23, v6);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v42)(v41, v55, v6);
      v23 -= v50;
      if (v53 == ++v59) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100014A7C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v86 = a4;
  uint64_t v96 = sub_10001E1B8();
  uint64_t v7 = *(void *)(v96 - 8);
  uint64_t v8 = __chkstk_darwin(v96);
  unint64_t v92 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v91 = (char *)&v83 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v93 = (char *)&v83 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v83 - v15;
  __chkstk_darwin(v14);
  uint64_t v90 = (uint64_t)&v83 - v17;
  uint64_t v19 = *(void *)(v18 + 72);
  if (!v19)
  {
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  if (a2 - a1 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_90;
  }
  int64_t v20 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_91;
  }
  uint64_t v21 = (uint64_t)(a2 - a1) / v19;
  unint64_t v99 = a1;
  unint64_t v98 = v86;
  uint64_t v22 = v20 / v19;
  if (v21 >= v20 / v19)
  {
    if ((v22 & 0x8000000000000000) == 0)
    {
      uint64_t v25 = v22 * v19;
      unint64_t v26 = v86;
      if (v86 < a2 || a2 + v25 <= v86)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v86 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v54 = v26 + v25;
      unint64_t v97 = v26 + v25;
      unint64_t v99 = a2;
      if (v25 >= 1 && a1 < a2)
      {
        uint64_t v90 = -v19;
        uint64_t v57 = *(char **)(v7 + 16);
        uint64_t v56 = v7 + 16;
        unint64_t v84 = a1;
        unint64_t v85 = v57;
        uint64_t v88 = (void (**)(char *, uint64_t))(v56 - 8);
        uint64_t v89 = v56;
        do
        {
          unint64_t v94 = a3;
          uint64_t v58 = (char *)v90;
          uint64_t v59 = v96;
          uint64_t v60 = (void (*)(char *))v85;
          ((void (*)(char *, unint64_t, uint64_t))v85)(v91, v54 + v90, v96);
          unint64_t v95 = a2;
          uint64_t v87 = &v58[a2];
          v60(v92);
          uint64_t v61 = v93;
          sub_10001E1A8();
          uint64_t v62 = sub_10001E178();
          unint64_t v64 = v63;
          uint64_t v65 = *v88;
          (*v88)(v61, v59);
          if (v64)
          {
            unint64_t v66 = v64;
          }
          else
          {
            uint64_t v62 = 0;
            unint64_t v66 = 0xE000000000000000;
          }
          sub_10001E1A8();
          uint64_t v67 = sub_10001E178();
          unint64_t v69 = v68;
          v65(v61, v59);
          if (v69) {
            uint64_t v70 = v67;
          }
          else {
            uint64_t v70 = 0;
          }
          if (v69) {
            unint64_t v71 = v69;
          }
          else {
            unint64_t v71 = 0xE000000000000000;
          }
          if (v62 == v70 && v66 == v71) {
            char v72 = 0;
          }
          else {
            char v72 = sub_10001EAB8();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v73 = v94;
          uint64_t v74 = v90;
          uint64_t v75 = (char *)(v94 + v90);
          uint64_t v76 = v96;
          v65(v92, v96);
          v65(v91, v76);
          if (v72)
          {
            if (v73 < v95 || (unint64_t)v75 >= v95)
            {
              uint64_t v79 = (void (*)(void, void, void))v87;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v78 = v86;
              unint64_t v80 = v84;
            }
            else
            {
              BOOL v77 = v73 == v95;
              unint64_t v78 = v86;
              uint64_t v79 = (void (*)(void, void, void))v87;
              unint64_t v80 = v84;
              if (!v77) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v99 += v74;
          }
          else
          {
            unint64_t v81 = v97;
            v97 += v74;
            uint64_t v79 = (void (*)(void, void, void))v95;
            if (v73 < v81 || (unint64_t)v75 >= v81)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v78 = v86;
            }
            else
            {
              unint64_t v78 = v86;
              if (v73 != v81) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v80 = v84;
          }
          unint64_t v54 = v97;
          if (v97 <= v78) {
            break;
          }
          a2 = (unint64_t)v79;
          a3 = (unint64_t)v75;
        }
        while ((unint64_t)v79 > v80);
      }
LABEL_88:
      sub_100015350(&v99, &v98, (uint64_t *)&v97);
      return 1;
    }
  }
  else if ((v21 & 0x8000000000000000) == 0)
  {
    uint64_t v23 = v21 * v19;
    unint64_t v24 = v86;
    if (v86 < a1 || a1 + v23 <= v86)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v86 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v91 = (char *)(v24 + v23);
    unint64_t v97 = v24 + v23;
    if (v23 >= 1 && a2 < a3)
    {
      unint64_t v28 = v24;
      unint64_t v30 = *(char **)(v7 + 16);
      uint64_t v29 = v7 + 16;
      uint64_t v87 = v30;
      uint64_t v88 = (void (**)(char *, uint64_t))v19;
      unint64_t v92 = (char *)(v29 - 8);
      uint64_t v89 = v29;
      unint64_t v94 = a3;
      unint64_t v85 = v16;
      uint64_t v31 = v96;
      uint64_t v32 = (void (**)(char *, uint64_t))(v29 - 8);
      while (1)
      {
        unint64_t v95 = a2;
        unint64_t v33 = a2;
        unint64_t v34 = v87;
        ((void (*)(uint64_t, unint64_t, uint64_t))v87)(v90, v33, v31);
        ((void (*)(char *, unint64_t, uint64_t))v34)(v16, v28, v31);
        unint64_t v35 = v93;
        sub_10001E1A8();
        uint64_t v36 = sub_10001E178();
        unint64_t v38 = v37;
        char v39 = *v32;
        (*v32)(v35, v31);
        uint64_t v40 = v38 ? v36 : 0;
        unint64_t v41 = v38 ? v38 : 0xE000000000000000;
        sub_10001E1A8();
        uint64_t v42 = sub_10001E178();
        unint64_t v44 = v43;
        v39(v35, v31);
        uint64_t v45 = v44 ? v42 : 0;
        unint64_t v46 = v44 ? v44 : 0xE000000000000000;
        if (v40 == v45 && v41 == v46) {
          break;
        }
        char v47 = sub_10001EAB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v16 = v85;
        v39(v85, v31);
        v39((char *)v90, v31);
        if ((v47 & 1) == 0) {
          goto LABEL_43;
        }
        unint64_t v48 = v99;
        unint64_t v49 = v94;
        uint64_t v50 = v88;
        unint64_t v51 = (unint64_t)v88 + v95;
        if (v99 < v95 || v99 >= v51)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v99 == v95)
        {
          unint64_t v48 = v95;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_49:
        unint64_t v99 = (unint64_t)v50 + v48;
        unint64_t v28 = v98;
        if (v98 < (unint64_t)v91)
        {
          a2 = v51;
          if (v51 < v49) {
            continue;
          }
        }
        goto LABEL_88;
      }
      swift_bridgeObjectRelease_n();
      uint64_t v16 = v85;
      v39(v85, v31);
      v39((char *)v90, v31);
LABEL_43:
      unint64_t v48 = v99;
      uint64_t v50 = v88;
      unint64_t v52 = (unint64_t)v88 + v98;
      unint64_t v49 = v94;
      unint64_t v53 = v95;
      if (v99 < v98 || v99 >= v52)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v99 != v98)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v98 = v52;
      unint64_t v51 = v53;
      goto LABEL_49;
    }
    goto LABEL_88;
  }
LABEL_92:
  uint64_t result = sub_10001EA88();
  __break(1u);
  return result;
}

char *sub_100015254(char *result, int64_t a2, char a3, char *a4)
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
    sub_100002030(&qword_100029108);
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

uint64_t sub_100015350(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_10001E1B8();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_10001EA88();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_100015490(uint64_t a1)
{
  return sub_100015254(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000154A4(uint64_t a1)
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

int64_t sub_100015544(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_100015628(void *a1)
{
  return sub_1000123D4(0, a1[2], 0, a1);
}

uint64_t sub_10001563C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10001EA88();
  __break(1u);
  return result;
}

uint64_t sub_100015730(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_10001E8F8();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100012780(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1000157D0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000157DC(unint64_t a1)
{
  if (a1 < 4) {
    return 0x20100u >> (8 * a1);
  }
  sub_10001EA18(38);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = sub_10001EAA8();
  sub_10001E828(v2);
  swift_bridgeObjectRelease();
  uint64_t result = sub_10001EA68();
  __break(1u);
  return result;
}

uint64_t sub_1000158B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  Swift::Int v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)v31 - v8;
  uint64_t v10 = sub_10001E1B8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v37 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v40 = (char *)v31 - v15;
  uint64_t result = __chkstk_darwin(v14);
  char v47 = (char *)v31 - v17;
  uint64_t v50 = _swiftEmptyArrayStorage;
  uint64_t v36 = *(void *)(a1 + 16);
  if (v36)
  {
    unint64_t v18 = 0;
    uint64_t v43 = v11 + 48;
    uint64_t v44 = v11 + 16;
    unint64_t v49 = (void (**)(char *, char *, uint64_t))(v11 + 32);
    unint64_t v41 = (uint64_t (**)(char *, uint64_t))(v11 + 8);
    uint64_t v46 = v11 + 56;
    v31[1] = (v11 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v33 = a2;
    unint64_t v34 = v9;
    uint64_t v35 = a1;
    uint64_t v32 = v11;
    uint64_t v19 = v40;
    while (v18 < *(void *)(a1 + 16))
    {
      unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      unint64_t v38 = v18;
      unint64_t v39 = v20;
      uint64_t v45 = *(void *)(v11 + 72);
      uint64_t v42 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
      v42(v9, a1 + v20 + v45 * v18, v10);
      uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      v21(v9, 0, 1, v10);
      uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
      if (v22(v9, 1, v10) == 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      unint64_t v48 = *v49;
      v48(v47, v9, v10);
      uint64_t v23 = a2;
      uint64_t v24 = *(void *)(a2 + 16);
      if (v24)
      {
        unint64_t v25 = v23 + v39;
        swift_bridgeObjectRetain();
        while (1)
        {
          v42(v7, v25, v10);
          v21(v7, 0, 1, v10);
          if (v22(v7, 1, v10) == 1) {
            break;
          }
          v48(v19, v7, v10);
          sub_100016D04(&qword_100029110, (void (*)(uint64_t))&type metadata accessor for Locale);
          char v26 = sub_10001E798();
          BOOL v27 = *v41;
          (*v41)(v19, v10);
          if (v26)
          {
            a2 = v33;
            swift_bridgeObjectRelease();
            uint64_t result = v27(v47, v10);
            goto LABEL_4;
          }
          v25 += v45;
          if (!--v24) {
            goto LABEL_14;
          }
        }
      }
      else
      {
        swift_bridgeObjectRetain();
LABEL_14:
        v21(v7, 1, 1, v10);
      }
      a2 = v33;
      swift_bridgeObjectRelease();
      v48(v37, v47, v10);
      unint64_t v28 = v50;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100012394(0, v28[2] + 1, 1);
        unint64_t v28 = v50;
      }
      unint64_t v30 = v28[2];
      unint64_t v29 = v28[3];
      if (v30 >= v29 >> 1)
      {
        sub_100012394(v29 > 1, v30 + 1, 1);
        unint64_t v28 = v50;
      }
      v28[2] = v30 + 1;
      uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v48)((char *)v28 + v39 + v30 * v45, v37, v10);
      uint64_t v50 = v28;
LABEL_4:
      unint64_t v18 = v38 + 1;
      a1 = v35;
      unint64_t v9 = v34;
      uint64_t v11 = v32;
      if (v38 + 1 == v36) {
        goto LABEL_22;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
LABEL_22:
    v21(v9, 1, 1, v10);
    swift_bridgeObjectRelease();
LABEL_23:
    sub_100006C7C((uint64_t)v9, &qword_100028EF0);
    return (uint64_t)v50;
  }
  return result;
}

uint64_t sub_100015DE0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v22 = a1;
  uint64_t v9 = sub_10001E768();
  uint64_t v24 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10001E788();
  uint64_t v12 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v25 = v5;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  aBlock[0] = v5;
  sub_100016D04(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  swift_retain();
  sub_10001E1C8();
  swift_release();
  swift_release();
  sub_100016C7C(0, &qword_100029158);
  uint64_t v15 = (void *)sub_10001E978();
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v16;
  v17[3] = a2;
  v17[4] = v22;
  aBlock[4] = sub_100016CF8;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010604;
  aBlock[3] = &unk_100025478;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = a2;
  swift_release();
  sub_10001E778();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100016D04(&qword_100029160, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100002030(&qword_100029168);
  sub_100016D4C();
  sub_10001E9D8();
  sub_10001E988();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v23);
}

uint64_t sub_10001618C()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100016238;
  *(_OWORD *)(v2 + 128) = v3;
  return _swift_task_switch(sub_100010C58, 0, 0);
}

uint64_t sub_100016238()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_10001632C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000A388(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__xpcConnection, a2);
}

void sub_100016358()
{
}

unint64_t sub_10001637C()
{
  unint64_t result = qword_100029038;
  if (!qword_100029038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029038);
  }
  return result;
}

uint64_t sub_1000163D0()
{
  return type metadata accessor for LanguageSupportRemoteModel();
}

void sub_1000163D8()
{
  sub_1000164EC();
  if (v0 <= 0x3F)
  {
    sub_10001E218();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1000164EC()
{
  if (!qword_1000290F8)
  {
    sub_10001E1B8();
    unint64_t v0 = sub_10001E998();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000290F8);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for LanguageSupportRemoteModel.DownloadState(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LanguageSupportRemoteModel.Step()
{
  return &type metadata for LanguageSupportRemoteModel.Step;
}

uint64_t _s30TranslationAPISupportExtension26LanguageSupportRemoteModelC13DownloadStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s30TranslationAPISupportExtension26LanguageSupportRemoteModelC13DownloadStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000166CCLL);
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

uint64_t sub_1000166F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000166FC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LanguageSupportRemoteModel.DownloadState()
{
  return &type metadata for LanguageSupportRemoteModel.DownloadState;
}

unint64_t sub_100016718()
{
  unint64_t result = qword_100029100;
  if (!qword_100029100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029100);
  }
  return result;
}

uint64_t sub_10001676C()
{
  return sub_100016FF0();
}

uint64_t sub_100016784()
{
  return sub_10000EEA8();
}

void sub_1000167A8()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__downloadState) = *(unsigned char *)(v0 + 24);
}

id sub_1000167C0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10000A388(a1, &OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentConfiguration, a2);
}

void sub_1000167F0()
{
}

uint64_t sub_100016814()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001685C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int v8 = v2;
  v8[1] = sub_100017378;
  return sub_10000DC2C(a1, v4, v5, v7, v6);
}

void sub_100016924()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(void **)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker);
  *(void *)(v1 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__preflightChecker) = v2;
  id v4 = v2;
}

uint64_t sub_100016964()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001699C(uint64_t a1, uint64_t a2)
{
  sub_100010718(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000169A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016A0C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016A44(uint64_t a1)
{
  return sub_10000B27C(a1);
}

uint64_t sub_100016A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100016A5C()
{
  return swift_release();
}

void sub_100016A64()
{
}

uint64_t sub_100016A84()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016ACC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int v8 = v2;
  v8[1] = sub_100017378;
  return sub_10000B410(a1, v4, v5, v7, v6);
}

uint64_t sub_100016B8C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016BC4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100016238;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100029140 + dword_100029140);
  return v6(a1, v4);
}

uint64_t sub_100016C7C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100016CB8()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100016CF8()
{
  sub_10001027C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100016D04(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100016D4C()
{
  unint64_t result = qword_100029170;
  if (!qword_100029170)
  {
    sub_1000026F4(&qword_100029168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029170);
  }
  return result;
}

uint64_t sub_100016DA8()
{
  uint64_t v1 = sub_10001E1B8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  swift_unknownObjectRelease();

  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v6);
}

uint64_t sub_100016EA4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10001E1B8() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 40) & ~v5;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = (uint64_t)v1 + v6;
  uint64_t v11 = (uint64_t)v1 + ((*(void *)(v4 + 64) + v5 + v6) & ~v5);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_100017378;
  return sub_10000C008(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_100016FD0(id *a1)
{
  return sub_10000CB50(a1) & 1;
}

uint64_t sub_100016FF0()
{
  *(void *)(*(void *)(v0 + 16)
            + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedOriginallyInstalledLanguageIdentifiers) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100017034(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100017090(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_1000170CC(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_1000170FC()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)(v0[2]
                 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__cachedCheckerCompletion);
  uint64_t v4 = *v3;
  *uint64_t v3 = v1;
  v3[1] = v2;
  sub_10000D168(v1);
  return sub_10000D178(v4);
}

void sub_100017154(void *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void **)(v1 + 24);
  uint64_t v4 = *(void **)(v2 + *a1);
  *(void *)(v2 + *a1) = v3;
  id v5 = v3;
}

uint64_t sub_100017190()
{
  char v1 = *(unsigned char *)(v0 + 24);
  uint64_t v2 = (unsigned char *)(*(void *)(v0 + 16)
               + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentStep);
  uint64_t result = swift_beginAccess();
  *uint64_t v2 = v1;
  return result;
}

uint64_t sub_1000171F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017258(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000172C4(id *a1)
{
  return sub_100016FD0(a1) & 1;
}

uint64_t sub_1000172F4()
{
  return sub_1000083E0();
}

uint64_t sub_10001730C()
{
  return sub_100009034();
}

uint64_t sub_100017324()
{
  return sub_100009A70();
}

uint64_t sub_10001733C()
{
  return sub_1000095A0();
}

void sub_100017354()
{
}

uint64_t sub_10001737C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for APIHelper()
{
  return self;
}

id sub_1000173B0()
{
  type metadata accessor for APIHelper();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100029EB0 = (uint64_t)result;
  return result;
}

uint64_t sub_100017404(uint64_t a1)
{
  return sub_1000174AC(a1, qword_100029EB8);
}

uint64_t *sub_100017420(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100017484(uint64_t a1)
{
  return sub_1000174AC(a1, qword_100029ED0);
}

uint64_t sub_1000174AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001E2C8();
  sub_100017420(v3, a2);
  sub_10000774C(v3, (uint64_t)a2);
  return sub_10001E2B8();
}

uint64_t property wrapper backing initializer of LowConfidenceLIDView.selection(uint64_t a1)
{
  uint64_t v2 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v2);
  sub_100006CE0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100028EF0);
  sub_10001E678();
  return sub_100006C7C(a1, &qword_100028EF0);
}

uint64_t LowConfidenceLIDView.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_100002030(&qword_100028EF0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v12 - v8;
  type metadata accessor for LowConfidenceLIDView();
  uint64_t v10 = sub_10001E1B8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_100006CE0((uint64_t)v9, (uint64_t)v7, &qword_100028EF0);
  sub_10001E678();
  uint64_t result = sub_100006C7C((uint64_t)v9, &qword_100028EF0);
  *a2 = a1;
  return result;
}

uint64_t type metadata accessor for LowConfidenceLIDView()
{
  uint64_t result = qword_100029330;
  if (!qword_100029330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LowConfidenceLIDView.body.getter()
{
  uint64_t v1 = sub_10001E4B8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100002030(&qword_1000292A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v0;
  sub_100002030(&qword_1000292B0);
  sub_100006488(&qword_1000292B8, &qword_1000292B0);
  sub_10001E548();
  sub_10001E4A8();
  sub_100006488(&qword_1000292C0, &qword_1000292A8);
  sub_10001B5CC(&qword_1000292C8, (void (*)(uint64_t))&type metadata accessor for TitleOnlyLabelStyle);
  sub_10001E5C8();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000179B4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v69 = a1;
  uint64_t v74 = a2;
  uint64_t v2 = sub_100002030(&qword_100029370);
  uint64_t v76 = *(void *)(v2 - 8);
  uint64_t v77 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v75 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v73 = (char *)&v65 - v5;
  uint64_t v6 = sub_100002030(&qword_100029378);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v72 = (uint64_t)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v82 = (uint64_t)&v65 - v9;
  uint64_t v10 = sub_100002030(&qword_100029380);
  __chkstk_darwin(v10 - 8);
  unint64_t v71 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100002030(&qword_100029388);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v80 = (uint64_t)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001E478();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100002030(&qword_100029390);
  __chkstk_darwin(v19);
  uint64_t v21 = (_OWORD *)((char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v70 = sub_100002030(&qword_100029398);
  uint64_t v78 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v23 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100002030(&qword_1000293A0) - 8;
  uint64_t v24 = __chkstk_darwin(v67);
  uint64_t v81 = (uint64_t)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  unint64_t v68 = (char *)&v65 - v27;
  __chkstk_darwin(v26);
  uint64_t v79 = (uint64_t)&v65 - v28;
  sub_10001831C(v21);
  sub_10001B350();
  uint64_t v65 = v23;
  sub_10001E6E8();
  sub_10001E468();
  uint64_t v29 = v80;
  uint64_t v30 = v80 + *(int *)(v13 + 44);
  uint64_t v66 = v16;
  uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 16);
  uint64_t v32 = v15;
  v31(v30, v18, v15);
  uint64_t v33 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
  v33(v30, 0, 1, v32);
  unint64_t v34 = v23;
  uint64_t v35 = v70;
  (*(void (**)(uint64_t, char *, uint64_t))(v78 + 16))(v29, v34, v70);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = (uint64_t)v71;
  v31((uint64_t)v71, v18, v32);
  v33(v37, 0, 1, v32);
  uint64_t v38 = (uint64_t)v68;
  unint64_t v39 = (uint64_t *)&v68[*(int *)(v67 + 44)];
  uint64_t v40 = sub_100002030(&qword_1000293F0);
  sub_100006CE0(v37, (uint64_t)v39 + *(int *)(v40 + 28), &qword_100029380);
  *unint64_t v39 = KeyPath;
  unint64_t v41 = v69;
  uint64_t v42 = v80;
  sub_100006CE0(v80, v38, &qword_100029388);
  sub_100006C7C(v37, &qword_100029380);
  sub_100006C7C(v42, &qword_100029388);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v18, v32);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v65, v35);
  uint64_t v43 = v79;
  sub_10001B55C(v38, v79);
  uint64_t v44 = *v41;
  swift_getKeyPath();
  v83[0] = v44;
  sub_10001B5CC(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v45 = v44 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales;
  swift_beginAccess();
  if (*(void *)(*(void *)v45 + 16))
  {
    v83[0] = sub_1000192E0();
    v83[1] = v46;
    char v84 = v47 & 1;
    uint64_t v85 = v48;
    __chkstk_darwin(v83[0]);
    *(&v65 - 2) = (char *)v41;
    sub_100002030(&qword_1000293F8);
    sub_10001B61C();
    uint64_t v49 = v82;
    sub_10001E6E8();
    uint64_t v50 = sub_100002030(&qword_100029418);
    uint64_t v51 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
  }
  else
  {
    uint64_t v52 = sub_100002030(&qword_100029418);
    uint64_t v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v82, 1, 1, v52);
  }
  __chkstk_darwin(v51);
  *(&v65 - 2) = (char *)v41;
  sub_10001A2A8(v41, v83);
  sub_100002030(&qword_100029420);
  sub_100002030(&qword_1000293F8);
  sub_10001B6BC();
  sub_10001B61C();
  unint64_t v53 = v73;
  sub_10001E6E8();
  uint64_t v54 = v81;
  sub_100006CE0(v43, v81, &qword_1000293A0);
  uint64_t v55 = v82;
  uint64_t v56 = v72;
  sub_100006CE0(v82, v72, &qword_100029378);
  uint64_t v58 = v75;
  uint64_t v57 = v76;
  uint64_t v59 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  uint64_t v60 = v77;
  v59(v75, v53, v77);
  uint64_t v61 = v74;
  sub_100006CE0(v54, v74, &qword_1000293A0);
  uint64_t v62 = sub_100002030(&qword_100029430);
  sub_100006CE0(v56, v61 + *(int *)(v62 + 48), &qword_100029378);
  v59((char *)(v61 + *(int *)(v62 + 64)), v58, v60);
  unint64_t v63 = *(void (**)(char *, uint64_t))(v57 + 8);
  v63(v53, v60);
  sub_100006C7C(v55, &qword_100029378);
  sub_100006C7C(v79, &qword_1000293A0);
  v63(v58, v60);
  sub_100006C7C(v56, &qword_100029378);
  return sub_100006C7C(v81, &qword_1000293A0);
}

uint64_t sub_1000182F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000179B4(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_100018300()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001831C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = sub_100002030(&qword_1000293E8);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (uint64_t *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_100002030(&qword_1000294B8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100018594();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_10001E728();
  sub_1000190EC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v27, 0.0, 1, 0.0, 1, v16, v17, v9, v11, v15, v13);
  sub_10000609C(v9, v11, v15);
  swift_bridgeObjectRelease();
  *(void *)&v28[16] = swift_getKeyPath();
  v28[24] = 1;
  uint64_t v18 = sub_10001E568();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100006CE0((uint64_t)v8, (uint64_t)v5 + *(int *)(v3 + 36), &qword_1000294B8);
  *uint64_t v5 = KeyPath;
  uint64_t v20 = sub_100002030(&qword_100029390);
  sub_100006CE0((uint64_t)v5, (uint64_t)a1 + *(int *)(v20 + 36), &qword_1000293E8);
  long long v21 = v27[7];
  a1[6] = v27[6];
  a1[7] = v21;
  a1[8] = *(_OWORD *)v28;
  *(_OWORD *)((char *)a1 + 137) = *(_OWORD *)&v28[9];
  long long v22 = v27[3];
  a1[2] = v27[2];
  a1[3] = v22;
  long long v23 = v27[5];
  a1[4] = v27[4];
  a1[5] = v23;
  long long v24 = v27[1];
  *a1 = v27[0];
  a1[1] = v24;
  sub_10001C058((uint64_t)v27);
  sub_100006C7C((uint64_t)v5, &qword_1000293E8);
  sub_100006C7C((uint64_t)v8, &qword_1000294B8);
  return sub_10001C0AC((uint64_t)v27);
}

uint64_t sub_100018594()
{
  uint64_t v1 = sub_10001E0A8();
  uint64_t v80 = *(void *)(v1 - 8);
  uint64_t v81 = v1;
  __chkstk_darwin(v1);
  uint64_t v79 = (char *)v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_10001E0B8();
  uint64_t v75 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v77 = (char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001E0D8();
  __chkstk_darwin(v4 - 8);
  uint64_t v74 = (char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002030(&qword_100028ED0);
  __chkstk_darwin(v6 - 8);
  unint64_t v73 = (char *)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002030(&qword_100028ED8);
  __chkstk_darwin(v8 - 8);
  uint64_t v78 = (char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_10001E0F8();
  uint64_t v68 = *(void *)(v69 - 8);
  uint64_t v10 = __chkstk_darwin(v69);
  uint64_t v66 = (char *)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v67 = (char *)v61 - v12;
  uint64_t v13 = sub_100002030(&qword_100028EF0);
  __chkstk_darwin(v13 - 8);
  uint64_t v83 = (uint64_t)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001E1B8();
  char v84 = *(unsigned int (***)(uint64_t, uint64_t, uint64_t))(v15 - 8);
  uint64_t v85 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v82 = (char *)v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v61 - v18;
  uint64_t v20 = sub_10001E7B8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  long long v24 = (char *)v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)v61 - v25;
  sub_10001E7A8();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  uint64_t v71 = v21 + 16;
  uint64_t v70 = v27;
  v27(v24, v26, v20);
  if (qword_100028C40 != -1) {
    swift_once();
  }
  id v28 = (id)qword_100029EB0;
  sub_10001E1A8();
  uint64_t v29 = sub_10001E7F8();
  uint64_t v86 = v30;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v21 + 8);
  v31(v26, v20);
  uint64_t v32 = *v0;
  swift_getKeyPath();
  uint64_t v90 = v32;
  sub_10001B5CC(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  uint64_t v72 = v26;
  sub_10001E1D8();
  swift_release();
  uint64_t v33 = v32 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales;
  swift_beginAccess();
  uint64_t v34 = v86;
  if (*(void *)(*(void *)v33 + 16)) {
    goto LABEL_10;
  }
  v61[0] = v31;
  v61[1] = v21 + 8;
  uint64_t v62 = v24;
  unint64_t v64 = v19;
  uint64_t v63 = v20;
  uint64_t v65 = v29;
  swift_getKeyPath();
  uint64_t v87 = v32;
  sub_10001E1D8();
  swift_release();
  uint64_t v35 = v32 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__unsupportedLocale;
  swift_beginAccess();
  uint64_t v36 = v83;
  sub_100006CE0(v35, v83, &qword_100028EF0);
  uint64_t v38 = v84;
  uint64_t v37 = v85;
  if (v84[6](v36, 1, v85) == 1)
  {
    sub_100006C7C(v36, &qword_100028EF0);
LABEL_9:
    uint64_t v34 = v86;
    uint64_t v29 = v65;
LABEL_10:
    uint64_t v88 = v29;
    uint64_t v89 = v34;
    sub_1000060AC();
    return sub_10001E598();
  }
  unint64_t v39 = v82;
  v38[4]((uint64_t)v82, v36, v37);
  uint64_t v40 = v64;
  sub_10001E1A8();
  uint64_t v41 = sub_10001E178();
  uint64_t v43 = v42;
  uint64_t v44 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))v38[1];
  ((void (*)(char *, uint64_t))v44)(v40, v37);
  if (!v43)
  {
    ((void (*)(char *, uint64_t))v44)(v39, v37);
    goto LABEL_9;
  }
  char v84 = v44;
  uint64_t v45 = v72;
  sub_10001E7A8();
  uint64_t v46 = v63;
  v70(v62, v45, v63);
  id v47 = (id)qword_100029EB0;
  sub_10001E1A8();
  sub_10001E7F8();
  ((void (*)(char *, uint64_t))v61[0])(v45, v46);
  sub_100002030(&qword_100028EE0);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_10001F640;
  *(void *)(v48 + 56) = &type metadata for String;
  unint64_t v49 = sub_100006C28();
  *(void *)(v48 + 32) = v41;
  *(void *)(v48 + 40) = v43;
  *(void *)(v48 + 96) = &type metadata for String;
  *(void *)(v48 + 104) = v49;
  *(void *)(v48 + 64) = v49;
  *(void *)(v48 + 72) = v41;
  *(void *)(v48 + 80) = v43;
  swift_bridgeObjectRetain();
  sub_10001E7E8();
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_10001E138();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v73, 1, 1, v50);
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v77, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v76);
  (*(void (**)(char *, void, uint64_t))(v80 + 104))(v79, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v81);
  sub_10001E0C8();
  uint64_t v51 = (uint64_t)v78;
  sub_10001E0E8();
  uint64_t v54 = v68;
  uint64_t v55 = v69;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v68 + 56))(v51, 0, 1, v69);
  int v56 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v51, 1, v55);
  uint64_t v57 = v82;
  uint64_t v58 = v86;
  uint64_t v59 = v65;
  if (v56 == 1)
  {
    sub_100006C7C(v51, &qword_100028ED8);
    uint64_t v88 = v59;
    uint64_t v89 = v58;
    sub_1000060AC();
    uint64_t v52 = sub_10001E598();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v60 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 32))(v67, v51, v55);
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v66, v60, v55);
    uint64_t v52 = sub_10001E588();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v60, v55);
  }
  ((void (*)(char *, uint64_t))v84)(v57, v85);
  return v52;
}

uint64_t sub_1000190EC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10001E938();
    uint64_t v31 = (void *)sub_10001E518();
    sub_10001E298();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_10001E388();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_100006048(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000192E0()
{
  uint64_t v0 = sub_10001E1B8();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_10001E7B8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v13 - v6;
  sub_10001E7A8();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  if (qword_100028C40 != -1) {
    swift_once();
  }
  id v8 = (id)qword_100029EB0;
  sub_10001E1A8();
  uint64_t v9 = sub_10001E7F8();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  v13[1] = v9;
  v13[2] = v11;
  sub_1000060AC();
  return sub_10001E598();
}

uint64_t sub_1000194DC(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for LowConfidenceLIDView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = *a1;
  swift_getKeyPath();
  v10[1] = v5;
  sub_10001B5CC(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v6 = (void *)(v5 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales);
  swift_beginAccess();
  v10[0] = *v6;
  swift_getKeyPath();
  sub_10001B754((uint64_t)a1, (uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_10001B7BC((uint64_t)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  sub_100002030(&qword_100029438);
  sub_100002030(&qword_100029410);
  sub_100006488(&qword_100029440, &qword_100029438);
  sub_100006488(&qword_100029408, &qword_100029410);
  return sub_10001E6D8();
}

uint64_t sub_100019734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100019960(a1, a2, (uint64_t)sub_10001B83C, (uint64_t)sub_10001BEF4, a3);
}

uint64_t sub_100019768(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LowConfidenceLIDView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  v8[1] = sub_10000E3D8();
  swift_getKeyPath();
  sub_10001B754(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_10001B7BC((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  sub_100002030(&qword_100029438);
  sub_100002030(&qword_100029410);
  sub_100006488(&qword_100029440, &qword_100029438);
  sub_100006488(&qword_100029408, &qword_100029410);
  return sub_10001E6D8();
}

uint64_t sub_10001992C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100019960(a1, a2, (uint64_t)sub_10001B83C, (uint64_t)sub_10001B840, a3);
}

uint64_t sub_100019960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  v18[2] = a3;
  void v18[3] = a4;
  v18[1] = a5;
  uint64_t v7 = sub_10001E1B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = type metadata accessor for LowConfidenceLIDView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B754(a2, (uint64_t)v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v15 = (v12 + *(unsigned __int8 *)(v8 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = swift_allocObject();
  sub_10001B7BC((uint64_t)v13, v16 + v14);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v16 + v15, (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v18[6] = a1;
  sub_100002030(&qword_100029448);
  sub_10001B884();
  return sub_10001E6B8();
}

uint64_t sub_100019B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10001E1B8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002030(&qword_100028EF0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v17 - v12;
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v17 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v17 - v14, a2, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v15, 0, 1, v3);
  type metadata accessor for LowConfidenceLIDView();
  sub_100006CE0((uint64_t)v15, (uint64_t)v13, &qword_100028EF0);
  sub_100002030(&qword_1000292D0);
  sub_10001E698();
  sub_10001E688();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) == 1)
  {
    sub_100006C7C((uint64_t)v10, &qword_100028EF0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v10, v3);
    sub_10000D8C4((uint64_t)v6);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return sub_100006C7C((uint64_t)v15, &qword_100028EF0);
}

uint64_t sub_100019DC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = sub_100002030(&qword_100029498);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002030(&qword_1000294A0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100002030(&qword_100029460);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002030(&qword_100029470);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v27 = v13;
  uint64_t v28 = v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1;
  uint64_t v29 = a1;
  sub_100002030(&qword_1000294A8);
  sub_10001B9E8();
  sub_10001E668();
  uint64_t v17 = sub_10001E1B8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v19(v8, a1, v17);
  uint64_t v20 = *(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56);
  v20(v8, 0, 1, v17);
  sub_100006CE0((uint64_t)v8, (uint64_t)&v12[*(int *)(v10 + 44)], &qword_1000294A0);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v12, v16, v27);
  sub_100006C7C((uint64_t)v8, &qword_1000294A0);
  v19(v5, v25, v17);
  v20(v5, 0, 1, v17);
  uint64_t v21 = sub_100002030(&qword_100028EF0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v5, 0, 1, v21);
  uint64_t v22 = sub_100002030(&qword_100029448);
  uint64_t v23 = v26;
  sub_100006CE0((uint64_t)v5, v26 + *(int *)(v22 + 36), &qword_100029498);
  sub_100006CE0((uint64_t)v12, v23, &qword_100029460);
  sub_100006C7C((uint64_t)v5, &qword_100029498);
  sub_100006C7C((uint64_t)v12, &qword_100029460);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v16, v27);
}

uint64_t sub_10001A160@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_10001E1B8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001E1A8();
  uint64_t v6 = sub_10001E178();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v8)
  {
    v17[0] = v6;
    v17[1] = v8;
    sub_1000060AC();
    uint64_t v9 = sub_10001E598();
    uint64_t v8 = v10;
    uint64_t v12 = v11;
    uint64_t v14 = v13 & 1;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v14 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v15 = sub_10001E638();
  uint64_t result = swift_getKeyPath();
  *a1 = v9;
  a1[1] = v8;
  a1[2] = v14;
  a1[3] = v12;
  a1[4] = result;
  a1[5] = v15;
  return result;
}

uint64_t sub_10001A2A8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_10001E1B8();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10001E7B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v23 - v10;
  uint64_t v12 = *a1;
  swift_getKeyPath();
  v23[3] = v12;
  sub_10001B5CC(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v13 = v12 + OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__lowConfidenceLocales;
  swift_beginAccess();
  uint64_t v14 = *(void *)(*(void *)v13 + 16);
  if (v14)
  {
    sub_10001E7A8();
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    if (qword_100028C40 != -1) {
      swift_once();
    }
    id v15 = (id)qword_100029EB0;
    sub_10001E1A8();
    uint64_t v16 = sub_10001E7F8();
    uint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    v23[0] = v16;
    v23[1] = v18;
    sub_1000060AC();
    uint64_t result = sub_10001E598();
    uint64_t v14 = v22 & 1;
  }
  else
  {
    uint64_t result = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  *a2 = result;
  a2[1] = v20;
  a2[2] = v14;
  a2[3] = v21;
  return result;
}

uint64_t sub_10001A578()
{
  uint64_t v1 = sub_10001E4B8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100002030(&qword_1000292A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v0;
  sub_100002030(&qword_1000292B0);
  sub_100006488(&qword_1000292B8, &qword_1000292B0);
  sub_10001E548();
  sub_10001E4A8();
  sub_100006488(&qword_1000292C0, &qword_1000292A8);
  sub_10001B5CC(&qword_1000292C8, (void (*)(uint64_t))&type metadata accessor for TitleOnlyLabelStyle);
  sub_10001E5C8();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void **initializeBufferWithCopyOfBuffer for LowConfidenceLIDView(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_10001E1B8();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v12 = v4;
    if (v11(v8, 1, v9))
    {
      uint64_t v13 = sub_100002030(&qword_100028EF0);
      memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
    uint64_t v14 = sub_100002030(&qword_1000292D0);
    *(void *)&v7[*(int *)(v14 + 28)] = *(void *)&v8[*(int *)(v14 + 28)];
  }
  swift_retain();
  return v5;
}

uint64_t destroy for LowConfidenceLIDView(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_10001E1B8();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  sub_100002030(&qword_1000292D0);

  return swift_release();
}

void **initializeWithCopy for LowConfidenceLIDView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10001E1B8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  id v11 = v4;
  if (v10(v7, 1, v8))
  {
    uint64_t v12 = sub_100002030(&qword_100028EF0);
    memcpy(v6, v7, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  uint64_t v13 = sub_100002030(&qword_1000292D0);
  *(void *)&v6[*(int *)(v13 + 28)] = *(void *)&v7[*(int *)(v13 + 28)];
  swift_retain();
  return a1;
}

void **assignWithCopy for LowConfidenceLIDView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_10001E1B8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = sub_100002030(&qword_100028EF0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = sub_100002030(&qword_1000292D0);
  *(void *)&v10[*(int *)(v18 + 28)] = *(void *)&v11[*(int *)(v18 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for LowConfidenceLIDView(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_10001E1B8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = sub_100002030(&qword_100028EF0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  uint64_t v10 = sub_100002030(&qword_1000292D0);
  *(void *)&v5[*(int *)(v10 + 28)] = *(void *)&v6[*(int *)(v10 + 28)];
  return a1;
}

void **assignWithTake for LowConfidenceLIDView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_10001E1B8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_100002030(&qword_100028EF0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = sub_100002030(&qword_1000292D0);
  *(void *)&v8[*(int *)(v16 + 28)] = *(void *)&v9[*(int *)(v16 + 28)];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LowConfidenceLIDView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B014);
}

uint64_t sub_10001B014(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100002030(&qword_1000292D0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for LowConfidenceLIDView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B0DC);
}

void *sub_10001B0DC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100002030(&qword_1000292D0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10001B188()
{
  sub_10001B224();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10001B224()
{
  if (!qword_100029340)
  {
    sub_1000026F4(&qword_100028EF0);
    unint64_t v0 = sub_10001E6A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100029340);
    }
  }
}

uint64_t sub_10001B280()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001B350()
{
  unint64_t result = qword_1000293A8;
  if (!qword_1000293A8)
  {
    sub_1000026F4(&qword_100029390);
    sub_10001B3F0();
    sub_100006488(&qword_1000293E0, &qword_1000293E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000293A8);
  }
  return result;
}

unint64_t sub_10001B3F0()
{
  unint64_t result = qword_1000293B0;
  if (!qword_1000293B0)
  {
    sub_1000026F4(&qword_1000293B8);
    sub_10001B490();
    sub_100006488(&qword_1000293D0, &qword_1000293D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000293B0);
  }
  return result;
}

unint64_t sub_10001B490()
{
  unint64_t result = qword_1000293C0;
  if (!qword_1000293C0)
  {
    sub_1000026F4(&qword_1000293C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000293C0);
  }
  return result;
}

uint64_t sub_10001B504()
{
  return sub_10001E3C8();
}

uint64_t sub_10001B528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001BF80(a1, a2, a3, a4, &qword_100029380, (uint64_t (*)(char *))&EnvironmentValues.listSectionSpacing.setter);
}

uint64_t sub_10001B55C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002030(&qword_1000293A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B5CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001B614()
{
  return sub_1000194DC(*(uint64_t **)(v0 + 16));
}

unint64_t sub_10001B61C()
{
  unint64_t result = qword_100029400;
  if (!qword_100029400)
  {
    sub_1000026F4(&qword_1000293F8);
    sub_100006488(&qword_100029408, &qword_100029410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029400);
  }
  return result;
}

uint64_t sub_10001B6B4()
{
  return sub_100019768(*(void *)(v0 + 16));
}

unint64_t sub_10001B6BC()
{
  unint64_t result = qword_100029428;
  if (!qword_100029428)
  {
    sub_1000026F4(&qword_100029420);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029428);
  }
  return result;
}

uint64_t sub_10001B728@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001E158();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001B754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LowConfidenceLIDView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LowConfidenceLIDView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001B820(uint64_t a1)
{
  return sub_10001BBFC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10001992C);
}

uint64_t sub_10001B840@<X0>(uint64_t a1@<X8>)
{
  return sub_100019DC4(*(void *)(v1 + 16), a1);
}

unint64_t sub_10001B884()
{
  unint64_t result = qword_100029450;
  if (!qword_100029450)
  {
    sub_1000026F4(&qword_100029448);
    sub_10001B924();
    sub_100006488(&qword_100029488, &qword_100029490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029450);
  }
  return result;
}

unint64_t sub_10001B924()
{
  unint64_t result = qword_100029458;
  if (!qword_100029458)
  {
    sub_1000026F4(&qword_100029460);
    sub_100006488(&qword_100029468, &qword_100029470);
    sub_100006488(&qword_100029478, &qword_100029480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029458);
  }
  return result;
}

unint64_t sub_10001B9E8()
{
  unint64_t result = qword_1000294B0;
  if (!qword_1000294B0)
  {
    sub_1000026F4(&qword_1000294A8);
    sub_10001B6BC();
    sub_100006488(&qword_100028E68, &qword_100028E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000294B0);
  }
  return result;
}

uint64_t sub_10001BA94()
{
  uint64_t v1 = (int *)(type metadata accessor for LowConfidenceLIDView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = sub_10001E1B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  sub_100002030(&qword_1000292D0);
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10001BBE4(uint64_t a1)
{
  return sub_10001BBFC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100019734);
}

uint64_t sub_10001BBFC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for LowConfidenceLIDView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t sub_10001BC94()
{
  uint64_t v1 = (int *)(type metadata accessor for LowConfidenceLIDView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_10001E1B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);

  uint64_t v9 = v0 + v3 + v1[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  }
  uint64_t v10 = (v3 + v4 + v7) & ~v7;
  sub_100002030(&qword_1000292D0);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v10, v5);

  return _swift_deallocObject(v0, v10 + v8, v2 | v7 | 7);
}

uint64_t sub_10001BE34()
{
  uint64_t v1 = *(void *)(type metadata accessor for LowConfidenceLIDView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(sub_10001E1B8() - 8);
  return sub_100019B5C(v0 + v2, v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
}

uint64_t sub_10001BEF4@<X0>(uint64_t a1@<X8>)
{
  return sub_100019DC4(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001BF38@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001A160(a1);
}

uint64_t sub_10001BF5C()
{
  return sub_10001E408();
}

uint64_t sub_10001BF80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9 = sub_100002030(a5);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006CE0(a1, (uint64_t)v11, a5);
  return a6(v11);
}

uint64_t sub_10001C024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001BF80(a1, a2, a3, a4, &qword_1000294B8, (uint64_t (*)(char *))&EnvironmentValues.textCase.setter);
}

uint64_t sub_10001C058(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001C0AC(uint64_t a1)
{
  return a1;
}

uint64_t SupportStepView.body.getter@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v61 = sub_100002030(&qword_1000294C0);
  uint64_t v53 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v52 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100002030(&qword_1000294C8);
  __chkstk_darwin(v59);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100002030(&qword_1000294D0);
  __chkstk_darwin(v65);
  uint64_t v60 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for LanguageDownloadView(0);
  uint64_t v7 = __chkstk_darwin(v58);
  uint64_t v9 = (uint64_t *)((char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  uint64_t v51 = (uint64_t)&v50 - v10;
  uint64_t v62 = sub_100002030(&qword_1000294D8);
  __chkstk_darwin(v62);
  uint64_t v64 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100002030(&qword_1000294E0);
  __chkstk_darwin(v55);
  uint64_t v56 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_100002030(&qword_1000294E8);
  __chkstk_darwin(v63);
  uint64_t v57 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002030(&qword_100028EF0);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v50 - v18;
  uint64_t v54 = type metadata accessor for LowConfidenceLIDView();
  uint64_t v20 = __chkstk_darwin(v54);
  char v22 = (char **)((char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v20);
  long long v24 = (char *)&v50 - v23;
  swift_getKeyPath();
  uint64_t v67 = a1;
  sub_10001CDC0(&qword_100028E98, (void (*)(uint64_t))type metadata accessor for LanguageSupportRemoteModel);
  sub_10001E1D8();
  swift_release();
  uint64_t v25 = &a1[OBJC_IVAR____TtC30TranslationAPISupportExtension26LanguageSupportRemoteModel__currentStep];
  swift_beginAccess();
  switch(*v25)
  {
    case 1:
      uint64_t v46 = (void *)((char *)v9 + *(int *)(v58 + 20));
      *uint64_t v46 = swift_getKeyPath();
      sub_100002030(&qword_100028C58);
      swift_storeEnumTagMultiPayload();
      *uint64_t v9 = a1;
      uint64_t v28 = type metadata accessor for LanguageDownloadView;
      uint64_t v47 = v51;
      sub_10001CF60((uint64_t)v9, v51, type metadata accessor for LanguageDownloadView);
      sub_10001CFC8(v47, v56, type metadata accessor for LanguageDownloadView);
      swift_storeEnumTagMultiPayload();
      sub_10001CDC0(&qword_100029520, (void (*)(uint64_t))type metadata accessor for LowConfidenceLIDView);
      sub_10001CDC0(&qword_100029528, (void (*)(uint64_t))type metadata accessor for LanguageDownloadView);
      uint64_t v48 = a1;
      uint64_t v49 = (uint64_t)v57;
      sub_10001E4C8();
      sub_100006CE0(v49, v64, &qword_1000294E8);
      swift_storeEnumTagMultiPayload();
      sub_10001CCE4();
      sub_10001CE08();
      sub_10001E4C8();
      sub_100006C7C(v49, &qword_1000294E8);
      uint64_t v30 = v47;
      goto LABEL_6;
    case 2:
      sub_10001E488();
      uint64_t v31 = sub_10001E578();
      uint64_t v33 = v32;
      uint64_t v35 = v34;
      char v37 = v36 & 1;
      uint64_t KeyPath = swift_getKeyPath();
      char v39 = sub_10001E528();
      *(void *)uint64_t v5 = v31;
      *((void *)v5 + 1) = v33;
      v5[16] = v37;
      *((void *)v5 + 3) = v35;
      *((void *)v5 + 4) = KeyPath;
      v5[40] = 1;
      v5[48] = v39;
      *(_OWORD *)(v5 + 56) = 0u;
      *(_OWORD *)(v5 + 72) = 0u;
      v5[88] = 1;
      swift_storeEnumTagMultiPayload();
      sub_100006048(v31, v33, v37);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_100002030(&qword_1000294F0);
      sub_10001CBC8();
      sub_100006488(&qword_100029510, &qword_1000294C0);
      uint64_t v40 = (uint64_t)v60;
      sub_10001E4C8();
      sub_100006CE0(v40, v64, &qword_1000294D0);
      swift_storeEnumTagMultiPayload();
      sub_10001CCE4();
      sub_10001CE08();
      sub_10001E4C8();
      sub_100006C7C(v40, &qword_1000294D0);
      sub_10000609C(v31, v33, v37);
      swift_release();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 3:
      sub_10001E488();
      uint64_t v42 = v52;
      sub_10001E508();
      uint64_t v43 = v53;
      uint64_t v44 = v61;
      (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v5, v42, v61);
      swift_storeEnumTagMultiPayload();
      sub_100002030(&qword_1000294F0);
      sub_10001CBC8();
      sub_100006488(&qword_100029510, &qword_1000294C0);
      uint64_t v45 = (uint64_t)v60;
      sub_10001E4C8();
      sub_100006CE0(v45, v64, &qword_1000294D0);
      swift_storeEnumTagMultiPayload();
      sub_10001CCE4();
      sub_10001CE08();
      sub_10001E4C8();
      sub_100006C7C(v45, &qword_1000294D0);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v42, v44);
      break;
    default:
      uint64_t v26 = sub_10001E1B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v19, 1, 1, v26);
      sub_100006CE0((uint64_t)v19, (uint64_t)v17, &qword_100028EF0);
      uint64_t v27 = a1;
      sub_10001E678();
      sub_100006C7C((uint64_t)v19, &qword_100028EF0);
      *char v22 = v27;
      uint64_t v28 = (uint64_t (*)(void))type metadata accessor for LowConfidenceLIDView;
      sub_10001CF60((uint64_t)v22, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for LowConfidenceLIDView);
      sub_10001CFC8((uint64_t)v24, v56, (uint64_t (*)(void))type metadata accessor for LowConfidenceLIDView);
      swift_storeEnumTagMultiPayload();
      sub_10001CDC0(&qword_100029520, (void (*)(uint64_t))type metadata accessor for LowConfidenceLIDView);
      sub_10001CDC0(&qword_100029528, (void (*)(uint64_t))type metadata accessor for LanguageDownloadView);
      uint64_t v29 = (uint64_t)v57;
      sub_10001E4C8();
      sub_100006CE0(v29, v64, &qword_1000294E8);
      swift_storeEnumTagMultiPayload();
      sub_10001CCE4();
      sub_10001CE08();
      sub_10001E4C8();
      sub_100006C7C(v29, &qword_1000294E8);
      uint64_t v30 = (uint64_t)v24;
LABEL_6:
      uint64_t result = sub_10001D030(v30, v28);
      break;
  }
  return result;
}

unint64_t sub_10001CBC8()
{
  unint64_t result = qword_1000294F8;
  if (!qword_1000294F8)
  {
    sub_1000026F4(&qword_1000294F0);
    sub_10001CC44();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000294F8);
  }
  return result;
}

unint64_t sub_10001CC44()
{
  unint64_t result = qword_100029500;
  if (!qword_100029500)
  {
    sub_1000026F4(&qword_100029508);
    sub_100006488(&qword_1000293D0, &qword_1000293D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029500);
  }
  return result;
}

unint64_t sub_10001CCE4()
{
  unint64_t result = qword_100029518;
  if (!qword_100029518)
  {
    sub_1000026F4(&qword_1000294E8);
    sub_10001CDC0(&qword_100029520, (void (*)(uint64_t))type metadata accessor for LowConfidenceLIDView);
    sub_10001CDC0(&qword_100029528, (void (*)(uint64_t))type metadata accessor for LanguageDownloadView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029518);
  }
  return result;
}

uint64_t sub_10001CDC0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001CE08()
{
  unint64_t result = qword_100029530;
  if (!qword_100029530)
  {
    sub_1000026F4(&qword_1000294D0);
    sub_10001CBC8();
    sub_100006488(&qword_100029510, &qword_1000294C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029530);
  }
  return result;
}

uint64_t sub_10001CEA8@<X0>(uint64_t a1@<X8>)
{
  return SupportStepView.body.getter(*v1, a1);
}

uint64_t sub_10001CEB0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001E3D8();
  *a1 = result;
  return result;
}

uint64_t sub_10001CEDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001E3D8();
  *a1 = result;
  return result;
}

uint64_t sub_10001CF08()
{
  return sub_10001E3E8();
}

uint64_t sub_10001CF30()
{
  return sub_10001E3E8();
}

uint64_t sub_10001CF60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001CFC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001D030(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001D090()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for SupportStepView()
{
  return &type metadata for SupportStepView;
}

unint64_t sub_10001D0C0()
{
  unint64_t result = qword_100029538;
  if (!qword_100029538)
  {
    sub_1000026F4(&qword_100029540);
    sub_10001CCE4();
    sub_10001CE08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029538);
  }
  return result;
}

uint64_t sub_10001D13C()
{
  return sub_10001E378();
}

id sub_10001D198@<X0>(void *a1@<X8>)
{
  id result = [objc_allocWithZone((Class)type metadata accessor for LanguageSupportRemoteModel()) init];
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x8000000100021170;
  a1[2] = sub_10001D13C;
  a1[3] = 0;
  a1[4] = result;
  return result;
}

uint64_t sub_10001D204()
{
  return sub_10001E238();
}

uint64_t sub_10001D2B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v42 = sub_10001E438();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  char v39 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001E458();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002030(&qword_1000295A8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v15 = sub_100002030(&qword_1000295B0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  uint64_t v38 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100002030(&qword_1000295B8);
  uint64_t v43 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  char v36 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v35 = a1;
  sub_10001E448();
  sub_10001E748();
  sub_10001E738();
  swift_release();
  uint64_t v20 = sub_10001DDB8(&qword_1000295C0, (void (*)(uint64_t))&type metadata accessor for OpacityTransition);
  sub_10001E2E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  uint64_t v46 = v4;
  unint64_t v47 = v20;
  swift_getOpaqueTypeConformance2();
  uint64_t v21 = sub_10001E308();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  char v22 = v35;
  uint64_t v46 = (uint64_t)v35;
  unint64_t v47 = v21;
  sub_10001E488();
  uint64_t v23 = sub_100002030(&qword_1000295C8);
  unint64_t v24 = sub_10001DE00();
  sub_10001E5E8();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = v39;
  uint64_t v25 = v40;
  uint64_t v27 = v42;
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v42);
  uint64_t v46 = v23;
  unint64_t v47 = v24;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = v36;
  uint64_t v30 = (void *)v37;
  sub_10001E608();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  (*(void (**)(char *, void *))(v38 + 8))(v18, v30);
  uint64_t v45 = v22;
  sub_100002030(&qword_1000295F0);
  uint64_t v46 = (uint64_t)v30;
  unint64_t v47 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = sub_1000026F4(&qword_1000295F8);
  uint64_t v32 = sub_100006488(&qword_100029600, &qword_1000295F8);
  uint64_t v46 = v31;
  unint64_t v47 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v41;
  sub_10001E618();
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v29, v33);
}

uint64_t sub_10001D8C4(uint64_t a1)
{
  uint64_t v2 = sub_10001E4E8();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100002030(&qword_1000295F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001E4D8();
  uint64_t v9 = a1;
  sub_100002030(&qword_100029608);
  sub_100006488((unint64_t *)&unk_100029610, &qword_100029608);
  sub_10001E2F8();
  sub_100006488(&qword_100029600, &qword_1000295F8);
  sub_10001E4F8();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_10001DA8C(void *a1)
{
  uint64_t v2 = sub_10001E488();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  id v10 = a1;

  return Button<>.init(_:action:)(v2, v4, v6 & 1, v8, sub_10001DF3C, v9);
}

uint64_t sub_10001DB44@<X0>(uint64_t a1@<X8>)
{
  return sub_10001D2B8(*v1, a1);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10001DBA8()
{
  unint64_t result = qword_100029548;
  if (!qword_100029548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029548);
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationAPISupportExtension()
{
  return &type metadata for TranslationAPISupportExtension;
}

uint64_t sub_10001DC0C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001DC28(uint64_t a1)
{
  unint64_t result = sub_10001DBA8();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10001DC50()
{
  return sub_10001DDB8(&qword_100029578, (void (*)(uint64_t))&type metadata accessor for AppExtensionSceneConfiguration);
}

unint64_t sub_10001DC9C()
{
  unint64_t result = qword_100029580;
  if (!qword_100029580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029580);
  }
  return result;
}

id sub_10001DCF0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_10001DCFC()
{
  unint64_t result = qword_100029598;
  if (!qword_100029598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029598);
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicLanguagePickerView()
{
  return &type metadata for BasicLanguagePickerView;
}

uint64_t sub_10001DD60()
{
  return sub_100006488(&qword_1000295A0, &qword_100029588);
}

uint64_t sub_10001DD9C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001DDB8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001DE00()
{
  unint64_t result = qword_1000295D0;
  if (!qword_1000295D0)
  {
    sub_1000026F4(&qword_1000295C8);
    sub_10001DEA0();
    sub_100006488(&qword_1000295E0, &qword_1000295E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000295D0);
  }
  return result;
}

unint64_t sub_10001DEA0()
{
  unint64_t result = qword_1000295D8;
  if (!qword_1000295D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000295D8);
  }
  return result;
}

uint64_t sub_10001DEF4()
{
  return sub_10001D8C4(*(void *)(v0 + 16));
}

uint64_t sub_10001DEFC()
{
  return sub_10001DA8C(*(void **)(v0 + 16));
}

uint64_t sub_10001DF04()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001DF3C()
{
}

uint64_t sub_10001DF60()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001E0A8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
}

uint64_t sub_10001E0B8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
}

uint64_t sub_10001E0C8()
{
  return AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
}

uint64_t sub_10001E0D8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions();
}

uint64_t sub_10001E0E8()
{
  return AttributedString.init(markdown:options:baseURL:)();
}

uint64_t sub_10001E0F8()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_10001E108()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10001E118()
{
  return static URL.downloadLanguagesURL.getter();
}

uint64_t sub_10001E128()
{
  return URL.absoluteString.getter();
}

uint64_t sub_10001E138()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001E148()
{
  return Locale.init(identifier:)();
}

uint64_t sub_10001E158()
{
  return Locale.identifier.getter();
}

uint64_t sub_10001E168()
{
  return Locale.ltIdentifier.getter();
}

uint64_t sub_10001E178()
{
  return Locale.sqDisplayName(context:in:)();
}

NSLocale sub_10001E188()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_10001E198()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E1A8()
{
  return static Locale.current.getter();
}

uint64_t sub_10001E1B8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10001E1C8()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10001E1D8()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10001E1E8()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t sub_10001E1F8()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t _s30TranslationAPISupportExtension26LanguageSupportRemoteModelC22__observationRegistrar33_3FCA5AFE04A8478E67D6CE01CB995DEALL11Observation0rI0Vvpfi_0()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_10001E218()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_10001E238()
{
  return AppExtensionSceneConfiguration.init<A, B>(_:configuration:)();
}

uint64_t sub_10001E248()
{
  return AppExtensionScene._makeScene(with:)();
}

uint64_t sub_10001E258()
{
  return static LowConfidenceLID.maxLocalesToSuggest.getter();
}

uint64_t sub_10001E268()
{
  return DownloadProgressView.init(fractionCompleted:)();
}

uint64_t sub_10001E278()
{
  return type metadata accessor for DownloadProgressView();
}

uint64_t sub_10001E288()
{
  return static AppExtension<>.main()();
}

uint64_t sub_10001E298()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_10001E2A8()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001E2B8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001E2C8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001E2D8()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10001E2E8()
{
  return Transition.animation(_:)();
}

uint64_t sub_10001E2F8()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_10001E308()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t sub_10001E318()
{
  return OpenURLAction.callAsFunction(_:)();
}

uint64_t sub_10001E328()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_10001E338()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_10001E348()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_10001E358()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_10001E368()
{
  return LabeledContent<>.init(content:label:)();
}

uint64_t sub_10001E378()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_10001E388()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10001E398()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10001E3A8()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10001E3B8()
{
  return EnvironmentValues._openSensitiveURL.getter();
}

uint64_t sub_10001E3C8()
{
  return EnvironmentValues.listSectionSpacing.getter();
}

uint64_t sub_10001E3D8()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10001E3E8()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10001E3F8()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_10001E408()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_10001E418()
{
  return EnvironmentValues.init()();
}

uint64_t sub_10001E428()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_10001E438()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_10001E448()
{
  return OpacityTransition.init()();
}

uint64_t sub_10001E458()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t sub_10001E468()
{
  return static ListSectionSpacing.custom(_:)();
}

uint64_t sub_10001E478()
{
  return type metadata accessor for ListSectionSpacing();
}

uint64_t sub_10001E488()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10001E498()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10001E4A8()
{
  return TitleOnlyLabelStyle.init()();
}

uint64_t sub_10001E4B8()
{
  return type metadata accessor for TitleOnlyLabelStyle();
}

uint64_t sub_10001E4C8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10001E4D8()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t sub_10001E4E8()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_10001E4F8()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_10001E508()
{
  return ContentUnavailableView<>.init(_:image:description:)();
}

uint64_t sub_10001E518()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10001E528()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10001E538()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10001E548()
{
  return List<>.init(content:)();
}

uint64_t sub_10001E558()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_10001E568()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_10001E578()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10001E588()
{
  return Text.init(_:)();
}

uint64_t sub_10001E598()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10001E5A8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10001E5B8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10001E5C8()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_10001E5D8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10001E5E8()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_10001E5F8()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_10001E608()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_10001E618()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_10001E628()
{
  return static Color.accentColor.getter();
}

uint64_t sub_10001E638()
{
  return static Color.primary.getter();
}

uint64_t sub_10001E648()
{
  return static Color.secondary.getter();
}

uint64_t sub_10001E658()
{
  return Image.init(systemName:)();
}

uint64_t sub_10001E668()
{
  return Label.init(title:icon:)();
}

uint64_t sub_10001E678()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_10001E688()
{
  return State.wrappedValue.getter();
}

uint64_t sub_10001E698()
{
  return State.wrappedValue.setter();
}

uint64_t sub_10001E6A8()
{
  return type metadata accessor for State();
}

uint64_t sub_10001E6B8()
{
  return Button.init(action:label:)();
}

uint64_t sub_10001E6D8()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10001E6E8()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_10001E6F8()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_10001E708()
{
  return Bindable.wrappedValue.getter();
}

uint64_t sub_10001E718()
{
  return Bindable<A>.init(wrappedValue:)();
}

uint64_t sub_10001E728()
{
  return static Alignment.center.getter();
}

uint64_t sub_10001E738()
{
  return Animation.delay(_:)();
}

uint64_t sub_10001E748()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t sub_10001E758()
{
  return static Animation.easeInOut.getter();
}

uint64_t sub_10001E768()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10001E778()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10001E788()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10001E798()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_10001E7A8()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10001E7B8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10001E7C8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001E7D8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E7E8()
{
  return String.init(format:_:)();
}

uint64_t sub_10001E7F8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_10001E808()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001E818()
{
  return String.hash(into:)();
}

void sub_10001E828(Swift::String a1)
{
}

Swift::Int sub_10001E838()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10001E848()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001E858()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001E868()
{
  return Array.description.getter();
}

uint64_t sub_10001E878()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10001E888()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10001E898()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10001E8A8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10001E8B8()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10001E8C8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10001E8D8()
{
  return Double.write<A>(to:)();
}

uint64_t sub_10001E8E8()
{
  return Set.description.getter();
}

uint64_t sub_10001E8F8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10001E908()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10001E918()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10001E928()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001E938()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10001E948()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10001E958()
{
  return static NSUserDefaults.translationGroupDefaults.getter();
}

uint64_t sub_10001E968()
{
  return NSUserDefaults.debugAPIShowLanguageStatus.getter();
}

uint64_t sub_10001E978()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10001E988()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10001E998()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001E9A8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001E9B8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001E9C8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001E9D8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10001E9E8()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10001E9F8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10001EA08()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_10001EA18(Swift::Int a1)
{
}

uint64_t sub_10001EA28()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001EA38()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001EA48()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001EA58()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001EA68()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001EA78()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001EA88()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10001EA98(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10001EAA8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10001EAB8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001EAC8()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10001EAD8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001EAE8()
{
  return Hasher.init(_seed:)();
}

void sub_10001EAF8(Swift::UInt a1)
{
}

Swift::Int sub_10001EB08()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}