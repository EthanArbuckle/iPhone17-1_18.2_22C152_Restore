void sub_1416C4()
{
  sub_1411B8();
}

uint64_t sub_1416EC()
{
  if (!sub_142D68(v0, (SEL *)&selRef_fans, &qword_1C2B20)) {
    return 0;
  }
  sub_116650();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_14174C()
{
  uint64_t v1 = sub_14E0B0();
  sub_B1F0();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [v0 car];
  if (!v7) {
    return 0;
  }
  v8 = v7;
  id v9 = [v7 positionManager];

  if (!v9) {
    return 0;
  }
  uint64_t v10 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for CAUVehicleLayoutKey.End.front(_:), v1);
  __chkstk_darwin(v10);
  *(&v14 - 2) = (uint64_t)v6;
  sub_1411B8();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  sub_1162B0();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1418DC()
{
  sub_142D68(v0, (SEL *)&selRef_zonesSynceds, &qword_1C2AE0);
  sub_1163E4();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  return v2;
}

void sub_141940(char a1)
{
  sub_14EE40(23);
  swift_bridgeObjectRelease();
  if (a1) {
    v2._countAndFlagsBits = 28271;
  }
  else {
    v2._countAndFlagsBits = 6710895;
  }
  if (a1) {
    uint64_t v3 = (void *)0xE200000000000000;
  }
  else {
    uint64_t v3 = (void *)0xE300000000000000;
  }
  v2._object = v3;
  sub_14E950(v2);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 46;
  v7._object = (void *)0xE100000000000000;
  sub_14E950(v7);
  if (qword_1B90A8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_14E7D0();
  sub_B0E0(v4, (uint64_t)qword_1B9FB8);
  os_log_type_t v5 = sub_14EB50();
  sub_35528(v5, 0x4000uLL, 0xD000000000000097, 0x800000000016EAE0, 0xD00000000000001BLL, (void *)0x800000000016EB80, 45, 0xD000000000000014, 0x800000000016EAC0);
  swift_bridgeObjectRelease();
  sub_14EB20();

  sub_141AB4();
}

void sub_141AB4()
{
  sub_DEF50();
  LOBYTE(v2) = v1;
  unint64_t v3 = sub_142D68(v0, (SEL *)&selRef_autoClimateControls, &qword_1C45C8);
  if (v3)
  {
    unint64_t v4 = v3;
    if (v3 >> 62) {
      goto LABEL_15;
    }
    uint64_t v5 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    for (; v5; uint64_t v5 = sub_14EF20())
    {
      v2 &= 1u;
      for (uint64_t i = 4; ; ++i)
      {
        id v7 = (v4 & 0xC000000000000001) != 0 ? (id)sub_14EE60() : *(id *)(v4 + 8 * i);
        v8 = v7;
        if (__OFADD__(i - 4, 1)) {
          break;
        }
        if ([v7 hasLevel] && objc_msgSend(v8, "level") != v2) {
          [v8 setLevel:v2];
        }

        if (i - 3 == v5) {
          goto LABEL_16;
        }
      }
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  sub_DEF10();
}

double sub_141BE4@<D0>(SEL *a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  id v8 = [v4 *a1];
  if (v8)
  {
    id v9 = v8;
    *(void *)(a4 + 24) = sub_16160(0, a2);
    *(void *)(a4 + 32) = a3;
    *(void *)a4 = v9;
  }
  else
  {
    *(void *)(a4 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

void sub_141C64()
{
  sub_DEF50();
  uint64_t v3 = v2;
  uint64_t v4 = sub_14E0F0();
  sub_B1F0();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_B6A4();
  uint64_t v48 = v8;
  uint64_t v9 = sub_6204(&qword_1C45D0);
  sub_115B8();
  __chkstk_darwin(v10);
  sub_128128();
  uint64_t v11 = sub_6204(&qword_1C30C8);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  __chkstk_darwin(v13);
  v49 = (char *)&v38 - v16;
  if (v3)
  {
    uint64_t v53 = v14;
    uint64_t v54 = v15;
    id v17 = [v0 car];
    if (v17
      && (v18 = v17, id v19 = [v17 seat], v18, v19)
      && (uint64_t v20 = sub_142E94(v19)) != 0)
    {
      unint64_t v21 = v20;
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v21 = (unint64_t)_swiftEmptyArrayStorage;
    }
    if (v3 == 1)
    {
      sub_1169E0();
      swift_bridgeObjectRelease();
      goto LABEL_42;
    }
    v59 = _swiftEmptyArrayStorage;
    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_14EF20();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
    }
    uint64_t v23 = v54;
    if (!v22)
    {
LABEL_41:
      swift_bridgeObjectRelease();
      sub_1169E0();
      swift_release();
      goto LABEL_42;
    }
    if (v22 < 1)
    {
      __break(1u);
      JUMPOUT(0x142240);
    }
    uint64_t v24 = 0;
    unint64_t v58 = v21 & 0xC000000000000001;
    unsigned int v45 = enum case for CAUVehicleLayoutKey.seat_3rdRow_right(_:);
    v56 = (void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
    unsigned int v44 = enum case for CAUVehicleLayoutKey.seat_3rdRow_left(_:);
    unsigned int v43 = enum case for CAUVehicleLayoutKey.seat_3rdRow(_:);
    unsigned int v42 = enum case for CAUVehicleLayoutKey.seat_2ndRow_right(_:);
    unsigned int v41 = enum case for CAUVehicleLayoutKey.seat_2ndRow_left(_:);
    unsigned int v40 = enum case for CAUVehicleLayoutKey.seat_2ndRow(_:);
    uint64_t v47 = v6 + 32;
    v51 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    unsigned int v46 = enum case for CAUVehicleLayoutKey.seat_front_right(_:);
    uint64_t v57 = v3 - 2;
    unsigned int v55 = enum case for CAUVehicleLayoutKey.seat_front_left(_:);
    unsigned int v39 = enum case for CAUVehicleLayoutKey.seat_front(_:);
    uint64_t v25 = (uint64_t)v49;
    uint64_t v52 = v22;
    while (1)
    {
      id v26 = v58 ? (id)sub_14EE60() : *(id *)(v21 + 8 * v24 + 32);
      v27 = v26;
      sub_16160(0, &qword_1C2B00);
      sub_14EB40();
      uint64_t v28 = v55;
      switch(v57)
      {
        case 0:
        case 2:
          goto LABEL_27;
        case 1:
        case 3:
          uint64_t v28 = v46;
          goto LABEL_27;
        case 4:
          uint64_t v28 = v39;
          goto LABEL_27;
        case 5:
          uint64_t v28 = v41;
          goto LABEL_27;
        case 6:
          uint64_t v28 = v42;
          goto LABEL_27;
        case 7:
          uint64_t v28 = v40;
          goto LABEL_27;
        case 8:
          uint64_t v28 = v44;
          goto LABEL_27;
        case 9:
          uint64_t v28 = v45;
          goto LABEL_27;
        case 10:
          uint64_t v28 = v43;
LABEL_27:
          (*v56)(v23, v28, v4);
          uint64_t v29 = 0;
          break;
        default:
          uint64_t v29 = 1;
          break;
      }
      sub_5E9C(v23, v29, 1, v4);
      uint64_t v30 = v1 + *(int *)(v9 + 48);
      sub_142DDC(v25, v1);
      sub_142DDC(v23, v30);
      sub_127FD4(v1);
      if (v33) {
        break;
      }
      v31 = (void *)v21;
      uint64_t v32 = v53;
      sub_142DDC(v1, v53);
      sub_127FD4(v30);
      if (v33)
      {
        (*v51)(v32, v4);
        unint64_t v21 = (unint64_t)v31;
        uint64_t v22 = v52;
LABEL_36:
        sub_11444(v1, &qword_1C45D0);
        sub_11444(v23, &qword_1C30C8);
        sub_11444(v25, &qword_1C30C8);
        goto LABEL_37;
      }
      uint64_t v25 = v9;
      uint64_t v9 = v48;
      uint64_t v34 = sub_142F3C();
      v35(v34);
      sub_142E44();
      int v50 = sub_14E850();
      v36 = *v51;
      (*v51)(v32, v4);
      uint64_t v37 = sub_142F54();
      ((void (*)(uint64_t))v36)(v37);
      uint64_t v23 = v54;
      sub_11444(v1, &qword_1C30C8);
      sub_11444(v23, &qword_1C30C8);
      sub_11444(v25, &qword_1C30C8);
      unint64_t v21 = (unint64_t)v31;
      uint64_t v22 = v52;
      if (v50) {
        goto LABEL_39;
      }
LABEL_37:

LABEL_40:
      if (v22 == ++v24) {
        goto LABEL_41;
      }
    }
    sub_127FD4(v30);
    if (v33)
    {
      sub_11444(v1, &qword_1C30C8);
      sub_11444(v23, &qword_1C30C8);
      sub_11444(v25, &qword_1C30C8);
LABEL_39:
      sub_14EE90();
      sub_14EEC0();
      uint64_t v23 = v54;
      sub_14EED0();
      sub_14EEA0();
      goto LABEL_40;
    }
    goto LABEL_36;
  }
LABEL_42:
  sub_DEF10();
}

void sub_14226C()
{
  sub_DEF50();
  uint64_t v2 = v0;
  unint64_t v4 = v3;
  uint64_t v5 = sub_14E0F0();
  sub_B1F0();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_B6A4();
  uint64_t v48 = v9;
  uint64_t v10 = sub_6204(&qword_1C45D0);
  sub_115B8();
  __chkstk_darwin(v11);
  sub_128128();
  uint64_t v12 = sub_6204(&qword_1C30C8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  v18 = (char *)&v38 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v21 = sub_142D68(v2, (SEL *)&selRef_temperatures, &qword_1C2AF0);
  if (v21) {
    unint64_t v22 = v21;
  }
  else {
    unint64_t v22 = (unint64_t)_swiftEmptyArrayStorage;
  }
  if (v4 > 1)
  {
    uint64_t v57 = _swiftEmptyArrayStorage;
    unint64_t v47 = v22;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_14EF20();
      swift_bridgeObjectRelease();
      uint64_t v23 = v37;
      if (v37) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v23 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
      if (v23)
      {
LABEL_8:
        if (v23 < 1)
        {
          __break(1u);
          JUMPOUT(0x1427F8);
        }
        uint64_t v24 = 0;
        unint64_t v54 = v47 & 0xC000000000000001;
        unsigned int v44 = enum case for CAUVehicleLayoutKey.seat_3rdRow_right(_:);
        uint64_t v52 = (void (**)(char *, uint64_t, uint64_t))(v7 + 104);
        unsigned int v43 = enum case for CAUVehicleLayoutKey.seat_3rdRow_left(_:);
        unsigned int v42 = enum case for CAUVehicleLayoutKey.seat_3rdRow(_:);
        unsigned int v41 = enum case for CAUVehicleLayoutKey.seat_2ndRow_right(_:);
        unsigned int v40 = enum case for CAUVehicleLayoutKey.seat_2ndRow_left(_:);
        unsigned int v39 = enum case for CAUVehicleLayoutKey.seat_2ndRow(_:);
        uint64_t v46 = v7 + 32;
        int v50 = (void (**)(char *, uint64_t))(v7 + 8);
        uint64_t v25 = v47;
        unsigned int v45 = enum case for CAUVehicleLayoutKey.seat_front_right(_:);
        unint64_t v53 = v4 - 2;
        unsigned int v51 = enum case for CAUVehicleLayoutKey.seat_front_left(_:);
        unsigned int v38 = enum case for CAUVehicleLayoutKey.seat_front(_:);
        uint64_t v55 = v23;
        v56 = v15;
        while (1)
        {
          id v26 = v54 ? (id)sub_14EE60() : *(id *)(v25 + 8 * v24 + 32);
          v27 = v26;
          sub_16160(0, &qword_1C2AF0);
          sub_14EB40();
          uint64_t v28 = v51;
          switch(v53)
          {
            case 0uLL:
            case 2uLL:
              goto LABEL_23;
            case 1uLL:
            case 3uLL:
              uint64_t v28 = v45;
              goto LABEL_23;
            case 4uLL:
              uint64_t v28 = v38;
              goto LABEL_23;
            case 5uLL:
              uint64_t v28 = v40;
              goto LABEL_23;
            case 6uLL:
              uint64_t v28 = v41;
              goto LABEL_23;
            case 7uLL:
              uint64_t v28 = v39;
              goto LABEL_23;
            case 8uLL:
              uint64_t v28 = v43;
              goto LABEL_23;
            case 9uLL:
              uint64_t v28 = v44;
              goto LABEL_23;
            case 0xAuLL:
              uint64_t v28 = v42;
LABEL_23:
              (*v52)(v18, v28, v5);
              uint64_t v29 = 0;
              break;
            default:
              uint64_t v29 = 1;
              break;
          }
          sub_5E9C((uint64_t)v18, v29, 1, v5);
          uint64_t v30 = v1 + *(int *)(v10 + 48);
          sub_142DDC((uint64_t)v20, v1);
          sub_142DDC((uint64_t)v18, v30);
          sub_127FD4(v1);
          if (v31) {
            break;
          }
          sub_142DDC(v1, (uint64_t)v15);
          sub_127FD4(v30);
          if (v31)
          {
            (*v50)(v15, v5);
LABEL_32:
            sub_11444(v1, &qword_1C45D0);
            sub_11444((uint64_t)v18, &qword_1C30C8);
            sub_11444((uint64_t)v20, &qword_1C30C8);
            goto LABEL_33;
          }
          uint64_t v25 = v10;
          uint64_t v10 = v48;
          uint64_t v32 = sub_142F3C();
          v33(v32);
          sub_142E44();
          int v49 = sub_14E850();
          uint64_t v34 = v15;
          v35 = *v50;
          (*v50)(v34, v5);
          uint64_t v36 = sub_142F54();
          ((void (*)(uint64_t))v35)(v36);
          sub_11444(v1, &qword_1C30C8);
          sub_11444((uint64_t)v18, &qword_1C30C8);
          sub_11444((uint64_t)v20, &qword_1C30C8);
          if (v49) {
            goto LABEL_35;
          }
LABEL_33:

LABEL_36:
          ++v24;
          uint64_t v15 = v56;
          if (v55 == v24) {
            goto LABEL_39;
          }
        }
        sub_127FD4(v30);
        if (v31)
        {
          sub_11444(v1, &qword_1C30C8);
          sub_11444((uint64_t)v18, &qword_1C30C8);
          sub_11444((uint64_t)v20, &qword_1C30C8);
LABEL_35:
          sub_14EE90();
          sub_14EEC0();
          sub_14EED0();
          sub_14EEA0();
          goto LABEL_36;
        }
        goto LABEL_32;
      }
    }
LABEL_39:
    swift_bridgeObjectRelease();
    sub_1168B8();
    swift_release();
    goto LABEL_40;
  }
  sub_1168B8();
  swift_bridgeObjectRelease();
LABEL_40:
  sub_DEF10();
}

double sub_142824@<D0>(uint64_t a1@<X8>)
{
  return sub_141BE4((SEL *)&selRef_steeringWheelHeatingCooling, &qword_1C45F0, (uint64_t)&off_1AA6E0, a1);
}

double sub_142868@<D0>(uint64_t a1@<X8>)
{
  return sub_141BE4((SEL *)&selRef_cabin, &qword_1C45E8, (uint64_t)&off_1AB2A8, a1);
}

uint64_t sub_1428AC()
{
  return sub_1416EC();
}

double sub_1428D0@<D0>(uint64_t a1@<X8>)
{
  return sub_141BE4((SEL *)&selRef_recirculation, &qword_1C45E0, (uint64_t)&off_1ADC38, a1);
}

uint64_t sub_142914()
{
  return sub_14174C();
}

void sub_142938(char a1)
{
}

void sub_14295C()
{
}

void sub_142980()
{
}

void sub_1429A4()
{
}

uint64_t sub_1429C8()
{
  return sub_1418DC();
}

unint64_t sub_1429EC(char a1)
{
  if (CarCommandsUseCase.rawValue.getter(a1) == 0x616D696C43746573 && v3 == 0xEA00000000006574)
  {
    swift_bridgeObjectRelease();
LABEL_13:
    unint64_t result = (unint64_t)[v1 cabin];
    if (!result) {
      return result;
    }
    uint64_t v10 = (void *)result;
    if ([(id)result hasHvacOn]) {
      unsigned int v11 = [v10 hvacOnInvalid] ^ 1;
    }
    else {
      unsigned int v11 = 0;
    }
    if ([v10 hasCompressorOn]
      && ([v10 compressorOnDisabled] & 1) == 0)
    {
      unsigned __int8 v19 = [v10 compressorOnInvalid];
      if (v11 & 1) == 0 && (v19) {
        goto LABEL_20;
      }
    }
    else if (!v11)
    {
LABEL_20:
      int v12 = sub_14EB10();

      BOOL v13 = v12 == 2;
      return !v13;
    }

    return 1;
  }
  char v5 = sub_14EFC0();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_13;
  }
  if (CarCommandsUseCase.rawValue.getter(a1) == 0x4D6F747541746573 && v6 == 0xEB0000000065646FLL)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = sub_14EFC0();
    swift_bridgeObjectRelease();
    unint64_t result = 0;
    if ((v8 & 1) == 0) {
      return result;
    }
  }
  unint64_t result = sub_142D68(v1, (SEL *)&selRef_autoClimateControls, &qword_1C45C8);
  if (result)
  {
    unint64_t v14 = result;
    if (result >> 62)
    {
      unint64_t result = sub_14EF20();
      uint64_t v15 = result;
      if (result)
      {
LABEL_25:
        if (v15 < 1)
        {
          __break(1u);
          return result;
        }
        for (uint64_t i = 0; i != v15; ++i)
        {
          if ((v14 & 0xC000000000000001) != 0) {
            id v17 = (id)sub_14EE60();
          }
          else {
            id v17 = *(id *)(v14 + 8 * i + 32);
          }
          v18 = v17;
          if (![v17 hasLevel]
            || ([v18 levelInvalid] & 1) != 0
            || ([v18 levelDisabled] & 1) != 0)
          {
          }
          else
          {
            sub_14EE90();
            sub_14EEC0();
            sub_14EED0();
            sub_14EEA0();
          }
        }
        swift_bridgeObjectRelease();
        if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
          goto LABEL_51;
        }
LABEL_44:
        if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) == 0)
        {
          uint64_t v20 = _swiftEmptyArrayStorage[2];
LABEL_46:
          swift_release();
          BOOL v13 = v20 == 0;
          return !v13;
        }
LABEL_51:
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_14EF20();
        swift_release();
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
      if (v15) {
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_44;
  }
  return result;
}

unint64_t sub_142D40(char a1)
{
  return sub_1429EC(a1) & 1;
}

uint64_t sub_142D68(void *a1, SEL *a2, unint64_t *a3)
{
  id v4 = [a1 *a2];
  if (!v4) {
    return 0;
  }
  char v5 = v4;
  sub_16160(0, a3);
  uint64_t v6 = sub_14E9E0();

  return v6;
}

uint64_t sub_142DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6204(&qword_1C30C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_142E44()
{
  unint64_t result = qword_1C45D8;
  if (!qword_1C45D8)
  {
    sub_14E0F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C45D8);
  }
  return result;
}

uint64_t sub_142E94(void *a1)
{
  id v2 = [a1 heatingCoolings];

  if (!v2) {
    return 0;
  }
  sub_16160(0, &qword_1C2B00);
  uint64_t v3 = sub_14E9E0();

  return v3;
}

void sub_142F2C()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
}

uint64_t sub_142F3C()
{
  return v0;
}

uint64_t sub_142F54()
{
  return v0;
}

void sub_142F68()
{
  type metadata accessor for CarTire();
  sub_B1F0();
  uint64_t v82 = v2;
  uint64_t v83 = v1;
  uint64_t v3 = __chkstk_darwin(v1);
  char v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v67 - v6;
  uint64_t v86 = sub_14E0F0();
  sub_B1F0();
  uint64_t v9 = v8;
  uint64_t v11 = __chkstk_darwin(v10);
  BOOL v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  v72 = (char *)&v67 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v74 = (char *)&v67 - v17;
  __chkstk_darwin(v16);
  v75 = (char *)&v67 - v18;
  id v19 = [v0 tirePressures];
  sub_16160(0, qword_1C45F8);
  unint64_t v20 = sub_14E9E0();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_14EF20();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v21 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8));
  if (!v21) {
    goto LABEL_26;
  }
LABEL_3:
  if (v21 >= 1)
  {
    v70 = v13;
    uint64_t v22 = 0;
    unint64_t v79 = v20 & 0xC000000000000001;
    v85 = (void (**)(void))(v9 + 104);
    v84 = (void (**)(uint64_t))(v9 + 8);
    uint64_t v23 = _swiftEmptyArrayStorage;
    int v78 = enum case for CAUVehicleLayoutKey.tire_front_left(_:);
    int v73 = enum case for CAUVehicleLayoutKey.tire_front_right(_:);
    int v71 = enum case for CAUVehicleLayoutKey.tire_rear_left(_:);
    int v69 = enum case for CAUVehicleLayoutKey.tire_rear_right(_:);
    unint64_t v67 = 0x800000000016ECE0;
    unint64_t v68 = 0x800000000016D340;
    uint64_t v80 = v21;
    v81 = v5;
    unint64_t v76 = v20;
    v77 = v7;
    uint64_t v24 = v75;
    while (1)
    {
      v87 = v23;
      id v25 = v79 ? (id)sub_14EE60() : *(id *)(v20 + 8 * v22 + 32);
      id v26 = v25;
      id v27 = objc_msgSend(v25, "vehicleLayoutKey", v67, v68);
      uint64_t v28 = sub_14E880();
      uint64_t v30 = v29;

      uint64_t v31 = v86;
      uint64_t v32 = *v85;
      sub_1436CC();
      v32();
      uint64_t v33 = sub_14E0E0();
      uint64_t v35 = v34;
      uint64_t v36 = *v84;
      ((void (*)(char *, uint64_t))*v84)(v24, v31);
      if (v33 == v28 && v35 == v30) {
        break;
      }
      char v38 = sub_1436DC();
      swift_bridgeObjectRelease();
      if (v38)
      {
        swift_bridgeObjectRelease();
LABEL_15:
        char v39 = 0;
LABEL_16:
        unsigned int v40 = v77;
        goto LABEL_17;
      }
      sub_1436CC();
      v32();
      uint64_t v47 = sub_14E0E0();
      uint64_t v49 = v48;
      uint64_t v50 = sub_1436B4();
      v36(v50);
      if (v47 == v28 && v49 == v30)
      {
        sub_1436F8();
        goto LABEL_34;
      }
      char v52 = sub_1436DC();
      swift_bridgeObjectRelease();
      if (v52)
      {
        swift_bridgeObjectRelease();
LABEL_34:
        char v39 = 1;
        unsigned int v40 = v77;
        uint64_t v24 = v75;
        goto LABEL_17;
      }
      sub_1436CC();
      v32();
      uint64_t v53 = sub_14E0E0();
      uint64_t v55 = v54;
      uint64_t v56 = sub_1436B4();
      v36(v56);
      BOOL v57 = v53 == v28 && v55 == v30;
      uint64_t v24 = v75;
      if (v57)
      {
        char v39 = 2;
        sub_1436F8();
        goto LABEL_16;
      }
      char v58 = sub_1436DC();
      swift_bridgeObjectRelease();
      if (v58)
      {
        swift_bridgeObjectRelease();
        char v39 = 2;
        goto LABEL_16;
      }
      sub_1436CC();
      v32();
      uint64_t v59 = sub_14E0E0();
      uint64_t v61 = v60;
      uint64_t v62 = sub_1436B4();
      v36(v62);
      if (v59 == v28 && v61 == v30)
      {
        sub_1436F8();
        char v39 = 3;
        goto LABEL_16;
      }
      char v64 = sub_1436DC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v40 = v77;
      if ((v64 & 1) == 0)
      {
        uint64_t v23 = v87;
        if (qword_1B90A8 != -1) {
          swift_once();
        }
        uint64_t v65 = sub_14E7D0();
        sub_B0E0(v65, (uint64_t)qword_1B9FB8);
        os_log_type_t v66 = sub_14EB50();
        sub_35528(v66, 0x400uLL, 0xD00000000000008BLL, v67, 0x6954726143746567, (void *)0xED00002928736572, 28, 0xD000000000000018, v68);
        char v39 = 4;
        goto LABEL_18;
      }
      char v39 = 3;
LABEL_17:
      uint64_t v23 = v87;
LABEL_18:
      unsigned int v41 = [v26 pressureState];
      if (v41 >= 6) {
        char v42 = 0;
      }
      else {
        char v42 = v41;
      }
      id v43 = [v26 pressure];
      sub_16160(0, &qword_1BE408);
      sub_14C700();

      *unsigned int v40 = v39;
      v40[1] = v42;
      uint64_t v44 = (uint64_t)v81;
      sub_A6DCC((uint64_t)v40, (uint64_t)v81);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v23 = (void *)sub_BBD1C(0, v23[2] + 1, 1, (uint64_t)v23);
      }
      unint64_t v20 = v76;
      unint64_t v46 = v23[2];
      unint64_t v45 = v23[3];
      if (v46 >= v45 >> 1) {
        uint64_t v23 = (void *)sub_BBD1C(v45 > 1, v46 + 1, 1, (uint64_t)v23);
      }
      ++v22;
      v23[2] = v46 + 1;
      sub_143650(v44, (uint64_t)v23+ ((*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80))+ *(void *)(v82 + 72) * v46);

      sub_A6E30((uint64_t)v40);
      if (v80 == v22) {
        goto LABEL_26;
      }
    }
    sub_1436F8();
    goto LABEL_15;
  }
  __break(1u);
}

void sub_14362C()
{
}

uint64_t sub_143650(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarTire();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1436B4()
{
  return v0;
}

uint64_t sub_1436DC()
{
  return sub_14EFC0();
}

uint64_t sub_1436F8()
{
  return swift_bridgeObjectRelease_n();
}

id sub_143710(unint64_t a1)
{
  if ([v1 hasOn]) {
    [v1 setOn:1];
  }
  if ((a1 & 0x8000000000000000) != 0 || a1 >= 0x100)
  {
    sub_8A008();
    id result = (id)sub_14EF00();
    __break(1u);
  }
  else
  {
    return [v1 setFanLevel:a1];
  }
  return result;
}

id sub_1437F8(char a1)
{
  id v3 = [v1 hasOn];
  if (v3) {
    [v1 setOn:a1 & 1];
  }
  return v3;
}

void sub_143850()
{
  id v1 = [v0 fanLevelRange];
  unsigned int v2 = [v1 minimumValue];

  id v3 = [v0 fanLevelRange];
  unsigned int v4 = [v3 maximumValue];

  if (v4 < v2) {
    __break(1u);
  }
}

uint64_t sub_1438E4()
{
  return [v0 fanLevel];
}

void sub_14390C()
{
}

uint64_t sub_143930()
{
  return sub_1438E4();
}

id sub_143954(unint64_t a1)
{
  return sub_143710(a1);
}

unint64_t sub_143978()
{
  return (unint64_t)sub_1437F8(1) & 1;
}

unint64_t sub_1439A4()
{
  return (unint64_t)sub_1437F8(0) & 1;
}

uint64_t sub_1439D0()
{
  sub_14E240();
  swift_allocObject();
  sub_14E230();
  sub_14E1B0();
  swift_release();
  uint64_t v0 = sub_14E190();
  swift_release();
  return v0;
}

uint64_t sub_143A58()
{
  return swift_initClassMetadata2();
}

uint64_t sub_143AA4()
{
  sub_E048();
  v1[24] = v2;
  v1[25] = v0;
  v1[23] = v3;
  sub_E004();
  v1[26] = v4;
  type metadata accessor for UnsupportedValueParameters(0);
  v1[27] = swift_task_alloc();
  sub_6204(&qword_1B9B68);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = type metadata accessor for NoCarKeyMatchParameters(0);
  v1[31] = swift_task_alloc();
  uint64_t v5 = sub_14D340();
  v1[32] = v5;
  v1[33] = *(void *)(v5 - 8);
  v1[34] = swift_task_alloc();
  sub_E054();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_143C04()
{
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void *)(v0 + 200);
  sub_14D5D0();
  uint64_t v5 = (void *)sub_14D5A0();
  *(void *)(v0 + 280) = v5;
  sub_14D5C0();
  uint64_t v6 = sub_14D330();
  uint64_t v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  Swift::UInt64 v9 = *(void *)(v4 + 176);
  if (qword_1B90A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_14E7D0();
  sub_B0E0(v10, (uint64_t)qword_1B9FB8);
  os_log_type_t v11 = sub_14EB50();
  sub_35528(v11, v9, 0xD000000000000088, 0x800000000016ED70, 0xD00000000000002ALL, (void *)0x800000000016EE00, 27, 0, 0);
  id v12 = v5;
  swift_bridgeObjectRetain();
  unsigned __int8 v13 = sub_C408C(v12, v6, v8);
  *(unsigned char *)(v0 + 376) = v13;
  if (v13 > 0xF7u)
  {
    type metadata accessor for CarCommandsError();
    sub_127A4();
    swift_allocError();
    *uint64_t v14 = v6;
    v14[1] = (uint64_t)v8;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    sub_144F88();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_E140();
    sub_34700();
    __asm { BRAA            X1, X16 }
  }
  sub_14D590();
  char v17 = sub_102EA4();
  swift_release();
  if (v17)
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 288) = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
    sub_DCAD4();
    uint64_t v19 = v18;
    sub_14EC50();
    if (v20)
    {
      sub_14E8F0();
      swift_bridgeObjectRelease();
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = 1;
    }
    uint64_t v28 = *(void *)(v0 + 232);
    uint64_t v29 = sub_14E310();
    uint64_t v30 = 1;
    sub_5E9C(v28, v21, 1, v29);
    if (v19)
    {
      sub_14E8F0();
      swift_bridgeObjectRelease();
      uint64_t v30 = 0;
    }
    uint64_t v32 = *(void *)(v0 + 240);
    uint64_t v31 = *(void *)(v0 + 248);
    uint64_t v34 = *(void *)(v0 + 224);
    uint64_t v33 = *(void *)(v0 + 232);
    uint64_t v35 = *(void *)(v0 + 200);
    sub_5E9C(v34, v30, 1, v29);
    uint64_t v36 = v31 + *(int *)(v32 + 24);
    sub_14E8F0();
    sub_5E9C(v36, 0, 1, v29);
    sub_16000(v33, v31);
    sub_16000(v34, v31 + *(int *)(v32 + 20));
    sub_DDFC((void *)(v35 + qword_1C5458), *(void *)(v35 + qword_1C5458 + 24));
    uint64_t v37 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_1440A4;
    sub_34700();
    return sub_1369B4(v38);
  }
  else
  {
    uint64_t v22 = *(void *)(v0 + 216);
    sub_DF10(*(void *)(v0 + 200) + qword_1C5458, v0 + 16);
    sub_DDFC((void *)(v0 + 16), *(void *)(v0 + 40));
    sub_14E8F0();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_14E310();
    sub_5E9C(v22, 0, 1, v23);
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 336) = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_14449C;
    sub_34700();
    return sub_13716C(v25);
  }
}

