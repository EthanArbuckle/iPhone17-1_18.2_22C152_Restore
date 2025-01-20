uint64_t CBProductIDIsW2(unsigned int a1)
{
  char v1;
  uint64_t v2;
  char v4;

  if (a1 <= 0x200A)
  {
    v2 = a1 - 8202;
    v1 = 0;
  }
  else
  {
    v2 = a1 - 8202;
    v1 = 1;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        v4 = 1;
        return v4 & 1;
      case 1:
        v4 = 1;
        return v4 & 1;
      case 2:
        v4 = 1;
        return v4 & 1;
      case 3:
        v4 = 1;
        return v4 & 1;
      case 4:
        v4 = 1;
        return v4 & 1;
      case 5:
        v4 = 1;
        return v4 & 1;
      case 6:
      case 7:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
        break;
      case 8:
        v4 = 1;
        return v4 & 1;
      case 9:
        v4 = 1;
        return v4 & 1;
      case 21:
        v4 = 1;
        return v4 & 1;
      default:
        JUMPOUT(0);
    }
  }
  v4 = 0;
  return v4 & 1;
}

uint64_t CBProductIDIsW3(unsigned int a1)
{
  if (a1 <= 0x2014)
  {
    uint64_t v2 = a1 - 8212;
    char v1 = 0;
  }
  else
  {
    uint64_t v2 = a1 - 8212;
    char v1 = 1;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        char v4 = 1;
        return v4 & 1;
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 8:
      case 11:
      case 13:
      case 14:
      case 15:
        break;
      case 5:
        char v4 = 1;
        return v4 & 1;
      case 7:
        char v4 = 1;
        return v4 & 1;
      case 9:
        char v4 = 1;
        return v4 & 1;
      case 10:
        char v4 = 1;
        return v4 & 1;
      case 12:
        char v4 = 1;
        return v4 & 1;
      case 16:
        char v4 = 1;
        return v4 & 1;
      default:
        JUMPOUT(0);
    }
  }
  char v4 = 0;
  return v4 & 1;
}

uint64_t one-time initialization function for binding()
{
  uint64_t v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static Logger.binding);
  __swift_project_value_buffer(v1, (uint64_t)static Logger.binding);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.HeadphoneManager", 0x1AuLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Binding", 7uLL, 1);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.binding.unsafeMutableAddressor()
{
  if (one-time initialization token for binding != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.binding);
}

