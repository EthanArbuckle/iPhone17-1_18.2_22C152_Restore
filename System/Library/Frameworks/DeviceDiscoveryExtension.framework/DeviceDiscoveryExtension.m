__CFString *DDErrorCodeToString(uint64_t a1)
{
  __CFString *result;

  switch(a1)
  {
    case 350000:
      result = @"DDErrorCodeUnknown";
      break;
    case 350001:
      result = @"DDErrorCodeBadParameter";
      break;
    case 350002:
      result = @"DDErrorCodeUnsupported";
      break;
    case 350003:
      result = @"DDErrorCodeTimeout";
      break;
    case 350004:
      result = @"DDErrorCodeInternal";
      break;
    case 350005:
      result = @"DDErrorCodeMissingEntitlement";
      break;
    case 350006:
      result = @"DDErrorCodePermission";
      break;
    default:
      if (a1) {
        result = @"?";
      }
      else {
        result = @"DDErrorCodeSuccess";
      }
      break;
  }
  return result;
}

id DDErrorF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[1] = *MEMORY[0x263EF8340];
  v10 = [NSString stringWithUTF8String:a2];
  v11 = (void *)[[NSString alloc] initWithFormat:v10 arguments:&a9];
  id v12 = objc_alloc(MEMORY[0x263F087E8]);
  v16 = @"cuErrorMsg";
  v17[0] = v11;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = (void *)[v12 initWithDomain:@"DDErrorDomain" code:a1 userInfo:v13];

  return v14;
}

id DDNestedErrorF(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = [NSString stringWithUTF8String:a3];
  v13 = (void *)[[NSString alloc] initWithFormat:v12 arguments:&a9];
  id v14 = v11;
  id v15 = objc_alloc(MEMORY[0x263F087E8]);
  if (v14)
  {
    uint64_t v16 = *MEMORY[0x263F08608];
    v26[0] = @"cuErrorMsg";
    v26[1] = v16;
    v27[0] = v13;
    v27[1] = v14;
    v17 = NSDictionary;
    v18 = (void **)v27;
    v19 = (__CFString **)v26;
    uint64_t v20 = 2;
  }
  else
  {
    v24 = @"cuErrorMsg";
    v25 = v13;
    v17 = NSDictionary;
    v18 = &v25;
    v19 = &v24;
    uint64_t v20 = 1;
  }
  v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
  v22 = (void *)[v15 initWithDomain:@"DDErrorDomain" code:a2 userInfo:v21];

  return v22;
}

NSString *__cdecl DDEventTypeToString(DDEventType inValue)
{
  if (inValue > DDEventTypeDeviceFound)
  {
    if (inValue != DDEventTypeDeviceLost)
    {
      if (inValue == DDEventTypeDeviceChanged) {
        return (NSString *)@"DeviceChanged";
      }
      return (NSString *)@"?";
    }
    return (NSString *)@"DeviceLost";
  }
  else
  {
    if (inValue)
    {
      if (inValue == DDEventTypeDeviceFound) {
        return (NSString *)@"DeviceFound";
      }
      return (NSString *)@"?";
    }
    return (NSString *)@"Unknown";
  }
}

NSString *__cdecl DDDeviceProtocolToString(DDDeviceProtocol inValue)
{
  v1 = @"?";
  if (inValue == DDDeviceProtocolDIAL) {
    v1 = @"DIAL";
  }
  if (inValue) {
    return &v1->isa;
  }
  else {
    return (NSString *)@"Invalid";
  }
}

NSString *__cdecl DDDeviceCategoryToString(DDDeviceCategory inValue)
{
  if ((unint64_t)inValue > (DDDeviceCategoryLaptopComputer|DDDeviceCategoryTVWithMediaBox)) {
    return (NSString *)@"?";
  }
  else {
    return &off_264CB2970[inValue]->isa;
  }
}

NSString *__cdecl DDDeviceStateToString(DDDeviceState inValue)
{
  if (inValue <= 19)
  {
    if (inValue == DDDeviceStateInvalid) {
      return (NSString *)@"Invalid";
    }
    if (inValue == DDDeviceStateActivating) {
      return (NSString *)@"Activating";
    }
  }
  else
  {
    switch(inValue)
    {
      case DDDeviceStateActivated:
        return (NSString *)@"Activated";
      case DDDeviceStateAuthorized:
        return (NSString *)@"Authorized";
      case DDDeviceStateInvalidating:
        return (NSString *)@"Invalidating";
    }
  }
  return (NSString *)@"?";
}