uint64_t sub_1440A4()
{
  sub_E048();
  sub_DFC0();
  sub_E03C();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 304) = v4;
  *(void *)(v2 + 312) = v0;
  swift_task_dealloc();
  sub_E054();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_144188()
{
  sub_E048();
  uint64_t v1 = *(void *)(v0 + 200) + 184;
  swift_beginAccess();
  sub_DF10(v1, v0 + 96);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_144244;
  sub_144FA8();
  return sub_FE9D4();
}

uint64_t sub_144244()
{
  sub_E048();
  sub_DFC0();
  sub_E03C();
  *uint64_t v3 = v2;
  uint64_t v4 = v2 + 96;
  uint64_t v5 = *v1;
  sub_E03C();
  void *v6 = v5;
  *(void *)(v7 + 328) = v0;
  swift_task_dealloc();
  sub_DDAC(v4);
  sub_E054();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_144330()
{
  sub_116AC();
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 248);

  sub_144F08(v2, type metadata accessor for NoCarKeyMatchParameters);
  sub_144F68();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v3();
}

uint64_t sub_1443E4()
{
  sub_E0BC();
  uint64_t v2 = *(void **)(v0 + 280);
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 248);

  sub_144F08(v3, type metadata accessor for NoCarKeyMatchParameters);
  sub_144F88();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_14449C()
{
  sub_E0BC();
  uint64_t v2 = *v1;
  sub_E03C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_E03C();
  void *v6 = v5;
  *(void *)(v8 + 344) = v7;
  *(void *)(v8 + 352) = v0;
  swift_task_dealloc();
  sub_144F08(*(void *)(v2 + 216), type metadata accessor for UnsupportedValueParameters);
  sub_E054();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_1445DC()
{
  sub_E0BC();
  uint64_t v1 = *(void *)(v0 + 200);
  sub_DDAC(v0 + 16);
  swift_beginAccess();
  sub_DF10(v1 + 184, v0 + 56);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1446AC;
  sub_144FA8();
  return sub_FE9D4();
}

uint64_t sub_1446AC()
{
  sub_E048();
  sub_DFC0();
  sub_E03C();
  *uint64_t v3 = v2;
  uint64_t v4 = v2 + 56;
  uint64_t v5 = *v1;
  sub_E03C();
  void *v6 = v5;
  *(void *)(v7 + 368) = v0;
  swift_task_dealloc();
  sub_DDAC(v4);
  sub_E054();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_144798()
{
  sub_116AC();

  sub_DDAC(v0 + 16);
  sub_144F68();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v1();
}

uint64_t sub_144834()
{
  sub_E0BC();
  uint64_t v1 = *(void **)(v0 + 280);

  sub_144F88();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1448C8()
{
  sub_116AC();
  uint64_t v2 = *(void **)(v0 + 280);
  uint64_t v1 = *(void **)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 248);

  sub_144F08(v3, type metadata accessor for NoCarKeyMatchParameters);
  sub_144F68();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v4();
}

uint64_t sub_144984()
{
  sub_116AC();
  uint64_t v1 = *(void **)(v0 + 344);

  sub_144F68();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v2();
}

uint64_t sub_144A1C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_E004();
  *(void *)(v1 + 24) = v2;
  sub_E054();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_144A50()
{
  sub_E048();
  sub_14D5D0();
  uint64_t v1 = sub_14D5A0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_144ABC()
{
  sub_DDAC(v0 + qword_1C5458);

  return swift_release();
}

uint64_t sub_144AFC()
{
  uint64_t v0 = sub_36DFC();
  sub_DDAC(v0 + qword_1C5458);
  swift_release();
  return v0;
}

uint64_t sub_144B44()
{
  uint64_t v0 = sub_144AFC();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t type metadata accessor for CommonUnsupportedValueFlowStrategy()
{
  return sub_11500();
}

uint64_t sub_144BB0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2F2E0;
  return sub_143AA4();
}

uint64_t sub_144C5C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_37F24;
  return sub_144A1C(a1);
}

uint64_t sub_144CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for CommonUnsupportedValueFlowStrategy();
  void *v8 = v4;
  v8[1] = sub_2F2E0;
  return UnsupportedValueFlowStrategyAsync.makeLaunchAppWithIntentOutput(resolveRecord:)(a1, a2, v9, a4);
}

uint64_t sub_144DC8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  type metadata accessor for CommonUnsupportedValueFlowStrategy();
  swift_getWitnessTable();
  *uint64_t v1 = v0;
  v1[1] = sub_2EFFC;
  return sub_A9C34();
}

uint64_t sub_144ECC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_144F08(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_144F68()
{
  return swift_task_dealloc();
}

uint64_t sub_144F88()
{
  return swift_task_dealloc();
}

uint64_t sub_144FA8()
{
  return *(void *)(v0 + 184);
}

uint64_t type metadata accessor for CarCommandsSetCarPlayClimateSyncCATsSimple()
{
  uint64_t result = qword_1C46B0;
  if (!qword_1C46B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_145004()
{
  return swift_initClassMetadata2();
}

uint64_t sub_145044(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return _swift_task_switch(sub_145068, 0, 0);
}

uint64_t sub_145068()
{
  char v1 = *(unsigned char *)(v0 + 48);
  sub_6204(&qword_1B9E28);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000011;
  *(void *)(v2 + 40) = 0x800000000016EEC0;
  *(void *)(v2 + 72) = &type metadata for Bool;
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v5 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:)
                                                                           + async function pointer to dispatch thunk of CATWrapperSimple.execute(catId:parameters:));
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_150DE0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_42FC0;
  return v5(0xD00000000000003DLL, 0x800000000016EE80, v2);
}

uint64_t sub_145190(uint64_t a1, uint64_t a2)
{
  return sub_1451E4(a1, a2);
}

uint64_t sub_1451E4(uint64_t a1, uint64_t a2)
{
  sub_14E3B0();
  sub_659C();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_65BC();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_6204(&qword_1B9290);
  __chkstk_darwin(v11 - 8);
  sub_65BC();
  sub_6248(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_14E320();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_62B0(a1);
  return v14;
}

uint64_t sub_145310(uint64_t a1, uint64_t a2)
{
  sub_14E3B0();
  sub_659C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_65BC();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_14E330();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_1453EC()
{
  return type metadata accessor for CarCommandsSetCarPlayClimateSyncCATsSimple();
}

uint64_t sub_1453F4()
{
  uint64_t v0 = type metadata accessor for CarCommandsError();
  __chkstk_darwin(v0);
  uint64_t v2 = (uint64_t *)((char *)v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0) + 24);
  uint64_t v3 = sub_14D720();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 24;
  sub_14D6C0();
  sub_8F34((uint64_t)v6, (uint64_t)&_swiftEmptySetSingleton, v34);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v34[3])
  {
    sub_6204(&qword_1B96D8);
    sub_6204(&qword_1B96E0);
    if (swift_dynamicCast())
    {
      if (*((void *)&v36 + 1))
      {
        sub_DE9C(&v35, (uint64_t)v38);
        uint64_t v7 = v39;
        uint64_t v8 = v40;
        sub_DDFC(v38, v39);
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8))
        {
          sub_6204(&qword_1B9B58);
          uint64_t v9 = (void *)sub_14D400();
          unsigned __int8 v10 = [v9 signals];

          if ((v10 & 2) != 0)
          {
            *uint64_t v2 = 0xD000000000000056;
            v2[1] = 0x800000000016EFD0;
            swift_storeEnumTagMultiPayload();
            sub_127A4();
            swift_allocError();
            sub_4E1E0((uint64_t)v2, v28);
            if (qword_1B90A8 != -1) {
              swift_once();
            }
            uint64_t v29 = sub_14E7D0();
            sub_B0E0(v29, (uint64_t)qword_1B9FB8);
            os_log_type_t v30 = sub_14EB50();
            swift_getErrorValue();
            uint64_t v31 = sub_14F020();
            sub_35528(v30, 0x80uLL, 0xD000000000000099, 0x800000000016EF30, 0xD000000000000024, (void *)0x800000000015F0F0, 36, v31, v32);
            swift_bridgeObjectRelease();
            swift_errorRelease();
            sub_14CFC0();
            sub_5388C((uint64_t)v2);
          }
          else
          {
            sub_14CFD0();
          }
        }
        else
        {
          if (qword_1B90A8 != -1) {
            swift_once();
          }
          uint64_t v20 = sub_14E7D0();
          sub_B0E0(v20, (uint64_t)qword_1B9FB8);
          sub_14EB50();
          sub_146798();
          sub_35528(v21, v22, v23, v24, v25, v26, 29, v27, 0x800000000015F150);
          sub_14CFC0();
        }
        return sub_DDAC((uint64_t)v38);
      }
    }
    else
    {
      uint64_t v37 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
    }
  }
  else
  {
    sub_DEB4((uint64_t)v34, &qword_1B96C8);
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v37 = 0;
  }
  sub_DEB4((uint64_t)&v35, &qword_1B96D0);
  if (qword_1B90A8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_14E7D0();
  sub_B0E0(v11, (uint64_t)qword_1B9FB8);
  sub_14EB50();
  sub_146798();
  sub_35528(v12, v13, v14, v15, v16, v17, 24, v18, 0x800000000015F120);
  return sub_14CFE0();
}