uint64_t static Logger.binding.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = Logger.binding.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t static AADeviceProperty.subscript.getter@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(*a1 + *MEMORY[0x263F8E100] + 8);
  swift_unknownObjectRetain();
  swift_retain();
  v5 = (void (*)(void))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 16))(a2);
  v5();
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t static AADeviceProperty.subscript.setter(uint64_t a1, void *a2, void *a3, void *a4)
{
  v739 = &v766;
  uint64_t v744 = a1;
  v727 = a2;
  v694 = a3;
  v731 = a4;
  Builtin::Word v733 = 0;
  v606 = implicit closure #1 in static AADeviceProperty.subscript.setter;
  v607 = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_6;
  v608 = implicit closure #2 in static AADeviceProperty.subscript.setter;
  v609 = _sSiIegd_SiIegr_TRTA_4;
  v610 = partial apply for implicit closure #3 in static AADeviceProperty.subscript.setter;
  v611 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v612 = partial apply for implicit closure #4 in static AADeviceProperty.subscript.setter;
  v613 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v614 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_6;
  v615 = closure #1 in OSLogArguments.append(_:)partial apply;
  v616 = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_6;
  v617 = closure #1 in OSLogArguments.append(_:)partial apply;
  v618 = closure #1 in OSLogArguments.append(_:)partial apply;
  v619 = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_4;
  v620 = closure #1 in OSLogArguments.append(_:)partial apply;
  v621 = closure #1 in OSLogArguments.append(_:)partial apply;
  v622 = closure #1 in OSLogArguments.append(_:)partial apply;
  v623 = closure #1 in OSLogArguments.append(_:)partial apply;
  v624 = closure #1 in OSLogArguments.append(_:)partial apply;
  v625 = closure #1 in OSLogArguments.append(_:)partial apply;
  v626 = implicit closure #6 in static AADeviceProperty.subscript.setter;
  v627 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v628 = implicit closure #7 in static AADeviceProperty.subscript.setter;
  v629 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v630 = partial apply for implicit closure #8 in static AADeviceProperty.subscript.setter;
  v631 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v632 = partial apply for implicit closure #9 in static AADeviceProperty.subscript.setter;
  v633 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v634 = partial apply for implicit closure #10 in static AADeviceProperty.subscript.setter;
  v635 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v636 = closure #1 in OSLogArguments.append(_:)partial apply;
  v637 = closure #1 in OSLogArguments.append(_:)partial apply;
  v638 = closure #1 in OSLogArguments.append(_:)partial apply;
  v639 = closure #1 in OSLogArguments.append(_:)partial apply;
  v640 = closure #1 in OSLogArguments.append(_:)partial apply;
  v641 = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v642 = closure #1 in OSLogArguments.append(_:)partial apply;
  v643 = closure #1 in OSLogArguments.append(_:)partial apply;
  v644 = closure #1 in OSLogArguments.append(_:)partial apply;
  v645 = closure #1 in OSLogArguments.append(_:)partial apply;
  v646 = closure #1 in OSLogArguments.append(_:)partial apply;
  v647 = closure #1 in OSLogArguments.append(_:)partial apply;
  v648 = closure #1 in OSLogArguments.append(_:)partial apply;
  v649 = closure #1 in OSLogArguments.append(_:)partial apply;
  v650 = closure #1 in OSLogArguments.append(_:)partial apply;
  v651 = implicit closure #15 in static AADeviceProperty.subscript.setter;
  v652 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v653 = implicit closure #16 in static AADeviceProperty.subscript.setter;
  v654 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v655 = partial apply for implicit closure #17 in static AADeviceProperty.subscript.setter;
  v656 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v657 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v658 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v659 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v660 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v661 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v662 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v663 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v664 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v665 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v666 = partial apply for closure #1 in static AADeviceProperty.subscript.setter;
  v667 = implicit closure #11 in static AADeviceProperty.subscript.setter;
  v668 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v669 = implicit closure #12 in static AADeviceProperty.subscript.setter;
  v670 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v671 = partial apply for implicit closure #13 in static AADeviceProperty.subscript.setter;
  v672 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v673 = partial apply for implicit closure #14 in static AADeviceProperty.subscript.setter;
  v674 = closure #1 in OSLogArguments.append(_:)partial apply;
  v675 = closure #1 in OSLogArguments.append(_:)partial apply;
  v676 = closure #1 in OSLogArguments.append(_:)partial apply;
  v677 = closure #1 in OSLogArguments.append(_:)partial apply;
  v678 = closure #1 in OSLogArguments.append(_:)partial apply;
  v679 = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v680 = closure #1 in OSLogArguments.append(_:)partial apply;
  v681 = closure #1 in OSLogArguments.append(_:)partial apply;
  v682 = closure #1 in OSLogArguments.append(_:)partial apply;
  v683 = closure #1 in OSLogArguments.append(_:)partial apply;
  v684 = closure #1 in OSLogArguments.append(_:)partial apply;
  v685 = _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_3;
  uint64_t v796 = 0;
  uint64_t v795 = 0;
  uint64_t v794 = 0;
  uint64_t v793 = 0;
  uint64_t v792 = 0;
  uint64_t v787 = 0;
  uint64_t v788 = 0;
  uint64_t v686 = 0;
  v773[3] = 0;
  v773[2] = 0;
  v768[1] = 0;
  id v764 = 0;
  uint64_t v687 = *a3;
  uint64_t v4 = *a4;
  v711 = (void *)MEMORY[0x263F8E100];
  uint64_t v740 = *(void *)(v4 + *MEMORY[0x263F8E100] + 8);
  uint64_t v688 = *(void *)(v740 + 32);
  uint64_t v689 = *(void *)(v688 + 8);
  uint64_t v5 = *MEMORY[0x263F8E100];
  uint64_t v712 = v687;
  uint64_t v690 = *(void *)(v687 + v5);
  uint64_t v797 = v690;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v692 = (*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v6);
  v693 = (char *)v375 - v692;
  uint64_t v695 = type metadata accessor for Logger();
  uint64_t v696 = *(void *)(v695 - 8);
  uint64_t v697 = v695 - 8;
  uint64_t v703 = *(void *)(v696 + 64);
  unint64_t v698 = (v703 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v727, v7);
  v699 = (char *)v375 - v698;
  unint64_t v700 = (v703 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v8, (char *)v375 - v698);
  v701 = (char *)v375 - v700;
  unint64_t v702 = (v703 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v9, (char *)v375 - v700);
  v704 = (char *)v375 - v702;
  unint64_t v705 = (v703 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v10, (char *)v375 - v702);
  v706 = (char *)v375 - v705;
  uint64_t v708 = *(void *)(*(void *)(v740 - 8) + 64);
  unint64_t v707 = (v708 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v11, (char *)v375 - v705);
  uint64_t v709 = (uint64_t)v375 - v707;
  unint64_t v710 = (v708 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v728 = (uint64_t)v375 - v710;
  uint64_t v15 = *(void *)(v712 + *v711 + 8);
  uint64_t v741 = v15;
  *(void *)(v16 + 416) = v15;
  uint64_t v720 = *(void *)(v15 - 8);
  uint64_t v721 = v15 - 8;
  uint64_t v713 = v720;
  uint64_t v717 = *(void *)(v720 + 64);
  unint64_t v714 = (v717 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  v715 = (char *)v375 - v714;
  unint64_t v716 = (v717 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v19 = MEMORY[0x270FA5388](v18, (char *)v375 - v714);
  v718 = (char *)v375 - v716;
  unint64_t v719 = (v717 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = MEMORY[0x270FA5388](v19, (char *)v375 - v716);
  uint64_t v21 = v744;
  v742 = (char *)v375 - v719;
  v22[51] = (char *)v375 - v719;
  v22[50] = v21;
  v22[49] = v20;
  v22[48] = v23;
  v22[47] = v24;
  swift_unknownObjectRetain();
  swift_retain();
  v739[46] = v727;
  v725 = &v791;
  v724 = (void (*)(void))swift_readAtKeyPath();
  v722 = *(void (**)(char *))(v720 + 16);
  uint64_t v723 = v720 + 16;
  v722(v742);
  int v734 = 1;
  v724();
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v25 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  char v26 = v734;
  v27 = v739;
  v29 = v28;
  Builtin::Word v30 = v733;
  v736 = &v790;
  v739[40] = (id)v25;
  v27[41] = v29;
  v732 = "";
  Swift::String v31 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", v30, v26 & 1);
  object = v31._object;
  DefaultStringInterpolation.appendLiteral(_:)(v31);
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  swift_retain();
  v739[39] = v727;
  swift_getAtKeyPath();
  v729 = *(void **)(v728 + *(int *)(v740 + 60));
  swift_retain();
  outlined destroy of AADeviceProperty<A, B>(v728, v741);
  v730 = &v789;
  v739[38] = v729;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialKeyPath<AADeviceModel>);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  Swift::String v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v732, v733, v734 & 1);
  v735 = v32._object;
  DefaultStringInterpolation.appendLiteral(_:)(v32);
  swift_bridgeObjectRelease();
  id v738 = v739[40];
  id v737 = v739[41];
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  uint64_t v33 = String.init(stringInterpolation:)();
  v34 = v739;
  uint64_t v35 = v740;
  uint64_t v743 = v33;
  uint64_t v745 = (uint64_t)v36;
  v739[36] = (id)v33;
  v34[37] = v36;
  uint64_t v746 = *(void *)(v35 + 40);
  if (dispatch thunk of static Equatable.== infix(_:_:)())
  {
    v288 = v699;
    uint64_t v289 = Logger.binding.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v696 + 16))(v288, v289, v695);
    swift_bridgeObjectRetain();
    uint64_t v396 = 32;
    uint64_t v397 = 7;
    uint64_t v290 = swift_allocObject();
    uint64_t v291 = v745;
    uint64_t v292 = v744;
    v293 = (void (*)(char *, uint64_t, uint64_t))v722;
    uint64_t v294 = v741;
    uint64_t v295 = v290;
    v296 = v718;
    uint64_t v391 = v295;
    *(void *)(v295 + 16) = v743;
    *(void *)(v295 + 24) = v291;
    v293(v296, v292, v294);
    unint64_t v384 = (*(unsigned __int8 *)(v713 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v713 + 80);
    v297 = (void *)swift_allocObject();
    uint64_t v298 = v688;
    uint64_t v299 = v746;
    unint64_t v300 = v384;
    uint64_t v301 = v720;
    v302 = v718;
    uint64_t v303 = v741;
    v398 = v297;
    v297[2] = v690;
    v297[3] = v303;
    v297[4] = v298;
    v297[5] = v299;
    (*(void (**)(char *, char *))(v301 + 32))((char *)v297 + v300, v302);
    v415 = Logger.logObject.getter();
    int v416 = static os_log_type_t.debug.getter();
    v387 = &v786;
    v739[34] = (id)42;
    unint64_t v385 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v386 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v388 = *((_DWORD *)v739 + 71);
    uint64_t v394 = 17;
    uint64_t v400 = swift_allocObject();
    int v393 = 32;
    *(unsigned char *)(v400 + 16) = 32;
    uint64_t v401 = swift_allocObject();
    int v395 = 8;
    *(unsigned char *)(v401 + 16) = 8;
    uint64_t v304 = swift_allocObject();
    uint64_t v389 = v304;
    *(void *)(v304 + 16) = v606;
    *(void *)(v304 + 24) = 0;
    uint64_t v305 = swift_allocObject();
    uint64_t v306 = v389;
    uint64_t v402 = v305;
    *(void *)(v305 + 16) = v607;
    *(void *)(v305 + 24) = v306;
    uint64_t v403 = swift_allocObject();
    *(unsigned char *)(v403 + 16) = 0;
    uint64_t v404 = swift_allocObject();
    *(unsigned char *)(v404 + 16) = v395;
    uint64_t v307 = swift_allocObject();
    uint64_t v390 = v307;
    *(void *)(v307 + 16) = v608;
    *(void *)(v307 + 24) = 0;
    uint64_t v308 = swift_allocObject();
    uint64_t v309 = v390;
    uint64_t v405 = v308;
    *(void *)(v308 + 16) = v609;
    *(void *)(v308 + 24) = v309;
    uint64_t v406 = swift_allocObject();
    *(unsigned char *)(v406 + 16) = v393;
    uint64_t v407 = swift_allocObject();
    *(unsigned char *)(v407 + 16) = v395;
    uint64_t v310 = swift_allocObject();
    uint64_t v311 = v391;
    uint64_t v392 = v310;
    *(void *)(v310 + 16) = v610;
    *(void *)(v310 + 24) = v311;
    uint64_t v312 = swift_allocObject();
    uint64_t v313 = v392;
    uint64_t v408 = v312;
    *(void *)(v312 + 16) = v611;
    *(void *)(v312 + 24) = v313;
    uint64_t v409 = swift_allocObject();
    *(unsigned char *)(v409 + 16) = v393;
    uint64_t v410 = swift_allocObject();
    *(unsigned char *)(v410 + 16) = v395;
    uint64_t v314 = swift_allocObject();
    v315 = v398;
    uint64_t v399 = v314;
    *(void *)(v314 + 16) = v612;
    *(void *)(v314 + 24) = v315;
    uint64_t v316 = swift_allocObject();
    uint64_t v317 = v399;
    uint64_t v412 = v316;
    *(void *)(v316 + 16) = v613;
    *(void *)(v316 + 24) = v317;
    uint64_t v414 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v411 = _allocateUninitializedArray<A>(_:)();
    v413 = v318;
    swift_retain();
    uint64_t v319 = v400;
    v320 = v413;
    void *v413 = v614;
    v320[1] = v319;
    swift_retain();
    uint64_t v321 = v401;
    v322 = v413;
    v413[2] = v615;
    v322[3] = v321;
    swift_retain();
    uint64_t v323 = v402;
    v324 = v413;
    v413[4] = v616;
    v324[5] = v323;
    swift_retain();
    uint64_t v325 = v403;
    v326 = v413;
    v413[6] = v617;
    v326[7] = v325;
    swift_retain();
    uint64_t v327 = v404;
    v328 = v413;
    v413[8] = v618;
    v328[9] = v327;
    swift_retain();
    uint64_t v329 = v405;
    v330 = v413;
    v413[10] = v619;
    v330[11] = v329;
    swift_retain();
    uint64_t v331 = v406;
    v332 = v413;
    v413[12] = v620;
    v332[13] = v331;
    swift_retain();
    uint64_t v333 = v407;
    v334 = v413;
    v413[14] = v621;
    v334[15] = v333;
    swift_retain();
    uint64_t v335 = v408;
    v336 = v413;
    v413[16] = v622;
    v336[17] = v335;
    swift_retain();
    uint64_t v337 = v409;
    v338 = v413;
    v413[18] = v623;
    v338[19] = v337;
    swift_retain();
    uint64_t v339 = v410;
    v340 = v413;
    v413[20] = v624;
    v340[21] = v339;
    swift_retain();
    uint64_t v341 = v412;
    v342 = v413;
    v413[22] = v625;
    v342[23] = v341;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v415, (os_log_type_t)v416))
    {
      uint64_t v343 = v686;
      v377 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v376 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v378 = createStorage<A>(capacity:type:)(0);
      uint64_t v344 = createStorage<A>(capacity:type:)(3);
      uint64_t v345 = v378;
      v346 = v739;
      uint64_t v379 = v344;
      v380 = &v785;
      v739[33] = v377;
      v381 = v784;
      v346[32] = (id)v345;
      v382 = v783;
      v346[31] = (id)v344;
      serialize(_:at:)(2, &v785);
      serialize(_:at:)(4, v380);
      uint64_t v347 = v400;
      v348 = v739;
      v349 = v380;
      uint64_t v350 = (uint64_t)v381;
      uint64_t v351 = (uint64_t)v382;
      v739[29] = v614;
      v348[30] = (id)v347;
      closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)v349, v350, v351);
      uint64_t v383 = v343;
      if (v343)
      {
        __break(1u);
      }
      else
      {
        v352 = v739;
        uint64_t v353 = v401;
        v739[29] = v615;
        v352[30] = (id)v353;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[9] = 0;
        v354 = v739;
        v355 = (void *)v402;
        v739[29] = v616;
        v354[30] = v355;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[8] = 0;
        v356 = v739;
        uint64_t v357 = v403;
        v739[29] = v617;
        v356[30] = (id)v357;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[7] = 0;
        v358 = v739;
        uint64_t v359 = v404;
        v739[29] = v618;
        v358[30] = (id)v359;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[6] = 0;
        v360 = v739;
        v361 = (void *)v405;
        v739[29] = v619;
        v360[30] = v361;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[5] = 0;
        v362 = v739;
        uint64_t v363 = v406;
        v739[29] = v620;
        v362[30] = (id)v363;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[4] = 0;
        v364 = v739;
        uint64_t v365 = v407;
        v739[29] = v621;
        v364[30] = (id)v365;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[3] = 0;
        v366 = v739;
        v367 = (void *)v408;
        v739[29] = v622;
        v366[30] = v367;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[2] = 0;
        v368 = v739;
        uint64_t v369 = v409;
        v739[29] = v623;
        v368[30] = (id)v369;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[1] = 0;
        v370 = v739;
        uint64_t v371 = v410;
        v739[29] = v624;
        v370[30] = (id)v371;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        v375[0] = 0;
        v372 = v739;
        v373 = (void *)v412;
        v739[29] = v625;
        v372[30] = v373;
        closure #1 in osLogInternal(_:log:type:)(v782, (uint64_t)&v785, (uint64_t)v784, (uint64_t)v783);
        _os_log_impl(&dword_250C36000, v415, (os_log_type_t)v416, "HeadphoneManager: %s: %ld  (Set) value same skiping update %s ::  %s", v377, v388);
        destroyStorage<A>(_:count:)(v378, 0, v376);
        destroyStorage<A>(_:count:)(v379, 3, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x253386220](v377, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v696 + 8))(v699, v695);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v720 + 8))(v742, v741);
  }
  else
  {
    v37 = v727;
    swift_unknownObjectRetain();
    swift_retain();
    ((void (*)(char *, uint64_t, uint64_t))v722)(v718, v744, v741);
    v739[28] = v37;
    v604 = (char *)v781 + 1;
    v603 = (void (*)(void))swift_modifyAtReferenceWritableKeyPath();
    (*(void (**)(uint64_t, char *, uint64_t))(v720 + 40))(v38, v718, v741);
    v603();
    swift_unknownObjectRelease();
    swift_release();
    (*(void (**)(void *__return_ptr, uint64_t))(v688 + 32))(v781, v690);
    char v780 = v781[0];
    char v779 = 0;
    BOOL v605 = static AADevicePropertyRemoteSendState.== infix(_:_:)(&v780, &v779);
    swift_unknownObjectRetain();
    swift_retain();
    if (v605)
    {
      swift_unknownObjectRetain();
      swift_retain();
      v749 = v727;
      swift_getAtKeyPath();
      int v598 = *(unsigned __int8 *)(v728 + *(int *)(v740 + 64));
      outlined destroy of AADeviceProperty<A, B>(v728, v741);
      v600 = &v748;
      char v748 = v598;
      v599 = &v747;
      char v747 = 1;
      lazy protocol witness table accessor for type AADevicePropertyRemoteSendState and conformance AADevicePropertyRemoteSendState();
      int v601 = dispatch thunk of static Equatable.== infix(_:_:)() ^ 1;
      swift_unknownObjectRelease();
      swift_release();
      int v602 = v601;
    }
    else
    {
      int v602 = 0;
    }
    int v597 = v602;
    swift_unknownObjectRelease();
    swift_release();
    if (v597)
    {
      v595 = (void *)*Headphone_Manager.shared.unsafeMutableAddressor();
      v39 = v595;
      uint64_t v40 = v688;
      uint64_t v41 = v690;
      v739[12] = v595;
      v596 = (void *)(*(uint64_t (**)(uint64_t))(v40 + 16))(v41);
      if (v596)
      {
        v594 = v596;
        uint64_t v42 = v688;
        uint64_t v43 = v690;
        id v589 = v596;
        v739[4] = v596;
        uint64_t v591 = (*(uint64_t (**)(uint64_t))(v42 + 24))(v43);
        v590 = v44;
        uint64_t v45 = (*(uint64_t (**)(void))((*v595 & *MEMORY[0x263F8EED0]) + 0x180))();
        v46 = v590;
        v47 = v739;
        uint64_t v592 = v45;
        v593 = &v767;
        v739[1] = (id)v591;
        v47[2] = v46;
        uint64_t v48 = type metadata accessor for HeadphoneDevice();
        MEMORY[0x253385E50](v768, v593, v592, MEMORY[0x263F8D310], v48, MEMORY[0x263F8D320]);
        outlined destroy of String();
        v49 = v739;
        id *v739 = v739[3];
        BOOL v588 = *v49 != 0;
        BOOL v587 = v588;
        outlined destroy of HeadphoneDevice?(&v766);
        swift_bridgeObjectRelease();
        if (v587)
        {
          v50 = v706;
          swift_unknownObjectRetain();
          swift_retain();
          v765 = v727;
          swift_getAtKeyPath();
          uint64_t v558 = *(void *)(v728 + *(int *)(v740 + 60));
          swift_retain();
          outlined destroy of AADeviceProperty<A, B>(v728, v741);
          id v559 = static AADeviceModel.deviceConfigFor<A>(keyPath:value:)(v558, v744, v741);
          swift_release();
          swift_unknownObjectRelease();
          swift_release();
          id v764 = v559;
          uint64_t v51 = Logger.shared.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v696 + 16))(v50, v51, v695);
          id v52 = v559;
          uint64_t v570 = 7;
          uint64_t v571 = swift_allocObject();
          *(void *)(v571 + 16) = v559;
          v585 = Logger.logObject.getter();
          int v586 = static os_log_type_t.default.getter();
          v562 = &v762;
          uint64_t v569 = 32;
          uint64_t v762 = 32;
          unint64_t v560 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v561 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v563 = v763;
          uint64_t v567 = 17;
          uint64_t v573 = swift_allocObject();
          int v566 = 32;
          *(unsigned char *)(v573 + 16) = 32;
          uint64_t v574 = swift_allocObject();
          int v568 = 8;
          *(unsigned char *)(v574 + 16) = 8;
          uint64_t v53 = swift_allocObject();
          uint64_t v564 = v53;
          *(void *)(v53 + 16) = v651;
          *(void *)(v53 + 24) = 0;
          uint64_t v54 = swift_allocObject();
          uint64_t v55 = v564;
          uint64_t v575 = v54;
          *(void *)(v54 + 16) = v652;
          *(void *)(v54 + 24) = v55;
          uint64_t v576 = swift_allocObject();
          *(unsigned char *)(v576 + 16) = 0;
          uint64_t v577 = swift_allocObject();
          *(unsigned char *)(v577 + 16) = v568;
          uint64_t v56 = swift_allocObject();
          uint64_t v565 = v56;
          *(void *)(v56 + 16) = v653;
          *(void *)(v56 + 24) = 0;
          uint64_t v57 = swift_allocObject();
          uint64_t v58 = v565;
          uint64_t v578 = v57;
          *(void *)(v57 + 16) = v654;
          *(void *)(v57 + 24) = v58;
          uint64_t v579 = swift_allocObject();
          *(unsigned char *)(v579 + 16) = v566;
          uint64_t v580 = swift_allocObject();
          *(unsigned char *)(v580 + 16) = v568;
          uint64_t v59 = swift_allocObject();
          uint64_t v60 = v571;
          uint64_t v572 = v59;
          *(void *)(v59 + 16) = v655;
          *(void *)(v59 + 24) = v60;
          uint64_t v61 = swift_allocObject();
          uint64_t v62 = v572;
          uint64_t v582 = v61;
          *(void *)(v61 + 16) = v656;
          *(void *)(v61 + 24) = v62;
          uint64_t v584 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v581 = _allocateUninitializedArray<A>(_:)();
          v583 = v63;
          swift_retain();
          uint64_t v64 = v573;
          v65 = v583;
          *v583 = v657;
          v65[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v64;
          swift_retain();
          uint64_t v66 = v574;
          v67 = v583;
          v583[2] = v658;
          v67[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v66;
          swift_retain();
          v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v575;
          v69 = v583;
          v583[4] = v659;
          v69[5] = v68;
          swift_retain();
          uint64_t v70 = v576;
          v71 = v583;
          v583[6] = v660;
          v71[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v70;
          swift_retain();
          uint64_t v72 = v577;
          v73 = v583;
          v583[8] = v661;
          v73[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v72;
          swift_retain();
          v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v578;
          v75 = v583;
          v583[10] = v662;
          v75[11] = v74;
          swift_retain();
          uint64_t v76 = v579;
          v77 = v583;
          v583[12] = v663;
          v77[13] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v76;
          swift_retain();
          uint64_t v78 = v580;
          v79 = v583;
          v583[14] = v664;
          v79[15] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v78;
          swift_retain();
          v80 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v582;
          v81 = v583;
          v583[16] = v665;
          v81[17] = v80;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v585, (os_log_type_t)v586))
          {
            uint64_t v82 = v686;
            v551 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v550 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v552 = createStorage<A>(capacity:type:)(0);
            uint64_t v553 = createStorage<A>(capacity:type:)(2);
            v554 = &v754;
            v754 = v551;
            v555 = &v753;
            uint64_t v753 = v552;
            v556 = &v752;
            uint64_t v752 = v553;
            serialize(_:at:)(2, &v754);
            serialize(_:at:)(3, v554);
            v750 = v657;
            uint64_t v751 = v573;
            closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)v554, (uint64_t)v555, (uint64_t)v556);
            uint64_t v557 = v82;
            if (v82)
            {
              __break(1u);
            }
            else
            {
              v750 = v658;
              uint64_t v751 = v574;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v549 = 0;
              v750 = v659;
              uint64_t v751 = v575;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v548 = 0;
              v750 = v660;
              uint64_t v751 = v576;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v547 = 0;
              v750 = v661;
              uint64_t v751 = v577;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v546 = 0;
              v750 = v662;
              uint64_t v751 = v578;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v545 = 0;
              v750 = v663;
              uint64_t v751 = v579;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v544 = 0;
              v750 = v664;
              uint64_t v751 = v580;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              uint64_t v543 = 0;
              v750 = v665;
              uint64_t v751 = v582;
              closure #1 in osLogInternal(_:log:type:)(&v750, (uint64_t)&v754, (uint64_t)&v753, (uint64_t)&v752);
              _os_log_impl(&dword_250C36000, v585, (os_log_type_t)v586, "HeadphoneManager: %s: %ld (Set Remote) Prepared config :%s", v551, v563);
              destroyStorage<A>(_:count:)(v552, 0, v550);
              destroyStorage<A>(_:count:)(v553, 2, MEMORY[0x263F8EE58] + 8);
              MEMORY[0x253386220](v551, MEMORY[0x263F8E778]);
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
          }
          v83 = v595;

          uint64_t v84 = (*(uint64_t (**)(char *, uint64_t))(v696 + 8))(v706, v695);
          id v542 = (id)(*(uint64_t (**)(uint64_t))((*v83 & *MEMORY[0x263F8EED0]) + 0x120))(v84);
          id v533 = objc_msgSend(v589, sel_identifier);
          uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v532 = v86;
          id v541 = (id)MEMORY[0x253385EB0](v85);
          swift_bridgeObjectRelease();

          swift_unknownObjectRetain();
          swift_retain();
          ((void (*)(char *, char *, uint64_t))v722)(v718, v742, v741);
          id v87 = v559;
          ((void (*)(char *, uint64_t, uint64_t))v722)(v715, v744, v741);
          uint64_t v88 = *(_DWORD *)(v713 + 80);
          uint64_t v534 = (v88 + 64) & ~v88;
          unint64_t v535 = (v534 + v717 + 7) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v536 = (v535 + 8 + v88) & ~v88;
          v89 = (void *)swift_allocObject();
          uint64_t v90 = v688;
          uint64_t v91 = v746;
          v92 = v727;
          v93 = v731;
          uint64_t v94 = v534;
          v95 = v718;
          uint64_t v96 = v720;
          uint64_t v97 = v741;
          v539 = (char *)v89;
          v89[2] = v690;
          v89[3] = v97;
          v89[4] = v90;
          v89[5] = v91;
          v89[6] = v92;
          v89[7] = v93;
          v538 = *(void (**)(char *, char *))(v96 + 32);
          uint64_t v537 = v96 + 32;
          v538((char *)v89 + v94, v95);
          uint64_t v98 = v536;
          v99 = v715;
          v100 = (void (*)(char *, char *, uint64_t))v538;
          uint64_t v101 = v741;
          v102 = v539;
          *(void *)&v539[v535] = v559;
          v100(&v102[v98], v99, v101);
          v760 = v666;
          v761 = v539;
          uint64_t v755 = MEMORY[0x263EF8330];
          int v756 = 1107296256;
          int v757 = 0;
          v758 = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
          v759 = &block_descriptor_5;
          v540 = _Block_copy(&v755);
          swift_release();
          objc_msgSend(v542, sel_sendDeviceConfig_identifier_completion_, v559, v541, v540);
          _Block_release(v540);

          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v720 + 8))(v742, v741);
          goto LABEL_43;
        }
      }
      v103 = v704;
      uint64_t v104 = Logger.shared.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v696 + 16))(v103, v104, v695);
      swift_unknownObjectRetain();
      uint64_t v500 = 56;
      uint64_t v513 = 7;
      uint64_t v105 = swift_allocObject();
      uint64_t v106 = v741;
      uint64_t v107 = v688;
      uint64_t v108 = v746;
      v109 = (void *)v105;
      v110 = v727;
      v508 = v109;
      v109[2] = v690;
      v109[3] = v106;
      v109[4] = v107;
      v109[5] = v108;
      v109[6] = v110;
      swift_unknownObjectRetain();
      v111 = (void *)swift_allocObject();
      uint64_t v112 = v741;
      uint64_t v113 = v688;
      uint64_t v114 = v746;
      v115 = v727;
      v514 = v111;
      v111[2] = v690;
      v111[3] = v112;
      v111[4] = v113;
      v111[5] = v114;
      v111[6] = v115;
      default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
      swift_bridgeObjectRelease();
      v530 = Logger.logObject.getter();
      int v531 = static os_log_type_t.error.getter();
      v503 = v773;
      v739[10] = (id)42;
      unint64_t v501 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v502 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v504 = *((_DWORD *)v739 + 23);
      uint64_t v510 = 17;
      uint64_t v515 = swift_allocObject();
      int v507 = 32;
      *(unsigned char *)(v515 + 16) = 32;
      uint64_t v516 = swift_allocObject();
      int v511 = 8;
      *(unsigned char *)(v516 + 16) = 8;
      uint64_t v512 = 32;
      uint64_t v116 = swift_allocObject();
      uint64_t v505 = v116;
      *(void *)(v116 + 16) = v667;
      *(void *)(v116 + 24) = 0;
      uint64_t v117 = swift_allocObject();
      uint64_t v118 = v505;
      uint64_t v517 = v117;
      *(void *)(v117 + 16) = v668;
      *(void *)(v117 + 24) = v118;
      uint64_t v518 = swift_allocObject();
      *(unsigned char *)(v518 + 16) = 0;
      uint64_t v519 = swift_allocObject();
      *(unsigned char *)(v519 + 16) = v511;
      uint64_t v119 = swift_allocObject();
      uint64_t v506 = v119;
      *(void *)(v119 + 16) = v669;
      *(void *)(v119 + 24) = 0;
      uint64_t v120 = swift_allocObject();
      uint64_t v121 = v506;
      uint64_t v520 = v120;
      *(void *)(v120 + 16) = v670;
      *(void *)(v120 + 24) = v121;
      uint64_t v521 = swift_allocObject();
      *(unsigned char *)(v521 + 16) = v507;
      uint64_t v522 = swift_allocObject();
      *(unsigned char *)(v522 + 16) = v511;
      uint64_t v122 = swift_allocObject();
      v123 = v508;
      uint64_t v509 = v122;
      *(void *)(v122 + 16) = v671;
      *(void *)(v122 + 24) = v123;
      uint64_t v124 = swift_allocObject();
      uint64_t v125 = v509;
      uint64_t v523 = v124;
      *(void *)(v124 + 16) = v672;
      *(void *)(v124 + 24) = v125;
      uint64_t v524 = swift_allocObject();
      *(unsigned char *)(v524 + 16) = 64;
      uint64_t v525 = swift_allocObject();
      *(unsigned char *)(v525 + 16) = v511;
      uint64_t v126 = swift_allocObject();
      v127 = v514;
      uint64_t v527 = v126;
      *(void *)(v126 + 16) = v673;
      *(void *)(v126 + 24) = v127;
      uint64_t v529 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v526 = _allocateUninitializedArray<A>(_:)();
      v528 = v128;
      swift_retain();
      uint64_t v129 = v515;
      v130 = v528;
      void *v528 = v674;
      v130[1] = v129;
      swift_retain();
      uint64_t v131 = v516;
      v132 = v528;
      v528[2] = v675;
      v132[3] = v131;
      swift_retain();
      uint64_t v133 = v517;
      v134 = v528;
      v528[4] = v676;
      v134[5] = v133;
      swift_retain();
      uint64_t v135 = v518;
      v136 = v528;
      v528[6] = v677;
      v136[7] = v135;
      swift_retain();
      uint64_t v137 = v519;
      v138 = v528;
      v528[8] = v678;
      v138[9] = v137;
      swift_retain();
      uint64_t v139 = v520;
      v140 = v528;
      v528[10] = v679;
      v140[11] = v139;
      swift_retain();
      uint64_t v141 = v521;
      v142 = v528;
      v528[12] = v680;
      v142[13] = v141;
      swift_retain();
      uint64_t v143 = v522;
      v144 = v528;
      v528[14] = v681;
      v144[15] = v143;
      swift_retain();
      uint64_t v145 = v523;
      v146 = v528;
      v528[16] = v682;
      v146[17] = v145;
      swift_retain();
      uint64_t v147 = v524;
      v148 = v528;
      v528[18] = v683;
      v148[19] = v147;
      swift_retain();
      uint64_t v149 = v525;
      v150 = v528;
      v528[20] = v684;
      v150[21] = v149;
      swift_retain();
      uint64_t v151 = v527;
      v152 = v528;
      v528[22] = v685;
      v152[23] = v151;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v530, (os_log_type_t)v531))
      {
        uint64_t v153 = v686;
        v493 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v492 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v494 = createStorage<A>(capacity:type:)(1);
        uint64_t v154 = createStorage<A>(capacity:type:)(2);
        uint64_t v155 = v494;
        v156 = v739;
        uint64_t v495 = v154;
        v496 = &v772;
        v739[9] = v493;
        v497 = &v771;
        v156[8] = (id)v155;
        v498 = &v770;
        v156[7] = (id)v154;
        serialize(_:at:)(2, &v772);
        serialize(_:at:)(4, v496);
        uint64_t v157 = v515;
        v158 = v739;
        v159 = v496;
        uint64_t v160 = (uint64_t)v497;
        uint64_t v161 = (uint64_t)v498;
        v739[5] = v674;
        v158[6] = (id)v157;
        closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)v159, v160, v161);
        uint64_t v499 = v153;
        if (v153)
        {
          __break(1u);
        }
        else
        {
          v162 = v739;
          uint64_t v163 = v516;
          v739[5] = v675;
          v162[6] = (id)v163;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v491 = 0;
          v164 = v739;
          v165 = (void *)v517;
          v739[5] = v676;
          v164[6] = v165;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v490 = 0;
          v166 = v739;
          uint64_t v167 = v518;
          v739[5] = v677;
          v166[6] = (id)v167;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v489 = 0;
          v168 = v739;
          uint64_t v169 = v519;
          v739[5] = v678;
          v168[6] = (id)v169;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v488 = 0;
          v170 = v739;
          v171 = (void *)v520;
          v739[5] = v679;
          v170[6] = v171;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v487 = 0;
          v172 = v739;
          uint64_t v173 = v521;
          v739[5] = v680;
          v172[6] = (id)v173;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v486 = 0;
          v174 = v739;
          uint64_t v175 = v522;
          v739[5] = v681;
          v174[6] = (id)v175;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v485 = 0;
          v176 = v739;
          v177 = (void *)v523;
          v739[5] = v682;
          v176[6] = v177;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v484 = 0;
          v178 = v739;
          uint64_t v179 = v524;
          v739[5] = v683;
          v178[6] = (id)v179;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v483 = 0;
          v180 = v739;
          uint64_t v181 = v525;
          v739[5] = v684;
          v180[6] = (id)v181;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          uint64_t v482 = 0;
          v182 = v739;
          v183 = (void *)v527;
          v739[5] = v685;
          v182[6] = v183;
          closure #1 in osLogInternal(_:log:type:)(v769, (uint64_t)&v772, (uint64_t)&v771, (uint64_t)&v770);
          _os_log_impl(&dword_250C36000, v530, (os_log_type_t)v531, "HeadphoneManager: %s: %ld (Set) : Update AAD Device Config, Device Not Connected with UUID: %s device:%@", v493, v504);
          destroyStorage<A>(_:count:)(v494, 1, v492);
          destroyStorage<A>(_:count:)(v495, 2, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x253386220](v493, MEMORY[0x263F8E778]);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v696 + 8))(v704, v695);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v720 + 8))(v742, v741);
    }
    else
    {
      swift_unknownObjectRetain();
      swift_retain();
      v739[22] = v727;
      swift_getAtKeyPath();
      v481 = (uint64_t *)(v709 + *(int *)(v740 + 52));
      if (*v481)
      {
        uint64_t v480 = *v481;
        swift_retain();
        outlined destroy of AADeviceProperty<A, B>(v709, v741);
        CurrentValueSubject.send(_:)();
        swift_release();
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {
        swift_unknownObjectRelease();
        swift_release();
        outlined destroy of AADeviceProperty<A, B>(v709, v741);
      }
      dispatch thunk of ObservableObject.objectWillChange.getter();
      type metadata accessor for ObservableObjectPublisher();
      if (swift_dynamicCast()) {
        id v479 = v739[21];
      }
      else {
        id v479 = 0;
      }
      v478 = v479;
      if (v479)
      {
        v477 = v478;
        v476 = v478;
        v739[13] = v478;
        ObservableObjectPublisher.send()();
        swift_release();
      }
      v184 = v701;
      uint64_t v185 = Logger.binding.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v696 + 16))(v184, v185, v695);
      swift_bridgeObjectRetain();
      uint64_t v452 = 32;
      uint64_t v453 = 7;
      uint64_t v186 = swift_allocObject();
      uint64_t v187 = v745;
      uint64_t v188 = v744;
      v189 = (void (*)(char *, uint64_t, uint64_t))v722;
      uint64_t v190 = v741;
      uint64_t v191 = v186;
      v192 = v718;
      uint64_t v445 = v191;
      *(void *)(v191 + 16) = v743;
      *(void *)(v191 + 24) = v187;
      v189(v192, v188, v190);
      unint64_t v438 = (*(unsigned __int8 *)(v713 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v713 + 80);
      v193 = (void *)swift_allocObject();
      uint64_t v194 = v688;
      uint64_t v195 = v746;
      unint64_t v196 = v438;
      uint64_t v197 = v720;
      v198 = v718;
      uint64_t v199 = v741;
      v447 = v193;
      v193[2] = v690;
      v193[3] = v199;
      v193[4] = v194;
      v193[5] = v195;
      (*(void (**)(char *, char *))(v197 + 32))((char *)v193 + v196, v198);
      swift_unknownObjectRetain();
      swift_retain();
      uint64_t v200 = swift_allocObject();
      v201 = v731;
      uint64_t v454 = v200;
      *(void *)(v200 + 16) = v727;
      *(void *)(v200 + 24) = v201;
      v474 = Logger.logObject.getter();
      int v475 = static os_log_type_t.default.getter();
      v441 = &v778;
      v739[19] = (id)52;
      unint64_t v439 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v440 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v442 = *((_DWORD *)v739 + 41);
      uint64_t v450 = 17;
      uint64_t v456 = swift_allocObject();
      int v449 = 32;
      *(unsigned char *)(v456 + 16) = 32;
      uint64_t v457 = swift_allocObject();
      int v451 = 8;
      *(unsigned char *)(v457 + 16) = 8;
      uint64_t v202 = swift_allocObject();
      uint64_t v443 = v202;
      *(void *)(v202 + 16) = v626;
      *(void *)(v202 + 24) = 0;
      uint64_t v203 = swift_allocObject();
      uint64_t v204 = v443;
      uint64_t v458 = v203;
      *(void *)(v203 + 16) = v627;
      *(void *)(v203 + 24) = v204;
      uint64_t v459 = swift_allocObject();
      *(unsigned char *)(v459 + 16) = 0;
      uint64_t v460 = swift_allocObject();
      *(unsigned char *)(v460 + 16) = v451;
      uint64_t v205 = swift_allocObject();
      uint64_t v444 = v205;
      *(void *)(v205 + 16) = v628;
      *(void *)(v205 + 24) = 0;
      uint64_t v206 = swift_allocObject();
      uint64_t v207 = v444;
      uint64_t v461 = v206;
      *(void *)(v206 + 16) = v629;
      *(void *)(v206 + 24) = v207;
      uint64_t v462 = swift_allocObject();
      *(unsigned char *)(v462 + 16) = v449;
      uint64_t v463 = swift_allocObject();
      *(unsigned char *)(v463 + 16) = v451;
      uint64_t v208 = swift_allocObject();
      uint64_t v209 = v445;
      uint64_t v446 = v208;
      *(void *)(v208 + 16) = v630;
      *(void *)(v208 + 24) = v209;
      uint64_t v210 = swift_allocObject();
      uint64_t v211 = v446;
      uint64_t v464 = v210;
      *(void *)(v210 + 16) = v631;
      *(void *)(v210 + 24) = v211;
      uint64_t v465 = swift_allocObject();
      *(unsigned char *)(v465 + 16) = v449;
      uint64_t v466 = swift_allocObject();
      *(unsigned char *)(v466 + 16) = v451;
      uint64_t v212 = swift_allocObject();
      v213 = v447;
      uint64_t v448 = v212;
      *(void *)(v212 + 16) = v632;
      *(void *)(v212 + 24) = v213;
      uint64_t v214 = swift_allocObject();
      uint64_t v215 = v448;
      uint64_t v467 = v214;
      *(void *)(v214 + 16) = v633;
      *(void *)(v214 + 24) = v215;
      uint64_t v468 = swift_allocObject();
      *(unsigned char *)(v468 + 16) = v449;
      uint64_t v469 = swift_allocObject();
      *(unsigned char *)(v469 + 16) = v451;
      uint64_t v216 = swift_allocObject();
      uint64_t v217 = v454;
      uint64_t v455 = v216;
      *(void *)(v216 + 16) = v634;
      *(void *)(v216 + 24) = v217;
      uint64_t v218 = swift_allocObject();
      uint64_t v219 = v455;
      uint64_t v471 = v218;
      *(void *)(v218 + 16) = v635;
      *(void *)(v218 + 24) = v219;
      uint64_t v473 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v470 = _allocateUninitializedArray<A>(_:)();
      v472 = v220;
      swift_retain();
      uint64_t v221 = v456;
      v222 = v472;
      void *v472 = v636;
      v222[1] = v221;
      swift_retain();
      uint64_t v223 = v457;
      v224 = v472;
      v472[2] = v637;
      v224[3] = v223;
      swift_retain();
      uint64_t v225 = v458;
      v226 = v472;
      v472[4] = v638;
      v226[5] = v225;
      swift_retain();
      uint64_t v227 = v459;
      v228 = v472;
      v472[6] = v639;
      v228[7] = v227;
      swift_retain();
      uint64_t v229 = v460;
      v230 = v472;
      v472[8] = v640;
      v230[9] = v229;
      swift_retain();
      uint64_t v231 = v461;
      v232 = v472;
      v472[10] = v641;
      v232[11] = v231;
      swift_retain();
      uint64_t v233 = v462;
      v234 = v472;
      v472[12] = v642;
      v234[13] = v233;
      swift_retain();
      uint64_t v235 = v463;
      v236 = v472;
      v472[14] = v643;
      v236[15] = v235;
      swift_retain();
      uint64_t v237 = v464;
      v238 = v472;
      v472[16] = v644;
      v238[17] = v237;
      swift_retain();
      uint64_t v239 = v465;
      v240 = v472;
      v472[18] = v645;
      v240[19] = v239;
      swift_retain();
      uint64_t v241 = v466;
      v242 = v472;
      v472[20] = v646;
      v242[21] = v241;
      swift_retain();
      uint64_t v243 = v467;
      v244 = v472;
      v472[22] = v647;
      v244[23] = v243;
      swift_retain();
      uint64_t v245 = v468;
      v246 = v472;
      v472[24] = v648;
      v246[25] = v245;
      swift_retain();
      uint64_t v247 = v469;
      v248 = v472;
      v472[26] = v649;
      v248[27] = v247;
      swift_retain();
      uint64_t v249 = v471;
      v250 = v472;
      v472[28] = v650;
      v250[29] = v249;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v474, (os_log_type_t)v475))
      {
        uint64_t v251 = v686;
        v431 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v430 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v432 = createStorage<A>(capacity:type:)(0);
        uint64_t v252 = createStorage<A>(capacity:type:)(4);
        uint64_t v253 = v432;
        v254 = v739;
        uint64_t v433 = v252;
        v434 = &v777;
        v739[18] = v431;
        v435 = &v776;
        v254[17] = (id)v253;
        v436 = &v775;
        v254[16] = (id)v252;
        serialize(_:at:)(2, &v777);
        serialize(_:at:)(5, v434);
        uint64_t v255 = v456;
        v256 = v739;
        v257 = v434;
        uint64_t v258 = (uint64_t)v435;
        uint64_t v259 = (uint64_t)v436;
        v739[14] = v636;
        v256[15] = (id)v255;
        closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)v257, v258, v259);
        uint64_t v437 = v251;
        if (v251)
        {
          __break(1u);
        }
        else
        {
          v260 = v739;
          uint64_t v261 = v457;
          v739[14] = v637;
          v260[15] = (id)v261;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v429 = 0;
          v262 = v739;
          v263 = (void *)v458;
          v739[14] = v638;
          v262[15] = v263;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v428 = 0;
          v264 = v739;
          uint64_t v265 = v459;
          v739[14] = v639;
          v264[15] = (id)v265;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v427 = 0;
          v266 = v739;
          uint64_t v267 = v460;
          v739[14] = v640;
          v266[15] = (id)v267;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v426 = 0;
          v268 = v739;
          v269 = (void *)v461;
          v739[14] = v641;
          v268[15] = v269;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v425 = 0;
          v270 = v739;
          uint64_t v271 = v462;
          v739[14] = v642;
          v270[15] = (id)v271;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v424 = 0;
          v272 = v739;
          uint64_t v273 = v463;
          v739[14] = v643;
          v272[15] = (id)v273;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v423 = 0;
          v274 = v739;
          v275 = (void *)v464;
          v739[14] = v644;
          v274[15] = v275;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v422 = 0;
          v276 = v739;
          uint64_t v277 = v465;
          v739[14] = v645;
          v276[15] = (id)v277;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v421 = 0;
          v278 = v739;
          uint64_t v279 = v466;
          v739[14] = v646;
          v278[15] = (id)v279;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v420 = 0;
          v280 = v739;
          v281 = (void *)v467;
          v739[14] = v647;
          v280[15] = v281;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v419 = 0;
          v282 = v739;
          uint64_t v283 = v468;
          v739[14] = v648;
          v282[15] = (id)v283;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v418 = 0;
          v284 = v739;
          uint64_t v285 = v469;
          v739[14] = v649;
          v284[15] = (id)v285;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          uint64_t v417 = 0;
          v286 = v739;
          v287 = (void *)v471;
          v739[14] = v650;
          v286[15] = v287;
          closure #1 in osLogInternal(_:log:type:)(v774, (uint64_t)&v777, (uint64_t)&v776, (uint64_t)&v775);
          _os_log_impl(&dword_250C36000, v474, (os_log_type_t)v475, "HeadphoneManager: %s: %ld  (Set)  %s :: %s %s", v431, v442);
          destroyStorage<A>(_:count:)(v432, 0, v430);
          destroyStorage<A>(_:count:)(v433, 4, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x253386220](v431, MEMORY[0x263F8E778]);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v696 + 8))(v701, v695);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v720 + 8))(v742, v741);
    }
  }