NSString *__cdecl DDDeviceMediaPlaybackStateToString(DDDeviceMediaPlaybackState inValue)
{
  if ((unint64_t)inValue > DDDeviceMediaPlaybackStatePlaying) {
    return (NSString *)@"?";
  }
  else {
    return &off_264CB29A8[inValue]->isa;
  }
}

uint64_t DDDevice.networkEndpoint.getter@<X0>(uint64_t a1@<X8>)
{
  if (objc_msgSend(v1, sel_networkEndpoint))
  {
    return sub_236799E08();
  }
  else
  {
    uint64_t v4 = sub_236799DF8();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v5(a1, 1, 1, v4);
  }
}

uint64_t sub_236796B48@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  if (objc_msgSend(*a1, sel_networkEndpoint))
  {
    return sub_236799E08();
  }
  else
  {
    uint64_t v4 = sub_236799DF8();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
    return v5(a2, 1, 1, v4);
  }
}

uint64_t sub_236796BEC(uint64_t a1, void **a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268897748);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v14 - v7;
  sub_236797650(a1, (uint64_t)&v14 - v7, &qword_268897748);
  v9 = *a2;
  sub_236797650((uint64_t)v8, (uint64_t)v6, &qword_268897748);
  uint64_t v10 = sub_236799DF8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_2367976B4((uint64_t)v6, &qword_268897748);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = sub_236799DE8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  objc_msgSend(v9, sel_setNetworkEndpoint_, v12);
  swift_unknownObjectRelease();
  return sub_2367976B4((uint64_t)v8, &qword_268897748);
}

uint64_t DDDevice.networkEndpoint.setter(uint64_t a1)
{
  v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268897748);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236797650(a1, (uint64_t)v6, &qword_268897748);
  uint64_t v7 = sub_236799DF8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2367976B4((uint64_t)v6, &qword_268897748);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = sub_236799DE8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  objc_msgSend(v2, sel_setNetworkEndpoint_, v9);
  swift_unknownObjectRelease();
  return sub_2367976B4(a1, &qword_268897748);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void (*DDDevice.networkEndpoint.modify(void *a1))(uint64_t *a1, char a2)
{
  v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  size_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268897748) - 8) + 64);
  v4[1] = malloc(v5);
  v4[2] = malloc(v5);
  v4[3] = malloc(v5);
  v6 = malloc(v5);
  v4[4] = v6;
  if (objc_msgSend(v2, sel_networkEndpoint))
  {
    sub_236799E08();
  }
  else
  {
    uint64_t v7 = sub_236799DF8();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  }
  return sub_236797028;
}

void sub_236797028(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 16);
    sub_236797650(v3, v4, &qword_268897748);
    sub_236797650(v4, v5, &qword_268897748);
    uint64_t v6 = sub_236799DF8();
    uint64_t v7 = *(void *)(v6 - 8);
    int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    uint64_t v9 = *(void *)(v2 + 8);
    if (v8 == 1)
    {
      sub_2367976B4(*(void *)(v2 + 8), &qword_268897748);
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = sub_236799DE8();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
    }
    v18 = *(void **)(v2 + 24);
    v17 = *(void **)(v2 + 32);
    uint64_t v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v10);
    swift_unknownObjectRelease();
    sub_2367976B4((uint64_t)v19, &qword_268897748);
  }
  else
  {
    uint64_t v11 = *(void *)(v2 + 24);
    sub_236797650(v3, v11, &qword_268897748);
    uint64_t v12 = sub_236799DF8();
    uint64_t v13 = *(void *)(v12 - 8);
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    uint64_t v15 = *(void *)(v2 + 24);
    if (v14 == 1)
    {
      sub_2367976B4(*(void *)(v2 + 24), &qword_268897748);
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = sub_236799DE8();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
    }
    v18 = *(void **)(v2 + 24);
    v17 = *(void **)(v2 + 32);
    uint64_t v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v16);
    swift_unknownObjectRelease();
  }
  sub_2367976B4((uint64_t)v17, &qword_268897748);
  free(v17);
  free(v18);
  free(v19);
  free(v20);

  free((void *)v2);
}

