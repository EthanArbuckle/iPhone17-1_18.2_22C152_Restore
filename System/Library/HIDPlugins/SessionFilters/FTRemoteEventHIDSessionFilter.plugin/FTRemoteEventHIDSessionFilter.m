uint64_t FTRemoteEventHIDSessionFilter.property(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  _OWORD v15[2];
  long long v16;
  void *v17;

  v4 = v3;
  if (a1 == 0xD000000000000012 && a2 == 0x8000000000007360 || (result = sub_6E98(), (result & 1) != 0))
  {
    v7 = sub_4774((uint64_t)&_swiftEmptyArrayStorage);
    v17 = &type metadata for String;
    *(void *)&v16 = 0xD00000000000001DLL;
    *((void *)&v16 + 1) = 0x80000000000072A0;
    sub_69C8(&v16, v15);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_523C(v15, 0x7373616C43, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    v9 = (uint64_t *)(v4 + OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices);
    swift_beginAccess();
    v10 = *v9;
    if ((v10 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v11 = sub_6DE8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = *(void *)(v10 + 16);
    }
    v17 = &type metadata for Int;
    *(void *)&v16 = v11;
    sub_69C8(&v16, v15);
    v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_523C(v15, 0xD000000000000015, 0x8000000000007380, v12);
    swift_bridgeObjectRelease();
    v13 = *(unsigned char *)(v4 + OBJC_IVAR___FTRemoteEventHIDSessionFilter_isRemoteControlActive);
    v17 = &type metadata for Bool;
    LOBYTE(v16) = v13;
    sub_69C8(&v16, v15);
    v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_523C(v15, 0xD000000000000013, 0x80000000000073A0, v14);
    swift_bridgeObjectRelease();
    result = sub_36D4(&qword_C740);
    *(void *)(a3 + 24) = result;
    *(void *)a3 = v7;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_3674(uint64_t a1)
{
  uint64_t v2 = sub_36D4(&qword_C760);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_36D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void FTRemoteEventHIDSessionFilter.serviceNotification(_:added:)(void *a1, char a2)
{
  id v4 = a1;
  variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
  variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
  v5 = v2;
  v6 = sub_6CE8();
  os_log_type_t v7 = sub_6D68();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 134349824;
    int v9 = (unint64_t)[v4 serviceID] >> 32;

    HIDWORD(v53[0]) = v9;
    sub_6D98();

    *(_WORD *)(v8 + 12) = 1026;
    LODWORD(v53[0]) = a2 & 1;
    sub_6D98();
    *(_WORD *)(v8 + 18) = 1026;
    int v10 = v5[OBJC_IVAR___FTRemoteEventHIDSessionFilter_isRemoteControlActive];

    LODWORD(v53[0]) = v10;
    sub_6D98();

    *(_WORD *)(v8 + 24) = 2050;
    v11 = &v5[OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices];
    swift_beginAccess();
    uint64_t v12 = *(void *)v11;
    if ((v12 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_6DE8();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)(v12 + 16);
    }
    v53[0] = v13;
    sub_6D98();

    _os_log_impl(&dword_0, v6, v7, "HID serviceID: 0x%{public}llx  added: %{BOOL,public}d  rc: %{BOOL,public}d  count: %{public}ld", (uint8_t *)v8, 0x22u);
    swift_slowDealloc();

    if (a2)
    {
LABEL_11:
      NSString v24 = sub_6D18();
      id v25 = [v4 propertyForKey:v24];

      if (v25)
      {
        sub_6DA8();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v52, 0, sizeof(v52));
      }
      sub_44C0((uint64_t)v52, (uint64_t)v53);
      if (v53[3])
      {
        if (swift_dynamicCast())
        {
          v26 = &v5[OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices];
          swift_beginAccess();
          id v27 = v4;
          sub_56C8(v52, v27);
          v28 = *(void **)&v52[0];
          swift_endAccess();

          uint64_t v29 = OBJC_IVAR___FTRemoteEventHIDSessionFilter_allowRemoteEvents;
          if ((v5[OBJC_IVAR___FTRemoteEventHIDSessionFilter_allowRemoteEvents] & 1) != 0
            || (uint64_t v30 = OBJC_IVAR___FTRemoteEventHIDSessionFilter_currentEventSessionID,
                v51 != *(objc_class **)&v5[OBJC_IVAR___FTRemoteEventHIDSessionFilter_currentEventSessionID]))
          {
            id v38 = v27;
            variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
            variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
            v39 = v5;
            v40 = sub_6CE8();
            os_log_type_t v41 = sub_6D68();
            if (os_log_type_enabled(v40, v41))
            {
              uint64_t v42 = swift_slowAlloc();
              *(_DWORD *)uint64_t v42 = 134218496;
              id v43 = [v38 serviceID];

              v53[0] = v43;
              sub_6D98();

              *(_WORD *)(v42 + 12) = 2048;
              v53[0] = v51;
              sub_6D98();
              *(_WORD *)(v42 + 22) = 2048;
              uint64_t v44 = *(void *)v26;
              if ((v44 & 0xC000000000000001) != 0)
              {
                swift_bridgeObjectRetain();
                uint64_t v45 = sub_6DE8();

                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v45 = *(void *)(v44 + 16);
              }
              v53[0] = v45;
              sub_6D98();

              _os_log_impl(&dword_0, v40, v41, "Add FaceTime remote event HID serviceID: 0x%llx sessionID: %ld  count: %ld", (uint8_t *)v42, 0x20u);
              swift_slowDealloc();
            }
            else
            {

              v40 = v39;
            }

            *((unsigned char *)&v39->isa + OBJC_IVAR___FTRemoteEventHIDSessionFilter_isRemoteControlActive) = 1;
            v5[v29] = 1;
            *(Class *)((char *)&v39->isa + OBJC_IVAR___FTRemoteEventHIDSessionFilter_currentEventSessionID) = v51;
          }
          else
          {
            id v31 = v27;
            variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
            variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
            v32 = v5;
            v33 = sub_6CE8();
            os_log_type_t v34 = sub_6D68();
            if (os_log_type_enabled(v33, v34))
            {
              uint64_t v35 = swift_slowAlloc();
              *(_DWORD *)uint64_t v35 = 134349568;
              id v36 = [v31 serviceID];

              v53[0] = v36;
              sub_6D98();

              *(_WORD *)(v35 + 12) = 2050;
              v53[0] = v51;
              sub_6D98();
              *(_WORD *)(v35 + 22) = 2050;
              uint64_t v37 = *(void *)&v5[v30];

              v53[0] = v37;
              sub_6D98();

              _os_log_impl(&dword_0, v33, v34, "Tried to add remote event virtual HID service with invalid sessionID.  serviceID: 0x%{public}llx sessionID: %{public}ld  current sessionID: %{public}ld", (uint8_t *)v35, 0x20u);
              swift_slowDealloc();
            }
            else
            {

              v33 = v32;
            }

            IOHIDServiceRequestTerminate();
          }
        }
      }
      else
      {
        sub_3674((uint64_t)v53);
      }
      return;
    }
  }
  else
  {

    if (a2) {
      goto LABEL_11;
    }
  }
  v14 = (uint64_t *)&v5[OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices];
  swift_beginAccess();
  uint64_t v15 = *v14;
  swift_bridgeObjectRetain();
  char v16 = sub_4528(v4, v15);
  swift_bridgeObjectRelease();
  if ((v16 & 1) == 0) {
    return;
  }
  id v17 = v4;
  variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
  variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
  v18 = v5;
  v19 = sub_6CE8();
  os_log_type_t v20 = sub_6D68();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 134218240;
    id v22 = [v17 serviceID];

    *(void *)&v52[0] = v22;
    sub_6D98();

    *(_WORD *)(v21 + 12) = 2048;
    if ((*v14 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_6DE8();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)(*v14 + 16);
    }
    *(void *)&v52[0] = v23;
    sub_6D98();

    _os_log_impl(&dword_0, v19, v20, "Remove remote event virtual HID sevice.  serviceID: 0x%llx count: %ld", (uint8_t *)v21, 0x16u);
    swift_slowDealloc();
  }
  else
  {

    v19 = v18;
  }

  swift_beginAccess();
  v46 = (void *)sub_5948(v17);
  swift_endAccess();

  if ((*v14 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_6DE8();
    swift_bridgeObjectRelease();
    if (v47) {
      return;
    }
  }
  else if (*(void *)(*v14 + 16))
  {
    return;
  }
  v48 = sub_6CE8();
  os_log_type_t v49 = sub_6D68();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    _os_log_impl(&dword_0, v48, v49, "FaceTime remote event HID services no longer active", v50, 2u);
    swift_slowDealloc();
  }

  *((unsigned char *)&v18->isa + OBJC_IVAR___FTRemoteEventHIDSessionFilter_isRemoteControlActive) = 0;
  *(Class *)((char *)&v18->isa + OBJC_IVAR___FTRemoteEventHIDSessionFilter_currentEventSessionID) = 0;
}

void *FTRemoteEventHIDSessionFilter.filterEvent(_:for:)(void *a1, void *a2)
{
  if (v2[OBJC_IVAR___FTRemoteEventHIDSessionFilter_isRemoteControlActive] != 1) {
    goto LABEL_19;
  }
  v5 = (uint64_t *)&v2[OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices];
  swift_beginAccess();
  uint64_t v6 = *v5;
  swift_bridgeObjectRetain();
  char v7 = sub_4528(a2, v6);
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
    if (v2[OBJC_IVAR___FTRemoteEventHIDSessionFilter_allowRemoteEvents] == 1)
    {
      if ([a1 type] == 10)
      {
        id v13 = a2;
        variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
        variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
        v14 = sub_6CE8();
        os_log_type_t v15 = sub_6D68();
        if (os_log_type_enabled(v14, v15))
        {
          char v16 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)char v16 = 134217984;
          [v13 serviceID];
          sub_6D98();

          _os_log_impl(&dword_0, v14, v15, "Ignore orientation event from 0x%llx", v16, 0xCu);
          swift_slowDealloc();
        }
        else
        {
        }
      }
      else if (IOHIDEventGetPolicy() == 3)
      {
        id v17 = a2;
        variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
        variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
        v18 = a1;
        v19 = sub_6CE8();
        os_log_type_t v20 = sub_6D68();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = swift_slowAlloc();
          *(_DWORD *)uint64_t v21 = 134349312;
          id v22 = [v17 serviceID];

          sub_6D98();
          *(_WORD *)(v21 + 12) = 1026;
          [v18 type];

          sub_6D98();
          _os_log_impl(&dword_0, v19, v20, "Terminate FaceTime remote event services due to local HID event.  serviceID: 0x%{public}llx  event type: %{public}u", (uint8_t *)v21, 0x12u);
          swift_slowDealloc();
        }
        else
        {

          v19 = v18;
        }

        sub_4A0C();
      }
    }
    goto LABEL_19;
  }
  id v8 = a2;
  variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
  variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
  int v9 = v2;
  int v10 = sub_6CE8();
  os_log_type_t v11 = sub_6D58();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134218240;
    [v8 serviceID];

    sub_6D98();
    *(_WORD *)(v12 + 12) = 1024;

    sub_6D98();
    _os_log_impl(&dword_0, v10, v11, "FaceTime remote event from 0x%llx  Allow: %{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_slowDealloc();
  }
  else
  {

    int v10 = v9;
  }

  if (*((unsigned char *)&v9->isa + OBJC_IVAR___FTRemoteEventHIDSessionFilter_allowRemoteEvents))
  {
LABEL_19:
    id v23 = a1;
    return a1;
  }
  return 0;
}