LABEL_43:
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v720 + 8))(v744, v741);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of AADeviceProperty<A, B>(uint64_t a1, uint64_t a2)
{
}

uint64_t implicit closure #1 in static AADeviceProperty.subscript.setter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("subscript(_enclosingInstance:wrapped:storage:)", 0x2EuLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #2 in static AADeviceProperty.subscript.setter()
{
  return 35;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in static AADeviceProperty.subscript.setter()
{
}

uint64_t sub_250D014CC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in static AADeviceProperty.subscript.setter()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #3 in static AADeviceProperty.subscript.setter();
  return result;
}

uint64_t implicit closure #4 in static AADeviceProperty.subscript.setter()
{
  DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v0);
  swift_bridgeObjectRelease();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  return String.init(stringInterpolation:)();
}

uint64_t sub_250D015FC()
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #4 in static AADeviceProperty.subscript.setter();
}

uint64_t implicit closure #6 in static AADeviceProperty.subscript.setter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("subscript(_enclosingInstance:wrapped:storage:)", 0x2EuLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #7 in static AADeviceProperty.subscript.setter()
{
  return 47;
}

uint64_t implicit closure #8 in static AADeviceProperty.subscript.setter()
{
  return MEMORY[0x253385F00]();
}

uint64_t implicit closure #9 in static AADeviceProperty.subscript.setter()
{
  DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v0);
  swift_bridgeObjectRelease();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  return String.init(stringInterpolation:)();
}

uint64_t implicit closure #10 in static AADeviceProperty.subscript.setter(uint64_t a1, void *a2)
{
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  uint64_t v9 = *(void *)(*a2 + *MEMORY[0x263F8E100] + 8);
  unint64_t v6 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (uint64_t)&v3 - v6;
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v13 = v7;
  swift_getAtKeyPath();
  uint64_t v11 = *(void *)(v10 + *(int *)(v9 + 52));
  swift_retain();
  uint64_t v12 = v11;
  BOOL v5 = v11 != 0;
  BOOL v4 = v5;
  outlined destroy of HeadphonePropertyWrapperPublisher<B>?();
  outlined destroy of AADeviceProperty<A, B>(v10, *(void *)(v9 + 24));
  swift_unknownObjectRelease();
  swift_release();
  if (v4) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("publisher exists", 0x10uLL, 1)._countAndFlagsBits;
  }
  else {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("no publisher", 0xCuLL, 1)._countAndFlagsBits;
  }
}

uint64_t implicit closure #11 in static AADeviceProperty.subscript.setter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("subscript(_enclosingInstance:wrapped:storage:)", 0x2EuLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #12 in static AADeviceProperty.subscript.setter()
{
  return 54;
}

uint64_t implicit closure #13 in static AADeviceProperty.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t))(a4 + 24))(a2);
}

uint64_t implicit closure #14 in static AADeviceProperty.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a2);
  if (v6) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t implicit closure #15 in static AADeviceProperty.subscript.setter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("subscript(_enclosingInstance:wrapped:storage:)", 0x2EuLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #16 in static AADeviceProperty.subscript.setter()
{
  return 59;
}

uint64_t implicit closure #17 in static AADeviceProperty.subscript.setter(void *a1)
{
  id v1 = a1;
  id v4 = objc_msgSend(a1, sel_debugDescription);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t closure #1 in static AADeviceProperty.subscript.setter(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6)
{
  v270 = a1;
  uint64_t v262 = a2;
  uint64_t v258 = a3;
  uint64_t v259 = a4;
  id v260 = a5;
  uint64_t v261 = a6;
  uint64_t v247 = 0;
  uint64_t v208 = implicit closure #1 in closure #1 in static AADeviceProperty.subscript.setter;
  uint64_t v209 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v210 = implicit closure #2 in closure #1 in static AADeviceProperty.subscript.setter;
  uint64_t v211 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  uint64_t v212 = partial apply for implicit closure #3 in closure #1 in static AADeviceProperty.subscript.setter;
  v213 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v214 = partial apply for implicit closure #4 in closure #1 in static AADeviceProperty.subscript.setter;
  uint64_t v215 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v216 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v217 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v218 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v219 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v220 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v221 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v222 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v223 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v224 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v225 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v226 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v227 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v228 = implicit closure #5 in closure #1 in static AADeviceProperty.subscript.setter;
  uint64_t v229 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v230 = implicit closure #6 in closure #1 in static AADeviceProperty.subscript.setter;
  uint64_t v231 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v232 = partial apply for implicit closure #7 in closure #1 in static AADeviceProperty.subscript.setter;
  uint64_t v233 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v234 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v235 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v236 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v237 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v238 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v239 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v240 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v241 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v242 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v296 = 0;
  uint64_t v295 = 0;
  uint64_t v294 = 0;
  uint64_t v293 = 0;
  uint64_t v292 = 0;
  uint64_t v291 = 0;
  uint64_t v286 = 0;
  uint64_t v243 = 0;
  v280 = 0;
  uint64_t v6 = *a3;
  uint64_t v246 = *(void *)(*a3 + *MEMORY[0x263F8E100] + 8);
  uint64_t v244 = *(void *)(*(void *)(v246 + 32) + 8);
  uint64_t v245 = *(void *)(v6 + *MEMORY[0x263F8E100]);
  uint64_t v298 = v245;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v249 = (*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](0, v7);
  v250 = (char *)v106 - v249;
  unint64_t v251 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v8, (char *)v106 - v249);
  uint64_t v252 = (uint64_t)v106 - v251;
  uint64_t v253 = *(void *)(v11 + 24);
  uint64_t v297 = v253;
  uint64_t v254 = *(void *)(v253 - 8);
  uint64_t v255 = v253 - 8;
  unint64_t v256 = (*(void *)(v254 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10, v12);
  v257 = (char *)v106 - v256;
  uint64_t v263 = type metadata accessor for Logger();
  uint64_t v264 = *(void *)(v263 - 8);
  uint64_t v265 = v263 - 8;
  unint64_t v266 = (*(void *)(v264 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = MEMORY[0x270FA5388](v270, v262);
  uint64_t v267 = (char *)v106 - v266;
  unint64_t v268 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (void *)MEMORY[0x270FA5388](v13, v15);
  v269 = (char *)v106 - v268;
  v296 = v16;
  uint64_t v295 = v17;
  uint64_t v294 = v18;
  uint64_t v293 = v19;
  uint64_t v292 = v20;
  uint64_t v291 = v21;
  id v22 = v16;
  if (v270)
  {
    uint64_t v207 = v270;
    uint64_t v55 = v267;
    id v146 = v270;
    v280 = v270;
    swift_unknownObjectRetain();
    swift_retain();
    (*(void (**)(char *, uint64_t, uint64_t))(v254 + 16))(v257, v259, v253);
    uint64_t v279 = v262;
    uint64_t v145 = &v278;
    v144 = (void (*)(void))swift_modifyAtReferenceWritableKeyPath();
    (*(void (**)(uint64_t, char *, uint64_t))(v254 + 40))(v56, v257, v253);
    v144();
    swift_unknownObjectRelease();
    swift_release();
    uint64_t v57 = Logger.shared.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v264 + 16))(v55, v57, v263);
    id v58 = v146;
    uint64_t v147 = 24;
    uint64_t v160 = 7;
    uint64_t v59 = swift_allocObject();
    id v60 = v260;
    uint64_t v154 = v59;
    *(void *)(v59 + 16) = v146;
    id v61 = v60;
    uint64_t v161 = swift_allocObject();
    *(void *)(v161 + 16) = v260;
    v178 = Logger.logObject.getter();
    int v179 = static os_log_type_t.error.getter();
    v150 = &v276;
    uint64_t v276 = 42;
    unint64_t v148 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v149 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v151 = v277;
    uint64_t v157 = 17;
    uint64_t v163 = swift_allocObject();
    int v156 = 32;
    *(unsigned char *)(v163 + 16) = 32;
    uint64_t v164 = swift_allocObject();
    int v158 = 8;
    *(unsigned char *)(v164 + 16) = 8;
    uint64_t v159 = 32;
    uint64_t v62 = swift_allocObject();
    uint64_t v152 = v62;
    *(void *)(v62 + 16) = v208;
    *(void *)(v62 + 24) = 0;
    uint64_t v63 = swift_allocObject();
    uint64_t v64 = v152;
    uint64_t v165 = v63;
    *(void *)(v63 + 16) = v209;
    *(void *)(v63 + 24) = v64;
    uint64_t v166 = swift_allocObject();
    *(unsigned char *)(v166 + 16) = 0;
    uint64_t v167 = swift_allocObject();
    *(unsigned char *)(v167 + 16) = v158;
    uint64_t v65 = swift_allocObject();
    uint64_t v153 = v65;
    *(void *)(v65 + 16) = v210;
    *(void *)(v65 + 24) = 0;
    uint64_t v66 = swift_allocObject();
    uint64_t v67 = v153;
    uint64_t v168 = v66;
    *(void *)(v66 + 16) = v211;
    *(void *)(v66 + 24) = v67;
    uint64_t v169 = swift_allocObject();
    *(unsigned char *)(v169 + 16) = v156;
    uint64_t v170 = swift_allocObject();
    *(unsigned char *)(v170 + 16) = v158;
    uint64_t v68 = swift_allocObject();
    uint64_t v69 = v154;
    uint64_t v155 = v68;
    *(void *)(v68 + 16) = v212;
    *(void *)(v68 + 24) = v69;
    uint64_t v70 = swift_allocObject();
    uint64_t v71 = v155;
    uint64_t v171 = v70;
    *(void *)(v70 + 16) = v213;
    *(void *)(v70 + 24) = v71;
    uint64_t v172 = swift_allocObject();
    *(unsigned char *)(v172 + 16) = v156;
    uint64_t v173 = swift_allocObject();
    *(unsigned char *)(v173 + 16) = v158;
    uint64_t v72 = swift_allocObject();
    uint64_t v73 = v161;
    uint64_t v162 = v72;
    *(void *)(v72 + 16) = v214;
    *(void *)(v72 + 24) = v73;
    uint64_t v74 = swift_allocObject();
    uint64_t v75 = v162;
    uint64_t v175 = v74;
    *(void *)(v74 + 16) = v215;
    *(void *)(v74 + 24) = v75;
    uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v174 = _allocateUninitializedArray<A>(_:)();
    v176 = v76;
    swift_retain();
    uint64_t v77 = v163;
    uint64_t v78 = v176;
    id *v176 = v216;
    v78[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v77;
    swift_retain();
    uint64_t v79 = v164;
    v80 = v176;
    v176[2] = v217;
    v80[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v79;
    swift_retain();
    v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v165;
    uint64_t v82 = v176;
    v176[4] = v218;
    v82[5] = v81;
    swift_retain();
    uint64_t v83 = v166;
    uint64_t v84 = v176;
    v176[6] = v219;
    v84[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v83;
    swift_retain();
    uint64_t v85 = v167;
    uint64_t v86 = v176;
    v176[8] = v220;
    v86[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v85;
    swift_retain();
    id v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v168;
    uint64_t v88 = v176;
    v176[10] = v221;
    v88[11] = v87;
    swift_retain();
    uint64_t v89 = v169;
    uint64_t v90 = v176;
    v176[12] = v222;
    v90[13] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v89;
    swift_retain();
    uint64_t v91 = v170;
    v92 = v176;
    v176[14] = v223;
    v92[15] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v91;
    swift_retain();
    v93 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v171;
    uint64_t v94 = v176;
    v176[16] = v224;
    v94[17] = v93;
    swift_retain();
    uint64_t v95 = v172;
    uint64_t v96 = v176;
    v176[18] = v225;
    v96[19] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v95;
    swift_retain();
    uint64_t v97 = v173;
    uint64_t v98 = v176;
    v176[20] = v226;
    v98[21] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v97;
    swift_retain();
    v99 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v175;
    v100 = v176;
    v176[22] = v227;
    v100[23] = v99;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v178, (os_log_type_t)v179))
    {
      uint64_t v101 = v243;
      uint64_t v137 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v138 = createStorage<A>(capacity:type:)(0);
      uint64_t v139 = createStorage<A>(capacity:type:)(3);
      v140 = &v275;
      v275 = v137;
      uint64_t v141 = &v274;
      uint64_t v274 = v138;
      v142 = &v273;
      uint64_t v273 = v139;
      serialize(_:at:)(2, &v275);
      serialize(_:at:)(4, v140);
      uint64_t v271 = v216;
      uint64_t v272 = v163;
      closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)v140, (uint64_t)v141, (uint64_t)v142);
      uint64_t v143 = v101;
      if (v101)
      {
        __break(1u);
      }
      else
      {
        uint64_t v271 = v217;
        uint64_t v272 = v164;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v135 = 0;
        uint64_t v102 = v135;
        uint64_t v271 = v218;
        uint64_t v272 = v165;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v134 = v102;
        uint64_t v271 = v219;
        uint64_t v272 = v166;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v133 = 0;
        uint64_t v271 = v220;
        uint64_t v272 = v167;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v132 = 0;
        uint64_t v271 = v221;
        uint64_t v272 = v168;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v131 = 0;
        uint64_t v271 = v222;
        uint64_t v272 = v169;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v130 = 0;
        uint64_t v271 = v223;
        uint64_t v272 = v170;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v129 = 0;
        uint64_t v271 = v224;
        uint64_t v272 = v171;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v128 = 0;
        uint64_t v271 = v225;
        uint64_t v272 = v172;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v127 = 0;
        uint64_t v271 = v226;
        uint64_t v272 = v173;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        uint64_t v126 = 0;
        uint64_t v271 = v227;
        uint64_t v272 = v175;
        closure #1 in osLogInternal(_:log:type:)(&v271, (uint64_t)&v275, (uint64_t)&v274, (uint64_t)&v273);
        _os_log_impl(&dword_250C36000, v178, (os_log_type_t)v179, "HeadphoneManager: %s: %ld Failed to update AAD Device Config, Error: %s %s", v137, v151);
        destroyStorage<A>(_:count:)(v138, 0, v136);
        destroyStorage<A>(_:count:)(v139, 3, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x253386220](v137, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v264 + 8))(v267, v263);
  }
  else
  {
    uint64_t v23 = v269;
    uint64_t v24 = Logger.shared.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v264 + 16))(v23, v24, v263);
    id v25 = v260;
    uint64_t v190 = 7;
    uint64_t v191 = swift_allocObject();
    *(void *)(v191 + 16) = v260;
    uint64_t v205 = Logger.logObject.getter();
    int v206 = static os_log_type_t.default.getter();
    v182 = &v289;
    uint64_t v189 = 32;
    uint64_t v289 = 32;
    unint64_t v180 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v181 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v183 = v290;
    uint64_t v187 = 17;
    uint64_t v193 = swift_allocObject();
    int v186 = 32;
    *(unsigned char *)(v193 + 16) = 32;
    uint64_t v194 = swift_allocObject();
    int v188 = 8;
    *(unsigned char *)(v194 + 16) = 8;
    uint64_t v26 = swift_allocObject();
    uint64_t v184 = v26;
    *(void *)(v26 + 16) = v228;
    *(void *)(v26 + 24) = 0;
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = v184;
    uint64_t v195 = v27;
    *(void *)(v27 + 16) = v229;
    *(void *)(v27 + 24) = v28;
    uint64_t v196 = swift_allocObject();
    *(unsigned char *)(v196 + 16) = 0;
    uint64_t v197 = swift_allocObject();
    *(unsigned char *)(v197 + 16) = v188;
    uint64_t v29 = swift_allocObject();
    uint64_t v185 = v29;
    *(void *)(v29 + 16) = v230;
    *(void *)(v29 + 24) = 0;
    uint64_t v30 = swift_allocObject();
    uint64_t v31 = v185;
    uint64_t v198 = v30;
    *(void *)(v30 + 16) = v231;
    *(void *)(v30 + 24) = v31;
    uint64_t v199 = swift_allocObject();
    *(unsigned char *)(v199 + 16) = v186;
    uint64_t v200 = swift_allocObject();
    *(unsigned char *)(v200 + 16) = v188;
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v191;
    uint64_t v192 = v32;
    *(void *)(v32 + 16) = v232;
    *(void *)(v32 + 24) = v33;
    uint64_t v34 = swift_allocObject();
    uint64_t v35 = v192;
    uint64_t v202 = v34;
    *(void *)(v34 + 16) = v233;
    *(void *)(v34 + 24) = v35;
    uint64_t v204 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v201 = _allocateUninitializedArray<A>(_:)();
    uint64_t v203 = v36;
    swift_retain();
    uint64_t v37 = v193;
    uint64_t v38 = v203;
    *uint64_t v203 = v234;
    v38[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v37;
    swift_retain();
    uint64_t v39 = v194;
    uint64_t v40 = v203;
    v203[2] = v235;
    v40[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v39;
    swift_retain();
    uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v195;
    uint64_t v42 = v203;
    v203[4] = v236;
    v42[5] = v41;
    swift_retain();
    uint64_t v43 = v196;
    v44 = v203;
    v203[6] = v237;
    v44[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v43;
    swift_retain();
    uint64_t v45 = v197;
    v46 = v203;
    v203[8] = v238;
    v46[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v45;
    swift_retain();
    v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v198;
    uint64_t v48 = v203;
    v203[10] = v239;
    v48[11] = v47;
    swift_retain();
    uint64_t v49 = v199;
    v50 = v203;
    v203[12] = v240;
    v50[13] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v49;
    swift_retain();
    uint64_t v51 = v200;
    id v52 = v203;
    v203[14] = v241;
    v52[15] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v51;
    swift_retain();
    uint64_t v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v202;
    uint64_t v54 = v203;
    v203[16] = v242;
    v54[17] = v53;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v205, (os_log_type_t)v206))
    {
      uint64_t v103 = v243;
      uint64_t v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v120 = createStorage<A>(capacity:type:)(0);
      uint64_t v121 = createStorage<A>(capacity:type:)(2);
      uint64_t v122 = &v285;
      uint64_t v285 = v119;
      v123 = &v284;
      uint64_t v284 = v120;
      uint64_t v124 = &v283;
      uint64_t v283 = v121;
      serialize(_:at:)(2, &v285);
      serialize(_:at:)(3, v122);
      v281 = v234;
      uint64_t v282 = v193;
      closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
      uint64_t v125 = v103;
      if (v103)
      {
        __break(1u);
      }
      else
      {
        v281 = v235;
        uint64_t v282 = v194;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v117 = 0;
        uint64_t v104 = v117;
        v281 = v236;
        uint64_t v282 = v195;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v116 = v104;
        v281 = v237;
        uint64_t v282 = v196;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v115 = 0;
        v281 = v238;
        uint64_t v282 = v197;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v114 = 0;
        v281 = v239;
        uint64_t v282 = v198;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v113 = 0;
        v281 = v240;
        uint64_t v282 = v199;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v112 = 0;
        v281 = v241;
        uint64_t v282 = v200;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        uint64_t v111 = 0;
        v281 = v242;
        uint64_t v282 = v202;
        closure #1 in osLogInternal(_:log:type:)(&v281, (uint64_t)&v285, (uint64_t)&v284, (uint64_t)&v283);
        _os_log_impl(&dword_250C36000, v205, (os_log_type_t)v206, "HeadphoneManager: %s: %ld  Successfully Updated AAD Device Config: %s", v119, v183);
        destroyStorage<A>(_:count:)(v120, 0, v118);
        destroyStorage<A>(_:count:)(v121, 2, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x253386220](v119, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v264 + 8))(v269, v263);
  }
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v288 = v262;
  swift_getAtKeyPath();
  v110 = (uint64_t *)(v252 + *(int *)(v246 + 52));
  if (*v110)
  {
    uint64_t v109 = *v110;
    swift_retain();
    outlined destroy of AADeviceProperty<A, B>(v252, v253);
    CurrentValueSubject.send(_:)();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();
    outlined destroy of AADeviceProperty<A, B>(v252, v253);
  }
  dispatch thunk of ObservableObject.objectWillChange.getter();
  type metadata accessor for ObservableObjectPublisher();
  uint64_t result = swift_dynamicCast();
  if (result) {
    uint64_t v108 = v287;
  }
  else {
    uint64_t v108 = 0;
  }
  uint64_t v107 = v108;
  if (v108)
  {
    v106[1] = v107;
    v106[0] = v107;
    uint64_t v286 = v107;
    ObservableObjectPublisher.send()();
    return swift_release();
  }
  return result;
}

uint64_t implicit closure #1 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("subscript(_enclosingInstance:wrapped:storage:)", 0x2EuLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #2 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return 64;
}

uint64_t implicit closure #3 in closure #1 in static AADeviceProperty.subscript.setter(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  return String.init<A>(describing:)();
}

uint64_t implicit closure #4 in closure #1 in static AADeviceProperty.subscript.setter(void *a1)
{
  id v1 = a1;
  id v4 = objc_msgSend(a1, sel_debugDescription);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t implicit closure #5 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("subscript(_enclosingInstance:wrapped:storage:)", 0x2EuLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #6 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return 66;
}

uint64_t implicit closure #7 in closure #1 in static AADeviceProperty.subscript.setter(void *a1)
{
  id v1 = a1;
  id v4 = objc_msgSend(a1, sel_debugDescription);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

void (*static AADeviceProperty.subscript.modify(void *a1, uint64_t a2, void *a3, uint64_t a4))(uint64_t *a1, char a2)
{
  uint64_t v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[2] = a4;
  v8[1] = a3;
  *uint64_t v8 = a2;
  uint64_t v4 = *(void *)(*a3 + *MEMORY[0x263F8E100] + 8);
  v8[3] = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  v8[4] = v6;
  size_t __size = *(void *)(v6 + 64);
  v8[5] = malloc(__size);
  uint64_t v13 = malloc(__size);
  v8[6] = v13;
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  static AADeviceProperty.subscript.getter(a3, (uint64_t)v13);
  return static AADeviceProperty.subscript.modify;
}

void static AADeviceProperty.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v11 = *a1;
  if (a2)
  {
    uint64_t v7 = *(void **)(v11 + 48);
    uint64_t v8 = *(void **)(v11 + 40);
    uint64_t v3 = *(void *)(v11 + 24);
    uint64_t v4 = *(void **)(v11 + 16);
    uint64_t v5 = *(void **)(v11 + 8);
    uint64_t v6 = *(void **)v11;
    uint64_t v2 = *(void *)(v11 + 32);
    (*(void (**)(void))(v2 + 16))();
    static AADeviceProperty.subscript.setter((uint64_t)v8, v6, v5, v4);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v7, v3);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    free(v7);
    free(v8);
  }
  else
  {
    uint64_t v9 = *(void **)(v11 + 48);
    uint64_t v10 = *(void **)(v11 + 40);
    static AADeviceProperty.subscript.setter((uint64_t)v9, *(void **)v11, *(void **)(v11 + 8), *(void **)(v11 + 16));
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
    free(v9);
    free(v10);
  }
  free((void *)v11);
}