uint64_t sub_1458C8()
{
  sub_E048();
  v1[11] = v2;
  v1[12] = v0;
  v1[10] = v3;
  sub_14E3B0();
  v1[13] = swift_task_alloc();
  uint64_t v4 = sub_14D170();
  v1[14] = v4;
  v1[15] = *(void *)(v4 - 8);
  v1[16] = swift_task_alloc();
  sub_6204(&qword_1B9B68);
  v1[17] = swift_task_alloc();
  return _swift_task_switch(sub_1459E4, 0, 0);
}

uint64_t sub_1459E4()
{
  Swift::UInt64 v1 = *(void *)(v0[12] + 176);
  if (qword_1B90A8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_14E7D0();
  sub_B0E0(v2, (uint64_t)qword_1B9FB8);
  os_log_type_t v3 = sub_14EB50();
  sub_35528(v3, v1, 0xD000000000000099, 0x800000000016EF30, 0xD00000000000002DLL, (void *)0x800000000015F220, 44, 0, 0);
  sub_6204(&qword_1B9B58);
  uint64_t v4 = (void *)sub_14D400();
  v0[18] = v4;
  id v5 = [v4 carName];
  if (v5)
  {
    uint64_t v6 = v5;
    sub_8C928();

    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }
  uint64_t v8 = v0[17];
  uint64_t v9 = sub_14E310();
  sub_5E9C(v8, v7, 1, v9);
  sub_10F18C();
  sub_DD354();
  sub_14D0E0();
  type metadata accessor for CarCommandsActivateSignalCATsSimple();
  sub_14E3A0();
  v0[19] = sub_14E340();
  unsigned __int8 v10 = (void *)swift_task_alloc();
  v0[20] = v10;
  *unsigned __int8 v10 = v0;
  v10[1] = sub_145BE0;
  return sub_3179C();
}

uint64_t sub_145BE0()
{
  sub_E048();
  sub_DFC0();
  uint64_t v2 = *v1;
  sub_E02C();
  *os_log_type_t v3 = v2;
  *(void *)(v5 + 168) = v4;
  *(void *)(v5 + 176) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v6 = sub_145F7C;
  }
  else {
    uint64_t v6 = sub_145CE4;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_145CE4()
{
  uint64_t v1 = *(void *)(v0 + 96);
  type metadata accessor for ConfirmationSnippetFactory();
  swift_beginAccess();
  sub_DF10(v1 + 184, v0 + 16);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_145DCC;
  return sub_12A9F0();
}

uint64_t sub_145DCC()
{
  sub_E048();
  sub_DFC0();
  uint64_t v3 = v2 + 16;
  uint64_t v4 = *v1;
  sub_E02C();
  *uint64_t v5 = v4;
  *(void *)(v6 + 192) = v0;
  swift_task_dealloc();
  sub_DDAC(v3);
  if (v0) {
    uint64_t v7 = sub_146030;
  }
  else {
    uint64_t v7 = sub_145EBC;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_145EBC()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_DEB4(v1, &qword_1B9B68);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v6();
}

uint64_t sub_145F7C()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_DEB4(v1, &qword_1B9B68);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v5();
}

uint64_t sub_146030()
{
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_DEB4(v1, &qword_1B9B68);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E140();
  return v6();
}

uint64_t sub_1460F4()
{
  return sub_DDAC(v0 + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin39ActivateSignalConfirmIntentFlowStrategy_commonPatterns);
}

uint64_t sub_146104()
{
  uint64_t v0 = sub_36DFC();
  sub_DDAC(v0 + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin39ActivateSignalConfirmIntentFlowStrategy_commonPatterns);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_146178()
{
  return type metadata accessor for ActivateSignalConfirmIntentFlowStrategy();
}

uint64_t type metadata accessor for ActivateSignalConfirmIntentFlowStrategy()
{
  uint64_t result = qword_1C4730;
  if (!qword_1C4730) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1461C8()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_14620C()
{
  return sub_1453F4();
}

uint64_t sub_146230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1B9B50 + dword_1B9B50);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_11538;
  return v9(a1, a2, a3);
}

uint64_t sub_1462FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_11538;
  return sub_1458C8();
}

uint64_t sub_1463A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for ActivateSignalConfirmIntentFlowStrategy();
  void *v8 = v4;
  v8[1] = sub_11538;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnEmptyParse(confirmParameters:)(a1, a2, v9, a4);
}

uint64_t sub_146470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for ActivateSignalConfirmIntentFlowStrategy();
  void *v8 = v4;
  v8[1] = sub_11538;
  return ConfirmIntentFlowStrategyAsync.makeRepromptOnLowConfidence(confirmParameters:)(a1, a2, v9, a4);
}

uint64_t sub_146538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for ActivateSignalConfirmIntentFlowStrategy();
  void *v8 = v4;
  v8[1] = sub_11538;
  return ConfirmIntentFlowStrategyAsync.makeConfirmationRejectedResponse(confirmParameters:)(a1, a2, v9, a4);
}

uint64_t sub_146600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for ActivateSignalConfirmIntentFlowStrategy();
  void *v8 = v4;
  v8[1] = sub_10EC8;
  return ConfirmIntentFlowStrategyAsync.makeFlowCancelledResponse(confirmParameters:)(a1, a2, v9, a4);
}

uint64_t sub_1466C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for ActivateSignalConfirmIntentFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_11538;
  return ConfirmIntentFlowStrategyAsync.makeErrorResponse(error:confirmParameters:)(a1, a2, a3, v11, a5);
}

uint64_t sub_1467B4@<X0>(uint64_t a1@<X8>)
{
  id v3 = [v1 itemToConfirm];
  sub_14ECD0();
  swift_unknownObjectRelease();
  if (swift_dynamicCast())
  {
    sub_14E8F0();
    swift_bridgeObjectRelease();
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  uint64_t v5 = sub_14E310();
  return sub_5E9C(a1, v4, 1, v5);
}

uint64_t sub_146870@<X0>(uint64_t a1@<X8>)
{
  return sub_1467B4(a1);
}

uint64_t CAFRecirculation.isActivated()()
{
  *(void *)(v1 + 16) = v0;
  return sub_E060((uint64_t)sub_1468AC);
}

uint64_t sub_1468AC()
{
  sub_E048();
  id v1 = [*(id *)(v0 + 16) on];
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_146914(char a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_12A0C;
  return CAFRecirculation.setActivated(_:)(a1);
}

uint64_t sub_1469AC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_102C90;
  return CAFRecirculation.isActivated()();
}

uint64_t sub_146A3C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_34154;
  return CAFRecirculation.isConnected()();
}

unint64_t sub_146AC8(char a1)
{
  uint64_t v2 = 2;
  uint64_t v3 = 0;
  switch(a1)
  {
    case 1:
      uint64_t v2 = 16;
      return sub_146B54(v2);
    case 2:
      uint64_t v2 = 4;
      return sub_146B54(v2);
    case 3:
      uint64_t v2 = 6;
      return sub_146B54(v2);
    case 4:
      uint64_t v2 = 20;
      return sub_146B54(v2);
    case 5:
      return v3;
    default:
      return sub_146B54(v2);
  }
}

unint64_t sub_146B54(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)NSNumber) initWithUnsignedLongLong:a1];
  id v3 = [v1 combinations];
  sub_7AC28();
  unint64_t v4 = sub_14E9E0();

  unint64_t v5 = sub_146CD0((uint64_t)v2, v4);
  swift_bridgeObjectRelease();
  return v5;
}

id sub_146BFC(unint64_t a1)
{
  [v1 setOn:1];
  if ((a1 & 0x8000000000000000) != 0 || HIDWORD(a1))
  {
    sub_8A008();
    id result = (id)sub_14EF00();
    __break(1u);
  }
  else
  {
    return [v1 setCurrentIndex:a1];
  }
  return result;
}

unint64_t sub_146CD0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_21;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  if (!v3) {
    return 0;
  }
  while (1)
  {
    sub_127834(0, (a2 & 0xC000000000000001) == 0, a2);
    id v4 = (a2 & 0xC000000000000001) != 0 ? (id)sub_14EE60() : *(id *)(a2 + 32);
    unint64_t v5 = v4;
    sub_7AC28();
    char v6 = sub_14EC40();

    if (v6) {
      return 0;
    }
    for (uint64_t i = 0; ; ++i)
    {
      unint64_t v7 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if (v7 == v3) {
        return 0;
      }
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v9 = (id)sub_14EE60();
      }
      else
      {
        if ((v7 & 0x8000000000000000) != 0) {
          goto LABEL_19;
        }
        if (v7 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
          goto LABEL_20;
        }
        id v9 = *(id *)(a2 + 32 + 8 * v7);
      }
      uint64_t v10 = v9;
      char v11 = sub_14EC40();

      if (v11) {
        return v7;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_14EF20();
    swift_bridgeObjectRelease();
    if (!v3) {
      return 0;
    }
  }
}

unint64_t sub_146E5C(char a1)
{
  return sub_146AC8(a1);
}

id sub_146E84(unint64_t a1)
{
  return sub_146BFC(a1);
}

uint64_t sub_146EAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  sub_149D4C(v14);
  uint64_t v3 = type metadata accessor for WalletPassLibrary();
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 32) = 0u;
  *(void *)(v4 + 48) = 0;
  *(_OWORD *)(v4 + 16) = 0u;
  sub_14C6B4();
  sub_F62C0((uint64_t)v14, v4 + 16);
  swift_endAccess();
  v14[3] = v3;
  v14[4] = (uint64_t)&off_1AC658;
  v14[0] = v4;
  uint64_t v5 = type metadata accessor for WalletService();
  uint64_t v6 = swift_allocObject();
  sub_2F238((uint64_t)v14, v3);
  sub_11590();
  __chkstk_darwin(v7);
  sub_14C604();
  (*(void (**)(uint64_t *))(v8 + 16))(v1);
  uint64_t v9 = *v1;
  uint64_t v12 = v3;
  uint64_t v13 = &off_1AC658;
  *(void *)&long long v11 = v9;
  *(_OWORD *)(v6 + 32) = 0u;
  *(void *)(v6 + 48) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  sub_14C6B4();
  swift_retain();
  sub_F62C0((uint64_t)v15, v6 + 16);
  swift_endAccess();
  sub_DE9C(&v11, v6 + 56);
  sub_DDAC((uint64_t)v14);
  uint64_t result = swift_release();
  a1[3] = v5;
  a1[4] = (uint64_t)&off_1AAFA8;
  *a1 = v6;
  return result;
}

