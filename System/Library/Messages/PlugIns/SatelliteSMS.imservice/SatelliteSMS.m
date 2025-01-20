uint64_t sub_3D58()
{
  uint64_t v0;
  id v1;

  v0 = sub_10410();
  sub_D5B4(v0, qword_197A0);
  sub_3E2C(v0, (uint64_t)qword_197A0);
  v1 = [self logger];
  return sub_10420();
}

uint64_t sub_3DC8()
{
  if (qword_19440 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10410();

  return sub_3E2C(v0, (uint64_t)qword_197A0);
}

uint64_t sub_3E2C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_3E64@<X0>(uint64_t a1@<X8>)
{
  if (qword_19440 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10410();
  uint64_t v3 = sub_3E2C(v2, (uint64_t)qword_197A0);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_3F0C()
{
  uint64_t v0 = sub_10410();
  sub_D5B4(v0, qword_19450);
  uint64_t v1 = sub_3E2C(v0, (uint64_t)qword_19450);
  if (qword_19440 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_3E2C(v0, (uint64_t)qword_197A0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t variable initialization expression of SatelliteSMSServiceSession.state()
{
  return 0;
}

id SatelliteSMSServiceSession.init(account:service:replicatingFor:)(void *a1, void *a2, void *a3)
{
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithAccount:a1 service:a2 replicatingForSession:a3];

  return v6;
}

{
  uint64_t v3;
  _OWORD *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  void *v21;
  char *v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v36;
  objc_super v37;

  v7 = (_OWORD *)(v3 + OBJC_IVAR___SatelliteSMSServiceSession_state);
  *v7 = 0u;
  v7[1] = 0u;
  v37.super_class = (Class)SatelliteSMSServiceSession;
  v8 = objc_msgSendSuper2(&v37, "initWithAccount:service:replicatingForSession:", a1, a2, a3);
  v9 = self;
  v10 = v8;
  if ([v9 systemSupportsSatelliteSMS])
  {
    v11 = [v9 smsServiceType];
    sub_D460(0, &qword_19058);
    v12 = (char *)v10;
    v13 = (void *)sub_10560();
    v14 = [objc_allocWithZone((Class)CTStewieDataClient) initWithServices:v11 delegate:v12 delegateQueue:v13];

    if (v14)
    {
      v36 = v10;
      if (qword_19448 != -1) {
        swift_once();
      }
      v15 = sub_10410();
      sub_3E2C(v15, (uint64_t)qword_19450);
      v16 = sub_10400();
      v17 = sub_10520();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_0, v16, v17, "Starting CTStewieDataClient", v18, 2u);
        swift_slowDealloc();
      }

      [v14 start];
      type metadata accessor for SatelliteSMSMessageTransformer();
      v19 = swift_allocObject();
      *(void *)(v19 + 24) = &protocol witness table for SatelliteSMSServiceSession;
      swift_unknownObjectUnownedInit();
      v20 = &v12[OBJC_IVAR___SatelliteSMSServiceSession_state];
      v21 = *(void **)&v12[OBJC_IVAR___SatelliteSMSServiceSession_state];
      *(void *)v20 = v14;
      *((void *)v20 + 1) = 0;
      *((void *)v20 + 2) = v19;
      *((void *)v20 + 3) = 0;
      v22 = (char *)v14;
      swift_retain();
      sub_A200(v21);
      v23 = [self sharedInstance];
      [v23 addListener:v12];

      v24 = sub_10400();
      v25 = sub_10520();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_0, v24, v25, "SatelliteSMSServiceSession is ready to go!", v26, 2u);
        swift_slowDealloc();

        swift_release();
        v22 = v12;
      }
      else
      {

        swift_release();
      }
      v10 = v36;
    }
    else
    {
      if (qword_19448 != -1) {
        swift_once();
      }
      v31 = sub_10410();
      sub_3E2C(v31, (uint64_t)qword_19450);
      v32 = sub_10400();
      v33 = sub_10540();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_0, v32, v33, "Failed to initialize CTStewieDataClient!", v34, 2u);
        swift_slowDealloc();
      }

      v22 = v12;
    }
  }
  else
  {
    if (qword_19448 != -1) {
      swift_once();
    }
    v27 = sub_10410();
    sub_3E2C(v27, (uint64_t)qword_19450);
    v28 = sub_10400();
    v29 = sub_10530();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "Hey you! Please update your SDK+device to 22A161 or newer.", v30, 2u);
      swift_slowDealloc();
    }

    v22 = (char *)v10;
  }

  return v10;
}

void SatelliteSMSServiceSession.calculateReachability(with:responseHandler:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10410();
  sub_3E2C(v6, (uint64_t)qword_19450);
  id v7 = a1;
  v8 = sub_10400();
  os_log_type_t v9 = sub_10520();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v52 = a2;
    aBlock[0] = v7;
    v11 = (void *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    id v12 = v7;
    sub_10590();
    void *v11 = v7;

    uint64_t v3 = v2;
    _os_log_impl(&dword_0, v8, v9, "Calculating SatelliteSMS reachability for request: %@", v10, 0xCu);
    sub_A258(&qword_19060);
    swift_arrayDestroy();
    a2 = v52;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (*(void *)&v3[OBJC_IVAR___SatelliteSMSServiceSession_state])
  {
    if ((v3[OBJC_IVAR___SatelliteSMSServiceSession_state + 8] & 0x20) == 0)
    {
      v13 = sub_10400();
      os_log_type_t v14 = sub_10520();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_0, v13, v14, "Can't send over SatelliteSMS, service inactive", v15, 2u);
        swift_slowDealloc();
      }

      v16 = v7;
      v17 = a2;
LABEL_34:
      sub_4CE8(v16, v17);
      return;
    }
    v18 = &SatelliteSMSServiceSession__prots;
    id v19 = [v7 handleIDs];
    uint64_t v20 = sub_104F0();

    uint64_t v21 = *(void *)(v20 + 16);
    id v51 = v7;
    if (v21)
    {
      v50 = v3;
      v22 = self;
      uint64_t v23 = v20 + 40;
      while (1)
      {
        swift_bridgeObjectRetain();
        id v24 = [v22 sharedInstance];
        NSString v25 = sub_10460();
        unsigned int v26 = [v24 isPhoneNumberEmergencyNumber:v25];

        if (v26) {
          break;
        }
        NSString v27 = sub_10460();
        swift_bridgeObjectRelease();
        char IsStewie = IMStringIsStewie();

        if (IsStewie) {
          goto LABEL_31;
        }
        v23 += 16;
        if (!--v21)
        {
          swift_bridgeObjectRelease();
          uint64_t v3 = v50;
          id v7 = v51;
          v18 = &SatelliteSMSServiceSession__prots;
          goto LABEL_18;
        }
      }
      swift_bridgeObjectRelease();
LABEL_31:
      swift_bridgeObjectRelease();
      v47 = sub_10400();
      os_log_type_t v48 = sub_10520();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_0, v47, v48, "Can't send over SatelliteSMS to emergency numbers", v49, 2u);
        swift_slowDealloc();
      }

      v16 = v51;
      v17 = a2;
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
LABEL_18:
    id v29 = [v3 service];
    NSString v30 = [v29 internalName];

    if (!v30)
    {
      sub_10470();
      NSString v30 = sub_10460();
      swift_bridgeObjectRelease();
    }
    Class isa = (Class)[v7 (SEL)v18[381].count];
    if (!isa)
    {
      sub_104F0();
      Class isa = sub_104E0().super.isa;
      swift_bridgeObjectRelease();
    }
    v32 = self;
    aBlock[4] = sub_4E34;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_5038;
    aBlock[3] = &unk_14788;
    v33 = _Block_copy(aBlock);
    id v34 = [v32 finalResultForService:v30 handleIDs:isa allAreReachable:1 handleIsReachable:v33 checkedServer:0 error:0];
    _Block_release(v33);

    id v35 = [v7 (SEL)v18[381].count];
    uint64_t v36 = sub_104F0();

    unint64_t v37 = *(void *)(v36 + 16);
    swift_bridgeObjectRelease();
    if (v37 >= 2)
    {
      v38 = sub_10400();
      os_log_type_t v39 = sub_10520();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_0, v38, v39, "Can't send over SatelliteSMS, can only send to 1 participant", v40, 2u);
        swift_slowDealloc();
      }

      [v34 setError:1];
    }
    v41 = v34;
    v42 = sub_10400();
    os_log_type_t v43 = sub_10520();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = (void *)swift_slowAlloc();
      *(_DWORD *)v44 = 138412290;
      aBlock[0] = v41;
      v46 = v41;
      id v7 = v51;
      sub_10590();
      void *v45 = v41;

      _os_log_impl(&dword_0, v42, v43, "Calculated SatelliteSMS reachability request with result: %@", v44, 0xCu);
      sub_A258(&qword_19060);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v42 = v41;
    }

    [a2 reachabilityRequest:v7 updatedWithResult:v41];
  }
  else
  {
    __break(1u);
  }
}

void sub_4CE8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v6 = [v3 service];
  NSString v7 = [v6 internalName];

  if (!v7)
  {
    sub_10470();
    NSString v7 = sub_10460();
    swift_bridgeObjectRelease();
  }
  Class isa = (Class)[a1 handleIDs];
  if (!isa)
  {
    sub_104F0();
    Class isa = sub_104E0().super.isa;
    swift_bridgeObjectRelease();
  }
  id v9 = [self finalResultForService:v7 handleIDs:isa allAreReachable:0 checkedServer:0 error:3];

  [a2 reachabilityRequest:a1 updatedWithResult:v9];
}