void AADeviceProperty.wrappedValue.getter()
{
}

void key path getter for AADeviceProperty.wrappedValue : <A, B>AADeviceProperty<A, B>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v18 = a4;
  uint64_t v14 = a1;
  uint64_t v4 = (uint64_t *)(a2 + a3 - 32);
  uint64_t v12 = *v4;
  uint64_t v28 = v12;
  uint64_t v20 = v4[1];
  uint64_t v27 = v20;
  uint64_t v13 = v4[2];
  uint64_t v16 = *(void *)(v20 - 8);
  uint64_t v17 = v20 - 8;
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v19 = (char *)&v11 - v5;
  uint64_t v23 = v12;
  uint64_t v24 = v20;
  uint64_t v25 = v13;
  uint64_t v26 = v6;
  uint64_t v21 = type metadata accessor for AADeviceProperty();
  unint64_t v15 = (*(void *)(*(void *)(v21 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v14, v7);
  id v22 = (char *)&v11 - v15;
  outlined init with copy of AADeviceProperty<A, B>(v8, (uint64_t)&v11 - v15, v9, v10);
  AADeviceProperty.wrappedValue.getter();
}

uint64_t sub_250D046A4()
{
  (*(void (**)(void, void, void))(*(void *)(v0 - 120) + 32))(*(void *)(v0 - 104), *(void *)(v0 - 96), *(void *)(v0 - 88));
  uint64_t result = *(void *)(v0 - 72);
  outlined destroy of AADeviceProperty<A, B>(result, *(void *)(v0 - 88));
  return result;
}

void key path setter for AADeviceProperty.wrappedValue : <A, B>AADeviceProperty<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1;
  uint64_t v4 = (uint64_t *)(a3 + a4 - 32);
  uint64_t v8 = *v4;
  uint64_t v18 = v8;
  uint64_t v9 = v4[1];
  uint64_t v17 = v9;
  uint64_t v10 = v4[2];
  uint64_t v11 = v4[3];
  uint64_t v7 = *(void *)(v9 - 8);
  unint64_t v6 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1, a1);
  uint64_t v12 = (char *)&v5 - v6;
  (*(void (**)(char *))(v7 + 16))((char *)&v5 - v6);
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  uint64_t v16 = v11;
  type metadata accessor for AADeviceProperty();
  AADeviceProperty.wrappedValue.setter();
}

void AADeviceProperty.wrappedValue.setter()
{
}

void AADeviceProperty.wrappedValue.modify(void *a1, uint64_t a2)
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[1] = v2;
  *unint64_t v6 = a2;
  uint64_t v3 = *(void *)(a2 + 24);
  v6[2] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v6[3] = v4;
  size_t __size = *(void *)(v4 + 64);
  v6[4] = malloc(__size);
  v6[5] = malloc(__size);
  AADeviceProperty.wrappedValue.getter();
}

void (*sub_250D04988())(uint64_t a1, char a2)
{
  return AADeviceProperty.wrappedValue.modify;
}

void AADeviceProperty.wrappedValue.modify(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    AADeviceProperty.wrappedValue.setter();
  }
  (*(void (**)(void))(*(void *)(*(void *)a1 + 24) + 16))();
  AADeviceProperty.wrappedValue.setter();
}

void sub_250D04A74(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  (*(void (**)(uint64_t, uint64_t))(a12 + 8))(a13, a14);
  free(a15);
  free(a16);
  free(*(void **)(v16 - 48));
}

void variable initialization expression of AADeviceProperty.publisher(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t variable initialization expression of AADeviceProperty.objectWillChange()
{
  return 0;
}

uint64_t AADeviceProperty.objectWillChange.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(a1 + 56));
  swift_retain();
  return v3;
}

uint64_t AADeviceProperty.objectWillChange.setter(uint64_t a1, uint64_t a2)
{
  swift_retain();
  *(void *)(v2 + *(int *)(a2 + 56)) = a1;
  swift_release();
  return swift_release();
}

void (*AADeviceProperty.objectWillChange.modify())()
{
  return AADeviceProperty.objectWillChange.modify;
}

uint64_t AADeviceProperty.projectedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v11 = a3;
  uint64_t v12 = a1;
  uint64_t v14 = "Fatal error";
  uint64_t v15 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v16 = "HeadphoneManager/AADevicePropertyWrapper.swift";
  uint64_t v25 = 0;
  uint64_t v23 = 0;
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v26 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = v17 - 8;
  unint64_t v20 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v21 = (uint64_t)&v6 - v20;
  uint64_t v25 = v3;
  v24[1] = *(void *)(v4 + 16);
  uint64_t v22 = *(void *)(v3 + *(int *)(v4 + 52));
  swift_retain();
  if (v22)
  {
    uint64_t v10 = v22;
    uint64_t v9 = v22;
    uint64_t v23 = v22;
    swift_retain();
    *uint64_t v11 = v9;
    return swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v21, v13, v17);
    HeadphonePropertyWrapperPublisher.init(_:)(v21, v17, v24);
    *(void *)(v13 + *(int *)(v12 + 52)) = v24[0];
    swift_release();
    uint64_t v8 = *(void *)(v13 + *(int *)(v12 + 52));
    uint64_t result = swift_retain();
    if (v8)
    {
      uint64_t v7 = v8;
    }
    else
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    *uint64_t v11 = v7;
  }
  return result;
}

void default argument 3 of AADeviceProperty.init(_:_:_:_:)(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t AADeviceProperty.init(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v31 = a7;
  uint64_t v35 = a1;
  uint64_t v34 = a2;
  v27[1] = a3;
  v27[2] = a4;
  uint64_t v37 = a6;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v40 = 0;
  char v39 = 0;
  uint64_t v49 = a5;
  uint64_t v48 = a6;
  uint64_t v32 = *(void *)(a6 - 8);
  uint64_t v33 = a6 - 8;
  v27[0] = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v29 = (char *)v27 - v27[0];
  uint64_t v44 = v7;
  uint64_t v45 = v8;
  uint64_t v46 = v9;
  uint64_t v47 = v10;
  v27[3] = 0;
  uint64_t v38 = (int *)type metadata accessor for AADeviceProperty();
  unint64_t v28 = (*(void *)(*((void *)v38 - 1) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v35, v34);
  uint64_t v12 = v38;
  uint64_t v13 = (char *)v27 - v28;
  v36 = v13;
  uint64_t v43 = (char *)v27 - v28;
  uint64_t v42 = v11;
  uint64_t v41 = v14;
  uint64_t v40 = v15;
  int v30 = *v16;
  char v39 = v30;
  *(void *)&v13[v38[13]] = v17;
  *(void *)&v13[v12[14]] = v17;
  swift_retain();
  uint64_t v18 = v29;
  uint64_t v19 = v32;
  uint64_t v20 = v34;
  uint64_t v21 = v37;
  *(void *)&v36[v38[15]] = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v18, v20, v21);
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v36, v29, v37);
  uint64_t v22 = v31;
  uint64_t v23 = v37;
  uint64_t v24 = v38;
  uint64_t v25 = (uint64_t)v36;
  v36[v38[16]] = v30;
  outlined init with copy of AADeviceProperty<A, B>(v25, v22, v23, v24);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v37);
  swift_release();
  uint64_t result = (uint64_t)v36;
  outlined destroy of AADeviceProperty<A, B>((uint64_t)v36, v37);
  return result;
}

uint64_t sub_250D05068()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_6(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_250D0509C()
{
  return swift_deallocObject();
}

uint64_t sub_250D050D0()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_6()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_250D0511C()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_6(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_250D05168()
{
  return swift_deallocObject();
}

uint64_t sub_250D0519C()
{
  return swift_deallocObject();
}

uint64_t sub_250D051D0()
{
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_4@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_250D0521C()
{
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];
  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_250D052D0()
{
  return swift_deallocObject();
}

uint64_t sub_250D05304()
{
  return swift_deallocObject();
}

uint64_t sub_250D05338()
{
  return swift_deallocObject();
}

uint64_t sub_250D05384()
{
  return swift_deallocObject();
}

uint64_t sub_250D053D0()
{
  return swift_deallocObject();
}

uint64_t sub_250D05404()
{
  return swift_deallocObject();
}

uint64_t sub_250D05438()
{
  return swift_deallocObject();
}

uint64_t sub_250D05484()
{
  return swift_deallocObject();
}

uint64_t sub_250D054D0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #8 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #8 in static AADeviceProperty.subscript.setter();
}

uint64_t sub_250D0551C()
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(v0 + 24) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 24) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #9 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #9 in static AADeviceProperty.subscript.setter();
}

uint64_t sub_250D05654()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #10 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #10 in static AADeviceProperty.subscript.setter(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_250D056A8()
{
  return swift_deallocObject();
}

uint64_t sub_250D056DC()
{
  return swift_deallocObject();
}

uint64_t sub_250D05710()
{
  return swift_deallocObject();
}

uint64_t sub_250D0575C()
{
  return swift_deallocObject();
}

uint64_t sub_250D057A8()
{
  return swift_deallocObject();
}

uint64_t sub_250D057DC()
{
  return swift_deallocObject();
}

uint64_t sub_250D05810()
{
  return swift_deallocObject();
}

uint64_t sub_250D0585C()
{
  return swift_deallocObject();
}

uint64_t sub_250D05910()
{
  return swift_deallocObject();
}

uint64_t sub_250D05944()
{
  return swift_deallocObject();
}

uint64_t sub_250D05978()
{
  return swift_deallocObject();
}

uint64_t sub_250D059C4()
{
  return swift_deallocObject();
}

uint64_t sub_250D05A10()
{
  return swift_deallocObject();
}

uint64_t sub_250D05A44()
{
  return swift_deallocObject();
}

uint64_t sub_250D05A78()
{
  return swift_deallocObject();
}

uint64_t sub_250D05AC4()
{
  return swift_deallocObject();
}

uint64_t sub_250D05B10()
{
  return swift_deallocObject();
}

uint64_t sub_250D05B44()
{
  return swift_deallocObject();
}

uint64_t sub_250D05B78()
{
  return swift_deallocObject();
}

uint64_t sub_250D05BC4()
{
  return swift_deallocObject();
}

uint64_t sub_250D05C10()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #13 in static AADeviceProperty.subscript.setter(v0[6], v0[2], v0[3], v0[4]);
}

uint64_t sub_250D05C88()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #14 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #14 in static AADeviceProperty.subscript.setter(v0[6], v0[2], v0[3], v0[4]);
}

uint64_t sub_250D05D00()
{
  return swift_deallocObject();
}

uint64_t sub_250D05D34()
{
  return swift_deallocObject();
}

uint64_t sub_250D05D68()
{
  return swift_deallocObject();
}

uint64_t sub_250D05DB4()
{
  return swift_deallocObject();
}

uint64_t sub_250D05E00()
{
  return swift_deallocObject();
}

uint64_t sub_250D05E34()
{
  return swift_deallocObject();
}

uint64_t sub_250D05E68()
{
  return swift_deallocObject();
}

uint64_t sub_250D05EB4()
{
  return swift_deallocObject();
}

uint64_t sub_250D05F68()
{
  return swift_deallocObject();
}

uint64_t sub_250D05F9C()
{
  return swift_deallocObject();
}

uint64_t sub_250D05FD0()
{
  return swift_deallocObject();
}

uint64_t sub_250D0601C()
{
  return swift_deallocObject();
}

uint64_t sub_250D06068()
{
  return swift_deallocObject();
}

uint64_t sub_250D0609C()
{
  return swift_deallocObject();
}

uint64_t sub_250D060D0()
{
  return swift_deallocObject();
}

uint64_t sub_250D06110()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #17 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #17 in static AADeviceProperty.subscript.setter(*(void **)(v0 + 16));
}

uint64_t sub_250D06158()
{
  return swift_deallocObject();
}

uint64_t sub_250D0618C()
{
  return swift_deallocObject();
}

uint64_t sub_250D061C0()
{
  return swift_deallocObject();
}

uint64_t sub_250D0620C()
{
  return swift_deallocObject();
}

uint64_t sub_250D06258()
{
  return swift_deallocObject();
}

uint64_t sub_250D0628C()
{
  return swift_deallocObject();
}

uint64_t sub_250D062C0()
{
  return swift_deallocObject();
}

uint64_t sub_250D0630C()
{
  return swift_deallocObject();
}

uint64_t sub_250D063C0()
{
  return swift_deallocObject();
}

uint64_t sub_250D063F4()
{
  return swift_deallocObject();
}

uint64_t sub_250D06428()
{
  return swift_deallocObject();
}

uint64_t sub_250D06474()
{
  return swift_deallocObject();
}

uint64_t sub_250D064C0()
{
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v7 - 8);
  uint64_t v1 = *(_DWORD *)(v3 + 80);
  uint64_t v4 = (v1 + 64) & ~v1;
  unint64_t v5 = (v4 + *(void *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = (v5 + 8 + v1) & ~v1;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v0 + v4, v7);

  v8(v0 + v6, v7);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static AADeviceProperty.subscript.setter(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(v1 + 24) - 8);
  unint64_t v3 = (*(_DWORD *)(v2 + 80) + 64) & ~(unint64_t)*(_DWORD *)(v2 + 80);
  unint64_t v4 = (v3 + *(void *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  return closure #1 in static AADeviceProperty.subscript.setter(a1, *(void *)(v1 + 48), *(void **)(v1 + 56), v1 + v3, *(void **)(v1 + v4), v1+ ((v4 + 8 + *(_DWORD *)(v2 + 80)) & ~(unint64_t)*(_DWORD *)(v2 + 80)));
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t outlined init with copy of AADeviceProperty<A, B>(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  (*(void (**)(void))(*(void *)(a3 - 8) + 16))();
  uint64_t v5 = a4[13];
  uint64_t v6 = *(void *)(a1 + v5);
  swift_retain();
  *(void *)(a2 + v5) = v6;
  uint64_t v7 = a4[14];
  uint64_t v8 = *(void *)(a1 + v7);
  swift_retain();
  *(void *)(a2 + v7) = v8;
  uint64_t v10 = a4[15];
  uint64_t v11 = *(void *)(a1 + v10);
  swift_retain();
  uint64_t result = a2;
  *(void *)(a2 + v10) = v11;
  *(unsigned char *)(a2 + a4[16]) = *(unsigned char *)(a1 + a4[16]);
  return result;
}

uint64_t sub_250D06800()
{
  return 32;
}

__n128 sub_250D0682C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

unint64_t initializeBufferWithCopyOfBuffer for AADeviceProperty(void *a1, void *a2, uint64_t a3)
{
  int v15 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v15 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    swift_retain();
    *a1 = v10;
    return *a1 + ((v15 + 16) & ~(unint64_t)v15);
  }
  else
  {
    (*(void (**)(void *, void *))(*(void *)(*(void *)(a3 + 24) - 8) + 16))(a1, a2);
    uint64_t v4 = *(int *)(a3 + 52);
    uint64_t v5 = *(void *)((char *)a2 + v4);
    swift_retain();
    *(void *)((char *)a1 + v4) = v5;
    uint64_t v6 = *(int *)(a3 + 56);
    uint64_t v7 = *(void *)((char *)a2 + v6);
    swift_retain();
    *(void *)((char *)a1 + v6) = v7;
    uint64_t v8 = *(int *)(a3 + 60);
    uint64_t v9 = *(void *)((char *)a2 + v8);
    swift_retain();
    *(void *)((char *)a1 + v8) = v9;
    *((unsigned char *)a1 + *(int *)(a3 + 64)) = *((unsigned char *)a2 + *(int *)(a3 + 64));
    return (unint64_t)a1;
  }
}

uint64_t destroy for AADeviceProperty(uint64_t a1, uint64_t a2)
{
  return swift_release();
}

uint64_t initializeWithCopy for AADeviceProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 24) - 8) + 16))();
  uint64_t v4 = *(int *)(a3 + 52);
  uint64_t v5 = *(void *)(a2 + v4);
  swift_retain();
  *(void *)(a1 + v4) = v5;
  uint64_t v6 = *(int *)(a3 + 56);
  uint64_t v7 = *(void *)(a2 + v6);
  swift_retain();
  *(void *)(a1 + v6) = v7;
  uint64_t v9 = *(int *)(a3 + 60);
  uint64_t v10 = *(void *)(a2 + v9);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + v9) = v10;
  *(unsigned char *)(a1 + *(int *)(a3 + 64)) = *(unsigned char *)(a2 + *(int *)(a3 + 64));
  return result;
}