uint64_t DDDevice.txtRecord.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_txtRecordData);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_236799D48();

    sub_236799E38();
    uint64_t v5 = sub_236799E28();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_236799E28();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t sub_236797358@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_txtRecordData);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_236799D48();

    sub_236799E38();
    uint64_t v5 = sub_236799E28();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_236799E28();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t sub_23679743C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268897750);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236797650(a1, (uint64_t)v4, &qword_268897750);
  return DDDevice.txtRecord.setter((uint64_t)v4);
}

uint64_t DDDevice.txtRecord.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268897750);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236797650(a1, (uint64_t)v6, &qword_268897750);
  uint64_t v7 = sub_236799E28();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2367976B4((uint64_t)v6, &qword_268897750);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_236799E18();
    unint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    uint64_t v9 = (void *)sub_236799D38();
    sub_236797710(v10, v12);
  }
  objc_msgSend(v2, sel_setTxtRecordData_, v9);

  return sub_2367976B4(a1, &qword_268897750);
}

uint64_t sub_236797650(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2367976B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236797710(uint64_t a1, unint64_t a2)
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

void (*DDDevice.txtRecord.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  size_t v5 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268897750) - 8) + 64);
  v4[1] = malloc(v5);
  v4[2] = malloc(v5);
  v4[3] = malloc(v5);
  uint64_t v6 = malloc(v5);
  v4[4] = v6;
  id v7 = objc_msgSend(v2, sel_txtRecordData);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_236799D48();

    sub_236799E38();
    uint64_t v9 = sub_236799E28();
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_236799E28();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  }
  return sub_2367978D0;
}

void sub_2367978D0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(v2 + 8);
    uint64_t v4 = *(void *)(v2 + 16);
    sub_236797650(v3, v4, &qword_268897750);
    sub_236797650(v4, v5, &qword_268897750);
    uint64_t v6 = sub_236799E28();
    uint64_t v7 = *(void *)(v6 - 8);
    int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    uint64_t v9 = *(void *)(v2 + 8);
    if (v8 == 1)
    {
      sub_2367976B4(*(void *)(v2 + 8), &qword_268897750);
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v17 = sub_236799E18();
      unint64_t v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v10 = (void *)sub_236799D38();
      sub_236797710(v17, v19);
    }
    v21 = *(void **)(v2 + 24);
    uint64_t v20 = *(void **)(v2 + 32);
    v23 = *(void **)(v2 + 8);
    v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v10);

    sub_2367976B4((uint64_t)v22, &qword_268897750);
  }
  else
  {
    uint64_t v11 = *(void *)(v2 + 24);
    sub_236797650(v3, v11, &qword_268897750);
    uint64_t v12 = sub_236799E28();
    uint64_t v13 = *(void *)(v12 - 8);
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    uint64_t v15 = *(void *)(v2 + 24);
    if (v14 == 1)
    {
      sub_2367976B4(*(void *)(v2 + 24), &qword_268897750);
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v24 = sub_236799E18();
      unint64_t v26 = v25;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
      uint64_t v16 = (void *)sub_236799D38();
      sub_236797710(v24, v26);
    }
    v21 = *(void **)(v2 + 24);
    uint64_t v20 = *(void **)(v2 + 32);
    v23 = *(void **)(v2 + 8);
    v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v16);
  }
  sub_2367976B4((uint64_t)v20, &qword_268897750);
  free(v20);
  free(v21);
  free(v22);
  free(v23);

  free((void *)v2);
}

uint64_t sub_236797B54()
{
  uint64_t v0 = sub_236799DD8();
  __swift_allocate_value_buffer(v0, qword_2688977B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2688977B8);
  return sub_236799DC8();
}

char *DDDiscoveryExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DDDiscoveryExtensionConfiguration();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, a1);
  uint64_t v8 = swift_allocObject();
  uint64_t result = DDDiscoveryExtensionConfiguration.init(discoveryExtension:)((uint64_t)v7);
  *a2 = v8;
  return result;
}