void sub_147050()
{
  sub_DEF50();
  sub_14C4C4(v1, v2);
  sub_14C698();
  uint64_t v3 = sub_16160(0, &qword_1C4F28);
  sub_14C3E4(v3);
  sub_14C42C();
  sub_6204(&qword_1C4F30);
  sub_42194();
  sub_14C584();
  sub_11590();
  __chkstk_darwin(v4);
  uint64_t v6 = sub_14BFCC(v5, v37);
  v7(v6);
  uint64_t v11 = sub_14C654(*v0, v8, v9, v10, &qword_1C4FA0);
  sub_14BFF8(v11);
  sub_6FBE8(&qword_1C4F38, &qword_1C4F30);
  sub_14C408();
  sub_14C18C();
  sub_6204(&qword_1BA578);
  sub_14C398();
  sub_14D730();
  uint64_t v50 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v40 = sub_14C30C();
  *(unsigned char *)(sub_6FE88() + 16) = 0;
  sub_6204(&qword_1C4F40);
  sub_42194();
  uint64_t v12 = sub_14C248();
  sub_6FEB8(v12);
  sub_6FBE8(&qword_1C4F48, &qword_1C4F40);
  sub_14C61C();
  sub_14BEE4();
  sub_14C33C();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v13 = sub_6FE88();
  sub_14C3D8(v13);
  sub_6204(&qword_1C4F50);
  sub_42194();
  uint64_t v14 = sub_14C2BC();
  sub_6FEB8(v14);
  sub_6FBE8(&qword_1C4F58, &qword_1C4F50);
  sub_14C100();
  sub_14BEE4();
  sub_14C564();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v15 = sub_6FE88();
  sub_14C3D8(v15);
  sub_6204(&qword_1C4F60);
  uint64_t v16 = sub_42194();
  sub_14C294(v16, v17, v18, v19, v20, v16, (uint64_t)&qword_1C5228, v21, (uint64_t)&off_1A7FA8, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_14BE7C(v22);
  sub_6FBE8(&qword_1C4F68, &qword_1C4F60);
  sub_14C11C();
  sub_14BEE4();
  sub_14C0E4();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v23 = sub_6FE88();
  sub_14C3D8(v23);
  sub_6204(&qword_1C4F70);
  uint64_t v24 = sub_42194();
  sub_14C2E4(v24, v25, v26, v27, v28, v24, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v36, v39, v41, v43, v45, v47, v49, v51, v53, v55,
    v57,
    v59);
  sub_6FEB8(v29);
  sub_6FBE8(&qword_1C4F78, &qword_1C4F70);
  sub_14C154();
  sub_14BEE4();
  sub_14C544();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4F80);
  uint64_t v30 = sub_14C670();
  uint64_t v31 = sub_14C138(v30);
  sub_6FEB8(v31);
  sub_6FBE8(&qword_1C4F88, &qword_1C4F80);
  sub_14C638();
  sub_14BEE4();
  sub_14C504();
  sub_14C45C();
  sub_6204(&qword_1C4F90);
  uint64_t v32 = sub_42194();
  *(unsigned char *)(v32 + qword_1C5060) = 0;
  sub_14C444(v32, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v33 = sub_6FE88();
  sub_14BE50(v33);
  sub_14BF00(v34);
  sub_6FBE8(&qword_1C4F98, &qword_1C4F90);
  sub_14C4A4();
  sub_14BEE4();
  sub_14C524();
  sub_DEF10();
}

void sub_1474F4()
{
  sub_DEF50();
  sub_14C018(v2, v3);
  sub_14E6E0();
  sub_14C68C();
  uint64_t v4 = sub_14E740();
  sub_14C078(v4);
  sub_14C42C();
  sub_6204(&qword_1C4EB0);
  sub_42194();
  sub_14C274();
  sub_11590();
  __chkstk_darwin(v5);
  uint64_t v7 = sub_14BEB8(v6, v36);
  v8(v7);
  uint64_t v9 = sub_14B49C(*v1, v0, (void (*)(void))&type metadata accessor for SetTrunkStatusIntent, &qword_1C4F20);
  sub_14BFF8(v9);
  sub_6FBE8(&qword_1C4EB8, &qword_1C4EB0);
  sub_14C0C0();
  sub_14C18C();
  sub_6204(&qword_1BDFE0);
  sub_14C09C();
  sub_14D730();
  uint64_t v49 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v39 = sub_14C30C();
  uint64_t v10 = sub_6FE88();
  sub_14C5F8(v10);
  sub_6204(&qword_1C4EC0);
  sub_42194();
  uint64_t v11 = sub_14BF28();
  sub_6FEB8(v11);
  sub_6FBE8(&qword_1C4EC8, &qword_1C4EC0);
  sub_14C360();
  sub_14BE18();
  sub_14C030();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v12 = sub_6FE88();
  sub_6FEDC(v12);
  sub_6204(&qword_1C4ED0);
  sub_42194();
  uint64_t v13 = sub_14BF7C();
  sub_6FEB8(v13);
  sub_6FBE8(&qword_1C4ED8, &qword_1C4ED0);
  sub_14C100();
  sub_14BE18();
  sub_14C1C8();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v14 = sub_6FE88();
  sub_6FEDC(v14);
  sub_6204(&qword_1C4EE0);
  uint64_t v15 = sub_42194();
  sub_14BF54(v15, v16, v17, v18, v19, v15, (uint64_t)&qword_1C5228, v20, (uint64_t)&off_1A7FA8, v34, v37, v39, v41, v43, v45, v47, v49, v51, v53,
    v55,
    v57);
  sub_14BE7C(v21);
  sub_6FBE8(&qword_1C4EE8, &qword_1C4EE0);
  sub_14C11C();
  sub_14BE18();
  sub_14C054();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v22 = sub_6FE88();
  sub_6FEDC(v22);
  sub_6204(&qword_1C4EF0);
  uint64_t v23 = sub_42194();
  sub_14BFA4(v23, v24, v25, v26, v27, v23, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_6FEB8(v28);
  sub_6FBE8(&qword_1C4EF8, &qword_1C4EF0);
  sub_14C154();
  sub_14BE18();
  sub_14C228();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4F00);
  uint64_t v29 = sub_14C3BC();
  uint64_t v30 = sub_14C138(v29);
  sub_6FEB8(v30);
  sub_6FBE8(&qword_1C4F08, &qword_1C4F00);
  sub_14C37C();
  sub_14BE18();
  sub_14C1E8();
  sub_14C45C();
  sub_6204(&qword_1C4F10);
  uint64_t v31 = sub_42194();
  *(unsigned char *)(v31 + qword_1C5060) = 0;
  sub_14C444(v31, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v32 = sub_6FE88();
  sub_14BE50(v32);
  sub_14BF00(v33);
  sub_6FBE8(&qword_1C4F18, &qword_1C4F10);
  sub_14C1A8();
  sub_14BE18();
  sub_14C208();
  sub_DEF10();
}

void sub_147980()
{
  sub_DEF50();
  sub_14C018(v2, v3);
  sub_14E6D0();
  sub_14C68C();
  uint64_t v4 = sub_14E720();
  sub_14C078(v4);
  sub_14C42C();
  sub_6204(&qword_1C4E38);
  sub_42194();
  sub_14C274();
  sub_11590();
  __chkstk_darwin(v5);
  uint64_t v7 = sub_14BEB8(v6, v36);
  v8(v7);
  uint64_t v9 = sub_14B49C(*v1, v0, (void (*)(void))&type metadata accessor for GetTrunkStatusIntent, &qword_1C4EA8);
  sub_14BFF8(v9);
  sub_6FBE8(&qword_1C4E40, &qword_1C4E38);
  sub_14C0C0();
  sub_14C18C();
  sub_6204(&qword_1BE888);
  sub_14C09C();
  sub_14D730();
  uint64_t v49 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v39 = sub_14C30C();
  uint64_t v10 = sub_6FE88();
  sub_14C5F8(v10);
  sub_6204(&qword_1C4E48);
  sub_42194();
  uint64_t v11 = sub_14BF28();
  sub_6FEB8(v11);
  sub_6FBE8(&qword_1C4E50, &qword_1C4E48);
  sub_14C360();
  sub_14BE18();
  sub_14C030();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v12 = sub_6FE88();
  sub_6FEDC(v12);
  sub_6204(&qword_1C4E58);
  sub_42194();
  uint64_t v13 = sub_14BF7C();
  sub_6FEB8(v13);
  sub_6FBE8(&qword_1C4E60, &qword_1C4E58);
  sub_14C100();
  sub_14BE18();
  sub_14C1C8();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v14 = sub_6FE88();
  sub_6FEDC(v14);
  sub_6204(&qword_1C4E68);
  uint64_t v15 = sub_42194();
  sub_14BF54(v15, v16, v17, v18, v19, v15, (uint64_t)&qword_1C5228, v20, (uint64_t)&off_1A7FA8, v34, v37, v39, v41, v43, v45, v47, v49, v51, v53,
    v55,
    v57);
  sub_14BE7C(v21);
  sub_6FBE8(&qword_1C4E70, &qword_1C4E68);
  sub_14C11C();
  sub_14BE18();
  sub_14C054();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v22 = sub_6FE88();
  sub_6FEDC(v22);
  sub_6204(&qword_1C4E78);
  uint64_t v23 = sub_42194();
  sub_14BFA4(v23, v24, v25, v26, v27, v23, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_6FEB8(v28);
  sub_6FBE8(&qword_1C4E80, &qword_1C4E78);
  sub_14C154();
  sub_14BE18();
  sub_14C228();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4E88);
  uint64_t v29 = sub_14C3BC();
  uint64_t v30 = sub_14C138(v29);
  sub_6FEB8(v30);
  sub_6FBE8(&qword_1C4E90, &qword_1C4E88);
  sub_14C37C();
  sub_14BE18();
  sub_14C1E8();
  sub_14C45C();
  sub_6204(&qword_1C4E98);
  uint64_t v31 = sub_42194();
  *(unsigned char *)(v31 + qword_1C5060) = 0;
  sub_14C444(v31, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v32 = sub_6FE88();
  sub_14BE50(v32);
  sub_14BF00(v33);
  sub_6FBE8(&qword_1C4EA0, &qword_1C4E98);
  sub_14C1A8();
  sub_14BE18();
  sub_14C208();
  sub_DEF10();
}

uint64_t sub_147E0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v38 = a1;
  sub_14E6F0();
  uint64_t v39 = sub_14E760();
  sub_14CC80();
  sub_DF10(a3, (uint64_t)&v48);
  sub_6204(&qword_1C4B58);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = sub_2F238((uint64_t)&v48, v49);
  __chkstk_darwin(v7);
  uint64_t v9 = (uint64_t *)((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_14B49C(*v9, v6, (void (*)(void))&type metadata accessor for DeactivateSignalIntent, &qword_1C4BC8);
  sub_DDAC((uint64_t)&v48);
  *(void *)&long long v48 = v11;
  sub_6FBE8(&qword_1C4B60, &qword_1C4B58);
  sub_14CB80();
  swift_release();
  uint64_t v12 = sub_6204(&qword_1C4B40);
  sub_14CC10();
  sub_14D730();
  uint64_t v40 = type metadata accessor for FeatureFlagHelper();
  swift_allocObject();
  sub_14D190();
  swift_allocObject();
  sub_14D180();
  uint64_t v35 = type metadata accessor for SnippetManager();
  *(unsigned char *)(swift_allocObject() + 16) = 0;
  sub_6204(&qword_1C4B68);
  swift_allocObject();
  *(void *)&long long v48 = sub_14B59C();
  sub_6FBE8(&qword_1C4B70, &qword_1C4B68);
  sub_14CBA0();
  swift_release();
  uint64_t v36 = a4;
  uint64_t v37 = v12;
  sub_14CC50();
  sub_14D730();
  swift_allocObject();
  swift_allocObject();
  sub_14D180();
  *(unsigned char *)(swift_allocObject() + 16) = 0;
  sub_6204(&qword_1C4B78);
  swift_allocObject();
  *(void *)&long long v48 = sub_14B744();
  sub_6FBE8(&qword_1C4B80, &qword_1C4B78);
  sub_14CBB0();
  swift_release();
  sub_14CC60();
  sub_14D730();
  sub_DF10((uint64_t)&v48, (uint64_t)v45);
  uint64_t v13 = swift_allocObject();
  swift_allocObject();
  uint64_t v14 = v38;
  swift_retain();
  uint64_t v15 = sub_14D180();
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = 0;
  sub_6204(&qword_1C4B88);
  uint64_t v17 = swift_allocObject();
  sub_14B1BC((uint64_t)v45, v13, v41, v15, v16, v17, (uint64_t)&qword_1C5228, (uint64_t)&qword_1C5230, (uint64_t)&off_1A7FA8, v32, v34, v35, v36, v37, v38, v39, v40, v41, v42,
    v43,
    v44);
  uint64_t v19 = v18;
  sub_DDAC((uint64_t)&v48);
  uint64_t v20 = (uint64_t *)(v19 + qword_1C5230);
  *uint64_t v20 = v14;
  v20[1] = (uint64_t)&off_1A7FA8;
  swift_release();
  *(void *)&long long v48 = v19;
  sub_6FBE8(&qword_1C4B90, &qword_1C4B88);
  sub_14CB50();
  swift_release();
  sub_14CBF0();
  sub_14D730();
  uint64_t v21 = swift_allocObject();
  swift_allocObject();
  uint64_t v22 = sub_14D180();
  uint64_t v23 = swift_allocObject();
  *(unsigned char *)(v23 + 16) = 0;
  sub_6204(&qword_1C4B98);
  uint64_t v24 = swift_allocObject();
  sub_14B1BC((uint64_t)&v48, v21, v41, v22, v23, v24, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42,
    v43,
    v44);
  *(void *)&long long v48 = v25;
  sub_6FBE8(&qword_1C4BA0, &qword_1C4B98);
  sub_14CBE0();
  swift_release();
  sub_14CC40();
  sub_14D730();
  swift_allocObject();
  uint64_t v26 = sub_14D180();
  sub_6204(&qword_1C4BA8);
  uint64_t v27 = swift_allocObject();
  *(void *)&long long v48 = sub_14B9C0(&v48, v26, v27);
  sub_6FBE8(&qword_1C4BB0, &qword_1C4BA8);
  sub_14CB90();
  swift_release();
  sub_14CC30();
  sub_14D730();
  sub_6204(&qword_1C4BB8);
  uint64_t v28 = swift_allocObject();
  uint64_t v46 = &type metadata for TCCTemplatesProvider;
  uint64_t v47 = &off_1A7A50;
  *(unsigned char *)(v28 + qword_1C5060) = 0;
  sub_DF10((uint64_t)v45, v28 + qword_1C5068);
  sub_DF10((uint64_t)&v48, (uint64_t)&v42);
  swift_allocObject();
  swift_allocObject();
  sub_14D180();
  *(unsigned char *)(swift_allocObject() + 16) = 0;
  sub_14AD84();
  uint64_t v30 = v29;
  sub_DDAC((uint64_t)&v48);
  sub_DDAC((uint64_t)v45);
  *(void *)&long long v48 = v30;
  sub_6FBE8(&qword_1C4BC0, &qword_1C4BB8);
  sub_14CBC0();
  swift_release();
  return sub_14CC70();
}

void sub_148660()
{
  sub_DEF50();
  sub_14C018(v2, v3);
  sub_14E770();
  sub_14C68C();
  uint64_t v4 = sub_14E7B0();
  sub_14C078(v4);
  sub_14C42C();
  sub_6204(&qword_1C4CC0);
  sub_42194();
  sub_14C274();
  sub_11590();
  __chkstk_darwin(v5);
  uint64_t v7 = sub_14BEB8(v6, v36);
  v8(v7);
  uint64_t v9 = sub_14B49C(*v1, v0, (void (*)(void))&type metadata accessor for GetSignalActivationStatusIntent, &qword_1C4D30);
  sub_14BFF8(v9);
  sub_6FBE8(&qword_1C4CC8, &qword_1C4CC0);
  sub_14C0C0();
  sub_14C18C();
  sub_6204(&qword_1C03A8);
  sub_14C09C();
  sub_14D730();
  uint64_t v49 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v39 = sub_14C30C();
  uint64_t v10 = sub_6FE88();
  sub_14C5F8(v10);
  sub_6204(&qword_1C4CD0);
  sub_42194();
  uint64_t v11 = sub_14BF28();
  sub_6FEB8(v11);
  sub_6FBE8(&qword_1C4CD8, &qword_1C4CD0);
  sub_14C360();
  sub_14BE18();
  sub_14C030();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v12 = sub_6FE88();
  sub_6FEDC(v12);
  sub_6204(&qword_1C4CE0);
  sub_42194();
  uint64_t v13 = sub_14BF7C();
  sub_6FEB8(v13);
  sub_6FBE8(&qword_1C4CE8, &qword_1C4CE0);
  sub_14C100();
  sub_14BE18();
  sub_14C1C8();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v14 = sub_6FE88();
  sub_6FEDC(v14);
  sub_6204(&qword_1C4CF0);
  uint64_t v15 = sub_42194();
  sub_14BF54(v15, v16, v17, v18, v19, v15, (uint64_t)&qword_1C5228, v20, (uint64_t)&off_1A7FA8, v34, v37, v39, v41, v43, v45, v47, v49, v51, v53,
    v55,
    v57);
  sub_14BE7C(v21);
  sub_6FBE8(&qword_1C4CF8, &qword_1C4CF0);
  sub_14C11C();
  sub_14BE18();
  sub_14C054();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v22 = sub_6FE88();
  sub_6FEDC(v22);
  sub_6204(&qword_1C4D00);
  uint64_t v23 = sub_42194();
  sub_14BFA4(v23, v24, v25, v26, v27, v23, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_6FEB8(v28);
  sub_6FBE8(&qword_1C4D08, &qword_1C4D00);
  sub_14C154();
  sub_14BE18();
  sub_14C228();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4D10);
  uint64_t v29 = sub_14C3BC();
  uint64_t v30 = sub_14C138(v29);
  sub_6FEB8(v30);
  sub_6FBE8(&qword_1C4D18, &qword_1C4D10);
  sub_14C37C();
  sub_14BE18();
  sub_14C1E8();
  sub_14C45C();
  sub_6204(&qword_1C4D20);
  uint64_t v31 = sub_42194();
  *(unsigned char *)(v31 + qword_1C5060) = 0;
  sub_14C444(v31, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v32 = sub_6FE88();
  sub_14BE50(v32);
  sub_14BF00(v33);
  sub_6FBE8(&qword_1C4D28, &qword_1C4D20);
  sub_14C1A8();
  sub_14BE18();
  sub_14C208();
  sub_DEF10();
}

void sub_148AEC()
{
  sub_DEF50();
  sub_14C4C4(v1, v2);
  sub_14C698();
  uint64_t v3 = sub_16160(0, &qword_1C4D38);
  sub_14C3E4(v3);
  sub_14C42C();
  sub_6204(&qword_1C4D40);
  sub_42194();
  sub_14C584();
  sub_11590();
  __chkstk_darwin(v4);
  uint64_t v6 = sub_14BFCC(v5, v37);
  v7(v6);
  uint64_t v11 = sub_14C654(*v0, v8, v9, v10, &qword_1C4DB0);
  sub_14BFF8(v11);
  sub_6FBE8(&qword_1C4D48, &qword_1C4D40);
  sub_14C408();
  sub_14C18C();
  sub_6204(&qword_1BFB00);
  sub_14C398();
  sub_14D730();
  uint64_t v50 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v40 = sub_14C30C();
  *(unsigned char *)(sub_6FE88() + 16) = 0;
  sub_6204(&qword_1C4D50);
  sub_42194();
  uint64_t v12 = sub_14C248();
  sub_6FEB8(v12);
  sub_6FBE8(&qword_1C4D58, &qword_1C4D50);
  sub_14C61C();
  sub_14BEE4();
  sub_14C33C();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v13 = sub_6FE88();
  sub_14C3D8(v13);
  sub_6204(&qword_1C4D60);
  sub_42194();
  uint64_t v14 = sub_14C2BC();
  sub_6FEB8(v14);
  sub_6FBE8(&qword_1C4D68, &qword_1C4D60);
  sub_14C100();
  sub_14BEE4();
  sub_14C564();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v15 = sub_6FE88();
  sub_14C3D8(v15);
  sub_6204(&qword_1C4D70);
  uint64_t v16 = sub_42194();
  sub_14C294(v16, v17, v18, v19, v20, v16, (uint64_t)&qword_1C5228, v21, (uint64_t)&off_1A7FA8, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_14BE7C(v22);
  sub_6FBE8(&qword_1C4D78, &qword_1C4D70);
  sub_14C11C();
  sub_14BEE4();
  sub_14C0E4();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v23 = sub_6FE88();
  sub_14C3D8(v23);
  sub_6204(&qword_1C4D80);
  uint64_t v24 = sub_42194();
  sub_14C2E4(v24, v25, v26, v27, v28, v24, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v36, v39, v41, v43, v45, v47, v49, v51, v53, v55,
    v57,
    v59);
  sub_6FEB8(v29);
  sub_6FBE8(&qword_1C4D88, &qword_1C4D80);
  sub_14C154();
  sub_14BEE4();
  sub_14C544();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4D90);
  uint64_t v30 = sub_14C670();
  uint64_t v31 = sub_14C138(v30);
  sub_6FEB8(v31);
  sub_6FBE8(&qword_1C4D98, &qword_1C4D90);
  sub_14C638();
  sub_14BEE4();
  sub_14C504();
  sub_14C45C();
  sub_6204(&qword_1C4DA0);
  uint64_t v32 = sub_42194();
  *(unsigned char *)(v32 + qword_1C5060) = 0;
  sub_14C444(v32, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v33 = sub_6FE88();
  sub_14BE50(v33);
  sub_14BF00(v34);
  sub_6FBE8(&qword_1C4DA8, &qword_1C4DA0);
  sub_14C4A4();
  sub_14BEE4();
  sub_14C524();
  sub_DEF10();
}

void sub_148F90()
{
  sub_DEF50();
  sub_14C4C4(v1, v2);
  sub_14C698();
  uint64_t v3 = sub_16160(0, &qword_1C4DB8);
  sub_14C3E4(v3);
  sub_14C42C();
  sub_6204(&qword_1C4DC0);
  sub_42194();
  sub_14C584();
  sub_11590();
  __chkstk_darwin(v4);
  uint64_t v6 = sub_14BFCC(v5, v37);
  v7(v6);
  uint64_t v11 = sub_14C654(*v0, v8, v9, v10, &qword_1C4E30);
  sub_14BFF8(v11);
  sub_6FBE8(&qword_1C4DC8, &qword_1C4DC0);
  sub_14C408();
  sub_14C18C();
  sub_6204(&qword_1BF0B8);
  sub_14C398();
  sub_14D730();
  uint64_t v50 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v40 = sub_14C30C();
  *(unsigned char *)(sub_6FE88() + 16) = 0;
  sub_6204(&qword_1C4DD0);
  sub_42194();
  uint64_t v12 = sub_14C248();
  sub_6FEB8(v12);
  sub_6FBE8(&qword_1C4DD8, &qword_1C4DD0);
  sub_14C61C();
  sub_14BEE4();
  sub_14C33C();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v13 = sub_6FE88();
  sub_14C3D8(v13);
  sub_6204(&qword_1C4DE0);
  sub_42194();
  uint64_t v14 = sub_14C2BC();
  sub_6FEB8(v14);
  sub_6FBE8(&qword_1C4DE8, &qword_1C4DE0);
  sub_14C100();
  sub_14BEE4();
  sub_14C564();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v15 = sub_6FE88();
  sub_14C3D8(v15);
  sub_6204(&qword_1C4DF0);
  uint64_t v16 = sub_42194();
  sub_14C294(v16, v17, v18, v19, v20, v16, (uint64_t)&qword_1C5228, v21, (uint64_t)&off_1A7FA8, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_14BE7C(v22);
  sub_6FBE8(&qword_1C4DF8, &qword_1C4DF0);
  sub_14C11C();
  sub_14BEE4();
  sub_14C0E4();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v23 = sub_6FE88();
  sub_14C3D8(v23);
  sub_6204(&qword_1C4E00);
  uint64_t v24 = sub_42194();
  sub_14C2E4(v24, v25, v26, v27, v28, v24, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v36, v39, v41, v43, v45, v47, v49, v51, v53, v55,
    v57,
    v59);
  sub_6FEB8(v29);
  sub_6FBE8(&qword_1C4E08, &qword_1C4E00);
  sub_14C154();
  sub_14BEE4();
  sub_14C544();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4E10);
  uint64_t v30 = sub_14C670();
  uint64_t v31 = sub_14C138(v30);
  sub_6FEB8(v31);
  sub_6FBE8(&qword_1C4E18, &qword_1C4E10);
  sub_14C638();
  sub_14BEE4();
  sub_14C504();
  sub_14C45C();
  sub_6204(&qword_1C4E20);
  uint64_t v32 = sub_42194();
  *(unsigned char *)(v32 + qword_1C5060) = 0;
  sub_14C444(v32, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v33 = sub_6FE88();
  sub_14BE50(v33);
  sub_14BF00(v34);
  sub_6FBE8(&qword_1C4E28, &qword_1C4E20);
  sub_14C4A4();
  sub_14BEE4();
  sub_14C524();
  sub_DEF10();
}

void sub_149434()
{
  sub_DEF50();
  sub_14C018(v2, v3);
  sub_14E5D0();
  sub_14C68C();
  uint64_t v4 = sub_14E5F0();
  sub_14C078(v4);
  sub_14C42C();
  sub_6204(&qword_1C4BD0);
  sub_42194();
  sub_14C274();
  sub_11590();
  __chkstk_darwin(v5);
  uint64_t v7 = sub_14BEB8(v6, v36);
  v8(v7);
  uint64_t v9 = sub_14B49C(*v1, v0, (void (*)(void))&type metadata accessor for GetCarClimateIntent, &qword_1C4C40);
  sub_14BFF8(v9);
  sub_6FBE8(&qword_1C4BD8, &qword_1C4BD0);
  sub_14C0C0();
  sub_14C18C();
  sub_6204(&qword_1C1C98);
  sub_14C09C();
  sub_14D730();
  uint64_t v49 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v39 = sub_14C30C();
  uint64_t v10 = sub_6FE88();
  sub_14C5F8(v10);
  sub_6204(&qword_1C4BE0);
  sub_42194();
  uint64_t v11 = sub_14BF28();
  sub_6FEB8(v11);
  sub_6FBE8(&qword_1C4BE8, &qword_1C4BE0);
  sub_14C360();
  sub_14BE18();
  sub_14C030();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v12 = sub_6FE88();
  sub_6FEDC(v12);
  sub_6204(&qword_1C4BF0);
  sub_42194();
  uint64_t v13 = sub_14BF7C();
  sub_6FEB8(v13);
  sub_6FBE8(&qword_1C4BF8, &qword_1C4BF0);
  sub_14C100();
  sub_14BE18();
  sub_14C1C8();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v14 = sub_6FE88();
  sub_6FEDC(v14);
  sub_6204(&qword_1C4C00);
  uint64_t v15 = sub_42194();
  sub_14BF54(v15, v16, v17, v18, v19, v15, (uint64_t)&qword_1C5228, v20, (uint64_t)&off_1A7FA8, v34, v37, v39, v41, v43, v45, v47, v49, v51, v53,
    v55,
    v57);
  sub_14BE7C(v21);
  sub_6FBE8(&qword_1C4C08, &qword_1C4C00);
  sub_14C11C();
  sub_14BE18();
  sub_14C054();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v22 = sub_6FE88();
  sub_6FEDC(v22);
  sub_6204(&qword_1C4C10);
  uint64_t v23 = sub_42194();
  sub_14BFA4(v23, v24, v25, v26, v27, v23, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_6FEB8(v28);
  sub_6FBE8(&qword_1C4C18, &qword_1C4C10);
  sub_14C154();
  sub_14BE18();
  sub_14C228();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4C20);
  uint64_t v29 = sub_14C3BC();
  uint64_t v30 = sub_14C138(v29);
  sub_6FEB8(v30);
  sub_6FBE8(&qword_1C4C28, &qword_1C4C20);
  sub_14C37C();
  sub_14BE18();
  sub_14C1E8();
  sub_14C45C();
  sub_6204(&qword_1C4C30);
  uint64_t v31 = sub_42194();
  *(unsigned char *)(v31 + qword_1C5060) = 0;
  sub_14C444(v31, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v32 = sub_6FE88();
  sub_14BE50(v32);
  sub_14BF00(v33);
  sub_6FBE8(&qword_1C4C38, &qword_1C4C30);
  sub_14C1A8();
  sub_14BE18();
  sub_14C208();
  sub_DEF10();
}

void sub_1498C0()
{
  sub_DEF50();
  sub_14C018(v2, v3);
  sub_14E600();
  sub_14C68C();
  uint64_t v4 = sub_14E640();
  sub_14C078(v4);
  sub_14C42C();
  sub_6204(&qword_1C4C48);
  sub_42194();
  sub_14C274();
  sub_11590();
  __chkstk_darwin(v5);
  uint64_t v7 = sub_14BEB8(v6, v36);
  v8(v7);
  uint64_t v9 = sub_14B49C(*v1, v0, (void (*)(void))&type metadata accessor for SetCarClimateIntent, &qword_1C4CB8);
  sub_14BFF8(v9);
  sub_6FBE8(&qword_1C4C50, &qword_1C4C48);
  sub_14C0C0();
  sub_14C18C();
  sub_6204(&qword_1C1A40);
  sub_14C09C();
  sub_14D730();
  uint64_t v49 = type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  uint64_t v39 = sub_14C30C();
  uint64_t v10 = sub_6FE88();
  sub_14C5F8(v10);
  sub_6204(&qword_1C4C58);
  sub_42194();
  uint64_t v11 = sub_14BF28();
  sub_6FEB8(v11);
  sub_6FBE8(&qword_1C4C60, &qword_1C4C58);
  sub_14C360();
  sub_14BE18();
  sub_14C030();
  sub_14D730();
  sub_6FEA0();
  sub_6FE18();
  sub_14D180();
  uint64_t v12 = sub_6FE88();
  sub_6FEDC(v12);
  sub_6204(&qword_1C4C68);
  sub_42194();
  uint64_t v13 = sub_14BF7C();
  sub_6FEB8(v13);
  sub_6FBE8(&qword_1C4C70, &qword_1C4C68);
  sub_14C100();
  sub_14BE18();
  sub_14C1C8();
  sub_14D730();
  sub_14C48C();
  sub_14BE34();
  sub_6FE18();
  sub_14C170();
  sub_14D180();
  uint64_t v14 = sub_6FE88();
  sub_6FEDC(v14);
  sub_6204(&qword_1C4C78);
  uint64_t v15 = sub_42194();
  sub_14BF54(v15, v16, v17, v18, v19, v15, (uint64_t)&qword_1C5228, v20, (uint64_t)&off_1A7FA8, v34, v37, v39, v41, v43, v45, v47, v49, v51, v53,
    v55,
    v57);
  sub_14BE7C(v21);
  sub_6FBE8(&qword_1C4C80, &qword_1C4C78);
  sub_14C11C();
  sub_14BE18();
  sub_14C054();
  sub_14D730();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v22 = sub_6FE88();
  sub_6FEDC(v22);
  sub_6204(&qword_1C4C88);
  uint64_t v23 = sub_42194();
  sub_14BFA4(v23, v24, v25, v26, v27, v23, (uint64_t)&qword_1C5458, (uint64_t)&qword_1C5460, (uint64_t)&off_1A7F90, v35, v38, v40, v42, v44, v46, v48, v50, v52, v54,
    v56,
    v58);
  sub_6FEB8(v28);
  sub_6FBE8(&qword_1C4C90, &qword_1C4C88);
  sub_14C154();
  sub_14BE18();
  sub_14C228();
  sub_14D730();
  sub_6FE18();
  sub_14D180();
  sub_6204(&qword_1C4C98);
  uint64_t v29 = sub_14C3BC();
  uint64_t v30 = sub_14C138(v29);
  sub_6FEB8(v30);
  sub_6FBE8(&qword_1C4CA0, &qword_1C4C98);
  sub_14C37C();
  sub_14BE18();
  sub_14C1E8();
  sub_14C45C();
  sub_6204(&qword_1C4CA8);
  uint64_t v31 = sub_42194();
  *(unsigned char *)(v31 + qword_1C5060) = 0;
  sub_14C444(v31, qword_1C5068);
  sub_14C474();
  sub_14BE34();
  sub_6FE18();
  sub_14D180();
  uint64_t v32 = sub_6FE88();
  sub_14BE50(v32);
  sub_14BF00(v33);
  sub_6FBE8(&qword_1C4CB0, &qword_1C4CA8);
  sub_14C1A8();
  sub_14BE18();
  sub_14C208();
  sub_DEF10();
}

uint64_t sub_149D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v6 = type metadata accessor for SecureElementServiceSessionManager();
  uint64_t v7 = &off_1AA4E0;
  *(void *)&long long v5 = sub_6FEA0();
  uint64_t v2 = type metadata accessor for WalletDCKSession();
  uint64_t v3 = swift_allocObject();
  uint64_t result = sub_DE9C(&v5, v3 + 16);
  a1[3] = v2;
  a1[4] = (uint64_t)&off_1AA0D0;
  *a1 = v3;
  return result;
}

id sub_149DD4()
{
  uint64_t v1 = *(void **)(v0 + 96);
  if (v1)
  {
    id v2 = *(id *)(v0 + 96);
  }
  else
  {
    swift_retain();
    sub_146EAC(v12);
    swift_release();
    sub_2F238((uint64_t)v12, v12[3]);
    sub_11590();
    __chkstk_darwin(v3);
    long long v5 = (uint64_t *)((char *)&v12[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v6 + 16))(v5);
    id v7 = sub_14B384(*v5);
    sub_DDAC((uint64_t)v12);
    uint64_t v8 = *(void **)(v0 + 96);
    *(void *)(v0 + 96) = v7;
    id v2 = v7;

    uint64_t v1 = 0;
  }
  id v9 = v1;
  return v2;
}

void *sub_149ED8(uint64_t a1)
{
  uint64_t v3 = sub_14E3B0();
  uint64_t v4 = sub_116CC(v3);
  __chkstk_darwin(v4);
  sub_34698();
  uint64_t v5 = type metadata accessor for CarCommandsCATPatternsExecutor(0);
  sub_14E3A0();
  uint64_t v6 = sub_14E2E0();
  v1[5] = v5;
  v1[6] = &off_1AD950;
  v1[2] = v6;
  uint64_t v7 = sub_14D190();
  sub_42194();
  uint64_t v8 = sub_14D180();
  v1[10] = v7;
  v1[11] = &protocol witness table for ResponseFactory;
  v1[7] = v8;
  v1[12] = 0;
  v1[13] = a1;
  return v1;
}

uint64_t sub_149F9C()
{
  uint64_t v1 = sub_14D720();
  sub_11590();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_695D8();
  sub_14D6C0();
  sub_8419C(v9, 4);
  sub_8F34(v0, (uint64_t)&_swiftEmptySetSingleton, v9);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  uint64_t v5 = v9[3];
  sub_343D0((uint64_t)v9);
  if (v5) {
    return sub_14CFD0();
  }
  if (qword_1B90A8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_14E7D0();
  sub_B0E0(v7, (uint64_t)qword_1B9FB8);
  os_log_type_t v8 = sub_14EB50();
  sub_35528(v8, 0x40000uLL, 0xD000000000000093, 0x800000000016F080, 0xD000000000000016, (void *)0x800000000015ECF0, 34, 0xD00000000000001FLL, 0x800000000015E8B0);
  return sub_14CFE0();
}

uint64_t sub_14A144()
{
  sub_E048();
  v0[2] = v1;
  uint64_t v2 = sub_14D720();
  v0[3] = v2;
  v0[4] = *(void *)(v2 - 8);
  v0[5] = swift_task_alloc();
  return _swift_task_switch(sub_14A200, 0, 0);
}

uint64_t sub_14A200()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  sub_14E6F0();
  uint64_t v3 = *(void (**)(void))(v2 + 16);
  sub_426B8();
  v3();
  id v4 = sub_8C5D4(v1);
  if (v4)
  {
    id v5 = v4;
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(id))v0[1];
    return v6(v5);
  }
  else
  {
    type metadata accessor for CarCommandsError();
    sub_14BDD0(&qword_1B96B8, 255, (void (*)(uint64_t))type metadata accessor for CarCommandsError);
    swift_allocError();
    sub_426B8();
    v3();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    swift_task_dealloc();
    os_log_type_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_14A394()
{
  uint64_t v1 = sub_14E3B0();
  uint64_t v2 = sub_116CC(v1);
  __chkstk_darwin(v2);
  sub_14C604();
  uint64_t v3 = sub_6204(&qword_1C4B40);
  sub_11590();
  uint64_t v5 = v4;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v19[-1] - v10;
  swift_retain();
  sub_146EAC(v19);
  swift_release();
  type metadata accessor for CarCommandsCATs();
  sub_14E3A0();
  uint64_t v12 = sub_14E2E0();
  sub_147E0C(v12, 0x40000, (uint64_t)v19, (uint64_t)v11);
  swift_release();
  sub_DDAC((uint64_t)v19);
  uint64_t v13 = *(void *)(v0 + 104);
  swift_retain();
  sub_14D730();
  type metadata accessor for FeatureFlagHelper();
  uint64_t v14 = sub_6FEA0();
  sub_14D190();
  sub_42194();
  uint64_t v15 = sub_14D180();
  v19[0] = sub_14BA80((uint64_t)v19, v14, 0x40000, v15, v13);
  type metadata accessor for DeactivateSignalHandleIntentFlowStrategy();
  sub_14BDD0(&qword_1C4B48, 255, (void (*)(uint64_t))type metadata accessor for DeactivateSignalHandleIntentFlowStrategy);
  sub_14CB60();
  swift_release();
  sub_14CC00();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v11, v3);
  sub_6204(&qword_1C4B50);
  sub_42194();
  uint64_t v16 = sub_14CC90();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v3);
  return v16;
}

uint64_t type metadata accessor for DeactivateSignalRCHFlowStrategy()
{
  return self;
}

uint64_t sub_14A628(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_14BDD0((unint64_t *)&unk_1C4AE8, a2, (void (*)(uint64_t))type metadata accessor for DeactivateSignalRCHFlowStrategy);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_14A680()
{
  return sub_149F9C();
}

uint64_t sub_14A698()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_6910C;
  return sub_14A144();
}

uint64_t sub_14A72C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1BA550 + dword_1BA550);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_12AD4;
  return v3();
}

uint64_t sub_14A804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for DeactivateSignalRCHFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_12AD4;
  return ResolveConfirmFlowStrategyAsync.makeAppDoesNotSupportIntentResponse(app:intent:)(a1, a2, a3, v11, a5);
}

uint64_t sub_14A8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for DeactivateSignalRCHFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_12AD4;
  return ResolveConfirmFlowStrategyAsync.makeAppNotFoundOnDeviceResponse(app:intent:)(a1, a2, a3, v11, a5);
}

uint64_t sub_14A99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  uint64_t v11 = type metadata accessor for DeactivateSignalRCHFlowStrategy();
  *uint64_t v10 = v5;
  v10[1] = sub_12AD4;
  return ResolveConfirmFlowStrategyAsync.makeDeviceIncompatibleResponse(app:intent:)(a1, a2, a3, v11, a5);
}

uint64_t sub_14AA68()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1BA568 + dword_1BA568);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_12A0C;
  return v3();
}