uint64_t assignWithCopy for AADeviceProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 24) - 8) + 24))();
  uint64_t v3 = *(int *)(a3 + 52);
  uint64_t v6 = (void *)(a1 + v3);
  uint64_t v7 = *(void *)(a2 + v3);
  swift_retain();
  *uint64_t v6 = v7;
  swift_release();
  uint64_t v4 = *(int *)(a3 + 56);
  uint64_t v8 = (void *)(a1 + v4);
  uint64_t v9 = *(void *)(a2 + v4);
  swift_retain();
  *uint64_t v8 = v9;
  swift_release();
  uint64_t v10 = *(int *)(a3 + 60);
  uint64_t v11 = *(void *)(a2 + v10);
  swift_retain();
  *(void *)(a1 + v10) = v11;
  swift_release();
  uint64_t result = a1;
  *(unsigned char *)(a1 + *(int *)(a3 + 64)) = *(unsigned char *)(a2 + *(int *)(a3 + 64));
  return result;
}

uint64_t initializeWithTake for AADeviceProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 24) - 8) + 32))();
  uint64_t result = a1;
  *(void *)(a1 + *(int *)(a3 + 52)) = *(void *)(a2 + *(int *)(a3 + 52));
  *(void *)(a1 + *(int *)(a3 + 56)) = *(void *)(a2 + *(int *)(a3 + 56));
  *(void *)(a1 + *(int *)(a3 + 60)) = *(void *)(a2 + *(int *)(a3 + 60));
  *(unsigned char *)(a1 + *(int *)(a3 + 64)) = *(unsigned char *)(a2 + *(int *)(a3 + 64));
  return result;
}

uint64_t assignWithTake for AADeviceProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(*(void *)(a3 + 24) - 8) + 40))();
  *(void *)(a1 + *(int *)(a3 + 52)) = *(void *)(a2 + *(int *)(a3 + 52));
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 56)) = *(void *)(a2 + *(int *)(a3 + 56));
  swift_release();
  *(void *)(a1 + *(int *)(a3 + 60)) = *(void *)(a2 + *(int *)(a3 + 60));
  swift_release();
  uint64_t result = a1;
  *(unsigned char *)(a1 + *(int *)(a3 + 64)) = *(unsigned char *)(a2 + *(int *)(a3 + 64));
  return result;
}

uint64_t getEnumTagSinglePayload for AADeviceProperty()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_250D06EB8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 24);
  if (a2 == *(_DWORD *)(*(void *)(v6 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 48))(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 60)) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 60));
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for AADeviceProperty()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_250D07004(uint64_t result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 24);
  if (a3 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v4 - 8) + 56))(result, a2, a2, v4);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(result + *(int *)(a4 + 60)) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_250D070FC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #7 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #7 in closure #1 in static AADeviceProperty.subscript.setter(*(void **)(v0 + 16));
}

uint64_t sub_250D07144()
{
  return swift_deallocObject();
}

uint64_t sub_250D07178()
{
  return swift_deallocObject();
}

uint64_t sub_250D071AC()
{
  return swift_deallocObject();
}

uint64_t sub_250D071F8()
{
  return swift_deallocObject();
}

uint64_t sub_250D07244()
{
  return swift_deallocObject();
}

uint64_t sub_250D07278()
{
  return swift_deallocObject();
}

uint64_t sub_250D072AC()
{
  return swift_deallocObject();
}

uint64_t sub_250D072F8()
{
  return swift_deallocObject();
}

uint64_t sub_250D073AC()
{
  return swift_deallocObject();
}

uint64_t sub_250D073E0()
{
  return swift_deallocObject();
}

uint64_t sub_250D07414()
{
  return swift_deallocObject();
}

uint64_t sub_250D07460()
{
  return swift_deallocObject();
}

uint64_t sub_250D074AC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #3 in closure #1 in static AADeviceProperty.subscript.setter(*(void **)(v0 + 16));
}

uint64_t sub_250D074F4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in closure #1 in static AADeviceProperty.subscript.setter()
{
  return implicit closure #4 in closure #1 in static AADeviceProperty.subscript.setter(*(void **)(v0 + 16));
}

uint64_t sub_250D0753C()
{
  return swift_deallocObject();
}

uint64_t sub_250D07570()
{
  return swift_deallocObject();
}

uint64_t sub_250D075A4()
{
  return swift_deallocObject();
}

uint64_t sub_250D075F0()
{
  return swift_deallocObject();
}

uint64_t sub_250D0763C()
{
  return swift_deallocObject();
}

uint64_t sub_250D07670()
{
  return swift_deallocObject();
}

uint64_t sub_250D076A4()
{
  return swift_deallocObject();
}

uint64_t sub_250D076F0()
{
  return swift_deallocObject();
}

uint64_t sub_250D077A4()
{
  return swift_deallocObject();
}

uint64_t sub_250D077D8()
{
  return swift_deallocObject();
}

uint64_t sub_250D0780C()
{
  return swift_deallocObject();
}

uint64_t sub_250D07858()
{
  return swift_deallocObject();
}

uint64_t sub_250D078A4()
{
  return swift_deallocObject();
}

uint64_t sub_250D078D8()
{
  return swift_deallocObject();
}

uint64_t sub_250D0790C()
{
  return swift_deallocObject();
}

uint64_t sub_250D07958()
{
  return swift_deallocObject();
}

uint64_t _swift_stdlib_has_malloc_size_6()
{
  return 1;
}

size_t _swift_stdlib_malloc_size_6(const void *a1)
{
  return malloc_size(a1);
}

uint64_t variable initialization expression of HeadphoneDataProvider.kDefaultsStorageIdentifier()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.settings.headphone.HeadphoneManager.Mock", 0x32uLL, 1)._countAndFlagsBits;
}

uint64_t HeadphoneDataProvider.kDefaultsStorageIdentifier.getter()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_kDefaultsStorageIdentifier);
  swift_bridgeObjectRetain();
  return v2;
}

void HeadphoneDataProvider.defaultsObserver.setter(void *a1)
{
  id v2 = a1;
  uint64_t v4 = (void **)(v1 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider____lazy_storage___defaultsObserver);
  swift_beginAccess();
  uint64_t v3 = *v4;
  *uint64_t v4 = a1;
  outlined consume of DefaultsObserver??(v3);
  swift_endAccess();
}

void (*HeadphoneDataProvider.defaultsObserver.modify(char **a1))(id *a1, char a2)
{
  a1[1] = v1;
  *a1 = HeadphoneDataProvider.defaultsObserver.getter();
  return HeadphoneDataProvider.defaultsObserver.modify;
}

void HeadphoneDataProvider.defaultsObserver.modify(id *a1, char a2)
{
  if (a2)
  {
    id v3 = *a1;
    id v2 = *a1;
    HeadphoneDataProvider.defaultsObserver.setter(v3);
    outlined destroy of DefaultsObserver?(a1);
  }
  else
  {
    HeadphoneDataProvider.defaultsObserver.setter(*a1);
  }
}

uint64_t variable initialization expression of HeadphoneDataProvider.$__lazy_storage_$_defaultsObserver()
{
  return 1;
}

id static HeadphoneDataProvider.shared.getter()
{
  id v2 = (id *)HeadphoneDataProvider.shared.unsafeMutableAddressor();
  swift_beginAccess();
  id v3 = *v2;
  id v0 = *v2;
  swift_endAccess();
  return v3;
}

void static HeadphoneDataProvider.shared.setter(void *a1)
{
  id v3 = HeadphoneDataProvider.shared.unsafeMutableAddressor();
  id v1 = a1;
  swift_beginAccess();
  id v2 = (void *)*v3;
  *id v3 = (uint64_t)a1;

  swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneDataProvider.listeners()
{
  return Set.init()();
}

uint64_t HeadphoneDataProvider.listeners.getter()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_listeners);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t HeadphoneDataProvider.listeners.setter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_listeners);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*HeadphoneDataProvider.listeners.modify())()
{
  return HeadphoneDataProvider.listeners.modify;
}

uint64_t HeadphoneDataProvider.listeners.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneDataProvider.shouldShowMock()
{
  return 0;
}

uint64_t HeadphoneDataProvider.shouldShowMock.getter()
{
  id v2 = (char *)(v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_shouldShowMock);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t (*HeadphoneDataProvider.shouldShowMock.modify())()
{
  return HeadphoneDataProvider.shouldShowMock.modify;
}

uint64_t HeadphoneDataProvider.shouldShowMock.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneDataProvider.shouldShowMockKey()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("shouldShowMock", 0xEuLL, 1)._countAndFlagsBits;
}

uint64_t HeadphoneDataProvider.shouldShowMockKey.getter()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_shouldShowMockKey);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t HeadphoneDataProvider.shouldShowMockKey.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  unsigned int v5 = (void *)(v2 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneDataProvider_shouldShowMockKey);
  swift_beginAccess();
  *unsigned int v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*HeadphoneDataProvider.shouldShowMockKey.modify())()
{
  return HeadphoneDataProvider.shouldShowMockKey.modify;
}

uint64_t HeadphoneDataProvider.shouldShowMockKey.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneDataProvider.deviceFoundHandler()
{
  return 0;
}

uint64_t (*HeadphoneDataProvider.deviceFoundHandler.modify())()
{
  return HeadphoneDataProvider.deviceFoundHandler.modify;
}

uint64_t HeadphoneDataProvider.deviceFoundHandler.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneDataProvider.deviceLostHandler()
{
  return 0;
}

uint64_t (*HeadphoneDataProvider.deviceLostHandler.modify())()
{
  return HeadphoneDataProvider.deviceLostHandler.modify;
}

uint64_t HeadphoneDataProvider.deviceLostHandler.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneDataProvider.dataObjects()
{
  return Dictionary.init()();
}

uint64_t (*HeadphoneDataProvider.dataObjects.modify())()
{
  return HeadphoneDataProvider.dataObjects.modify;
}

uint64_t HeadphoneDataProvider.dataObjects.modify()
{
  return swift_endAccess();
}

NSMutableDictionary variable initialization expression of HeadphoneDataProvider.hexForReplayDeviceMap()
{
  return NSMutableDictionary.__allocating_init()();
}

uint64_t (*HeadphoneDataProvider.hexForReplayDeviceMap.modify())()
{
  return HeadphoneDataProvider.hexForReplayDeviceMap.modify;
}

uint64_t HeadphoneDataProvider.hexForReplayDeviceMap.modify()
{
  return swift_endAccess();
}

uint64_t sub_250D084BC()
{
  return swift_deallocObject();
}

void closure #1 in closure #1 in HeadphoneDataProvider.init()(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v11 = a1;
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  outlined init with copy of Any(a1, (uint64_t)v8);
  type metadata accessor for HeadphoneDevice();
  if (swift_dynamicCast()) {
    unsigned int v5 = v7;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v5)
  {
    swift_retain();
    type metadata accessor for ReplayAudioAccessoryDevice();
    uint64_t v3 = (void *)(*(uint64_t (**)(void))((*v5 & *MEMORY[0x263F8EED0]) + 0x210))();
    id v4 = ReplayAudioAccessoryDevice.__allocating_init(withCBDevice:)(v3);
    a2();

    swift_release();
  }
}

uint64_t closure #1 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v71 = a1;
  uint64_t v72 = a2;
  uint64_t v80 = a3;
  unint64_t v81 = a4;
  uint64_t v78 = 0;
  uint64_t v65 = partial apply for implicit closure #1 in closure #1 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler();
  uint64_t v66 = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_1;
  uint64_t v67 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v68 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v69 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v70 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  uint64_t v94 = 0;
  uint64_t v95 = 0;
  uint64_t v85 = 0;
  uint64_t v73 = type metadata accessor for Logger();
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v75 = v73 - 8;
  unint64_t v76 = (*(void *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v72);
  uint64_t v77 = (char *)&v27 - v76;
  uint64_t v96 = v4;
  uint64_t v97 = v5;
  uint64_t v94 = v6;
  uint64_t v95 = v7;
  type metadata accessor for JSONDecoder();
  uint64_t v79 = JSONDecoder.__allocating_init()();
  uint64_t v82 = type metadata accessor for ReplayData();
  lazy protocol witness table accessor for type ReplayData and conformance ReplayData();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  swift_release();
  uint64_t v63 = v93;
  uint64_t v64 = v83;
  uint64_t v61 = v83;
  uint64_t v62 = v93;
  if (v93)
  {
    uint64_t v60 = v62;
    uint64_t v38 = v62;
    uint64_t v85 = v62;
    swift_bridgeObjectRetain();
    uint64_t v39 = v71;
    uint64_t v40 = v72;
    uint64_t v41 = v38;
  }
  else
  {
    uint64_t v8 = v77;
    uint64_t v9 = Logger.shared.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v8, v9, v73);
    outlined copy of Data._Representation(v80, v81);
    uint64_t v48 = 32;
    uint64_t v49 = 7;
    uint64_t v10 = swift_allocObject();
    unint64_t v11 = v81;
    uint64_t v42 = v10;
    *(void *)(v10 + 16) = v80;
    *(void *)(v10 + 24) = v11;
    swift_retain();
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v42;
    uint64_t v50 = v12;
    *(void *)(v12 + 16) = v65;
    *(void *)(v12 + 24) = v13;
    swift_release();
    id v58 = Logger.logObject.getter();
    int v59 = static os_log_type_t.error.getter();
    uint64_t v45 = &v91;
    uint64_t v91 = 12;
    unint64_t v43 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v44 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v46 = v92;
    uint64_t v47 = 17;
    uint64_t v52 = swift_allocObject();
    *(unsigned char *)(v52 + 16) = 32;
    uint64_t v53 = swift_allocObject();
    *(unsigned char *)(v53 + 16) = 8;
    uint64_t v14 = swift_allocObject();
    uint64_t v15 = v50;
    uint64_t v51 = v14;
    *(void *)(v14 + 16) = v66;
    *(void *)(v14 + 24) = v15;
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = v51;
    uint64_t v55 = v16;
    *(void *)(v16 + 16) = v67;
    *(void *)(v16 + 24) = v17;
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v54 = _allocateUninitializedArray<A>(_:)();
    uint64_t v56 = v18;
    swift_retain();
    uint64_t v19 = v52;
    uint64_t v20 = v56;
    *uint64_t v56 = v68;
    v20[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v19;
    swift_retain();
    uint64_t v21 = v53;
    uint64_t v22 = v56;
    v56[2] = v69;
    v22[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v21;
    swift_retain();
    uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v55;
    uint64_t v24 = v56;
    v56[4] = v70;
    v24[5] = v23;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v58, (os_log_type_t)v59))
    {
      uint64_t v25 = v61;
      uint64_t v31 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v32 = createStorage<A>(capacity:type:)(0);
      uint64_t v33 = createStorage<A>(capacity:type:)(1);
      uint64_t v34 = &v90;
      uint64_t v90 = v31;
      uint64_t v35 = &v89;
      uint64_t v89 = v32;
      v36 = &v88;
      uint64_t v88 = v33;
      serialize(_:at:)(2, &v90);
      serialize(_:at:)(1, v34);
      uint64_t v86 = v68;
      uint64_t v87 = v52;
      closure #1 in osLogInternal(_:log:type:)(&v86, (uint64_t)v34, (uint64_t)v35, (uint64_t)v36);
      uint64_t v37 = v25;
      if (v25)
      {
        __break(1u);
      }
      else
      {
        uint64_t v86 = v69;
        uint64_t v87 = v53;
        closure #1 in osLogInternal(_:log:type:)(&v86, (uint64_t)&v90, (uint64_t)&v89, (uint64_t)&v88);
        uint64_t v29 = 0;
        uint64_t v86 = v70;
        uint64_t v87 = v55;
        closure #1 in osLogInternal(_:log:type:)(&v86, (uint64_t)&v90, (uint64_t)&v89, (uint64_t)&v88);
        _os_log_impl(&dword_250C36000, v58, (os_log_type_t)v59, "HeadphoneManager-Replay: could not decode from JSONDecoder %s!", v31, v46);
        destroyStorage<A>(_:count:)(v32, 0, v30);
        destroyStorage<A>(_:count:)(v33, 1, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x253386220](v31, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v28 = 0;

    (*(void (**)(char *, uint64_t))(v74 + 8))(v77, v73);
    uint64_t v39 = v28;
    uint64_t v40 = v28;
    uint64_t v41 = v28;
  }
  return v39;
}

uint64_t implicit closure #1 in closure #1 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  outlined copy of Data._Representation(a1, a2);
  uint64_t result = a1;
  *a3 = a1;
  a3[1] = a2;
  return result;
}

uint64_t thunk for @callee_guaranteed (@guaranteed String, @guaranteed Data) -> (@owned (String, ReplayData)?)@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void, void, void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(*a1, a1[1], a1[2], a1[3]);
  *a3 = result;
  a3[1] = v4;
  a3[2] = v5;
  return result;
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed Data) -> (@owned (String, ReplayData)?)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return thunk for @callee_guaranteed (@guaranteed String, @guaranteed Data) -> (@owned (String, ReplayData)?)(a1, *(uint64_t (**)(void, void, void, void))(v2 + 16), a2);
}

void closure #2 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void (*a6)(void), uint64_t a7)
{
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  id v41 = a5;
  uint64_t v42 = a6;
  uint64_t v43 = a7;
  uint64_t v56 = 0;
  uint64_t v54 = 0;
  uint64_t v47 = 0;
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  uint64_t v61 = a3;
  uint64_t v60 = a4;
  int v59 = a5;
  uint64_t v57 = a6;
  uint64_t v58 = a7;
  uint64_t v44 = (*(uint64_t (**)(void))(*(void *)a3 + 184))();
  if ((v7 & 1) == 0)
  {
    uint64_t v36 = v44;
    uint64_t v56 = v44;
    uint64_t v55 = v44;
    uint64_t v8 = String.init<A>(_:)();
    uint64_t v34 = v9;
    uint64_t v35 = (void *)(*(uint64_t (**)(uint64_t))((*v40 & *MEMORY[0x263F8EED0]) + 0x160))(v8);
    swift_bridgeObjectRelease();
    if (v35)
    {
      uint64_t v33 = v35;
      uint64_t v24 = v35;
      uint64_t v54 = v35;
      swift_retain();
      CBDevice.replayDevice.setter(v39);
      swift_bridgeObjectRetain();
      v51[3] = MEMORY[0x263F8D310];
      v51[0] = v37;
      v51[1] = v38;
      uint64_t v28 = MEMORY[0x263F8D310];
      uint64_t v10 = __swift_project_boxed_opaque_existential_0(v51, MEMORY[0x263F8D310]);
      uint64_t v26 = *(void *)(v28 - 8);
      uint64_t v27 = v28 - 8;
      uint64_t v11 = *(void *)(v26 + 64);
      uint64_t v30 = &v13;
      unint64_t v25 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](&v13, v10);
      uint64_t v29 = (char *)&v13 - v25;
      (*(void (**)(void))(v26 + 16))();
      uint64_t v31 = _bridgeAnythingToObjectiveC<A>(_:)();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v28);
      id v32 = objc_msgSend(v41, sel___swift_objectForKeyedSubscript_, v31);
      swift_unknownObjectRelease();
      if (v32)
      {
        id v23 = v32;
        id v22 = v32;
        uint64_t v21 = &v45;
        _bridgeAnyObjectToAny(_:)();
        outlined init with take of Any((uint64_t)v21, (uint64_t)&v48);
        swift_unknownObjectRelease();
      }
      else
      {
        long long v48 = 0uLL;
        uint64_t v49 = 0;
        uint64_t v50 = 0;
      }
      outlined init with take of Any?(&v48, &v52);
      if (v53)
      {
        type metadata accessor for HeadphoneReplayDevice();
        if (swift_dynamicCast()) {
          uint64_t v18 = v46;
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v17 = v18;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v51);
        uint64_t v20 = v17;
      }
      else
      {
        uint64_t v19 = 0;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v51);
        outlined destroy of Any?((uint64_t)&v52);
        uint64_t v20 = v19;
      }
      uint64_t v16 = v20;
      if (v20)
      {
        uint64_t v15 = v16;
        id v14 = v16;
        uint64_t v47 = v16;
        (*(void (**)(void *))((*v16 & *MEMORY[0x263F8EED0]) + 0xB98))(v39);
      }
      swift_retain();
      type metadata accessor for ReplayAudioAccessoryDevice();
      id v12 = v24;
      id v13 = ReplayAudioAccessoryDevice.__allocating_init(withCBDevice:)(v24);
      v42();

      swift_release();
    }
  }
}