uint64_t type metadata accessor for DDDiscoveryExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t DDDiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  DDDiscoveryExtensionConfiguration.init(discoveryExtension:)(a1);
  return v2;
}

id sub_236797D28(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_236797D5C(a1);
}

id sub_236797D5C(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263F8EED0] & *v1;
  *(void *)((char *)v1 + qword_2688978B0) = a1;
  long long v4 = *(_OWORD *)(v2 + 80);
  long long v5 = *(_OWORD *)(v2 + 96);
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v6, sel_init, v4, v5);
}

void sub_236797DE0()
{
}

void sub_236797E0C(void *a1)
{
  id v1 = a1;
  sub_236797DE0();
}

void sub_236797E54()
{
}

void sub_236797E80(void *a1)
{
  id v1 = a1;
  sub_236797E54();
}

void sub_236797ED4(void *a1)
{
}

void sub_236797F00(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_236797ED4(v4);
}

void sub_236797F68()
{
}

id sub_236797FD4()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

uint64_t sub_23679804C()
{
  return swift_release();
}

uint64_t sub_23679805C()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_236798064(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_23679806C(uint64_t a1)
{
  *(void *)(v1 + *(void *)(*(void *)v1 + 112)) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_23679808C(uint64_t a1)
{
  *(void *)(v1 + *(void *)(*(void *)v1 + 120)) = a1;
  return MEMORY[0x270F9A758]();
}

char *DDDiscoveryExtensionConfiguration.init(discoveryExtension:)(uint64_t a1)
{
  long long v2 = v1;
  uint64_t v4 = *(void *)v1;
  *(void *)&v1[*(void *)(*(void *)v1 + 112)] = 0;
  *(void *)&v1[*(void *)(*(void *)v1 + 120)] = 0;
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_236799DD8();
  __swift_project_value_buffer(v5, (uint64_t)qword_2688977B8);
  objc_super v6 = sub_236799DB8();
  os_log_type_t v7 = sub_236799E68();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_236792000, v6, v7, "DD config init", v8, 2u);
    MEMORY[0x237E04CB0](v8, -1, -1);
  }

  *((void *)v2 + 2) = -1;
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(v4 + 80) - 8) + 32))(&v2[*(void *)(*(void *)v2 + 104)], a1);
  return v2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_23679827C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_236799DD8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2688977B8);
  id v5 = a1;
  objc_super v6 = sub_236799DB8();
  os_log_type_t v7 = sub_236799E88();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 67109120;
    LODWORD(v30[0]) = objc_msgSend(v5, sel_processIdentifier);
    sub_236799E98();

    _os_log_impl(&dword_236792000, v6, v7, "XPC connection started: PID %d", v8, 8u);
    MEMORY[0x237E04CB0](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v9 = *(void **)(v1 + *(void *)(*(void *)v1 + 120));
  if (v9)
  {
    uint64_t v10 = v5;
    id v11 = v9;
    uint64_t v12 = sub_236799DB8();
    os_log_type_t v13 = sub_236799E88();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 67109376;
      LODWORD(v30[0]) = objc_msgSend(v11, sel_processIdentifier);
      sub_236799E98();
      *(_WORD *)(v14 + 8) = 1024;
      LODWORD(v30[0]) = [v10 processIdentifier];
      sub_236799E98();

      _os_log_impl(&dword_236792000, v12, v13, "XPC connection replacing: PID %d -> PID %d", (uint8_t *)v14, 0xEu);
      MEMORY[0x237E04CB0](v14, -1, -1);
    }
    else
    {

      uint64_t v12 = v10;
    }

    objc_msgSend(v11, sel_invalidate);
    uint64_t v15 = *(void *)(*(void *)v2 + 120);
    uint64_t v16 = *(void **)(v2 + v15);
    *(void *)(v2 + v15) = 0;
  }
  uint64_t v17 = *(void *)(*(void *)v2 + 120);
  unint64_t v18 = *(void **)(v2 + v17);
  *(void *)(v2 + v17) = v5;
  id v19 = v5;

  uint64_t v20 = self;
  id v21 = objc_msgSend(v20, sel_interfaceWithProtocol_, &unk_26E9C6698);
  objc_msgSend(v19, sel_setExportedInterface_, v21);

  v22 = (objc_class *)type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject();
  swift_retain();
  id v23 = objc_allocWithZone(v22);
  id v24 = sub_236797D5C(v2);
  objc_msgSend(v19, sel_setExportedObject_, v24);

  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v2;
  *(void *)(v25 + 24) = v19;
  v30[4] = sub_236799A48;
  v30[5] = v25;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 1107296256;
  v30[2] = sub_236798710;
  v30[3] = &block_descriptor;
  unint64_t v26 = _Block_copy(v30);
  id v27 = v19;
  swift_retain();
  swift_release();
  objc_msgSend(v27, sel_setInvalidationHandler_, v26);
  _Block_release(v26);
  id v28 = objc_msgSend(v20, sel_interfaceWithProtocol_, &unk_26E9C65A0);
  objc_msgSend(v27, sel_setRemoteObjectInterface_, v28);

  objc_msgSend(v27, sel_resume);
  return 1;
}

