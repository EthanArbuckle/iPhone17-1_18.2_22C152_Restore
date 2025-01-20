void sub_100004AF0(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100004AFC()
{
  uint64_t v0 = sub_10001F8B0();
  uint64_t v2 = v1;
  if (v0 == sub_10001F8B0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10001FB00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_100004B88@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100004B94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001F8B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for IXAppRemovability()
{
  if (!qword_10002D5E8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10002D5E8);
    }
  }
}

ValueMetadata *type metadata accessor for ExtensionLocations()
{
  return &type metadata for ExtensionLocations;
}

uint64_t sub_100004C2C()
{
  uint64_t v0 = sub_10001F7D0();
  sub_100004C78(v0, qword_10002D890);
  sub_100004CDC(v0, (uint64_t)qword_10002D890);
  return sub_100004D14();
}

uint64_t *sub_100004C78(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100004CDC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004D14()
{
  uint64_t v0 = sub_10001F7D0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  v7 = (char *)&v12 - v6;
  __chkstk_darwin(v5);
  v9 = (char *)&v12 - v8;
  sub_10001F790();
  sub_10001F7B0();
  v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  sub_10001F7B0();
  v10(v7, v0);
  sub_10001F7B0();
  return ((uint64_t (*)(char *, uint64_t))v10)(v9, v0);
}

BOOL sub_100004EE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100004EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 7104878;
  if (a1)
  {
    uint64_t v6 = sub_10001F910();
    uint64_t v8 = v7;
    if (a2) {
      goto LABEL_3;
    }
LABEL_6:
    v11 = (void *)0xE300000000000000;
    uint64_t v9 = 7104878;
    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    v13 = (void *)0xE300000000000000;
    goto LABEL_8;
  }
  uint64_t v8 = (void *)0xE300000000000000;
  uint64_t v6 = 7104878;
  if (!a2) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v9 = sub_10001F910();
  v11 = v10;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = sub_10001F910();
  v13 = v12;
LABEL_8:
  sub_10001FA70(75);
  v15._object = (void *)0x8000000100024590;
  v15._countAndFlagsBits = 0xD00000000000002CLL;
  sub_10001F8D0(v15);
  v16._countAndFlagsBits = v6;
  v16._object = v8;
  sub_10001F8D0(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0x6C41726576656E20;
  v17._object = (void *)0xED0000203A776F6CLL;
  sub_10001F8D0(v17);
  v18._countAndFlagsBits = v9;
  v18._object = v11;
  sub_10001F8D0(v18);
  swift_bridgeObjectRelease();
  v19._countAndFlagsBits = 0x6C6C41796C6E6F20;
  v19._object = (void *)0xEC000000203A776FLL;
  sub_10001F8D0(v19);
  v20._countAndFlagsBits = v5;
  v20._object = v13;
  sub_10001F8D0(v20);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100005094(char a1)
{
  uint64_t result = 0x746E756F636361;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x706F7244726961;
      break;
    case 2:
      uint64_t result = 0x436465776F6C6C61;
      break;
    case 3:
      uint64_t result = 0x746163696C707061;
      break;
    case 4:
      uint64_t result = 0x65726F7453707061;
      break;
    case 5:
      uint64_t result = 0x6172656D6163;
      break;
    case 6:
      uint64_t result = 0x74616C75636C6163;
      break;
    case 7:
      uint64_t result = 0x79616C50726163;
      break;
    case 8:
      uint64_t result = 0x72616C756C6C6563;
      break;
    case 9:
      uint64_t result = 0x54646E4165746164;
      break;
    case 10:
      uint64_t result = 0x656D695465636166;
      break;
    case 11:
      uint64_t result = 0x794D646E6966;
      break;
    case 12:
      uint64_t result = 0x746E6543656D6167;
      break;
    case 13:
      uint64_t result = 0x6472616F6279656BLL;
      break;
    case 14:
      uint64_t result = 0x616964656DLL;
      break;
    case 15:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 16:
      uint64_t result = 1937204590;
      break;
    case 17:
      uint64_t result = 0x6163696669746F6ELL;
      break;
    case 18:
      uint64_t result = 0x65646F6373736170;
      break;
    case 19:
      uint64_t result = 0x79636176697270;
      break;
    case 20:
      uint64_t result = 0x697261666173;
      break;
    case 21:
      uint64_t result = 1769105779;
      break;
    case 22:
      uint64_t result = 0x65746E6F43626577;
      break;
    case 23:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    case 24:
      uint64_t result = 0x726F707075736E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100005388(void **a1, void **a2)
{
  return sub_1000053B0(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_1000053A4()
{
  return sub_100004EFC(*v0, v0[1], v0[2]);
}

uint64_t sub_1000053B0(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  if (a1)
  {
    if (!a4 || (sub_100007C28(a1, a4) & 1) == 0) {
      return 0;
    }
  }
  else if (a4)
  {
    return 0;
  }
  if (a2)
  {
    if (!a5 || (sub_100007C28(a2, a5) & 1) == 0) {
      return 0;
    }
  }
  else if (a5)
  {
    return 0;
  }
  if (a3)
  {
    if (a6 && (sub_100007C28(a3, a6) & 1) != 0) {
      return 1;
    }
  }
  else if (!a6)
  {
    return 1;
  }
  return 0;
}

NSNumber sub_10000544C()
{
  sub_100005484();
  result.super.super.isa = sub_10001F990(1000).super.super.isa;
  qword_10002D8A8 = (uint64_t)result.super.super.isa;
  return result;
}

unint64_t sub_100005484()
{
  unint64_t result = qword_10002D5F0[0];
  if (!qword_10002D5F0[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_10002D5F0);
  }
  return result;
}

NSNumber sub_1000054C4()
{
  sub_100005484();
  result.super.super.isa = sub_10001F990(2000).super.super.isa;
  qword_10002D8B0 = (uint64_t)result.super.super.isa;
  return result;
}

id sub_1000054FC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v10 = [self sharedConnection];
  if (a1) {
    v11.super.isa = sub_10001F860().super.isa;
  }
  else {
    v11.super.isa = 0;
  }
  NSString v12 = sub_10001F8A0();
  sub_10001F8B0();
  v18[1] = v13;
  v19._countAndFlagsBits = 46;
  v19._object = (void *)0xE100000000000000;
  sub_10001F8D0(v19);
  v20._countAndFlagsBits = a2;
  v20._object = a3;
  sub_10001F8D0(v20);
  NSString v14 = sub_10001F8A0();
  swift_bridgeObjectRelease();
  v18[0] = 0;
  unsigned int v15 = [v10 applyRestrictionDictionary:v11.super.isa clientType:v12 clientUUID:v14 localizedClientDescription:0 localizedWarningMessage:0 outRestrictionChanged:a4 outEffectiveSettingsChanged:a5 outError:v18];
  swift_unknownObjectRelease();

  if (v15) {
    return v18[0];
  }
  id v17 = v18[0];
  sub_10001F780();

  return (id)swift_willThrow();
}

void sub_1000056E8(uint64_t *a1@<X8>)
{
  uint64_t v2 = self;
  id v3 = [v2 bookstoreAllowed];
  uint64_t v4 = sub_10001F8B0();
  uint64_t v57 = v5;
  uint64_t v58 = v4;

  id v6 = [v2 bookstoreEroticaAllowed];
  uint64_t v7 = sub_10001F8B0();
  uint64_t v55 = v8;
  uint64_t v56 = v7;

  id v9 = [v2 explicitContentAllowed];
  uint64_t v10 = sub_10001F8B0();
  uint64_t v53 = v11;
  uint64_t v54 = v10;

  id v12 = [v2 iTunesAllowed];
  uint64_t v13 = sub_10001F8B0();
  uint64_t v51 = v14;
  uint64_t v52 = v13;

  id v15 = [v2 maximumMoviesRating];
  uint64_t v16 = sub_10001F8B0();
  uint64_t v49 = v17;
  uint64_t v50 = v16;

  id v18 = [v2 maximumTVShowsRating];
  uint64_t v19 = sub_10001F8B0();
  uint64_t v47 = v20;
  uint64_t v48 = v19;

  id v21 = [v2 musicArtistActivityAllowed];
  uint64_t v22 = sub_10001F8B0();
  uint64_t v45 = v23;
  uint64_t v46 = v22;

  id v24 = [v2 musicServiceAllowed];
  uint64_t v25 = sub_10001F8B0();
  uint64_t v43 = v26;
  uint64_t v44 = v25;

  id v27 = [v2 musicVideosAllowed];
  uint64_t v28 = sub_10001F8B0();
  uint64_t v30 = v29;

  id v31 = [v2 podcastsAllowed];
  uint64_t v32 = sub_10001F8B0();
  uint64_t v34 = v33;

  id v35 = [v2 speakerVolumeLimitModificationAllowed];
  uint64_t v36 = sub_10001F8B0();
  uint64_t v38 = v37;

  id v39 = [v2 tvProviderModificationAllowed];
  uint64_t v40 = sub_10001F8B0();
  uint64_t v42 = v41;

  *a1 = v58;
  a1[1] = v57;
  a1[2] = v56;
  a1[3] = v55;
  a1[4] = v54;
  a1[5] = v53;
  a1[6] = v52;
  a1[7] = v51;
  a1[8] = v50;
  a1[9] = v49;
  a1[10] = v48;
  a1[11] = v47;
  a1[12] = v46;
  a1[13] = v45;
  a1[14] = v44;
  a1[15] = v43;
  a1[16] = v28;
  a1[17] = v30;
  a1[18] = v32;
  a1[19] = v34;
  a1[20] = v36;
  a1[21] = v38;
  a1[22] = v40;
  a1[23] = v42;
}

void sub_10000599C(uint64_t *a1@<X8>)
{
  uint64_t v2 = self;
  id v3 = [v2 inAppPurchasesAllowed];
  uint64_t v4 = sub_10001F8B0();
  uint64_t v27 = v5;
  uint64_t v28 = v4;

  id v6 = [v2 iTunesStorePasswordEntryForced];
  uint64_t v7 = sub_10001F8B0();
  uint64_t v25 = v8;
  uint64_t v26 = v7;

  id v9 = [v2 marketplaceAppInstallationAllowed];
  uint64_t v10 = sub_10001F8B0();
  uint64_t v12 = v11;

  id v13 = [v2 maximumAppsRating];
  uint64_t v14 = sub_10001F8B0();
  uint64_t v16 = v15;

  id v17 = [v2 uiAppInstallationAllowed];
  uint64_t v18 = sub_10001F8B0();
  uint64_t v20 = v19;

  id v21 = [v2 webDistributionAppInstallationAllowed];
  uint64_t v22 = sub_10001F8B0();
  uint64_t v24 = v23;

  *a1 = v28;
  a1[1] = v27;
  a1[2] = v26;
  a1[3] = v25;
  a1[4] = v10;
  a1[5] = v12;
  a1[6] = v14;
  a1[7] = v16;
  a1[8] = v18;
  a1[9] = v20;
  a1[10] = v22;
  a1[11] = v24;
}

void sub_100005B18(uint64_t *a1@<X8>)
{
  uint64_t v2 = self;
  id v3 = [v2 forceWebContentFilterAuto];
  uint64_t v4 = sub_10001F8B0();
  uint64_t v22 = v5;
  uint64_t v23 = v4;

  id v6 = [v2 webContentFilterAutoPermittedURLs];
  uint64_t v7 = sub_10001F8B0();
  uint64_t v9 = v8;

  id v10 = [v2 webContentFilterBlockedURLs];
  uint64_t v11 = sub_10001F8B0();
  uint64_t v13 = v12;

  id v14 = [v2 webContentFilterOnlyAllowedBookmarks];
  uint64_t v15 = sub_10001F8B0();
  uint64_t v17 = v16;

  id v18 = [v2 webContentFilterOnlyAllowedURLs];
  uint64_t v19 = sub_10001F8B0();
  uint64_t v21 = v20;

  *a1 = v23;
  a1[1] = v22;
  a1[2] = v7;
  a1[3] = v9;
  a1[4] = v11;
  a1[5] = v13;
  a1[6] = v15;
  a1[7] = v17;
  a1[8] = v19;
  a1[9] = v21;
}

void sub_100005C60(uint64_t *a1@<X8>)
{
  uint64_t v2 = self;
  id v3 = [v2 appClipsAllowed];
  uint64_t v4 = sub_10001F8B0();
  uint64_t v22 = v5;
  uint64_t v23 = v4;

  id v6 = [v2 appInstallationAllowed];
  uint64_t v7 = sub_10001F8B0();
  uint64_t v9 = v8;

  id v10 = [v2 appRemovalAllowed];
  uint64_t v11 = sub_10001F8B0();
  uint64_t v13 = v12;

  id v14 = [v2 automaticAppUpdatesAllowed];
  uint64_t v15 = sub_10001F8B0();
  uint64_t v17 = v16;

  id v18 = [v2 blockedAppBundleIDs];
  uint64_t v19 = sub_10001F8B0();
  uint64_t v21 = v20;

  *a1 = v23;
  a1[1] = v22;
  a1[2] = v7;
  a1[3] = v9;
  a1[4] = v11;
  a1[5] = v13;
  a1[6] = v15;
  a1[7] = v17;
  a1[8] = v19;
  a1[9] = v21;
}

void sub_100005DA8(uint64_t *a1@<X8>)
{
  uint64_t v2 = self;
  id v3 = [v2 addingGameCenterFriendsAllowed];
  uint64_t v4 = sub_10001F8B0();
  uint64_t v42 = v5;
  uint64_t v43 = v4;

  id v6 = [v2 allowedOtherPlayerTypes];
  uint64_t v7 = sub_10001F8B0();
  uint64_t v40 = v8;
  uint64_t v41 = v7;

  id v9 = [v2 gameCenterFriendsSharingModificationAllowed];
  uint64_t v10 = sub_10001F8B0();
  uint64_t v38 = v11;
  uint64_t v39 = v10;

  id v12 = [v2 gameCenterAllowed];
  uint64_t v13 = sub_10001F8B0();
  uint64_t v36 = v14;
  uint64_t v37 = v13;

  id v15 = [v2 multiplayerGamingAllowed];
  uint64_t v16 = sub_10001F8B0();
  uint64_t v34 = v17;
  uint64_t v35 = v16;

  id v18 = [v2 gameCenterNearbyMultiplayerAllowed];
  uint64_t v19 = sub_10001F8B0();
  uint64_t v21 = v20;

  id v22 = [v2 gameCenterPrivateMessagingAllowed];
  uint64_t v23 = sub_10001F8B0();
  uint64_t v25 = v24;

  id v26 = [v2 gameCenterProfileModificationAllowed];
  uint64_t v27 = sub_10001F8B0();
  uint64_t v29 = v28;

  id v30 = [v2 gameCenterProfilePrivacyModificationAllowed];
  uint64_t v31 = sub_10001F8B0();
  uint64_t v33 = v32;

  *a1 = v43;
  a1[1] = v42;
  a1[2] = v41;
  a1[3] = v40;
  a1[4] = v39;
  a1[5] = v38;
  a1[6] = v37;
  a1[7] = v36;
  a1[8] = v35;
  a1[9] = v34;
  a1[10] = v19;
  a1[11] = v21;
  a1[12] = v23;
  a1[13] = v25;
  a1[14] = v27;
  a1[15] = v29;
  a1[16] = v31;
  a1[17] = v33;
}

ValueMetadata *type metadata accessor for MCInterface()
{
  return &type metadata for MCInterface;
}

uint64_t sub_100005FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t initializeBufferWithCopyOfBuffer for EffectiveManagedSettings(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_10000600C(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_100006050(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10000609C(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 sub_100006118(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006124(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100006174(uint64_t *a1, int a2)
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

uint64_t sub_1000061BC(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for PreviousSettings()
{
  return sub_100006214();
}

uint64_t sub_100006214()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100006248()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100006298()
{
  sub_10000633C(v0 + 16);
  sub_10000633C(v0 + 56);
  sub_10000633C(v0 + 96);
  uint64_t v1 = *(void **)(v0 + 144);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000062F0()
{
  sub_100006298();
  return _swift_deallocClassInstance(v0, 168, 7);
}

uint64_t type metadata accessor for MCAdapter()
{
  return sub_100006214();
}

uint64_t sub_10000633C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_10000638C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    id v9 = &_swiftEmptyArrayStorage;
    sub_10000849C(0, v1, 0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000849C(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000849C(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_1000160EC(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1000064B4(uint64_t a1, void *a2)
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10001F850();
  sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
  unint64_t v5 = sub_10001F830();
  os_log_type_t v6 = sub_10001F970();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying effective application settings", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = sub_10001201C();
  if (*(void *)(v8 + 16))
  {
    sub_10000AC40(v8, a1, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10000AC40(0, a1, a2);
  }
  return sub_10000676C();
}

uint64_t sub_10000676C()
{
  swift_beginAccess();
  uint64_t v2 = v0[17];
  int64_t v1 = (void *)v0[18];
  uint64_t v4 = v0[19];
  uint64_t v3 = v0[20];
  swift_bridgeObjectRetain();
  id v5 = v1;
  swift_bridgeObjectRetain();
  [v5 lock];
  if (*(void *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v6 = sub_1000090BC(v4, v3);
    if (v7)
    {
      sub_100007A88(*(void *)(v2 + 56) + 32 * v6, (uint64_t)&v18);
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  [v5 unlock];
  if (*((void *)&v19 + 1))
  {
    sub_100007B44(&qword_10002D7A8);
    if (swift_dynamicCast())
    {
      uint64_t v8 = v17;
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  else
  {
    sub_100007AE4((uint64_t)&v18);
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v8 = &_swiftEmptyArrayStorage;
LABEL_12:
  uint64_t v9 = sub_10001B82C();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_100012110((uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_100012110(v11);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1000121A8(v10, v12);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13[2]) {
    sub_10001F440(2, (uint64_t)v13);
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v15 + 16)) {
    sub_10001F440(1, v15);
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_100006984(v9);
  return swift_endAccess();
}

uint64_t sub_100006984(uint64_t a1)
{
  v8[3] = sub_100007B44(&qword_10002D7A8);
  v8[0] = a1;
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  id v5 = (void *)v1[1];
  swift_bridgeObjectRetain();
  [v5 lock];
  sub_100016508((uint64_t)v8, (uint64_t)v7, &qword_10002D790);
  swift_bridgeObjectRetain();
  sub_100006CA4((uint64_t)v7, v4, v3);
  sub_100012270();
  [v5 unlock];
  swift_bridgeObjectRelease();
  return sub_100007AE4((uint64_t)v8);
}

unint64_t sub_100006A3C()
{
  if (qword_10002D5C0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F7D0();
  sub_100004CDC(v0, (uint64_t)qword_10002D890);
  uint64_t v6 = sub_10001F7E0();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  Class isa = sub_10001F7F0().super.isa;
  v15[0] = 0;
  id v11 = [v9 propertyListWithData:isa options:0 format:0 error:v15];

  if (v11)
  {
    id v12 = v15[0];
    sub_10001F9D0();
    sub_100016094(v6, v8);
    swift_unknownObjectRelease();
    sub_100007B44(&qword_10002D7E8);
    if (swift_dynamicCast()) {
      return v14;
    }
  }
  else
  {
    id v13 = v15[0];
    sub_10001F780();

    swift_willThrow();
    sub_100016094(v6, v8);
    swift_errorRelease();
  }
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001F850();
  sub_100004CDC(v1, (uint64_t)qword_10002D8B8);
  uint64_t v2 = sub_10001F830();
  os_log_type_t v3 = sub_10001F960();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to read previous settings", v4, 2u);
    swift_slowDealloc();
  }

  return sub_100006D64((uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_100006CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1000160EC((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *os_log_type_t v3 = 0x8000000000000000;
    sub_1000099B0(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *os_log_type_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100007AE4(a1);
    sub_1000093D4(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_100007AE4((uint64_t)v9);
  }
}

unint64_t sub_100006D64(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007B44(&qword_10002D7C0);
  uint64_t v2 = sub_10001FAE0();
  os_log_type_t v3 = (void *)v2;
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
    sub_100016508(v6, (uint64_t)&v15, &qword_10002D7F0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000090BC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000160EC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_100006E9C()
{
  sub_1000091E4((void *)(v0 + 56), *(void *)(v0 + 80));
  switch(sub_100016924())
  {
    case 1u:
      sub_100005094(1);
      sub_10000D638();
      goto LABEL_25;
    case 2u:
      sub_100005094(2);
      sub_10000BB14();
      goto LABEL_25;
    case 3u:
      uint64_t v1 = sub_100005094(3);
      sub_1000064B4(v1, v2);
      goto LABEL_25;
    case 4u:
      uint64_t v3 = sub_100005094(4);
      sub_10000F42C(v3, v4);
      goto LABEL_25;
    case 5u:
      sub_100005094(5);
      sub_10000E358();
      goto LABEL_25;
    case 6u:
      sub_100005094(6);
      sub_100010FD8();
      goto LABEL_25;
    case 7u:
      sub_100005094(7);
      sub_10000B760();
      goto LABEL_25;
    case 8u:
      uint64_t v5 = sub_100005094(8);
      uint64_t v7 = "Applying effective cellular settings";
      uint64_t v8 = sub_10000DF68;
      goto LABEL_24;
    case 9u:
      sub_100005094(9);
      sub_10000FAD8();
      goto LABEL_25;
    case 0xAu:
      sub_100005094(10);
      sub_10000FE8C();
      goto LABEL_25;
    case 0xBu:
      sub_100005094(11);
      sub_100013278();
      goto LABEL_25;
    case 0xCu:
      uint64_t v5 = sub_100005094(12);
      uint64_t v7 = "Applying effective GameCenter settings";
      uint64_t v8 = sub_1000144DC;
      goto LABEL_24;
    case 0xDu:
      sub_100005094(13);
      sub_100014988();
      goto LABEL_25;
    case 0xEu:
      uint64_t v5 = sub_100005094(14);
      uint64_t v7 = "Applying effective media settings";
      uint64_t v8 = sub_10000D50C;
      goto LABEL_24;
    case 0xFu:
      sub_100005094(15);
      sub_100014F1C();
      goto LABEL_25;
    case 0x10u:
      sub_100005094(16);
      sub_10001138C();
      goto LABEL_25;
    case 0x11u:
      sub_100005094(17);
      sub_10000F724();
      goto LABEL_25;
    case 0x12u:
      sub_100005094(18);
      sub_10001027C();
      goto LABEL_25;
    case 0x13u:
      sub_100005094(19);
      sub_10001546C();
      goto LABEL_25;
    case 0x14u:
      uint64_t v5 = sub_100005094(20);
      uint64_t v7 = "Applying effective Safari settings";
      uint64_t v8 = sub_100015F54;
      goto LABEL_24;
    case 0x15u:
      uint64_t v5 = sub_100005094(21);
      uint64_t v7 = "Applying effective Siri settings";
      uint64_t v8 = sub_10001318C;
LABEL_24:
      sub_10000E04C(v5, v6, v7, v8);
      goto LABEL_25;
    case 0x16u:
      sub_100005094(22);
      sub_100010C48();
      goto LABEL_25;
    case 0x17u:
      if (qword_10002D5E0 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_10001F850();
      sub_100004CDC(v9, (uint64_t)qword_10002D8B8);
      oslog = sub_10001F830();
      os_log_type_t v10 = sub_10001F960();
      if (!os_log_type_enabled(oslog, v10)) {
        goto LABEL_38;
      }
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      uint64_t v12 = "Skipping unknown settings group";
      goto LABEL_37;
    case 0x18u:
      if (qword_10002D5E0 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_10001F850();
      sub_100004CDC(v13, (uint64_t)qword_10002D8B8);
      oslog = sub_10001F830();
      os_log_type_t v10 = sub_10001F960();
      if (!os_log_type_enabled(oslog, v10)) {
        goto LABEL_38;
      }
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      uint64_t v12 = "Skipping unsupported settings group";
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, oslog, v10, v12, v11, 2u);
      swift_slowDealloc();
LABEL_38:

      break;
    default:
      sub_100005094(0);
      sub_10000BEC8();
LABEL_25:
      swift_bridgeObjectRelease();
      break;
  }
}

uint64_t sub_10000735C()
{
  return 1;
}

Swift::Int sub_100007364()
{
  return sub_10001FBA0();
}

void sub_1000073A8()
{
}

Swift::Int sub_1000073D0()
{
  return sub_10001FBA0();
}

void sub_100007420(void *a1)
{
  id v2 = [a1 inputItems];
  uint64_t v3 = sub_10001F900();

  if (!*(void *)(v3 + 16))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_100007A88(v3 + 32, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1))
  {
LABEL_9:
    os_log_type_t v10 = (id *)&v20;
LABEL_10:
    sub_100007AE4((uint64_t)v10);
    goto LABEL_11;
  }
  sub_10001617C(0, &qword_10002D7A0);
  if (swift_dynamicCast())
  {
    id v4 = v26[0];
    id v5 = [v26[0] userInfo];
    if (!v5)
    {
LABEL_24:

      goto LABEL_11;
    }
    uint64_t v6 = v5;
    uint64_t v7 = sub_10001F880();

    uint64_t v24 = 0x6D614E70756F7267;
    unint64_t v25 = 0xEA00000000007365;
    sub_10001FA30();
    if (*(void *)(v7 + 16) && (unint64_t v8 = sub_100009134((uint64_t)&v20), (v9 & 1) != 0))
    {
      sub_100007A88(*(void *)(v7 + 56) + 32 * v8, (uint64_t)v26);
    }
    else
    {
      *(_OWORD *)id v26 = 0u;
      long long v27 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_100009178((uint64_t)&v20);
    if (*((void *)&v27 + 1))
    {
      sub_100007B44(&qword_10002D7A8);
      if (swift_dynamicCast())
      {
        uint64_t v16 = v24;
        uint64_t v17 = *(void *)(v24 + 16);
        if (v17)
        {
          swift_bridgeObjectRetain();
          uint64_t v18 = v16 + 40;
          do
          {
            swift_bridgeObjectRetain();
            sub_100006E9C();
            swift_bridgeObjectRelease();
            v18 += 16;
            --v17;
          }
          while (v17);
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        id v22 = nullsub_1;
        uint64_t v23 = 0;
        *(void *)&long long v20 = _NSConcreteStackBlock;
        *((void *)&v20 + 1) = 1107296256;
        *(void *)&long long v21 = sub_100007858;
        *((void *)&v21 + 1) = &unk_100028DD8;
        long long v19 = _Block_copy(&v20);
        [a1 completeRequestReturningItems:0 completionHandler:v19];
        _Block_release(v19);

        return;
      }
      goto LABEL_24;
    }

    os_log_type_t v10 = v26;
    goto LABEL_10;
  }
LABEL_11:
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_10001F850();
  sub_100004CDC(v11, (uint64_t)qword_10002D8B8);
  uint64_t v12 = sub_10001F830();
  os_log_type_t v13 = sub_10001F960();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Extension protocol error", v14, 2u);
    swift_slowDealloc();
  }

  sub_100007B88();
  swift_allocError();
  uint64_t v15 = (void *)sub_10001F770();
  [a1 cancelRequestWithError:v15];

  swift_errorRelease();
}

uint64_t sub_100007858(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_1000078AC()
{
  uint64_t v1 = OBJC_IVAR____TtC24ManagedSettingsExtension24ManagedSettingsExtension_adapter;
  uint64_t v16 = &type metadata for AppRemovabilityManager;
  uint64_t v17 = &off_100029650;
  os_log_type_t v13 = &type metadata for EffectiveManagedSettings;
  uint64_t v14 = &off_100029518;
  *(void *)&long long v12 = swift_allocObject();
  sub_1000166F8((void *)(v12 + 16));
  os_log_type_t v10 = &type metadata for MCInterface;
  uint64_t v11 = &off_100028BB0;
  id v2 = objc_allocWithZone((Class)NSLock);
  uint64_t v3 = v0;
  id v4 = [v2 init];
  unint64_t v5 = sub_100006A3C();
  sub_100007B44(&qword_10002D7E0);
  uint64_t v6 = (void *)swift_allocObject();
  sub_1000164F0(&v15, (uint64_t)(v6 + 2));
  sub_1000164F0(&v12, (uint64_t)(v6 + 7));
  sub_1000164F0(&v9, (uint64_t)(v6 + 12));
  v6[17] = v5;
  v6[18] = v4;
  v6[19] = 0xD000000000000023;
  v6[20] = 0x8000000100024F80;
  *(void *)&v0[v1] = v6;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ManagedSettingsExtension();
  return objc_msgSendSuper2(&v8, "init");
}

id sub_100007A20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagedSettingsExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ManagedSettingsExtension()
{
  return self;
}

uint64_t sub_100007A88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007AE4(uint64_t a1)
{
  uint64_t v2 = sub_100007B44(&qword_10002D790);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007B44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100007B88()
{
  unint64_t result = qword_10002D798;
  if (!qword_10002D798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D798);
  }
  return result;
}

uint64_t sub_100007BDC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100007BEC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100007C28(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_10001FB00(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    long long v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_10001FB00() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

void *sub_100007CF0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_10001FAF0();
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

unsigned char **sub_100007D94(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_100007DA4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100007DCC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100007E44(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_10001F9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100007E44(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007F18(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007A88((uint64_t)v12, *a3);
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
      sub_100007A88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000633C((uint64_t)v12);
  return v7;
}

uint64_t sub_100007F18(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001F9C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000080D4(a5, a6);
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
  uint64_t v8 = sub_10001FA90();
  if (!v8)
  {
    sub_10001FAA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001FAF0();
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

uint64_t sub_1000080D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000816C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000834C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000834C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000816C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000082E4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001FA80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001FAA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001F8E0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001FAF0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001FAA0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000082E4(uint64_t a1, uint64_t a2)
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
  sub_100007B44(&qword_10002D7B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000834C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007B44(&qword_10002D7B0);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_10001FAF0();
  __break(1u);
  return result;
}

uint64_t sub_10000849C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000084BC(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000084BC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007B44((uint64_t *)&unk_10002D7D0);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  os_log_type_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_10001FAF0();
  __break(1u);
  return result;
}

uint64_t sub_10000862C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10001FB80();
  swift_bridgeObjectRetain();
  sub_10001F8C0();
  Swift::Int v8 = sub_10001FBA0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_10001FB00() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_10001FB00() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100008ABC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000087DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007B44(&qword_10002D7C8);
  uint64_t v3 = sub_10001FA50();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                  *id v30 = -1 << v29;
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
      sub_10001FB80();
      sub_10001F8C0();
      uint64_t result = sub_10001FBA0();
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
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100008ABC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_1000087DC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100008C58();
      goto LABEL_22;
    }
    sub_100008E0C();
  }
  uint64_t v11 = *v4;
  sub_10001FB80();
  sub_10001F8C0();
  uint64_t result = sub_10001FBA0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_10001FB00(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_10001FB10();
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
          uint64_t result = sub_10001FB00();
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

void *sub_100008C58()
{
  uint64_t v1 = v0;
  sub_100007B44(&qword_10002D7C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001FA40();
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

uint64_t sub_100008E0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007B44(&qword_10002D7C8);
  uint64_t v3 = sub_10001FA50();
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
    sub_10001FB80();
    swift_bridgeObjectRetain();
    sub_10001F8C0();
    uint64_t result = sub_10001FBA0();
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
    void *v13 = v20;
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

unint64_t sub_1000090BC(uint64_t a1, uint64_t a2)
{
  sub_10001FB80();
  sub_10001F8C0();
  Swift::Int v4 = sub_10001FBA0();
  return sub_100009228(a1, a2, v4);
}

unint64_t sub_100009134(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10001FA10(*(void *)(v2 + 40));
  return sub_10000930C(a1, v4);
}

uint64_t sub_100009178(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000091CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000091DC()
{
  return swift_release();
}

void *sub_1000091E4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100009228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001FB00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001FB00() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000930C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000163AC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10001FA20();
      sub_100009178((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_1000093D4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000090BC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100009B70();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1000160EC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1000097D8(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1000094D8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007B44(&qword_10002D7C0);
  uint64_t v6 = sub_10001FAD0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
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
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_1000160EC(v24, v35);
      }
      else
      {
        sub_100007A88((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_10001FB80();
      sub_10001F8C0();
      uint64_t result = sub_10001FBA0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1000160EC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1000097D8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10001F9E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10001FB80();
        swift_bridgeObjectRetain();
        sub_10001F8C0();
        Swift::Int v10 = sub_10001FBA0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_1000099B0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_1000090BC(a2, a3);
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
      sub_100009B70();
      goto LABEL_7;
    }
    sub_1000094D8(v15, a4 & 1);
    unint64_t v21 = sub_1000090BC(a2, a3);
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
    uint64_t result = (_OWORD *)sub_10001FB20();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000633C((uint64_t)v19);
    return sub_1000160EC(a1, v19);
  }
LABEL_13:
  sub_100009B04(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100009B04(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1000160EC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_100009B70()
{
  uint64_t v1 = v0;
  sub_100007B44(&qword_10002D7C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10001FAC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
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
    uint64_t v20 = 32 * v15;
    sub_100007A88(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1000160EC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

uint64_t sub_100009D58(uint64_t result)
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
    sub_10000A370(v12, v13);
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

unint64_t *sub_100009F00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
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
                  sub_1000160FC();
                  return (unint64_t *)v2;
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
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_10001FB80();
      swift_bridgeObjectRetain();
      sub_10001F8C0();
      Swift::Int v19 = sub_10001FBA0();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_10001FB00() & 1) != 0)
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
        unint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_10001FB00() & 1) == 0);
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
      __chkstk_darwin(isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_10000A500((unint64_t *)((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0)), v30, v2, v21, &v38);
      swift_release();
      sub_1000160FC();
    }
    else
    {
      int64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_10000A500((unint64_t *)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1000160FC();
      swift_slowDealloc();
    }
    return v32;
  }
  else
  {
    swift_release();
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_10000A370(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_10001FB80();
  swift_bridgeObjectRetain();
  sub_10001F8C0();
  Swift::Int v6 = sub_10001FBA0();
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
  if (!v11 && (sub_10001FB00() & 1) == 0)
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
    while (!v17 && (sub_10001FB00() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100008C58();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_10000AA78(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t *sub_10000A500(unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = result;
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
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
                  return (unint64_t *)sub_10000A7E0(v38, a2, v37, a3);
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
        sub_10001FB80();
        swift_bridgeObjectRetain();
        sub_10001F8C0();
        Swift::Int v22 = sub_10001FBA0();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      char v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_10001FB00() & 1) == 0)
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
          if (v35 || (sub_10001FB00() & 1) != 0)
          {
            uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = (unint64_t *)swift_bridgeObjectRelease();
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
    return (unint64_t *)&_swiftEmptySetSingleton;
  }
}

uint64_t sub_10000A7E0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100007B44(&qword_10002D7C8);
  uint64_t result = sub_10001FA60();
  uint64_t v8 = (unsigned char *)result;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_10001FB80();
    swift_bridgeObjectRetain();
    sub_10001F8C0();
    uint64_t result = sub_10001FBA0();
    uint64_t v20 = -1 << v8[32];
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
    char v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *char v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
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

unint64_t sub_10000AA78(unint64_t result)
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
    uint64_t v8 = sub_10001F9E0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_10001FB80();
        swift_bridgeObjectRetain();
        sub_10001F8C0();
        Swift::Int v10 = sub_10001FBA0();
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
          unint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            _OWORD *v13 = *v14;
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

void sub_10000AC40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = &selRef_camera;
  if (a1)
  {
    uint64_t v9 = qword_10002D5E0;
    swift_bridgeObjectRetain();
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10001F850();
    sub_100004CDC(v10, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_10001F830();
    os_log_type_t v12 = sub_10001F950();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136446466;
      uint64_t v14 = a2;
      swift_bridgeObjectRetain();
      sub_100007E44(a2, (unint64_t)a3, v51);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v15 = a3;
      uint64_t v16 = sub_10001F890();
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      uint64_t v19 = v16;
      a3 = v15;
      a2 = v14;
      uint64_t v50 = sub_100007E44(v19, v18, v51);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      uint64_t v8 = &selRef_camera;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Applying %{public}s restrictions: %{public}s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
LABEL_10:
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_14;
    }

    swift_bridgeObjectRelease_n();
  }
  else
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_10001F850();
    sub_100004CDC(v20, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain_n();
    unint64_t v11 = sub_10001F830();
    os_log_type_t v21 = sub_10001F950();
    if (os_log_type_enabled(v11, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v22 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_100007E44(a2, (unint64_t)a3, v51);
      uint64_t v8 = &selRef_camera;
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v21, "Removing %{public}s restrictions", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v4 = v3;
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_14:
  __int16 v49 = 0;
  sub_1000054FC(a1, a2, a3, (uint64_t)&v49 + 1, (uint64_t)&v49);
  if (v4)
  {
    unint64_t v23 = v8[188];
    if (a1)
    {
      if (v23 != (char *)-1) {
        swift_once();
      }
      uint64_t v24 = sub_10001F850();
      sub_100004CDC(v24, (uint64_t)qword_10002D8B8);
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      unint64_t v25 = sub_10001F830();
      os_log_type_t v26 = sub_10001F960();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_100007E44(a2, (unint64_t)a3, v51);
        sub_10001F9B0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v27 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v28 = sub_10001FB30();
        uint64_t v50 = sub_100007E44(v28, v29, v51);
        sub_10001F9B0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        uint64_t v30 = "Failed to apply %{public}s restrictions: %s";
LABEL_29:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v30, (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
LABEL_31:

        swift_willThrow();
        return;
      }
    }
    else
    {
      if (v23 != (char *)-1) {
        swift_once();
      }
      uint64_t v41 = sub_10001F850();
      sub_100004CDC(v41, (uint64_t)qword_10002D8B8);
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      unint64_t v25 = sub_10001F830();
      os_log_type_t v26 = sub_10001F960();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_100007E44(a2, (unint64_t)a3, v51);
        sub_10001F9B0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v27 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v42 = sub_10001FB30();
        uint64_t v50 = sub_100007E44(v42, v43, v51);
        sub_10001F9B0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        uint64_t v30 = "Failed to remove %{public}s restrictions: %s";
        goto LABEL_29;
      }
    }
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
    goto LABEL_31;
  }
  uint64_t v31 = v8[188];
  if (a1)
  {
    if (v31 != (char *)-1) {
      swift_once();
    }
    uint64_t v32 = sub_10001F850();
    sub_100004CDC(v32, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain_n();
    unint64_t v33 = sub_10001F830();
    os_log_type_t v34 = sub_10001F970();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136446722;
      swift_bridgeObjectRetain();
      v51[0] = sub_100007E44(a2, (unint64_t)a3, &v52);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2082;
      swift_beginAccess();
      uint64_t v36 = sub_10001F820();
      uint64_t v50 = sub_100007E44(v36, v37, &v52);
      sub_10001F9B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2082;
      swift_beginAccess();
      uint64_t v38 = sub_10001F820();
      sub_100007E44(v38, v39, &v52);
      sub_10001F9B0();
      swift_bridgeObjectRelease();
      uint64_t v40 = "Applied %{public}s restrictions, restrictionChanged=%{public}s effectiveSettingsChanged=%{public}s";
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v33, v34, v40, (uint8_t *)v35, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
  else
  {
    if (v31 != (char *)-1) {
      swift_once();
    }
    uint64_t v44 = sub_10001F850();
    sub_100004CDC(v44, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain_n();
    unint64_t v33 = sub_10001F830();
    os_log_type_t v34 = sub_10001F970();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 136446722;
      swift_bridgeObjectRetain();
      v51[0] = sub_100007E44(a2, (unint64_t)a3, &v52);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2082;
      swift_beginAccess();
      uint64_t v45 = sub_10001F820();
      uint64_t v50 = sub_100007E44(v45, v46, &v52);
      sub_10001F9B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 22) = 2082;
      swift_beginAccess();
      uint64_t v47 = sub_10001F820();
      sub_100007E44(v47, v48, &v52);
      sub_10001F9B0();
      swift_bridgeObjectRelease();
      uint64_t v40 = "Removed %{public}s restrictions, restrictionChanged=%{public}s effectiveSettingsChanged=%{public}s";
      goto LABEL_36;
    }
  }

  swift_bridgeObjectRelease_n();
}

void sub_10000B760()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  uint64_t v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Car Play settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_100017ACC, "Applying denyCarPlay settings: %{BOOL,public}d", (SEL *)&selRef_vehicleUIAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000BB14()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  uint64_t v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective allowed client settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_100017C30, "Applying denyMDMEnrollment settings: %{BOOL,public}d", (SEL *)&selRef_mdmEnrollmentAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000BEC8()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  uint64_t v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective account settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_100017D94, "Applying lockAccounts settings: %{BOOL,public}d", (SEL *)&selRef_accountModificationAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000C27C(void *a1)
{
  __int16 v2 = sub_100017EF8();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyBookstore settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(&v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)&v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000C404(void *a1)
{
  __int16 v2 = sub_10001805C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyBookstoreErotica settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000C58C(void *a1)
{
  __int16 v2 = sub_1000181C0();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyExplicitContent settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000C714(void *a1)
{
  __int16 v2 = sub_100018324();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyiTunes settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000C89C(void *a1)
{
  __int16 v2 = sub_100018488();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyMusicArtistActivity settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000CA24(void *a1)
{
  __int16 v2 = sub_1000185EC();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyMusicService settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000CBAC(void *a1)
{
  __int16 v2 = sub_100018750();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyMusicVideos settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000CD34(void *a1)
{
  __int16 v2 = sub_1000188B4();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyPodcasts setting: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000CEBC(void *a1)
{
  __int16 v2 = sub_100018A18();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockSpeakerVolumeLimit settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000D044(void *a1)
{
  __int16 v2 = sub_100018B7C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockTVProvider settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_1000056E8(v9);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000D1CC(void *a1)
{
  uint64_t v2 = sub_100018CE0();
  if (v2 != v3)
  {
    uint64_t v4 = v2;
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10001F850();
    sub_100004CDC(v5, (uint64_t)qword_10002D8B8);
    os_log_type_t v6 = sub_10001F830();
    os_log_type_t v7 = sub_10001F950();
    if (os_log_type_enabled(v6, v7))
    {
      NSString v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v8 = 134349056;
      v11[0] = v4;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Applying maximumMovieRating settings: %{public}ld", v8, 0xCu);
      swift_slowDealloc();
    }

    sub_1000056E8(v11);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v11);
    NSString v9 = sub_10001F8A0();
    id v10 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v4];
    [a1 MCSetValueRestriction:v9 value:v10];
    swift_bridgeObjectRelease();
  }
}

void sub_10000D36C(void *a1)
{
  uint64_t v2 = sub_100018E3C();
  if (v2 != v3)
  {
    uint64_t v4 = v2;
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10001F850();
    sub_100004CDC(v5, (uint64_t)qword_10002D8B8);
    os_log_type_t v6 = sub_10001F830();
    os_log_type_t v7 = sub_10001F950();
    if (os_log_type_enabled(v6, v7))
    {
      NSString v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v8 = 134349056;
      v11[0] = v4;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Applying maximumTVShowRating settings: %{public}ld", v8, 0xCu);
      swift_slowDealloc();
    }

    sub_1000056E8(v11);
    swift_bridgeObjectRetain();
    sub_100016264((uint64_t)v11);
    NSString v9 = sub_10001F8A0();
    id v10 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v4];
    [a1 MCSetValueRestriction:v9 value:v10];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000D50C()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_10000C27C(v0);
  sub_10000C404(v0);
  sub_10000C58C(v0);
  sub_10000C714(v0);
  sub_10000C89C(v0);
  sub_10000CA24(v0);
  sub_10000CBAC(v0);
  sub_10000CD34(v0);
  sub_10000CEBC(v0);
  sub_10000D044(v0);
  sub_10000D1CC(v0);
  sub_10000D36C(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

void sub_10000D638()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Air Drop settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_100018F98, "Applying denyAirDrop settings: %{BOOL,public}d", (SEL *)&selRef_airDropAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000D9EC(void *a1)
{
  __int16 v2 = sub_1000190FC();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockAppCellularData settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    NSString v8 = self;
    id v9 = [v8 appCellularDataModificationAllowed];
    sub_10001F8B0();

    NSString v10 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v10 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000DBC0(void *a1)
{
  __int16 v2 = sub_100019260();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockCellularPlan settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    NSString v8 = self;
    id v9 = [v8 cellularPlanModificationAllowed];
    sub_10001F8B0();

    NSString v10 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v10 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000DD94(void *a1)
{
  __int16 v2 = sub_1000193C4();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockESIM settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    NSString v8 = self;
    id v9 = [v8 eSIMModificationAllowed];
    sub_10001F8B0();

    NSString v10 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v10 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000DF68()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_10000D9EC(v0);
  sub_10000DBC0(v0);
  sub_10000DD94(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

void sub_10000E04C(uint64_t a1, void *a2, const char *a3, uint64_t (*a4)(void))
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10001F850();
  sub_100004CDC(v8, (uint64_t)qword_10002D8B8);
  id v9 = sub_10001F830();
  os_log_type_t v10 = sub_10001F970();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, a3, v11, 2u);
    swift_slowDealloc();
  }

  uint64_t v12 = a4();
  if (*(void *)(v12 + 16))
  {
    sub_10000AC40(v12, a1, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10000AC40(0, a1, a2);
  }
}

void sub_10000E358()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Camera settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000145F0(v4, sub_100019528, "Applying denyCamera settings: %{BOOL,public}d", (SEL *)&selRef_cameraAllowed, (SEL *)&selRef_screenRecordingAllowed);
  sub_1000147BC(v4, sub_10001968C, "Applying denyScreenRecording settings: %{BOOL,public}d", (SEL *)&selRef_cameraAllowed, (SEL *)&selRef_screenRecordingAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000E748(void *a1)
{
  __int16 v2 = sub_1000197F0();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyAppStoreAppInstallation settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_10000599C(v9);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000E8C8(void *a1)
{
  __int16 v2 = sub_100019954();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyInAppPurchases settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_10000599C(&v9);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)&v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000EA48(void *a1)
{
  __int16 v2 = sub_100019AB8();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyMarketplaceAppInstallation settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_10000599C(v9);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000EBC8(void *a1)
{
  __int16 v2 = sub_100019C1C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyWebDistributionAppInstallation settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_10000599C(v9);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10000ED48(void *a1)
{
  uint64_t v2 = sub_100019D80();
  if (v2 != v3)
  {
    uint64_t v4 = v2;
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10001F850();
    sub_100004CDC(v5, (uint64_t)qword_10002D8B8);
    os_log_type_t v6 = sub_10001F830();
    os_log_type_t v7 = sub_10001F950();
    if (os_log_type_enabled(v6, v7))
    {
      NSString v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v8 = 134349056;
      v11[0] = v4;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Applying maximumRating settings: %{public}ld", v8, 0xCu);
      swift_slowDealloc();
    }

    sub_10000599C(v11);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v11);
    NSString v9 = sub_10001F8A0();
    id v10 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v4];
    [a1 MCSetValueRestriction:v9 value:v10];
    swift_bridgeObjectRelease();
  }
}

void sub_10000EEE0(void *a1)
{
  __int16 v2 = sub_100019EDC();
  uint64_t v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying requirePasswordForPurchases settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_10000599C(v9);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000F058()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_10000E748(v0);
  sub_10000E8C8(v0);
  sub_10000EA48(v0);
  sub_10000EBC8(v0);
  sub_10000ED48(v0);
  sub_10000EEE0(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

void sub_10000F154()
{
  id v0 = (id)sub_100019D80();
  sub_10000599C(v16);
  swift_bridgeObjectRetain();
  sub_100016104((uint64_t)v16);
  id v1 = self;
  id v2 = [v1 sharedConnection];
  NSString v3 = sub_10001F8A0();
  id v4 = [v2 userValueForSetting:v3];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  if (qword_10002D5D0 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_10002D8B0;
  if (v0 == [(id)qword_10002D8B0 integerValue])
  {
    if (qword_10002D5C8 == -1)
    {
      if (!v4) {
        return;
      }
    }
    else
    {
      swift_once();
      if (!v4) {
        return;
      }
    }
    os_log_type_t v6 = (void *)qword_10002D8A8;
    sub_10001617C(0, qword_10002D5F0);
    id v7 = v6;
    id v8 = v4;
    char v9 = sub_10001F9A0();

    if ((v9 & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v10 = qword_10002D8B0;
    sub_10000599C(v17);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v17);
    id v11 = [v1 sharedConnection];
    goto LABEL_13;
  }
  if (!v4) {
    return;
  }
  sub_10001617C(0, qword_10002D5F0);
  id v8 = v4;
  id v12 = v5;
  char v13 = sub_10001F9A0();

  if (v13)
  {
    if (qword_10002D5C8 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_10002D8A8;
    sub_10000599C(v17);
    swift_bridgeObjectRetain();
    sub_100016104((uint64_t)v17);
    id v11 = [v1 sharedConnection];
LABEL_13:
    id v14 = v11;
    NSString v15 = sub_10001F8A0();
    [v14 setValue:v10 forSetting:v15];
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    id v8 = v15;
  }
LABEL_14:
}

void sub_10000F42C(uint64_t a1, void *a2)
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10001F850();
  sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
  uint64_t v5 = sub_10001F830();
  os_log_type_t v6 = sub_10001F970();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying effective App Store settings", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = sub_10000F058();
  if (*(void *)(v8 + 16))
  {
    sub_10000AC40(v8, a1, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_10000AC40(0, a1, a2);
  }
  sub_10000F154();
}

void sub_10000F724()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective notification settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_10001A040, "Applying lockDriverDoNotDisturb settings: %{BOOL,public}d", (SEL *)&selRef_driverDoNotDisturbModificationsAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000FAD8()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective date and time settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000152D0(v4, sub_10001A1A4, "Applying requireAutomaticDateAndTime settings: %{BOOL,public}d", (SEL *)&selRef_automaticDateAndTimeForced);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10000FE8C()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective FaceTime settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000147BC(v4, sub_10001A308, "Applying denyFaceTime settings: %{BOOL,public}d", (SEL *)&selRef_groupActivityAllowed, (SEL *)&selRef_videoConferencingAllowed);
  sub_1000145F0(v4, sub_10001A46C, "Applying denySharePlay settings: %{BOOL,public}d", (SEL *)&selRef_groupActivityAllowed, (SEL *)&selRef_videoConferencingAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10001027C()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective passcode settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_10001A5D0, "Applying lockPasscode settings: %{BOOL,public}d", (SEL *)&selRef_passcodeModificationAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_100010630(void *a1)
{
  sub_10001AC48(&v23);
  os_log_type_t v2 = v23;
  NSString v3 = v24;
  id v4 = v25;
  if (sub_1000053B0(v23, v24, v25, v26, v27, v28))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  unint64_t v22 = a1;
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10001F850();
  sub_100004CDC(v5, (uint64_t)qword_10002D8B8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v6 = sub_10001F830();
  os_log_type_t v7 = sub_10001F950();
  if (!os_log_type_enabled(v6, v7))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    id v12 = a1;
    if (!v2) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  v33[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 136446210;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100004EFC((uint64_t)v2, (uint64_t)v3, (uint64_t)v4);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v32[0] = sub_100007E44(v9, v11, v33);
  sub_10001F9B0();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v6, v7, "Applying blockedByFilter settings: %{public}s", v8, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  id v12 = v22;
  if (v2)
  {
LABEL_11:
    swift_bridgeObjectRetain();
    sub_100005B18(&v29);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)&v29);
    NSString v13 = sub_10001F8A0();
    [v12 MCSetBoolRestriction:v13 value:1];
    swift_bridgeObjectRelease();

    sub_100005B18(v30);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v30);
    sub_10000638C((uint64_t)v2);
    swift_bridgeObjectRelease();
    NSString v14 = sub_10001F8A0();
    Class isa = sub_10001F8F0().super.isa;
    [v12 MCSetIntersectionRestriction:v14 values:isa];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_100005B18(v31);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v31);
    sub_10000638C((uint64_t)v3);
    swift_bridgeObjectRelease();
    NSString v16 = sub_10001F8A0();
    Class v17 = sub_10001F8F0().super.isa;
    [v12 MCSetUnionRestriction:v16 values:v17];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    sub_100005B18(v32);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v32);
    sub_10000638C((uint64_t)v4);
    NSString v18 = sub_10001F8A0();
    Class v19 = sub_10001F8F0().super.isa;
    [v12 MCSetIntersectionRestriction:v18 values:v19];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_100005B18(v33);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v33);
    sub_10000638C((uint64_t)v4);
    swift_bridgeObjectRelease();
    NSString v20 = sub_10001F8A0();
    Class v21 = sub_10001F8F0().super.isa;
    [v12 MCSetIntersectionRestriction:v20 values:v21];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_100010C48()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective web content settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100010630(v4);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_100010FD8()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Calculator settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_10001ADC8, "Applying denyMathPaperSolving settings: %{BOOL,public}d", (SEL *)&selRef_mathPaperSolvingAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_10001138C()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    NSString v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective News settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_10001AF2C, "Applying denyNews settings: %{BOOL,public}d", (SEL *)&selRef_newsAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_100011740(void *a1)
{
  os_log_type_t v2 = (void *)sub_10001B090();
  if (sub_100007C28(v2, v3))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      v13[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_10001F910();
      unint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_100007E44(v8, v10, v13);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying blockedApplications settings: %{public}s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_100005C60(v13);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v13);
    sub_10000638C((uint64_t)v2);
    NSString v11 = sub_10001F8A0();
    Class isa = sub_10001F8F0().super.isa;
    [a1 MCSetUnionRestriction:v11 values:isa];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_100011A1C(void *a1)
{
  __int16 v2 = sub_10001B29C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyAppClips settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005C60(&v9);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)&v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100011B9C(void *a1)
{
  __int16 v2 = sub_10001B400();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyAppInstallation settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005C60(v9);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100011D1C(void *a1)
{
  __int16 v2 = sub_10001B564();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyAppRemoval settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005C60(v9);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100011E9C(void *a1)
{
  __int16 v2 = sub_10001B6C8();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    id v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyBackgroundAppRefresh settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005C60(v9);
    swift_bridgeObjectRetain();
    sub_100016340((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001201C()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100011740(v0);
  sub_100011A1C(v0);
  sub_100011B9C(v0);
  sub_100011D1C(v0);
  sub_100011E9C(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

uint64_t sub_100012110(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_10001F930();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000862C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t *sub_1000121A8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) <= *(void *)(a2 + 16) >> 3)
  {
    swift_bridgeObjectRetain();
    sub_100009D58(a1);
    uint64_t v4 = (unint64_t *)a2;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100009F00(a1, a2);
  }
  if (*(void *)(a2 + 16) <= *(void *)(a1 + 16) >> 3)
  {
    swift_bridgeObjectRetain();
    sub_100009D58(a2);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100009F00(a2, a1);
  }
  return v4;
}

uint64_t sub_100012270()
{
  uint64_t v0 = sub_10001F750();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001F7D0();
  uint64_t v35 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::Int v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002D5C0 != -1) {
    swift_once();
  }
  sub_100004CDC(v4, (uint64_t)qword_10002D890);
  sub_10001F7C0();
  id v7 = [self defaultManager];
  sub_10001F7A0(v8);
  unint64_t v10 = v9;
  id v37 = 0;
  unsigned int v11 = [v7 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v37];

  if (v11)
  {
    id v12 = v37;
  }
  else
  {
    id v13 = v37;
    sub_10001F780();

    swift_willThrow();
    swift_errorRetain();
    sub_10001F740();
    sub_10001603C();
    char v14 = sub_10001F760();
    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    if ((v14 & 1) == 0)
    {
      if (qword_10002D5E0 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_10001F850();
      sub_100004CDC(v30, (uint64_t)qword_10002D8B8);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v24 = sub_10001F830();
      os_log_type_t v25 = sub_10001F960();
      if (os_log_type_enabled(v24, v25))
      {
        os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
        id v37 = (id)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v26 = 136446210;
        swift_getErrorValue();
        uint64_t v31 = sub_10001FB30();
        uint64_t v36 = sub_100007E44(v31, v32, (uint64_t *)&v37);
        sub_10001F9B0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        uint64_t v29 = "Failed to create previous settings directory: %{public}s";
        goto LABEL_17;
      }
LABEL_18:

      swift_errorRelease();
      swift_errorRelease();
      goto LABEL_19;
    }
    swift_errorRelease();
  }
  NSString v15 = self;
  Class isa = sub_10001F860().super.isa;
  id v37 = 0;
  id v17 = [v15 dataWithPropertyList:isa format:200 options:0 error:&v37];

  id v18 = v37;
  if (!v17)
  {
    unint64_t v22 = v18;
    sub_10001F780();

    swift_willThrow();
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_10001F850();
    sub_100004CDC(v23, (uint64_t)qword_10002D8B8);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v24 = sub_10001F830();
    os_log_type_t v25 = sub_10001F960();
    if (os_log_type_enabled(v24, v25))
    {
      os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
      id v37 = (id)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v26 = 136446210;
      swift_getErrorValue();
      uint64_t v27 = sub_10001FB30();
      uint64_t v36 = sub_100007E44(v27, v28, (uint64_t *)&v37);
      sub_10001F9B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      uint64_t v29 = "Failed to write previous settings: %{public}s";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v29, v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_19:
      swift_errorRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v6, v4);
    }
    goto LABEL_18;
  }
  uint64_t v19 = sub_10001F800();
  unint64_t v21 = v20;

  sub_10001F810();
  sub_100016094(v19, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v6, v4);
}

void sub_1000128C4(void *a1)
{
  __int16 v2 = sub_10001BA38();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyFeature1 settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    BOOL v8 = v3 == 0;
    uint64_t v9 = self;
    id v10 = [v9 assistantAllowed];
    sub_10001F8B0();

    id v11 = [v9 assistantProfanityFilterForced];
    sub_10001F8B0();

    id v12 = [v9 assistantUserGeneratedContentAllowed];
    sub_10001F8B0();

    id v13 = [v9 montaraAllowed];
    sub_10001F8B0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    NSString v14 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v14 value:v8];
    swift_bridgeObjectRelease();
  }
}

void sub_100012AF8(void *a1)
{
  __int16 v2 = sub_10001BB9C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denySiri settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    BOOL v8 = v3 == 0;
    uint64_t v9 = self;
    id v10 = [v9 assistantAllowed];
    sub_10001F8B0();

    id v11 = [v9 assistantProfanityFilterForced];
    sub_10001F8B0();

    id v12 = [v9 assistantUserGeneratedContentAllowed];
    sub_10001F8B0();

    id v13 = [v9 montaraAllowed];
    sub_10001F8B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    NSString v14 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v14 value:v8];
    swift_bridgeObjectRelease();
  }
}

void sub_100012D2C(void *a1)
{
  __int16 v2 = sub_10001BD00();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denySiriUserGeneratedContent settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    BOOL v8 = v3 == 0;
    uint64_t v9 = self;
    id v10 = [v9 assistantAllowed];
    sub_10001F8B0();

    id v11 = [v9 assistantProfanityFilterForced];
    sub_10001F8B0();

    id v12 = [v9 assistantUserGeneratedContentAllowed];
    sub_10001F8B0();

    id v13 = [v9 montaraAllowed];
    sub_10001F8B0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    NSString v14 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v14 value:v8];
    swift_bridgeObjectRelease();
  }
}

void sub_100012F60(void *a1)
{
  __int16 v2 = sub_10001BE64();
  uint64_t v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying forceSiriProfanityFilter settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    BOOL v8 = self;
    id v9 = [v8 assistantAllowed];
    sub_10001F8B0();

    id v10 = [v8 assistantProfanityFilterForced];
    sub_10001F8B0();

    id v11 = [v8 assistantUserGeneratedContentAllowed];
    sub_10001F8B0();

    id v12 = [v8 montaraAllowed];
    sub_10001F8B0();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    NSString v13 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v13 value:v3];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001318C()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000128C4(v0);
  sub_100012AF8(v0);
  sub_100012D2C(v0);
  sub_100012F60(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

void sub_100013278()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Find My settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_10001BFC8, "Applying lockFindMyFriends settings: %{BOOL,public}d", (SEL *)&selRef_findMyFriendsModificationAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

id sub_10001362C(unsigned __int8 a1)
{
  if (a1 > 1u)
  {
    id v1 = self;
    [v1 gameCenterOtherPlayerTypesNone];
    [v1 gameCenterOtherPlayerTypesFriendsOnly];
  }
  else
  {
    id v1 = self;
    [v1 gameCenterOtherPlayerTypesNone];
    [v1 gameCenterOtherPlayerTypesFriendsOnly];
  }
  return [v1 gameCenterOtherPlayerTypesEveryone];
}

void sub_100013730(void *a1)
{
  __int16 v2 = sub_10001C440();
  if (v2 != (unsigned __int16)(v2 & 0xFF00) >> 8)
  {
    sub_10001362C(v2);
    double v4 = v3;
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10001F850();
    sub_100004CDC(v5, (uint64_t)qword_10002D8B8);
    os_log_type_t v6 = sub_10001F830();
    os_log_type_t v7 = sub_10001F950();
    if (os_log_type_enabled(v6, v7))
    {
      BOOL v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v8 = 134349056;
      *(double *)id v11 = v4;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Applying allowedOtherPlayerTypes settings: %{public}f", v8, 0xCu);
      swift_slowDealloc();
    }

    sub_100005DA8(v11);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v11);
    NSString v9 = sub_10001F8A0();
    id v10 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v4];
    [a1 MCSetValueRestriction:v9 value:v10];
    swift_bridgeObjectRelease();
  }
}

void sub_1000138DC(void *a1)
{
  __int16 v2 = sub_10001C590();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyAddingFriends settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(&v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)&v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100013A5C(void *a1)
{
  __int16 v2 = sub_10001C6F4();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyGameCenter settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100013BDC(void *a1)
{
  __int16 v2 = sub_10001C858();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyMultiplayerGaming settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100013D5C(void *a1)
{
  __int16 v2 = sub_10001C9BC();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyNearbyMultiplayer settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100013EDC(void *a1)
{
  __int16 v2 = sub_10001CB20();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyPrivateMessaging settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10001405C(void *a1)
{
  __int16 v2 = sub_10001CC84();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockFriendsSharing settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_1000141DC(void *a1)
{
  __int16 v2 = sub_10001CDE8();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockProfile settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_10001435C(void *a1)
{
  __int16 v2 = sub_10001CF4C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    uint64_t v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v7 = 67240192;
      LODWORD(v9[0]) = v3;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying lockProfilePrivacy settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    sub_100005DA8(v9);
    swift_bridgeObjectRetain();
    sub_1000161B8((uint64_t)v9);
    NSString v8 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v8 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000144DC()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100013730(v0);
  sub_1000138DC(v0);
  sub_100013A5C(v0);
  sub_100013BDC(v0);
  sub_100013D5C(v0);
  sub_100013EDC(v0);
  sub_10001405C(v0);
  sub_1000141DC(v0);
  sub_10001435C(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

void sub_1000145F0(void *a1, uint64_t (*a2)(void), const char *a3, SEL *a4, SEL *a5)
{
  __int16 v9 = a2();
  int v10 = v9 & 1;
  if (v10 != (unsigned __int16)(v9 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10001F850();
    sub_100004CDC(v11, (uint64_t)qword_10002D8B8);
    id v12 = sub_10001F830();
    os_log_type_t v13 = sub_10001F950();
    if (os_log_type_enabled(v12, v13))
    {
      NSString v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v14 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, a3, v14, 8u);
      swift_slowDealloc();
    }

    NSString v15 = self;
    id v16 = [v15 *a4];
    sub_10001F8B0();

    NSString v17 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v17 value:v10 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_1000147BC(void *a1, uint64_t (*a2)(void), const char *a3, SEL *a4, SEL *a5)
{
  __int16 v9 = a2();
  int v10 = v9 & 1;
  if (v10 != (unsigned __int16)(v9 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10001F850();
    sub_100004CDC(v11, (uint64_t)qword_10002D8B8);
    id v12 = sub_10001F830();
    os_log_type_t v13 = sub_10001F950();
    if (os_log_type_enabled(v12, v13))
    {
      NSString v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v14 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, a3, v14, 8u);
      swift_slowDealloc();
    }

    NSString v15 = self;
    id v16 = [v15 *a5];
    sub_10001F8B0();

    NSString v17 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v17 value:v10 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100014988()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective keyboard settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000145F0(v4, sub_10001D0B0, "Applying denyDictation settings: %{BOOL,public}d", (SEL *)&selRef_dictationAllowed, (SEL *)&selRef_keyboardMathSolvingAllowed);
  sub_1000147BC(v4, sub_10001D214, "Applying denyMathSolvingKeyboard settings: %{BOOL,public}d", (SEL *)&selRef_dictationAllowed, (SEL *)&selRef_keyboardMathSolvingAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_100014D78(void *a1, uint64_t (*a2)(void), const char *a3, SEL *a4)
{
  __int16 v7 = a2();
  int v8 = v7 & 1;
  if (v8 != (unsigned __int16)(v7 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10001F850();
    sub_100004CDC(v9, (uint64_t)qword_10002D8B8);
    int v10 = sub_10001F830();
    os_log_type_t v11 = sub_10001F950();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v12 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, a3, v12, 8u);
      swift_slowDealloc();
    }

    id v13 = [self *a4];
    sub_10001F8B0();

    NSString v14 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v14 value:v8 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100014F1C()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Messages settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_100014D78(v4, sub_10001D378, "Applying denyiMessage settings: %{BOOL,public}d", (SEL *)&selRef_chatAllowed);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

void sub_1000152D0(void *a1, uint64_t (*a2)(void), const char *a3, SEL *a4)
{
  __int16 v7 = a2();
  uint64_t v8 = v7 & 1;
  if (v8 != (unsigned __int16)(v7 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_10001F850();
    sub_100004CDC(v9, (uint64_t)qword_10002D8B8);
    int v10 = sub_10001F830();
    os_log_type_t v11 = sub_10001F950();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v12 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, a3, v12, 8u);
      swift_slowDealloc();
    }

    id v13 = [self *a4];
    sub_10001F8B0();

    NSString v14 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v14 value:v8];
    swift_bridgeObjectRelease();
  }
}

void sub_10001546C()
{
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001F850();
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  id v1 = sub_10001F830();
  os_log_type_t v2 = sub_10001F970();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Applying effective Privacy settings", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000152D0(v4, sub_10001D4DC, "Applying forceLimitAdTracking settings: %{BOOL,public}d", (SEL *)&selRef_limitAdTrackingForced);
  id v5 = v4;
  sub_10001F870();

  sub_10001FAB0();
  __break(1u);
}

double sub_100015820(char a1)
{
  switch(a1)
  {
    case 1:
      int v3 = self;
      [v3 safariAcceptCookiesNever];
      [v3 safariAcceptCookiesExclusivelyFromMainDocumentDomain];
      [v3 safariAcceptCookiesFromMainDocumentDomain];
      double v5 = v7;
      goto LABEL_9;
    case 2:
      int v3 = self;
      [v3 safariAcceptCookiesNever];
      [v3 safariAcceptCookiesExclusivelyFromMainDocumentDomain];
      double v5 = v4;
      goto LABEL_7;
    case 3:
      int v3 = self;
      [v3 safariAcceptCookiesNever];
      double v5 = v6;
      [v3 safariAcceptCookiesExclusivelyFromMainDocumentDomain];
LABEL_7:
      [v3 safariAcceptCookiesFromMainDocumentDomain];
LABEL_9:
      [v3 safariAcceptCookiesAlways];
      double result = v5;
      break;
    default:
      id v1 = self;
      [v1 safariAcceptCookiesNever];
      [v1 safariAcceptCookiesExclusivelyFromMainDocumentDomain];
      [v1 safariAcceptCookiesFromMainDocumentDomain];
      [v1 safariAcceptCookiesAlways];
      break;
  }
  return result;
}

void sub_1000159AC(void *a1)
{
  __int16 v2 = sub_10001D9D8();
  if (v2 != (unsigned __int16)(v2 & 0xFF00) >> 8)
  {
    double v3 = sub_100015820(v2);
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    double v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v7 = 134349056;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying cookiePolicy settings: %{public}f", v7, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v8 = self;
    id v9 = [v8 safariAcceptCookies];
    sub_10001F8B0();

    NSString v10 = sub_10001F8A0();
    id v11 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v3];
    [a1 MCSetValueRestriction:v10 value:v11];
    swift_bridgeObjectRelease();
  }
}

void sub_100015BAC(void *a1)
{
  __int16 v2 = sub_10001DB28();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    double v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denyAutoFill settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    uint64_t v8 = self;
    id v9 = [v8 safariAutoFillAllowed];
    sub_10001F8B0();

    NSString v10 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v10 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

void sub_100015D80(void *a1)
{
  __int16 v2 = sub_10001DC8C();
  int v3 = v2 & 1;
  if (v3 != (unsigned __int16)(v2 & 0x100) >> 8)
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_10001F850();
    sub_100004CDC(v4, (uint64_t)qword_10002D8B8);
    double v5 = sub_10001F830();
    os_log_type_t v6 = sub_10001F950();
    if (os_log_type_enabled(v5, v6))
    {
      double v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v7 = 67240192;
      sub_10001F9B0();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Applying denySafari settings: %{BOOL,public}d", v7, 8u);
      swift_slowDealloc();
    }

    uint64_t v8 = self;
    id v9 = [v8 safariAllowed];
    sub_10001F8B0();

    NSString v10 = sub_10001F8A0();
    [a1 MCSetBoolRestriction:v10 value:v3 == 0];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100015F54()
{
  id v0 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  sub_1000159AC(v0);
  sub_100015BAC(v0);
  sub_100015D80(v0);
  id v1 = v0;
  sub_10001F870();

  uint64_t result = sub_10001FAB0();
  __break(1u);
  return result;
}

unint64_t sub_10001603C()
{
  unint64_t result = qword_10002D7B8;
  if (!qword_10002D7B8)
  {
    sub_10001F750();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D7B8);
  }
  return result;
}

uint64_t sub_100016094(uint64_t a1, unint64_t a2)
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

_OWORD *sub_1000160EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000160FC()
{
  return swift_release();
}

uint64_t sub_100016104(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001617C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000161B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016264(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016340(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000163AC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100016408()
{
  sub_10000633C(v0 + 16);
  sub_10000633C(v0 + 56);
  sub_10000633C(v0 + 96);
  sub_10000633C(v0 + 136);
  sub_10000633C(v0 + 176);
  sub_10000633C(v0 + 216);
  sub_10000633C(v0 + 256);
  sub_10000633C(v0 + 296);
  sub_10000633C(v0 + 336);
  sub_10000633C(v0 + 376);
  sub_10000633C(v0 + 416);
  sub_10000633C(v0 + 456);
  sub_10000633C(v0 + 496);
  sub_10000633C(v0 + 536);
  sub_10000633C(v0 + 576);
  sub_10000633C(v0 + 616);
  sub_10000633C(v0 + 656);
  sub_10000633C(v0 + 696);
  sub_10000633C(v0 + 736);
  sub_10000633C(v0 + 776);
  sub_10000633C(v0 + 816);
  sub_10000633C(v0 + 856);
  sub_10000633C(v0 + 896);
  return _swift_deallocObject(v0, 936, 7);
}

uint64_t sub_1000164F0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100016508(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007B44(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t getEnumTagSinglePayload for ManagedSettingsExtensionError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ManagedSettingsExtensionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100016660);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100016688()
{
  return 0;
}

ValueMetadata *type metadata accessor for ManagedSettingsExtensionError()
{
  return &type metadata for ManagedSettingsExtensionError;
}

unint64_t sub_1000166A4()
{
  unint64_t result = qword_10002D7F8;
  if (!qword_10002D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002D7F8);
  }
  return result;
}

void sub_1000166F8(void *a1@<X8>)
{
  a1[3] = &type metadata for EffectiveManagedSettings.SupportedAccountSettings;
  a1[4] = &off_100029508;
  a1[8] = &type metadata for EffectiveManagedSettings.SupportedAirDropSettings;
  a1[9] = &off_1000294F8;
  a1[13] = &type metadata for EffectiveManagedSettings.SupportedAllowedClientSettings;
  a1[14] = &off_1000294E8;
  a1[18] = &type metadata for EffectiveManagedSettings.SupportedApplicationSettings;
  a1[19] = &off_1000294B0;
  a1[23] = &type metadata for EffectiveManagedSettings.SupportedAppStoreSettings;
  a1[24] = &off_100029478;
  a1[28] = &type metadata for EffectiveManagedSettings.SupportedCalculatorSettings;
  a1[29] = &off_100029468;
  a1[33] = &type metadata for EffectiveManagedSettings.SupportedCameraSettings;
  a1[34] = &off_100029450;
  a1[38] = &type metadata for EffectiveManagedSettings.SupportedCarPlaySettings;
  a1[39] = &off_100029440;
  a1[43] = &type metadata for EffectiveManagedSettings.SupportedCellularSettings;
  a1[44] = &off_100029420;
  a1[48] = &type metadata for EffectiveManagedSettings.SupportedDateAndTimeSettings;
  a1[49] = &off_100029410;
  a1[53] = &type metadata for EffectiveManagedSettings.SupportedFaceTimeSettings;
  a1[54] = &off_1000293F8;
  a1[58] = &type metadata for EffectiveManagedSettings.SupportedFindMySettings;
  a1[59] = &off_1000293E8;
  a1[63] = &type metadata for EffectiveManagedSettings.SupportedGameCenterSettings;
  a1[64] = &off_100029398;
  a1[68] = &type metadata for EffectiveManagedSettings.SupportedKeyboardSettings;
  a1[69] = &off_100029380;
  a1[73] = &type metadata for EffectiveManagedSettings.SupportedMediaSettings;
  a1[74] = &off_100029318;
  a1[78] = &type metadata for EffectiveManagedSettings.SupportedMessagesSettings;
  a1[79] = &off_100029308;
  a1[83] = &type metadata for EffectiveManagedSettings.SupportedNewsSettings;
  a1[84] = &off_1000292F8;
  a1[88] = &type metadata for EffectiveManagedSettings.SupportedNotificationSettings;
  a1[89] = &off_1000292E8;
  a1[93] = &type metadata for EffectiveManagedSettings.SupportedPasscodeSettings;
  a1[94] = &off_1000292D8;
  a1[98] = &type metadata for EffectiveManagedSettings.SupportedPrivacySettings;
  a1[99] = &off_1000292C8;
  a1[103] = &type metadata for EffectiveManagedSettings.SupportedSafariSettings;
  a1[104] = &off_1000292A8;
  a1[108] = &type metadata for EffectiveManagedSettings.SupportedSiriSettings;
  a1[109] = &off_100029280;
  a1[113] = &type metadata for EffectiveManagedSettings.SupportedWebContentSettings;
  a1[114] = &off_100029270;
}

id sub_1000168F0()
{
  id result = [objc_allocWithZone((Class)MOEffectiveSettingsStore) init];
  qword_10002D860 = (uint64_t)result;
  return result;
}

uint64_t sub_100016924()
{
  NSString v0 = sub_10001F8A0();
  uint64_t v1 = sub_10001F8B0();
  uint64_t v3 = v2;
  if (v1 == sub_10001F8B0() && v3 == v4)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v6 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_15:

    return 0;
  }
  uint64_t v7 = sub_10001F8B0();
  uint64_t v9 = v8;
  if (v7 == sub_10001F8B0() && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  char v12 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_17:

    return 1;
  }
  uint64_t v13 = sub_10001F8B0();
  uint64_t v15 = v14;
  if (v13 == sub_10001F8B0() && v15 == v16)
  {
    swift_bridgeObjectRelease_n();
LABEL_19:

    return 2;
  }
  char v18 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_19;
  }
  uint64_t v19 = sub_10001F8B0();
  uint64_t v21 = v20;
  if (v19 == sub_10001F8B0() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
LABEL_24:

    return 3;
  }
  char v23 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v23) {
    goto LABEL_24;
  }
  uint64_t v24 = sub_10001F8B0();
  uint64_t v26 = v25;
  if (v24 == sub_10001F8B0() && v26 == v27)
  {
    swift_bridgeObjectRelease_n();
LABEL_29:

    return 4;
  }
  char v28 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_29;
  }
  uint64_t v29 = sub_10001F8B0();
  uint64_t v31 = v30;
  if (v29 == sub_10001F8B0() && v31 == v32)
  {
    swift_bridgeObjectRelease_n();
LABEL_34:

    return 6;
  }
  char v33 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v33) {
    goto LABEL_34;
  }
  uint64_t v34 = sub_10001F8B0();
  uint64_t v36 = v35;
  if (v34 == sub_10001F8B0() && v36 == v37)
  {
    swift_bridgeObjectRelease_n();
LABEL_39:

    return 5;
  }
  char v38 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v38) {
    goto LABEL_39;
  }
  uint64_t v39 = sub_10001F8B0();
  uint64_t v41 = v40;
  if (v39 == sub_10001F8B0() && v41 == v42)
  {
    swift_bridgeObjectRelease_n();
LABEL_44:

    return 7;
  }
  char v43 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v43) {
    goto LABEL_44;
  }
  uint64_t v44 = sub_10001F8B0();
  uint64_t v46 = v45;
  if (v44 == sub_10001F8B0() && v46 == v47)
  {
    swift_bridgeObjectRelease_n();
LABEL_49:

    return 8;
  }
  char v48 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v48) {
    goto LABEL_49;
  }
  uint64_t v49 = sub_10001F8B0();
  uint64_t v51 = v50;
  if (v49 == sub_10001F8B0() && v51 == v52)
  {
    swift_bridgeObjectRelease_n();
LABEL_54:

    return 9;
  }
  char v53 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v53) {
    goto LABEL_54;
  }
  uint64_t v54 = sub_10001F8B0();
  uint64_t v56 = v55;
  if (v54 == sub_10001F8B0() && v56 == v57)
  {
    swift_bridgeObjectRelease_n();
LABEL_59:

    return 10;
  }
  char v58 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v58) {
    goto LABEL_59;
  }
  uint64_t v59 = sub_10001F8B0();
  uint64_t v61 = v60;
  if (v59 == sub_10001F8B0() && v61 == v62)
  {
    swift_bridgeObjectRelease_n();
LABEL_64:

    return 11;
  }
  char v63 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v63) {
    goto LABEL_64;
  }
  uint64_t v64 = sub_10001F8B0();
  uint64_t v66 = v65;
  if (v64 == sub_10001F8B0() && v66 == v67)
  {
    swift_bridgeObjectRelease_n();
LABEL_69:

    return 12;
  }
  char v68 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v68) {
    goto LABEL_69;
  }
  uint64_t v69 = sub_10001F8B0();
  uint64_t v71 = v70;
  if (v69 == sub_10001F8B0() && v71 == v72)
  {
    swift_bridgeObjectRelease_n();
LABEL_74:

    return 13;
  }
  char v73 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v73) {
    goto LABEL_74;
  }
  uint64_t v74 = sub_10001F8B0();
  uint64_t v76 = v75;
  if (v74 == sub_10001F8B0() && v76 == v77)
  {
    swift_bridgeObjectRelease_n();
LABEL_79:

    return 14;
  }
  char v78 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v78) {
    goto LABEL_79;
  }
  uint64_t v79 = sub_10001F8B0();
  uint64_t v81 = v80;
  if (v79 == sub_10001F8B0() && v81 == v82)
  {
    swift_bridgeObjectRelease_n();
LABEL_84:

    return 15;
  }
  char v83 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v83) {
    goto LABEL_84;
  }
  uint64_t v84 = sub_10001F8B0();
  uint64_t v86 = v85;
  if (v84 == sub_10001F8B0() && v86 == v87)
  {
    swift_bridgeObjectRelease_n();
LABEL_89:

    return 16;
  }
  char v88 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v88) {
    goto LABEL_89;
  }
  uint64_t v89 = sub_10001F8B0();
  uint64_t v91 = v90;
  if (v89 == sub_10001F8B0() && v91 == v92)
  {
    swift_bridgeObjectRelease_n();
LABEL_94:

    return 17;
  }
  char v93 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v93) {
    goto LABEL_94;
  }
  uint64_t v94 = sub_10001F8B0();
  uint64_t v96 = v95;
  if (v94 == sub_10001F8B0() && v96 == v97)
  {
    swift_bridgeObjectRelease_n();
LABEL_99:

    return 18;
  }
  char v98 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v98) {
    goto LABEL_99;
  }
  uint64_t v99 = sub_10001F8B0();
  uint64_t v101 = v100;
  if (v99 == sub_10001F8B0() && v101 == v102)
  {
    swift_bridgeObjectRelease_n();
LABEL_104:

    return 19;
  }
  char v103 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v103) {
    goto LABEL_104;
  }
  uint64_t v104 = sub_10001F8B0();
  uint64_t v106 = v105;
  if (v104 == sub_10001F8B0() && v106 == v107)
  {
    swift_bridgeObjectRelease_n();
LABEL_109:

    return 20;
  }
  char v108 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v108) {
    goto LABEL_109;
  }
  uint64_t v109 = sub_10001F8B0();
  uint64_t v111 = v110;
  if (v109 == sub_10001F8B0() && v111 == v112)
  {
    swift_bridgeObjectRelease_n();
LABEL_114:

    return 21;
  }
  char v113 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v113) {
    goto LABEL_114;
  }
  uint64_t v114 = sub_10001F8B0();
  uint64_t v116 = v115;
  if (v114 == sub_10001F8B0() && v116 == v117)
  {
    swift_bridgeObjectRelease_n();
LABEL_119:

    return 22;
  }
  char v118 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v118) {
    goto LABEL_119;
  }
  if (qword_10002D5E0 != -1) {
    swift_once();
  }
  uint64_t v119 = sub_10001F850();
  sub_100004CDC(v119, (uint64_t)qword_10002D8B8);
  id v120 = v0;
  v121 = sub_10001F830();
  os_log_type_t v122 = sub_10001F960();
  if (os_log_type_enabled(v121, v122))
  {
    v123 = (uint8_t *)swift_slowAlloc();
    uint64_t v126 = swift_slowAlloc();
    *(_DWORD *)v123 = 136446210;
    uint64_t v124 = sub_10001F8B0();
    sub_100007E44(v124, v125, &v126);
    sub_10001F9B0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v121, v122, "This extension doesn't handle the “%{public}s” group", v123, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return 24;
}

void sub_100017644(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, SEL *a5)
{
  uint64_t v6 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_10001F9F0();
    sub_10001617C(0, a2);
    sub_10001DDF0(a4, a2);
    sub_10001F940();
    uint64_t v6 = v35;
    uint64_t v34 = v36;
    uint64_t v9 = v37;
    uint64_t v10 = v38;
    unint64_t v11 = v39;
  }
  else
  {
    uint64_t v12 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v34 = a1 + 56;
    uint64_t v9 = ~v12;
    uint64_t v13 = -v12;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v11 = v14 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
  }
  uint64_t v30 = v9;
  int64_t v33 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v31 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v15 = v10;
    if ((v6 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_10001FA00()) {
      goto LABEL_38;
    }
    sub_10001617C(0, a2);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v18 = v40;
    swift_unknownObjectRelease();
    if (!v40) {
      goto LABEL_38;
    }
LABEL_31:
    id v22 = objc_msgSend(v18, *a5, v30);
    if (v22)
    {
      char v23 = v22;
      uint64_t v24 = sub_10001F8B0();
      uint64_t v26 = v25;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v31 = sub_1000179BC(0, *((void *)v31 + 2) + 1, 1, v31);
      }
      unint64_t v28 = *((void *)v31 + 2);
      unint64_t v27 = *((void *)v31 + 3);
      if (v28 >= v27 >> 1) {
        uint64_t v31 = sub_1000179BC((char *)(v27 > 1), v28 + 1, 1, v31);
      }
      *((void *)v31 + 2) = v28 + 1;
      uint64_t v29 = &v31[16 * v28];
      *((void *)v29 + 4) = v24;
      *((void *)v29 + 5) = v26;
    }
    else
    {
    }
  }
  if (v11)
  {
    unint64_t v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v17 = v16 | (v10 << 6);
LABEL_30:
    id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v17);
    if (!v18) {
      goto LABEL_38;
    }
    goto LABEL_31;
  }
  int64_t v19 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v19 >= v33) {
      goto LABEL_38;
    }
    unint64_t v20 = *(void *)(v34 + 8 * v19);
    ++v10;
    if (!v20)
    {
      uint64_t v10 = v15 + 2;
      if (v15 + 2 >= v33) {
        goto LABEL_38;
      }
      unint64_t v20 = *(void *)(v34 + 8 * v10);
      if (!v20)
      {
        uint64_t v10 = v15 + 3;
        if (v15 + 3 >= v33) {
          goto LABEL_38;
        }
        unint64_t v20 = *(void *)(v34 + 8 * v10);
        if (!v20)
        {
          uint64_t v10 = v15 + 4;
          if (v15 + 4 >= v33) {
            goto LABEL_38;
          }
          unint64_t v20 = *(void *)(v34 + 8 * v10);
          if (!v20)
          {
            uint64_t v10 = v15 + 5;
            if (v15 + 5 >= v33) {
              goto LABEL_38;
            }
            unint64_t v20 = *(void *)(v34 + 8 * v10);
            if (!v20)
            {
              uint64_t v21 = v15 + 6;
              while (v33 != v21)
              {
                unint64_t v20 = *(void *)(v34 + 8 * v21++);
                if (v20)
                {
                  uint64_t v10 = v21 - 1;
                  goto LABEL_29;
                }
              }
LABEL_38:
              sub_1000160FC();
              return;
            }
          }
        }
      }
    }
LABEL_29:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v10 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

char *sub_1000179BC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100007B44(&qword_10002D878);
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
    sub_10001A734(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100017ACC()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 carPlay];
  id v1 = [v0 denyCarPlay];

  if (v1)
  {
    id v2 = [self denyCarPlayMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100017C30()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 allowedClient];
  id v1 = [v0 denyMDMEnrollment];

  if (v1)
  {
    id v2 = [self denyMDMEnrollmentMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100017D94()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 account];
  id v1 = [v0 lockAccounts];

  if (v1)
  {
    id v2 = [self lockAccountsMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100017EF8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyBookstore];

  if (v1)
  {
    id v2 = [self denyBookstoreMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001805C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyBookstoreErotica];

  if (v1)
  {
    id v2 = [self denyBookstoreEroticaMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000181C0()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyExplicitContent];

  if (v1)
  {
    id v2 = [self denyExplicitContentMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018324()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyiTunes];

  if (v1)
  {
    id v2 = [self denyiTunesMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018488()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyMusicArtistActivity];

  if (v1)
  {
    id v2 = [self denyMusicArtistActivityMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000185EC()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyMusicService];

  if (v1)
  {
    id v2 = [self denyMusicServiceMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018750()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyMusicVideos];

  if (v1)
  {
    id v2 = [self denyMusicVideosMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000188B4()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 denyPodcasts];

  if (v1)
  {
    id v2 = [self denyPodcastsMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018A18()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 lockSpeakerVolumeLimit];

  if (v1)
  {
    id v2 = [self lockSpeakerVolumeLimitMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018B7C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 lockTVProvider];

  if (v1)
  {
    id v2 = [self lockTVProviderMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018CE0()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 maximumMovieRating];

  if (v1)
  {
    id v2 = [self maximumMovieRatingMetadata];
    id v3 = [v2 defaultValue];

    id v4 = [v1 integerValue];
    [v3 integerValue];

    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018E3C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 media];
  id v1 = [v0 maximumTVShowRating];

  if (v1)
  {
    id v2 = [self maximumTVShowRatingMetadata];
    id v3 = [v2 defaultValue];

    id v4 = [v1 integerValue];
    [v3 integerValue];

    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100018F98()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 airDrop];
  id v1 = [v0 denyAirDrop];

  if (v1)
  {
    id v2 = [self denyAirDropMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000190FC()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 cellular];
  id v1 = [v0 lockAppCellularData];

  if (v1)
  {
    id v2 = [self lockCellularPlanMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019260()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 cellular];
  id v1 = [v0 lockCellularPlan];

  if (v1)
  {
    id v2 = [self lockCellularPlanMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000193C4()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 cellular];
  id v1 = [v0 lockESIM];

  if (v1)
  {
    id v2 = [self lockESIMMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019528()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 camera];
  id v1 = [v0 denyCamera];

  if (v1)
  {
    id v2 = [self denyCameraMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001968C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 camera];
  id v1 = [v0 denyScreenRecording];

  if (v1)
  {
    id v2 = [self denyScreenRecordingMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000197F0()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 appStore];
  id v1 = [v0 denyAppStoreAppInstallation];

  if (v1)
  {
    id v2 = [self denyAppStoreAppInstallationMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019954()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 appStore];
  id v1 = [v0 denyInAppPurchases];

  if (v1)
  {
    id v2 = [self denyInAppPurchasesMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019AB8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 appStore];
  id v1 = [v0 denyMarketplaceAppInstallation];

  if (v1)
  {
    id v2 = [self denyMarketplaceAppInstallationMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019C1C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 appStore];
  id v1 = [v0 denyWebDistributionAppInstallation];

  if (v1)
  {
    id v2 = [self denyWebDistributionAppInstallationMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019D80()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 appStore];
  id v1 = [v0 maximumRating];

  if (v1)
  {
    id v2 = [self maximumRatingMetadata];
    id v3 = [v2 defaultValue];

    id v4 = [v1 integerValue];
    [v3 integerValue];

    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_100019EDC()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 appStore];
  id v1 = [v0 requirePasswordForPurchases];

  if (v1)
  {
    id v2 = [self requirePasswordForPurchasesMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A040()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 notification];
  id v1 = [v0 lockDriverDoNotDisturb];

  if (v1)
  {
    id v2 = [self lockDriverDoNotDisturbMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A1A4()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 dateAndTime];
  id v1 = [v0 requireAutomaticDateAndTime];

  if (v1)
  {
    id v2 = [self requireAutomaticDateAndTimeMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A308()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 faceTime];
  id v1 = [v0 denyFaceTime];

  if (v1)
  {
    id v2 = [self denyFaceTimeMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A46C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 faceTime];
  id v1 = [v0 denySharePlay];

  if (v1)
  {
    id v2 = [self denySharePlayMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A5D0()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 passcode];
  id v1 = [v0 lockPasscode];

  if (v1)
  {
    id v2 = [self lockPasscodeMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001A734(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10001FAF0();
  __break(1u);
  return result;
}

id sub_10001A828(void *a1)
{
  id v2 = [a1 policy];
  switch((unint64_t)v2)
  {
    case 0uLL:
      return v2;
    case 1uLL:
      id v3 = [a1 neverAllow];
      if (v3)
      {
        uint64_t v4 = v3;
        sub_10001617C(0, &qword_10002D880);
        sub_10001DDF0(&qword_10002D888, &qword_10002D880);
        uint64_t v5 = sub_10001F920();

        sub_100017644(v5, &qword_10002D880, (uint64_t)MOWebDomain_ptr, &qword_10002D888, (SEL *)&selRef_domain);
        swift_bridgeObjectRelease();
      }
      id v2 = 0;
      break;
    case 2uLL:
      id v10 = [a1 autoAllow];
      if (v10)
      {
        int64_t v11 = v10;
        sub_10001617C(0, &qword_10002D880);
        sub_10001DDF0(&qword_10002D888, &qword_10002D880);
        uint64_t v12 = sub_10001F920();

        sub_100017644(v12, &qword_10002D880, (uint64_t)MOWebDomain_ptr, &qword_10002D888, (SEL *)&selRef_domain);
        id v2 = v13;
        swift_bridgeObjectRelease();
      }
      else
      {
        id v2 = &_swiftEmptyArrayStorage;
      }
      id v17 = [a1 neverAllow];
      if (v17)
      {
        id v18 = v17;
        sub_10001617C(0, &qword_10002D880);
        sub_10001DDF0(&qword_10002D888, &qword_10002D880);
        uint64_t v19 = sub_10001F920();

        sub_100017644(v19, &qword_10002D880, (uint64_t)MOWebDomain_ptr, &qword_10002D888, (SEL *)&selRef_domain);
        swift_bridgeObjectRelease();
      }
      break;
    case 3uLL:
      id v14 = [a1 onlyAllow];
      if (v14)
      {
        uint64_t v15 = v14;
        sub_10001617C(0, &qword_10002D880);
        sub_10001DDF0(&qword_10002D888, &qword_10002D880);
        uint64_t v16 = sub_10001F920();

        sub_100017644(v16, &qword_10002D880, (uint64_t)MOWebDomain_ptr, &qword_10002D888, (SEL *)&selRef_domain);
        swift_bridgeObjectRelease();
      }
      id v2 = 0;
      break;
    default:
      if (qword_10002D5E0 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_10001F850();
      sub_100004CDC(v6, (uint64_t)qword_10002D8B8);
      uint64_t v7 = sub_10001F830();
      os_log_type_t v8 = sub_10001F960();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unknown WebContentSettings.FilterPolicy; Returning “.none”",
          v9,
          2u);
        swift_slowDealloc();
      }

      id v2 = 0;
      break;
  }
  return v2;
}

void sub_10001AC48(void *a1@<X8>)
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v2 = [(id)qword_10002D860 webContent];
  id v3 = [v2 blockedByFilter];

  if (v3)
  {
    id v4 = [self blockedByFilterMetadata];
    id v5 = [v4 defaultValue];

    id v6 = sub_10001A828(v3);
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    id v11 = sub_10001A828(v5);
    uint64_t v13 = v12;
    uint64_t v15 = v14;

    *a1 = v6;
    a1[1] = v8;
    a1[2] = v10;
    a1[3] = v11;
    a1[4] = v13;
    a1[5] = v15;
  }
  else
  {
    sub_10001FAB0();
    __break(1u);
  }
}

uint64_t sub_10001ADC8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 calculator];
  id v1 = [v0 denyMathPaperSolving];

  if (v1)
  {
    id v2 = [self denyMathPaperSolvingMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001AF2C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 news];
  id v1 = [v0 denyNews];

  if (v1)
  {
    id v2 = [self denyNewsMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B090()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 application];
  id v1 = [v0 blockedApplications];

  if (v1)
  {
    sub_10001617C(0, &qword_10002D868);
    sub_10001DDF0(&qword_10002D870, &qword_10002D868);
    uint64_t v2 = sub_10001F920();

    sub_100017644(v2, &qword_10002D868, (uint64_t)MOApplication_ptr, &qword_10002D870, (SEL *)&selRef_bundleIdentifier);
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    id v5 = [self blockedApplicationsMetadata];
    id v6 = [v5 defaultValue];

    uint64_t v7 = sub_10001F920();
    sub_100017644(v7, &qword_10002D868, (uint64_t)MOApplication_ptr, &qword_10002D870, (SEL *)&selRef_bundleIdentifier);
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B29C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 application];
  id v1 = [v0 denyAppClips];

  if (v1)
  {
    id v2 = [self denyAppClipsMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B400()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 application];
  id v1 = [v0 denyAppInstallation];

  if (v1)
  {
    id v2 = [self denyAppInstallationMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B564()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 application];
  id v1 = [v0 denyAppRemoval];

  if (v1)
  {
    id v2 = [self denyAppRemovalMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B6C8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 application];
  id v1 = [v0 denyBackgroundAppRefresh];

  if (v1)
  {
    id v2 = [self denyBackgroundAppRefreshMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B82C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 application];
  id v1 = [v0 unremovableApplications];

  if (v1)
  {
    sub_10001617C(0, &qword_10002D868);
    sub_10001DDF0(&qword_10002D870, &qword_10002D868);
    uint64_t v2 = sub_10001F920();

    sub_100017644(v2, &qword_10002D868, (uint64_t)MOApplication_ptr, &qword_10002D870, (SEL *)&selRef_bundleIdentifier);
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    id v5 = [self unremovableApplicationsMetadata];
    id v6 = [v5 defaultValue];

    uint64_t v7 = sub_10001F920();
    sub_100017644(v7, &qword_10002D868, (uint64_t)MOApplication_ptr, &qword_10002D870, (SEL *)&selRef_bundleIdentifier);
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BA38()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 siri];
  id v1 = [v0 denyFeature1];

  if (v1)
  {
    id v2 = [self denyFeature1Metadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BB9C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 siri];
  id v1 = [v0 denySiri];

  if (v1)
  {
    id v2 = [self denySiriMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BD00()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 siri];
  id v1 = [v0 denySiriUserGeneratedContent];

  if (v1)
  {
    id v2 = [self denySiriUserGeneratedContentMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BE64()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 siri];
  id v1 = [v0 forceSiriProfanityFilter];

  if (v1)
  {
    id v2 = [self forceSiriProfanityFilterMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BFC8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 findMy];
  id v1 = [v0 lockFindMyFriends];

  if (v1)
  {
    id v2 = [self lockFindMyFriendsMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C12C(void *a1)
{
  uint64_t v2 = sub_10001F8B0();
  uint64_t v4 = v3;
  if (v2 == sub_10001F8B0() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  else
  {
    char v7 = sub_10001FB00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = 0;
    if ((v7 & 1) == 0)
    {
      uint64_t v9 = sub_10001F8B0();
      uint64_t v11 = v10;
      if (v9 == sub_10001F8B0() && v11 == v12)
      {
        swift_bridgeObjectRelease_n();
        return 1;
      }
      else
      {
        char v14 = sub_10001FB00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v14)
        {
          return 1;
        }
        else
        {
          uint64_t v15 = sub_10001F8B0();
          uint64_t v17 = v16;
          if (v15 == sub_10001F8B0() && v17 == v18)
          {
            uint64_t v8 = 2;
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v19 = sub_10001FB00();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v19 & 1) == 0)
            {
              if (qword_10002D5E0 != -1) {
                swift_once();
              }
              uint64_t v20 = sub_10001F850();
              sub_100004CDC(v20, (uint64_t)qword_10002D8B8);
              id v21 = a1;
              id v22 = sub_10001F830();
              os_log_type_t v23 = sub_10001F960();
              if (os_log_type_enabled(v22, v23))
              {
                uint64_t v24 = (uint8_t *)swift_slowAlloc();
                uint64_t v28 = swift_slowAlloc();
                *(_DWORD *)uint64_t v24 = 136446210;
                uint64_t v25 = sub_10001F8B0();
                sub_100007E44(v25, v26, &v28);
                sub_10001F9B0();

                swift_bridgeObjectRelease();
                _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unknown MOGameCenterAllowedOtherPlayerTypes “%{public}s”; Returning “.everyone”",
                  v24,
                  0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {
              }
            }
            return 2;
          }
        }
      }
    }
  }
  return v8;
}

uint64_t sub_10001C440()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 allowedOtherPlayerTypes];

  if (v1)
  {
    id v2 = [self allowedOtherPlayerTypesMetadata];
    id v3 = [v2 defaultValue];

    LOBYTE(v2) = sub_10001C12C(v1);
    int v4 = sub_10001C12C(v3);

    return v2 | (v4 << 8);
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C590()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 denyAddingFriends];

  if (v1)
  {
    id v2 = [self denyAddingFriendsMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C6F4()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 denyGameCenter];

  if (v1)
  {
    id v2 = [self denyGameCenterMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C858()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 denyMultiplayerGaming];

  if (v1)
  {
    id v2 = [self denyMultiplayerGamingMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C9BC()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 denyNearbyMultiplayer];

  if (v1)
  {
    id v2 = [self denyNearbyMultiplayerMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001CB20()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 denyPrivateMessaging];

  if (v1)
  {
    id v2 = [self denyPrivateMessagingMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001CC84()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 lockFriendsSharing];

  if (v1)
  {
    id v2 = [self lockFriendsSharingMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001CDE8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 lockProfile];

  if (v1)
  {
    id v2 = [self lockProfileMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001CF4C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 gameCenter];
  id v1 = [v0 lockProfilePrivacy];

  if (v1)
  {
    id v2 = [self lockProfilePrivacyMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001D0B0()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 keyboard];
  id v1 = [v0 denyDictation];

  if (v1)
  {
    id v2 = [self denyDictationMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001D214()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 keyboard];
  id v1 = [v0 denyMathSolvingKeyboard];

  if (v1)
  {
    id v2 = [self denyMathSolvingKeyboardMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001D378()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 messages];
  id v1 = [v0 denyiMessage];

  if (v1)
  {
    id v2 = [self denyiMessageMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001D4DC()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 privacy];
  id v1 = [v0 forceLimitAdTracking];

  if (v1)
  {
    id v2 = [self forceLimitAdTrackingMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001D640(void *a1)
{
  uint64_t v2 = sub_10001F8B0();
  uint64_t v4 = v3;
  if (v2 == sub_10001F8B0() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  char v7 = sub_10001FB00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = 0;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = sub_10001F8B0();
    uint64_t v11 = v10;
    if (v9 == sub_10001F8B0() && v11 == v12)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    char v14 = sub_10001FB00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14) {
      return 1;
    }
    uint64_t v16 = sub_10001F8B0();
    uint64_t v18 = v17;
    if (v16 == sub_10001F8B0() && v18 == v19)
    {
      uint64_t v8 = 2;
      swift_bridgeObjectRelease_n();
      return v8;
    }
    char v20 = sub_10001FB00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v20) {
      return 2;
    }
    uint64_t v21 = sub_10001F8B0();
    uint64_t v23 = v22;
    if (v21 == sub_10001F8B0() && v23 == v24)
    {
      swift_bridgeObjectRelease_n();
      return 3;
    }
    char v25 = sub_10001FB00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v25) {
      return 3;
    }
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_10001F850();
    sub_100004CDC(v26, (uint64_t)qword_10002D8B8);
    id v27 = a1;
    uint64_t v28 = sub_10001F830();
    os_log_type_t v29 = sub_10001F960();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136446210;
      uint64_t v31 = sub_10001F8B0();
      sub_100007E44(v31, v32, &v33);
      sub_10001F9B0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Unknown MOSafariCookiePolicy “%{public}s”; Returning “.always”",
        v30,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return 0;
  }
  return v8;
}

uint64_t sub_10001D9D8()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 safari];
  id v1 = [v0 cookiePolicy];

  if (v1)
  {
    id v2 = [self cookiePolicyMetadata];
    id v3 = [v2 defaultValue];

    LOBYTE(v2) = sub_10001D640(v1);
    int v4 = sub_10001D640(v3);

    return v2 | (v4 << 8);
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001DB28()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 safari];
  id v1 = [v0 denyAutoFill];

  if (v1)
  {
    id v2 = [self denyAutoFillMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001DC8C()
{
  if (qword_10002D5D8 != -1) {
    swift_once();
  }
  id v0 = [(id)qword_10002D860 safari];
  id v1 = [v0 denySafari];

  if (v1)
  {
    id v2 = [self denySafariMetadata];
    id v3 = [v2 defaultValue];

    unsigned int v4 = [v1 BOOLValue];
    unsigned int v5 = [v3 BOOLValue];

    if (v5) {
      int v6 = 256;
    }
    else {
      int v6 = 0;
    }
    return v6 | v4;
  }
  else
  {
    uint64_t result = sub_10001FAB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_10001DDF0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001617C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedWebContentSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedWebContentSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedSiriSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedSiriSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedSafariSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedSafariSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedPrivacySettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedPrivacySettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedPasscodeSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedPasscodeSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedNotificationSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedNotificationSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedNewsSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedNewsSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedMessagesSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedMessagesSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedMediaSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedMediaSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedKeyboardSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedKeyboardSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedGameCenterSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedGameCenterSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedFindMySettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedFindMySettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedFaceTimeSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedFaceTimeSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedDateAndTimeSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedDateAndTimeSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedCellularSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedCellularSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedCarPlaySettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedCarPlaySettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedCameraSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedCameraSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedCalculatorSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedCalculatorSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedAppStoreSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedAppStoreSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedApplicationSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedApplicationSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedAllowedClientSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedAllowedClientSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedAirDropSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedAirDropSettings;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings.SupportedAccountSettings()
{
  return &type metadata for EffectiveManagedSettings.SupportedAccountSettings;
}

uint64_t destroy for EffectiveManagedSettings(uint64_t a1)
{
  sub_10000633C(a1);
  sub_10000633C(a1 + 40);
  sub_10000633C(a1 + 80);
  sub_10000633C(a1 + 120);
  sub_10000633C(a1 + 160);
  sub_10000633C(a1 + 200);
  sub_10000633C(a1 + 240);
  sub_10000633C(a1 + 280);
  sub_10000633C(a1 + 320);
  sub_10000633C(a1 + 360);
  sub_10000633C(a1 + 400);
  sub_10000633C(a1 + 440);
  sub_10000633C(a1 + 480);
  sub_10000633C(a1 + 520);
  sub_10000633C(a1 + 560);
  sub_10000633C(a1 + 600);
  sub_10000633C(a1 + 640);
  sub_10000633C(a1 + 680);
  sub_10000633C(a1 + 720);
  sub_10000633C(a1 + 760);
  sub_10000633C(a1 + 800);
  sub_10000633C(a1 + 840);
  return sub_10000633C(a1 + 880);
}

uint64_t initializeWithCopy for EffectiveManagedSettings(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  long long v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 264);
  uint64_t v11 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  *(void *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  long long v12 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 280, a2 + 280);
  uint64_t v13 = *(void *)(a2 + 344);
  uint64_t v14 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = v13;
  *(void *)(a1 + 352) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 320, a2 + 320);
  long long v15 = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 384) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 360, a2 + 360);
  uint64_t v16 = *(void *)(a2 + 424);
  uint64_t v17 = *(void *)(a2 + 432);
  *(void *)(a1 + 424) = v16;
  *(void *)(a1 + 432) = v17;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 400, a2 + 400);
  long long v18 = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 464) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 440, a2 + 440);
  uint64_t v19 = *(void *)(a2 + 504);
  uint64_t v20 = *(void *)(a2 + 512);
  *(void *)(a1 + 504) = v19;
  *(void *)(a1 + 512) = v20;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 480, a2 + 480);
  long long v21 = *(_OWORD *)(a2 + 544);
  *(_OWORD *)(a1 + 544) = v21;
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 520, a2 + 520);
  uint64_t v22 = *(void *)(a2 + 584);
  *(void *)(a1 + 584) = v22;
  *(void *)(a1 + 592) = *(void *)(a2 + 592);
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 560, a2 + 560);
  long long v23 = *(_OWORD *)(a2 + 624);
  *(_OWORD *)(a1 + 624) = v23;
  (**(void (***)(uint64_t, uint64_t))(v23 - 8))(a1 + 600, a2 + 600);
  uint64_t v24 = *(void *)(a2 + 664);
  *(void *)(a1 + 664) = v24;
  *(void *)(a1 + 672) = *(void *)(a2 + 672);
  (**(void (***)(uint64_t, uint64_t))(v24 - 8))(a1 + 640, a2 + 640);
  long long v25 = *(_OWORD *)(a2 + 704);
  *(_OWORD *)(a1 + 704) = v25;
  (**(void (***)(uint64_t, uint64_t))(v25 - 8))(a1 + 680, a2 + 680);
  uint64_t v26 = *(void *)(a2 + 744);
  *(void *)(a1 + 744) = v26;
  *(void *)(a1 + 752) = *(void *)(a2 + 752);
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 720, a2 + 720);
  long long v27 = *(_OWORD *)(a2 + 784);
  *(_OWORD *)(a1 + 784) = v27;
  (**(void (***)(uint64_t, uint64_t))(v27 - 8))(a1 + 760, a2 + 760);
  uint64_t v28 = *(void *)(a2 + 824);
  *(void *)(a1 + 824) = v28;
  *(void *)(a1 + 832) = *(void *)(a2 + 832);
  (**(void (***)(uint64_t, uint64_t))(v28 - 8))(a1 + 800, a2 + 800);
  long long v29 = *(_OWORD *)(a2 + 864);
  *(_OWORD *)(a1 + 864) = v29;
  (**(void (***)(uint64_t, uint64_t))(v29 - 8))(a1 + 840, a2 + 840);
  uint64_t v30 = *(void *)(a2 + 904);
  *(void *)(a1 + 904) = v30;
  *(void *)(a1 + 912) = *(void *)(a2 + 912);
  (**(void (***)(uint64_t, uint64_t))(v30 - 8))(a1 + 880, a2 + 880);
  return a1;
}

uint64_t *assignWithCopy for EffectiveManagedSettings(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_10001E904(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    id v3 = result;
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
        *id v3 = v12;
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
          *id v3 = *a2;
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

void *initializeWithTake for EffectiveManagedSettings(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x398uLL);
}

uint64_t assignWithTake for EffectiveManagedSettings(uint64_t a1, uint64_t a2)
{
  sub_10000633C(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_10000633C(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_10000633C(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  sub_10000633C(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  sub_10000633C(a1 + 160);
  long long v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  sub_10000633C(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  sub_10000633C(a1 + 240);
  long long v7 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v7;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  sub_10000633C(a1 + 280);
  long long v8 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v8;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  sub_10000633C(a1 + 320);
  long long v9 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v9;
  *(void *)(a1 + 352) = *(void *)(a2 + 352);
  sub_10000633C(a1 + 360);
  long long v10 = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 376) = v10;
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  sub_10000633C(a1 + 400);
  long long v11 = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 400) = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 416) = v11;
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  sub_10000633C(a1 + 440);
  long long v12 = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
  *(_OWORD *)(a1 + 456) = v12;
  *(void *)(a1 + 472) = *(void *)(a2 + 472);
  sub_10000633C(a1 + 480);
  long long v13 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 496) = v13;
  *(void *)(a1 + 512) = *(void *)(a2 + 512);
  sub_10000633C(a1 + 520);
  long long v14 = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 520) = *(_OWORD *)(a2 + 520);
  *(_OWORD *)(a1 + 536) = v14;
  *(void *)(a1 + 552) = *(void *)(a2 + 552);
  sub_10000633C(a1 + 560);
  long long v15 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 560) = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 576) = v15;
  *(void *)(a1 + 592) = *(void *)(a2 + 592);
  sub_10000633C(a1 + 600);
  long long v16 = *(_OWORD *)(a2 + 616);
  *(_OWORD *)(a1 + 600) = *(_OWORD *)(a2 + 600);
  *(_OWORD *)(a1 + 616) = v16;
  *(void *)(a1 + 632) = *(void *)(a2 + 632);
  sub_10000633C(a1 + 640);
  long long v17 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 640) = *(_OWORD *)(a2 + 640);
  *(_OWORD *)(a1 + 656) = v17;
  *(void *)(a1 + 672) = *(void *)(a2 + 672);
  sub_10000633C(a1 + 680);
  long long v18 = *(_OWORD *)(a2 + 696);
  *(_OWORD *)(a1 + 680) = *(_OWORD *)(a2 + 680);
  *(_OWORD *)(a1 + 696) = v18;
  *(void *)(a1 + 712) = *(void *)(a2 + 712);
  sub_10000633C(a1 + 720);
  long long v19 = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 720) = *(_OWORD *)(a2 + 720);
  *(_OWORD *)(a1 + 736) = v19;
  *(void *)(a1 + 752) = *(void *)(a2 + 752);
  sub_10000633C(a1 + 760);
  long long v20 = *(_OWORD *)(a2 + 776);
  *(_OWORD *)(a1 + 760) = *(_OWORD *)(a2 + 760);
  *(_OWORD *)(a1 + 776) = v20;
  *(void *)(a1 + 792) = *(void *)(a2 + 792);
  sub_10000633C(a1 + 800);
  long long v21 = *(_OWORD *)(a2 + 816);
  *(_OWORD *)(a1 + 800) = *(_OWORD *)(a2 + 800);
  *(_OWORD *)(a1 + 816) = v21;
  *(void *)(a1 + 832) = *(void *)(a2 + 832);
  sub_10000633C(a1 + 840);
  long long v22 = *(_OWORD *)(a2 + 856);
  *(_OWORD *)(a1 + 840) = *(_OWORD *)(a2 + 840);
  *(_OWORD *)(a1 + 856) = v22;
  *(void *)(a1 + 872) = *(void *)(a2 + 872);
  sub_10000633C(a1 + 880);
  long long v23 = *(_OWORD *)(a2 + 896);
  *(_OWORD *)(a1 + 880) = *(_OWORD *)(a2 + 880);
  *(_OWORD *)(a1 + 896) = v23;
  *(void *)(a1 + 912) = *(void *)(a2 + 912);
  return a1;
}

uint64_t getEnumTagSinglePayload for EffectiveManagedSettings(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 920)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EffectiveManagedSettings(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 920) = 1;
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
    *(unsigned char *)(result + 920) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EffectiveManagedSettings()
{
  return &type metadata for EffectiveManagedSettings;
}

uint64_t sub_10001EF70()
{
  uint64_t v0 = sub_10001F850();
  sub_100004C78(v0, qword_10002D8B8);
  sub_100004CDC(v0, (uint64_t)qword_10002D8B8);
  return sub_10001F840();
}

void sub_10001EFF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, NSObject *a5)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_10001F850();
    sub_100004CDC(v8, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    long long v9 = sub_10001F830();
    os_log_type_t v10 = sub_10001F960();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315394;
      swift_bridgeObjectRetain();
      sub_100007E44(a2, a3, &v18);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v12 = sub_10001FB30();
      sub_100007E44(v12, v13, &v18);
      sub_10001F9B0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to set removability for %s. Error: %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    if (qword_10002D5E0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_10001F850();
    sub_100004CDC(v14, (uint64_t)qword_10002D8B8);
    swift_bridgeObjectRetain_n();
    long long v15 = sub_10001F830();
    os_log_type_t v16 = sub_10001F970();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 134218242;
      sub_10001F9B0();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_100007E44(a2, a3, &v18);
      sub_10001F9B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Successfully set removability to %lu for %s.", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  dispatch_group_leave(a5);
}

void sub_10001F3D4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10001F440(uint64_t a1, uint64_t a2)
{
  id v4 = dispatch_group_create();
  uint64_t v22 = a2 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v23 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v19 >= v23) {
      goto LABEL_21;
    }
    unint64_t v20 = *(void *)(v22 + 8 * v19);
    ++v8;
    if (!v20)
    {
      int64_t v8 = v19 + 1;
      if (v19 + 1 >= v23) {
        goto LABEL_21;
      }
      unint64_t v20 = *(void *)(v22 + 8 * v8);
      if (!v20)
      {
        int64_t v8 = v19 + 2;
        if (v19 + 2 >= v23) {
          goto LABEL_21;
        }
        unint64_t v20 = *(void *)(v22 + 8 * v8);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v20 - 1) & v20;
    unint64_t v10 = __clz(__rbit64(v20)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    dispatch_group_enter(v4);
    uint64_t v14 = self;
    NSString v15 = sub_10001F8A0();
    os_log_type_t v16 = (void *)swift_allocObject();
    v16[2] = v12;
    v16[3] = v13;
    v16[4] = a1;
    v16[5] = v4;
    aBlock[4] = sub_10001F70C;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001F3D4;
    aBlock[3] = &unk_100029608;
    uint64_t v17 = _Block_copy(aBlock);
    uint64_t v18 = v4;
    swift_release();
    [v14 setRemovability:a1 forAppWithBundleID:v15 byClient:2 completion:v17];
    _Block_release(v17);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v23)
  {
LABEL_21:
    swift_release();
    sub_10001F980();

    return;
  }
  unint64_t v20 = *(void *)(v22 + 8 * v21);
  if (v20)
  {
    int64_t v8 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v8 >= v23) {
      goto LABEL_21;
    }
    unint64_t v20 = *(void *)(v22 + 8 * v8);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_10001F6CC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10001F70C(uint64_t a1)
{
  sub_10001EFF4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(NSObject **)(v1 + 40));
}

uint64_t sub_10001F718(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F728()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for AppRemovabilityManager()
{
  return &type metadata for AppRemovabilityManager;
}

uint64_t sub_10001F740()
{
  return static CocoaError.fileWriteFileExists.getter();
}

uint64_t sub_10001F750()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_10001F760()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_10001F770()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10001F780()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10001F790()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_10001F7A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10001F7B0()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t sub_10001F7C0()
{
  return URL.deletingLastPathComponent()();
}

uint64_t sub_10001F7D0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001F7E0()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_10001F7F0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10001F800()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F810()
{
  return Data.write(to:options:)();
}

uint64_t sub_10001F820()
{
  return ObjCBool.description.getter();
}

uint64_t sub_10001F830()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001F840()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001F850()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_10001F860()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001F870()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10001F880()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F890()
{
  return Dictionary.description.getter();
}

NSString sub_10001F8A0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001F8B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F8C0()
{
  return String.hash(into:)();
}

void sub_10001F8D0(Swift::String a1)
{
}

Swift::Int sub_10001F8E0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10001F8F0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001F900()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F910()
{
  return Array.description.getter();
}

uint64_t sub_10001F920()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001F930()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10001F940()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_10001F950()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10001F960()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001F970()
{
  return static os_log_type_t.default.getter();
}

void sub_10001F980()
{
}

NSNumber sub_10001F990(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_10001F9A0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10001F9B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001F9C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001F9D0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10001F9E0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10001F9F0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10001FA00()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int sub_10001FA10(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10001FA20()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10001FA30()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10001FA40()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10001FA50()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001FA60()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10001FA70(Swift::Int a1)
{
}

uint64_t sub_10001FA80()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001FA90()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001FAA0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001FAB0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001FAC0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10001FAD0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10001FAE0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001FAF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10001FB00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001FB10()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001FB20()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10001FB30()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10001FB40()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10001FB50()
{
  return Error._code.getter();
}

uint64_t sub_10001FB60()
{
  return Error._domain.getter();
}

uint64_t sub_10001FB70()
{
  return Error._userInfo.getter();
}

uint64_t sub_10001FB80()
{
  return Hasher.init(_seed:)();
}

void sub_10001FB90(Swift::UInt a1)
{
}

Swift::Int sub_10001FBA0()
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}