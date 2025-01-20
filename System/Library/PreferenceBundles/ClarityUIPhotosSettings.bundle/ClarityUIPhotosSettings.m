id CLCreatePrivacySpecifier(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void ***v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;
  uint64_t vars8;

  v3 = a1;
  v4 = a2;
  v5 = [v4 parentViewController];
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;

    v4 = v6;
  }
  v7 = +[PSSpecifier emptyGroupSpecifier];
  [v7 setProperty:@"PrivacyDisplay" forKey:PSIDKey];
  [v7 setProperty:@"CLPrivacyLinkDisplayView" forKey:PSHeaderCellClassGroupKey];
  [v7 setProperty:v3 forKey:CLFPrivacyLinkBundleIdentifier];
  objc_initWeak(&location, v4);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_41C8;
  v13 = &unk_C750;
  objc_copyWeak(&v14, &location);
  v8 = objc_retainBlock(&v10);
  objc_msgSend(v7, "setProperty:forKey:", v8, CLFPrivacyCallbackIdentifier, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

void sub_41AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_41C8(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addChildViewController:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v3 didMoveToParentViewController:v5];
}

void sub_44A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_44BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_44CC(uint64_t a1)
{
}

void sub_44D4(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v5 = [v3 localizedTitle];
  v4 = [v3 localIdentifier];

  [v2 setValue:v5 forKey:v4];
}

void sub_4E7C(id a1)
{
  qword_10AD0 = objc_alloc_init(CLPhotosUtilities);

  _objc_release_x1();
}

void sub_4FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4FEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4FFC(uint64_t a1)
{
}

void sub_5004(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v5 = [v3 localizedTitle];
  v4 = [v3 localIdentifier];

  [v2 setValue:v5 forKey:v4];
}

void sub_55B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_55D4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = AXLogTemp();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Error attempting to authenticate to access shared albums. %@", buf, 0xCu);
    }
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = *(id *)(*(void *)(a1 + 32) + 8);
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v12 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v11];
          v13 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v11];
          v14 = objc_alloc_init(CLPhotosSharedAlbum);
          [(CLPhotosSharedAlbum *)v14 setTitle:v12];
          [(CLPhotosSharedAlbum *)v14 setLocalIdentifier:v11];
          [(CLPhotosSharedAlbum *)v14 setCloudIdentifier:v13];
          [*(id *)(a1 + 40) addObject:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
      id v5 = 0;
    }
  }
}

void sub_5B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5B50(uint64_t a1, uint64_t a2)
{
  id v3 = +[PHAsset fetchAssetsInAssetCollection:a2 options:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5BFC;
  v4[3] = &unk_C818;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

void sub_5BFC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 mediaType] == (char *)&dword_0 + 1)
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [v8 localIdentifier];
    [v6 addObject:v7];
  }
  *a4 = 0;
}

void sub_5C80(uint64_t a1, void *a2)
{
}

Class sub_5CFC(uint64_t a1)
{
  sub_5D54();
  Class result = objc_getClass("APApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_8F90();
  }
  qword_10AE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_5D54()
{
  v1[0] = 0;
  if (!qword_10AE8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_5E50;
    v1[4] = &unk_C8C8;
    v1[5] = v1;
    long long v2 = off_C8B0;
    uint64_t v3 = 0;
    qword_10AE8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10AE8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_5E50()
{
  uint64_t result = _sl_dlopen();
  qword_10AE8 = result;
  return result;
}

Class sub_5EC4(uint64_t a1)
{
  sub_5D54();
  Class result = objc_getClass("APGuard");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_8FB8();
  }
  qword_10AF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_5F1C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = [a1 title];
  uint64_t v5 = sub_9280();
  uint64_t v7 = v6;

  id v8 = [self sharedInstance];
  id v9 = [v8 previewImageForSharedAlbum:a1];

  return sub_63AC(v5, v7, (uint64_t)v9, a2);
}

id sub_60F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CLPhotosInterfaceHelper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CLPhotosInterfaceHelper()
{
  return self;
}

uint64_t sub_6150@<X0>(uint64_t a1@<X8>)
{
  return sub_5F1C(*(void **)(v1 + 16), a1);
}

uint64_t sub_6158(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_619C()
{
  unint64_t result = qword_10908;
  if (!qword_10908)
  {
    sub_61F8(&qword_10900);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10908);
  }
  return result;
}

uint64_t sub_61F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_6240(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_62A4()
{
  unint64_t result = qword_10910;
  if (!qword_10910)
  {
    type metadata accessor for CLPhotosSharedAlbumRow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10910);
  }
  return result;
}

__n128 initializeWithTake for Placeholder(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_630C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_632C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  if (!qword_10918)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10918);
    }
  }
}