uint64_t sub_236798710(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_236798754(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_236799DD8();
  __swift_project_value_buffer(v5, (uint64_t)qword_2688977B8);
  id v6 = a1;
  os_log_type_t v7 = sub_236799DB8();
  os_log_type_t v8 = sub_236799E88();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109120;
    objc_msgSend(v6, sel_processIdentifier);
    sub_236799E98();

    _os_log_impl(&dword_236792000, v7, v8, "XPC connection ended: PID %d", v9, 8u);
    MEMORY[0x237E04CB0](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = *v2;
  id v11 = *(void **)((char *)v2 + *(void *)(*v2 + 112));
  if (v11)
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(v4 + 88) + 24);
    id v13 = v11;
    v12();
    objc_msgSend(v13, sel_invalidate);

    uint64_t v10 = *v2;
  }
  uint64_t v14 = *(void *)(v10 + 112);
  uint64_t v15 = *(void **)((char *)v2 + v14);
  *(void *)((char *)v2 + v14) = 0;

  uint64_t v16 = *(void *)(*v2 + 120);
  uint64_t v17 = *(void **)((char *)v2 + v16);
  *(void *)((char *)v2 + v16) = 0;

  uint64_t result = v2[2];
  if (result != -1) {
    return sandbox_extension_release();
  }
  return result;
}

void sub_2367989B0()
{
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_236799DD8();
  __swift_project_value_buffer(v1, (uint64_t)qword_2688977B8);
  uint64_t v2 = sub_236799DB8();
  os_log_type_t v3 = sub_236799E88();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_236792000, v2, v3, "XPC consume sandbox extension token", v4, 2u);
    MEMORY[0x237E04CB0](v4, -1, -1);
  }

  uint64_t v5 = sandbox_extension_consume();
  *(void *)(v0 + 16) = v5;
  oslog = sub_236799DB8();
  if (v5 == -1)
  {
    os_log_type_t v6 = sub_236799E78();
    if (!os_log_type_enabled(oslog, v6)) {
      goto LABEL_11;
    }
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    os_log_type_t v8 = "XPC consume sandbox token failed";
  }
  else
  {
    os_log_type_t v6 = sub_236799E88();
    if (!os_log_type_enabled(oslog, v6)) {
      goto LABEL_11;
    }
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    os_log_type_t v8 = "XPC consume sandbox token success";
  }
  _os_log_impl(&dword_236792000, oslog, v6, v8, v7, 2u);
  MEMORY[0x237E04CB0](v7, -1, -1);
LABEL_11:
}

void sub_236798B74()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_236799DD8();
  __swift_project_value_buffer(v3, (uint64_t)qword_2688977B8);
  uint64_t v4 = sub_236799DB8();
  os_log_type_t v5 = sub_236799E88();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl(&dword_236792000, v4, v5, "XPC start discovery", v6, 2u);
    MEMORY[0x237E04CB0](v6, -1, -1);
  }

  objc_msgSend(*(id *)((char *)v1 + *(void *)(*v1 + 112)), sel_invalidate);
  id v7 = objc_msgSend(objc_allocWithZone((Class)DDDiscoverySession), sel_init);
  uint64_t v8 = *(void *)(*v1 + 112);
  uint64_t v9 = *(void **)((char *)v1 + v8);
  *(void *)((char *)v1 + v8) = v7;
  id v10 = v7;

  v12[4] = sub_236799C94;
  v12[5] = v1;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_23679900C;
  v12[3] = &block_descriptor_6;
  id v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setEventHandler_, v11);
  _Block_release(v11);
  (*(void (**)(id, void))(*(void *)(v2 + 88) + 16))(v10, *(void *)(v2 + 80));
}