uint64_t sub_14AB40()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1BA570 + dword_1BA570);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_34154;
  return v3();
}

uint64_t sub_14ABFC(uint64_t a1, uint64_t a2)
{
  return sub_14BDD0((unint64_t *)&unk_1C4AE8, a2, (void (*)(uint64_t))type metadata accessor for DeactivateSignalRCHFlowStrategy);
}

uint64_t sub_14AC44(uint64_t a1, uint64_t a2)
{
  return sub_14BDD0(qword_1C4AF8, a2, (void (*)(uint64_t))type metadata accessor for DeactivateSignalRCHFlowStrategy);
}

uint64_t sub_14AC8C(uint64_t a1, uint64_t a2)
{
  return sub_14BDD0(qword_1C4B28, a2, (void (*)(uint64_t))type metadata accessor for DeactivateSignalRCHFlowStrategy);
}

uint64_t sub_14ACD4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_14BDD0(qword_1C4AF8, a2, (void (*)(uint64_t))type metadata accessor for DeactivateSignalRCHFlowStrategy);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_14AD2C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_14BDD0(&qword_1C32D8, a2, (void (*)(uint64_t))type metadata accessor for DeactivateSignalRCHFlowStrategy);
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_14AD84()
{
  sub_DEF50();
  uint64_t v1 = v0;
  uint64_t v39 = v2;
  uint64_t v40 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v42 = sub_14C840();
  sub_11590();
  uint64_t v11 = v10;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v41 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = sub_14D190();
  v45[3] = v17;
  v45[4] = (uint64_t)&protocol witness table for ResponseFactory;
  v45[0] = v5;
  uint64_t v18 = type metadata accessor for FeatureFlagHelper();
  v44[3] = v18;
  v44[4] = (uint64_t)&off_1ACCC8;
  v44[0] = v7;
  id v19 = [self sharedStream];
  id v20 = [self sharedManager];
  sub_14CD70();
  uint64_t v21 = type metadata accessor for CarCommandsLoggingProducer();
  swift_allocObject();
  uint64_t v22 = sub_BDA14((uint64_t)v19, (uint64_t)v20, &v43);
  v1[5] = v21;
  v1[6] = &off_1AB0F8;
  v1[2] = v22;
  uint64_t v23 = type metadata accessor for CarPlaySessionObserver();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = [objc_allocWithZone((Class)CARSessionStatus) init];
  v1[10] = v23;
  v1[11] = &off_1AB9A8;
  v1[7] = v24;
  uint64_t v25 = sub_6FEA0();
  v1[20] = v18;
  v1[21] = &off_1ACCC8;
  v1[17] = v25;
  v1[22] = 2;
  swift_allocObject();
  uint64_t v26 = sub_14D180();
  v1[26] = v17;
  v1[27] = &protocol witness table for ResponseFactory;
  v1[23] = v26;
  sub_16160(0, (unint64_t *)&qword_1BFD40);
  sub_CC794(v1 + 29);
  sub_14D1E0();
  sub_14E120();
  sub_14E110();
  sub_14E100();
  swift_release();
  sub_14D1D0();
  swift_release();
  uint64_t v27 = sub_14E490();
  uint64_t v28 = sub_14E480();
  v1[42] = v27;
  v1[43] = &off_1A7CA0;
  v1[39] = v28;
  sub_DF10(v9, (uint64_t)(v1 + 12));
  sub_14C6B4();
  sub_46188(v1 + 17, v44);
  swift_endAccess();
  v1[22] = v39 | 2;
  sub_14C6B4();
  sub_46188(v1 + 23, v45);
  swift_endAccess();
  v1[28] = v40;
  uint64_t v29 = v1[15];
  sub_DDFC(v1 + 12, v29);
  sub_11590();
  uint64_t v31 = v30;
  __chkstk_darwin(v32);
  sub_34698();
  (*(void (**)(void *))(v31 + 16))(v1 + 12);
  swift_retain();
  sub_14CE50();
  (*(void (**)(void *, uint64_t))(v31 + 8))(v1 + 12, v29);
  uint64_t v33 = v41;
  sub_14C830();
  swift_release();
  sub_DDAC((uint64_t)v45);
  sub_DDAC((uint64_t)v44);
  sub_DDAC(v9);
  uint64_t v34 = (char *)v1 + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin27CarCommandsBaseFlowStrategy_unitProvider;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v36 = v33;
  uint64_t v37 = v42;
  v35((char *)v1 + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin27CarCommandsBaseFlowStrategy_unitProvider, v36, v42);
  uint64_t v38 = type metadata accessor for LocalizedMeasurementUnitProvider();
  v35(&v34[*(int *)(v38 + 20)], v16, v37);
  sub_DEF10();
}

void sub_14B1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  sub_DEF50();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = sub_14E3B0();
  uint64_t v32 = sub_116CC(v31);
  __chkstk_darwin(v32);
  v44[3] = type metadata accessor for FeatureFlagHelper();
  v44[4] = &off_1ACCC8;
  v44[0] = v28;
  uint64_t v33 = (uint64_t *)(v26 + *v24);
  uint64_t v34 = type metadata accessor for CarCommandsCATPatternsExecutor(0);
  swift_retain();
  sub_14E3A0();
  uint64_t v35 = sub_14E2E0();
  v33[3] = v34;
  v33[4] = (uint64_t)&off_1AD950;
  *uint64_t v33 = v35;
  uint64_t v36 = (uint64_t *)(v26 + *v22);
  type metadata accessor for CarCommandsCATs();
  sub_14E3A0();
  *uint64_t v36 = sub_14E2E0();
  v36[1] = a21;
  swift_release();
  sub_DF10(v30, (uint64_t)&v43);
  sub_DF10((uint64_t)v44, (uint64_t)v42);
  sub_2F238((uint64_t)v42, v42[3]);
  sub_11590();
  __chkstk_darwin(v37);
  uint64_t v39 = sub_6FE48(v38, v41);
  v40(v39);
  swift_retain();
  sub_6FEF4();
  sub_DDAC((uint64_t)v42);
  swift_release();
  sub_DDAC((uint64_t)v44);
  sub_DDAC(v30);
  sub_DEF10();
}

id sub_14B384(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for WalletService();
  v13[3] = v3;
  v13[4] = &off_1AAFA8;
  v13[0] = a1;
  uint64_t v4 = (objc_class *)type metadata accessor for SEDeactivateSignalIntentHandler();
  id v5 = objc_allocWithZone(v4);
  sub_2F238((uint64_t)v13, v3);
  sub_11590();
  __chkstk_darwin(v6);
  sub_695D8();
  (*(void (**)(uint64_t *))(v7 + 16))(v1);
  uint64_t v8 = *v1;
  v12[3] = v3;
  v12[4] = &off_1AAFA8;
  v12[0] = v8;
  sub_DF10((uint64_t)v12, (uint64_t)v5 + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin31SEDeactivateSignalIntentHandler_carKeyService);
  v11.receiver = v5;
  v11.super_class = v4;
  id v9 = objc_msgSendSuper2(&v11, "init");
  sub_DDAC((uint64_t)v12);
  sub_DDAC((uint64_t)v13);
  return v9;
}

uint64_t sub_14B49C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t *a4)
{
  v14[3] = type metadata accessor for WalletService();
  v14[4] = &off_1AAFA8;
  v14[0] = a1;
  *(void *)(a2 + qword_1BBB90) = 0;
  uint64_t v8 = (uint64_t *)(a2 + qword_1C5140);
  a3(0);
  swift_retain();
  sub_6204(a4);
  uint64_t *v8 = sub_14E8B0();
  v8[1] = v9;
  sub_DF10((uint64_t)v14, a2 + qword_1C5138);
  swift_release();
  sub_14D730();
  type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  sub_14C30C();
  uint64_t v10 = sub_6FE88();
  sub_14C5A4(v10);
  uint64_t v12 = v11;
  sub_DDAC((uint64_t)v14);
  return v12;
}

uint64_t sub_14B59C()
{
  uint64_t v3 = sub_14C4D8();
  uint64_t v4 = sub_116CC(v3);
  __chkstk_darwin(v4);
  v20[3] = sub_14C5D0();
  v20[4] = &off_1ACCC8;
  v20[0] = v1;
  id v5 = (uint64_t *)(v2 + qword_1C53E8);
  type metadata accessor for CarCommandsCATs();
  swift_retain();
  sub_14E3A0();
  *id v5 = sub_14E2E0();
  v5[1] = (uint64_t)&off_1A7FC0;
  uint64_t v6 = (uint64_t *)(v2 + qword_1C53F0);
  uint64_t v7 = type metadata accessor for CarCommandsCATPatternsExecutor(0);
  sub_14E3A0();
  uint64_t v8 = sub_14E2E0();
  v6[3] = v7;
  v6[4] = (uint64_t)&off_1AD950;
  uint64_t *v6 = v8;
  swift_release();
  sub_DF10(v0, (uint64_t)v19);
  sub_DF10((uint64_t)v20, (uint64_t)v17);
  sub_2F238((uint64_t)v17, v18);
  sub_11590();
  __chkstk_darwin(v9);
  uint64_t v11 = sub_6FE48(v10, v16);
  v12(v11);
  swift_retain();
  sub_6FEF4();
  uint64_t v14 = v13;
  sub_DDAC((uint64_t)v17);
  swift_release();
  sub_DDAC((uint64_t)v20);
  sub_DDAC(v0);
  return v14;
}

uint64_t sub_14B744()
{
  uint64_t v3 = sub_14C4D8();
  uint64_t v4 = sub_116CC(v3);
  __chkstk_darwin(v4);
  v19[3] = sub_14C5D0();
  v19[4] = &off_1ACCC8;
  v19[0] = v1;
  id v5 = (uint64_t *)(v2 + qword_1C5430);
  uint64_t v6 = type metadata accessor for CarCommandsCATPatternsExecutor(0);
  swift_retain();
  sub_14E3A0();
  uint64_t v7 = sub_14E2E0();
  v5[3] = v6;
  v5[4] = (uint64_t)&off_1AD950;
  *id v5 = v7;
  swift_release();
  sub_DF10(v0, (uint64_t)v18);
  sub_DF10((uint64_t)v19, (uint64_t)v16);
  sub_2F238((uint64_t)v16, v17);
  sub_11590();
  __chkstk_darwin(v8);
  uint64_t v10 = sub_6FE48(v9, v15);
  v11(v10);
  swift_retain();
  sub_6FEF4();
  uint64_t v13 = v12;
  sub_DDAC((uint64_t)v16);
  swift_release();
  sub_DDAC((uint64_t)v19);
  sub_DDAC(v0);
  return v13;
}