uint64_t sub_63AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 16) = xmmword_B050;
  *(void *)(a4 + 32) = 0xEB000000006B6361;
  *(int64x2_t *)(a4 + 40) = vdupq_n_s64(0x4060000000000000uLL);
  *(_OWORD *)(a4 + 56) = xmmword_B060;
  id v8 = (uint64_t *)(a4 + *(int *)(type metadata accessor for CLPhotosSharedAlbumRow() + 40));
  *id v8 = swift_getKeyPath();
  sub_6158(&qword_10920);
  uint64_t result = swift_storeEnumTagMultiPayload();
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  if (a3)
  {
    uint64_t v10 = sub_9250();
    uint64_t result = swift_release();
    *(void *)(a4 + 16) = v10;
  }
  return result;
}

uint64_t type metadata accessor for CLPhotosSharedAlbumRow()
{
  uint64_t result = qword_10988;
  if (!qword_10988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_64C4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  sub_6158(&qword_109E8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v23 - v7;
  uint64_t v9 = sub_6158(&qword_109F0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v23 - v13;
  sub_6720((uint64_t)&v23 - v13);
  sub_9270();
  sub_9000();
  uint64_t v15 = v27;
  int v26 = v28;
  uint64_t v16 = v29;
  char v17 = v30;
  uint64_t v24 = v32;
  uint64_t v25 = v31;
  *(void *)id v8 = sub_9110();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v18 = sub_6158(&qword_109F8);
  sub_69A4(a1, (uint64_t)&v8[*(int *)(v18 + 44)]);
  sub_8C2C((uint64_t)v14, (uint64_t)v12, &qword_109F0);
  sub_8C2C((uint64_t)v8, (uint64_t)v6, &qword_109E8);
  sub_8C2C((uint64_t)v12, a2, &qword_109F0);
  uint64_t v19 = sub_6158(&qword_10A00);
  uint64_t v20 = a2 + *(int *)(v19 + 48);
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  *(void *)(v20 + 16) = v15;
  *(unsigned char *)(v20 + 24) = v26;
  *(void *)(v20 + 32) = v16;
  *(unsigned char *)(v20 + 40) = v17;
  uint64_t v21 = v24;
  *(void *)(v20 + 48) = v25;
  *(void *)(v20 + 56) = v21;
  sub_8C2C((uint64_t)v6, a2 + *(int *)(v19 + 64), &qword_109E8);
  sub_8BD0((uint64_t)v8, &qword_109E8);
  sub_8BD0((uint64_t)v14, &qword_109F0);
  sub_8BD0((uint64_t)v6, &qword_109E8);
  return sub_8BD0((uint64_t)v12, &qword_109F0);
}

uint64_t sub_6720@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_6158(&qword_10A28) - 8;
  __chkstk_darwin();
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_9040() - 8;
  __chkstk_darwin();
  id v8 = (uint64_t *)((char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_9270();
  uint64_t v30 = v12;
  uint64_t v13 = v1[2];
  swift_retain();
  sub_9270();
  sub_9000();
  uint64_t v14 = v31;
  char v15 = v32;
  uint64_t v28 = v33;
  int v27 = v34;
  uint64_t v25 = v36;
  uint64_t v26 = v35;
  uint64_t v16 = v1[8];
  char v17 = (char *)v8 + *(int *)(v6 + 28);
  uint64_t v18 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v19 = sub_9100();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  *id v8 = v16;
  v8[1] = v16;
  sub_83F0((uint64_t)v8, (uint64_t)v5);
  *(_WORD *)&v5[*(int *)(v3 + 44)] = 256;
  uint64_t v20 = sub_6158(&qword_109F0);
  sub_8C2C((uint64_t)v5, a1 + *(int *)(v20 + 36), &qword_10A28);
  *(void *)a1 = sub_83E8;
  *(void *)(a1 + 8) = v11;
  uint64_t v21 = v29;
  uint64_t v22 = v30;
  *(void *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = v22;
  *(void *)(a1 + 40) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v14;
  *(unsigned char *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v28;
  *(unsigned char *)(a1 + 80) = v27;
  uint64_t v23 = v25;
  *(void *)(a1 + 88) = v26;
  *(void *)(a1 + 96) = v23;
  swift_retain();
  swift_retain();
  sub_8BD0((uint64_t)v5, &qword_10A28);
  sub_8454((uint64_t)v8);
  swift_release();
  return swift_release();
}

uint64_t sub_69A4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = sub_9030();
  uint64_t v48 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  __chkstk_darwin();
  uint64_t v45 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_6158(&qword_10A08);
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v42 = v5;
  __chkstk_darwin();
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_6158(&qword_10A10);
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v47 = v8;
  __chkstk_darwin();
  v44 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6158(&qword_10A18);
  __chkstk_darwin();
  uint64_t v43 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = a1;
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  v51 = v11;
  v52 = v12;
  sub_82E4();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_91A0();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  sub_9140();
  uint64_t v18 = sub_9190();
  uint64_t v20 = v19;
  char v22 = v21;
  swift_release();
  sub_8338(v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_9230();
  uint64_t v23 = sub_9180();
  uint64_t v25 = v24;
  LOBYTE(v15) = v26;
  uint64_t v28 = v27;
  swift_release();
  sub_8338(v18, v20, v22 & 1);
  swift_bridgeObjectRelease();
  v51 = (void *)v23;
  v52 = (void *)v25;
  char v53 = v15 & 1;
  uint64_t v54 = v28;
  sub_9210();
  sub_8338(v23, v25, v15 & 1);
  uint64_t v29 = v40;
  swift_bridgeObjectRelease();
  id v30 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  [v30 lineHeight];

  v51 = &type metadata for Text;
  v52 = &protocol witness table for Text;
  swift_getOpaqueTypeConformance2();
  uint64_t v31 = v44;
  uint64_t v32 = v42;
  sub_9200();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v32);
  type metadata accessor for CLPhotosSharedAlbumRow();
  uint64_t v33 = v45;
  sub_7614(v45);
  char v34 = sub_9020();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v33, v49);
  double v35 = 0.0;
  if (v34) {
    double v35 = *((double *)v29 + 6);
  }
  sub_9270();
  char v36 = (v34 & 1) == 0;
  uint64_t v37 = v43;
  __n128 v38 = sub_6E68(0.0, 1, 0.0, 1, 0.0, 1, v35, v36, v43, 0.0, 1, 0.0, 1);
  (*(void (**)(char *, uint64_t, __n128))(v46 + 8))(v31, v47, v38);
  return sub_8348(v37, v50);
}

__n128 sub_6E68@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    sub_92A0();
    uint64_t v23 = (void *)sub_9130();
    sub_8FE0();
  }
  sub_9050();
  uint64_t v24 = sub_6158(&qword_10A10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_6158(&qword_10A18) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_705C()
{
  return sub_91F0();
}

uint64_t sub_7078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_9030();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_7614((uint64_t)v7);
  char v8 = sub_9020();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v8) {
    uint64_t v9 = sub_90E0();
  }
  else {
    uint64_t v9 = sub_90F0();
  }
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v10 = sub_6158(&qword_109E0);
  return sub_64C4(v2, a1 + *(int *)(v10 + 44));
}

uint64_t sub_71A0@<X0>(uint64_t *a1@<X8>)
{
  char v36 = a1;
  uint64_t v35 = sub_6158(&qword_10A30) - 8;
  __chkstk_darwin();
  uint64_t v34 = (uint64_t)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6158(&qword_10A38);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_6158(&qword_10A40);
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  __chkstk_darwin();
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_6158(&qword_10A48);
  __chkstk_darwin();
  char v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6158(&qword_10A50);
  __chkstk_darwin();
  __n128 v30 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_9010();
  sub_9010();
  id v10 = [self tertiarySystemFillColor];
  uint64_t v29 = sub_9240();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_9260();
  uint64_t v12 = sub_9220();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v14 = sub_9150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v3, 1, 1, v14);
  uint64_t v15 = sub_9170();
  sub_8BD0((uint64_t)v3, &qword_10A38);
  uint64_t v16 = swift_getKeyPath();
  uint64_t v37 = v11;
  uint64_t v38 = KeyPath;
  uint64_t v39 = v12;
  uint64_t v40 = v16;
  uint64_t v41 = v15;
  sub_9160();
  sub_6158(&qword_10A58);
  sub_89BC();
  sub_91D0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v18 = v32;
  uint64_t v17 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v8, v6, v33);
  *(void *)&v8[*(int *)(v31 + 36)] = 0x3FF0000000000000;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v17);
  sub_8AFC();
  uint64_t v19 = (uint64_t)v30;
  sub_91E0();
  sub_8BD0((uint64_t)v8, &qword_10A48);
  uint64_t v20 = sub_9270();
  uint64_t v22 = v21;
  uint64_t v23 = v34;
  sub_8C2C(v19, v34, &qword_10A50);
  uint64_t v24 = (uint64_t *)(v23 + *(int *)(v35 + 44));
  *uint64_t v24 = v20;
  v24[1] = v22;
  uint64_t v25 = sub_6158(&qword_10AB0);
  char v26 = v36;
  sub_8C2C(v23, (uint64_t)v36 + *(int *)(v25 + 36), &qword_10A30);
  *char v26 = v29;
  swift_retain();
  sub_8BD0(v23, &qword_10A30);
  sub_8BD0(v19, &qword_10A50);
  return swift_release();
}