void sub_236798DB8(void *a1, uint64_t a2)
{
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_236799DD8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2688977B8);
  id v5 = a1;
  os_log_type_t v6 = sub_236799DB8();
  os_log_type_t v7 = sub_236799E88();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_236799E98();
    void *v9 = v5;

    _os_log_impl(&dword_236792000, v6, v7, "XPC report event: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268897938);
    swift_arrayDestroy();
    MEMORY[0x237E04CB0](v9, -1, -1);
    MEMORY[0x237E04CB0](v8, -1, -1);
  }
  else
  {
  }
  id v11 = *(void **)(a2 + *(void *)(*(void *)a2 + 120));
  if (v11)
  {
    id v12 = objc_msgSend(v11, sel_remoteObjectProxy);
    sub_236799EA8();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268897948);
    if (swift_dynamicCast())
    {
      id v13 = objc_msgSend(v5, sel_createDADeviceEvent);
      objc_msgSend(v14, sel_reportEvent_, v13);
      swift_unknownObjectRelease();
    }
  }
}

void sub_23679900C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_236799074(void *a1)
{
  uint64_t v3 = *v1;
  if (qword_268897740 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_236799DD8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2688977B8);
  id v5 = a1;
  os_log_type_t v6 = sub_236799DB8();
  os_log_type_t v7 = sub_236799E88();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    sub_236799E98();
    void *v9 = v5;

    _os_log_impl(&dword_236792000, v6, v7, "XPC didReceiveDeviceChangedEvent %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268897938);
    swift_arrayDestroy();
    MEMORY[0x237E04CB0](v9, -1, -1);
    MEMORY[0x237E04CB0](v8, -1, -1);
  }
  else
  {
  }
  id v11 = objc_msgSend(v5, sel_device);
  id v12 = sub_236799508(v11);

  if (v12)
  {
    id v13 = objc_msgSend(objc_allocWithZone((Class)DDDeviceEvent), sel_initWithEventType_device_, 42, v12);

    if (v13)
    {
      uint64_t v14 = v5;
      uint64_t v15 = sub_236799DB8();
      os_log_type_t v16 = sub_236799E88();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        unint64_t v18 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 138412290;
        id v19 = v14;
        sub_236799E98();
        void *v18 = v14;

        _os_log_impl(&dword_236792000, v15, v16, "XPC didReceiveDeviceChangedEvent converted to DDEvent %@", v17, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268897938);
        swift_arrayDestroy();
        MEMORY[0x237E04CB0](v18, -1, -1);
        MEMORY[0x237E04CB0](v17, -1, -1);
      }
      else
      {

        uint64_t v15 = v14;
      }

      (*(void (**)(id, void))(*(void *)(v3 + 88) + 32))(v13, *(void *)(v3 + 80));
    }
  }
}

uint64_t DDDiscoveryExtensionConfiguration.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));

  return v0;
}