void partial apply for closure #2 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()(uint64_t a1, uint64_t a2, void *a3)
{
  closure #2 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void (**)(void))(v3 + 32), *(void *)(v3 + 40));
}

uint64_t thunk for @callee_guaranteed (@guaranteed String, @guaranteed ReplayData) -> ()(void *a1, uint64_t (*a2)(void, void, void))
{
  return a2(*a1, a1[1], a1[2]);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed ReplayData) -> ()(void *a1)
{
  return thunk for @callee_guaranteed (@guaranteed String, @guaranteed ReplayData) -> ()(a1, *(uint64_t (**)(void, void, void))(v1 + 16));
}

uint64_t HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v194 = a1;
  uint64_t v195 = a2;
  uint64_t v186 = a3;
  uint64_t v187 = a4;
  uint64_t v188 = 0;
  uint64_t v168 = partial apply for implicit closure #2 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:);
  uint64_t v169 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  uint64_t v170 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v171 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v172 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v173 = partial apply for implicit closure #1 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:);
  uint64_t v174 = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_7;
  uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_7;
  v176 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_7;
  uint64_t v235 = 0;
  uint64_t v236 = 0;
  uint64_t v233 = 0;
  uint64_t v234 = 0;
  uint64_t v232 = 0;
  v178 = 0;
  uint64_t v223 = 0;
  uint64_t v224 = 0;
  uint64_t v221 = 0;
  unint64_t v222 = 0;
  uint64_t v220 = 0;
  uint64_t v213 = 0;
  unint64_t v214 = 0;
  uint64_t v202 = 0;
  uint64_t v179 = type metadata accessor for Logger();
  uint64_t v180 = *(void *)(v179 - 8);
  uint64_t v181 = v179 - 8;
  unint64_t v182 = (*(void *)(v180 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](0, v5);
  uint32_t v183 = (char *)&v54 - v182;
  unint64_t v184 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6, (char *)&v54 - v182);
  uint64_t v185 = (char *)&v54 - v184;
  uint64_t v189 = type metadata accessor for URL();
  uint64_t v190 = *(void *)(v189 - 8);
  uint64_t v191 = v189 - 8;
  unint64_t v192 = (*(void *)(v190 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v188, v195);
  uint64_t v193 = (char *)&v54 - v192;
  uint64_t v235 = v8;
  uint64_t v236 = v9;
  uint64_t v233 = v10;
  uint64_t v234 = v11;
  uint64_t v232 = v4;
  type metadata accessor for NSBundle();
  swift_getObjectType();
  id v199 = @nonobjc NSBundle.__allocating_init(for:)();
  swift_bridgeObjectRetain();
  id v198 = (id)MEMORY[0x253385EB0](v194, v195);
  swift_bridgeObjectRelease();
  Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("data", 4uLL, 1);
  object = v12._object;
  id v197 = (id)MEMORY[0x253385EB0](v12._countAndFlagsBits);
  swift_bridgeObjectRelease();
  id v200 = objc_msgSend(v199, sel_pathForResource_ofType_, v198, v197);

  if (v200)
  {
    id v167 = v200;
    id v162 = v200;
    uint64_t v163 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v164 = v13;

    uint64_t v165 = v163;
    uint64_t v166 = v164;
  }
  else
  {
    uint64_t v165 = 0;
    uint64_t v166 = 0;
  }
  uint64_t v160 = v166;
  uint64_t v161 = v165;
  if (v166)
  {
    uint64_t v158 = v161;
    uint64_t v159 = v160;
    id v14 = v178;
    uint64_t v152 = v160;
    uint64_t v223 = v161;
    uint64_t v224 = v160;
    URL.init(fileURLWithPath:)();
    default argument 1 of Data.init(contentsOf:options:)();
    uint64_t v15 = Data.init(contentsOf:options:)();
    uint64_t v153 = v14;
    uint64_t v154 = v15;
    unint64_t v155 = v16;
    int v156 = v14;
    if (v14)
    {
      id v56 = v156;
      uint64_t v57 = 0;
      unint64_t v58 = 0xF000000000000000;
      int v59 = 0;
      (*(void (**)(char *, uint64_t))(v190 + 8))(v193, v189);

      uint64_t v149 = v57;
      unint64_t v150 = v58;
      uint32_t v151 = v59;
    }
    else
    {
      unint64_t v148 = v155;
      uint64_t v147 = v154;
      (*(void (**)(char *, uint64_t))(v190 + 8))(v193, v189);
      uint64_t v149 = v147;
      unint64_t v150 = v148;
      uint32_t v151 = v153;
    }
    v144 = v151;
    unint64_t v145 = v150;
    uint64_t v146 = v149;
    if ((v150 & 0xF000000000000000) == 0xF000000000000000)
    {
      swift_bridgeObjectRelease();
      uint64_t v157 = v144;
    }
    else
    {
      uint64_t v142 = v146;
      unint64_t v143 = v145;
      unint64_t v137 = v145;
      uint64_t v138 = v146;
      uint64_t v221 = v146;
      unint64_t v222 = v145;
      id v139 = self;
      outlined copy of Data._Representation(v138, v137);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(v138, v137);
      id v141 = objc_msgSend(v139, sel_unarchiveObjectWithData_, isa);

      if (v141)
      {
        id v136 = v141;
        id v135 = v141;
        uint64_t v134 = v201;
        _bridgeAnyObjectToAny(_:)();
        outlined init with take of Any((uint64_t)v134, (uint64_t)&v215);
        swift_unknownObjectRelease();
      }
      else
      {
        long long v215 = 0uLL;
        uint64_t v216 = 0;
        uint64_t v217 = 0;
      }
      outlined init with take of Any?(&v215, &v218);
      if (v219)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
        if (swift_dynamicCast()) {
          uint64_t v133 = v201[4];
        }
        else {
          uint64_t v133 = 0;
        }
        uint64_t v132 = v133;
      }
      else
      {
        uint64_t v87 = 0;
        outlined destroy of Any?((uint64_t)&v218);
        uint64_t v132 = v87;
      }
      uint64_t v131 = v132;
      if (v132)
      {
        uint64_t v130 = v131;
        uint64_t v17 = v144;
        uint64_t v220 = v131;
        swift_bridgeObjectRetain();
        uint64_t v121 = Data.init(hexString:)();
        unint64_t v122 = v18;
        uint64_t v213 = v121;
        unint64_t v214 = v18;
        Swift::String v19 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("btAd", 4uLL, 1);
        uint64_t v125 = &v212;
        Swift::String v212 = v19;
        v123 = &v211;
        _convertToAnyHashable<A>(_:)();
        outlined copy of Data._Representation(v121, v122);
        uint64_t v124 = v210;
        v210[3] = MEMORY[0x263F06F78];
        v210[0] = v121;
        v210[1] = v122;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
        Dictionary.subscript.setter();
        outlined destroy of String();
        type metadata accessor for CBDevice();
        uint64_t v126 = v220;
        swift_bridgeObjectRetain();
        id v20 = CBDevice.__allocating_init(dictionary:)();
        uint64_t v127 = v17;
        uint64_t v128 = (uint64_t)v20;
        id v129 = v17;
        if (v17)
        {
          uint64_t v54 = 0;
          uint64_t v55 = 0;

          uint64_t v119 = v54;
          uint64_t v120 = v55;
        }
        else
        {
          uint64_t v119 = v128;
          uint64_t v120 = v127;
        }
        uint64_t v117 = v120;
        uint64_t v118 = v119;
        if (v119)
        {
          uint64_t v116 = v118;
          uint64_t v114 = v118;
          uint64_t v202 = v118;
          outlined consume of Data._Representation(v121, v122);
          outlined destroy of [AnyHashable : Any]();
          outlined consume of Data._Representation(v138, v137);
          swift_bridgeObjectRelease();
          return v114;
        }
        else
        {
          uint64_t v21 = v185;
          uint64_t v22 = Logger.shared.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v180 + 16))(v21, v22, v179);
          swift_bridgeObjectRetain();
          uint64_t v102 = 32;
          uint64_t v103 = 7;
          uint64_t v23 = swift_allocObject();
          uint64_t v24 = v195;
          uint64_t v104 = v23;
          *(void *)(v23 + 16) = v194;
          *(void *)(v23 + 24) = v24;
          uint64_t v112 = Logger.logObject.getter();
          int v113 = static os_log_type_t.error.getter();
          v99 = &v208;
          uint64_t v208 = 12;
          unint64_t v97 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v98 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v100 = v209;
          uint64_t v101 = 17;
          uint64_t v106 = swift_allocObject();
          *(unsigned char *)(v106 + 16) = 32;
          uint64_t v107 = swift_allocObject();
          *(unsigned char *)(v107 + 16) = 8;
          uint64_t v25 = swift_allocObject();
          uint64_t v26 = v104;
          uint64_t v105 = v25;
          *(void *)(v25 + 16) = v168;
          *(void *)(v25 + 24) = v26;
          uint64_t v27 = swift_allocObject();
          uint64_t v28 = v105;
          uint64_t v109 = v27;
          *(void *)(v27 + 16) = v169;
          *(void *)(v27 + 24) = v28;
          uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v108 = _allocateUninitializedArray<A>(_:)();
          v110 = v29;
          swift_retain();
          uint64_t v30 = v106;
          uint64_t v31 = v110;
          uint64_t *v110 = v170;
          v31[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v30;
          swift_retain();
          uint64_t v32 = v107;
          uint64_t v33 = v110;
          v110[2] = v171;
          v33[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v32;
          swift_retain();
          uint64_t v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v109;
          uint64_t v35 = v110;
          v110[4] = v172;
          v35[5] = v34;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v112, (os_log_type_t)v113))
          {
            uint64_t v36 = v117;
            uint64_t v90 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v91 = createStorage<A>(capacity:type:)(0);
            uint64_t v92 = createStorage<A>(capacity:type:)(1);
            uint64_t v93 = &v207;
            uint64_t v207 = v90;
            uint64_t v94 = &v206;
            uint64_t v206 = v91;
            uint64_t v95 = &v205;
            uint64_t v205 = v92;
            serialize(_:at:)(2, &v207);
            serialize(_:at:)(1, v93);
            uint64_t v203 = v170;
            uint64_t v204 = v106;
            closure #1 in osLogInternal(_:log:type:)(&v203, (uint64_t)v93, (uint64_t)v94, (uint64_t)v95);
            uint64_t v96 = v36;
            if (v36)
            {
              __break(1u);
            }
            else
            {
              uint64_t v203 = v171;
              uint64_t v204 = v107;
              closure #1 in osLogInternal(_:log:type:)(&v203, (uint64_t)&v207, (uint64_t)&v206, (uint64_t)&v205);
              uint64_t v88 = 0;
              uint64_t v203 = v172;
              uint64_t v204 = v109;
              closure #1 in osLogInternal(_:log:type:)(&v203, (uint64_t)&v207, (uint64_t)&v206, (uint64_t)&v205);
              _os_log_impl(&dword_250C36000, v112, (os_log_type_t)v113, "HeadphoneManager-Replay: could not inflate %s!", v90, v100);
              destroyStorage<A>(_:count:)(v91, 0, v89);
              destroyStorage<A>(_:count:)(v92, 1, MEMORY[0x263F8EE58] + 8);
              MEMORY[0x253386220](v90, MEMORY[0x263F8E778]);
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(char *, uint64_t))(v180 + 8))(v185, v179);
          outlined consume of Data._Representation(v121, v122);
          outlined destroy of [AnyHashable : Any]();
          outlined consume of Data._Representation(v138, v137);
          swift_bridgeObjectRelease();
          return v188;
        }
      }
      outlined consume of Data._Representation(v138, v137);
      swift_bridgeObjectRelease();
      uint64_t v157 = v144;
    }
  }
  else
  {
    uint64_t v157 = v178;
  }
  uint64_t v37 = v183;
  uint64_t v69 = v157;
  uint64_t v38 = Logger.shared.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v180 + 16))(v37, v38, v179);
  swift_bridgeObjectRetain();
  uint64_t v75 = 32;
  uint64_t v76 = 7;
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v195;
  uint64_t v77 = v39;
  *(void *)(v39 + 16) = v194;
  *(void *)(v39 + 24) = v40;
  uint64_t v85 = Logger.logObject.getter();
  int v86 = static os_log_type_t.error.getter();
  uint64_t v72 = &v230;
  uint64_t v230 = 12;
  unint64_t v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v73 = v231;
  uint64_t v74 = 17;
  uint64_t v79 = swift_allocObject();
  *(unsigned char *)(v79 + 16) = 32;
  uint64_t v80 = swift_allocObject();
  *(unsigned char *)(v80 + 16) = 8;
  uint64_t v41 = swift_allocObject();
  uint64_t v42 = v77;
  uint64_t v78 = v41;
  *(void *)(v41 + 16) = v173;
  *(void *)(v41 + 24) = v42;
  uint64_t v43 = swift_allocObject();
  uint64_t v44 = v78;
  uint64_t v82 = v43;
  *(void *)(v43 + 16) = v174;
  *(void *)(v43 + 24) = v44;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v81 = _allocateUninitializedArray<A>(_:)();
  uint64_t v83 = v45;
  swift_retain();
  uint64_t v46 = v79;
  uint64_t v47 = v83;
  void *v83 = v175;
  v47[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v46;
  swift_retain();
  uint64_t v48 = v80;
  uint64_t v49 = v83;
  v83[2] = v176;
  v49[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v48;
  swift_retain();
  uint64_t v50 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v82;
  uint64_t v51 = v83;
  v83[4] = v177;
  v51[5] = v50;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v85, (os_log_type_t)v86))
  {
    long long v52 = v69;
    uint64_t v62 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v63 = createStorage<A>(capacity:type:)(0);
    uint64_t v64 = createStorage<A>(capacity:type:)(1);
    uint64_t v65 = &v229;
    uint64_t v229 = v62;
    uint64_t v66 = &v228;
    uint64_t v228 = v63;
    uint64_t v67 = &v227;
    uint64_t v227 = v64;
    serialize(_:at:)(2, &v229);
    serialize(_:at:)(1, v65);
    uint64_t v225 = v175;
    uint64_t v226 = v79;
    closure #1 in osLogInternal(_:log:type:)(&v225, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67);
    uint64_t v68 = v52;
    if (v52)
    {
      __break(1u);
    }
    else
    {
      uint64_t v225 = v176;
      uint64_t v226 = v80;
      closure #1 in osLogInternal(_:log:type:)(&v225, (uint64_t)&v229, (uint64_t)&v228, (uint64_t)&v227);
      uint64_t v60 = 0;
      uint64_t v225 = v177;
      uint64_t v226 = v82;
      closure #1 in osLogInternal(_:log:type:)(&v225, (uint64_t)&v229, (uint64_t)&v228, (uint64_t)&v227);
      _os_log_impl(&dword_250C36000, v85, (os_log_type_t)v86, "HeadphoneManager-Replay: could not unarchive %s!", v62, v73);
      destroyStorage<A>(_:count:)(v63, 0, v61);
      destroyStorage<A>(_:count:)(v64, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x253386220](v62, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  (*(void (**)(char *, uint64_t))(v180 + 8))(v183, v179);
  return v188;
}

unint64_t type metadata accessor for NSBundle()
{
  uint64_t v2 = lazy cache variable for type metadata for NSBundle;
  if (!lazy cache variable for type metadata for NSBundle)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSBundle);
    return ObjCClassMetadata;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)()
{
}

id @nonobjc NSBundle.__allocating_init(for:)()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
  return v0;
}

uint64_t sub_250D0A9F4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)();
  return result;
}

uint64_t default argument 1 of Data.init(contentsOf:options:)()
{
  return 0;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)()
{
}

id CBDevice.__allocating_init(dictionary:)()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = @nonobjc CBDevice.init(dictionary:)();
  if (v3) {
    return (id)v2;
  }
  else {
    return v4;
  }
}

id HeadphoneDataProvider.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc CBDevice.init(dictionary:)()
{
  v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  id v5 = objc_msgSend(v3, sel_initWithDictionary_error_, v4.super.isa, v6);
  id v0 = 0;

  if (v5)
  {

    swift_bridgeObjectRelease();
    return v5;
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRelease();
    return (id)v2;
  }
}