uint64_t sub_7614@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_90D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6158(&qword_10920);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8C2C(v2, (uint64_t)v9, &qword_10920);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_9030();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = sub_92A0();
    uint64_t v13 = sub_9130();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_84B0(0x5463696D616E7944, 0xEF657A6953657079, &v16);
      _os_log_impl(&dword_0, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_90C0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_78A8()
{
  return sub_9060();
}

uint64_t sub_78CC(uint64_t a1)
{
  uint64_t v2 = sub_9030();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_9070();
}

uint64_t sub_7998(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = a2[4];
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    uint64_t v7 = *(int *)(a3 + 40);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_6158(&qword_10920);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_9030();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_7AF0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  sub_6158(&qword_10920);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_9030();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_7BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_6158(&qword_10920);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_9030();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_7CB8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 40);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_8BD0((uint64_t)a1 + v6, &qword_10920);
    sub_6158(&qword_10920);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_9030();
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

uint64_t sub_7E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v4 = *(int *)(a3 + 40);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_6158(&qword_10920);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_9030();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_7F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_8BD0(a1 + v8, &qword_10920);
    uint64_t v11 = sub_6158(&qword_10920);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_9030();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_802C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8040);
}

uint64_t sub_8040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_6158(&qword_10928);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_80F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8108);
}