uint64_t DDDiscoveryExtensionConfiguration.__deallocating_deinit()
{
  DDDiscoveryExtensionConfiguration.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2367994E0(void *a1)
{
  return 1;
}

id sub_236799508(void *a1)
{
  uint64_t v2 = sub_236799D78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268897940);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_236799DA8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(a1, sel_name);
  if (v13)
  {
    v35 = v5;
    v36 = v8;
    sub_236799E58();

    id v14 = objc_msgSend(a1, sel_type);
    id v15 = objc_msgSend(a1, sel_identifier);
    if (v15)
    {
      os_log_type_t v16 = v15;
      uint64_t v32 = v3;
      uint64_t v33 = v2;
      sub_236799E58();
      id v34 = v14;

      id v17 = objc_msgSend(a1, sel_protocolType);
      sub_236799D98();

      id v18 = objc_allocWithZone((Class)DDDevice);
      id v19 = (void *)sub_236799E48();
      swift_bridgeObjectRelease();
      uint64_t v20 = (void *)sub_236799D88();
      id v21 = (void *)sub_236799E48();
      swift_bridgeObjectRelease();
      id v13 = objc_msgSend(v18, sel_initWithDisplayName_category_protocolType_identifier_, v19, v34, v20, v21);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      id v22 = objc_msgSend(a1, sel_bluetoothIdentifier);
      if (v22)
      {
        id v23 = v35;
        sub_236799D68();

        uint64_t v24 = v32;
        uint64_t v25 = v36;
        unint64_t v26 = v23;
        uint64_t v27 = v33;
        (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v36, v26, v33);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v27);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v25, 1, v27) == 1)
        {
          id v22 = 0;
        }
        else
        {
          id v22 = (id)sub_236799D58();
          (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v27);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v36, 1, 1, v33);
      }
      objc_msgSend(v13, sel_setBluetoothIdentifier_, v22);

      objc_msgSend(v13, sel_setState_, objc_msgSend(a1, sel_state));
      objc_msgSend(v13, sel_setSupportsGrouping_, objc_msgSend(a1, sel_supportsGrouping));
      objc_msgSend(v13, sel_setMediaPlaybackState_, objc_msgSend(a1, sel_mediaPlaybackState));
      id v28 = objc_msgSend(a1, sel_mediaContentTitle);
      objc_msgSend(v13, sel_setMediaContentTitle_, v28);

      id v29 = objc_msgSend(a1, sel_mediaContentArtistName);
      objc_msgSend(v13, sel_setMediaContentSubtitle_, v29);
    }
    else
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v13;
}

void sub_2367999C0()
{
}

uint64_t type metadata accessor for DDDiscoveryExtensionConfiguration.ExportedObject()
{
  return swift_getGenericMetadata();
}

uint64_t sub_236799A08()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236799A48()
{
  return sub_236798754(*(void **)(v0 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_236799A88(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of DDDiscoveryExtension.startDiscovery(session:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of DDDiscoveryExtension.stopDiscovery(session:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DDDiscoveryExtension.didReceiveEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_236799B04()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DDDiscoveryExtensionConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DDDiscoveryExtensionConfiguration);
}

uint64_t dispatch thunk of DDDiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of DDDiscoveryExtensionConfiguration.accept(connection:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_236799C04()
{
  return swift_initClassMetadata2();
}

uint64_t sub_236799C4C()
{
  type metadata accessor for DDDiscoveryExtensionConfiguration();

  return swift_getWitnessTable();
}

void sub_236799C94(void *a1)
{
  sub_236798DB8(a1, v1);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_236799D38()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_236799D48()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_236799D58()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_236799D68()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_236799D78()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_236799D88()
{
  return MEMORY[0x270FA1778]();
}

uint64_t sub_236799D98()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t sub_236799DA8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_236799DB8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_236799DC8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_236799DD8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_236799DE8()
{
  return MEMORY[0x270EF7118]();
}

uint64_t sub_236799DF8()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_236799E08()
{
  return MEMORY[0x270EF7190]();
}

uint64_t sub_236799E18()
{
  return MEMORY[0x270EF72A8]();
}

uint64_t sub_236799E28()
{
  return MEMORY[0x270EF72C0]();
}

uint64_t sub_236799E38()
{
  return MEMORY[0x270EF72C8]();
}

uint64_t sub_236799E48()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_236799E58()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_236799E68()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_236799E78()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_236799E88()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_236799E98()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_236799EA8()
{
  return MEMORY[0x270F9E670]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CUAppendF()
{
  return MEMORY[0x270F23F08]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x270F23FB0]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x270F23FE8]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x270F24008]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x270F24030]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x270F24040]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x270F24050]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x270F24058]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x270F24060]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x270F24068]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x270F24070]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x270F24090]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x270F24098]();
}

uint64_t DAErrorF()
{
  return MEMORY[0x270F25AE8]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x270F24468]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x270F24488]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x270EF7E58]();
}

uint64_t nw_endpoint_create_from_dictionary()
{
  return MEMORY[0x270EF7EA0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}