uint64_t sub_250D0ADC0()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_7(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_250D0ADF4()
{
  return swift_deallocObject();
}

uint64_t sub_250D0AE28()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_7()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_250D0AE74()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_7(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_250D0AEC0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in HeadphoneDataProvider.readCBDeviceFromData(_:hexAddressString:)();
  return result;
}

uint64_t sub_250D0AF0C()
{
  return swift_deallocObject();
}

uint64_t sub_250D0AF40()
{
  return swift_deallocObject();
}

uint64_t sub_250D0AF74()
{
  return swift_deallocObject();
}

uint64_t sub_250D0AFC0()
{
  return swift_deallocObject();
}

id *outlined destroy of DefaultsObserver??(id *a1)
{
  if (*a1 != (id)1) {

  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of Set<AnyCancellable>()
{
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t _swift_stdlib_has_malloc_size_7()
{
  return 1;
}

size_t _swift_stdlib_malloc_size_7(const void *a1)
{
  return malloc_size(a1);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

uint64_t sub_250D0B1DC()
{
  outlined consume of Data._Representation(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()@<X0>(uint64_t *a1@<X8>)
{
  return implicit closure #1 in closure #1 in HeadphoneDataProvider.provideDeviceForDiscoveryHandler()(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_250D0B22C()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_1()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  unint64_t v1 = lazy protocol witness table accessor for type Data and conformance Data();
  uint64_t v2 = MEMORY[0x263F06F78];
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v4, v2, v1);
}

uint64_t sub_250D0B33C()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B370()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B3A4()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B3F0()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B43C()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B47C()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B4A8()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B4D4()
{
  return swift_deallocObject();
}

uint64_t sub_250D0B514()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in HeadphoneDataProvider.init()(uint64_t a1)
{
  closure #1 in closure #1 in HeadphoneDataProvider.init()(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type [Any] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Any] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Any] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Any]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Any] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Any]()
{
}

uint64_t one-time initialization function for none()
{
  return SetAlgebra.init<A>(_:)();
}

unint64_t lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet()
{
  uint64_t v2 = lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet;
  if (!lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet;
  if (!lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet;
  if (!lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet;
  if (!lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet;
  if (!lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type FeatureOptionSet and conformance FeatureOptionSet);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [FeatureOptionSet] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [FeatureOptionSet] and conformance [A];
  if (!lazy protocol witness table cache variable for type [FeatureOptionSet] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [FeatureOptionSet]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [FeatureOptionSet] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void *FeatureOptionSet.none.unsafeMutableAddressor()
{
  if (one-time initialization token for none != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.none;
}

uint64_t static FeatureOptionSet.none.getter()
{
  return *(unsigned int *)FeatureOptionSet.none.unsafeMutableAddressor();
}

uint64_t one-time initialization function for rename()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(1);
  static FeatureOptionSet.rename = result;
  return result;
}

int *FeatureOptionSet.rename.unsafeMutableAddressor()
{
  if (one-time initialization token for rename != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.rename;
}

uint64_t static FeatureOptionSet.rename.getter()
{
  return *FeatureOptionSet.rename.unsafeMutableAddressor();
}

uint64_t one-time initialization function for doubleTap()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(2);
  static FeatureOptionSet.doubleTap = result;
  return result;
}

int *FeatureOptionSet.doubleTap.unsafeMutableAddressor()
{
  if (one-time initialization token for doubleTap != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.doubleTap;
}

uint64_t static FeatureOptionSet.doubleTap.getter()
{
  return *FeatureOptionSet.doubleTap.unsafeMutableAddressor();
}

uint64_t one-time initialization function for doubleTapEnhanced()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(4);
  static FeatureOptionSet.doubleTapEnhanced = result;
  return result;
}

int *FeatureOptionSet.doubleTapEnhanced.unsafeMutableAddressor()
{
  if (one-time initialization token for doubleTapEnhanced != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.doubleTapEnhanced;
}

uint64_t static FeatureOptionSet.doubleTapEnhanced.getter()
{
  return *FeatureOptionSet.doubleTapEnhanced.unsafeMutableAddressor();
}

uint64_t one-time initialization function for inEarDetection()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(8);
  static FeatureOptionSet.inEarDetection = result;
  return result;
}

int *FeatureOptionSet.inEarDetection.unsafeMutableAddressor()
{
  if (one-time initialization token for inEarDetection != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.inEarDetection;
}

uint64_t static FeatureOptionSet.inEarDetection.getter()
{
  return *FeatureOptionSet.inEarDetection.unsafeMutableAddressor();
}

uint64_t one-time initialization function for mic()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(16);
  static FeatureOptionSet.mic = result;
  return result;
}

int *FeatureOptionSet.mic.unsafeMutableAddressor()
{
  if (one-time initialization token for mic != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.mic;
}

uint64_t static FeatureOptionSet.mic.getter()
{
  return *FeatureOptionSet.mic.unsafeMutableAddressor();
}

uint64_t one-time initialization function for headDetection()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(32);
  static FeatureOptionSet.headDetection = result;
  return result;
}

int *FeatureOptionSet.headDetection.unsafeMutableAddressor()
{
  if (one-time initialization token for headDetection != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.headDetection;
}

uint64_t static FeatureOptionSet.headDetection.getter()
{
  return *FeatureOptionSet.headDetection.unsafeMutableAddressor();
}

uint64_t one-time initialization function for transparency()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(256);
  static FeatureOptionSet.transparency = result;
  return result;
}

int *FeatureOptionSet.transparency.unsafeMutableAddressor()
{
  if (one-time initialization token for transparency != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.transparency;
}

uint64_t static FeatureOptionSet.transparency.getter()
{
  return *FeatureOptionSet.transparency.unsafeMutableAddressor();
}

uint64_t one-time initialization function for anc()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(512);
  static FeatureOptionSet.anc = result;
  return result;
}

int *FeatureOptionSet.anc.unsafeMutableAddressor()
{
  if (one-time initialization token for anc != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.anc;
}

uint64_t static FeatureOptionSet.anc.getter()
{
  return *FeatureOptionSet.anc.unsafeMutableAddressor();
}

uint64_t one-time initialization function for untethered()
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(1024);
  static FeatureOptionSet.untethered = result;
  return result;
}

int *FeatureOptionSet.untethered.unsafeMutableAddressor()
{
  if (one-time initialization token for untethered != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.untethered;
}

uint64_t static FeatureOptionSet.untethered.getter()
{
  return *FeatureOptionSet.untethered.unsafeMutableAddressor();
}

uint64_t one-time initialization function for all()
{
  _allocateUninitializedArray<A>(_:)();
  uint64_t v2 = v0;
  *uint64_t v0 = *FeatureOptionSet.rename.unsafeMutableAddressor();
  v2[1] = *FeatureOptionSet.doubleTap.unsafeMutableAddressor();
  v2[2] = *FeatureOptionSet.doubleTapEnhanced.unsafeMutableAddressor();
  v2[3] = *FeatureOptionSet.inEarDetection.unsafeMutableAddressor();
  v2[4] = *FeatureOptionSet.mic.unsafeMutableAddressor();
  v2[5] = *FeatureOptionSet.headDetection.unsafeMutableAddressor();
  v2[6] = *FeatureOptionSet.transparency.unsafeMutableAddressor();
  v2[7] = *FeatureOptionSet.anc.unsafeMutableAddressor();
  v2[8] = *FeatureOptionSet.untethered.unsafeMutableAddressor();
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
  return SetAlgebra<>.init(arrayLiteral:)();
}

void *FeatureOptionSet.all.unsafeMutableAddressor()
{
  if (one-time initialization token for all != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.all;
}

uint64_t static FeatureOptionSet.all.getter()
{
  return *(unsigned int *)FeatureOptionSet.all.unsafeMutableAddressor();
}

uint64_t one-time initialization function for Replay_B698()
{
  _allocateUninitializedArray<A>(_:)();
  uint64_t v2 = v0;
  *uint64_t v0 = *FeatureOptionSet.rename.unsafeMutableAddressor();
  v2[1] = *FeatureOptionSet.inEarDetection.unsafeMutableAddressor();
  v2[2] = *FeatureOptionSet.mic.unsafeMutableAddressor();
  v2[3] = *FeatureOptionSet.transparency.unsafeMutableAddressor();
  v2[4] = *FeatureOptionSet.untethered.unsafeMutableAddressor();
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
  return SetAlgebra<>.init(arrayLiteral:)();
}

void *FeatureOptionSet.Replay_B698.unsafeMutableAddressor()
{
  if (one-time initialization token for Replay_B698 != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.Replay_B698;
}

uint64_t static FeatureOptionSet.Replay_B698.getter()
{
  return *(unsigned int *)FeatureOptionSet.Replay_B698.unsafeMutableAddressor();
}

uint64_t one-time initialization function for Replay_Beats_B607()
{
  _allocateUninitializedArray<A>(_:)();
  uint64_t v2 = v0;
  *uint64_t v0 = *FeatureOptionSet.rename.unsafeMutableAddressor();
  v2[1] = *FeatureOptionSet.inEarDetection.unsafeMutableAddressor();
  v2[2] = *FeatureOptionSet.mic.unsafeMutableAddressor();
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
  return SetAlgebra<>.init(arrayLiteral:)();
}

void *FeatureOptionSet.Replay_Beats_B607.unsafeMutableAddressor()
{
  if (one-time initialization token for Replay_Beats_B607 != -1) {
    swift_once();
  }
  return &static FeatureOptionSet.Replay_Beats_B607;
}

uint64_t static FeatureOptionSet.Replay_Beats_B607.getter()
{
  return *(unsigned int *)FeatureOptionSet.Replay_Beats_B607.unsafeMutableAddressor();
}

uint64_t protocol witness for OptionSet.init(rawValue:) in conformance FeatureOptionSet@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SetAlgebra.init() in conformance FeatureOptionSet()
{
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance FeatureOptionSet()
{
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance FeatureOptionSet()
{
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance FeatureOptionSet()
{
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance FeatureOptionSet()
{
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance FeatureOptionSet()
{
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance FeatureOptionSet()
{
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance FeatureOptionSet()
{
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance FeatureOptionSet()
{
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance FeatureOptionSet()
{
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance FeatureOptionSet()
{
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance FeatureOptionSet()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance FeatureOptionSet()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance FeatureOptionSet()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance FeatureOptionSet()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance FeatureOptionSet()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance FeatureOptionSet()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance FeatureOptionSet()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance FeatureOptionSet@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = FeatureOptionSet.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance FeatureOptionSet@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = FeatureOptionSet.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance FeatureOptionSet()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance FeatureOptionSet()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

uint64_t variable initialization expression of HeadphoneReplayDevice.replayDevice()
{
  return 0;
}

uint64_t HeadphoneReplayDevice.replayDevice.getter()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_replayDevice);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t HeadphoneReplayDevice.replayDevice.setter(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_replayDevice);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*HeadphoneReplayDevice.replayDevice.modify())()
{
  return HeadphoneReplayDevice.replayDevice.modify;
}

uint64_t HeadphoneReplayDevice.replayDevice.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of HeadphoneReplayDevice.listeners()
{
  return Array.init()();
}

uint64_t HeadphoneReplayDevice.listeners.getter()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_listeners);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t HeadphoneReplayDevice.listeners.setter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_listeners);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*HeadphoneReplayDevice.listeners.modify())()
{
  return HeadphoneReplayDevice.listeners.modify;
}

uint64_t HeadphoneReplayDevice.listeners.modify()
{
  return swift_endAccess();
}

void *HeadphoneReplayDevice.__allocating_init(cbDevice:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return HeadphoneReplayDevice.init(cbDevice:)(a1);
}

void *HeadphoneReplayDevice.init(cbDevice:)(void *a1)
{
  id v2 = v1;
  uint64_t v3 = v1;
  *(void *)&v1[OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_replayDevice] = 0;

  uint64_t v8 = OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_listeners;
  type metadata accessor for AnyCancellable();
  *(void *)&v1[v8] = Array.init()();

  id v4 = a1;
  Swift::String v12 = HeadphoneDevice.init(cbDevice:)(a1);
  uint64_t v5 = v12;
  uint64_t v6 = v12;
  uint64_t v10 = CBDevice.replayDevice.getter();
  uint64_t v9 = (void *)((char *)v12 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_replayDevice);
  swift_beginAccess();
  *uint64_t v9 = v10;
  swift_release();
  swift_endAccess();

  return v12;
}

uint64_t HeadphoneReplayDevice.name.getter()
{
  uint64_t v15 = v0;
  uint64_t v12 = HeadphoneReplayDevice.replayDevice.getter();
  if (v12)
  {
    uint64_t v1 = v12;
    swift_retain();
    outlined destroy of ReplayData?();
    uint64_t v7 = (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 400))(&v12);
    uint64_t v8 = v2;
    swift_release();
    uint64_t v9 = v7;
    uint64_t v10 = v8;
  }
  else
  {
    outlined destroy of ReplayData?();
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  id v3 = v11;
  if (v10)
  {
    uint64_t v13 = v9;
    uint64_t v14 = v10;
  }
  else
  {
    id v4 = v11;
    uint64_t v13 = HeadphoneDevice.name.getter();
    uint64_t v14 = v5;

    outlined destroy of String?();
  }

  return v13;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of ReplayData?()
{
}

void HeadphoneReplayDevice.name.setter()
{
  id v1 = v0;
  HeadphoneDevice.name.setter();
}

void (*HeadphoneReplayDevice.name.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[2] = v1;
  *a1 = HeadphoneReplayDevice.name.getter();
  a1[1] = v2;
  return HeadphoneReplayDevice.name.modify;
}

void HeadphoneReplayDevice.name.modify(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    HeadphoneReplayDevice.name.setter();
    outlined destroy of String();
  }
  else
  {
    HeadphoneReplayDevice.name.setter();
  }
}

uint64_t HeadphoneReplayDevice.accessorySettingFeatureBitMask.getter()
{
  id v3 = (id)(*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x228))();
  objc_msgSend(v3, sel_productID);

  type metadata accessor for CBProductID();
  lazy protocol witness table accessor for type CBProductID and conformance CBProductID();
  if (== infix<A>(_:_:)()) {
    return *(unsigned int *)FeatureOptionSet.Replay_B698.unsafeMutableAddressor();
  }
  else {
    return *(unsigned int *)FeatureOptionSet.Replay_Beats_B607.unsafeMutableAddressor();
  }
}

void HeadphoneReplayDevice.accessorySettingFeatureBitMask.setter(int a1)
{
  id v2 = v1;
  HeadphoneDevice.accessorySettingFeatureBitMask.setter(a1);
}

void (*HeadphoneReplayDevice.accessorySettingFeatureBitMask.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = HeadphoneReplayDevice.accessorySettingFeatureBitMask.getter();
  return HeadphoneReplayDevice.accessorySettingFeatureBitMask.modify;
}

void HeadphoneReplayDevice.accessorySettingFeatureBitMask.modify(uint64_t a1)
{
}

uint64_t HeadphoneReplayDevice.deviceColor.getter()
{
  uint64_t v13 = v0;
  uint64_t v11 = HeadphoneReplayDevice.replayDevice.getter();
  if (v11)
  {
    uint64_t v1 = v11;
    swift_retain();
    outlined destroy of ReplayData?();
    uint64_t v2 = (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 424))(&v11);
    unsigned int v7 = v2;
    char v6 = BYTE4(v2);
    swift_release();
    unsigned int v8 = v7;
    char v9 = v6;
  }
  else
  {
    outlined destroy of ReplayData?();
    unsigned int v8 = 0;
    char v9 = 1;
  }
  id v3 = v10;
  if (v9)
  {
    id v4 = v10;
    unsigned int v12 = HeadphoneDevice.deviceColor.getter();
  }
  else
  {
    unsigned int v12 = v8;
  }

  return v12;
}

void HeadphoneReplayDevice.deviceColor.setter(int a1)
{
  id v2 = v1;
  HeadphoneDevice.deviceColor.setter(a1);
}

void (*HeadphoneReplayDevice.deviceColor.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(_DWORD *)(a1 + 8) = HeadphoneReplayDevice.deviceColor.getter();
  return HeadphoneReplayDevice.deviceColor.modify;
}

void HeadphoneReplayDevice.deviceColor.modify(uint64_t a1)
{
}

id HeadphoneReplayDevice.productInfo.getter()
{
  id v1 = v0;
  id v4 = HeadphoneDevice.productInfo.getter();

  return v4;
}

void HeadphoneReplayDevice.productInfo.setter(void *a1)
{
  id v2 = v1;
  HeadphoneDevice.productInfo.setter(a1);
}

void (*HeadphoneReplayDevice.productInfo.modify(id *a1))(id *a1, char a2)
{
  a1[1] = v1;
  *a1 = HeadphoneReplayDevice.productInfo.getter();
  return HeadphoneReplayDevice.productInfo.modify;
}

void HeadphoneReplayDevice.productInfo.modify(id *a1, char a2)
{
  if (a2)
  {
    id v3 = *a1;
    id v2 = *a1;
    HeadphoneReplayDevice.productInfo.setter(v3);
  }
  else
  {
    HeadphoneReplayDevice.productInfo.setter(*a1);
  }
}

float HeadphoneReplayDevice.batteryLevelMain.getter()
{
  uint64_t v13 = v0;
  uint64_t v11 = HeadphoneReplayDevice.replayDevice.getter();
  if (v11)
  {
    uint64_t v1 = v11;
    swift_retain();
    outlined destroy of ReplayData?();
    uint64_t v2 = (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 376))(&v11);
    float v7 = *(float *)&v2;
    char v6 = BYTE4(v2);
    swift_release();
    float v8 = v7;
    char v9 = v6;
  }
  else
  {
    outlined destroy of ReplayData?();
    float v8 = 0.0;
    char v9 = 1;
  }
  id v3 = v10;
  if (v9)
  {
    id v4 = v10;
    float v12 = HeadphoneDevice.batteryLevelMain.getter();
  }
  else
  {
    float v12 = v8;
  }

  return v12;
}

void HeadphoneReplayDevice.batteryLevelMain.setter()
{
  id v1 = v0;
  HeadphoneDevice.batteryLevelMain.setter();
}

void (*HeadphoneReplayDevice.batteryLevelMain.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(float *)(a1 + 8) = HeadphoneReplayDevice.batteryLevelMain.getter();
  return HeadphoneReplayDevice.batteryLevelMain.modify;
}

void HeadphoneReplayDevice.batteryLevelMain.modify()
{
}

float HeadphoneReplayDevice.batteryLevelCase.getter()
{
  uint64_t v13 = v0;
  uint64_t v11 = HeadphoneReplayDevice.replayDevice.getter();
  if (v11)
  {
    uint64_t v1 = v11;
    swift_retain();
    outlined destroy of ReplayData?();
    uint64_t v2 = (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 304))(&v11);
    float v7 = *(float *)&v2;
    char v6 = BYTE4(v2);
    swift_release();
    float v8 = v7;
    char v9 = v6;
  }
  else
  {
    outlined destroy of ReplayData?();
    float v8 = 0.0;
    char v9 = 1;
  }
  id v3 = v10;
  if (v9)
  {
    id v4 = v10;
    float v12 = HeadphoneDevice.batteryLevelCase.getter();
  }
  else
  {
    float v12 = v8;
  }

  return v12;
}

void HeadphoneReplayDevice.batteryLevelCase.setter()
{
  id v1 = v0;
  HeadphoneDevice.batteryLevelCase.setter();
}

void (*HeadphoneReplayDevice.batteryLevelCase.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(float *)(a1 + 8) = HeadphoneReplayDevice.batteryLevelCase.getter();
  return HeadphoneReplayDevice.batteryLevelCase.modify;
}

void HeadphoneReplayDevice.batteryLevelCase.modify()
{
}

float HeadphoneReplayDevice.batteryLevelLeft.getter()
{
  uint64_t v13 = v0;
  uint64_t v11 = HeadphoneReplayDevice.replayDevice.getter();
  if (v11)
  {
    uint64_t v1 = v11;
    swift_retain();
    outlined destroy of ReplayData?();
    uint64_t v2 = (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 328))(&v11);
    float v7 = *(float *)&v2;
    char v6 = BYTE4(v2);
    swift_release();
    float v8 = v7;
    char v9 = v6;
  }
  else
  {
    outlined destroy of ReplayData?();
    float v8 = 0.0;
    char v9 = 1;
  }
  id v3 = v10;
  if (v9)
  {
    id v4 = v10;
    float v12 = HeadphoneDevice.batteryLevelLeft.getter();
  }
  else
  {
    float v12 = v8;
  }

  return v12;
}

void HeadphoneReplayDevice.batteryLevelLeft.setter()
{
  id v1 = v0;
  HeadphoneDevice.batteryLevelLeft.setter();
}

void (*HeadphoneReplayDevice.batteryLevelLeft.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(float *)(a1 + 8) = HeadphoneReplayDevice.batteryLevelLeft.getter();
  return HeadphoneReplayDevice.batteryLevelLeft.modify;
}

void HeadphoneReplayDevice.batteryLevelLeft.modify()
{
}

float HeadphoneReplayDevice.batteryLevelRight.getter()
{
  uint64_t v13 = v0;
  uint64_t v11 = HeadphoneReplayDevice.replayDevice.getter();
  if (v11)
  {
    uint64_t v1 = v11;
    swift_retain();
    outlined destroy of ReplayData?();
    uint64_t v2 = (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 352))(&v11);
    float v7 = *(float *)&v2;
    char v6 = BYTE4(v2);
    swift_release();
    float v8 = v7;
    char v9 = v6;
  }
  else
  {
    outlined destroy of ReplayData?();
    float v8 = 0.0;
    char v9 = 1;
  }
  id v3 = v10;
  if (v9)
  {
    id v4 = v10;
    float v12 = HeadphoneDevice.batteryLevelRight.getter();
  }
  else
  {
    float v12 = v8;
  }

  return v12;
}

void HeadphoneReplayDevice.batteryLevelRight.setter()
{
  id v1 = v0;
  HeadphoneDevice.batteryLevelRight.setter();
}

void (*HeadphoneReplayDevice.batteryLevelRight.modify(uint64_t a1))()
{
  *(void *)a1 = v1;
  *(float *)(a1 + 8) = HeadphoneReplayDevice.batteryLevelRight.getter();
  return HeadphoneReplayDevice.batteryLevelRight.modify;
}

void HeadphoneReplayDevice.batteryLevelRight.modify()
{
}

Swift::Void __swiftcall HeadphoneReplayDevice.captureCBDeviceData()()
{
  Builtin::Word v99 = 0;
  uint64_t v79 = _s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcXEfU_TA_1;
  uint64_t v80 = "Fatal error";
  uint64_t v81 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  uint64_t v82 = "HeadphoneManager/HeadphoneReplayDevice.swift";
  uint64_t v142 = *MEMORY[0x263EF8340];
  id v136 = 0;
  uint64_t v135 = 0;
  uint64_t v134 = 0;
  uint64_t v130 = 0;
  uint64_t v83 = 0;
  uint64_t v137 = 0;
  unint64_t v138 = 0;
  uint64_t v84 = type metadata accessor for Logger();
  uint64_t v85 = *(void *)(v84 - 8);
  uint64_t v86 = v84 - 8;
  unint64_t v87 = (*(void *)(v85 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1);
  uint64_t v88 = (char *)&v35 - v87;
  uint64_t v113 = type metadata accessor for URL();
  v110 = *(void **)(v113 - 8);
  uint64_t v111 = v113 - 8;
  unint64_t v89 = (v110[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v113, v2);
  uint64_t v106 = (char *)&v35 - v89;
  unint64_t v90 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v35 - v89, v4);
  uint64_t v112 = (char *)&v35 - v90;
  id v136 = (char *)&v35 - v90;
  uint64_t v135 = v0;
  id v91 = objc_msgSend(self, sel_defaultManager);
  uint64_t v109 = 1;
  id v92 = objc_msgSend(v91, sel_URLsForDirectory_inDomains_, 9);

  uint64_t v93 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v134 = v93;

  Array.subscript.getter();
  uint64_t v5 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  uint64_t v102 = &v132;
  uint64_t v132 = v5;
  uint64_t v133 = v6;
  unint64_t v98 = "";
  int v100 = 1;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", v99, 1);
  object = v7._object;
  DefaultStringInterpolation.appendLiteral(_:)(v7);
  float v8 = v122;
  swift_bridgeObjectRelease();
  char v9 = v8;
  uint64_t v10 = *v8;
  uint64_t v121 = (void *)MEMORY[0x263F8EED0];
  id v95 = (id)(*(uint64_t (**)(uint64_t *))((v10 & *MEMORY[0x263F8EED0]) + 0x210))(v9);

  unsigned int v96 = objc_msgSend(v95, sel_productID);
  unint64_t v97 = &v131;
  unsigned int v131 = v96;
  type metadata accessor for CBProductID();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v98, v99, v100 & 1);
  uint64_t v101 = v11._object;
  DefaultStringInterpolation.appendLiteral(_:)(v11);
  swift_bridgeObjectRelease();
  uint64_t v104 = v132;
  uint64_t v103 = v133;
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  String.init(stringInterpolation:)();
  uint64_t v105 = v12;
  URL.appendingPathComponent(_:)();
  uint64_t v13 = v122;
  swift_bridgeObjectRelease();
  uint64_t v107 = (void (*)(char *, uint64_t))v110[1];
  uint64_t v108 = v110 + 1;
  v107(v106, v113);
  uint64_t v116 = specialized _allocateUninitializedArray<A>(_:)();
  v14[3] = v113;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  uint64_t v114 = (void (*)(uint64_t *, char *, uint64_t))v110[2];
  uint64_t v115 = v110 + 2;
  v114(boxed_opaque_existential_0, v112, v113);
  uint64_t v16 = v116;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v120 = v16;
  uint64_t v117 = default argument 1 of print(_:separator:terminator:)();
  uint64_t v119 = v17;
  default argument 2 of print(_:separator:terminator:)();
  uint64_t v118 = v18;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::String v19 = v13;
  id v123 = (id)(*(uint64_t (**)(uint64_t *))((*v13 & *v121) + 0x210))(v19);

  id v124 = objc_msgSend(v123, sel_dictionaryRepresentation);
  if (v124)
  {
    uint64_t v78 = v124;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  id v76 = v78;
  uint64_t v130 = v78;
  id v141 = 0;
  id v74 = self;
  id v20 = v76;
  id v129 = v141;
  id v77 = objc_msgSend(v74, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v76, 0, &v129);
  id v75 = v129;
  id v21 = v129;
  uint64_t v22 = v141;
  id v141 = v75;

  swift_unknownObjectRelease();
  if (v77)
  {
    id v73 = v77;
    uint64_t v23 = v83;
    id v64 = v77;
    uint64_t v70 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v71 = v24;
    uint64_t v137 = v70;
    unint64_t v138 = v24;

    uint64_t v65 = specialized _allocateUninitializedArray<A>(_:)();
    v25[3] = v113;
    uint64_t v26 = __swift_allocate_boxed_opaque_existential_0(v25);
    v114(v26, v112, v113);
    uint64_t v27 = v65;
    _finalizeUninitializedArray<A>(_:)();
    uint64_t v69 = v27;
    uint64_t v66 = default argument 1 of print(_:separator:terminator:)();
    uint64_t v68 = v28;
    default argument 2 of print(_:separator:terminator:)();
    uint64_t v67 = v29;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    default argument 1 of Data.write(to:options:)();
    Data.write(to:options:)();
    uint64_t v72 = v23;
    if (!v23)
    {
      outlined consume of Data._Representation(v70, v71);

      v107(v112, v113);
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v35 = v72;
    uint64_t v36 = 0;
    outlined consume of Data._Representation(v70, v71);

    v107(v112, v113);
    swift_bridgeObjectRelease();
    uint64_t v54 = v35;
    uint64_t v53 = v36;
  }
  else
  {
    id v37 = v141;
    uint64_t v38 = _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v39 = 0;

    v107(v112, v113);
    swift_bridgeObjectRelease();
    uint64_t v54 = (void *)v38;
    uint64_t v53 = v39;
  }
  uint64_t v30 = v88;
  uint64_t v55 = v53;
  id v56 = v54;
  uint64_t v31 = Logger.shared.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v30, v31, v84);
  uint64_t v62 = Logger.logObject.getter();
  int v61 = static os_log_type_t.default.getter();
  int v59 = &v127;
  uint64_t v127 = 2;
  unint64_t v57 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v58 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v60 = v128;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v63 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v62, (os_log_type_t)v61))
  {
    uint64_t v32 = v55;
    uint64_t v43 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v42 = 0;
    uint64_t v44 = createStorage<A>(capacity:type:)(0);
    uint64_t v45 = createStorage<A>(capacity:type:)(v42);
    uint64_t v49 = &v126;
    uint64_t v126 = v43;
    uint64_t v50 = &v140;
    uint64_t v140 = v44;
    uint64_t v47 = &v139;
    uint64_t v139 = v45;
    unsigned int v46 = 0;
    serialize(_:at:)(0, &v126);
    serialize(_:at:)(v46, v49);
    uint64_t v125 = v63;
    uint64_t v48 = &v144;
    MEMORY[0x270FA5388](&v144, v33);
    uint64_t v51 = var20;
    var20[2] = v49;
    var20[3] = v50;
    var20[4] = v34;
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v32)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_250C36000, v62, (os_log_type_t)v61, "HeadphoneManager-Replay: capture device data failed!", v43, v60);
      uint64_t v40 = 0;
      destroyStorage<A>(_:count:)(v44, 0, v41);
      destroyStorage<A>(_:count:)(v45, v40, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x253386220](v43, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v85 + 8))(v88, v84);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *result)
{
  uint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    uint64_t result = v2;
    *uint64_t v3 = v1;
  }
  return result;
}

uint64_t default argument 1 of print(_:separator:terminator:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" ", 1uLL, 1)._countAndFlagsBits;
}

uint64_t default argument 2 of print(_:separator:terminator:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n", 1uLL, 1)._countAndFlagsBits;
}

uint64_t default argument 1 of Data.write(to:options:)()
{
  return 0;
}

uint64_t HeadphoneReplayDevice.updateReplayData(_:)(uint64_t a1)
{
  return HeadphoneReplayDevice.replayDevice.setter(a1);
}

Swift::Bool __swiftcall HeadphoneReplayDevice.isServiceSupported(_:)(Swift::UInt32 a1)
{
  return 1;
}

uint64_t HeadphoneReplayDevice.__ivar_destroyer()
{
  outlined destroy of ReplayData?();
  uint64_t result = v0 + OBJC_IVAR____TtC16HeadphoneManager21HeadphoneReplayDevice_listeners;
  outlined destroy of [AnyCancellable]();
  return result;
}

id HeadphoneReplayDevice.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneReplayDevice();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcXEfU_TA_1(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [AnyCancellable]()
{
}

uint64_t type metadata accessor for HeadphoneReplayDevice()
{
  uint64_t v1 = type metadata singleton initialization cache for HeadphoneReplayDevice;
  if (!type metadata singleton initialization cache for HeadphoneReplayDevice) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t base witness table accessor for RawRepresentable in FeatureOptionSet()
{
  return lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
}

unint64_t base witness table accessor for SetAlgebra in FeatureOptionSet()
{
  return lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
}

unint64_t base witness table accessor for Equatable in FeatureOptionSet()
{
  return lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in FeatureOptionSet()
{
  return lazy protocol witness table accessor for type FeatureOptionSet and conformance FeatureOptionSet();
}

ValueMetadata *type metadata accessor for FeatureOptionSet()
{
  return &type metadata for FeatureOptionSet;
}

uint64_t ObjC metadata update function for HeadphoneReplayDevice()
{
  return type metadata accessor for HeadphoneReplayDevice();
}

uint64_t type metadata completion function for HeadphoneReplayDevice()
{
  uint64_t updated = swift_updateClassMetadata2();
  if (!updated) {
    return 0;
  }
  return updated;
}

uint64_t Binding._optional<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v34 = a1;
  uint64_t v36 = partial apply for closure #1 in Binding._optional<A>();
  id v37 = partial apply for closure #2 in Binding._optional<A>();
  id v56 = 0;
  uint64_t v55 = 0;
  uint64_t v38 = *(void *)(a1 - 8);
  uint64_t v39 = v38;
  uint64_t v40 = *(void *)(v38 + 64);
  unint64_t v41 = (v40 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v42 = (char *)&v24 - v41;
  uint64_t v44 = *(void *)(v4 + 16);
  unint64_t v43 = (*(void *)(*(void *)(v44 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v4, (char *)&v24 - v41);
  uint64_t v53 = (uint64_t)&v24 - v43;
  uint64_t v54 = *(void *)(v44 + 16);
  uint64_t v57 = v54;
  uint64_t v51 = *(void *)(v54 - 8);
  uint64_t v52 = v54 - 8;
  uint64_t v45 = v51;
  uint64_t v47 = *(void *)(v51 + 64);
  unint64_t v46 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5, v6);
  uint64_t v48 = (char *)&v24 - v46;
  unint64_t v49 = (v47 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v7, (char *)&v24 - v46);
  uint64_t v50 = (char *)&v24 - v49;
  id v56 = (char *)&v24 - v49;
  uint64_t v55 = v3;
  MEMORY[0x253385C80](v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v53, 1, v54) == 1)
  {
    outlined destroy of A1?(v53, v54);
    uint64_t v23 = type metadata accessor for Binding();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v33, 1);
  }
  else
  {
    uint64_t v24 = v45;
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 32);
    uint64_t v26 = v51 + 32;
    v27(v50, v53, v54);
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v48, v50, v54);
    unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    uint64_t v28 = 7;
    char v9 = (void *)swift_allocObject();
    unint64_t v10 = v25;
    Swift::String v11 = v48;
    uint64_t v12 = (void (*)(char *, char *))v27;
    uint64_t v13 = v54;
    uint64_t v30 = v9;
    uint64_t v32 = 0;
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v13;
    v12((char *)v9 + v10, v11);
    outlined init with copy of Binding<A1?>(v35, v42, v54, v44, v34);
    unint64_t v29 = (*(unsigned __int8 *)(v39 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    uint64_t v14 = swift_allocObject();
    unint64_t v15 = v29;
    uint64_t v16 = v44;
    uint64_t v17 = v34;
    uint64_t v18 = v54;
    Swift::String v19 = (char *)v14;
    id v20 = v42;
    uint64_t v31 = v19;
    *((void *)v19 + 2) = 0;
    *((void *)v19 + 3) = 0;
    *((void *)v19 + 4) = v18;
    outlined init with take of Binding<A1?>(v20, &v19[v15], v18, v16, v17);
    Binding.init(get:set:)();
    uint64_t v21 = type metadata accessor for Binding();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v21 - 8) + 56))(v33, 0, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v50, v54);
  }
}

uint64_t outlined destroy of A1?(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, a2);
  }
  return a1;
}

uint64_t closure #1 in Binding._optional<A>()@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 - 8) + 16))(a2);
}

uint64_t sub_250D0FDC4()
{
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in Binding._optional<A>()@<X0>(uint64_t a1@<X8>)
{
  return closure #1 in Binding._optional<A>()(*(void *)(v1 + 32), a1);
}

uint64_t closure #2 in Binding._optional<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = a1;
  uint64_t v14 = a5;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  uint64_t v20 = a5;
  uint64_t v15 = 0;
  uint64_t v16 = type metadata accessor for Optional();
  unint64_t v11 = (*(void *)(*(void *)(v16 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v16, v10);
  uint64_t v17 = (char *)&v9 - v11;
  uint64_t v19 = v6;
  uint64_t v18 = a4;
  uint64_t v12 = *(void *)(v7 - 8);
  uint64_t v13 = v7 - 8;
  (*(void (**)(void))(v12 + 16))();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v14);
  type metadata accessor for Binding();
  return Binding.wrappedValue.setter();
}

char *outlined init with copy of Binding<A1?>(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *(void *)a1;
  swift_retain();
  *(void *)a2 = v7;
  uint64_t v10 = *((void *)a1 + 1);
  swift_retain();
  *((void *)a2 + 1) = v10;
  uint64_t v13 = *(int *)(a5 + 32);
  uint64_t v14 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(&a1[v13], 1))
  {
    memcpy(&a2[v13], &a1[v13], *(void *)(*(void *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v14 + 16))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(&a2[v13], 0, 1, a3);
  }
  return a2;
}

uint64_t sub_250D101D4()
{
  uint64_t v6 = *(void *)(v0 + 32);
  type metadata accessor for Optional();
  uint64_t v5 = type metadata accessor for Binding();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v4 = (v1 + 40) & ~v1;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v7 = *(int *)(v5 + 32);
  uint64_t v8 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v8 + 48))(v0 + v4 + v7, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3 + v4 + v7, v6);
  }
  return swift_deallocObject();
}

char *outlined init with take of Binding<A1?>(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)a2 = *(void *)a1;
  *((void *)a2 + 1) = *((void *)a1 + 1);
  uint64_t v10 = *(int *)(a5 + 32);
  uint64_t v11 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(&a1[v10], 1))
  {
    memcpy(&a2[v10], &a1[v10], *(void *)(*(void *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 32))();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(&a2[v10], 0, 1, a3);
  }
  return a2;
}

uint64_t partial apply for closure #2 in Binding._optional<A>()(uint64_t a1)
{
  uint64_t v7 = v1[4];
  type metadata accessor for Optional();
  uint64_t v2 = type metadata accessor for Binding();
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (uint64_t)v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  return closure #2 in Binding._optional<A>()(a1, v3, v4, v5, v7);
}

uint64_t HeadphonePropertyWrapperPublisher.didSet.getter(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v13 = 0;
  uint64_t v11 = &protocol conformance descriptor for HeadphonePropertyWrapperPublisher<A>;
  uint64_t v20 = MEMORY[0x263EFDCB0];
  uint64_t v27 = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSRunLoop.SchedulerOptions?);
  unint64_t v10 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v19 = (uint64_t)&v9 - v10;
  unint64_t v16 = type metadata accessor for NSRunLoop();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v18 = lazy protocol witness table accessor for type NSRunLoop and conformance NSRunLoop();
  uint64_t v28 = v15;
  unint64_t v29 = v16;
  uint64_t v30 = WitnessTable;
  unint64_t v31 = v18;
  uint64_t v23 = type metadata accessor for Publishers.ReceiveOn();
  uint64_t v21 = *(void *)(v23 - 8);
  uint64_t v22 = v23 - 8;
  unint64_t v12 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v15, v4);
  uint64_t v24 = (char *)&v9 - v12;
  uint64_t v27 = *v1;
  v26[2] = *(id *)(v5 + 16);
  v26[1] = v27;
  id v6 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v14 = v26;
  v26[0] = v6;
  uint64_t v7 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v19, 1);
  Publisher.receive<A>(on:options:)();
  outlined destroy of NSRunLoop.SchedulerOptions?(v19);

  swift_getWitnessTable();
  uint64_t v25 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v23);
  return v25;
}

