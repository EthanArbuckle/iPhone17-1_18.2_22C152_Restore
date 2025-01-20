uint64_t variable initialization expression of AudioUnitFactory.audioUnit()
{
  return 0;
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)(AudioComponentDescription with)
{
  UInt32 componentFlagsMask = with.componentFlagsMask;
  OSType componentManufacturer = with.componentManufacturer;
  OSType componentType = with.componentType;
  OSType componentSubType = with.componentSubType;
  UInt32 componentFlags = with.componentFlags;
  sub_1000038B8();
  id v16 = 0;
  v15[0] = componentType;
  v15[1] = componentSubType;
  v15[2] = componentManufacturer;
  v15[3] = componentFlags;
  v15[4] = componentFlagsMask;
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithComponentDescription:v15 error:&v16];
  id v8 = v16;
  if (v7)
  {
    uint64_t v9 = OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit;
    v10 = *(void **)(v1 + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit);
    *(void *)(v1 + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit) = v7;
    id v11 = v8;

    v13 = *(void **)(v1 + v9);
    if (v13) {
      return (AUAudioUnit)v13;
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v14 = v16;
    sub_1000038A8();

    return (AUAudioUnit)swift_willThrow();
  }
  return result;
}

id AudioUnitFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id AudioUnitFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_1000037A8(uint64_t a1, uint64_t a2, int a3)
{
  id v10 = 0;
  v8[0] = a1;
  v8[1] = a2;
  int v9 = a3;
  id v4 = [v3 initWithComponentDescription:v8 error:&v10];
  if (v4)
  {
    id v5 = v10;
  }
  else
  {
    id v6 = v10;
    sub_1000038A8();

    swift_willThrow();
  }
  return v4;
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return self;
}

uint64_t sub_100003898()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000038A8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000038B8()
{
  return type metadata accessor for MTMacinTalkAUSPAudioUnit();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}