uint64_t variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive()
{
  return 0;
}

uint64_t sub_44C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_36D4(&qword_C760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_4528(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_6E18();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = sub_6D78(*(void *)(a2 + 40)),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  sub_6B84();
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_6D88();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_6D88();

        if (v12) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }
      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  char v12 = 1;
  return v12 & 1;
}

void *variable initialization expression of FTRemoteEventHIDSessionFilter.remoteHIDServices()
{
  return &_swiftEmptySetSingleton;
}

uint64_t variable initialization expression of FTRemoteEventHIDSessionFilter.currentEventSessionID()
{
  return 0;
}

unint64_t variable initialization expression of FTRemoteEventHIDSessionFilter.FTRemoteControlSessionIDKey()
{
  return 0xD00000000000001ELL;
}

uint64_t variable initialization expression of FTRemoteEventHIDSessionFilter.filterLogger()
{
  return sub_6CF8();
}

id FTRemoteEventHIDSessionFilter.__allocating_init(session:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_68EC();

  return v4;
}

id FTRemoteEventHIDSessionFilter.init(session:)(void *a1)
{
  id v2 = sub_68EC();

  return v2;
}

unint64_t sub_4774(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_36D4(&qword_C808);
  uint64_t v2 = sub_6E78();
  id v3 = (void *)v2;
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
    sub_6C80(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_4EC4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_69C8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

Swift::Void __swiftcall FTRemoteEventHIDSessionFilter.activate()()
{
  oslog = sub_6CE8();
  os_log_type_t v0 = sub_6D68();
  if (os_log_type_enabled(oslog, v0))
  {
    v1 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_0, oslog, v0, "Activate remote event session filter", v1, 2u);
    swift_slowDealloc();
  }
}

void sub_4A0C()
{
  *(unsigned char *)(v0 + OBJC_IVAR___FTRemoteEventHIDSessionFilter_allowRemoteEvents) = 0;
  v1 = (uint64_t *)(v0 + OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_6DD8();
    sub_6B84();
    sub_6BC4();
    sub_6D48();
    uint64_t v2 = v23;
    uint64_t v21 = v24;
    uint64_t v3 = v25;
    uint64_t v4 = v26;
    unint64_t v5 = v27;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v21 = v2 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(v2 + 56);
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  while (v2 < 0)
  {
    if (!sub_6E08()) {
      goto LABEL_33;
    }
    sub_6B84();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = v22;
    swift_unknownObjectRelease();
    uint64_t v12 = v4;
    uint64_t v10 = v5;
    if (!v22) {
      goto LABEL_33;
    }
LABEL_31:
    id v17 = v13;
    variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
    variable initialization expression of FTRemoteEventHIDSessionFilter.isRemoteControlActive();
    v18 = sub_6CE8();
    os_log_type_t v19 = sub_6D68();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 134349056;
      *(void *)(v20 + 4) = [v17 serviceID];

      _os_log_impl(&dword_0, v18, v19, "Terminate FaceTime HID service.  serviceID: 0x%{public}llx", (uint8_t *)v20, 0xCu);
      swift_slowDealloc();
    }
    else
    {
    }
    IOHIDServiceRequestTerminate();

    uint64_t v4 = v12;
    unint64_t v5 = v10;
  }
  if (v5)
  {
    uint64_t v10 = (v5 - 1) & v5;
    unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
    uint64_t v12 = v4;
LABEL_30:
    id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  int64_t v14 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v14 >= v9) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v21 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v21 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v21 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            goto LABEL_33;
          }
          unint64_t v15 = *(void *)(v21 + 8 * v12);
          if (!v15)
          {
            uint64_t v16 = v4 + 5;
            while (v9 != v16)
            {
              unint64_t v15 = *(void *)(v21 + 8 * v16++);
              if (v15)
              {
                uint64_t v12 = v16 - 1;
                goto LABEL_29;
              }
            }
LABEL_33:
            sub_6C1C();
            return;
          }
        }
      }
    }