void sub_4E34()
{
  NSString v0 = sub_10460();
  id v1 = [v0 _stripFZIDPrefix];

  if (v1)
  {
    uint64_t v2 = sub_10470();
    unint64_t v4 = v3;
    char IsPhoneNumber = IMStringIsPhoneNumber();

    if (IsPhoneNumber)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_19448 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_10410();
      sub_3E2C(v6, (uint64_t)qword_19450);
      swift_bridgeObjectRetain();
      NSString v7 = sub_10400();
      os_log_type_t v8 = sub_10520();
      if (os_log_type_enabled(v7, v8))
      {
        id v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = swift_slowAlloc();
        *(_DWORD *)id v9 = 136315138;
        swift_bridgeObjectRetain();
        sub_A29C(v2, v4, &v10);
        sub_10590();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v7, v8, "Can't send over SatelliteSMS, found non-phone number %s", v9, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_5038(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_10470();
  uint64_t v4 = v3;
  swift_retain();
  LOBYTE(v2) = v1(v2, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t SatelliteSMSServiceSession.shouldExcludeChat(fromRelay:)()
{
  return 1;
}

Swift::Int __swiftcall SatelliteSMSServiceSession.maxRecipients(forPhoneNumber:simID:)(Swift::String forPhoneNumber, Swift::String simID)
{
  uint64_t v2 = self;
  NSString v3 = sub_10460();
  NSString v4 = sub_10460();
  signed int v5 = [v2 IMMMSMaxRecipientsForPhoneNumber:v3 simID:v4];

  return v5;
}

void SatelliteSMSServiceSession.sendMessage(from:forChat:chat:style:)(void *a1, void *a2, NSObject *a3, uint64_t a4, int a5)
{
  uint64_t v6 = v5;
  v85 = a2;
  os_log_t v86 = a3;
  uint64_t v10 = sub_10410();
  os_log_t v11 = *(os_log_t *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  __chkstk_darwin(v15);
  v17 = (char *)&v79 - v16;
  id v18 = [v6 subscriptionContextForChat:a4];
  if (!v18)
  {
    if (qword_19448 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_3E2C(v10, (uint64_t)qword_19450);
    ((void (*)(char *, uint64_t, uint64_t))v11[2].isa)(v17, v32, v10);
    swift_bridgeObjectRetain_n();
    a4 = a1;
    v33 = sub_10400();
    a1 = (void *)sub_10540();
    if (os_log_type_enabled(v33, (os_log_type_t)a1))
    {
      uint64_t v83 = v10;
      os_log_t v84 = v11;
      v82 = v6;
      os_log_t v11 = (os_log_t)swift_slowAlloc();
      id v88 = (id)swift_slowAlloc();
      LODWORD(v11->isa) = 136446466;
      id v34 = [(id)a4 guid];
      if (!v34)
      {
LABEL_55:

        swift_bridgeObjectRelease();
        __break(1u);
        goto LABEL_56;
      }
      id v35 = v34;
      uint64_t v36 = sub_10470();
      unint64_t v38 = v37;

      uint64_t v87 = sub_A29C(v36, v38, (uint64_t *)&v88);
      sub_10590();

      swift_bridgeObjectRelease();
      WORD2(v11[1].isa) = 2080;
      os_log_t v39 = v86;
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_A29C((uint64_t)v85, (unint64_t)v39, (uint64_t *)&v88);
      sub_10590();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v33, (os_log_type_t)a1, "Can't find context to send message %{public}s to %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v84[1].isa)(v17, v83);
      uint64_t v6 = v82;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      Class isa = (void (*)(char *, uint64_t))v11[1].isa;
      ++v11;
      isa(v17, v10);
    }
    id v44 = [(id)a4 guid];
    if (v44)
    {
      v45 = v44;
      [v6 didReceiveError:31 forMessageID:v44 forceError:1];
      goto LABEL_30;
    }
    goto LABEL_52;
  }
  id v19 = v18;
  LODWORD(v80) = a5;
  os_log_t v84 = v11;
  id v20 = [(id)a4 participantHandles];
  if (!v20)
  {
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v21 = v20;
  uint64_t v22 = sub_104F0();

  os_log_t v11 = *(os_log_t *)(v22 + 16);
  swift_bridgeObjectRelease();
  if (v11 != (os_log_t)((char *)&dword_0 + 1))
  {
    if (qword_19448 == -1) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
  id v23 = [(id)a4 participantHandles];
  if (!v23)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  id v24 = v23;
  NSString v25 = (void *)sub_104F0();

  if (!v25[2])
  {
    __break(1u);
LABEL_50:
    swift_once();
LABEL_15:
    sub_3E2C(v10, (uint64_t)qword_19450);
    os_log_t v40 = v86;
    swift_bridgeObjectRetain_n();
    os_log_t v11 = (os_log_t)sub_10400();
    os_log_type_t v41 = sub_10540();
    a4 = v41;
    if (os_log_type_enabled(v11, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      id v88 = (id)swift_slowAlloc();
      *(_DWORD *)v42 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_A29C((uint64_t)v85, (unint64_t)v40, (uint64_t *)&v88);
      sub_10590();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v11, (os_log_type_t)a4, "Rejecting attempt to send to group %s", v42, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v46 = [a1 guid];
    if (v46)
    {
      v45 = v46;
      [v6 didReceiveError:5 forMessageID:v46 forceError:1];

      goto LABEL_30;
    }
    goto LABEL_54;
  }
  id v81 = v19;
  os_log_t v11 = (os_log_t)v25[4];
  unint64_t v26 = v25[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  NSString v27 = sub_10460();
  int IsPhoneNumber = IMStringIsPhoneNumber();

  if (!IsPhoneNumber)
  {
    if (qword_19448 != -1) {
      swift_once();
    }
    sub_3E2C(v10, (uint64_t)qword_19450);
    os_log_t v47 = v86;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    os_log_type_t v48 = sub_10400();
    os_log_type_t v49 = sub_10540();
    if (os_log_type_enabled(v48, v49))
    {
      a4 = swift_slowAlloc();
      id v88 = (id)swift_slowAlloc();
      *(_DWORD *)a4 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_A29C((uint64_t)v11, v26, (uint64_t *)&v88);
      os_log_t v11 = (os_log_t)&v88;
      sub_10590();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(a4 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v87 = sub_A29C((uint64_t)v85, (unint64_t)v47, (uint64_t *)&v88);
      sub_10590();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v48, v49, "Rejecting attempt to send to non-phone number %s in chat %s", (uint8_t *)a4, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v50 = v81;
    id v51 = [a1 guid];
    if (!v51) {
      goto LABEL_57;
    }
    v45 = v51;
    [v6 didReceiveError:23 forMessageID:v51 forceError:1];

LABEL_30:
    return;
  }
  uint64_t v83 = v10;
  SatelliteSMSServiceSession.shouldNotifyDowngrade(for:)((void *)a4);
  v82 = v6;
  if (!*(void *)&v6[OBJC_IVAR___SatelliteSMSServiceSession_state])
  {
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    __break(1u);
    swift_errorRelease();

    swift_errorRelease();
    __break(1u);
    goto LABEL_58;
  }
  char v30 = v29;
  v31 = *(uint64_t (**)(void *, os_log_t, unint64_t, void))(**(void **)&v6[OBJC_IVAR___SatelliteSMSServiceSession_state
                                                                                              + 16]
                                                                             + 104);
  swift_retain();
  v52 = (void *)v31(a1, v11, v26, v30 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  id v53 = v52;
  [v53 setContext:v81];
  id v88 = 0;
  a4 = (uint64_t)[v53 makeOutgoingMessageWithError:&v88];

  uint64_t v54 = v83;
  if (!a4)
  {
    id v65 = v88;
    sub_10340();

    swift_willThrow();
    if (qword_19448 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_3E2C(v54, (uint64_t)qword_19450);
    os_log_t v67 = v84;
    ((void (*)(char *, uint64_t, uint64_t))v84[2].isa)(v14, v66, v54);
    id v68 = a1;
    swift_errorRetain();
    a4 = (uint64_t)v68;
    swift_errorRetain();
    os_log_t v11 = (os_log_t)sub_10400();
    os_log_type_t v69 = sub_10540();
    if (os_log_type_enabled(v11, v69))
    {
      os_log_t v86 = v11;
      uint64_t v70 = swift_slowAlloc();
      v80 = (void *)swift_slowAlloc();
      v85 = (void *)swift_slowAlloc();
      id v88 = v85;
      *(_DWORD *)uint64_t v70 = 136446466;
      id v71 = [(id)a4 guid];
      if (!v71)
      {
LABEL_60:
        swift_errorRelease();

        swift_errorRelease();
        __break(1u);
        goto LABEL_61;
      }
      v72 = v71;
      uint64_t v73 = sub_10470();
      unint64_t v75 = v74;

      uint64_t v87 = sub_A29C(v73, v75, (uint64_t *)&v88);
      sub_10590();

      swift_bridgeObjectRelease();
      *(_WORD *)(v70 + 12) = 2112;
      swift_errorRetain();
      uint64_t v76 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v87 = v76;
      sub_10590();
      void *v80 = v76;
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v11 = v86;
      _os_log_impl(&dword_0, v86, v69, "Failed to pack outgoing message into the CT format for %{public}s: %@", (uint8_t *)v70, 0x16u);
      sub_A258(&qword_19060);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v84[1].isa)(v14, v83);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      ((void (*)(char *, uint64_t))v67[1].isa)(v14, v54);
    }
    id v77 = [(id)a4 guid];
    id v78 = v81;
    if (v77)
    {
      v45 = v77;
      [v82 didReceiveError:4 forMessageID:v77 forceError:1];

      swift_errorRelease();
      goto LABEL_30;
    }
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  id v55 = v88;
  swift_unknownObjectRetain();
  [v82 markItemForOnGridRelay:a1];
  uint64_t v57 = (uint64_t)v85;
  os_log_t v56 = v86;
  char v58 = (char)v80;
  if ((v30 & 1) == 0) {
    goto LABEL_40;
  }
  v59 = [v81 phoneNumber];
  if (!v59) {
    goto LABEL_40;
  }
  os_log_t v11 = v59;
  id v60 = (id)IMChatCanonicalIDSIDsForAddress();

  if (!v60) {
    goto LABEL_59;
  }
  os_log_t v11 = (os_log_t)[v60 _stripFZIDPrefix];

  if (!v11)
  {
LABEL_40:
    objc_msgSend(a1, "setFlags:", (unint64_t)objc_msgSend(a1, "flags") | 0x80000000000);
    sub_6AB8((id)a4, v57, (uint64_t)v56, v58, a1);

    swift_unknownObjectRelease_n();
    return;
  }
  id v61 = [self sharedInstance];
  if (v61)
  {
    v62 = v61;
    id v63 = [v61 anySessionForServiceName:IMServiceNameiMessageLite];

    if (v63)
    {
      NSString v64 = sub_10460();
      [v63 sentDowngradeRequestToHandleID:v64 fromID:v11];
    }
    char v58 = (char)v80;
    goto LABEL_40;
  }
LABEL_61:

  __break(1u);
}

void SatelliteSMSServiceSession.shouldNotifyDowngrade(for:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_103F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  NSString v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10410();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v42 - v13;
  sub_D67C();
  if (fabs(v15) > 2.22044605e-16)
  {
    BOOL v16 = sub_9F50();
    id v17 = [a1 lastSentDowngradeRequestSinceLoadSessionIndex];
    id v18 = (void *)(v2 + OBJC_IVAR___SatelliteSMSServiceSession_state);
    if (*v18)
    {
      if (!v16 && v17 == (id)v18[3])
      {
        if (qword_19448 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_3E2C(v8, (uint64_t)qword_19450);
        (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v32, v8);
        id v18 = a1;
        v33 = sub_10400();
        os_log_type_t v34 = sub_10520();
        if (!os_log_type_enabled(v33, v34))
        {

          (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
          return;
        }
        uint64_t v47 = v9;
        uint64_t v35 = swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        uint64_t v49 = v46;
        *(_DWORD *)uint64_t v35 = 136315650;
        id v36 = [v18 chatIdentifier];
        if (v36)
        {
          unint64_t v37 = v36;
          uint64_t v38 = sub_10470();
          unint64_t v40 = v39;

          uint64_t v48 = sub_A29C(v38, v40, &v49);
          sub_10590();

          swift_bridgeObjectRelease();
          *(_WORD *)(v35 + 12) = 1024;
          LODWORD(v48) = 0;
          sub_10590();
          *(_WORD *)(v35 + 18) = 1024;
          LODWORD(v48) = 0;
          sub_10590();
          _os_log_impl(&dword_0, v33, v34, "Chat %s already sent downgrade request (expired: %{BOOL}d, sessionChanged: %{BOOL}d)", (uint8_t *)v35, 0x18u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v47 + 8))(v12, v8);
          return;
        }
        goto LABEL_26;
      }
      if (qword_19448 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_3E2C(v8, (uint64_t)qword_19450);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v19, v8);
      uint64_t v12 = a1;
      id v20 = sub_10400();
      int v21 = sub_10550();
      if (os_log_type_enabled(v20, (os_log_type_t)v21))
      {
        int v44 = v21;
        os_log_t v45 = v20;
        uint64_t v46 = v5;
        uint64_t v47 = v9;
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v49 = v43;
        *(_DWORD *)uint64_t v22 = 136315138;
        id v23 = [v12 chatIdentifier];
        if (!v23)
        {
LABEL_25:

          __break(1u);
LABEL_26:

          __break(1u);
          return;
        }
        id v24 = v23;
        v42 = v22 + 4;
        uint64_t v25 = sub_10470();
        unint64_t v27 = v26;

        uint64_t v48 = sub_A29C(v25, v27, &v49);
        sub_10590();

        swift_bridgeObjectRelease();
        os_log_t v28 = v45;
        _os_log_impl(&dword_0, v45, (os_log_type_t)v44, "Chat %s downgrade request expired, re-sending", v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v8);
        uint64_t v5 = v46;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      }
      sub_103D0();
      Class isa = sub_10390().super.isa;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      [v12 setLastSentDowngradeRequestSinceLoadDate:isa];

      if (*v18)
      {
        [v12 setLastSentDowngradeRequestSinceLoadSessionIndex:v18[3]];
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_25;
  }
  if (qword_19448 != -1) {
    swift_once();
  }
  sub_3E2C(v8, (uint64_t)qword_19450);
  char v29 = sub_10400();
  os_log_type_t v30 = sub_10550();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_0, v29, v30, "Downgrade disabled by server bag", v31, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_6A98()
{
  if (*(void *)(v0 + OBJC_IVAR___SatelliteSMSServiceSession_state)) {
    return swift_retain();
  }
  __break(1u);
  return result;
}

void sub_6AB8(id a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v11 = sub_10410();
  uint64_t v35 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v14 = *(void **)&v5[OBJC_IVAR___SatelliteSMSServiceSession_state];
  if (!v14)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a5;
  *(void *)(v15 + 24) = v5;
  *(void *)(v15 + 32) = a2;
  *(void *)(v15 + 40) = a3;
  *(unsigned char *)(v15 + 48) = a4;
  aBlock[4] = (uint64_t)sub_D450;
  aBlock[5] = v15;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_7598;
  aBlock[3] = (uint64_t)&unk_14910;
  BOOL v16 = _Block_copy(aBlock);
  id v17 = v14;
  id v18 = a5;
  uint64_t v19 = v5;
  swift_bridgeObjectRetain();
  swift_release();
  unsigned __int8 v20 = [v17 sendMessage:a1 completion:v16];
  _Block_release(v16);

  if (v20) {
    return;
  }
  os_log_type_t v34 = v19;
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_3E2C(v11, (uint64_t)qword_19450);
  uint64_t v22 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v13, v21, v11);
  a1 = v18;
  id v23 = sub_10400();
  os_log_type_t v24 = sub_10530();
  uint64_t v25 = &SatelliteSMSServiceSession__prots;
  if (os_log_type_enabled(v23, v24))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    aBlock[0] = v33;
    *(_DWORD *)unint64_t v26 = 136446210;
    id v27 = objc_msgSend(a1, "guid", v33);
    if (!v27)
    {
LABEL_14:

      __break(1u);
      return;
    }
    os_log_t v28 = v27;
    uint64_t v29 = sub_10470();
    unint64_t v31 = v30;

    uint64_t v36 = sub_A29C(v29, v31, aBlock);
    sub_10590();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v23, v24, "Failed to send message %{public}s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v11);
    uint64_t v25 = &SatelliteSMSServiceSession__prots;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v11);
  }
  id v32 = [a1 (SEL)v25[390].count];
  if (!v32)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  [v34 didReceiveError:4 forMessageID:v32 forceError:1];

  sub_ACEC(a1);
}

id sub_6F6C()
{
  id result = *(id *)(v0 + OBJC_IVAR___SatelliteSMSServiceSession_state);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

void sub_6F84(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, int a7)
{
  int v45 = a7;
  uint64_t v43 = a5;
  uint64_t v44 = a6;
  uint64_t v49 = a4;
  uint64_t v10 = sub_10410();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_3E2C(v10, (uint64_t)qword_19450);
  swift_bridgeObjectRetain_n();
  id v15 = a1;
  uint64_t v50 = v14;
  BOOL v16 = sub_10400();
  os_log_type_t v17 = sub_10520();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v47 = v11;
  uint64_t v48 = v10;
  uint64_t v46 = v13;
  if (v18)
  {
    v42 = a3;
    uint64_t v19 = swift_slowAlloc();
    unsigned __int8 v20 = (void *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    id v51 = v15;
    uint64_t v52 = v41;
    *(_DWORD *)uint64_t v19 = 138412546;
    id v21 = v15;
    sub_10590();
    *unsigned __int8 v20 = v15;

    *(_WORD *)(v19 + 12) = 2080;
    if (a2)
    {
      uint64_t v22 = sub_10450();
      unint64_t v24 = v23;
    }
    else
    {
      uint64_t v22 = 0;
      unint64_t v24 = 0xE000000000000000;
    }
    uint64_t v11 = v47;
    id v51 = (id)sub_A29C(v22, v24, &v52);
    sub_10590();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v16, v17, "Received ack: %@ metadata %s", (uint8_t *)v19, 0x16u);
    sub_A258(&qword_19060);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v10 = v48;
    uint64_t v13 = v46;
    a3 = v42;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unsigned int v25 = [v15 success];
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v50, v10);
  id v26 = a3;
  id v27 = sub_10400();
  os_log_type_t v28 = sub_10520();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 67240706;
    LODWORD(v50) = v25;
    LODWORD(v51) = v25;
    sub_10590();
    *(_WORD *)(v29 + 8) = 2050;
    id v51 = [v26 messageID];
    sub_10590();
    *(_WORD *)(v29 + 18) = 2082;
    id v30 = [v26 guid];
    if (!v30)
    {

      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    unint64_t v31 = v30;
    uint64_t v32 = sub_10470();
    unint64_t v34 = v33;

    id v51 = (id)sub_A29C(v32, v34, &v52);
    sub_10590();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v27, v28, "Message sent notification: success %{BOOL,public}d messageID %{public}lld guid %{public}s", (uint8_t *)v29, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
    uint64_t v35 = v49;
    if (!v50)
    {
LABEL_12:
      id v36 = [v26 guid];
      if (v36)
      {
        id v37 = v36;
        [v35 didReceiveError:4 forMessageID:v36 forceError:1];
LABEL_17:

        sub_ACEC(v26);
        return;
      }
      goto LABEL_19;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v35 = v49;
    if (!v25) {
      goto LABEL_12;
    }
  }
  NSString v38 = sub_10460();
  [v35 didSendMessage:v26 forChat:v38 style:v45];

  id v39 = [v26 guid];
  if (v39)
  {
    unint64_t v40 = v39;
    id v37 = [v35 account];
    [v35 notifyDidSendMessageID:v40 account:v37 shouldNotify:1];

    goto LABEL_17;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_7598(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  if (a3) {
    sub_10440();
  }
  swift_retain();
  id v5 = a2;
  v4();
  swift_release();

  return swift_bridgeObjectRelease();
}

unint64_t sub_7638(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A258(&qword_191B8);
  uint64_t v2 = sub_10690();
  NSString v3 = (void *)v2;
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
    sub_D500(v6, (uint64_t)&v15, &qword_191C0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_A938(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_D2E4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_7770(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSString v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A258(&qword_19190);
  uint64_t v2 = sub_10690();
  NSString v3 = (void *)v2;
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
    sub_D500(v6, (uint64_t)v15, &qword_19198);
    unint64_t result = sub_A8F4((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_D2E4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_78B4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_A258(&qword_19190);
    uint64_t v2 = (void *)sub_10690();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_D49C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_D2E4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_D2E4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_D2E4(v36, v37);
    sub_D2E4(v37, &v33);
    uint64_t result = sub_105C0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_D2E4(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_D4F8();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_7C7C()
{
  if (*(void *)(v0 + OBJC_IVAR___SatelliteSMSServiceSession_state)) {
    return *(void *)(v0 + OBJC_IVAR___SatelliteSMSServiceSession_state + 8);
  }
  __break(1u);
  return result;
}

void sub_7C9C(void *a1)
{
  uint64_t v3 = sub_10410();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR___SatelliteSMSServiceSession_state];
  if (!*(void *)&v1[OBJC_IVAR___SatelliteSMSServiceSession_state])
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v8 = *((void *)v7 + 3);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9)
  {
    __break(1u);
    goto LABEL_10;
  }
  *((void *)v7 + 3) = v10;
  if (qword_19448 != -1) {
LABEL_10:
  }
    swift_once();
  uint64_t v11 = sub_3E2C(v3, (uint64_t)qword_19450);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  unint64_t v12 = a1;
  int64_t v13 = v1;
  unint64_t v14 = sub_10400();
  os_log_type_t v15 = sub_10520();
  if (!os_log_type_enabled(v14, v15))
  {

    unint64_t v14 = v12;
    goto LABEL_8;
  }
  uint64_t v20 = v6;
  uint64_t v21 = v4;
  uint64_t v22 = v3;
  char v23 = v13;
  uint64_t v16 = swift_slowAlloc();
  long long v17 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v16 = 138543618;
  unint64_t v24 = v12;
  uint64_t v18 = v12;
  sub_10590();
  void *v17 = v12;

  *(_WORD *)(v16 + 12) = 2048;
  if (*(void *)v7)
  {
    unint64_t v24 = *((void *)v7 + 3);
    sub_10590();

    _os_log_impl(&dword_0, v14, v15, "Satellite SMS state changed to %{public}@ (session index: %ld)", (uint8_t *)v16, 0x16u);
    sub_A258(&qword_19060);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v4 = v21;
    uint64_t v3 = v22;
    uint64_t v6 = v20;
LABEL_8:

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return;
  }
LABEL_12:

  __break(1u);
}

void sub_7FD0(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10410();
  sub_3E2C(v4, (uint64_t)qword_19450);
  uint64_t v5 = sub_10400();
  os_log_type_t v6 = sub_10520();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134349056;
    sub_10590();
    _os_log_impl(&dword_0, v5, v6, "Connected services changed to %{public}ld", v7, 0xCu);
    swift_slowDealloc();
  }

  if (*(void *)(v2 + OBJC_IVAR___SatelliteSMSServiceSession_state)) {
    *(void *)(v2 + OBJC_IVAR___SatelliteSMSServiceSession_state + 8) = a1;
  }
  else {
    __break(1u);
  }
}

id sub_8158(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = self;
  id v6 = [v5 sharedInstance];
  NSString v7 = sub_10460();
  uint64_t v8 = &SatelliteSMSServiceSession__prots;
  id v9 = [v2 account];
  id v10 = [v6 existingChatWithIdentifier:v7 account:v9];

  if (!v10)
  {
    sub_A258(&qword_19170);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_11350;
    sub_10470();
    sub_105E0();
    type metadata accessor for FZChatMemberStatus(0);
    *(void *)(inited + 96) = v12;
    *(_DWORD *)(inited + 72) = 2;
    sub_10470();
    sub_105E0();
    *(void *)(inited + 168) = &type metadata for String;
    *(void *)(inited + 144) = a1;
    *(void *)(inited + 152) = a2;
    sub_10470();
    swift_bridgeObjectRetain();
    sub_105E0();
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = a1;
    *(void *)(inited + 224) = a2;
    sub_10470();
    swift_bridgeObjectRetain();
    sub_105E0();
    NSString v13 = sub_10460();
    id v14 = (id)IMCountryCodeForNumber();

    if (v14)
    {
      uint64_t v15 = sub_10470();
      unint64_t v17 = v16;

      uint64_t v18 = (uint64_t *)(inited + 288);
      *(void *)(inited + 312) = &type metadata for String;
      if (v17)
      {
        uint64_t *v18 = v15;
        uint64_t v8 = &SatelliteSMSServiceSession__prots;
LABEL_8:
        *(void *)(inited + 296) = v17;
        unint64_t v19 = sub_7770(inited);
        sub_A258(&qword_19178);
        uint64_t v20 = swift_initStackObject();
        *(_OWORD *)(v20 + 16) = xmmword_11360;
        *(void *)(v20 + 32) = v19;
        NSString v21 = sub_10460();
        sub_8500(v20);
        swift_setDeallocating();
        sub_A258(&qword_19180);
        swift_arrayDestroy();
        Class isa = sub_104E0().super.isa;
        swift_bridgeObjectRelease();
        [v2 didJoinChat:v21 style:45 displayName:0 groupID:0 originalGroupID:0 handleInfo:isa category:0 spamExtensionName:0];

        id v23 = [v5 sharedInstance];
        NSString v24 = sub_10460();
        id v25 = [v2 (SEL)v8[429].count];
        id v10 = [v23 existingChatWithIdentifier:v24 account:v25];

        return v10;
      }
      uint64_t v8 = &SatelliteSMSServiceSession__prots;
    }
    else
    {
      uint64_t v18 = (uint64_t *)(inited + 288);
      *(void *)(inited + 312) = &type metadata for String;
    }
    uint64_t *v18 = 0;
    unint64_t v17 = 0xE000000000000000;
    goto LABEL_8;
  }
  return v10;
}

void *sub_8500(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    id v9 = &_swiftEmptyArrayStorage;
    sub_AB5C(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = &_swiftEmptyArrayStorage;
    do
    {
      swift_bridgeObjectRetain();
      sub_A258(&qword_19180);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_AB5C(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_AB5C(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v2[2] = v6 + 1;
      sub_D2E4(&v8, &v2[4 * v6 + 4]);
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_8630(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  unint64_t v6 = v4;
  uint64_t v10 = sub_10410();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v16 = (char *)v122 - v15;
  self;
  uint64_t v17 = swift_dynamicCastObjCClass();
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    os_log_t v130 = a3;
    uint64_t v19 = qword_19440;
    swift_unknownObjectRetain();
    if (v19 != -1) {
      swift_once();
    }
    sub_3E2C(v10, (uint64_t)qword_197A0);
    swift_unknownObjectRetain();
    uint64_t v20 = sub_10400();
    os_log_type_t v21 = sub_10550();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v5 = 134217984;
      id v132 = [v18 pendingSatSmsTotalCount];
      sub_10590();
      swift_unknownObjectRelease();
      _os_log_impl(&dword_0, v20, v21, "Received summary info with %ld total pending messages", v5, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    id v30 = [self sharedInstance];
    if (v30)
    {
      uint64_t v31 = v30;
      id v32 = [v18 pendingSatSmsTotalCount];
      id v33 = [v6 service];
      NSString v34 = [v33 internalName];

      if (!v34)
      {
        sub_10470();
        NSString v34 = sub_10460();
        swift_bridgeObjectRelease();
      }
      [v31 updateBadgeForPendingSatelliteMessagesIfNeeded:v32 onService:v34];
      swift_unknownObjectRelease();

      goto LABEL_16;
    }
    __break(1u);
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  self;
  if (!swift_dynamicCastObjCClass())
  {
    os_log_t v130 = a3;
    if (qword_19448 == -1) {
      goto LABEL_19;
    }
    goto LABEL_72;
  }
  uint64_t v129 = a4;
  id v22 = objc_allocWithZone((Class)SatelliteSMSIncomingMessage);
  id v132 = 0;
  swift_unknownObjectRetain();
  id v23 = [v22 initWithIncomingCTMessage:a1 error:&v132];
  if (!v23)
  {
    id v40 = v132;
    sub_10340();

    swift_willThrow();
    swift_unknownObjectRelease();
    if (qword_19448 != -1) {
      swift_once();
    }
    sub_3E2C(v10, (uint64_t)qword_19450);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v41 = sub_10400();
    os_log_type_t v42 = sub_10540();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 138412290;
      swift_errorRetain();
      int v45 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v132 = v45;
      sub_10590();
      void *v44 = v45;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v41, v42, "Error parsing incoming CT message: %@", v43, 0xCu);
      sub_A258(&qword_19060);
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
    goto LABEL_17;
  }
  NSString v24 = v23;
  v128 = v6;
  id v25 = v132;
  swift_unknownObjectRelease();
  uint64_t v26 = v24;
  id v27 = [v26 sourcePhoneNumber];
  uint64_t v28 = sub_10470();
  unint64_t v5 = v29;

  LOBYTE(v27) = sub_B188(v28, (unint64_t)v5);
  swift_bridgeObjectRelease();
  if (v27)
  {

LABEL_10:
    goto LABEL_17;
  }
  os_log_t v130 = a3;
  if (!*(Class *)((char *)&v128->isa + OBJC_IVAR___SatelliteSMSServiceSession_state))
  {
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  uint64_t v46 = *(uint64_t (**))(**(void **)((char *)&v128[2].isa
                                                           + OBJC_IVAR___SatelliteSMSServiceSession_state)
                                             + 96);
  swift_retain();
  unint64_t v47 = v46(v26);
  swift_release();
  if (!(v47 >> 62))
  {
    uint64_t v48 = *(id **)((char *)&dword_10 + (v47 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    a3 = v130;
    if (v48) {
      goto LABEL_31;
    }
LABEL_74:
    swift_bridgeObjectRelease_n();
    if (qword_19448 == -1)
    {
LABEL_75:
      sub_3E2C(v10, (uint64_t)qword_19450);
      v108 = v26;
      v109 = sub_10400();
      os_log_type_t v110 = sub_10540();
      int v111 = v110;
      if (os_log_type_enabled(v109, v110))
      {
        uint64_t v112 = swift_slowAlloc();
        LODWORD(v130) = v111;
        uint64_t v113 = v112;
        id v132 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v113 = 136315394;
        id v114 = [v108 uniqueID];
        uint64_t v115 = sub_10470();
        unint64_t v117 = v116;

        uint64_t ObjectType = sub_A29C(v115, v117, (uint64_t *)&v132);
        sub_10590();

        swift_bridgeObjectRelease();
        *(_WORD *)(v113 + 12) = 2080;
        id v118 = [v108 sourcePhoneNumber];
        uint64_t v119 = sub_10470();
        unint64_t v121 = v120;

        uint64_t ObjectType = sub_A29C(v119, v121, (uint64_t *)&v132);
        sub_10590();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v109, (os_log_type_t)v130, "Got no message items for message %s from %s!", (uint8_t *)v113, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_17;
    }
LABEL_81:
    swift_once();
    goto LABEL_75;
  }
  swift_bridgeObjectRetain();
  uint64_t v48 = (id *)sub_10680();
  a3 = v130;
  if (!v48) {
    goto LABEL_74;
  }
LABEL_31:
  v125 = v48;
  v126 = (void *)(v47 & 0xC000000000000001);
  if ((v47 & 0xC000000000000001) == 0)
  {
    if (*(void *)((char *)&dword_10 + (v47 & 0xFFFFFFFFFFFFFF8)))
    {
      id v49 = *(id *)(v47 + 32);
      goto LABEL_34;
    }
    __break(1u);
    goto LABEL_81;
  }
  id v49 = (id)sub_10600();
LABEL_34:
  v124 = v49;
  unint64_t v127 = v47;
  swift_bridgeObjectRelease();
  id v50 = [v26 sourcePhoneNumber];
  uint64_t v51 = sub_10470();
  unint64_t v5 = v52;

  id v53 = sub_8158(v51, (uint64_t)v5);
  swift_bridgeObjectRelease();
  if (!v53)
  {
    if (qword_19448 != -1) {
      swift_once();
    }
    uint64_t v74 = sub_3E2C(v10, (uint64_t)qword_19450);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v74, v10);
    swift_unknownObjectRetain_n();
    unint64_t v75 = v26;
    unint64_t v76 = v127;
    swift_bridgeObjectRetain();
    id v77 = sub_10400();
    int v78 = sub_10540();
    v128 = v77;
    if (os_log_type_enabled(v77, (os_log_type_t)v78))
    {
      int v123 = v78;
      uint64_t v79 = swift_slowAlloc();
      v80 = (void *)swift_slowAlloc();
      id v132 = v80;
      *(_DWORD *)uint64_t v79 = 136446722;
      v125 = v75;
      if (v126)
      {
        swift_bridgeObjectRetain();
        id v81 = (id)sub_10600();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v81 = *(id *)(v76 + 32);
      }
      id v95 = [v81 guid];

      v122[1] = v80;
      if (v95)
      {
        uint64_t v96 = sub_10470();
        unint64_t v98 = v97;
      }
      else
      {
        uint64_t v96 = 7104878;
        unint64_t v98 = 0xE300000000000000;
      }
      uint64_t ObjectType = sub_A29C(v96, v98, (uint64_t *)&v132);
      sub_10590();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v79 + 12) = 2080;
      uint64_t ObjectType = a1;
      swift_unknownObjectRetain();
      sub_A258(&qword_190D0);
      uint64_t v99 = sub_104B0();
      uint64_t ObjectType = sub_A29C(v99, v100, (uint64_t *)&v132);
      sub_10590();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v79 + 22) = 2080;
      v101 = v125;
      id v102 = [v125 sourcePhoneNumber];
      uint64_t v103 = sub_10470();
      unint64_t v105 = v104;

      uint64_t ObjectType = sub_A29C(v103, v105, (uint64_t *)&v132);
      sub_10590();

      swift_bridgeObjectRelease();
      v106 = v128;
      _os_log_impl(&dword_0, v128, (os_log_type_t)v123, "Couldn't locate a chat to store %{public}s / %s from %s!", (uint8_t *)v79, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      a3 = v130;
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }
    goto LABEL_17;
  }
  objc_msgSend(v53, "updateIsDownloadingPendingSatelliteMessages:", (uint64_t)-[NSObject pendingCount](v26, "pendingCount") > 0);
  objc_msgSend(v53, "updatePendingIncomingSatelliteMessageCount:", -[NSObject pendingCount](v26, "pendingCount"));
  id v54 = [self sharedInstance];
  if (!v54) {
    goto LABEL_85;
  }
  id v55 = v54;
  id v56 = [v26 pendingTotalCount];

  id v57 = [v128 service];
  NSString v58 = [v57 internalName];

  if (!v58)
  {
    sub_10470();
    NSString v58 = sub_10460();
    swift_bridgeObjectRelease();
  }
  [v55 updateBadgeForPendingSatelliteMessagesIfNeeded:v56 onService:v58];

  sub_B524(v124, (uint64_t)v53);
  if ((v59 & 1) == 0)
  {
    uint64_t v82 = 4;
    unint64_t v83 = v127;
    os_log_t v84 = v128;
    while (1)
    {
      uint64_t v10 = v82 - 4;
      id v85 = v126 ? (id)sub_10600() : *(id *)(v83 + 8 * v82);
      os_log_t v86 = v85;
      uint64_t v87 = (id *)(v82 - 3);
      if (__OFADD__(v10, 1)) {
        break;
      }
      uint64_t v88 = (uint64_t)[v85 flags];
      if ((~v88 & 0xC0000000000) != 0) {
        uint64_t v89 = v88 | 0xC0000000000;
      }
      else {
        uint64_t v89 = v88;
      }
      [v86 setFlags:v89];
      unint64_t v5 = (uint8_t *)[v84 tapbackInterpreter];
      id v90 = [(uint8_t *)v5 interpretMessageItem:v86 inChat:v53];

      id v91 = [v53 chatIdentifier];
      if (!v91) {
        goto LABEL_83;
      }
      v92 = v91;
      [v84 didReceiveMessage:v90 forChat:v91 style:45 fromIDSID:0];

      ++v82;
      unint64_t v83 = v127;
      if (v87 == v125)
      {
        swift_bridgeObjectRelease();
        NSString v93 = sub_10460();
        id v94 = kSMSSatelliteNeedsRelay;
        IMSetDomainBoolForKey();

        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_72:
    swift_once();
LABEL_19:
    sub_3E2C(v10, (uint64_t)qword_19450);
    swift_unknownObjectRetain_n();
    uint64_t v35 = sub_10400();
    os_log_type_t v36 = sub_10530();
    if (os_log_type_enabled(v35, v36))
    {
      id v37 = (uint8_t *)swift_slowAlloc();
      id v132 = (id)swift_slowAlloc();
      *(_DWORD *)id v37 = 136315138;
      uint64_t ObjectType = swift_getObjectType();
      sub_A258(&qword_190C8);
      uint64_t v38 = sub_104B0();
      uint64_t ObjectType = sub_A29C(v38, v39, (uint64_t *)&v132);
      sub_10590();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v35, v36, "Unknown CT message type: %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
LABEL_16:
    a3 = v130;
LABEL_17:
    ((void (*)(void))a3)();
    return;
  }
  swift_bridgeObjectRelease();
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_3E2C(v10, (uint64_t)qword_19450);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v60, v10);
  unint64_t v5 = v124;
  id v61 = sub_10400();
  int v62 = sub_10550();
  if (!os_log_type_enabled(v61, (os_log_type_t)v62))
  {

LABEL_70:
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    goto LABEL_17;
  }
  LODWORD(v127) = v62;
  os_log_t v130 = v61;
  v128 = v26;
  uint64_t v63 = swift_slowAlloc();
  v126 = (void *)swift_slowAlloc();
  id v132 = v126;
  *(_DWORD *)uint64_t v63 = 136315394;
  id v64 = [(uint8_t *)v5 guid];
  if (v64)
  {
    id v65 = v64;
    v124 = (void *)(v63 + 4);
    uint64_t v66 = sub_10470();
    unint64_t v68 = v67;

    uint64_t ObjectType = sub_A29C(v66, v68, (uint64_t *)&v132);
    v125 = &v132;
    sub_10590();

    swift_bridgeObjectRelease();
    *(_WORD *)(v63 + 12) = 2080;
    id v69 = [(uint8_t *)v5 fallbackHash];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = sub_10470();
      unint64_t v73 = v72;
    }
    else
    {
      uint64_t v71 = 7104878;
      unint64_t v73 = 0xE300000000000000;
    }
    uint64_t ObjectType = sub_A29C(v71, v73, (uint64_t *)&v132);
    sub_10590();

    swift_bridgeObjectRelease();
    os_log_t v107 = v130;
    _os_log_impl(&dword_0, v130, (os_log_type_t)v127, "Has duplicate of item %s with dedupe ID %s", (uint8_t *)v63, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_70;
  }
LABEL_86:

  __break(1u);
}

void SatelliteSMSServiceSession.networkMonitorDidUpdate(_:)(void *a1)
{
  uint64_t v3 = sub_103F0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.receiver = v1;
  v10.super_class = (Class)SatelliteSMSServiceSession;
  objc_msgSendSuper2(&v10, "networkMonitorDidUpdate:", a1);
  if (([a1 immediatelyReachable] & 1) == 0)
  {
    id v7 = [self messagesAppDomain];
    if (v7)
    {
      long long v8 = v7;
      sub_103E0();
      Class isa = sub_10390().super.isa;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      [v8 setObject:isa forKey:IMMinimumTimeBeforeShowingOTGBannerKey];
    }
  }
}

void SatelliteSMSServiceSession.createSuperFormatString(_:transferGUIDs:)(uint64_t a1)
{
  uint64_t v2 = sub_102E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D460(0, (unint64_t *)&qword_190D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  unint64_t v6 = (void *)sub_10570();
  Class isa = sub_104E0().super.isa;
  id v8 = objc_msgSend(v6, "__im_attributedStringByAppendingFileTransfers:", isa);

  id v9 = objc_msgSend(v8, "__im_attributedStringByAssigningMessagePartNumbers");
  sub_10300();
}

Swift::String_optional __swiftcall SatelliteSMSServiceSession.destinationPhoneNumber(forIncoming:)(SatelliteSMSIncomingMessage *forIncoming)
{
  int64_t v1 = [(SatelliteSMSIncomingMessage *)forIncoming context];
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_5;
  }
  id v3 = [(CTXPCServiceSubscriptionContext *)v1 phoneNumber];

  if (!v3)
  {
    uint64_t v2 = 0;
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = (void *)sub_10470();
  uint64_t v5 = v4;

LABEL_6:
  uint64_t v6 = (uint64_t)v2;
  id v7 = v5;
  result.value._object = v7;
  result.value._countAndFlagsBits = v6;
  return result;
}

BOOL sub_9F50()
{
  int64_t v1 = v0;
  sub_A258(&qword_191A0);
  ((void (*)(void))__chkstk_darwin)();
  id v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_103F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - v9;
  id v11 = [v1 lastSentDowngradeRequestSinceLoadDate];
  if (v11)
  {
    uint64_t v12 = v11;
    sub_103C0();

    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v13(v3, v8, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
    {
      v13(v10, v3, v4);
      sub_103D0();
      sub_10370();
      double v15 = v14;
      unint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
      v16(v8, v4);
      sub_D67C();
      double v18 = v17;
      v16(v10, v4);
      return v18 < v15;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  }
  sub_D3A8((uint64_t)v3);
  return 1;
}

uint64_t sub_A1A8()
{
  id v1 = [v0 accountID];
  uint64_t v2 = sub_10470();

  return v2;
}

void *sub_A200(void *result)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_A240(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_A250()
{
  return swift_release();
}

uint64_t sub_A258(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A29C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_A370(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_D49C((uint64_t)v12, *a3);
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
      sub_D49C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_D564((uint64_t)v12);
  return v7;
}

uint64_t sub_A370(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_105A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_A52C(a5, a6);
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
  uint64_t v8 = sub_10610();
  if (!v8)
  {
    sub_10670();
    __break(1u);
LABEL_17:
    uint64_t result = sub_106A0();
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

uint64_t sub_A52C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_A5C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_A7A4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_A7A4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_A5C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_A73C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_105F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10670();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_104D0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_106A0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10670();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_A73C(uint64_t a1, uint64_t a2)
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
  sub_A258(&qword_191C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_A7A4(char a1, int64_t a2, char a3, char *a4)
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
    sub_A258(&qword_191C8);
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
  uint64_t result = sub_106A0();
  __break(1u);
  return result;
}

unint64_t sub_A8F4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_105C0(*(void *)(v2 + 40));

  return sub_A9B0(a1, v4);
}

unint64_t sub_A938(uint64_t a1, uint64_t a2)
{
  sub_10700();
  sub_104C0();
  Swift::Int v4 = sub_10720();

  return sub_AA78(a1, a2, v4);
}

unint64_t sub_A9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_D2F8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_105D0();
      sub_D354((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_AA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_106B0() & 1) == 0)
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
      while (!v14 && (sub_106B0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_AB5C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_AB7C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_AB7C(char a1, int64_t a2, char a3, char *a4)
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
    sub_A258(&qword_19188);
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
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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
  uint64_t result = sub_106A0();
  __break(1u);
  return result;
}

void sub_ACEC(void *a1)
{
  uint64_t v2 = sub_A258(&qword_191A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v38[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_103F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = &v38[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  int64_t v11 = &v38[-v10];
  id v12 = [a1 handle];
  IMStringIsPhoneNumber();

  v13.super.super.Class isa = sub_10730().super.super.isa;
  sub_103E0();
  id v14 = [a1 time];
  if (!v14) {
    goto LABEL_11;
  }
  double v15 = v14;
  sub_103C0();

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v4, v9, v5);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  sub_10370();
  double v17 = v16;
  double v18 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
  v6 += 8;
  v18(v11, v5);
  v18(v4, v5);
  if ((~*(void *)&v17 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v17 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v17 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_12;
  }
  sub_A258(&qword_191A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11370;
  *(void *)(inited + 32) = sub_10470();
  *(void *)(inited + 40) = v20;
  Class isa = sub_10730().super.super.isa;
  uint64_t v22 = sub_D460(0, (unint64_t *)&qword_191B0);
  *(void *)(inited + 72) = v22;
  *(void *)(inited + 48) = isa;
  *(void *)(inited + 80) = sub_10470();
  *(void *)(inited + 88) = v23;
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 96) = 0;
  *(void *)(inited + 128) = sub_10470();
  *(void *)(inited + 136) = v24;
  v25.super.super.Class isa = sub_10500().super.super.isa;
  *(void *)(inited + 168) = v22;
  *(NSNumber *)(inited + 144) = v25;
  *(void *)(inited + 176) = sub_10470();
  *(void *)(inited + 184) = v26;
  v27.super.super.Class isa = sub_10500().super.super.isa;
  *(void *)(inited + 216) = v22;
  *(NSNumber *)(inited + 192) = v27;
  *(void *)(inited + 224) = sub_10470();
  *(void *)(inited + 232) = v28;
  *(void *)(inited + 264) = &type metadata for Int;
  *(void *)(inited + 240) = 0;
  *(void *)(inited + 272) = sub_10470();
  *(void *)(inited + 280) = v29;
  v30.super.super.Class isa = sub_10510().super.super.isa;
  *(void *)(inited + 312) = v22;
  *(NSNumber *)(inited + 288) = v30;
  *(void *)(inited + 320) = sub_10470();
  *(void *)(inited + 328) = v31;
  *(void *)(inited + 360) = v22;
  *(NSNumber *)(inited + 336) = v13;
  id v32 = v13.super.super.isa;
  unint64_t v33 = sub_7638(inited);
  id v34 = [self sharedInstance];
  if (v34)
  {
    uint64_t v35 = v34;
    id v36 = IMMetricsCollectorEventSMSSentMessageSingleComponent;
    sub_78B4(v33);
    swift_bridgeObjectRelease();
    Class v37 = sub_10430().super.isa;
    swift_bridgeObjectRelease();
    [v35 trackEvent:v36 withDictionary:v37];

    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_B188(uint64_t a1, unint64_t a2)
{
  NSString v4 = sub_10460();
  NSString v5 = sub_10460();
  uint64_t v6 = (void *)IMPhoneNumberRefCopyForPhoneNumber();

  if (!v6)
  {
    if (qword_19448 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10410();
    sub_3E2C(v13, (uint64_t)qword_19450);
    id v14 = sub_10400();
    os_log_type_t v15 = sub_10530();
    if (os_log_type_enabled(v14, v15))
    {
      double v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v16 = 0;
      _os_log_impl(&dword_0, v14, v15, "Couldn't create phone number.", v16, 2u);
      swift_slowDealloc();
    }
LABEL_16:

    return 0;
  }
  if (!CMFItemCreateWithPhoneNumber())
  {
    if (qword_19448 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_10410();
    sub_3E2C(v17, (uint64_t)qword_19450);
    id v14 = sub_10400();
    os_log_type_t v18 = sub_10530();
    if (!os_log_type_enabled(v14, v18))
    {

      return 0;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_0, v14, v18, "Couldn't create phone item.", v19, 2u);
    swift_slowDealloc();

    goto LABEL_16;
  }
  swift_unknownObjectRetain();
  int IsItemBlocked = CMFBlockListIsItemBlocked();
  swift_unknownObjectRelease_n();

  if (!IsItemBlocked) {
    return 0;
  }
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_10410();
  sub_3E2C(v8, (uint64_t)qword_19450);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_10400();
  os_log_type_t v10 = sub_10520();
  if (os_log_type_enabled(v9, v10))
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)int64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_A29C(a1, a2, &v21);
    sub_10590();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v9, v10, "Message is blocked for sender handle: %s", v11, 0xCu);
    uint64_t v12 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return 1;
  }
  return v12;
}

void sub_B524(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10410();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v56 - v9;
  id v11 = [a1 fallbackHash];
  if (v11)
  {
    uint64_t v12 = v11;
    id v65 = a1;
    uint64_t v13 = sub_10470();
    unint64_t v15 = v14;
    id v16 = [self sharedInstance];
    id v17 = [v16 sortedMessageItemsWithFallbackHash:v12 inChat:a2 limit:1];

    sub_D460(0, &qword_19168);
    unint64_t v18 = sub_104F0();

    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_10680();
      swift_bridgeObjectRelease();
      if (v55)
      {
LABEL_4:
        if ((v18 & 0xC000000000000001) != 0)
        {
          id v19 = (id)sub_10600();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
LABEL_41:
            swift_once();
LABEL_8:
            uint64_t v20 = sub_3E2C(v4, (uint64_t)qword_19450);
            id v61 = *(void (**)(char *))(v5 + 16);
            uint64_t v62 = v20;
            v61(v10);
            id v21 = v12;
            swift_bridgeObjectRetain();
            uint64_t v22 = sub_10400();
            os_log_type_t v23 = sub_10520();
            BOOL v24 = os_log_type_enabled(v22, v23);
            uint64_t v64 = v5;
            if (v24)
            {
              uint64_t v58 = v5 + 16;
              uint64_t v60 = v4;
              uint64_t v25 = swift_slowAlloc();
              uint64_t v57 = swift_slowAlloc();
              uint64_t v67 = v57;
              *(_DWORD *)uint64_t v25 = 136315394;
              id v26 = [v21 guid];
              NSNumber v27 = v21;
              if (!v26)
              {

                swift_bridgeObjectRelease();
                __break(1u);
LABEL_43:

                __break(1u);
                return;
              }
              uint64_t v28 = v26;
              uint64_t v29 = sub_10470();
              unint64_t v31 = v30;

              uint64_t v66 = sub_A29C(v29, v31, &v67);
              sub_10590();
              id v21 = v27;

              swift_bridgeObjectRelease();
              *(_WORD *)(v25 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v66 = sub_A29C(v59, v15, &v67);
              sub_10590();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_0, v22, v23, "Found potential duplicate %s with dedupe ID %s", (uint8_t *)v25, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              id v32 = *(void (**)(char *, uint64_t))(v64 + 8);
              uint64_t v4 = v60;
              v32(v10, v60);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              id v32 = *(void (**)(char *, uint64_t))(v5 + 8);
              v32(v10, v4);
            }
            id v33 = v65;
            id v34 = [v65 plainBody];
            if (!v34)
            {
              id v35 = [v33 body];
              id v36 = v35;
              if (!v35)
              {
                uint64_t v37 = 0;
LABEL_16:
                id v39 = [v21 plainBody];
                if (!v39)
                {
                  id v40 = [v21 body];
                  if (!v40)
                  {
                    if (v36) {
                      goto LABEL_30;
                    }
                    goto LABEL_35;
                  }
                  uint64_t v41 = v40;
                  id v39 = [v40 string];
                }
                uint64_t v42 = sub_10470();
                uint64_t v44 = v43;

                if (v36)
                {
                  if (v44)
                  {
                    if (v37 == v42 && v36 == v44)
                    {

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      return;
                    }
                    char v45 = sub_106B0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if (v45) {
                      goto LABEL_35;
                    }
                    goto LABEL_31;
                  }
LABEL_30:
                  swift_bridgeObjectRelease();
LABEL_31:
                  uint64_t v46 = v63;
                  ((void (*)(char *, uint64_t, uint64_t))v61)(v63, v62, v4);
                  uint64_t v8 = (char *)v21;
                  unint64_t v47 = sub_10400();
                  os_log_type_t v48 = sub_10520();
                  if (!os_log_type_enabled(v47, v48))
                  {

                    v32(v46, v4);
                    return;
                  }
                  uint64_t v60 = v4;
                  id v49 = (uint8_t *)swift_slowAlloc();
                  uint64_t v67 = swift_slowAlloc();
                  *(_DWORD *)id v49 = 136315138;
                  id v50 = [v8 guid];
                  if (v50)
                  {
                    uint64_t v51 = v50;
                    uint64_t v52 = sub_10470();
                    unint64_t v54 = v53;

                    uint64_t v66 = sub_A29C(v52, v54, &v67);
                    sub_10590();

                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_0, v47, v48, "Potential duplicate %s has different body, not deduplicating", v49, 0xCu);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();

                    v32(v63, v60);
                    return;
                  }
                  goto LABEL_43;
                }
                if (v44) {
                  goto LABEL_30;
                }
LABEL_35:

                return;
              }
              id v34 = [v35 string];
            }
            uint64_t v37 = sub_10470();
            id v36 = v38;

            goto LABEL_16;
          }
          id v19 = *(id *)(v18 + 32);
        }
        uint64_t v12 = v19;
        uint64_t v59 = v13;
        uint64_t v63 = v8;
        swift_bridgeObjectRelease();
        if (qword_19448 == -1) {
          goto LABEL_8;
        }
        goto LABEL_41;
      }
    }
    else if (*(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8)))
    {
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_BCD0(id a1, char *a2, NSObject *a3)
{
  uint64_t v6 = sub_10410();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v118 - v11;
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    uint64_t v15 = qword_19440;
    swift_unknownObjectRetain();
    if (v15 != -1) {
      swift_once();
    }
    sub_3E2C(v6, (uint64_t)qword_197A0);
    swift_unknownObjectRetain();
    id v16 = sub_10400();
    os_log_type_t v17 = sub_10550();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v18 = 134217984;
      id v126 = [v14 pendingSatSmsTotalCount];
      sub_10590();
      swift_unknownObjectRelease();
      _os_log_impl(&dword_0, v16, v17, "Received summary info with %ld total pending messages", v18, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    id v27 = [self sharedInstance];
    if (v27)
    {
      uint64_t v28 = v27;
      id v29 = [v14 pendingSatSmsTotalCount];
      id v30 = [a2 service];
      NSString v31 = [v30 internalName];

      if (!v31)
      {
        sub_10470();
        NSString v31 = sub_10460();
        swift_bridgeObjectRelease();
      }
      [v28 updateBadgeForPendingSatelliteMessagesIfNeeded:v29 onService:v31];
      swift_unknownObjectRelease();

      goto LABEL_15;
    }
    _Block_release(a3);
    __break(1u);
LABEL_80:
    _Block_release(a3);
    __break(1u);
    goto LABEL_81;
  }
  self;
  if (!swift_dynamicCastObjCClass())
  {
    if (qword_19448 == -1) {
      goto LABEL_17;
    }
    goto LABEL_69;
  }
  id v19 = objc_allocWithZone((Class)SatelliteSMSIncomingMessage);
  id v126 = 0;
  swift_unknownObjectRetain();
  id v20 = [v19 initWithIncomingCTMessage:a1 error:&v126];
  if (!v20)
  {
    id v37 = v126;
    sub_10340();

    swift_willThrow();
    swift_unknownObjectRelease();
    if (qword_19448 != -1) {
      swift_once();
    }
    sub_3E2C(v6, (uint64_t)qword_19450);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v38 = sub_10400();
    os_log_type_t v39 = sub_10540();
    if (os_log_type_enabled(v38, v39))
    {
      id v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      *(_DWORD *)id v40 = 138412290;
      swift_errorRetain();
      uint64_t v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v126 = v42;
      sub_10590();
      void *v41 = v42;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v38, v39, "Error parsing incoming CT message: %@", v40, 0xCu);
      sub_A258(&qword_19060);
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
    goto LABEL_15;
  }
  id v21 = v20;
  v124 = a3;
  id v22 = v126;
  swift_unknownObjectRelease();
  a3 = v21;
  id v23 = [a3 sourcePhoneNumber];
  uint64_t v24 = sub_10470();
  unint64_t v26 = v25;

  LOBYTE(v23) = sub_B188(v24, v26);
  swift_bridgeObjectRelease();
  if (v23)
  {

    a3 = v124;
LABEL_15:
    ((void (*))a3[2].isa)(a3);
    return;
  }
  int v123 = a3;
  uint64_t v120 = v7;
  if (!*(void *)&a2[OBJC_IVAR___SatelliteSMSServiceSession_state])
  {
LABEL_81:
    _Block_release(v124);
    __break(1u);
LABEL_82:
    _Block_release(a3);
    __break(1u);
    goto LABEL_83;
  }
  uint64_t v43 = *(uint64_t (**))(**(void **)&a2[OBJC_IVAR___SatelliteSMSServiceSession_state + 16] + 96);
  swift_retain();
  unint64_t v44 = v43(v123);
  swift_release();
  if (!(v44 >> 62))
  {
    uint64_t v45 = *(void *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    a3 = v124;
    if (v45) {
      goto LABEL_29;
    }
LABEL_71:
    swift_bridgeObjectRelease_n();
    if (qword_19448 == -1)
    {
LABEL_72:
      sub_3E2C(v6, (uint64_t)qword_19450);
      v106 = v123;
      os_log_t v107 = sub_10400();
      os_log_type_t v108 = sub_10540();
      if (os_log_type_enabled(v107, v108))
      {
        uint64_t v109 = swift_slowAlloc();
        v124 = swift_slowAlloc();
        id v126 = v124;
        *(_DWORD *)uint64_t v109 = 136315394;
        id v110 = [v106 uniqueID];
        uint64_t v111 = sub_10470();
        unint64_t v113 = v112;

        uint64_t ObjectType = sub_A29C(v111, v113, (uint64_t *)&v126);
        sub_10590();

        swift_bridgeObjectRelease();
        *(_WORD *)(v109 + 12) = 2080;
        id v114 = [v106 sourcePhoneNumber];
        uint64_t v115 = sub_10470();
        unint64_t v117 = v116;

        uint64_t ObjectType = sub_A29C(v115, v117, (uint64_t *)&v126);
        sub_10590();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v107, v108, "Got no message items for message %s from %s!", (uint8_t *)v109, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_15;
    }
LABEL_78:
    swift_once();
    goto LABEL_72;
  }
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_10680();
  a3 = v124;
  if (!v45) {
    goto LABEL_71;
  }
LABEL_29:
  unint64_t v121 = (void *)v45;
  os_log_t v122 = (os_log_t)(v44 & 0xC000000000000001);
  if ((v44 & 0xC000000000000001) == 0)
  {
    if (*(void *)((char *)&dword_10 + (v44 & 0xFFFFFFFFFFFFFF8)))
    {
      id v46 = *(id *)(v44 + 32);
      goto LABEL_32;
    }
    __break(1u);
    goto LABEL_78;
  }
  id v46 = (id)sub_10600();
LABEL_32:
  uint64_t v119 = v46;
  swift_bridgeObjectRelease();
  id v47 = [v123 sourcePhoneNumber];
  uint64_t v48 = sub_10470();
  uint64_t v50 = v49;

  id v51 = sub_8158(v48, v50);
  swift_bridgeObjectRelease();
  if (!v51)
  {
    uint64_t v75 = v120;
    if (qword_19448 != -1) {
      swift_once();
    }
    uint64_t v76 = sub_3E2C(v6, (uint64_t)qword_19450);
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v12, v76, v6);
    swift_unknownObjectRetain_n();
    id v77 = v123;
    swift_bridgeObjectRetain();
    int v78 = sub_10400();
    int v79 = sub_10540();
    v124 = v78;
    if (os_log_type_enabled(v78, (os_log_type_t)v79))
    {
      uint64_t v80 = swift_slowAlloc();
      id v81 = (void *)swift_slowAlloc();
      id v126 = v81;
      *(_DWORD *)uint64_t v80 = 136446722;
      unint64_t v121 = v81;
      if (v122)
      {
        swift_bridgeObjectRetain();
        id v82 = (id)sub_10600();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v82 = *(id *)(v44 + 32);
      }
      LODWORD(v123) = v79;
      id v94 = [v82 guid];

      if (v94)
      {
        uint64_t v95 = sub_10470();
        unint64_t v97 = v96;
      }
      else
      {
        uint64_t v95 = 7104878;
        unint64_t v97 = 0xE300000000000000;
      }
      uint64_t ObjectType = sub_A29C(v95, v97, (uint64_t *)&v126);
      sub_10590();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v80 + 12) = 2080;
      uint64_t ObjectType = (uint64_t)a1;
      swift_unknownObjectRetain();
      sub_A258(&qword_190D0);
      uint64_t v98 = sub_104B0();
      uint64_t ObjectType = sub_A29C(v98, v99, (uint64_t *)&v126);
      sub_10590();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v80 + 22) = 2080;
      id v100 = [v77 sourcePhoneNumber];
      uint64_t v101 = sub_10470();
      unint64_t v103 = v102;

      uint64_t ObjectType = sub_A29C(v101, v103, (uint64_t *)&v126);
      sub_10590();

      swift_bridgeObjectRelease();
      unint64_t v104 = v124;
      _os_log_impl(&dword_0, v124, (os_log_type_t)v123, "Couldn't locate a chat to store %{public}s / %s from %s!", (uint8_t *)v80, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v120 + 8))(v12, v6);
    }
    else
    {

      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v75 + 8))(v12, v6);
    }
    goto LABEL_15;
  }
  uint64_t v52 = v123;
  objc_msgSend(v51, "updateIsDownloadingPendingSatelliteMessages:", (uint64_t)-[NSObject pendingCount](v123, "pendingCount") > 0);
  objc_msgSend(v51, "updatePendingIncomingSatelliteMessageCount:", -[NSObject pendingCount](v52, "pendingCount"));
  id v53 = [self sharedInstance];
  if (!v53) {
    goto LABEL_82;
  }
  unint64_t v54 = v53;
  a1 = [v52 pendingTotalCount];

  id v55 = [a2 service];
  NSString v56 = [v55 internalName];

  if (!v56)
  {
    sub_10470();
    NSString v56 = sub_10460();
    swift_bridgeObjectRelease();
  }
  [v54 updateBadgeForPendingSatelliteMessagesIfNeeded:a1 onService:v56];

  sub_B524(v119, (uint64_t)v51);
  if ((v57 & 1) == 0)
  {
    uint64_t v83 = 4;
    while (1)
    {
      uint64_t v6 = v83 - 4;
      id v84 = v122 ? (id)sub_10600() : *(id *)(v44 + 8 * v83);
      id v85 = v84;
      uint64_t v86 = v83 - 3;
      if (__OFADD__(v6, 1)) {
        break;
      }
      uint64_t v87 = (uint64_t)[v84 flags];
      if ((~v87 & 0xC0000000000) != 0) {
        uint64_t v88 = v87 | 0xC0000000000;
      }
      else {
        uint64_t v88 = v87;
      }
      [v85 setFlags:v88];
      id v89 = [a2 tapbackInterpreter];
      id v90 = [v89 interpretMessageItem:v85 inChat:v51];

      id v91 = [v51 chatIdentifier];
      if (!v91) {
        goto LABEL_80;
      }
      a1 = v91;
      [a2 didReceiveMessage:v90 forChat:v91 style:45 fromIDSID:0];

      ++v83;
      if ((void *)v86 == v121)
      {
        swift_bridgeObjectRelease();
        NSString v92 = sub_10460();
        id v93 = kSMSSatelliteNeedsRelay;
        IMSetDomainBoolForKey();

        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_69:
    swift_once();
LABEL_17:
    sub_3E2C(v6, (uint64_t)qword_19450);
    swift_unknownObjectRetain_n();
    id v32 = sub_10400();
    os_log_type_t v33 = sub_10530();
    if (os_log_type_enabled(v32, v33))
    {
      id v34 = (uint8_t *)swift_slowAlloc();
      id v126 = (id)swift_slowAlloc();
      *(_DWORD *)id v34 = 136315138;
      uint64_t ObjectType = swift_getObjectType();
      sub_A258(&qword_190C8);
      uint64_t v35 = sub_104B0();
      uint64_t ObjectType = sub_A29C(v35, v36, (uint64_t *)&v126);
      sub_10590();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v32, v33, "Unknown CT message type: %s", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
  if (qword_19448 != -1) {
    swift_once();
  }
  uint64_t v58 = sub_3E2C(v6, (uint64_t)qword_19450);
  uint64_t v59 = v120;
  (*(void (**)(char *, uint64_t, uint64_t))(v120 + 16))(v10, v58, v6);
  a1 = v119;
  uint64_t v60 = sub_10400();
  int v61 = sub_10550();
  BOOL v62 = os_log_type_enabled(v60, (os_log_type_t)v61);
  uint64_t v63 = v123;
  if (!v62)
  {

    (*(void (**)(char *, uint64_t))(v59 + 8))(v10, v6);
    a3 = v124;
    goto LABEL_15;
  }
  LODWORD(v121) = v61;
  os_log_t v122 = v60;
  uint64_t v64 = swift_slowAlloc();
  uint64_t v119 = (void *)swift_slowAlloc();
  id v126 = v119;
  *(_DWORD *)uint64_t v64 = 136315394;
  id v65 = [a1 guid];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = sub_10470();
    unint64_t v69 = v68;

    uint64_t ObjectType = sub_A29C(v67, v69, (uint64_t *)&v126);
    v118[1] = &v126;
    sub_10590();

    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2080;
    id v70 = [a1 fallbackHash];
    a3 = v124;
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = sub_10470();
      unint64_t v74 = v73;
    }
    else
    {
      uint64_t v72 = 7104878;
      unint64_t v74 = 0xE300000000000000;
    }
    uint64_t ObjectType = sub_A29C(v72, v74, (uint64_t *)&v126);
    sub_10590();

    swift_bridgeObjectRelease();
    os_log_t v105 = v122;
    _os_log_impl(&dword_0, v122, (os_log_type_t)v121, "Has duplicate of item %s with dedupe ID %s", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v120 + 8))(v10, v6);
    goto LABEL_15;
  }
LABEL_83:
  _Block_release(v124);

  __break(1u);
}

id _sSo26SatelliteSMSServiceSessionC0A3SMSE16allowCompressionSbvg_0()
{
  id v0 = [self sharedFeatureFlags];
  unsigned int v1 = [v0 isParakeetCompressionEnabled];

  if (!v1) {
    return 0;
  }
  id result = [self sharedInstance];
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v4 = [result isInternalInstall];

    if (v4)
    {
      NSString v5 = sub_10460();
      NSString v6 = sub_10460();
      int v7 = IMGetDomainBoolForKey();

      return (id)(v7 ^ 1u);
    }
    else
    {
      return &dword_0 + 1;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SatelliteSMSServiceSession(uint64_t a1)
{
  return sub_D460(a1, &qword_19468);
}

void type metadata accessor for FZChatMemberStatus(uint64_t a1)
{
}

_OWORD *sub_D2E4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_D2F8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_D354(uint64_t a1)
{
  return a1;
}

uint64_t sub_D3A8(uint64_t a1)
{
  uint64_t v2 = sub_A258(&qword_191A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_D408()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

void sub_D450(void *a1, uint64_t a2)
{
  sub_6F84(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(unsigned __int8 *)(v2 + 48));
}

uint64_t sub_D460(uint64_t a1, unint64_t *a2)
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

uint64_t sub_D49C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_D4F8()
{
  return swift_release();
}

uint64_t sub_D500(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A258(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_D564(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_D5B4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for IMChatStyle(uint64_t a1)
{
}

void sub_D62C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_D67C()
{
  id v0 = [self sharedInstance];
  if (v0)
  {
    uint64_t v1 = v0;
    unsigned int v2 = [v0 isInternalInstall];

    if (v2)
    {
      NSString v3 = sub_10460();
      NSString v4 = sub_10460();
      id v5 = (id)IMGetDomainValueForKey();

      if (v5)
      {
        sub_105B0();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v10 = 0u;
        long long v11 = 0u;
      }
      sub_D8D0((uint64_t)&v10, (uint64_t)v12);
      if (v13)
      {
        sub_D998();
        if (swift_dynamicCast()) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_D938((uint64_t)v12);
      }
    }
    id v6 = [self sharedInstanceForBagType:1];
    NSString v7 = sub_10460();
    id v8 = [v6 objectForKey:v7];

    if (v8)
    {
      sub_105B0();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    sub_D8D0((uint64_t)&v10, (uint64_t)v12);
    if (v13)
    {
      sub_D998();
      if (swift_dynamicCast())
      {
LABEL_15:
        [v9 doubleValue];
      }
    }
    else
    {
      sub_D938((uint64_t)v12);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_D8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A258(&qword_19360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_D938(uint64_t a1)
{
  uint64_t v2 = sub_A258(&qword_19360);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_D998()
{
  unint64_t result = qword_191B0;
  if (!qword_191B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_191B0);
  }
  return result;
}

uint64_t sub_DB08()
{
  uint64_t v2 = 0;
  NSString v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_19470;
  uint64_t v5 = qword_19470;
  if (!qword_19470)
  {
    long long v6 = *(_OWORD *)off_14988;
    long long v7 = *(_OWORD *)&off_14998;
    v3[3] = _sl_dlopen();
    qword_19470 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_DC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_DC30(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_19470 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_DCC0()
{
  uint64_t v0 = sub_DB08();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_DD1C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_19478;
  uint64_t v7 = qword_19478;
  if (!qword_19478)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_DE00;
    v3[3] = &unk_149D8;
    v3[4] = &v4;
    sub_DE00((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_DDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_DE00(uint64_t a1)
{
  sub_DCC0();
  Class result = objc_getClass("CTStewieSatSmsMessageIncoming");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_19478 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_E054();
    return (Class)sub_DE58(v3);
  }
  return result;
}

id sub_DE58()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_19480;
  uint64_t v7 = qword_19480;
  if (!qword_19480)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_DF3C;
    v3[3] = &unk_149D8;
    v3[4] = &v4;
    sub_DF3C((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_DF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

OS_os_log *sub_DF3C(uint64_t a1)
{
  sub_DCC0();
  Class result = objc_getClass("CTStewieSatSmsMessageOutgoing");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_19480 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v10 = sub_E07C((uint64_t)result, v3, v4, v5, v6, v7, v8, v9, v12);
    return +[SatelliteSMSUtilities logger];
  }
  return result;
}

void sub_DFE8(id a1)
{
  qword_19488 = (uint64_t)os_log_create("com.apple.Messages", "SatelliteSMS");

  _objc_release_x1();
}

uint64_t sub_E054()
{
  uint64_t v0 = abort_report_np();
  return sub_E07C(v0);
}

SatelliteSMSIncomingMessage *sub_E07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v9 = (SatelliteSMSIncomingMessage *)abort_report_np();
  return [(SatelliteSMSIncomingMessage *)v9 initWithTimestamp:v11 pendingTotalCount:v12 pendingCount:v13 sourcePhoneNumber:v14 codecID:v15 textPayload:v16 uniqueID:a9];
}

void sub_E4F4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Attempt to initialize SatelliteSMSIncomingMessage when CTStewieSatSmsMessageIncoming class is not present", v1, 2u);
}

void sub_E538(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Attempt to initialize SatelliteSMSIncomingMessage with something other than CTStewieSatSmsMessageIncoming", v1, 2u);
}

void Date.init(nanosecondsSince1970:)(void *a1)
{
  [a1 doubleValue];
  sub_103A0();
}

id Date.nanosecondsSince1970.getter()
{
  sub_103B0();
  double v1 = v0 * 1000000000.0;
  id v2 = objc_allocWithZone((Class)NSNumber);

  return [v2 initWithDouble:v1];
}

uint64_t SatelliteSMSMessageTransformer.delegate.getter()
{
  return swift_unknownObjectUnownedLoadStrong();
}

uint64_t SatelliteSMSMessageTransformer.__allocating_init(delegate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = a2;
  swift_unknownObjectUnownedInit();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t SatelliteSMSMessageTransformer.init(delegate:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a2;
  swift_unknownObjectUnownedInit();
  swift_unknownObjectRelease();
  return v2;
}

void SatelliteSMSMessageTransformer.IncomingMessageParseError.hash(into:)()
{
}

Swift::Int SatelliteSMSMessageTransformer.IncomingMessageParseError.hashValue.getter()
{
  return sub_10720();
}

Swift::Int sub_EA84()
{
  return sub_10720();
}

void *SatelliteSMSMessageTransformer.messageItems(forIncoming:)(void *a1)
{
  sub_A258(&qword_191A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11410;
  *(void *)(inited + 32) = sub_10470();
  *(void *)(inited + 40) = v4;
  id v5 = [a1 textPayload];
  uint64_t v6 = sub_10360();
  uint64_t v8 = v7;

  *(void *)(inited + 72) = &type metadata for Data;
  *(void *)(inited + 48) = v6;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 80) = sub_10470();
  *(void *)(inited + 88) = v9;
  id v10 = [a1 codecID];
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 96) = v10;
  unint64_t v11 = sub_7638(inited);
  sub_78B4(v11);
  swift_bridgeObjectRelease();
  id v12 = [a1 sourcePhoneNumber];
  sub_10470();

  Class isa = sub_10430().super.isa;
  swift_bridgeObjectRelease();
  NSString v14 = sub_10460();
  swift_bridgeObjectRelease();
  id v15 = [self defusedSatelliteSMSMessageWithDictionary:isa senderID:v14];

  id v16 = [v15 texts];
  if (!v16) {
    goto LABEL_5;
  }
  os_log_type_t v17 = v16;
  uint64_t v18 = sub_104F0();

  if (!*(void *)(v18 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_ED50();
    swift_allocError();
    swift_willThrow();

    return a1;
  }
  uint64_t v21 = 0;
  swift_retain();
  id v19 = a1;
  a1 = sub_FC24(v18, v1, v19, (double *)&v21);
  swift_bridgeObjectRelease();

  swift_release();
  return a1;
}

unint64_t sub_ED50()
{
  unint64_t result = qword_19368;
  if (!qword_19368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19368);
  }
  return result;
}

double sub_EDA4@<D0>(uint64_t a1@<X1>, void *a2@<X2>, double *a3@<X3>, void *a4@<X8>)
{
  id v74 = a2;
  id v77 = a3;
  unint64_t v73 = a4;
  uint64_t v5 = sub_A258(&qword_191A0);
  __chkstk_darwin(v5 - 8);
  id v65 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_103F0();
  uint64_t v72 = *(char **)(v76 - 8);
  uint64_t v7 = __chkstk_darwin(v76);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v75 = (char *)&v62 - v10;
  uint64_t v11 = sub_10320();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_102E0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  id v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v62 - v17;
  swift_bridgeObjectRetain();
  sub_10310();
  sub_102F0();
  uint64_t v66 = a1 + 16;
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v69 = a1;
  uint64_t v19 = *(void *)(a1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(char *, void *, uint64_t, uint64_t))(v19 + 8))(v18, &_swiftEmptyArrayStorage, ObjectType, v19);
  swift_unknownObjectRelease();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v63 = v12;
  id v70 = v21;
  uint64_t v71 = v13 + 8;
  v21(v18, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v16, v12);
  id v22 = v74;
  id v23 = [v74 timestamp];
  [v23 doubleValue];
  sub_103A0();

  uint64_t v24 = v75;
  sub_10380();
  unint64_t v25 = v72;
  uint64_t v26 = v76;
  uint64_t v67 = (void (*)(char *, uint64_t))*((void *)v72 + 1);
  unint64_t v68 = v72 + 8;
  v67(v9, v76);
  id v27 = [v22 sourcePhoneNumber];
  uint64_t v28 = sub_10470();
  uint64_t v64 = v29;

  id v30 = v65;
  (*((void (**)(char *, char *, uint64_t))v25 + 2))(v65, v24, v26);
  uint64_t v31 = (uint64_t)v30;
  uint64_t v32 = v63;
  (*((void (**)(char *, void, uint64_t, uint64_t))v25 + 7))(v30, 0, 1, v26);
  sub_10238();
  os_log_type_t v33 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v72 = v18;
  v33(v16, v18, v32);
  id v34 = (void *)sub_10570();
  id v35 = [self stringGUID];
  if (v35)
  {
    unint64_t v36 = v35;
    uint64_t v37 = sub_10470();
    uint64_t v39 = v38;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
  }
  id v40 = objc_allocWithZone((Class)IMMessageItem);
  id v41 = sub_F958(v28, v64, v31, v34, 0, 0, 1, 0, v37, v39, 0, 0);
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v42 = v69;
  uint64_t v43 = *(void *)(v69 + 24);
  uint64_t v44 = swift_getObjectType();
  id v45 = v74;
  (*(void (**)(id, uint64_t, uint64_t))(v43 + 16))(v74, v44, v43);
  uint64_t v47 = v46;
  swift_unknownObjectRelease();
  if (v47)
  {
    id v48 = v41;
    NSString v49 = sub_10460();
    swift_bridgeObjectRelease();
    [v48 setDestinationCallerID:v49];
  }
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v50 = *(void *)(v42 + 24);
  uint64_t v51 = swift_getObjectType();
  uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v50 + 24);
  id v53 = v41;
  v52(v51, v50);
  swift_unknownObjectRelease();
  NSString v54 = sub_10460();
  swift_bridgeObjectRelease();
  [v53 setAccountID:v54];

  id v55 = [v45 timestamp];
  id v56 = [v55 longLongValue];

  [v53 setReplaceID:v56];
  id v57 = v53;
  id v58 = [v45 timestamp];
  id v59 = [v58 integerValue];

  [v57 setSortID:v59];
  NSString v60 = [v45 uniqueID];
  if (!v60)
  {
    sub_10470();
    NSString v60 = sub_10460();
    swift_bridgeObjectRelease();
  }
  [v57 setFallbackHash:v60];

  v67(v75, v76);
  v70(v72, v32);
  double result = *v77 + 2.22044605e-16;
  *id v77 = result;
  *unint64_t v73 = v57;
  return result;
}

BOOL static SatelliteSMSMessageTransformer.OutgoingMessageParseError.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void SatelliteSMSMessageTransformer.OutgoingMessageParseError.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int SatelliteSMSMessageTransformer.OutgoingMessageParseError.hashValue.getter(char a1)
{
  return sub_10720();
}

BOOL sub_F508(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_F520()
{
  Swift::UInt v1 = *v0;
  sub_10700();
  sub_10710(v1);
  return sub_10720();
}

void sub_F568()
{
  sub_10710(*v0);
}

Swift::Int sub_F594()
{
  Swift::UInt v1 = *v0;
  sub_10700();
  sub_10710(v1);
  return sub_10720();
}

unint64_t SatelliteSMSMessageTransformer.outgoingMessage(forItem:toPhoneNumber:notifyDowngrade:)(unint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = sub_104A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [(id)a1 body];
  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v13 = v12;
  v36[1] = a2;
  int v37 = a4;
  id v14 = [v12 string];

  uint64_t v15 = sub_10470();
  a1 = v16;

  uint64_t v17 = HIBYTE(a1) & 0xF;
  if ((a1 & 0x2000000000000000) == 0) {
    uint64_t v17 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (!v17)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_FD38();
    swift_allocError();
    char v22 = 0;
    goto LABEL_9;
  }
  sub_10490();
  uint64_t v18 = sub_10480();
  unint64_t v20 = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v20 >> 60 == 15)
  {
    sub_FD38();
    swift_allocError();
    char v22 = 1;
LABEL_9:
    *uint64_t v21 = v22;
    swift_willThrow();
    return a1;
  }
  swift_unknownObjectUnownedLoadStrong();
  uint64_t v24 = *(void *)(v4 + 24);
  uint64_t ObjectType = swift_getObjectType();
  char v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 32))(ObjectType, v24);
  swift_unknownObjectRelease();
  if ((v26 & 1) == 0
    || (id v27 = [self sharedCompressor],
        uint64_t v28 = sub_10580(),
        unint64_t v30 = v29,
        uint64_t v32 = v31,
        v27,
        v30 >> 60 == 15))
  {
    sub_FD8C(v18, v20);
    uint64_t v32 = 0;
    uint64_t v28 = v18;
    unint64_t v30 = v20;
  }
  id v33 = objc_allocWithZone((Class)SatelliteSMSOutgoingMessage);
  swift_bridgeObjectRetain();
  NSString v34 = sub_10460();
  swift_bridgeObjectRelease();
  Class isa = sub_10350().super.isa;
  a1 = (unint64_t)[v33 initWithDestinationPhoneNumber:v34 codecID:v32 textPayload:isa notifyDowngrade:v37 & 1];
  sub_FDE4(v28, v30);

  sub_FE3C(v18, v20);
  return a1;
}

uint64_t SatelliteSMSMessageTransformer.deinit()
{
  sub_FE50(v0 + 16);
  return v0;
}

uint64_t SatelliteSMSMessageTransformer.__deallocating_deinit()
{
  sub_FE50(v0 + 16);

  return _swift_deallocClassInstance(v0, 32, 7);
}

id sub_F958(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12;
  if (a2)
  {
    NSString v19 = sub_10460();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v19 = 0;
  }
  uint64_t v20 = sub_103F0();
  uint64_t v21 = *(void *)(v20 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(a3, 1, v20) != 1)
  {
    Class isa = sub_10390().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a3, v20);
  }
  if (a5)
  {
    v23.super.Class isa = sub_10430().super.isa;
    swift_bridgeObjectRelease();
    if (a6) {
      goto LABEL_8;
    }
  }
  else
  {
    v23.super.Class isa = 0;
    if (a6)
    {
LABEL_8:
      v24.super.Class isa = sub_104E0().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v25 = a10;
      if (a8) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  v24.super.Class isa = 0;
  uint64_t v25 = a10;
  if (a8)
  {
LABEL_9:
    char v26 = (void *)sub_10330();
    swift_errorRelease();
    uint64_t v27 = a12;
    if (v25) {
      goto LABEL_10;
    }
LABEL_15:
    NSString v28 = 0;
    if (v27) {
      goto LABEL_11;
    }
LABEL_16:
    NSString v29 = 0;
    goto LABEL_17;
  }
LABEL_14:
  char v26 = 0;
  uint64_t v27 = a12;
  if (!v25) {
    goto LABEL_15;
  }
LABEL_10:
  NSString v28 = sub_10460();
  swift_bridgeObjectRelease();
  if (!v27) {
    goto LABEL_16;
  }
LABEL_11:
  NSString v29 = sub_10460();
  swift_bridgeObjectRelease();
LABEL_17:
  id v30 = [v13 initWithSender:v19 time:isa body:a4 attributes:v23.super.isa fileTransferGUIDs:v24.super.isa flags:a7 error:v26 guid:v28 threadIdentifier:v29];

  return v30;
}

void sub_FBA4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_FBAC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_FBC0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_FBF0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_FC04(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_FC18@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_FC24(uint64_t a1, uint64_t a2, void *a3, double *a4)
{
  uint64_t v6 = *(void *)(a1 + 16);
  double result = &_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    sub_10640();
    uint64_t v11 = a1 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_EDA4(a2, a3, a4, &v12);
      swift_bridgeObjectRelease();
      if (v4) {
        break;
      }
      v11 += 16;
      sub_10620();
      sub_10650();
      sub_10660();
      sub_10630();
      if (!--v6) {
        return v13;
      }
    }
    return (void *)swift_release();
  }
  return result;
}

unint64_t sub_FD38()
{
  unint64_t result = qword_19370;
  if (!qword_19370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19370);
  }
  return result;
}

uint64_t sub_FD8C(uint64_t a1, unint64_t a2)
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

uint64_t sub_FDE4(uint64_t a1, unint64_t a2)
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

uint64_t sub_FE3C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_FDE4(a1, a2);
  }
  return a1;
}

uint64_t sub_FE50(uint64_t a1)
{
  return a1;
}

unint64_t sub_FE7C()
{
  unint64_t result = qword_19378;
  if (!qword_19378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19378);
  }
  return result;
}

unint64_t sub_FED4()
{
  unint64_t result = qword_19380;
  if (!qword_19380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19380);
  }
  return result;
}

uint64_t type metadata accessor for SatelliteSMSMessageTransformer()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SatelliteSMSMessageTransformer.IncomingMessageParseError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SatelliteSMSMessageTransformer.IncomingMessageParseError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10040);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10068()
{
  return 0;
}

ValueMetadata *type metadata accessor for SatelliteSMSMessageTransformer.IncomingMessageParseError()
{
  return &type metadata for SatelliteSMSMessageTransformer.IncomingMessageParseError;
}

unsigned char *initializeBufferWithCopyOfBuffer for SatelliteSMSMessageTransformer.OutgoingMessageParseError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SatelliteSMSMessageTransformer.OutgoingMessageParseError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SatelliteSMSMessageTransformer.OutgoingMessageParseError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x101ECLL);
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

uint64_t sub_10214(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1021C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SatelliteSMSMessageTransformer.OutgoingMessageParseError()
{
  return &type metadata for SatelliteSMSMessageTransformer.OutgoingMessageParseError;
}

unint64_t sub_10238()
{
  unint64_t result = qword_190D8;
  if (!qword_190D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_190D8);
  }
  return result;
}

uint64_t sub_10278(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A258(&qword_191C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_102E0()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_102F0()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_10300()
{
  return AttributedString.init(_:)();
}

uint64_t sub_10310()
{
  return AttributeContainer.init()();
}

uint64_t sub_10320()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_10330()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10340()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_10350()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10360()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10370()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t sub_10380()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_10390()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_103A0()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_103B0()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_103C0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_103D0()
{
  return static Date.now.getter();
}

uint64_t sub_103E0()
{
  return Date.init()();
}

uint64_t sub_103F0()
{
  return type metadata accessor for Date();
}

uint64_t sub_10400()
{
  return Logger.logObject.getter();
}

uint64_t sub_10410()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10420()
{
  return Logger.init(_:)();
}

NSDictionary sub_10430()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10440()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10450()
{
  return Dictionary.description.getter();
}

NSString sub_10460()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10470()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10480()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10490()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_104A0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_104B0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_104C0()
{
  return String.hash(into:)();
}

Swift::Int sub_104D0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_104E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_104F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber sub_10500()
{
  return Bool._bridgeToObjectiveC()();
}

NSNumber sub_10510()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10520()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10530()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10540()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10550()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10560()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10570()
{
  return NSAttributedString.init(_:)();
}

uint64_t sub_10580()
{
  return IMDLiteMessageCompressor.compress(_:)();
}

uint64_t sub_10590()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_105A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_105B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_105C0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_105D0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_105E0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_105F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10600()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10610()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10620()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10630()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10640()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10650()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10660()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10670()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10680()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10690()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_106A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_106B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_106C0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_106D0()
{
  return Error._code.getter();
}

uint64_t sub_106E0()
{
  return Error._domain.getter();
}

uint64_t sub_106F0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10700()
{
  return Hasher.init(_seed:)();
}

void sub_10710(Swift::UInt a1)
{
}

Swift::Int sub_10720()
{
  return Hasher._finalize()();
}

NSNumber sub_10730()
{
  return UInt32._bridgeToObjectiveC()();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return _CMFBlockListIsItemBlocked();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return _CMFItemCreateWithPhoneNumber();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return _IMChatCanonicalIDSIDsForAddress();
}

uint64_t IMCountryCodeForNumber()
{
  return _IMCountryCodeForNumber();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
}

uint64_t IMGetDomainValueForKey()
{
  return _IMGetDomainValueForKey();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return _IMPhoneNumberRefCopyForPhoneNumber();
}

uint64_t IMSetDomainBoolForKey()
{
  return _IMSetDomainBoolForKey();
}

uint64_t IMStringIsPhoneNumber()
{
  return _IMStringIsPhoneNumber();
}

uint64_t IMStringIsStewie()
{
  return _IMStringIsStewie();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_codecID(void *a1, const char *a2, ...)
{
  return _[a1 codecID];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextWithKnownSender_serviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithKnownSender:serviceName:");
}

id objc_msgSend_destinationPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 destinationPhoneNumber];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_hasKnownSenderChatWithChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasKnownSenderChatWithChatIdentifier:");
}

id objc_msgSend_initWithContext_destinationPhoneNumber_codecID_textPayload_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:destinationPhoneNumber:codecID:textPayload:error:");
}

id objc_msgSend_initWithContext_destinationPhoneNumber_codecID_textPayload_notifyDowngrade_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:");
}

id objc_msgSend_initWithTimestamp_pendingTotalCount_pendingCount_sourcePhoneNumber_codecID_textPayload_uniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimestamp:pendingTotalCount:pendingCount:sourcePhoneNumber:codecID:textPayload:uniqueID:");
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return _[a1 logger];
}

id objc_msgSend_notifyDowngrade(void *a1, const char *a2, ...)
{
  return _[a1 notifyDowngrade];
}

id objc_msgSend_pendingCount(void *a1, const char *a2, ...)
{
  return _[a1 pendingCount];
}

id objc_msgSend_pendingTotalCount(void *a1, const char *a2, ...)
{
  return _[a1 pendingTotalCount];
}

id objc_msgSend_plainTextBodies(void *a1, const char *a2, ...)
{
  return _[a1 plainTextBodies];
}

id objc_msgSend_sendSatelliteSMSDictionary_senderContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSatelliteSMSDictionary:senderContext:error:");
}

id objc_msgSend_setTexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTexts:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sourcePhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 sourcePhoneNumber];
}

id objc_msgSend_textPayload(void *a1, const char *a2, ...)
{
  return _[a1 textPayload];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}