uint64_t sub_14B8B0(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  v15[3] = type metadata accessor for WalletService();
  v15[4] = &off_1AAFA8;
  v15[0] = a1;
  *(void *)(a2 + qword_1BBB90) = 0;
  uint64_t v9 = (uint64_t *)(a2 + qword_1C5140);
  sub_16160(0, a3);
  swift_retain();
  sub_6204(a5);
  *uint64_t v9 = sub_14E8B0();
  v9[1] = v10;
  sub_DF10((uint64_t)v15, a2 + qword_1C5138);
  swift_release();
  sub_14D730();
  type metadata accessor for FeatureFlagHelper();
  sub_6FEA0();
  sub_14C324();
  sub_42194();
  sub_14D180();
  sub_14C30C();
  uint64_t v11 = sub_6FE88();
  sub_14C5A4(v11);
  uint64_t v13 = v12;
  sub_DDAC((uint64_t)v15);
  return v13;
}

uint64_t sub_14B9C0(long long *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_14E3B0();
  uint64_t v7 = sub_116CC(v6);
  __chkstk_darwin(v7);
  sub_695D8();
  uint64_t v10 = sub_14D190();
  uint64_t v11 = &protocol witness table for ResponseFactory;
  *(void *)&long long v9 = a2;
  type metadata accessor for CarCommandsCATsSimple();
  sub_14E3A0();
  *(void *)(a3 + 96) = sub_14E340();
  sub_DE9C(a1, a3 + 16);
  sub_DE9C(&v9, a3 + 56);
  return a3;
}