LABEL_29:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

id FTRemoteEventHIDSessionFilter.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void FTRemoteEventHIDSessionFilter.init()()
{
}

id FTRemoteEventHIDSessionFilter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTRemoteEventHIDSessionFilter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_4EC4(uint64_t a1, uint64_t a2)
{
  sub_6EC8();
  sub_6D38();
  Swift::Int v4 = sub_6ED8();

  return sub_53FC(a1, a2, v4);
}

uint64_t sub_4F3C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_36D4(&qword_C808);
  uint64_t v6 = sub_6E68();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    os_log_type_t v34 = (void *)(v5 + 64);
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
                  *os_log_type_t v34 = -1 << v32;
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
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_69C8(v24, v35);
      }
      else
      {
        sub_6C24((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_6EC8();
      sub_6D38();
      uint64_t result = sub_6ED8();
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
      uint64_t result = (uint64_t)sub_69C8(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_523C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_4EC4(a2, a3);
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
      sub_54E0();
      goto LABEL_7;
    }
    sub_4F3C(v15, a4 & 1);
    unint64_t v21 = sub_4EC4(a2, a3);
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
    uint64_t result = (_OWORD *)sub_6EB8();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_6B34((uint64_t)v19);
    return sub_69C8(a1, v19);
  }
LABEL_13:
  sub_5390(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_5390(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_69C8(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_53FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_6E98() & 1) == 0)
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
      while (!v14 && (sub_6E98() & 1) == 0);
    }
  }
  return v6;
}