uint64_t sub_8108(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_6158(&qword_10928);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_81B4()
{
  sub_8270();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_8270()
{
  if (!qword_10998)
  {
    sub_9030();
    unint64_t v0 = sub_8FF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10998);
    }
  }
}

uint64_t sub_82C8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_82E4()
{
  unint64_t result = qword_10A20;
  if (!qword_10A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A20);
  }
  return result;
}

uint64_t sub_8338(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_8348(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6158(&qword_10A18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_83B0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_83E8@<X0>(uint64_t *a1@<X8>)
{
  return sub_71A0(a1);
}

uint64_t sub_83F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9040();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_8454(uint64_t a1)
{
  uint64_t v2 = sub_9040();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_84B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_8584(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_8CE0((uint64_t)v12, *a3);
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
      sub_8CE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_8C90((uint64_t)v12);
  return v7;
}

unint64_t sub_8584(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_8684(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_92D0();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_8684(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_871C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_8820(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_8820((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_871C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_87B8(v2, 0);
      unint64_t result = (void *)sub_92C0();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_9290();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_87B8(uint64_t a1, uint64_t a2)
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
  sub_6158(&qword_10AB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_8820(char *result, int64_t a2, char a3, char *a4)
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
    sub_6158(&qword_10AB8);
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
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_890C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9080();
  *a1 = result;
  return result;
}

uint64_t sub_8938()
{
  return sub_9090();
}

uint64_t sub_8964@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_90A0();
  *a1 = result;
  return result;
}

uint64_t sub_8990()
{
  return sub_90B0();
}

unint64_t sub_89BC()
{
  unint64_t result = qword_10A60;
  if (!qword_10A60)
  {
    sub_61F8(&qword_10A58);
    sub_8A5C();
    sub_8EC0(&qword_10A88, &qword_10A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A60);
  }
  return result;
}

unint64_t sub_8A5C()
{
  unint64_t result = qword_10A68;
  if (!qword_10A68)
  {
    sub_61F8(&qword_10A70);
    sub_8EC0(&qword_10A78, &qword_10A80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A68);
  }
  return result;
}

unint64_t sub_8AFC()
{
  unint64_t result = qword_10A98;
  if (!qword_10A98)
  {
    sub_61F8(&qword_10A48);
    sub_61F8(&qword_10A58);
    sub_89BC();
    swift_getOpaqueTypeConformance2();
    sub_8EC0(&qword_10AA0, &qword_10AA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10A98);
  }
  return result;
}

uint64_t sub_8BD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6158(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8C2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_6158(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_8C90(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_8CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for Placeholder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Placeholder()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Placeholder(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for Placeholder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Placeholder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Placeholder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Placeholder()
{
  return &type metadata for Placeholder;
}

uint64_t sub_8E84()
{
  return sub_8EC0(&qword_10AC0, &qword_10AC8);
}

uint64_t sub_8EC0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_61F8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_8F08(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Selected indexPath: %@, with Shared Album Identifier: %@", (uint8_t *)&v3, 0x16u);
}

void sub_8F90()
{
  uint64_t v0 = abort_report_np();
  sub_8FB8(v0);
}

void sub_8FB8()
{
}

uint64_t sub_8FE0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_8FF0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_9000()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_9010()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_9020()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_9030()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_9040()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_9050()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_9060()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_9070()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_9080()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_9090()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_90A0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_90B0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_90C0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_90D0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_90E0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_90F0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_9100()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_9110()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_9120()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_9130()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_9140()
{
  return static Font.body.getter();
}

uint64_t sub_9150()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_9160()
{
  return static Font.Weight.light.getter();
}

uint64_t sub_9170()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_9180()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_9190()
{
  return Text.font(_:)();
}

uint64_t sub_91A0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_91B0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_91C0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_91D0()
{
  return View.fontWeight(_:)();
}

uint64_t sub_91E0()
{
  return View.accessibility(hidden:)();
}

uint64_t sub_91F0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_9200()
{
  return View.bodyHeadOutdent(_:)();
}

uint64_t sub_9210()
{
  return View.hyphenationFactor(_:)();
}

uint64_t sub_9220()
{
  return static Color.accentColor.getter();
}

uint64_t sub_9230()
{
  return static Color.primary.getter();
}

uint64_t sub_9240()
{
  return Color.init(_:)();
}

uint64_t sub_9250()
{
  return Image.init(uiImage:)();
}

uint64_t sub_9260()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_9270()
{
  return static Alignment.center.getter();
}

uint64_t sub_9280()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_9290()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_92A0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_92B0()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_92C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_92D0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t AXLogTemp()
{
  return _AXLogTemp();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t CLFLogCommon()
{
  return _CLFLogCommon();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend__isSharedAlbumSpecifierSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSharedAlbumSpecifierSelected:");
}

id objc_msgSend__loadSharedAlbumsCloudIdentifiersFromLocalIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSharedAlbumsCloudIdentifiersFromLocalIdentifiers:");
}

id objc_msgSend__loadSharedAlbumsLocalIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _loadSharedAlbumsLocalIdentifiers];
}

id objc_msgSend__sharedAlbumIdentifierFromSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharedAlbumIdentifierFromSpecifier:");
}

id objc_msgSend__sharedAlbumSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _sharedAlbumSpecifiers];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_applicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWithBundleIdentifier:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticateForSubject_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateForSubject:completion:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cloudIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 cloudIdentifier];
}

id objc_msgSend_cloudIdentifierMappingsForLocalIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudIdentifierMappingsForLocalIdentifiers:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 contentConfiguration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createRowCellContentForSharedAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRowCellContentForSharedAlbum:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_fetchAssetCollectionsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetCollectionsWithLocalIdentifiers:options:");
}

id objc_msgSend_fetchAssetCollectionsWithType_subtype_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetCollectionsWithType:subtype:options:");
}

id objc_msgSend_fetchAssetsInAssetCollection_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsInAssetCollection:options:");
}

id objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithLocalIdentifiers:options:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_includeSharedAlbums(void *a1, const char *a2, ...)
{
  return _[a1 includeSharedAlbums];
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localIdentifier];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_requestImageForAsset_targetSize_contentMode_options_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageForAsset:targetSize:contentMode:options:resultHandler:");
}

id objc_msgSend_selectedSharedAlbumCloudIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 selectedSharedAlbumCloudIdentifiers];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setCloudIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudIdentifier:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setDeliveryMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliveryMode:");
}

id objc_msgSend_setIncludeSharedAlbums_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeSharedAlbums:");
}

id objc_msgSend_setLocalIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalIdentifier:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setSelectedSharedAlbumCloudIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedSharedAlbumCloudIdentifiers:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSynchronous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynchronous:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_sharedAlbums(void *a1, const char *a2, ...)
{
  return _[a1 sharedAlbums];
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return _[a1 sharedGuard];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return _[a1 sharedPhotoLibrary];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}