uint64_t sub_14BA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = type metadata accessor for FeatureFlagHelper();
  id v20 = &off_1ACCC8;
  v18[0] = a2;
  type metadata accessor for DeactivateSignalHandleIntentFlowStrategy();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = sub_2F238((uint64_t)v18, v19);
  __chkstk_darwin(v11);
  uint64_t v13 = (void *)((char *)&v18[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = sub_14BBC4(a1, *v13, a3, a4, a5, v10);
  sub_DDAC((uint64_t)v18);
  return v15;
}

uint64_t sub_14BBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = sub_14E3B0();
  __chkstk_darwin(v9 - 8);
  v23[3] = type metadata accessor for FeatureFlagHelper();
  v23[4] = &off_1ACCC8;
  v23[0] = a2;
  uint64_t v10 = (uint64_t *)(a6
                  + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin40DeactivateSignalHandleIntentFlowStrategy_commonPatterns);
  uint64_t v11 = type metadata accessor for CarCommandsCATPatternsExecutor(0);
  swift_retain();
  sub_14E3A0();
  uint64_t v12 = sub_14E2E0();
  v10[3] = v11;
  v10[4] = (uint64_t)&off_1AD950;
  *uint64_t v10 = v12;
  *(void *)(a6
            + OBJC_IVAR____TtC29CarCommandsFlowDelegatePlugin40DeactivateSignalHandleIntentFlowStrategy____lazy_storage___inProcessIntentHandler) = 0;
  swift_release();
  sub_DF10(a1, (uint64_t)v22);
  sub_DF10((uint64_t)v23, (uint64_t)v20);
  uint64_t v13 = sub_2F238((uint64_t)v20, v21);
  __chkstk_darwin(v13);
  (*(void (**)(unsigned char *))(v15 + 16))(&v20[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
  swift_retain();
  sub_14AD84();
  uint64_t v17 = v16;
  sub_DDAC((uint64_t)v20);
  swift_release();
  sub_DDAC((uint64_t)v23);
  sub_DDAC(a1);
  return v17;
}

uint64_t sub_14BDD0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_14BE18()
{
  return swift_release();
}

uint64_t sub_14BE34()
{
  return swift_allocObject();
}

void sub_14BE50(uint64_t a1)
{
  *(unsigned char *)(a1 + 16) = 0;
  sub_14AD84();
}

uint64_t sub_14BE7C(uint64_t a1)
{
  sub_DDAC(v4 - 128);
  uint64_t v6 = (void *)(a1 + *v2);
  void *v6 = v1;
  v6[1] = v3;
  return swift_release();
}

char *sub_14BEB8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_14BEE4()
{
  return swift_release();
}

uint64_t sub_14BF00(uint64_t a1)
{
  sub_DDAC(v1 - 128);
  uint64_t result = sub_DDAC(v1 - 168);
  *(void *)(v1 - 128) = a1;
  return result;
}

uint64_t sub_14BF28()
{
  return sub_14B59C();
}

void sub_14BF54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v27 = *(void *)(v25 - 216);
  sub_14B1BC(v25 - 168, v22, v27, v21, v23, a6, a7, v24, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_14BF7C()
{
  return sub_14B744();
}

void sub_14BFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v26 = *(void *)(v24 - 216);
  sub_14B1BC(v24 - 128, v22, v26, v21, v23, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

char *sub_14BFCC@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_14BFF8(uint64_t a1)
{
  uint64_t result = sub_DDAC(v1 - 128);
  *(void *)(v1 - 128) = a1;
  return result;
}

uint64_t sub_14C018(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 - 216) = a2;
  *(void *)(v2 - 240) = a1;
  return 0;
}

uint64_t sub_14C030()
{
  *(void *)(v2 - 256) = v0;
  *(void *)(v2 - 248) = v1;
  return sub_14CC50();
}

uint64_t sub_14C054()
{
  return sub_14CBF0();
}

uint64_t sub_14C078(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return sub_14CC80();
}

uint64_t sub_14C09C()
{
  return sub_14CC10();
}

uint64_t sub_14C0C0()
{
  return sub_14CB80();
}

uint64_t sub_14C0E4()
{
  return sub_14CBF0();
}

uint64_t sub_14C100()
{
  return sub_14CBB0();
}

uint64_t sub_14C11C()
{
  return sub_14CB50();
}

uint64_t sub_14C138(uint64_t a1)
{
  return sub_14B9C0((long long *)(v2 - 128), v1, a1);
}

uint64_t sub_14C154()
{
  return sub_14CBE0();
}

uint64_t sub_14C170()
{
  return swift_retain();
}

uint64_t sub_14C18C()
{
  return swift_release();
}

uint64_t sub_14C1A8()
{
  return sub_14CBC0();
}

uint64_t sub_14C1C8()
{
  return sub_14CC60();
}

uint64_t sub_14C1E8()
{
  return sub_14CC30();
}

uint64_t sub_14C208()
{
  return sub_14CC70();
}

uint64_t sub_14C228()
{
  return sub_14CC40();
}

uint64_t sub_14C248()
{
  return sub_14B59C();
}

uint64_t sub_14C274()
{
  uint64_t v2 = *(void *)(v0 - 104);
  return sub_2F238(v0 - 128, v2);
}

void sub_14C294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v27 = *(void *)(v25 - 216);
  sub_14B1BC(v25 - 168, v22, v27, v21, v23, a6, a7, v24, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_14C2BC()
{
  return sub_14B744();
}

void sub_14C2E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v26 = *(void *)(v24 - 216);
  sub_14B1BC(v24 - 128, v22, v26, v21, v23, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t sub_14C30C()
{
  return type metadata accessor for SnippetManager();
}

uint64_t sub_14C324()
{
  return sub_14D190();
}

uint64_t sub_14C33C()
{
  *(void *)(v2 - 256) = v0;
  *(void *)(v2 - 248) = v1;
  return sub_14CC50();
}

uint64_t sub_14C360()
{
  return sub_14CBA0();
}

uint64_t sub_14C37C()
{
  return sub_14CB90();
}

uint64_t sub_14C398()
{
  return sub_14CC10();
}

uint64_t sub_14C3BC()
{
  return swift_allocObject();
}

uint64_t sub_14C3D8(uint64_t result)
{
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t sub_14C3E4(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return sub_14CC80();
}

uint64_t sub_14C408()
{
  return sub_14CB80();
}

uint64_t sub_14C42C()
{
  return sub_DF10(v0, v1 - 128);
}

uint64_t sub_14C444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_DF10(v2 - 168, a1 + a2);
}

uint64_t sub_14C45C()
{
  return sub_14D730();
}

uint64_t sub_14C474()
{
  return sub_DF10(v0 - 128, v0 - 208);
}

uint64_t sub_14C48C()
{
  return sub_DF10(v0 - 128, v0 - 168);
}

uint64_t sub_14C4A4()
{
  return sub_14CBC0();
}

uint64_t sub_14C4C4(uint64_t result, uint64_t a2)
{
  *(void *)(v2 - 216) = a2;
  *(void *)(v2 - 240) = result;
  return result;
}

uint64_t sub_14C4D8()
{
  return sub_14E3B0();
}

uint64_t sub_14C504()
{
  return sub_14CC30();
}

uint64_t sub_14C524()
{
  return sub_14CC70();
}

uint64_t sub_14C544()
{
  return sub_14CC40();
}

uint64_t sub_14C564()
{
  return sub_14CC60();
}

uint64_t sub_14C584()
{
  uint64_t v2 = *(void *)(v0 - 104);
  return sub_2F238(v0 - 128, v2);
}

void sub_14C5A4(uint64_t a1)
{
  *(unsigned char *)(a1 + 16) = 0;
  sub_14AD84();
}

uint64_t sub_14C5D0()
{
  return type metadata accessor for FeatureFlagHelper();
}

uint64_t sub_14C5F8(uint64_t result)
{
  *(unsigned char *)(result + 16) = 0;
  return result;
}

uint64_t sub_14C61C()
{
  return sub_14CBA0();
}

uint64_t sub_14C638()
{
  return sub_14CB90();
}

uint64_t sub_14C654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_14B8B0(a1, v5, v6, v7, a5);
}

uint64_t sub_14C670()
{
  return swift_allocObject();
}

uint64_t sub_14C68C()
{
  return 0;
}

uint64_t sub_14C698()
{
  return sub_16160(0, v0);
}

uint64_t sub_14C6B4()
{
  return swift_beginAccess();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

double sub_14C6F0()
{
  NSMeasurement v1 = Measurement._bridgeToObjectiveC()();
  return v1._doubleValue;
}

uint64_t sub_14C700()
{
  return static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14C710()
{
  return Measurement.unit.getter();
}

uint64_t sub_14C720()
{
  return Measurement.init(value:unit:)();
}

uint64_t sub_14C730()
{
  return Measurement.value.getter();
}

uint64_t sub_14C740()
{
  return Measurement<>.converted(to:)();
}

uint64_t sub_14C750()
{
  return type metadata accessor for Measurement();
}

uint64_t sub_14C760()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_14C770()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_14C780()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_14C790()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_14C7A0()
{
  return static MeasurementFormatUnitUsage<>.weather.getter();
}

NSData sub_14C7B0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_14C7C0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_14C7D0()
{
  return UUID.si_data()();
}

uint64_t sub_14C7E0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14C7F0()
{
  return UUID.init()();
}

uint64_t sub_14C800()
{
  return type metadata accessor for UUID();
}

uint64_t sub_14C810()
{
  return Locale.identifier.getter();
}

uint64_t sub_14C820()
{
  return Locale.usesMetricSystem.getter();
}

uint64_t sub_14C830()
{
  return static Locale.current.getter();
}

uint64_t sub_14C840()
{
  return type metadata accessor for Locale();
}

uint64_t sub_14C870()
{
  return static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
}

uint64_t sub_14C890()
{
  return HandleIntentFlowStrategyAsync.authenticationPolicy.getter();
}

uint64_t sub_14C9A0()
{
  return NeedsConfirmationFlowStrategyAsync.authenticationPolicy.getter();
}

uint64_t sub_14CA10()
{
  return NeedsDisambiguationFlowStrategyAsync.authenticationPolicy.getter();
}

uint64_t sub_14CAE0()
{
  return ClientHandledRequestTCCAcceptanceFlowStrategyAsync.handoffTCCFlow(deviceState:)();
}

uint64_t sub_14CB10()
{
  return dispatch thunk of AnyFlow.on(input:)();
}

uint64_t sub_14CB20()
{
  return type metadata accessor for GuardFlow();
}

uint64_t sub_14CB30()
{
  return static CommonFlowGuard.ensuringDeviceIsAuthenticated(using:)();
}

uint64_t sub_14CB40()
{
  return type metadata accessor for CommonFlowGuard();
}

uint64_t sub_14CB50()
{
  return static RCHChildFlowFactoryHelper.makeNeedsValueFlowProducer<A>(strategy:)();
}

uint64_t sub_14CB60()
{
  return static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)();
}

uint64_t sub_14CB70()
{
  return static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B>(app:)();
}

uint64_t sub_14CB80()
{
  return static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B, C>(strategy:)();
}

uint64_t sub_14CB90()
{
  return static RCHChildFlowFactoryHelper.makeContinueInAppFlowWithDialogProducer<A>(strategy:)();
}

uint64_t sub_14CBA0()
{
  return static RCHChildFlowFactoryHelper.makeNeedsConfirmationFlowProducer<A>(strategy:)();
}

uint64_t sub_14CBB0()
{
  return static RCHChildFlowFactoryHelper.makeNeedsDisambiguationFlowProducer<A>(strategy:)();
}

uint64_t sub_14CBC0()
{
  return static RCHChildFlowFactoryHelper.makeRequestTCCAcceptanceFlow<A, B>(strategy:)();
}

uint64_t sub_14CBD0()
{
  return static RCHChildFlowFactoryHelper.makeConditionalConfirmIntentFlowProducer<A>(strategy:_:)();
}

uint64_t sub_14CBE0()
{
  return static RCHChildFlowFactoryHelper.makeUnsupportedValueAndPromptFlowProducer<A>(strategy:)();
}

uint64_t sub_14CBF0()
{
  return RCHChildFlowProducersAsync.needsValueFlowProducer.setter();
}

uint64_t sub_14CC00()
{
  return RCHChildFlowProducersAsync.handleIntentFlowProducer.setter();
}

uint64_t sub_14CC10()
{
  return RCHChildFlowProducersAsync.appResolutionFlowProducer.setter();
}

uint64_t sub_14CC20()
{
  return RCHChildFlowProducersAsync.confirmIntentFlowProducer.setter();
}

uint64_t sub_14CC30()
{
  return RCHChildFlowProducersAsync.continueInAppFlowProducer.setter();
}

uint64_t sub_14CC40()
{
  return RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter();
}

uint64_t sub_14CC50()
{
  return RCHChildFlowProducersAsync.needsConfirmationFlowProducer.setter();
}

uint64_t sub_14CC60()
{
  return RCHChildFlowProducersAsync.needsDisambiguationFlowProducer.setter();
}

uint64_t sub_14CC70()
{
  return RCHChildFlowProducersAsync.requestTCCAcceptanceFlowProducer.setter();
}

uint64_t sub_14CC80()
{
  return RCHChildFlowProducersAsync.init()();
}

uint64_t sub_14CC90()
{
  return RCHChildFlowFactory.init(producers:)();
}

uint64_t sub_14CCA0()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_14CCB0()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_14CCC0()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_14CCF0()
{
  return static FlowSearchResult.noFlow.getter();
}

uint64_t sub_14CD00()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_14CD10()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_14CD20()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_14CD30()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_14CD40()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_14CD50(Swift::String refId)
{
}

void sub_14CD60()
{
}

uint64_t sub_14CD70()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t sub_14CD80()
{
  return dispatch thunk of SiriKitEventSending.send(_:)();
}

uint64_t sub_14CDA0()
{
  return type metadata accessor for SiriKitIntentHandler();
}

uint64_t sub_14CDB0()
{
  return SiriKitParameterMetadata.init(parameterName:shouldResolve:confirmationStates:)();
}

uint64_t sub_14CDC0()
{
  return type metadata accessor for SiriKitParameterMetadata();
}

uint64_t sub_14CDE0()
{
  return static SiriKitIntentExecutionBehavior.standard()();
}

uint64_t sub_14CDF0()
{
  return type metadata accessor for SiriKitIntentExecutionBehavior();
}

uint64_t sub_14CE00()
{
  return static SiriKitDirectInvocationPayloads.reject.getter();
}

uint64_t sub_14CE10()
{
  return static SiriKitDirectInvocationPayloads.confirm.getter();
}

uint64_t sub_14CE20()
{
  return dispatch thunk of SiriKitEvent.SiriKitEventBuilder.app.setter();
}

uint64_t sub_14CE30()
{
  return SiriKitEvent.__allocating_init(stateType:taskType:statusReason:_:)();
}

uint64_t sub_14CE40()
{
  return type metadata accessor for SiriKitEvent();
}

uint64_t sub_14CE50()
{
  return dispatch thunk of DeviceState.siriLocale.getter();
}

uint64_t sub_14CE60()
{
  return dispatch thunk of DeviceState.isAuthenticated(for:)();
}

uint64_t sub_14CE70()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t sub_14CE80()
{
  return dispatch thunk of DeviceState.sessionHandOffContinuityID.getter();
}

uint64_t sub_14CE90()
{
  return dispatch thunk of DeviceState.isCarPlay.getter();
}

uint64_t sub_14CEA0()
{
  return static DialogPhase.completion.getter();
}

uint64_t sub_14CEB0()
{
  return static DialogPhase.confirmation.getter();
}

uint64_t sub_14CEC0()
{
  return static DialogPhase.clarification.getter();
}

uint64_t sub_14CED0()
{
  return static DialogPhase.error.getter();
}

uint64_t sub_14CEE0()
{
  return type metadata accessor for DialogPhase();
}

uint64_t sub_14CEF0()
{
  return DisplayHint.init(idValue:displayValue:)();
}

uint64_t sub_14CF00()
{
  return type metadata accessor for DisplayHint();
}

uint64_t sub_14CF10()
{
  return static EmptyOutput.instance.getter();
}

uint64_t sub_14CF20()
{
  return type metadata accessor for EmptyOutput();
}

uint64_t sub_14CF30()
{
  return type metadata accessor for ResponseType();
}

uint64_t sub_14CF80()
{
  return static CasinoFactory.makeSendCommandsFromMachineUtterance(machineUtterance:)();
}

uint64_t sub_14CF90()
{
  return SemanticValue.init(string:label:nodeClass:)();
}

uint64_t sub_14CFA0()
{
  return SemanticValue.init(string:label:)();
}

uint64_t sub_14CFB0()
{
  return type metadata accessor for SemanticValue();
}

uint64_t sub_14CFC0()
{
  return static ActionForInput.cancel()();
}

uint64_t sub_14CFD0()
{
  return static ActionForInput.handle()();
}

uint64_t sub_14CFE0()
{
  return static ActionForInput.ignore()();
}

uint64_t sub_14D030()
{
  return RCHFlowFactory.makeAppResolvingRCHFlow()();
}

uint64_t sub_14D040()
{
  return RCHFlowFactory.init(strategy:childFlowFactory:)();
}

uint64_t sub_14D050()
{
  return TemplatingText.text.getter();
}

uint64_t sub_14D060()
{
  return type metadata accessor for TemplatingText();
}

uint64_t sub_14D070()
{
  return static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_14D080()
{
  return static AceOutputHelper.makeConfirmationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_14D090()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_14D0A0()
{
  return static ExecuteResponse.complete(next:)();
}

uint64_t sub_14D0B0()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_14D0C0()
{
  return static ExecuteResponse.unhandled(reason:isComplete:)();
}

uint64_t sub_14D0D0()
{
  return NLContextUpdate.displayHints.setter();
}

uint64_t sub_14D0E0()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t sub_14D0F0()
{
  return NLContextUpdate.weightedPromptStrict.setter();
}

uint64_t sub_14D100()
{
  return NLContextUpdate.weightedPromptAbortValues.setter();
}

uint64_t sub_14D110()
{
  return NLContextUpdate.weightedPromptTargetDomain.setter();
}

uint64_t sub_14D120()
{
  return NLContextUpdate.conversationStateAttachments.setter();
}

uint64_t sub_14D130()
{
  return NLContextUpdate.weightedPromptResponseOptions.setter();
}

uint64_t sub_14D140()
{
  return NLContextUpdate.weightedPromptResponseTargets.setter();
}

uint64_t sub_14D150()
{
  return NLContextUpdate.nlInput.setter();
}

uint64_t sub_14D160()
{
  return NLContextUpdate.init()();
}

uint64_t sub_14D170()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_14D180()
{
  return ResponseFactory.init()();
}

uint64_t sub_14D190()
{
  return type metadata accessor for ResponseFactory();
}

BOOL sub_14D1A0(Swift::Bool defaultBehavior)
{
  return TemplatingResult.shouldListenAfterSpeaking(defaultBehavior:)(defaultBehavior);
}

uint64_t sub_14D1B0()
{
  return TemplatingResult.sections.getter();
}

uint64_t sub_14D1C0()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_14D1D0()
{
  return static ProtectedAppCheck.client(for:)();
}

uint64_t sub_14D1E0()
{
  return type metadata accessor for ProtectedAppCheck();
}

uint64_t sub_14D1F0()
{
  return TemplatingSection.content.getter();
}

uint64_t sub_14D200()
{
  return type metadata accessor for TemplatingSection();
}

uint64_t sub_14D210()
{
  return IntentPromptAnswer.init(answeredValue:updatedIntent:)();
}

uint64_t sub_14D220()
{
  return type metadata accessor for IntentPromptAnswer();
}

uint64_t sub_14D230()
{
  return type metadata accessor for ProtectedAppStatus.AppState();
}

uint64_t sub_14D240()
{
  return ProtectedAppStatus.state.getter();
}

uint64_t sub_14D250()
{
  return type metadata accessor for ProtectedAppStatus();
}

uint64_t sub_14D260()
{
  return dispatch thunk of ResponseGenerating.makeResponseUpdateOutput(viewId:update:)();
}

uint64_t sub_14D2B0()
{
  return static UnlockDevicePolicy.requiringDeviceUnlock.getter();
}

uint64_t sub_14D2C0()
{
  return type metadata accessor for UnlockDevicePolicy();
}

uint64_t sub_14D2D0()
{
  return static AppResolutionAction.noAppFound()();
}

uint64_t sub_14D2E0()
{
  return static AppResolutionAction.disambiguate(apps:)();
}

uint64_t sub_14D2F0()
{
  return static AppResolutionAction.== infix(_:_:)();
}

uint64_t sub_14D300()
{
  return static AppResolutionAction.select(app:)();
}

uint64_t sub_14D310()
{
  return type metadata accessor for AppResolutionAction();
}

uint64_t sub_14D330()
{
  return ParameterIdentifier.name.getter();
}

uint64_t sub_14D340()
{
  return type metadata accessor for ParameterIdentifier();
}

uint64_t sub_14D350()
{
  return static ConfirmationResponse.== infix(_:_:)();
}

uint64_t sub_14D360()
{
  return type metadata accessor for ConfirmationResponse();
}

uint64_t sub_14D370()
{
  return static DisambiguationResult.chosenItem(_:)();
}

uint64_t sub_14D3B0()
{
  return dispatch thunk of AppInformationResolver.getLocalizedAppDisplayName(inLocale:)();
}

uint64_t sub_14D3C0()
{
  return AppInformationResolver.init(app:)();
}

uint64_t sub_14D3D0()
{
  return type metadata accessor for AppInformationResolver();
}

uint64_t sub_14D3E0()
{
  return IntentResolutionRecord.intentResponse.getter();
}

uint64_t sub_14D3F0()
{
  return IntentResolutionRecord.app.getter();
}

uint64_t sub_14D400()
{
  return IntentResolutionRecord.intent.getter();
}

uint64_t sub_14D410()
{
  return type metadata accessor for IntentResolutionRecord();
}

uint64_t sub_14D420()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_14D430()
{
  return static AppConfirmationResponse.cancel()();
}

uint64_t sub_14D440()
{
  return static AppConfirmationResponse.ignore()();
}

uint64_t sub_14D450()
{
  return type metadata accessor for AppConfirmationResponse();
}

uint64_t sub_14D460()
{
  return dispatch thunk of MachineUtteranceBuilder.addMappingIfPresent(node:value:)();
}

uint64_t sub_14D470()
{
  return dispatch thunk of MachineUtteranceBuilder.build()();
}

uint64_t sub_14D480()
{
  return MachineUtteranceBuilder.init()();
}

uint64_t sub_14D490()
{
  return type metadata accessor for MachineUtteranceBuilder();
}

uint64_t sub_14D4A0()
{
  return NeedsConfirmationAnswer.init(answeredValue:updatedIntent:)();
}

uint64_t sub_14D4C0()
{
  return OutputGenerationManifest.init(dialogPhase:_:)();
}

uint64_t sub_14D4D0()
{
  return OutputGenerationManifest.responseType.setter();
}

uint64_t sub_14D4E0()
{
  return OutputGenerationManifest.resultViewId.setter();
}

uint64_t sub_14D4F0()
{
  return OutputGenerationManifest.responseViewId.setter();
}

uint64_t sub_14D500()
{
  return OutputGenerationManifest.canUseServerTTS.setter();
}

uint64_t sub_14D510()
{
  return OutputGenerationManifest.nlContextUpdate.setter();
}

uint64_t sub_14D520()
{
  return OutputGenerationManifest.listenAfterSpeaking.setter();
}

uint64_t sub_14D530()
{
  return OutputGenerationManifest.printSupportingDialogInDisplayModes.setter();
}

uint64_t sub_14D540()
{
  return type metadata accessor for OutputGenerationManifest();
}

uint64_t sub_14D550()
{
  return static AppDisambiguationResponse.cancel()();
}

uint64_t sub_14D560()
{
  return static AppDisambiguationResponse.ignore()();
}

uint64_t sub_14D570()
{
  return static AppDisambiguationResponse.select(app:)();
}

uint64_t sub_14D580()
{
  return type metadata accessor for AppDisambiguationResponse();
}

uint64_t sub_14D590()
{
  return ParameterResolutionRecord.app.getter();
}

uint64_t sub_14D5A0()
{
  return ParameterResolutionRecord.intent.getter();
}

uint64_t sub_14D5B0()
{
  return ParameterResolutionRecord.result.getter();
}

uint64_t sub_14D5C0()
{
  return ParameterResolutionRecord.parameter.getter();
}

uint64_t sub_14D5D0()
{
  return type metadata accessor for ParameterResolutionRecord();
}

uint64_t sub_14D670()
{
  return BasicDisambiguationItemContainer.init(_:_:)();
}

uint64_t sub_14D6B0()
{
  return SimpleConfirmationResponseProvider.init(_:)();
}

uint64_t sub_14D6C0()
{
  return Input.parse.getter();
}

uint64_t sub_14D6D0()
{
  return Input.init(parse:)();
}

uint64_t sub_14D6E0()
{
  return type metadata accessor for Input();
}

uint64_t sub_14D6F0()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_14D700()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_14D710()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_14D720()
{
  return type metadata accessor for Parse();
}

uint64_t sub_14D730()
{
  return static Device.current.getter();
}

uint64_t sub_14D740()
{
  return USOParse.userParse.getter();
}

uint64_t sub_14D750()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_14D760()
{
  return AceOutput.init(commands:flowActivity:)();
}

uint64_t sub_14D770()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_14D780()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_14D790()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t sub_14D7A0()
{
  return Siri_Nlu_External_UserParse.userDialogActs.getter();
}

uint64_t sub_14D7B0()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_14D7C0()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t sub_14D7D0()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t sub_14D7E0()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t sub_14D7F0()
{
  return Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
}

uint64_t sub_14D800()
{
  return Siri_Nlu_External_UserDialogAct.hasRejected.getter();
}

uint64_t sub_14D810()
{
  return Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
}

uint64_t sub_14D820()
{
  return Siri_Nlu_External_UserDialogAct.userStatedTask.setter();
}

uint64_t sub_14D830()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t sub_14D840()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t sub_14D850()
{
  return Siri_Nlu_External_SystemPrompted.target.setter();
}

uint64_t sub_14D860()
{
  return Siri_Nlu_External_SystemPrompted.init()();
}

uint64_t sub_14D870()
{
  return type metadata accessor for Siri_Nlu_External_SystemPrompted();
}

uint64_t sub_14D880()
{
  return Siri_Nlu_External_UserStatedTask.task.setter();
}

uint64_t sub_14D890()
{
  return Siri_Nlu_External_UserStatedTask.init()();
}

uint64_t sub_14D8A0()
{
  return type metadata accessor for Siri_Nlu_External_UserStatedTask();
}

uint64_t sub_14D8B0()
{
  return Siri_Nlu_External_SystemDialogAct.gaveOptions.setter();
}

uint64_t sub_14D8C0()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t sub_14D8D0()
{
  return Siri_Nlu_External_SystemDialogAct.prompted.setter();
}

uint64_t sub_14D8E0()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t sub_14D8F0()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t sub_14D900()
{
  return Siri_Nlu_External_SystemGaveOptions.choices.setter();
}

uint64_t sub_14D910()
{
  return Siri_Nlu_External_SystemGaveOptions.init()();
}

uint64_t sub_14D920()
{
  return type metadata accessor for Siri_Nlu_External_SystemGaveOptions();
}

uint64_t sub_14D930()
{
  return static SiriNLUTypesPrintUtils.printableProtoObject(object:)();
}

uint64_t sub_14D940()
{
  return type metadata accessor for SiriNLUTypesPrintUtils();
}

uint64_t sub_14D950()
{
  return static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)();
}

uint64_t sub_14D960()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t sub_14D970()
{
  return NonTerminalOntologyNode.init(name:multicardinal:childNodes:)();
}

uint64_t sub_14D980()
{
  return NonTerminalOntologyNode.name.getter();
}

uint64_t sub_14D990()
{
  return type metadata accessor for NonTerminalOntologyNode();
}

uint64_t sub_14D9A0()
{
  return type metadata accessor for UsoEntity_common_UserEntity();
}

uint64_t sub_14D9B0()
{
  return dispatch thunk of UsoEntityBuilder_common_UserEntity.addNames(value:)();
}

uint64_t sub_14D9C0()
{
  return UsoEntityBuilder_common_UserEntity.init()();
}

uint64_t sub_14D9D0()
{
  return type metadata accessor for UsoEntityBuilder_common_UserEntity();
}

uint64_t sub_14D9E0()
{
  return DomainOntologyNode.init(name:childNodes:isInEventTree:)();
}

uint64_t sub_14D9F0()
{
  return type metadata accessor for DomainOntologyNode();
}

uint64_t sub_14DA00()
{
  return TerminalOntologyNode.init(name:multicardinal:)();
}

uint64_t sub_14DA10()
{
  return TerminalOntologyNode.name.getter();
}

uint64_t sub_14DA20()
{
  return dispatch thunk of OntologyNode.name.getter();
}

uint64_t sub_14DA30()
{
  return CodeGenBase.entity.getter();
}

uint64_t sub_14DA40()
{
  return SpanProperty.valueString.getter();
}

uint64_t sub_14DA50()
{
  return SpanProperty.key.getter();
}

uint64_t sub_14DA60()
{
  return type metadata accessor for SpanProperty();
}

uint64_t sub_14DA70()
{
  return UsoEntitySpan.originEntityId.getter();
}

uint64_t sub_14DA80()
{
  return UsoEntitySpan.SpanSource.rawValue.getter();
}

uint64_t sub_14DA90()
{
  return type metadata accessor for UsoEntitySpan.SpanSource();
}

uint64_t sub_14DAA0()
{
  return UsoEntitySpan.properties.getter();
}

uint64_t sub_14DAB0()
{
  return UsoEntitySpan.originAppId.getter();
}

uint64_t sub_14DAC0()
{
  return UsoEntitySpan.sourceComponent.getter();
}

uint64_t sub_14DAD0()
{
  return UsoEntitySpan.payloadAttachmentInfo.getter();
}

uint64_t sub_14DAE0()
{
  return UsoEntitySpan.label.getter();
}

uint64_t sub_14DAF0()
{
  return UsoEntitySpan.matchInfo.getter();
}

uint64_t sub_14DB00()
{
  return type metadata accessor for UsoEntitySpan();
}

uint64_t sub_14DB10()
{
  return UsoIdentifier.NluComponent.init(rawValue:)();
}

uint64_t sub_14DB20()
{
  return UsoIdentifier.NluComponent.rawValue.getter();
}

uint64_t sub_14DB30()
{
  return type metadata accessor for UsoIdentifier.NluComponent();
}

uint64_t sub_14DB70()
{
  return TerminalElement.MatchingSpan.appId.getter();
}

uint64_t sub_14DB80()
{
  return type metadata accessor for TerminalElement.MatchingSpan();
}

uint64_t sub_14DB90()
{
  return type metadata accessor for TerminalElement.OriginDetail();
}

uint64_t sub_14DBA0()
{
  return TerminalElement.Origin.originDetail.getter();
}

uint64_t sub_14DBB0()
{
  return type metadata accessor for TerminalElement.Origin();
}

uint64_t sub_14DBC0()
{
  return TerminalElement.origin.getter();
}

uint64_t sub_14DBD0()
{
  return type metadata accessor for TerminalElement();
}

uint64_t sub_14DBE0()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t sub_14DBF0()
{
  return dispatch thunk of CodeGenListEntry.entry.getter();
}

uint64_t sub_14DC00()
{
  return dispatch thunk of CodeGenGlobalArgs.usoQuantifier.getter();
}

uint64_t sub_14DC10()
{
  return dispatch thunk of CodeGenGlobalArgs.getEntitySpansFor(attributeName:)();
}

uint64_t sub_14DC20()
{
  return UsoBuilderOptions.init(longhandDefinedValues:)();
}

uint64_t sub_14DC30()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t sub_14DC40()
{
  return TerminalIntentNode.ontologyNodeName.getter();
}

uint64_t sub_14DC50()
{
  return TerminalIntentNode.elements.getter();
}

uint64_t sub_14DC60()
{
  return type metadata accessor for TerminalIntentNode();
}

uint64_t sub_14DC70()
{
  return type metadata accessor for UsoEntity_common_App();
}

uint64_t sub_14DC80()
{
  return IntentNodeTraversable.value<A>(forNode:)();
}

uint64_t sub_14DC90()
{
  return NonTerminalIntentNode.ontologyNodeName.getter();
}

uint64_t sub_14DCA0()
{
  return NonTerminalIntentNode.childNodes.getter();
}

uint64_t sub_14DCB0()
{
  return type metadata accessor for NonTerminalIntentNode();
}

uint64_t sub_14DCC0()
{
  return type metadata accessor for PayloadAttachmentInfo.AttachmentType();
}

uint64_t sub_14DCD0()
{
  return PayloadAttachmentInfo.attachmentType.getter();
}

uint64_t sub_14DCE0()
{
  return type metadata accessor for PayloadAttachmentInfo();
}

uint64_t sub_14DCF0()
{
  return dispatch thunk of UsoEntity_common_Number.definedValue.getter();
}

uint64_t sub_14DD00()
{
  return UsoEntity_common_Number.DefinedValues.rawValue.getter();
}

uint64_t sub_14DD10()
{
  return type metadata accessor for UsoEntity_common_Number.DefinedValues();
}

uint64_t sub_14DD20()
{
  return type metadata accessor for UsoEntity_common_Number();
}

uint64_t sub_14DD30()
{
  return dispatch thunk of UsoEntity_common_Decimal.canonicalString.getter();
}

uint64_t sub_14DD40()
{
  return type metadata accessor for UsoEntity_common_Decimal();
}

uint64_t sub_14DD50()
{
  return dispatch thunk of UsoEntity_common_Integer.integerValue.getter();
}

uint64_t sub_14DD60()
{
  return type metadata accessor for UsoEntity_common_Integer();
}

uint64_t sub_14DD70()
{
  return dispatch thunk of UsoEntity_common_Setting.associatedSetting.getter();
}

uint64_t sub_14DD80()
{
  return type metadata accessor for UsoEntity_common_Setting();
}

uint64_t sub_14DD90()
{
  return static UsoTask_CodegenConverter.convert(task:)();
}

uint64_t sub_14DDA0()
{
  return dispatch thunk of UsoEntityBuilderGlobalArgs.setUsoAssociatedApp(value:)();
}

uint64_t sub_14DDB0()
{
  return static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)();
}

uint64_t sub_14DDC0()
{
  return UsoEntity_common_RadioBand.DefinedValues.init(rawValue:)();
}

uint64_t sub_14DDD0()
{
  return type metadata accessor for UsoEntity_common_RadioBand.DefinedValues();
}

uint64_t sub_14DDE0()
{
  return dispatch thunk of UsoEntityBuilder_common_App.setName(value:)();
}

uint64_t sub_14DDF0()
{
  return UsoEntityBuilder_common_App.init()();
}

uint64_t sub_14DE00()
{
  return type metadata accessor for UsoEntityBuilder_common_App();
}

uint64_t sub_14DE10()
{
  return dispatch thunk of UsoEntity_common_Quantifier.definedValue.getter();
}

uint64_t sub_14DE20()
{
  return type metadata accessor for UsoEntity_common_Quantifier.DefinedValues();
}

uint64_t sub_14DE30()
{
  return dispatch thunk of UsoEntity_common_Measurement.components.getter();
}

uint64_t sub_14DE40()
{
  return type metadata accessor for UsoEntity_common_Measurement();
}

uint64_t sub_14DE50()
{
  return type metadata accessor for UsoEntity_common_RadioStation();
}

uint64_t sub_14DE60()
{
  return UsoEntityBuilder_common_Setting.init()();
}

uint64_t sub_14DE70()
{
  return type metadata accessor for UsoEntityBuilder_common_Setting();
}

uint64_t sub_14DE90()
{
  return type metadata accessor for UsoEntity_common_TemperatureUnit();
}

uint64_t sub_14DEA0()
{
  return dispatch thunk of UsoEntity_common_MultipliedNumber.multiplier.getter();
}

uint64_t sub_14DEB0()
{
  return dispatch thunk of UsoEntity_common_MultipliedNumber.value.getter();
}

uint64_t sub_14DEC0()
{
  return type metadata accessor for UsoEntity_common_MultipliedNumber();
}

uint64_t sub_14DED0()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_Reference.setReference(value:)();
}

uint64_t sub_14DEE0()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_Reference.addUserEntities(value:)();
}

uint64_t sub_14DEF0()
{
  return UsoTaskBuilder_enable_common_Setting.init()();
}

uint64_t sub_14DF00()
{
  return type metadata accessor for UsoTaskBuilder_enable_common_Setting();
}

uint64_t sub_14DF10()
{
  return dispatch thunk of UsoEntity_common_MeasurementComponent.unit.getter();
}

uint64_t sub_14DF20()
{
  return dispatch thunk of UsoEntity_common_MeasurementComponent.value.getter();
}

uint64_t sub_14DF30()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTrigger.setReference(value:)();
}

uint64_t sub_14DF40()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTrigger.addUserEntities(value:)();
}

uint64_t sub_14DF50()
{
  return UsoTaskBuilder_checkExistence_common_Setting.init()();
}

uint64_t sub_14DF60()
{
  return type metadata accessor for UsoTaskBuilder_checkExistence_common_Setting();
}

uint64_t sub_14DF70()
{
  return UsoTask.verbString.getter();
}

uint64_t sub_14DF80()
{
  return UsoTask.baseEntityAsString.getter();
}

uint64_t sub_14DF90()
{
  return UsoTask.arguments.getter();
}

uint64_t sub_14DFA0()
{
  return NLIntent.domainNode.getter();
}

uint64_t sub_14DFB0()
{
  return type metadata accessor for NLIntent();
}

uint64_t sub_14DFC0()
{
  return dispatch thunk of UsoValue.getAsPrimitiveValueString()();
}

uint64_t sub_14DFD0()
{
  return dispatch thunk of UsoValue.getAsPrimitiveValueInteger()();
}

uint64_t sub_14DFE0()
{
  return dispatch thunk of UsoValue.getAsEntity()();
}

uint64_t sub_14DFF0()
{
  return MatchInfo.hasMatchSignals(_:)();
}

uint64_t sub_14E000()
{
  return static MatchInfo.MatchSignals.approximateMatch.getter();
}

uint64_t sub_14E010()
{
  return static MatchInfo.MatchSignals.exactMatch.getter();
}

uint64_t sub_14E020()
{
  return static MatchInfo.MatchSignals.partialMatch.getter();
}

uint64_t sub_14E030()
{
  return type metadata accessor for MatchInfo.MatchSignals();
}

uint64_t sub_14E040()
{
  return type metadata accessor for MatchInfo();
}

uint64_t sub_14E050()
{
  return UsoEntity.attributes.getter();
}

uint64_t sub_14E060()
{
  return UsoEntity.entitySpans.getter();
}

uint64_t sub_14E070()
{
  return UsoEntity.valueTypeString.getter();
}

uint64_t sub_14E080()
{
  return UsoEntity.usoValue.getter();
}

uint64_t sub_14E090()
{
  return type metadata accessor for UsoEntity();
}

uint64_t sub_14E0A0()
{
  return static CAUVehicleLayoutKey.End.== infix(_:_:)();
}

uint64_t sub_14E0B0()
{
  return type metadata accessor for CAUVehicleLayoutKey.End();
}

uint64_t sub_14E0C0()
{
  return CAUVehicleLayoutKey.end.getter();
}

uint64_t sub_14E0D0()
{
  return CAUVehicleLayoutKey.init(rawValue:)();
}

uint64_t sub_14E0E0()
{
  return CAUVehicleLayoutKey.rawValue.getter();
}

uint64_t sub_14E0F0()
{
  return type metadata accessor for CAUVehicleLayoutKey();
}

uint64_t sub_14E100()
{
  return SiriEnvironment.currentDevice.getter();
}

uint64_t sub_14E110()
{
  return static SiriEnvironment.default.getter();
}

uint64_t sub_14E120()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_14E130()
{
  return dispatch thunk of CurrentDevice.siriLocale.getter();
}

uint64_t sub_14E140()
{
  return DialogTemperature.Builder.init()();
}

uint64_t sub_14E150()
{
  return type metadata accessor for DialogTemperature.Builder();
}

uint64_t sub_14E160()
{
  return type metadata accessor for DialogTemperature();
}

uint64_t sub_14E170()
{
  return dispatch thunk of DialogAbstractMeasurement.mockGlobals.setter();
}

uint64_t sub_14E180()
{
  return DialogAbstractMeasurement.value.getter();
}

uint64_t sub_14E190()
{
  return dispatch thunk of DialogAbstractMeasurement.Builder.build()();
}

uint64_t sub_14E1A0()
{
  return dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
}

uint64_t sub_14E1B0()
{
  return dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
}

uint64_t sub_14E1C0()
{
  return dispatch thunk of DialogConvertibleMeasurement.mockGlobals.setter();
}

uint64_t sub_14E1D0()
{
  return dispatch thunk of DialogConvertibleMeasurement.Builder.build()();
}

uint64_t sub_14E1E0()
{
  return dispatch thunk of DialogConvertibleMeasurement.Builder.withUnits(_:)();
}

uint64_t sub_14E1F0()
{
  return dispatch thunk of DialogConvertibleMeasurement.Builder.withValue(_:)();
}

uint64_t sub_14E200()
{
  return DialogLength.Builder.init()();
}

uint64_t sub_14E210()
{
  return type metadata accessor for DialogLength.Builder();
}

uint64_t sub_14E220()
{
  return type metadata accessor for DialogLength();
}

uint64_t sub_14E230()
{
  return DialogPercent.Builder.init()();
}

uint64_t sub_14E240()
{
  return type metadata accessor for DialogPercent.Builder();
}

uint64_t sub_14E250()
{
  return type metadata accessor for DialogPercent();
}

uint64_t sub_14E260()
{
  return dispatch thunk of DialogDuration.Builder.build()();
}

uint64_t sub_14E270()
{
  return dispatch thunk of DialogDuration.Builder.withSecs(_:)();
}

uint64_t sub_14E280()
{
  return DialogDuration.Builder.init()();
}

uint64_t sub_14E290()
{
  return type metadata accessor for DialogDuration.Builder();
}

uint64_t sub_14E2A0()
{
  return type metadata accessor for DialogDuration();
}

uint64_t sub_14E2B0()
{
  return CATGlobals.__allocating_init(device:)();
}

uint64_t sub_14E2C0()
{
  return type metadata accessor for CATGlobals();
}

uint64_t sub_14E2D0()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t sub_14E2E0()
{
  return CATWrapper.__allocating_init(options:globals:)();
}

uint64_t sub_14E2F0()
{
  return CATWrapper.deinit();
}

uint64_t sub_14E300()
{
  return SpeakableString.init(print:speak:)();
}

uint64_t sub_14E310()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_14E320()
{
  return CATWrapperSimple.init(templateDir:options:globals:)();
}

uint64_t sub_14E330()
{
  return CATWrapperSimple.init(useResponseMode:options:)();
}

uint64_t sub_14E340()
{
  return CATWrapperSimple.__allocating_init(options:globals:)();
}

uint64_t sub_14E350()
{
  return CATWrapperSimple.deinit();
}

uint64_t sub_14E360()
{
  return SirikitDeviceState.__allocating_init(from:)();
}

uint64_t sub_14E370()
{
  return type metadata accessor for SirikitDeviceState();
}

uint64_t sub_14E380()
{
  return dispatch thunk of LabelExecutionResult.subscript.getter();
}

uint64_t sub_14E390()
{
  return CATType.toDictionary.getter();
}

uint64_t sub_14E3A0()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_14E3B0()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_14E3C0()
{
  return static CATTester.execute(bundle:catId:parameters:globals:callback:options:)();
}

uint64_t sub_14E3D0()
{
  return type metadata accessor for CATTester();
}

uint64_t sub_14E3E0()
{
  return App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)();
}