void *sub_54E0()
{
  id v1 = v0;
  sub_36D4(&qword_C808);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_6E58();
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
    uint64_t v20 = 32 * v15;
    sub_6C24(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_69C8(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    id v1 = v25;
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

uint64_t sub_56C8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_6DF8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_6B84();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_6DE8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_6508(v7, result + 1);
    char v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_60C4();
      unint64_t v23 = v28;
    }
    else
    {
      unint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_66F0((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_6D78(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_6B84();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_6D88();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_6D88();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_6774((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_5948(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = sub_6E18();

    if (v6)
    {
      uint64_t v7 = sub_5B10();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = sub_6D78(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  sub_6B84();
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = sub_6D88();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = sub_6D88();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_5C9C();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_6364(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_5B10()
{
  id v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_6DE8();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_6508(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = sub_6D78(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_6B84();
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = sub_6D88();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_6364(v8);
      if (sub_6D88())
      {
        Swift::Int *v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = sub_6D88();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_5C9C()
{
  id v1 = v0;
  sub_36D4(&qword_C7F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_6E28();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_5E48()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_36D4(&qword_C7F8);
  uint64_t v3 = sub_6E38();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  char v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
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
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_6D78(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_60C4()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_36D4(&qword_C7F8);
  uint64_t v3 = sub_6E38();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    char v28 = v0;
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
                id v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
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
      uint64_t result = sub_6D78(*(void *)(v4 + 40));
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
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_6364(unint64_t result)
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
    uint64_t v8 = sub_6DB8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = sub_6D78(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            int64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
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
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

Swift::Int sub_6508(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_36D4(&qword_C7F8);
    uint64_t v2 = sub_6E48();
    uint64_t v14 = v2;
    sub_6DD8();
    if (sub_6E08())
    {
      sub_6B84();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_60C4();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_6D78(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_6E08());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

unint64_t sub_66F0(uint64_t a1, void *a2)
{
  sub_6D78(a2[5]);
  unint64_t result = sub_6DC8();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_6774(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_60C4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_5C9C();
      goto LABEL_14;
    }
    sub_5E48();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_6D78(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_6B84();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_6D88();

    if (v12)
    {
LABEL_13:
      sub_6EA8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_6D88();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_68EC()
{
  *(void *)&v0[OBJC_IVAR___FTRemoteEventHIDSessionFilter_remoteHIDServices] = &_swiftEmptySetSingleton;
  v0[OBJC_IVAR___FTRemoteEventHIDSessionFilter_isRemoteControlActive] = 0;
  v0[OBJC_IVAR___FTRemoteEventHIDSessionFilter_allowRemoteEvents] = 0;
  *(void *)&v0[OBJC_IVAR___FTRemoteEventHIDSessionFilter_currentEventSessionID] = 0;
  id v1 = &v0[OBJC_IVAR___FTRemoteEventHIDSessionFilter_FTRemoteControlSessionIDKey];
  void *v1 = 0xD00000000000001ELL;
  v1[1] = 0x8000000000007300;
  sub_6CF8();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for FTRemoteEventHIDSessionFilter();
  return objc_msgSendSuper2(&v3, "init");
}

_OWORD *sub_69C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for FTRemoteEventHIDSessionFilter()
{
  uint64_t result = qword_C888;
  if (!qword_C888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_6A24()
{
  return type metadata accessor for FTRemoteEventHIDSessionFilter();
}

uint64_t sub_6A2C()
{
  uint64_t result = sub_6D08();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_6AF0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_6B34(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_6B84()
{
  unint64_t result = qword_C7F0;
  if (!qword_C7F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_C7F0);
  }
  return result;
}

unint64_t sub_6BC4()
{
  unint64_t result = qword_C800;
  if (!qword_C800)
  {
    sub_6B84();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C800);
  }
  return result;
}

uint64_t sub_6C1C()
{
  return swift_release();
}

uint64_t sub_6C24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_36D4((uint64_t *)&unk_C810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6CE8()
{
  return Logger.logObject.getter();
}

uint64_t sub_6CF8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_6D08()
{
  return type metadata accessor for Logger();
}

NSString sub_6D18()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6D28()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6D38()
{
  return String.hash(into:)();
}

uint64_t sub_6D48()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_6D58()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_6D68()
{
  return static os_log_type_t.default.getter();
}

Swift::Int sub_6D78(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_6D88()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_6D98()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6DA8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_6DB8()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_6DC8()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_6DD8()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_6DE8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_6DF8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_6E08()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_6E18()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_6E28()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_6E38()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_6E48()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_6E58()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_6E68()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_6E78()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_6E88()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_6E98()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_6EA8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_6EB8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_6EC8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_6ED8()
{
  return Hasher._finalize()();
}

uint64_t IOHIDEventGetPolicy()
{
  return _IOHIDEventGetPolicy();
}

uint64_t IOHIDServiceRequestTerminate()
{
  return _IOHIDServiceRequestTerminate();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}