unint64_t type metadata accessor for NSRunLoop()
{
  uint64_t v2 = lazy cache variable for type metadata for NSRunLoop;
  if (!lazy cache variable for type metadata for NSRunLoop)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRunLoop);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type NSRunLoop and conformance NSRunLoop()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSRunLoop and conformance NSRunLoop;
  if (!lazy protocol witness table cache variable for type NSRunLoop and conformance NSRunLoop)
  {
    type metadata accessor for NSRunLoop();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRunLoop and conformance NSRunLoop);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined destroy of NSRunLoop.SchedulerOptions?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for NSRunLoop.SchedulerOptions();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t Published.Publisher.didSet.getter(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v11 = 0;
  v9[1] = MEMORY[0x263EFDE50];
  uint64_t v18 = MEMORY[0x263EFDCB0];
  uint64_t v25 = 0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSRunLoop.SchedulerOptions?);
  v9[0] = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v17 = (uint64_t)v9 - v9[0];
  unint64_t v14 = type metadata accessor for NSRunLoop();
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v16 = lazy protocol witness table accessor for type NSRunLoop and conformance NSRunLoop();
  uint64_t v26 = v13;
  unint64_t v27 = v14;
  uint64_t v28 = WitnessTable;
  unint64_t v29 = v16;
  uint64_t v21 = type metadata accessor for Publishers.ReceiveOn();
  uint64_t v19 = *(void *)(v21 - 8);
  uint64_t v20 = v21 - 8;
  unint64_t v10 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v13, v4);
  uint64_t v22 = (char *)v9 - v10;
  uint64_t v25 = v1;
  v24[1] = *(id *)(v5 + 16);
  id v6 = objc_msgSend(self, sel_mainRunLoop);
  unint64_t v12 = v24;
  v24[0] = v6;
  uint64_t v7 = type metadata accessor for NSRunLoop.SchedulerOptions();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v17, 1);
  Publisher.receive<A>(on:options:)();
  outlined destroy of NSRunLoop.SchedulerOptions?(v17);

  swift_getWitnessTable();
  uint64_t v23 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v21);
  return v23;
}

uint64_t HMMultiState.description.getter(char a1)
{
  type metadata accessor for HMMultiState();
  switch(a1)
  {
    case 0:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Don't know", 0xAuLL, 1)._countAndFlagsBits;
    case 1:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("YES", 3uLL, 1)._countAndFlagsBits;
    case 2:
      return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("NO", 2uLL, 1)._countAndFlagsBits;
  }
  _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return v2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance HMMultiState()
{
  return HMMultiState.description.getter(*v0);
}

uint64_t HeadphonePropertyWrapperPublisher.receive<A>(subscriber:)()
{
  return swift_release();
}

uint64_t HeadphonePropertyWrapperPublisher.subject.getter()
{
  uint64_t v2 = *v0;
  swift_retain();
  return v2;
}

void *HeadphonePropertyWrapperPublisher.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v11 = a3;
  uint64_t v9 = a1;
  uint64_t v14 = a2;
  uint64_t v15 = v17;
  v17[0] = 0;
  uint64_t v16 = 0;
  v17[1] = a2;
  uint64_t v12 = *(void *)(a2 - 8);
  uint64_t v13 = a2 - 8;
  unint64_t v7 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = (char *)&v7 - v7;
  uint64_t v16 = MEMORY[0x270FA5388](a1, a2);
  type metadata accessor for CurrentValueSubject();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v8, v9, v14);
  uint64_t v10 = CurrentValueSubject.__allocating_init(_:)();
  swift_retain();
  uint64_t v3 = v9;
  uint64_t v4 = v12;
  uint64_t v5 = v14;
  v17[0] = v10;
  *uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t result = v15;
  outlined destroy of HeadphonePropertyWrapperPublisher<A>();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of HeadphonePropertyWrapperPublisher<A>()
{
}

uint64_t protocol witness for Publisher.receive<A>(subscriber:) in conformance HeadphonePropertyWrapperPublisher<A>()
{
  return HeadphonePropertyWrapperPublisher.receive<A>(subscriber:)();
}

uint64_t RawRepresentable.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  uint64_t v26 = 0;
  uint64_t v27 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = AssociatedTypeWitness - 8;
  unint64_t v10 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](AssociatedTypeWitness, v3);
  uint64_t v16 = (char *)&v9 - v10;
  uint64_t v26 = v2;
  Builtin::Word v18 = 1;
  uint64_t v4 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  uint64_t v21 = &v24;
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  int v19 = 1;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(">>>> ", 5uLL, 1);
  object = v6._object;
  DefaultStringInterpolation.appendLiteral(_:)(v6);
  swift_bridgeObjectRelease();
  dispatch thunk of RawRepresentable.rawValue.getter();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, AssociatedTypeWitness);
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" ", v18, v19 & 1);
  uint64_t v20 = v7._object;
  DefaultStringInterpolation.appendLiteral(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v23 = v24;
  uint64_t v22 = v25;
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  return String.init(stringInterpolation:)();
}

uint64_t associated type witness table accessor for Publisher.Failure : Error in HeadphonePropertyWrapperPublisher<A>()
{
  return MEMORY[0x263F8E658];
}

uint64_t type metadata instantiation function for HeadphonePropertyWrapperPublisher()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for HeadphonePropertyWrapperPublisher()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.__allocating_init()()
{
  return MEMORY[0x270EEDE00]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x270EF0130](options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t Data.init(capacity:)()
{
  return MEMORY[0x270EF0258]();
}

uint64_t Data.init<A>(_:)()
{
  return MEMORY[0x270EF0290]();
}

uint64_t Data.subscript.getter()
{
  return MEMORY[0x270EF02A8]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t _convertBoolToObjCBool(_:)()
{
  return MEMORY[0x270FA1128]();
}

uint64_t _convertObjCBoolToBool(_:)()
{
  return MEMORY[0x270FA1138]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x270F28690]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t type metadata accessor for Publishers.ReceiveOn()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t AnyCancellable.store(in:)()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t dispatch thunk of ObservableObject.objectWillChange.getter()
{
  return MEMORY[0x270EE3C18]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t type metadata accessor for CurrentValueSubject()
{
  return MEMORY[0x270EE3CA8]();
}

uint64_t CurrentValueSubject.__allocating_init(_:)()
{
  return MEMORY[0x270EE3CB0]();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t Publisher.subscribe<A>(_:)()
{
  return MEMORY[0x270EE3FD0]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x270EE4008]();
}

uint64_t Image.init(systemName:)()
{
  return MEMORY[0x270F04650]();
}

uint64_t Binding.wrappedValue.getter()
{
  return MEMORY[0x270F04B30]();
}

uint64_t Binding.wrappedValue.setter()
{
  return MEMORY[0x270F04B48]();
}

uint64_t Binding.init(get:set:)()
{
  return MEMORY[0x270F04B80]();
}

uint64_t type metadata accessor for Binding()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x270FA0988]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t dispatch thunk of Log.debug(_:function:file:line:)()
{
  return MEMORY[0x270F5D100]();
}

uint64_t dispatch thunk of Log.error(_:function:file:line:)()
{
  return MEMORY[0x270F5D108]();
}

uint64_t dispatch thunk of Log.notice(_:function:file:line:)()
{
  return MEMORY[0x270F5D110]();
}

uint64_t static Log.shared.getter()
{
  return MEMORY[0x270F5D118]();
}

uint64_t type metadata accessor for Log()
{
  return MEMORY[0x270F5D120]();
}

uint64_t static HashFunction.hash<A>(data:)()
{
  return MEMORY[0x270EEAA88]();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t type metadata accessor for SHA256()
{
  return MEMORY[0x270EEB090]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t Set.init()()
{
  return MEMORY[0x270F9CFC8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.Keys.debugDescription.getter()
{
  return MEMORY[0x270F9D0C8]();
}

uint64_t Dictionary.keys.getter()
{
  return MEMORY[0x270F9D0F0]();
}

uint64_t Dictionary.Values.count.getter()
{
  return MEMORY[0x270F9D140]();
}

uint64_t Dictionary.values.getter()
{
  return MEMORY[0x270F9D160]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9D330](seed);
}

uint64_t Character.hexDigitValue.getter()
{
  return MEMORY[0x270F9D398]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

{
  return MEMORY[0x270F9D5F0]();
}

uint64_t String.description.getter()
{
  return MEMORY[0x270F9D618]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t static String.+ infix(_:_:)()
{
  return MEMORY[0x270F9D6D0]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x270F9D6D8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t static String.+= infix(_:_:)()
{
  return MEMORY[0x270F9D6F0]();
}

uint64_t String.utf8.getter()
{
  return MEMORY[0x270F9D710]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

{
  return MEMORY[0x270F9D8E8]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x270F9D938]();
}

uint64_t Sequence.reduce<A>(into:_:)()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DB98]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x270F9DFE8]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
}

uint64_t Collection.dropFirst(_:)()
{
  return MEMORY[0x270F9E190]();
}

uint64_t RangeReplaceableCollection.append(_:)()
{
  return MEMORY[0x270F9E290]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t OS_dispatch_group.notify(qos:flags:queue:execute:)()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
}

NSNumber __swiftcall NSNumber.init(floatLiteral:)(Swift::Double floatLiteral)
{
  return (NSNumber)MEMORY[0x270EF2170](floatLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x270EF2198](integerLiteral);
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return MEMORY[0x270EF2310]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x270F9E378]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x270F9E398]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _hashValue<A>(for:)()
{
  return MEMORY[0x270F9E898]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t assertionFailure(_:file:line:)()
{
  return MEMORY[0x270F9EDE0]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t _SwiftNewtypeWrapper<>.hashValue.getter()
{
  return MEMORY[0x270F9F198]();
}

uint64_t _SwiftNewtypeWrapper<>._rawHashValue(seed:)()
{
  return MEMORY[0x270F9F1A0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t _SwiftNewtypeWrapper<>.hash(into:)()
{
  return MEMORY[0x270F9F1B0]();
}

uint64_t static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270F9F1B8]();
}

uint64_t static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270F9F1C0]();
}

uint64_t static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270F9F1C8]();
}

uint64_t _SwiftNewtypeWrapper<>._bridgeToObjectiveC()()
{
  return MEMORY[0x270F9F1D0]();
}

uint64_t _convertToAnyHashable<A>(_:)()
{
  return MEMORY[0x270F9F228]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

{
  return MEMORY[0x270F9F278]();
}

{
  return MEMORY[0x270F9F288]();
}

{
  return MEMORY[0x270F9F290]();
}

{
  return MEMORY[0x270F9F2D8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3B8]();
}

{
  return MEMORY[0x270F9F3C8]();
}

{
  return MEMORY[0x270F9F3D0]();
}

{
  return MEMORY[0x270F9F410]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

{
  return MEMORY[0x270F9F778]();
}

{
  return MEMORY[0x270F9F780]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270F9F790]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t specialized _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270FA14F0]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x270F9F940]();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return MEMORY[0x270F9FA20]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t Hasher.combine<A>(_:)()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x270FA00B8]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x270FA0100]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x270FA0108]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x270FA0110]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x270FA0118]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x270F23FC0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x270FA01A8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x270FA04E0]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}