uint64_t sub_14E3F0()
{
  return App.__allocating_init(appIdentifier:)();
}

uint64_t sub_14E400()
{
  return App.appIdentifier.getter();
}

uint64_t sub_14E410()
{
  return type metadata accessor for App();
}

uint64_t sub_14E420()
{
  return AppDisplayInfo.init(displayName:isFirstParty:)();
}

uint64_t sub_14E430()
{
  return type metadata accessor for AppDisplayInfo();
}

uint64_t sub_14E440()
{
  return type metadata accessor for AppSupportQuery.AllowedSiriAuthorizationStatuses();
}

uint64_t sub_14E450()
{
  return type metadata accessor for AppSupportQuery.AllowedExtensionPointIdentifiers();
}

uint64_t sub_14E460()
{
  return AppSupportQuery.init(intentID:allowedSiriAuthorizationStatus:allowedExtensionPointIdentifiers:)();
}

uint64_t sub_14E470()
{
  return type metadata accessor for AppSupportQuery();
}

uint64_t sub_14E480()
{
  return static AppSupportService.sharedInstance.getter();
}

uint64_t sub_14E490()
{
  return type metadata accessor for AppSupportService();
}

uint64_t sub_14E4A0()
{
  return CarCommandsGaugeSnippetModel.init(carName:primaryText:secondaryText:gaugePercentFull:showGaugeAccessoryView:appId:)();
}

uint64_t sub_14E4B0()
{
  return CarCommandsToggleSnippetModel.init(carNameText:onStateText:offStateText:onTransitionText:offTransitionText:isOn:appId:carNameDirectInvocationPayloadValue:)();
}

uint64_t sub_14E4C0()
{
  return type metadata accessor for CarCommandsToggleSnippetModel();
}

uint64_t sub_14E4D0()
{
  return type metadata accessor for CarCommandsSnippetsPluginModel();
}

uint64_t sub_14E4E0()
{
  return CarCommandsAppPunchoutSnippetModel.init(appNameText:appIdentifier:)();
}

uint64_t sub_14E4F0()
{
  return type metadata accessor for CarCommandsAppPunchoutSnippetModel();
}

uint64_t sub_14E500()
{
  return CarCommandsConfirmationSnippetModel.init(confirmText:denyText:)();
}

uint64_t sub_14E510()
{
  return type metadata accessor for CarCommandsConfirmationSnippetModel();
}

uint64_t sub_14E520()
{
  return CarCommandsToggleSnippetUpdateValue.init(toggleIsOn:)();
}

uint64_t sub_14E530()
{
  return type metadata accessor for CarCommandsToggleSnippetUpdateValue();
}

uint64_t sub_14E540()
{
  return CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(text:iconImageIdentifier:directInvocationPayloadValue:)();
}

uint64_t sub_14E550()
{
  return CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(text:directInvocationPayloadValue:)();
}

uint64_t sub_14E560()
{
  return type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption();
}

uint64_t sub_14E570()
{
  return CarCommandsDisambiguationSnippetModel.init(title:disambiguationOptions:)();
}

uint64_t sub_14E580()
{
  return type metadata accessor for CarCommandsDisambiguationSnippetModel();
}

uint64_t sub_14E590()
{
  return CarCommandsToggleSnippetUpdateFailure.init(failureText:)();
}

uint64_t sub_14E5A0()
{
  return type metadata accessor for CarCommandsToggleSnippetUpdateFailure();
}

uint64_t sub_14E5B0()
{
  return type metadata accessor for DeactivateSignalCarSignalResolutionResult();
}

uint64_t sub_14E5C0()
{
  return type metadata accessor for GetSignalActivationStatusCarSignalResolutionResult();
}

uint64_t sub_14E5D0()
{
  return type metadata accessor for GetCarClimateIntent();
}

uint64_t sub_14E5E0()
{
  return GetCarClimateIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E5F0()
{
  return type metadata accessor for GetCarClimateIntentResponse();
}

uint64_t sub_14E600()
{
  return type metadata accessor for SetCarClimateIntent();
}

uint64_t sub_14E610()
{
  return type metadata accessor for SetCarPlayClimateIntent();
}

uint64_t sub_14E620()
{
  return type metadata accessor for SetCarRadioStationIntent();
}

uint64_t sub_14E630()
{
  return SetCarClimateIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E640()
{
  return type metadata accessor for SetCarClimateIntentResponse();
}

uint64_t sub_14E650()
{
  return type metadata accessor for SetCarPlaySeatSettingsIntent();
}

uint64_t sub_14E660()
{
  return SetCarPlayClimateIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E670()
{
  return type metadata accessor for SetCarPlayClimateIntentResponse();
}

uint64_t sub_14E680()
{
  return SetCarRadioStationIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E690()
{
  return type metadata accessor for SetCarRadioStationIntentResponse();
}

uint64_t sub_14E6A0()
{
  return SetCarPlaySeatSettingsIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E6B0()
{
  return type metadata accessor for SetCarPlaySeatSettingsIntentResponse();
}

uint64_t sub_14E6C0()
{
  return IntentSeatType.init(rawValue:)();
}

uint64_t sub_14E6D0()
{
  return type metadata accessor for GetTrunkStatusIntent();
}

uint64_t sub_14E6E0()
{
  return type metadata accessor for SetTrunkStatusIntent();
}

uint64_t sub_14E6F0()
{
  return type metadata accessor for DeactivateSignalIntent();
}

uint64_t sub_14E700()
{
  return IntentTemperatureChange.init(rawValue:)();
}

uint64_t sub_14E710()
{
  return GetTrunkStatusIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E720()
{
  return type metadata accessor for GetTrunkStatusIntentResponse();
}

uint64_t sub_14E730()
{
  return SetTrunkStatusIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E740()
{
  return type metadata accessor for SetTrunkStatusIntentResponse();
}

uint64_t sub_14E760()
{
  return type metadata accessor for DeactivateSignalIntentResponse();
}

uint64_t sub_14E770()
{
  return type metadata accessor for GetSignalActivationStatusIntent();
}

uint64_t sub_14E780()
{
  return static IntentTrunkStatusResolutionResult.success(with:)();
}

uint64_t sub_14E790()
{
  return type metadata accessor for IntentTrunkStatusResolutionResult();
}

uint64_t sub_14E7A0()
{
  return GetSignalActivationStatusIntentResponse.__allocating_init(code:userActivity:)();
}

uint64_t sub_14E7B0()
{
  return type metadata accessor for GetSignalActivationStatusIntentResponse();
}

uint64_t sub_14E7C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_14E7D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_14E7E0()
{
  return Logger.init(_:)();
}

NSDictionary sub_14E7F0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_14E800()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14E810()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_14E820()
{
  return Character.lowercased()()._countAndFlagsBits;
}

uint64_t sub_14E830()
{
  return Character.uppercased()()._countAndFlagsBits;
}

uint64_t sub_14E840()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_14E850()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_14E860()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_14E870()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14E880()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14E890()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_14E8A0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_14E8B0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_14E8C0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_14E8D0()
{
  return String.uppercased()()._countAndFlagsBits;
}

uint64_t sub_14E8E0()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_14E8F0()
{
  return String.toSpeakableString.getter();
}

uint64_t sub_14E900()
{
  return String.hash(into:)();
}

uint64_t sub_14E910()
{
  return String.count.getter();
}

uint64_t sub_14E920()
{
  return String.index(before:)();
}

uint64_t sub_14E930()
{
  return String.index(_:offsetBy:limitedBy:)();
}

uint64_t sub_14E940()
{
  return String.append<A>(contentsOf:)();
}

void sub_14E950(Swift::String a1)
{
}

Swift::Int sub_14E960()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_14E970(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_14E980()
{
  return String.subscript.getter();
}

uint64_t sub_14E990()
{
  return String.init<A>(_:)();
}

uint64_t sub_14E9A0()
{
  return String.subscript.getter();
}

uint64_t sub_14E9B0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_14E9C0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_14E9D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_14E9E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14E9F0()
{
  return Array.description.getter();
}

uint64_t sub_14EA00()
{
  return specialized Array._endMutation()();
}

uint64_t sub_14EA10()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_14EA20()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_14EA30()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_14EA40()
{
  return static Bool._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14EA50()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_14EA60()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_14EA70()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_14EA80()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_14EA90()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_14EAB0()
{
  return Float.write<A>(to:)();
}

uint64_t sub_14EAC0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14EAD0()
{
  return Set.description.getter();
}

uint64_t sub_14EAE0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_14EAF0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_14EB00()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_14EB10()
{
  return CAFClimate.on.getter();
}

uint64_t sub_14EB20()
{
  return CAFClimate.on.setter();
}

uint64_t sub_14EB30()
{
  return NSDimension.init(forLocale:)();
}

uint64_t sub_14EB40()
{
  return CAFPositioned.layoutKey.getter();
}

uint64_t sub_14EB50()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_14EB60()
{
  return NSUnitTemperature.init(forLocale:usage:)();
}

uint64_t sub_14EB70()
{
  return CAFPositionManager.vehicleLayoutKeys(for:)();
}

uint64_t sub_14EB80()
{
  return CAFPositionManager.services(for:includeSharedServices:requireSpecificServices:filter:)();
}

INSetCarLockStatusIntent sub_14EB90(Swift::Bool_optional locked, INSpeakableString_optional carName)
{
  return INSetCarLockStatusIntent.init(locked:carName:)(locked, carName);
}

uint64_t sub_14EBA0()
{
  return INSetCarLockStatusIntent.locked.getter();
}

uint64_t sub_14EBB0()
{
  return INGetCarLockStatusIntentResponse.locked.getter();
}

uint64_t sub_14EBC0()
{
  return INGetCarLockStatusIntentResponse.locked.setter();
}

uint64_t sub_14EBD0()
{
  return INGetCarPowerLevelStatusIntentResponse.minutesToFull.getter();
}

uint64_t sub_14EBE0()
{
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter();
}

uint64_t sub_14EBF0()
{
  return INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.getter();
}

uint64_t sub_14EC00()
{
  return INGetCarPowerLevelStatusIntentResponse.charging.getter();
}

NSNumber sub_14EC10(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_14EC20(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_14EC30(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_14EC40()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_14EC50()
{
  return AceObject.serializeToBase64()().value._countAndFlagsBits;
}

uint64_t sub_14EC60()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_14EC70()
{
  return type metadata accessor for Optional();
}

uint64_t sub_14EC80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_14EC90()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_14ECA0()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_14ECC0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_14ECD0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_14ECF0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_14ED00()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t sub_14ED10()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_14ED20()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_14ED30()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_14ED50()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_14ED60()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_14ED70()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_14ED80()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_14ED90()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_14EDA0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_14EDB0()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_14EDC0()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int sub_14EDD0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_14EDE0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_14EDF0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_14EE00()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_14EE10()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_14EE20()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_14EE30()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_14EE40(Swift::Int a1)
{
}

uint64_t sub_14EE50()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_14EE60()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_14EE70()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_14EE80()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_14EE90()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_14EEA0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_14EEB0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_14EEC0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_14EED0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_14EEE0()
{
  return _print_unlocked<A, B>(_:_:)();
}

BOOL sub_14EEF0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_14EF00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_14EF10()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_14EF20()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_14EF30()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_14EF40()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_14EF50(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_14EF60()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_14EF70()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

Swift::Int sub_14EF80(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_14EF90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_14EFB0()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_14EFC0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_14EFD0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_14EFF0()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_14F000()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_14F010()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_14F020()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_14F030()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_14F040()
{
  return Error._code.getter();
}

uint64_t sub_14F050()
{
  return Error._domain.getter();
}

uint64_t sub_14F060()
{
  return Error._userInfo.getter();
}

uint64_t sub_14F070()
{
  return Hasher.init(_seed:)();
}

void sub_14F080(Swift::UInt a1)
{
}

void sub_14F090(Swift::UInt8 a1)
{
}

void sub_14F0A0(Swift::UInt64 a1)
{
}

Swift::Int sub_14F0B0()
{
  return Hasher._finalize()();
}

uint64_t sub_14F0C0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_14F0D0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_14F100()
{
  return _typeName(_:qualified:)();
}

uint64_t NSStringFromCharacteristicState()
{
  return _NSStringFromCharacteristicState();
}

uint64_t PKGetClassNFDigitalCarKeySession()
{
  return _PKGetClassNFDigitalCarKeySession();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t uameasfmt_getUnitsForUsage()
{
  return _uameasfmt_getUnitsForUsage();
}

id objc_msgSend__carKeyPassForUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_carKeyPassForUniqueIdentifier:");
}

id objc_msgSend__findExactMatchOnSpokenPhraseForCarPass_spokenPhrase_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findExactMatchOnSpokenPhraseForCarPass:spokenPhrase:completion:");
}

id objc_msgSend__getVehicleReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getVehicleReport:");
}

id objc_msgSend__secureElementPassCorrespondingToPhrase_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_secureElementPassCorrespondingToPhrase:completion:");
}

id objc_msgSend_activatePaymentApplication_forPaymentPass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatePaymentApplication:forPaymentPass:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_attachDefaultBehaviorToSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachDefaultBehaviorToSession:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_devicePrimaryContactlessPaymentApplication(void *a1, const char *a2, ...)
{
  return _[a1 devicePrimaryContactlessPaymentApplication];
}

id objc_msgSend_devicePrimaryPaymentApplication(void *a1, const char *a2, ...)
{
  return _[a1 devicePrimaryPaymentApplication];
}

id objc_msgSend_disambiguationWithStringsToDisambiguate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguationWithStringsToDisambiguate:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_getStatusForRKEFunction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStatusForRKEFunction:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithVocabularyIdentifier_spokenPhrase_pronunciationHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateSessionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateSessionWithCompletion:");
}

id objc_msgSend_isCarReadyForCommunication(void *a1, const char *a2, ...)
{
  return _[a1 isCarReadyForCommunication];
}

id objc_msgSend_isCurrentFunctionAlreadyInDesiredState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentFunctionAlreadyInDesiredState:");
}

id objc_msgSend_isRKEFunctionSupported_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRKEFunctionSupported:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return _[a1 notRequired];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_passWithUniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passWithUniqueID:");
}

id objc_msgSend_passesOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passesOfType:");
}

id objc_msgSend_pk_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pk_objectsPassingTest:");
}

id objc_msgSend_pk_setByApplyingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pk_setByApplyingBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_secureElementPass(void *a1, const char *a2, ...)
{
  return _[a1 secureElementPass];
}

id objc_msgSend_sendRKEFunction_action_withAuthorization_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRKEFunction:action:withAuthorization:completion:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_spokenPhrase(void *a1, const char *a2, ...)
{
  return _[a1 spokenPhrase];
}

id objc_msgSend_startDigitalCarKeySessionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDigitalCarKeySessionWithCompletion:");
}

id objc_msgSend_subcredentials(void *a1, const char *a2, ...)
{
  return _[a1 subcredentials];
}

id objc_msgSend_successWithResolvedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedString:");
}

id objc_msgSend_supportedCarKeyIntents(void *a1, const char *a2, ...)
{
  return _[a1 supportedCarKeyIntents];
}

id objc_msgSend_supportedSiriIntents(void *a1, const char *a2, ...)
{
  return _[a1 supportedSiriIntents];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_vehicleReports_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vehicleReports:");
}

id objc_msgSend_vocabularyIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vocabularyIdentifier];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}