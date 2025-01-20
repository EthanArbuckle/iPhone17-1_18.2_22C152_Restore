uint64_t OUTLINED_FUNCTION_30()
{
  uint64_t v0;

  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_41()
{
  *(void *)(v0 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)uint64_t v0 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_217C3F738(v2 - 128, v0, v1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_dynamicCast();
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        double result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *double result = *a2;
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
          *uint64_t v3 = *a2;
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_217C5D0A8();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_217C5D088();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_217C5D0A8();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_4@<X0>(char a1@<W8>)
{
  *(void *)(v2 + 56) = v7;
  *(void *)(v2 + 64) = v6;
  *(void *)(v2 + 72) = v5;
  *(void *)(v2 + 80) = v1;
  *(void *)(v2 + 88) = v4;
  *(unsigned char *)(v2 + 96) = a1 & 1;
  *(void *)(v2 + 104) = v3;
  return sub_217C3D014();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_217C5CF28();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_217C3F738(v11 - 88, (uint64_t)va, v10);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return 0;
}

double OUTLINED_FUNCTION_7(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 48) = 0;
  *(void *)(v1 + 144) = a1;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 168) = 0u;
  *(_OWORD *)(v1 + 184) = 0u;
  *(_OWORD *)(v1 + 200) = 0u;
  *(_OWORD *)(v1 + 216) = 0u;
  *(_OWORD *)(v1 + 232) = 0u;
  return result;
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x21D459650);
}

id OUTLINED_FUNCTION_1_0()
{
  return objc_allocWithZone(v0);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_217C5D0A8();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_217C5CF28();
}

__n128 OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, __n128 a11, unsigned __int8 a12, uint64_t a13)
{
  __n128 result = a11;
  *(_OWORD *)uint64_t v13 = a9;
  *(void *)(v13 + 16) = a10;
  *(__n128 *)(v13 + 24) = a11;
  *(void *)(v13 + 40) = a12;
  *(void *)(v13 + 48) = a13;
  return result;
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  return sub_217C3F738((uint64_t)va1, (uint64_t)va, a3);
}

__n128 OUTLINED_FUNCTION_9()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  __n128 result = *(__n128 *)(v0 + 80);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)(v0 + 56);
  *(void *)(v0 + 16) = v1;
  *(__n128 *)(v0 + 24) = result;
  *(void *)(v0 + 40) = v2;
  *(void *)(v0 + 48) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  return sub_217C3F738(a1, v2 - 128, v1);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_217C3F828(v1 - 128, v0);
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

double OUTLINED_FUNCTION_17()
{
  *(void *)(v0 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

unint64_t OUTLINED_FUNCTION_10()
{
  return sub_217C3D014();
}

uint64_t OUTLINED_FUNCTION_10_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_217C5D098();
}

uint64_t OUTLINED_FUNCTION_12()
{
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_OWORD *)(v0 + 120) = 0u;
  *(void *)(v0 + 136) = 0;
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_217C3F828(v1 - 128, v0);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_217C5CFA8();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_217C3F828(v1 - 88, v0);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  return sub_217C3F738(a1, v2 - 88, v1);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_217C5CFA8();
}

void OUTLINED_FUNCTION_29(__n128 a1)
{
  v2[16] = a1;
  v2[17] = a1;
  v2[18] = a1;
  v2[19] = a1;
  v2[20] = a1;
  v2[21].n128_u64[0] = 0;
  v2[2].n128_u64[1] = v1;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_217C5D0A8();
}

uint64_t OUTLINED_FUNCTION_26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_217C3D100((uint64_t)&a9);
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_217C3F828((uint64_t)va, v10);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_217C5CFE8();
}

uint64_t OUTLINED_FUNCTION_42@<X0>(char a1@<W8>)
{
  return a1 & 1;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_217C3F828(v1 - 88, v0);
}

void *OUTLINED_FUNCTION_32(void *result)
{
  *(void *)(*(void *)(result[1] + 144) + 24) = *result;
  return result;
}

void *OUTLINED_FUNCTION_33(void *result)
{
  *(void *)(*(void *)(result[1] + 144) + 16) = *result;
  return result;
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v2 = *v0;
  return sub_217C3D060(v2);
}

uint64_t OUTLINED_FUNCTION_44(uint64_t result)
{
  void *v1 = result;
  *(void *)(result + 152) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_35(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return *(void *)(*(void *)(v0 + 144) + 24);
}

void static PHPickerMode.default.getter(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t static PHPickerMode.compact.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = qword_267BB1720;
  return result;
}

uint64_t static PHPickerMode.compact.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  qword_267BB1720 = v1;
  return result;
}

uint64_t (*static PHPickerMode.compact.modify())()
{
  return j__swift_endAccess;
}

BOOL static PHPickerMode.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_217C36980(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t PHPickerMode.hash(into:)()
{
  return sub_217C5D098();
}

uint64_t PHPickerMode.hashValue.getter()
{
  return sub_217C5D0B8();
}

uint64_t sub_217C369FC()
{
  return sub_217C5D0B8();
}

id sub_217C36A40(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_imagesFilter, &qword_267BB1730);
}

id static PHPickerFilter.images.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1728, (void **)&qword_267BB1730, a1);
}

id sub_217C36A80(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_videosFilter, &qword_267BB1740);
}

id static PHPickerFilter.videos.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1738, (void **)&qword_267BB1740, a1);
}

id sub_217C36AC0(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_livePhotosFilter, &qword_267BB1750);
}

id static PHPickerFilter.livePhotos.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1748, (void **)&qword_267BB1750, a1);
}

id sub_217C36B00(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_depthEffectPhotosFilter, &qword_267BB1760);
}

id static PHPickerFilter.depthEffectPhotos.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1758, (void **)&qword_267BB1760, a1);
}

id sub_217C36B40(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_burstsFilter, &qword_267BB1770);
}

id static PHPickerFilter.bursts.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1768, (void **)&qword_267BB1770, a1);
}

id sub_217C36B80(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_panoramasFilter, &qword_267BB1780);
}

id static PHPickerFilter.panoramas.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1778, (void **)&qword_267BB1780, a1);
}

id sub_217C36BC0(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_screenshotsFilter, &qword_267BB1790);
}

id static PHPickerFilter.screenshots.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1788, (void **)&qword_267BB1790, a1);
}

id sub_217C36C00(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_screenRecordingsFilter, &qword_267BB17A0);
}

id static PHPickerFilter.screenRecordings.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1798, (void **)&qword_267BB17A0, a1);
}

id sub_217C36C40(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_slomoVideosFilter, &qword_267BB17B0);
}

id static PHPickerFilter.slomoVideos.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB17A8, (void **)&qword_267BB17B0, a1);
}

id sub_217C36C80(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_timelapseVideosFilter, &qword_267BB17C0);
}

id static PHPickerFilter.timelapseVideos.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB17B8, (void **)&qword_267BB17C0, a1);
}

id sub_217C36CC0(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_cinematicVideosFilter, &qword_267BB17D0);
}

id static PHPickerFilter.cinematicVideos.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB17C8, (void **)&qword_267BB17D0, a1);
}

id sub_217C36D00(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef_spatialMediaFilter, &qword_267BB17E0);
}

id static PHPickerFilter.spatialMedia.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB17D8, (void **)&qword_267BB17E0, a1);
}

id static PHPickerFilter.playbackStyle(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(self, sel_playbackStyleFilter_, a1);
  *a2 = result;
  return result;
}

void static PHPickerFilter.any(of:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_217C36D98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    sub_217C5D038();
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      id v6 = v5;
      sub_217C5D018();
      sub_217C5D048();
      sub_217C5D058();
      sub_217C5D028();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_217C36E48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_217C5D038();
    uint64_t v4 = (void *)(a1 + 80);
    do
    {
      uint64_t v5 = (void *)*(v4 - 2);
      unsigned int v11 = *((unsigned __int8 *)v4 - 8);
      if (*v4)
      {
        sub_217C3F6FC(0, &qword_267BB1AC8);
        swift_bridgeObjectRetain();
        id v6 = sub_217C3C858();
      }
      else
      {
        id v6 = objc_msgSend(objc_allocWithZone((Class)_PHPickerCollectionConfiguration), sel_init);
      }
      uint64_t v7 = v6;
      uint64_t v8 = (void *)sub_217C5CF68();
      objc_msgSend(v7, sel_setSuggestedIdentifiers_, v8);

      uint64_t v9 = (void *)sub_217C5CF68();
      objc_msgSend(v7, sel_setPreselectedIdentifiers_, v9);

      uint64_t v10 = (void *)sub_217C5CF68();
      objc_msgSend(v7, sel_setDisabledIdentifiers_, v10);

      if (v5) {
        uint64_t v5 = (void *)sub_217C5CF28();
      }
      v4 += 7;
      objc_msgSend(v7, sel_setPurpose_, v5);

      objc_msgSend(v7, sel_setAllowsEditingCollection_, v11);
      sub_217C5D018();
      sub_217C5D048();
      sub_217C5D058();
      sub_217C5D028();
      --v2;
    }
    while (v2);
    return v12;
  }
  return result;
}

void static PHPickerFilter.all(of:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_217C37034(uint64_t a1@<X0>, SEL *a2@<X1>, void *a3@<X8>)
{
  id v6 = self;
  sub_217C36D98(a1);
  sub_217C3F6FC(0, &qword_267BB18A8);
  uint64_t v7 = (void *)sub_217C5CF68();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, *a2, v7);

  *a3 = v8;
}

id static PHPickerFilter.not(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(self, sel_notFilterOfSubfilter_, *a1);
  *a2 = result;
  return result;
}

id sub_217C37138(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef__stickersFilter, &qword_267BB17F0);
}

id static PHPickerFilter._stickers.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB17E8, (void **)&qword_267BB17F0, a1);
}

id sub_217C37178(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)off_2642C4B50, (SEL *)&selRef__styleabilityFilter, &qword_267BB1800);
}

id static PHPickerFilter._styleability.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB17F8, (void **)&qword_267BB1800, a1);
}

void static PHPickerFilter._itemIdentifiers(_:)(void *a1@<X8>)
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_217C5CF68();
  id v4 = objc_msgSend(v2, sel__itemIdentifiersFilter_, v3);

  *a1 = v4;
}

void PHPickerFilter.hash(into:)()
{
  id v1 = *v0;
  OUTLINED_FUNCTION_39();
}

BOOL static PHPickerConfiguration.AssetRepresentationMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PHPickerConfiguration.AssetRepresentationMode.hash(into:)()
{
  return sub_217C5D098();
}

uint64_t _s8PhotosUI21PHPickerConfigurationV23AssetRepresentationModeO9hashValueSivg_0()
{
  return sub_217C5D0B8();
}

uint64_t sub_217C37320()
{
  return sub_217C5D0B8();
}

uint64_t PHPickerConfiguration.Update.selectionLimit.getter()
{
  return *(void *)v0;
}

uint64_t PHPickerConfiguration.Update.selectionLimit.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*PHPickerConfiguration.Update.selectionLimit.modify())()
{
  return nullsub_1;
}

uint64_t (*PHPickerConfiguration.Update.minimumSelectionLimit.modify())()
{
  return nullsub_1;
}

uint64_t PHPickerConfiguration.Update.edgesWithoutContentMargins.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t PHPickerConfiguration.Update.edgesWithoutContentMargins.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*PHPickerConfiguration.Update.edgesWithoutContentMargins.modify())()
{
  return nullsub_1;
}

void __swiftcall PHPickerConfiguration.Update.init()(PhotosUI::PHPickerConfiguration::Update *__return_ptr retstr)
{
  retstr->selectionLimit.value = 0;
  retstr->selectionLimit.is_nil = 1;
  retstr->minimumSelectionLimit.value = 0;
  retstr->minimumSelectionLimit.is_nil = 1;
  retstr->edgesWithoutContentMargins.value.rawValue = 0;
  retstr->edgesWithoutContentMargins.is_nil = 1;
}

uint64_t PHPickerConfiguration.Update.hash(into:)()
{
  int v1 = v0[8];
  int v2 = v0[24];
  if (v0[40] == 1)
  {
    sub_217C5D0A8();
    if (!v1) {
      goto LABEL_3;
    }
LABEL_6:
    sub_217C5D0A8();
    if (!v2) {
      goto LABEL_4;
    }
    return sub_217C5D0A8();
  }
  sub_217C5D0A8();
  sub_217C5D098();
  if (v1) {
    goto LABEL_6;
  }
LABEL_3:
  sub_217C5D0A8();
  sub_217C5D098();
  if (!v2)
  {
LABEL_4:
    sub_217C5D0A8();
    return sub_217C5D098();
  }
  return sub_217C5D0A8();
}

uint64_t static PHPickerConfiguration.Update.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 != *(void *)a2) {
      char v2 = 1;
    }
    if (v2) {
      return 0;
    }
  }
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 16) == *(void *)(a2 + 16)) {
      char v3 = *(unsigned char *)(a2 + 24);
    }
    else {
      char v3 = 1;
    }
    if (v3) {
      return 0;
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if ((*(unsigned char *)(a2 + 40) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 32) == *(void *)(a2 + 32)) {
      char v5 = *(unsigned char *)(a2 + 40);
    }
    else {
      char v5 = 1;
    }
    if (v5) {
      return 0;
    }
  }
  return 1;
}

uint64_t PHPickerConfiguration.Update.hashValue.getter()
{
  int v1 = v0[8];
  int v2 = v0[24];
  unsigned __int8 v3 = v0[40];
  OUTLINED_FUNCTION_14();
  sub_217C5D0A8();
  if ((v3 & 1) == 0) {
    sub_217C5D098();
  }
  sub_217C5D0A8();
  if (!v1) {
    sub_217C5D098();
  }
  sub_217C5D0A8();
  if (!v2) {
    OUTLINED_FUNCTION_27();
  }
  return sub_217C5D0B8();
}

uint64_t sub_217C3762C()
{
  int v1 = v0[8];
  int v2 = v0[24];
  unsigned __int8 v3 = v0[40];
  sub_217C5D088();
  sub_217C5D0A8();
  if ((v3 & 1) == 0) {
    sub_217C5D098();
  }
  sub_217C5D0A8();
  if (!v1) {
    sub_217C5D098();
  }
  sub_217C5D0A8();
  if (!v2) {
    sub_217C5D098();
  }
  return sub_217C5D0B8();
}

void PHPickerConfiguration.preferredAssetRepresentationMode.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *PHPickerConfiguration.preferredAssetRepresentationMode.setter(unsigned char *result)
{
  unsigned char *v1 = *result;
  return result;
}

uint64_t (*PHPickerConfiguration.preferredAssetRepresentationMode.modify())()
{
  return nullsub_1;
}

uint64_t PHPickerConfiguration.selection.getter@<X0>(unsigned char *a1@<X8>)
{
  sub_217C3F738(v1 + 56, (uint64_t)v6, &qword_267BB18B8);
  if (!v7)
  {
    uint64_t result = sub_217C3F828((uint64_t)v6, &qword_267BB18B8);
    goto LABEL_5;
  }
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
LABEL_5:
    char v4 = 0;
    goto LABEL_6;
  }
  char v4 = v5;
LABEL_6:
  *a1 = v4;
  return result;
}

uint64_t sub_217C377C4@<X0>(unsigned char *a1@<X8>)
{
  return PHPickerConfiguration.selection.getter(a1);
}

uint64_t sub_217C377E8()
{
  return PHPickerConfiguration.selection.setter();
}

uint64_t PHPickerConfiguration.selection.setter()
{
  sub_217C3CE90();
  sub_217C5CFF8();
  return sub_217C3CEDC((uint64_t)v2, v0 + 56);
}

void (*PHPickerConfiguration.selection.modify())(uint64_t a1)
{
  int v2 = malloc(0x38uLL);
  *(void *)(OUTLINED_FUNCTION_38((uint64_t)v2) + 40) = v0;
  sub_217C3F738(v0 + 56, v1, &qword_267BB18B8);
  if (!*(void *)(v1 + 24))
  {
    sub_217C3F828(v1, &qword_267BB18B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_30() & 1) == 0)
  {
LABEL_5:
    char v3 = 0;
    goto LABEL_6;
  }
  char v3 = *(unsigned char *)(v1 + 48);
LABEL_6:
  *(unsigned char *)(v1 + 49) = v3;
  return sub_217C37928;
}

void sub_217C37928(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 40) + 56;
  *(unsigned char *)(*(void *)a1 + 48) = *(unsigned char *)(*(void *)a1 + 49);
  sub_217C3CE90();
  sub_217C5CFF8();
  sub_217C3CEDC((uint64_t)v1, v2);

  free(v1);
}

uint64_t PHPickerConfiguration.selectionLimit.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t PHPickerConfiguration.selectionLimit.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*PHPickerConfiguration.selectionLimit.modify())()
{
  return nullsub_1;
}

uint64_t (*PHPickerConfiguration.minimumSelectionLimit.modify())()
{
  return nullsub_1;
}

id PHPickerConfiguration.filter.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 32);
  *a1 = v2;
  return v2;
}

void PHPickerConfiguration.filter.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;

  *(void *)(v1 + 32) = v2;
}

uint64_t (*PHPickerConfiguration.filter.modify())()
{
  return nullsub_1;
}

uint64_t PHPickerConfiguration.preselectedAssetIdentifiers.getter()
{
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_217C37A88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration.preselectedAssetIdentifiers.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C37AB4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return PHPickerConfiguration.preselectedAssetIdentifiers.setter(v0);
}

uint64_t PHPickerConfiguration.preselectedAssetIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t PHPickerConfiguration.preselectedAssetIdentifiers.modify(void *a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (*(void *)(v1 + 96)) {
    uint64_t v2 = *(void *)(v1 + 96);
  }
  *a1 = v2;
  a1[1] = v1;
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_50();
}

uint64_t sub_217C37B64(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v3 + 96) = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v3 + 96) = v2;
  }
  return result;
}

uint64_t PHPickerConfiguration.mode.getter@<X0>(void *a1@<X8>)
{
  sub_217C3F738(v1 + 104, (uint64_t)v6, &qword_267BB18B8);
  if (!v7)
  {
    uint64_t result = sub_217C3F828((uint64_t)v6, &qword_267BB18B8);
    goto LABEL_5;
  }
  uint64_t result = OUTLINED_FUNCTION_36();
  if (!result)
  {
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = v5;
LABEL_6:
  *a1 = v4;
  return result;
}

uint64_t sub_217C37C54@<X0>(void *a1@<X8>)
{
  return PHPickerConfiguration.mode.getter(a1);
}

uint64_t sub_217C37C78()
{
  return PHPickerConfiguration.mode.setter();
}

uint64_t PHPickerConfiguration.mode.setter()
{
  sub_217C3CF44();
  sub_217C5CFF8();
  return sub_217C3CEDC((uint64_t)v2, v0 + 104);
}

void (*PHPickerConfiguration.mode.modify())(uint64_t a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *(void *)(OUTLINED_FUNCTION_38((uint64_t)v2) + 56) = v0;
  sub_217C3F738(v0 + 104, (uint64_t)v1, &qword_267BB18B8);
  if (!v1[3])
  {
    sub_217C3F828((uint64_t)v1, &qword_267BB18B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_30() & 1) == 0)
  {
LABEL_5:
    uint64_t v3 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = v1[5];
LABEL_6:
  v1[6] = v3;
  return sub_217C37DB8;
}

void sub_217C37DB8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 56) + 104;
  *(void *)(*(void *)a1 + 40) = *(void *)(*(void *)a1 + 48);
  sub_217C3CF44();
  sub_217C5CFF8();
  sub_217C3CEDC((uint64_t)v1, v2);

  free(v1);
}

uint64_t sub_217C37E30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration.edgesWithoutContentMargins.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C37E5C(void *a1)
{
  return PHPickerConfiguration.edgesWithoutContentMargins.setter(*a1);
}

void *(*PHPickerConfiguration.edgesWithoutContentMargins.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 16);
  return j__OUTLINED_FUNCTION_33;
}

uint64_t sub_217C37EC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration.disabledCapabilities.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C37EEC(void *a1)
{
  return PHPickerConfiguration.disabledCapabilities.setter(*a1);
}

void *(*PHPickerConfiguration.disabledCapabilities.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 24);
  return j__OUTLINED_FUNCTION_32;
}

double PHPickerConfiguration.init()@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_217C60430;
  *(unsigned char *)(a1 + 24) = 1;
  *(_WORD *)(a1 + 48) = 514;
  type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes();
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(void *)(a1 + 136) = 0;
  uint64_t v2 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(void *)(v2 + 48) = 0;
  *(void *)(a1 + 144) = v2;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_WORD *)(a1 + 248) = 514;
  *(unsigned char *)(a1 + 250) = 2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(void *)(a1 + 336) = 0;
  return result;
}

void PHPickerConfiguration.init(photoLibrary:)(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_217C60430;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  *(_WORD *)(a1 + 48) = 514;
  type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes();
  uint64_t v2 = OUTLINED_FUNCTION_12();
  v3.n128_f64[0] = OUTLINED_FUNCTION_7(v2);
  *(_WORD *)(a1 + 248) = 514;
  *(unsigned char *)(a1 + 250) = 2;
  OUTLINED_FUNCTION_29(v3);
}

uint64_t PHPickerConfiguration.photoLibrary.getter()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (!v1) {
    return 0;
  }
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2) {
    id v3 = v1;
  }
  return v2;
}

uint64_t PHPickerConfiguration._suggestionGroup.getter@<X0>(void *a1@<X8>)
{
  sub_217C3F738(v1 + 152, (uint64_t)v6, &qword_267BB18B8);
  if (!v7)
  {
    uint64_t result = sub_217C3F828((uint64_t)v6, &qword_267BB18B8);
    goto LABEL_5;
  }
  uint64_t result = OUTLINED_FUNCTION_36();
  if ((result & 1) == 0)
  {
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = v5;
LABEL_6:
  *a1 = v4;
  return result;
}

uint64_t sub_217C38144@<X0>(void *a1@<X8>)
{
  return PHPickerConfiguration._suggestionGroup.getter(a1);
}

uint64_t sub_217C38168(id *a1)
{
  id v3 = *a1;
  id v1 = v3;
  return PHPickerConfiguration._suggestionGroup.setter(&v3);
}

uint64_t PHPickerConfiguration._suggestionGroup.setter(void *a1)
{
  if (*a1)
  {
    sub_217C3CFB4();
    sub_217C5CFF8();
  }
  else
  {
    uint64_t v4 = 0;
    memset(v3, 0, sizeof(v3));
  }
  return sub_217C3CEDC((uint64_t)v3, v1 + 152);
}

void (*PHPickerConfiguration._suggestionGroup.modify())(uint64_t *a1, char a2)
{
  uint64_t v2 = malloc(0x40uLL);
  uint64_t v3 = OUTLINED_FUNCTION_38((uint64_t)v2);
  uint64_t v4 = (void *)(v3 + 48);
  *(void *)(v3 + 56) = v0;
  sub_217C3F738(v0 + 152, v1, &qword_267BB18B8);
  if (!*(void *)(v1 + 24))
  {
    sub_217C3F828(v1, &qword_267BB18B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_30() & 1) == 0)
  {
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)(v1 + 40);
LABEL_6:
  *uint64_t v4 = v5;
  return sub_217C382B4;
}

void sub_217C382B4(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(*a1 + 48);
  if (a2)
  {
    if (v3)
    {
      *(void *)(v2 + 40) = v3;
      sub_217C3CFB4();
      id v4 = v3;
      sub_217C5CFF8();
    }
    else
    {
      *(void *)(v2 + 32) = 0;
      *(_OWORD *)uint64_t v2 = 0u;
      *(_OWORD *)(v2 + 16) = 0u;
    }
    sub_217C3CEDC(v2, *(void *)(v2 + 56) + 152);
  }
  else
  {
    if (v3)
    {
      *(void *)(v2 + 40) = v3;
      sub_217C3CFB4();
      sub_217C5CFF8();
    }
    else
    {
      *(void *)(v2 + 32) = 0;
      *(_OWORD *)uint64_t v2 = 0u;
      *(_OWORD *)(v2 + 16) = 0u;
    }
    sub_217C3CEDC(v2, *(void *)(v2 + 56) + 152);
  }

  free((void *)v2);
}

uint64_t PHPickerConfiguration._disabledPrivateCapabilities.getter()
{
  return *(void *)(*(void *)(v0 + 144) + 32);
}

uint64_t sub_217C383A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._disabledPrivateCapabilities.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C383D4(uint64_t *a1)
{
  return PHPickerConfiguration._disabledPrivateCapabilities.setter(*a1);
}

uint64_t PHPickerConfiguration._disabledPrivateCapabilities.setter(uint64_t result)
{
  *(void *)(*(void *)(v1 + 144) + 32) = result;
  return result;
}

void *(*PHPickerConfiguration._disabledPrivateCapabilities.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 32);
  return sub_217C38438;
}

void *sub_217C38438(void *result)
{
  *(void *)(*(void *)(result[1] + 144) + 32) = *result;
  return result;
}

uint64_t PHPickerConfiguration._sourceType.getter()
{
  sub_217C3F738(v0 + 192, (uint64_t)v3, &qword_267BB18B8);
  if (v4)
  {
    type metadata accessor for _PHPickerSourceType(0);
    if (OUTLINED_FUNCTION_36()) {
      return v2;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)v3, &qword_267BB18B8);
  }
  return 0;
}

uint64_t sub_217C384B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._sourceType.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C384E4()
{
  return PHPickerConfiguration._sourceType.setter();
}

uint64_t PHPickerConfiguration._sourceType.setter()
{
  type metadata accessor for _PHPickerSourceType(0);
  sub_217C3EFEC(&qword_267BB18D8, type metadata accessor for _PHPickerSourceType);
  sub_217C5CFF8();
  return sub_217C3CEDC((uint64_t)v2, v0 + 192);
}

void (*PHPickerConfiguration._sourceType.modify())(uint64_t a1)
{
  uint64_t v2 = malloc(0x40uLL);
  *(void *)(OUTLINED_FUNCTION_38((uint64_t)v2) + 56) = v0;
  *(void *)(v1 + 40) = PHPickerConfiguration._sourceType.getter();
  return sub_217C385F0;
}

void sub_217C385F0(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 56) + 192;
  *(void *)(*(void *)a1 + 48) = *(void *)(*(void *)a1 + 40);
  type metadata accessor for _PHPickerSourceType(0);
  sub_217C3EFEC(&qword_267BB18D8, type metadata accessor for _PHPickerSourceType);
  sub_217C5CFF8();
  sub_217C3CEDC((uint64_t)v1, v2);

  free(v1);
}

uint64_t PHPickerConfiguration._containerIdentifier.getter()
{
  return OUTLINED_FUNCTION_37();
}

uint64_t sub_217C386CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._containerIdentifier.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_217C386F8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  swift_bridgeObjectRetain();
  return PHPickerConfiguration._containerIdentifier.setter(v1, v2);
}

uint64_t PHPickerConfiguration._containerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  return result;
}

uint64_t PHPickerConfiguration._containerIdentifier.modify(void *a1)
{
  a1[2] = v1;
  uint64_t v3 = *(void *)(v1 + 240);
  *a1 = *(void *)(v1 + 232);
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_50();
}

uint64_t sub_217C387BC(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v3 + 232) = v4;
    *(void *)(v3 + 240) = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v3 + 232) = v4;
    *(void *)(v3 + 240) = v2;
  }
  return result;
}

uint64_t PHPickerConfiguration._alwaysShowLoadingPlaceholder.getter()
{
  return OUTLINED_FUNCTION_42(*(unsigned char *)(v0 + 248));
}

uint64_t sub_217C3883C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._alwaysShowLoadingPlaceholder.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_217C3886C(unsigned __int8 *a1)
{
  return PHPickerConfiguration._alwaysShowLoadingPlaceholder.setter(*a1);
}

uint64_t PHPickerConfiguration._alwaysShowLoadingPlaceholder.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 248) = result;
  return result;
}

unsigned char *(*PHPickerConfiguration._alwaysShowLoadingPlaceholder.modify(uint64_t a1))(unsigned char *result)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(v1 + 248) & 1;
  return sub_217C388CC;
}

unsigned char *sub_217C388CC(unsigned char *result)
{
  *(unsigned char *)(*(void *)result + 248) = result[8];
  return result;
}

uint64_t PHPickerConfiguration._allowsDownscaling.getter()
{
  return OUTLINED_FUNCTION_42(*(unsigned char *)(v0 + 249));
}

uint64_t sub_217C388E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._allowsDownscaling.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_217C38914(unsigned __int8 *a1)
{
  return PHPickerConfiguration._allowsDownscaling.setter(*a1);
}

uint64_t PHPickerConfiguration._allowsDownscaling.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 249) = result;
  return result;
}

unsigned char *(*PHPickerConfiguration._allowsDownscaling.modify(uint64_t a1))(unsigned char *result)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(v1 + 249) & 1;
  return sub_217C38974;
}

unsigned char *sub_217C38974(unsigned char *result)
{
  *(unsigned char *)(*(void *)result + 249) = result[8];
  return result;
}

uint64_t PHPickerConfiguration._allowsEncodingPolicyModification.getter()
{
  return OUTLINED_FUNCTION_42((*(unsigned char *)(v0 + 250) == 2) | *(unsigned char *)(v0 + 250));
}

uint64_t sub_217C38998@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._allowsEncodingPolicyModification.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_217C389C8(unsigned __int8 *a1)
{
  return PHPickerConfiguration._allowsEncodingPolicyModification.setter(*a1);
}

uint64_t PHPickerConfiguration._allowsEncodingPolicyModification.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 250) = result;
  return result;
}

unsigned char *(*PHPickerConfiguration._allowsEncodingPolicyModification.modify(uint64_t a1))(unsigned char *result)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = (*(unsigned char *)(v1 + 250) == 2) | *(unsigned char *)(v1 + 250) & 1;
  return sub_217C38A34;
}

unsigned char *sub_217C38A34(unsigned char *result)
{
  *(unsigned char *)(*(void *)result + 250) = result[8];
  return result;
}

double PHPickerConfiguration._albumsConfiguration.getter()
{
  sub_217C3F738(v0 + 256, (uint64_t)v15, &qword_267BB18B8);
  if (v16)
  {
    uint64_t v1 = swift_dynamicCast();
    if (v1)
    {
      *(void *)&double result = OUTLINED_FUNCTION_11(v1, v2, v3, v4, v5, v6, v7, v8, v11, v12, v9, v13, v14).n128_u64[0];
      return result;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)v15, &qword_267BB18B8);
  }
  return OUTLINED_FUNCTION_41();
}

double sub_217C38AC8@<D0>(uint64_t a1@<X8>)
{
  return sub_217C38D8C((void (*)(_OWORD *__return_ptr))PHPickerConfiguration._albumsConfiguration.getter, a1);
}

uint64_t sub_217C38AE0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217C38DF4(a1, a2, a3, a4, PHPickerConfiguration._albumsConfiguration.setter);
}

uint64_t PHPickerConfiguration._albumsConfiguration.setter(void *a1)
{
  if (*a1)
  {
    OUTLINED_FUNCTION_10();
    sub_217C5CFF8();
  }
  else
  {
    uint64_t v4 = 0;
    memset(v3, 0, sizeof(v3));
  }
  return sub_217C3CEDC((uint64_t)v3, v1 + 256);
}

void (*PHPickerConfiguration._albumsConfiguration.modify())()
{
  uint64_t v3 = malloc(0xA0uLL);
  OUTLINED_FUNCTION_44((uint64_t)v3);
  sub_217C3F738(v0 + 256, v1, &qword_267BB18B8);
  if (!*(void *)(v2 + 136))
  {
    sub_217C3F828(v1, &qword_267BB18B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_30() & 1) == 0)
  {
LABEL_5:
    OUTLINED_FUNCTION_51();
    return sub_217C38BFC;
  }
  OUTLINED_FUNCTION_9();
  return sub_217C38BFC;
}

void sub_217C38BFC()
{
  OUTLINED_FUNCTION_15();
  if (v4)
  {
    if (v2)
    {
      OUTLINED_FUNCTION_4(v3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_217C5CFF8();
    }
    else
    {
      OUTLINED_FUNCTION_17();
    }
    sub_217C3CEDC(v1, *(void *)(v0 + 152) + 256);
    OUTLINED_FUNCTION_43();
  }
  else
  {
    if (v2)
    {
      OUTLINED_FUNCTION_4(v3);
      sub_217C5CFF8();
    }
    else
    {
      OUTLINED_FUNCTION_17();
    }
    sub_217C3CEDC(v1, *(void *)(v0 + 152) + 256);
  }
  OUTLINED_FUNCTION_31();
  free(v5);
}

double PHPickerConfiguration._peopleConfiguration.getter()
{
  sub_217C3F738(v0 + 296, (uint64_t)v15, &qword_267BB18B8);
  if (v16)
  {
    uint64_t v1 = swift_dynamicCast();
    if (v1)
    {
      *(void *)&double result = OUTLINED_FUNCTION_11(v1, v2, v3, v4, v5, v6, v7, v8, v11, v12, v9, v13, v14).n128_u64[0];
      return result;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)v15, &qword_267BB18B8);
  }
  return OUTLINED_FUNCTION_41();
}

double sub_217C38D74@<D0>(uint64_t a1@<X8>)
{
  return sub_217C38D8C((void (*)(_OWORD *__return_ptr))PHPickerConfiguration._peopleConfiguration.getter, a1);
}

double sub_217C38D8C@<D0>(void (*a1)(_OWORD *__return_ptr)@<X3>, uint64_t a2@<X8>)
{
  a1(v6);
  uint64_t v3 = v8;
  long long v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  double result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  *(void *)(a2 + 48) = v3;
  return result;
}

uint64_t sub_217C38DDC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_217C38DF4(a1, a2, a3, a4, PHPickerConfiguration._peopleConfiguration.setter);
}

uint64_t sub_217C38DF4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *))
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  v13[0] = *a1;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v9;
  v13[5] = v10;
  v13[6] = v11;
  sub_217C3F68C(v13[0]);
  return a5(v13);
}

uint64_t PHPickerConfiguration._peopleConfiguration.setter(void *a1)
{
  if (*a1)
  {
    OUTLINED_FUNCTION_10();
    sub_217C5CFF8();
  }
  else
  {
    uint64_t v4 = 0;
    memset(v3, 0, sizeof(v3));
  }
  return sub_217C3CEDC((uint64_t)v3, v1 + 296);
}

void (*PHPickerConfiguration._peopleConfiguration.modify())()
{
  uint64_t v3 = malloc(0xA0uLL);
  OUTLINED_FUNCTION_44((uint64_t)v3);
  sub_217C3F738(v0 + 296, v1, &qword_267BB18B8);
  if (!*(void *)(v2 + 136))
  {
    sub_217C3F828(v1, &qword_267BB18B8);
    goto LABEL_5;
  }
  if ((OUTLINED_FUNCTION_30() & 1) == 0)
  {
LABEL_5:
    OUTLINED_FUNCTION_51();
    return sub_217C38F58;
  }
  OUTLINED_FUNCTION_9();
  return sub_217C38F58;
}

void sub_217C38F58()
{
  OUTLINED_FUNCTION_15();
  if (v4)
  {
    if (v2)
    {
      OUTLINED_FUNCTION_4(v3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_217C5CFF8();
    }
    else
    {
      OUTLINED_FUNCTION_17();
    }
    sub_217C3CEDC(v1, *(void *)(v0 + 152) + 296);
    OUTLINED_FUNCTION_43();
  }
  else
  {
    if (v2)
    {
      OUTLINED_FUNCTION_4(v3);
      sub_217C5CFF8();
    }
    else
    {
      OUTLINED_FUNCTION_17();
    }
    sub_217C3CEDC(v1, *(void *)(v0 + 152) + 296);
  }
  OUTLINED_FUNCTION_31();
  free(v5);
}

uint64_t PHPickerConfiguration._followupPeopleConfigurations.getter()
{
  uint64_t result = *(void *)(v0 + 336);
  if (result) {
    return sub_217C39104(result);
  }
  return result;
}

uint64_t sub_217C3905C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._followupPeopleConfigurations.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C39088()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return PHPickerConfiguration._followupPeopleConfigurations.setter(v0);
}

uint64_t PHPickerConfiguration._followupPeopleConfigurations.setter(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = sub_217C39284(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 336) = v2;
  return result;
}

uint64_t sub_217C39104(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v16 = MEMORY[0x263F8EE78];
  sub_217C3D170(0, v2, 0);
  uint64_t v3 = v16;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 40)
    {
      sub_217C3F884(i, (uint64_t)v15);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_217C3D170(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v16;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_217C3D170((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v16;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 56 * v6;
      *(_OWORD *)(v7 + 32) = v9;
      *(void *)(v7 + 48) = v10;
      *(void *)(v7 + 56) = v11;
      *(void *)(v7 + 64) = v12;
      *(unsigned char *)(v7 + 72) = v13 & 1;
      *(void *)(v7 + 80) = v14;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    sub_217C3D060(0);
    return 0;
  }
  return v3;
}

uint64_t sub_217C39284(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    sub_217C3D190(0, v1, 0);
    uint64_t v2 = v12;
    uint64_t v4 = a1 + 80;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_217C3D190(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v12;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_217C3D190((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v12;
      }
      v4 += 56;
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = v2 + 40 * v6;
      *(void *)(v7 + 64) = v11;
      *(_OWORD *)(v7 + 32) = v9;
      *(_OWORD *)(v7 + 48) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_217C393F8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_217C3D1D0(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AB8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_217C3D1D0(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_217C3D1D0((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      sub_217C3D7EC(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t (*PHPickerConfiguration._followupPeopleConfigurations.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = *(void *)(v1 + 336);
  if (v3) {
    uint64_t v3 = sub_217C39104(v3);
  }
  *a1 = v3;
  return sub_217C39574;
}

uint64_t sub_217C39574(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = swift_bridgeObjectRetain();
      uint64_t v5 = sub_217C39284(v4);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v7 = a1[1];
    swift_bridgeObjectRelease();
    *(void *)(v7 + 336) = v5;
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (v3)
    {
      uint64_t v6 = sub_217C39284(*a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v9 = a1[1];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v9 + 336) = v6;
  }
  return result;
}

uint64_t PHPickerConfiguration._excludedCollections.getter()
{
  return *(void *)(*(void *)(v0 + 144) + 40);
}

uint64_t sub_217C39638@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._excludedCollections.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C39664(uint64_t *a1)
{
  return PHPickerConfiguration._excludedCollections.setter(*a1);
}

uint64_t PHPickerConfiguration._excludedCollections.setter(uint64_t result)
{
  *(void *)(*(void *)(v1 + 144) + 40) = result;
  return result;
}

void *(*PHPickerConfiguration._excludedCollections.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 40);
  return sub_217C396C8;
}

void *sub_217C396C8(void *result)
{
  *(void *)(*(void *)(result[1] + 144) + 40) = *result;
  return result;
}

uint64_t PHPickerConfiguration._desiredCollectionSuggestions.getter()
{
  return *(void *)(*(void *)(v0 + 144) + 48);
}

uint64_t sub_217C396E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._desiredCollectionSuggestions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C39710(uint64_t *a1)
{
  return PHPickerConfiguration._desiredCollectionSuggestions.setter(*a1);
}

uint64_t PHPickerConfiguration._desiredCollectionSuggestions.setter(uint64_t result)
{
  *(void *)(*(void *)(v1 + 144) + 48) = result;
  return result;
}

void *(*PHPickerConfiguration._desiredCollectionSuggestions.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 48);
  return sub_217C39774;
}

void *sub_217C39774(void *result)
{
  *(void *)(*(void *)(result[1] + 144) + 48) = *result;
  return result;
}

void PHPickerConfiguration.init(photoLibraryAndOnlyReturnsIdentifiers:)(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_217C60430;
  *(unsigned char *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 49) = 2;
  type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes();
  uint64_t v2 = OUTLINED_FUNCTION_12();
  v3.n128_f64[0] = OUTLINED_FUNCTION_7(v2);
  *(_WORD *)(a1 + 248) = 514;
  *(unsigned char *)(a1 + 250) = 2;
  OUTLINED_FUNCTION_29(v3);
  *(unsigned char *)(a1 + 48) = 1;
}

void PHPickerConfiguration.init(photoLibraryAndOnlyForOpenPanel:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a2;
  *(unsigned char *)a2 = 0;
  *(_OWORD *)(a2 + 8) = xmmword_217C60430;
  *(unsigned char *)(a2 + 24) = 1;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 48) = 2;
  type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes();
  *(_OWORD *)(v3 + 56) = 0u;
  v3 += 56;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(void *)(v3 + 80) = 0;
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(void *)(v4 + 48) = 0;
  *(void *)(v3 + 88) = v4;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_WORD *)(v3 + 192) = 514;
  *(unsigned char *)(v3 + 194) = 2;
  *(_OWORD *)(v3 + 200) = 0u;
  *(_OWORD *)(v3 + 216) = 0u;
  *(_OWORD *)(v3 + 232) = 0u;
  *(_OWORD *)(v3 + 248) = 0u;
  *(_OWORD *)(v3 + 264) = 0u;
  *(void *)(v3 + 280) = 0;
  *(void *)(v3 - 16) = a1;
  *(unsigned char *)(v3 - 7) = 1;
  sub_217C3CE90();
  id v5 = a1;
  sub_217C5CFF8();
  sub_217C3CEDC((uint64_t)v7, v3);
  uint64_t v6 = *(void *)(v3 + 88);
  *(void *)(v6 + 16) = 15;

  *(void *)(v6 + 24) = 15;
}

uint64_t sub_217C39914(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t static PHPickerConfiguration.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2 || *((void *)a1 + 1) != *((void *)a2 + 1)) {
    return 0;
  }
  char v5 = a2[24];
  if (a1[24])
  {
    if (!a2[24]) {
      return 0;
    }
  }
  else
  {
    if (*((void *)a1 + 2) != *((void *)a2 + 2)) {
      char v5 = 1;
    }
    if (v5) {
      return 0;
    }
  }
  uint64_t v6 = (void *)*((void *)a1 + 4);
  uint64_t v7 = (void *)*((void *)a2 + 4);
  if (!v6)
  {
    if (!v7) {
      goto LABEL_15;
    }
    id v10 = 0;
LABEL_20:

    return 0;
  }
  if (!v7)
  {
    id v10 = v6;
    goto LABEL_20;
  }
  sub_217C3F6FC(0, &qword_267BB18B0);
  id v8 = v6;
  id v9 = v7;
  LOBYTE(v2) = sub_217C5CF98();

  if ((v2 & 1) == 0) {
    return 0;
  }
LABEL_15:
  uint64_t v11 = (void *)*((void *)a1 + 5);
  uint64_t v12 = (void *)*((void *)a2 + 5);
  if (v11)
  {
    if (!v12) {
      return 0;
    }
    sub_217C3F6FC(0, &qword_267BB18B0);
    id v13 = v12;
    id v14 = v11;
    LOBYTE(v2) = sub_217C5CF98();

    if ((v2 & 1) == 0) {
      return 0;
    }
  }
  else if (v12)
  {
    return 0;
  }
  if (a1[48] == 2)
  {
    if (a2[48] != 2) {
      return 0;
    }
  }
  else
  {
    uint64_t result = OUTLINED_FUNCTION_13();
    if (v16 == 2 || ((v17 ^ v16) & 1) == 0) {
      return result;
    }
  }
  if (a1[49] == 2)
  {
    if (a2[49] != 2) {
      return 0;
    }
  }
  else
  {
    uint64_t result = OUTLINED_FUNCTION_13();
    if (v18 == 2 || ((v19 ^ v18) & 1) == 0) {
      return result;
    }
  }
  OUTLINED_FUNCTION_25((uint64_t)(a1 + 56));
  uint64_t v20 = OUTLINED_FUNCTION_24((uint64_t)(a2 + 56));
  OUTLINED_FUNCTION_2(v20, v21, v22, v23, v24, v25, v26, v27, v222, v235);
  uint64_t v28 = OUTLINED_FUNCTION_6();
  if (v244)
  {
    OUTLINED_FUNCTION_18(v28, v29, &qword_267BB18B8, v30, v31, v32, v33, v34);
    if (!v245) {
      goto LABEL_98;
    }
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_26(v35, v36, v37, v38, v39, v40, v41, v42, v223);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_23();
    uint64_t v43 = sub_217C3D100((uint64_t)v242);
    OUTLINED_FUNCTION_19(v43, v44, v45, v46, v47, v48, v49, v50, v224, v236);
    if ((v2 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t v2 = &qword_267BB18B8;
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_22();
    if (v245) {
      goto LABEL_99;
    }
    sub_217C3F828((uint64_t)v243, &qword_267BB18B8);
  }
  v51 = (void *)*((void *)a1 + 12);
  v52 = (void *)*((void *)a2 + 12);
  if (v51)
  {
    if (!v52 || (sub_217C3B8B8(v51, v52) & 1) == 0) {
      return 0;
    }
  }
  else if (v52)
  {
    return 0;
  }
  OUTLINED_FUNCTION_25((uint64_t)(a1 + 104));
  uint64_t v53 = OUTLINED_FUNCTION_24((uint64_t)(a2 + 104));
  OUTLINED_FUNCTION_2(v53, v54, v55, v56, v57, v58, v59, v60, v223, v236);
  uint64_t v61 = OUTLINED_FUNCTION_6();
  if (v244)
  {
    OUTLINED_FUNCTION_18(v61, v62, &qword_267BB18B8, v63, v64, v65, v66, v67);
    if (!v245) {
      goto LABEL_98;
    }
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_26(v68, v69, v70, v71, v72, v73, v74, v75, v225);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_23();
    uint64_t v76 = sub_217C3D100((uint64_t)v242);
    OUTLINED_FUNCTION_19(v76, v77, v78, v79, v80, v81, v82, v83, v226, v237);
    if ((v2 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_22();
    if (v245) {
      goto LABEL_99;
    }
    sub_217C3F828((uint64_t)v243, &qword_267BB18B8);
  }
  LOBYTE(v84) = type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes();
  if (!sub_217C39FC4(*((void **)a1 + 18), *((void **)a2 + 18))) {
    return 0;
  }
  OUTLINED_FUNCTION_25((uint64_t)(a1 + 152));
  uint64_t v85 = OUTLINED_FUNCTION_24((uint64_t)(a2 + 152));
  OUTLINED_FUNCTION_2(v85, v86, v87, v88, v89, v90, v91, v92, v225, v237);
  uint64_t v93 = OUTLINED_FUNCTION_6();
  if (v244)
  {
    OUTLINED_FUNCTION_18(v93, v94, &qword_267BB18B8, v95, v96, v97, v98, v99);
    if (!v245) {
      goto LABEL_98;
    }
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_26(v100, v101, v102, v103, v104, v105, v106, v107, v227);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_23();
    uint64_t v108 = sub_217C3D100((uint64_t)v242);
    OUTLINED_FUNCTION_19(v108, v109, v110, v111, v112, v113, v114, v115, v228, v238);
    if ((v84 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    v84 = &qword_267BB18B8;
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_22();
    if (v245) {
      goto LABEL_99;
    }
    sub_217C3F828((uint64_t)v243, &qword_267BB18B8);
  }
  OUTLINED_FUNCTION_25((uint64_t)(a1 + 192));
  uint64_t v116 = OUTLINED_FUNCTION_24((uint64_t)(a2 + 192));
  OUTLINED_FUNCTION_2(v116, v117, v118, v119, v120, v121, v122, v123, v227, v238);
  uint64_t v124 = OUTLINED_FUNCTION_6();
  if (v244)
  {
    OUTLINED_FUNCTION_18(v124, v125, &qword_267BB18B8, v126, v127, v128, v129, v130);
    if (!v245) {
      goto LABEL_98;
    }
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_26(v131, v132, v133, v134, v135, v136, v137, v138, v229);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_23();
    uint64_t v139 = sub_217C3D100((uint64_t)v242);
    OUTLINED_FUNCTION_19(v139, v140, v141, v142, v143, v144, v145, v146, v230, v239);
    if ((v84 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    v84 = &qword_267BB18B8;
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_22();
    if (v245) {
      goto LABEL_99;
    }
    sub_217C3F828((uint64_t)v243, &qword_267BB18B8);
  }
  uint64_t v147 = *((void *)a1 + 30);
  uint64_t v148 = *((void *)a2 + 30);
  if (v147)
  {
    if (!v148) {
      return 0;
    }
    if (*((void *)a1 + 29) != *((void *)a2 + 29) || v147 != v148)
    {
      char v150 = sub_217C5D078();
      uint64_t result = 0;
      if ((v150 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v148)
  {
    return 0;
  }
  if (a1[248] == 2)
  {
    if (a2[248] != 2) {
      return 0;
    }
  }
  else
  {
    uint64_t result = OUTLINED_FUNCTION_13();
    if (v151 == 2 || ((v152 ^ v151) & 1) == 0) {
      return result;
    }
  }
  if (a1[249] == 2)
  {
    if (a2[249] != 2) {
      return 0;
    }
  }
  else
  {
    uint64_t result = OUTLINED_FUNCTION_13();
    if (v153 == 2 || ((v154 ^ v153) & 1) == 0) {
      return result;
    }
  }
  if (a1[250] == 2)
  {
    if (a2[250] != 2) {
      return 0;
    }
    goto LABEL_88;
  }
  uint64_t result = OUTLINED_FUNCTION_13();
  if (v155 != 2 && ((v156 ^ v155) & 1) != 0)
  {
LABEL_88:
    OUTLINED_FUNCTION_25((uint64_t)(a1 + 256));
    uint64_t v157 = OUTLINED_FUNCTION_24((uint64_t)(a2 + 256));
    OUTLINED_FUNCTION_2(v157, v158, v159, v160, v161, v162, v163, v164, v229, v239);
    uint64_t v165 = OUTLINED_FUNCTION_6();
    if (!v244)
    {
      v84 = &qword_267BB18B8;
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_22();
      if (v245) {
        goto LABEL_99;
      }
      sub_217C3F828((uint64_t)v243, &qword_267BB18B8);
      goto LABEL_94;
    }
    OUTLINED_FUNCTION_18(v165, v166, &qword_267BB18B8, v167, v168, v169, v170, v171);
    if (v245)
    {
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_26(v172, v173, v174, v175, v176, v177, v178, v179, v231);
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_23();
      uint64_t v180 = sub_217C3D100((uint64_t)v242);
      OUTLINED_FUNCTION_19(v180, v181, v182, v183, v184, v185, v186, v187, v232, v240);
      if ((v84 & 1) == 0) {
        return 0;
      }
LABEL_94:
      OUTLINED_FUNCTION_25((uint64_t)(a1 + 296));
      uint64_t v188 = OUTLINED_FUNCTION_24((uint64_t)(a2 + 296));
      OUTLINED_FUNCTION_2(v188, v189, v190, v191, v192, v193, v194, v195, v231, v240);
      uint64_t v196 = OUTLINED_FUNCTION_6();
      if (v244)
      {
        OUTLINED_FUNCTION_18(v196, v197, &qword_267BB18B8, v198, v199, v200, v201, v202);
        if (v245)
        {
          OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_26(v203, v204, v205, v206, v207, v208, v209, v210, v233);
          OUTLINED_FUNCTION_21();
          OUTLINED_FUNCTION_23();
          uint64_t v211 = sub_217C3D100((uint64_t)v242);
          OUTLINED_FUNCTION_19(v211, v212, v213, v214, v215, v216, v217, v218, v234, v241);
          if ((v84 & 1) == 0) {
            return 0;
          }
          goto LABEL_102;
        }
        goto LABEL_98;
      }
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_22();
      if (!v245)
      {
        sub_217C3F828((uint64_t)v243, &qword_267BB18B8);
LABEL_102:
        uint64_t v219 = *((void *)a2 + 42);
        if (*((void *)a1 + 42))
        {
          if (!v219) {
            return 0;
          }
          swift_bridgeObjectRetain();
          uint64_t v220 = swift_bridgeObjectRetain();
          char v221 = sub_217C3B988(v220, v219);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (v221 & 1) != 0;
        }
        return !v219;
      }
LABEL_99:
      sub_217C3F828((uint64_t)v243, &qword_267BB18E8);
      return 0;
    }
LABEL_98:
    sub_217C3F828((uint64_t)v246, &qword_267BB18B8);
    sub_217C3F828((uint64_t)v247, &qword_267BB18B8);
    sub_217C3D100((uint64_t)v242);
    goto LABEL_99;
  }
  return result;
}

BOOL sub_217C39FC4(void *a1, void *a2)
{
  return a1[2] == a2[2] && a1[3] == a2[3] && a1[4] == a2[4] && a1[5] == a2[5] && a1[6] == a2[6];
}

uint64_t PHPickerConfiguration.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_217C5D098();
  sub_217C5D098();
  if (*(unsigned char *)(v1 + 24) == 1)
  {
    OUTLINED_FUNCTION_5();
  }
  else
  {
    OUTLINED_FUNCTION_3();
    sub_217C5D098();
  }
  uint64_t v4 = *(void **)(v1 + 32);
  if (v4)
  {
    OUTLINED_FUNCTION_3();
    id v5 = v4;
    sub_217C5CFA8();
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  uint64_t v6 = *(void **)(v2 + 40);
  if (v6)
  {
    OUTLINED_FUNCTION_3();
    id v7 = v6;
    sub_217C5CFA8();
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  if (*(unsigned char *)(v2 + 48) != 2) {
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_34();
  if (*(unsigned char *)(v2 + 49) != 2) {
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_34();
  sub_217C3F738(v2 + 56, (uint64_t)v12, &qword_267BB18B8);
  if (v13)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_28();
    sub_217C3D100((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  uint64_t v8 = *(void *)(v2 + 96);
  if (v8)
  {
    OUTLINED_FUNCTION_3();
    swift_bridgeObjectRetain();
    sub_217C3D69C(a1, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  sub_217C3F738(v2 + 104, (uint64_t)v12, &qword_267BB18B8);
  if (v13)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_28();
    sub_217C3D100((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  sub_217C3C5CC();
  sub_217C3F738(v2 + 152, (uint64_t)v12, &qword_267BB18B8);
  if (v13)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_28();
    sub_217C3D100((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  sub_217C3F738(v2 + 192, (uint64_t)v12, &qword_267BB18B8);
  if (v13)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_28();
    sub_217C3D100((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  if (*(void *)(v2 + 240))
  {
    OUTLINED_FUNCTION_3();
    swift_bridgeObjectRetain();
    sub_217C5CF58();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  if (*(unsigned char *)(v2 + 248) != 2) {
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_34();
  if (*(unsigned char *)(v2 + 249) != 2) {
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_34();
  if (*(unsigned char *)(v2 + 250) != 2) {
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_34();
  sub_217C3F738(v2 + 256, (uint64_t)v12, &qword_267BB18B8);
  if (v13)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_28();
    sub_217C3D100((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  sub_217C3F738(v2 + 296, (uint64_t)v12, &qword_267BB18B8);
  if (v13)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_28();
    sub_217C3D100((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_5();
  }
  uint64_t v9 = *(void *)(v2 + 336);
  if (!v9) {
    return OUTLINED_FUNCTION_5();
  }
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRetain();
  sub_217C3D714(a1, v9);
  return swift_bridgeObjectRelease();
}

uint64_t PHPickerConfiguration.hashValue.getter()
{
  OUTLINED_FUNCTION_14();
  PHPickerConfiguration.hash(into:)((uint64_t)v1);
  return sub_217C5D0B8();
}

uint64_t sub_217C3A3A4()
{
  sub_217C5D088();
  PHPickerConfiguration.hash(into:)((uint64_t)v1);
  return sub_217C5D0B8();
}

id PHPickerResult.itemProvider.getter()
{
  return *v0;
}

uint64_t PHPickerResult.assetIdentifier.getter()
{
  return sub_217C3D640(*(void **)(v0 + 8), (SEL *)&selRef_assetIdentifier);
}

uint64_t PHPickerResult.itemIdentifier.getter()
{
  return sub_217C3D640(*(void **)(v0 + 8), (SEL *)&selRef_itemIdentifier);
}

void PHPickerResult._requestThumbnailImageURL(preferredSize:resultHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = *(void **)(v3 + 8);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  v10[4] = sub_217C3D7A4;
  v10[5] = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_217C3A7C8;
  v10[3] = &block_descriptor;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel__requestThumbnailImageURLForPreferredSize_resultHandler_, a1, v9);
  _Block_release(v9);
}

uint64_t sub_217C3A524(uint64_t a1, void *a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v26 = a4;
  uint64_t v27 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AD0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_217C5CEF8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AD8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  int v16 = (id *)((char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v14);
  int v18 = (char *)&v26 - v17;
  sub_217C3F738(a1, (uint64_t)v8, &qword_267BB1AD0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) != 1)
  {
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v12, v8, v9);
    v20((char *)v16, v12, v9);
LABEL_6:
    swift_storeEnumTagMultiPayload();
    goto LABEL_7;
  }
  sub_217C3F828((uint64_t)v8, &qword_267BB1AD0);
  if (!a2)
  {
    uint64_t v21 = sub_217C5CF48();
    uint64_t v23 = v22;
    id v24 = objc_allocWithZone(MEMORY[0x263F087E8]);
    *int v16 = sub_217C3CA70(v21, v23, -1, 0);
    goto LABEL_6;
  }
  *int v16 = a2;
  swift_storeEnumTagMultiPayload();
  id v19 = a2;
LABEL_7:
  sub_217C3F7C0((uint64_t)v16, (uint64_t)v18);
  v27(v18);
  return sub_217C3F828((uint64_t)v18, &qword_267BB1AD8);
}

uint64_t sub_217C3A7C8(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AD0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_217C5CEE8();
    uint64_t v9 = sub_217C5CEF8();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_217C5CEF8();
    uint64_t v10 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v10, 1, v9);
  swift_retain();
  id v11 = a3;
  v8(v7, a3);
  swift_release();

  return sub_217C3F828((uint64_t)v7, &qword_267BB1AD0);
}

CGRect __swiftcall PHPickerResult._preferredContentsRect(targetSize:)(CGSize targetSize)
{
  objc_msgSend(*(id *)(v1 + 8), sel__preferredContentsRectForTargetSize_, targetSize.width, targetSize.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t PHPickerResult._filePromiseURL(contentType:)@<X0>(uint64_t a1@<X8>)
{
  double v3 = *(void **)(v1 + 8);
  sub_217C5CF08();
  double v4 = (void *)sub_217C5CF28();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel__filePromiseURLForTypeIdentifier_, v4);

  if (v5)
  {
    sub_217C5CEE8();

    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  uint64_t v7 = sub_217C5CEF8();

  return __swift_storeEnumTagSinglePayload(a1, v6, 1, v7);
}

uint64_t static PHPickerResult.== infix(_:_:)()
{
  if (sub_217C5CF98()) {
    return sub_217C5CF98() & 1;
  }
  else {
    return 0;
  }
}

void PHPickerResult.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = *(id *)v0;
  sub_217C5CFA8();

  id v3 = v1;
  OUTLINED_FUNCTION_39();
}

uint64_t PHPickerResult.hashValue.getter()
{
  uint64_t v1 = *v0;
  id v2 = v0[1];
  OUTLINED_FUNCTION_14();
  id v3 = v1;
  OUTLINED_FUNCTION_40();

  id v4 = v2;
  OUTLINED_FUNCTION_40();

  return sub_217C5D0B8();
}

uint64_t sub_217C3AACC()
{
  uint64_t v1 = *(void **)v0;
  id v2 = *(void **)(v0 + 8);
  sub_217C5D088();
  id v3 = v1;
  sub_217C5CFA8();

  id v4 = v2;
  sub_217C5CFA8();

  return sub_217C5D0B8();
}

void PHPickerViewController.configuration.getter(uint64_t a1@<X8>)
{
  if (objc_msgSend(v1, sel__overlayStorage))
  {
    sub_217C5CFB8();
    swift_unknownObjectRelease();
    sub_217C3D7EC(&v4, &v5);
    type metadata accessor for _PHPickerOverlayStorage();
    OUTLINED_FUNCTION_16();
    sub_217C3D820((uint64_t)v3 + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_configuration, a1);
  }
  else
  {
    __break(1u);
  }
}

id PHPickerViewController.delegate.getter()
{
  id result = objc_msgSend(v0, sel__overlayStorage);
  if (result)
  {
    sub_217C5CFB8();
    swift_unknownObjectRelease();
    sub_217C3D7EC(&v3, &v4);
    type metadata accessor for _PHPickerOverlayStorage();
    OUTLINED_FUNCTION_16();
    MEMORY[0x21D45A140](&v2[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate]);

    return (id)OUTLINED_FUNCTION_50();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_217C3AC7C@<X0>(void *a1@<X8>)
{
  id result = PHPickerViewController.delegate.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id sub_217C3ACA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = swift_unknownObjectRetain();
  return PHPickerViewController.delegate.setter(v2, v1);
}

id PHPickerViewController.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id result = objc_msgSend(v3, sel__overlayStorage);
  if (result)
  {
    sub_217C5CFB8();
    swift_unknownObjectRelease();
    sub_217C3D7EC(&v7, &v8);
    type metadata accessor for _PHPickerOverlayStorage();
    OUTLINED_FUNCTION_16();
    *(void *)&v6[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate + 8] = a2;
    swift_unknownObjectWeakAssign();

    return (id)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id (*PHPickerViewController.delegate.modify(id *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  *a1 = PHPickerViewController.delegate.getter();
  a1[1] = v3;
  return sub_217C3ADE4;
}

id sub_217C3ADE4(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  if ((a2 & 1) == 0) {
    return PHPickerViewController.delegate.setter(*a1, v2);
  }
  uint64_t v3 = swift_unknownObjectRetain();
  PHPickerViewController.delegate.setter(v3, v2);

  return (id)swift_unknownObjectRelease();
}

id PHPickerViewController.init(configuration:)(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = sub_217C3AF28();
  id v4 = objc_msgSend(v2, sel_initWithConfiguration_, v3);

  sub_217C3D820(a1, (uint64_t)v9);
  id v5 = objc_allocWithZone((Class)type metadata accessor for _PHPickerOverlayStorage());
  id v6 = v4;
  id v7 = sub_217C3C1F4((uint64_t)v9);
  objc_msgSend(v6, sel_setDelegate_, v7);
  objc_msgSend(v6, sel__setOverlayStorage_, v7);

  sub_217C3D858(a1);
  return v6;
}

id sub_217C3AF28()
{
  uint64_t v1 = v0;
  id v2 = sub_217C3C8CC((uint64_t)v0);
  objc_msgSend(v2, sel_setPreferredAssetRepresentationMode_, *v0);
  sub_217C3F738((uint64_t)(v0 + 56), (uint64_t)&v17, &qword_267BB18B8);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      uint64_t v3 = v19[0];
      goto LABEL_6;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)&v17, &qword_267BB18B8);
  }
  uint64_t v3 = 0;
LABEL_6:
  objc_msgSend(v2, sel_setSelection_, v3);
  objc_msgSend(v2, sel_setSelectionLimit_, *((void *)v0 + 1));
  if (v0[24] == 1) {
    uint64_t v4 = sub_217C5CED8();
  }
  else {
    uint64_t v4 = *((void *)v0 + 2);
  }
  objc_msgSend(v2, sel_setMinimumSelectionLimit_, v4);
  objc_msgSend(v2, sel_setFilter_, *((void *)v0 + 4));
  swift_bridgeObjectRetain();
  id v5 = (void *)sub_217C5CF68();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setPreselectedAssetIdentifiers_, v5);

  sub_217C3F738((uint64_t)(v0 + 104), (uint64_t)&v17, &qword_267BB18B8);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = *(void *)v19;
      goto LABEL_14;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)&v17, &qword_267BB18B8);
  }
  uint64_t v6 = 0;
LABEL_14:
  objc_msgSend(v2, sel_setMode_, v6);
  objc_msgSend(v2, sel__setSourceType_, PHPickerConfiguration._sourceType.getter());
  objc_msgSend(v2, sel__setAlwaysShowLoadingPlaceholder_, v0[248] & 1);
  uint64_t v7 = *((void *)v0 + 18);
  objc_msgSend(v2, sel_setEdgesWithoutContentMargins_, *(void *)(v7 + 16));
  objc_msgSend(v2, sel_setDisabledCapabilities_, *(void *)(v7 + 24));
  sub_217C3F738((uint64_t)(v1 + 152), (uint64_t)&v17, &qword_267BB18B8);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      long long v8 = *(void **)v19;
      goto LABEL_19;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)&v17, &qword_267BB18B8);
  }
  long long v8 = 0;
LABEL_19:
  objc_msgSend(v2, sel_set_suggestionGroup_, v8);

  objc_msgSend(v2, sel__setDisabledPrivateCapabilities_, *(void *)(*((void *)v1 + 18) + 32));
  if (*((void *)v1 + 30))
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)sub_217C5CF28();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_msgSend(v2, sel_set_containerIdentifier_, v9);

  sub_217C3F738((uint64_t)(v1 + 256), (uint64_t)v19, &qword_267BB18B8);
  if (v20)
  {
    if (swift_dynamicCast())
    {
      uint64_t v10 = sub_217C3C6F4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)v19, &qword_267BB18B8);
  }
  uint64_t v10 = 0;
LABEL_27:
  objc_msgSend(v2, sel__setAlbumsConfiguration_, v10);

  sub_217C3F738((uint64_t)(v1 + 296), (uint64_t)v19, &qword_267BB18B8);
  if (v20)
  {
    if (swift_dynamicCast())
    {
      id v11 = sub_217C3C6F4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
  }
  else
  {
    sub_217C3F828((uint64_t)v19, &qword_267BB18B8);
  }
  id v11 = 0;
LABEL_32:
  objc_msgSend(v2, sel__setPeopleConfiguration_, v11);

  uint64_t v12 = *((void *)v1 + 42);
  if (v12)
  {
    uint64_t v13 = sub_217C39104(v12);
    uint64_t v14 = (void *)v13;
    if (v13)
    {
      sub_217C36E48(v13);
      swift_bridgeObjectRelease();
      sub_217C3F6FC(0, &qword_267BB1AC8);
      uint64_t v14 = (void *)sub_217C5CF68();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  objc_msgSend(v2, sel__setFollowupPeopleConfigurations_, v14);

  uint64_t v15 = *((void *)v1 + 18);
  objc_msgSend(v2, sel__setExcludedCollections_, *(void *)(v15 + 40));
  objc_msgSend(v2, sel__setDesiredCollectionSuggestions_, *(void *)(v15 + 48));
  objc_msgSend(v2, sel__setAllowsDownscaling_, v1[249] & 1);
  objc_msgSend(v2, sel__setAllowsEncodingPolicyModification_, (v1[250] == 2) | (v1[250] & 1));
  return v2;
}

Swift::Void __swiftcall PHPickerViewController.updatePicker(using:)(PhotosUI::PHPickerConfiguration::Update *using)
{
  Swift::Int value = using->selectionLimit.value;
  Swift::Bool is_nil = using->selectionLimit.is_nil;
  Swift::Int v4 = using->minimumSelectionLimit.value;
  Swift::Bool v5 = using->minimumSelectionLimit.is_nil;
  Swift::UInt rawValue = using->edgesWithoutContentMargins.value.rawValue;
  Swift::Bool v7 = using->edgesWithoutContentMargins.is_nil;
  id v8 = objc_msgSend(objc_allocWithZone((Class)PHPickerUpdateConfiguration), sel_init);
  if (v7)
  {
    if (is_nil) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(v8, sel_setEdgesWithoutContentMargins_, rawValue);
    if (is_nil)
    {
LABEL_3:
      if (v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  objc_msgSend(v8, sel_setSelectionLimit_, value);
  if (!v5) {
LABEL_4:
  }
    objc_msgSend(v8, sel_setMinimumSelectionLimit_, v4);
LABEL_5:
  objc_msgSend(v1, sel_updatePickerUsingConfiguration_, v8);
}

uint64_t _PHPickerCollectionConfiguration.init(identifiers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)a2 = MEMORY[0x263F8EE78];
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 16) = v2;
  *(unsigned char *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = result;
  return result;
}

void _PHPickerCollectionConfiguration.init()(uint64_t a1@<X8>)
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)a1 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 8) = v1;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = v1;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t _PHPickerCollectionConfiguration.suggestedIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _PHPickerCollectionConfiguration.suggestedIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*_PHPickerCollectionConfiguration.suggestedIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.preselectedIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _PHPickerCollectionConfiguration.preselectedIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*_PHPickerCollectionConfiguration.preselectedIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.disabledIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t _PHPickerCollectionConfiguration.disabledIdentifiers.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*_PHPickerCollectionConfiguration.disabledIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.purpose.getter()
{
  return OUTLINED_FUNCTION_37();
}

uint64_t _PHPickerCollectionConfiguration.purpose.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*_PHPickerCollectionConfiguration.purpose.modify())()
{
  return nullsub_1;
}

uint64_t _PHPickerCollectionConfiguration.allowsEditingCollection.getter()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t _PHPickerCollectionConfiguration.allowsEditingCollection.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*_PHPickerCollectionConfiguration.allowsEditingCollection.modify())()
{
  return nullsub_1;
}

uint64_t static _PHPickerCollectionConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  Swift::Int v4 = *(void **)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(unsigned __int8 *)(a1 + 40);
  Swift::Bool v7 = *(void **)(a2 + 8);
  uint64_t v9 = *(void **)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  int v11 = *(unsigned __int8 *)(a2 + 40);
  uint64_t v15 = *(void **)(a2 + 48);
  int v16 = *(void **)(a1 + 48);
  if ((sub_217C3B8B8(*(void **)a1, *(void **)a2) & 1) == 0
    || (sub_217C3B8B8(v2, v7) & 1) == 0
    || (sub_217C3B8B8(v4, v9) & 1) == 0)
  {
    return 0;
  }
  if (v5)
  {
    if (!v10) {
      return 0;
    }
    if (v3 == v8 && v5 == v10)
    {
      if (v6 != v11) {
        return 0;
      }
      goto LABEL_16;
    }
    char v13 = sub_217C5D078();
    uint64_t result = 0;
    if ((v13 & 1) == 0) {
      return result;
    }
  }
  else
  {
    uint64_t result = 0;
    if (v10) {
      return result;
    }
  }
  if (((v6 ^ v11) & 1) == 0)
  {
LABEL_16:
    if (v16)
    {
      if (v15 && (sub_217C3B8B8(v16, v15) & 1) != 0) {
        return 1;
      }
    }
    else if (!v15)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_217C3B8B8(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    char v7 = sub_217C5D078();
    uint64_t result = 0;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v8 = a2 + 7;
  uint64_t v9 = a1 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v9 - 1);
    if (result != *(v8 - 1) || *v9 != *v8)
    {
      uint64_t result = sub_217C5D078();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_217C3B988(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      uint64_t v5 = v2 - 1;
      do
      {
        sub_217C3F884(v3, (uint64_t)v11);
        sub_217C3F884(v4, (uint64_t)v10);
        char v6 = MEMORY[0x21D459650](v11, v10);
        sub_217C3D100((uint64_t)v10);
        sub_217C3D100((uint64_t)v11);
        BOOL v8 = v5-- != 0;
        if ((v6 & 1) == 0) {
          break;
        }
        v3 += 40;
        v4 += 40;
      }
      while (v8);
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

void _PHPickerCollectionConfiguration.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[6];
  swift_bridgeObjectRetain();
  sub_217C3D69C(a1, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_217C3D69C(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_217C3D69C(a1, v5);
  swift_bridgeObjectRelease();
  sub_217C5D0A8();
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_217C5CF58();
    swift_bridgeObjectRelease();
  }
  sub_217C5D0A8();
  if (v7)
  {
    sub_217C5D0A8();
    swift_bridgeObjectRetain();
    sub_217C3D69C(a1, v7);
    OUTLINED_FUNCTION_31();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_217C5D0A8();
    OUTLINED_FUNCTION_31();
  }
}

uint64_t _PHPickerCollectionConfiguration.hashValue.getter()
{
  uint64_t v1 = *((void *)v0 + 2);
  char v2 = *((unsigned char *)v0 + 40);
  uint64_t v3 = *((void *)v0 + 6);
  long long v6 = *v0;
  uint64_t v7 = v1;
  long long v8 = *(long long *)((char *)v0 + 24);
  char v9 = v2;
  uint64_t v10 = v3;
  OUTLINED_FUNCTION_14();
  _PHPickerCollectionConfiguration.hash(into:)((uint64_t)v5);
  return sub_217C5D0B8();
}

uint64_t sub_217C3BBF4()
{
  uint64_t v1 = *((void *)v0 + 2);
  char v2 = *((unsigned char *)v0 + 40);
  uint64_t v3 = *((void *)v0 + 6);
  long long v6 = *v0;
  uint64_t v7 = v1;
  long long v8 = *(long long *)((char *)v0 + 24);
  char v9 = v2;
  uint64_t v10 = v3;
  sub_217C5D088();
  _PHPickerCollectionConfiguration.hash(into:)((uint64_t)v5);
  return sub_217C5D0B8();
}

id sub_217C3BC5C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_wallpaperSuggestionGroup, &qword_267BB1810);
}

id static _PHPickerSuggestionGroup.wallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1808, (void **)&qword_267BB1810, a1);
}

id sub_217C3BC9C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_shuffleWallpaperSuggestionGroup, &qword_267BB1820);
}

id static _PHPickerSuggestionGroup.shuffleWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1818, (void **)&qword_267BB1820, a1);
}

id sub_217C3BCDC(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_portraitWallpaperSuggestionGroup, &qword_267BB1830);
}

id static _PHPickerSuggestionGroup.portraitWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1828, (void **)&qword_267BB1830, a1);
}

id sub_217C3BD1C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_livePhotoWallpaperSuggestionGroup, &qword_267BB1840);
}

id static _PHPickerSuggestionGroup.livePhotoWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1838, (void **)&qword_267BB1840, a1);
}

id sub_217C3BD5C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_deviceOwnerSuggestionGroup, &qword_267BB1850);
}

id static _PHPickerSuggestionGroup.deviceOwner.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1848, (void **)&qword_267BB1850, a1);
}

id sub_217C3BD9C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_stickersSuggestionGroup, &qword_267BB1860);
}

id static _PHPickerSuggestionGroup.stickers.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1858, (void **)&qword_267BB1860, a1);
}

id sub_217C3BDDC(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_retailExperienceSuggestionGroup, &qword_267BB1870);
}

id static _PHPickerSuggestionGroup.retailExperience.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1868, (void **)&qword_267BB1870, a1);
}

id sub_217C3BE1C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_watchWallpaperSuggestionGroup, &qword_267BB1880);
}

id static _PHPickerSuggestionGroup.watchWallpaper.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1878, (void **)&qword_267BB1880, a1);
}

id sub_217C3BE5C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_generativeSuggestionGroup, &qword_267BB1890);
}

id static _PHPickerSuggestionGroup.generative.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1888, (void **)&qword_267BB1890, a1);
}

id sub_217C3BE9C(uint64_t a1)
{
  return sub_217C3BEB8(a1, (uint64_t)&off_2642C4CA8, (SEL *)&selRef_styleabilitySuggestionGroup, &qword_267BB18A0);
}

id sub_217C3BEB8(uint64_t a1, uint64_t a2, SEL *a3, void *a4)
{
  id result = [self *a3];
  *a4 = result;
  return result;
}

id static _PHPickerSuggestionGroup.styleability.getter@<X0>(void **a1@<X8>)
{
  return sub_217C3BF1C(&qword_267BB1898, (void **)&qword_267BB18A0, a1);
}

id sub_217C3BF1C@<X0>(void *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = *a2;
  *a3 = *a2;

  return v5;
}

void static _PHPickerSuggestionGroup.assetCollection(identifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)(char a1@<W2>, char a2@<W3>, void *a3@<X8>)
{
  long long v6 = self;
  uint64_t v7 = (void *)sub_217C5CF28();
  id v8 = objc_msgSend(v6, sel_assetCollectionSuggestionGroup_extendedCuratedAssetsOnly_shouldReverseSortOrder_, v7, a1 & 1, a2 & 1);

  *a3 = v8;
}

uint64_t _s8PhotosUI14PHPickerFilterV2eeoiySbAC_ACtFZ_0()
{
  return sub_217C5CF98() & 1;
}

uint64_t _s8PhotosUI14PHPickerFilterV9hashValueSivg_0()
{
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_14();
  id v2 = v1;
  OUTLINED_FUNCTION_40();

  return sub_217C5D0B8();
}

uint64_t sub_217C3C098()
{
  uint64_t v1 = *v0;
  sub_217C5D088();
  id v2 = v1;
  OUTLINED_FUNCTION_40();

  return sub_217C5D0B8();
}

uint64_t sub_217C3C0E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._edgesWithoutContentMargins.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C3C10C(void *a1)
{
  return PHPickerConfiguration._edgesWithoutContentMargins.setter(*a1);
}

void *(*PHPickerConfiguration._edgesWithoutContentMargins.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 16);
  return j__OUTLINED_FUNCTION_33;
}

uint64_t sub_217C3C16C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PHPickerConfiguration._disabledFeatures.getter();
  *a1 = result;
  return result;
}

uint64_t sub_217C3C198(void *a1)
{
  return PHPickerConfiguration._disabledFeatures.setter(*a1);
}

void *(*PHPickerConfiguration._disabledFeatures.modify(void *a1))(void *result)
{
  a1[1] = v1;
  *a1 = *(void *)(*(void *)(v1 + 144) + 24);
  return j__OUTLINED_FUNCTION_32;
}

id sub_217C3C1F4(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_217C3D820(a1, (uint64_t)&v1[OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_configuration]);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _PHPickerOverlayStorage();
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  sub_217C3D858(a1);
  return v3;
}

char *sub_217C3C274(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC8PhotosUIP33_E2E20DF4EAC1FCE07E5336962A6E0BEF23_PHPickerOverlayStorage_delegate;
  uint64_t result = (char *)MEMORY[0x21D45A140](v5);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)(v5 + 8);
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_217C5D068();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v10 = MEMORY[0x263F8EE78];
    if (v9)
    {
      uint64_t v22 = MEMORY[0x263F8EE78];
      uint64_t result = sub_217C3D1B0(0, v9 & ~(v9 >> 63), 0);
      if (v9 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v19 = v8;
      uint64_t v20 = a1;
      uint64_t v21 = v7;
      uint64_t v11 = 0;
      uint64_t v10 = v22;
      do
      {
        if ((a2 & 0xC000000000000001) != 0) {
          id v12 = (id)MEMORY[0x21D459680](v11, a2);
        }
        else {
          id v12 = *(id *)(a2 + 8 * v11 + 32);
        }
        id v13 = v12;
        id v14 = objc_msgSend(v12, sel_itemProvider, v19, v20, v21);
        unint64_t v16 = *(void *)(v22 + 16);
        unint64_t v15 = *(void *)(v22 + 24);
        if (v16 >= v15 >> 1) {
          sub_217C3D1B0((char *)(v15 > 1), v16 + 1, 1);
        }
        ++v11;
        *(void *)(v22 + 16) = v16 + 1;
        uint64_t v17 = v22 + 16 * v16;
        *(void *)(v17 + 32) = v14;
        *(void *)(v17 + 40) = v13;
      }
      while (v9 != v11);
      a1 = v20;
      uint64_t v8 = v19;
    }
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(a1, v10, ObjectType, v8);
    swift_bridgeObjectRelease();
    return (char *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_217C3C4F4()
{
}

id sub_217C3C548()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PHPickerOverlayStorage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_217C3C5CC()
{
  return sub_217C5D098();
}

uint64_t sub_217C3C610()
{
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_217C3C620()
{
  return sub_217C5D0B8();
}

BOOL sub_217C3C660(void **a1, void **a2)
{
  return sub_217C39FC4(*a1, *a2);
}

uint64_t sub_217C3C66C()
{
  return sub_217C3C620();
}

uint64_t sub_217C3C690()
{
  return sub_217C3C5CC();
}

uint64_t sub_217C3C6B4()
{
  return sub_217C5D0B8();
}

void *sub_217C3C6F4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 40);
  if (*(void *)(v0 + 48))
  {
    sub_217C3F6FC(0, &qword_267BB1AC8);
    swift_bridgeObjectRetain();
    id v3 = sub_217C3C858();
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)_PHPickerCollectionConfiguration), sel_init);
  }
  uint64_t v4 = v3;
  uint64_t v5 = (void *)sub_217C5CF68();
  objc_msgSend(v4, sel_setSuggestedIdentifiers_, v5);

  long long v6 = (void *)sub_217C5CF68();
  objc_msgSend(v4, sel_setPreselectedIdentifiers_, v6);

  uint64_t v7 = (void *)sub_217C5CF68();
  objc_msgSend(v4, sel_setDisabledIdentifiers_, v7);

  if (v1) {
    uint64_t v8 = (void *)sub_217C5CF28();
  }
  else {
    uint64_t v8 = 0;
  }
  objc_msgSend(v4, sel_setPurpose_, v8);

  objc_msgSend(v4, sel_setAllowsEditingCollection_, v2);
  return v4;
}

id sub_217C3C858()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_217C5CF68();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithIdentifiers_, v1);

  return v2;
}

id sub_217C3C8CC(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    self;
    if (swift_dynamicCastObjCClass() && (*(unsigned char *)(a1 + 48) & 1) != 0)
    {
      id v3 = objc_allocWithZone((Class)PHPickerConfiguration);
      uint64_t v4 = sel_initWithPhotoLibraryAndOnlyReturnsIdentifiers_;
      goto LABEL_12;
    }
    self;
    if (swift_dynamicCastObjCClass())
    {
      char v2 = *(unsigned char *)(a1 + 49);
      id v3 = objc_allocWithZone((Class)PHPickerConfiguration);
      if (v2) {
        uint64_t v4 = sel_initWithPhotoLibraryAndOnlyForOpenPanel_;
      }
      else {
        uint64_t v4 = sel_initWithPhotoLibrary_;
      }
LABEL_12:
      return [v3 v4];
    }
  }
  id v3 = objc_allocWithZone((Class)PHPickerConfiguration);
  uint64_t v4 = sel_init;

  return [v3 v4];
}

uint64_t sub_217C3C9D0()
{
  return sub_217C5D0B8();
}

uint64_t sub_217C3CA08()
{
  return sub_217C5D098();
}

uint64_t sub_217C3CA34()
{
  return sub_217C5D0B8();
}

id sub_217C3CA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)sub_217C5CF28();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v8 = (void *)sub_217C5CF18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

void sub_217C3CB20(uint64_t a1@<X8>)
{
  sub_217C3CB54();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_217C3CB5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_217C3CB88()
{
  return sub_217C3C9D0();
}

uint64_t sub_217C3CBA4()
{
  return sub_217C3CA08();
}

uint64_t sub_217C3CBAC()
{
  return sub_217C3CA34();
}

uint64_t sub_217C3CBC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_217C3CBF0();
  *a1 = result;
  return result;
}

uint64_t sub_217C3CBF0()
{
  return 0;
}

uint64_t sub_217C3CBF8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217C3CC28(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_217C3CC28(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_217C3CC30@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217C3CC60(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_217C3CC60(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_217C3CC68@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217C3CC98(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_217C3CC98(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_217C3CCA0(void *a1, uint64_t *a2)
{
  return sub_217C3CCA8(a1, *a2);
}

BOOL sub_217C3CCA8(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_217C3CCD4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_217C3CD08(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_217C3CD08(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_217C3CD2C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_217C3CD60(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_217C3CD60(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_217C3CD78(uint64_t *a1)
{
  return sub_217C3CD80(*a1);
}

uint64_t sub_217C3CD80(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_217C3CD90(uint64_t *a1)
{
  return sub_217C3CD98(*a1);
}

uint64_t sub_217C3CD98(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_217C3CDA8(uint64_t *a1)
{
  return sub_217C3CDB0(*a1);
}

uint64_t sub_217C3CDB0(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_217C3CDC0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217C3CDF0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_217C3CDF0(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_217C3CDF8(uint64_t *a1)
{
  return sub_217C3CE04(*a1, *v1);
}

BOOL sub_217C3CE04(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_217C3CE10(uint64_t *a1)
{
  return sub_217C3CE1C(*a1, *v1);
}

BOOL sub_217C3CE1C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_217C3CE28(uint64_t *a1)
{
  return sub_217C3CE34(*a1, *v1);
}

BOOL sub_217C3CE34(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_217C3CE40()
{
  return sub_217C3CE48(*v0);
}

BOOL sub_217C3CE48(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_217C3CE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_217C3CE6C(uint64_t *a1)
{
  return sub_217C3CE74(*a1);
}

uint64_t sub_217C3CE74(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

BOOL sub_217C3CE84(uint64_t *a1, uint64_t *a2)
{
  return sub_217C36980(*a1, *a2);
}

unint64_t sub_217C3CE90()
{
  unint64_t result = qword_267BB18C0;
  if (!qword_267BB18C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB18C0);
  }
  return result;
}

uint64_t sub_217C3CEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB18B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_217C3CF44()
{
  unint64_t result = qword_267BB18C8;
  if (!qword_267BB18C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB18C8);
  }
  return result;
}

uint64_t type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes()
{
  return self;
}

unint64_t sub_217C3CFB4()
{
  unint64_t result = qword_267BB18D0;
  if (!qword_267BB18D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB18D0);
  }
  return result;
}

void type metadata accessor for _PHPickerSourceType(uint64_t a1)
{
}

unint64_t sub_217C3D014()
{
  unint64_t result = qword_267BB18E0;
  if (!qword_267BB18E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB18E0);
  }
  return result;
}

uint64_t sub_217C3D060(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_217C3D0CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_217C39914(a1);
  *a2 = result;
  return result;
}

void *sub_217C3D0F4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_217C3D100(uint64_t a1)
{
  return a1;
}

void *sub_217C3D154@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_217C3D164(void *a1@<X8>)
{
  *a1 = *v1;
}

char *sub_217C3D170(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217C3D1F0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_217C3D190(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217C3D300(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_217C3D1B0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217C3D410(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_217C3D1D0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_217C3D510(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_217C3D1F0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AE8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[56 * v8] <= v12) {
      memmove(v12, v13, 56 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_217C3D300(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AE0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_217C3D410(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AA8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_217C3D510(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AC0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_217C3D614(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[8 * a2] <= __dst) {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_217C3D640(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_217C5CF48();
  }
  return OUTLINED_FUNCTION_37();
}

uint64_t sub_217C3D69C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_217C5D098();
  if (v3)
  {
    uint64_t v5 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_217C5CF58();
      uint64_t result = swift_bridgeObjectRelease();
      v5 += 16;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_217C3D714(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_217C5D098();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    do
    {
      uint64_t result = sub_217C5CFE8();
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_217C3D76C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_217C3D7A4(uint64_t a1, void *a2)
{
  return sub_217C3A524(a1, a2, *(void (**)(char *))(v2 + 16), *(void *)(v2 + 24));
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

_OWORD *sub_217C3D7EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for _PHPickerOverlayStorage()
{
  return self;
}

uint64_t sub_217C3D820(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_217C3D858(uint64_t a1)
{
  return a1;
}

unint64_t sub_217C3D88C()
{
  unint64_t result = qword_267BB1900;
  if (!qword_267BB1900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1900);
  }
  return result;
}

unint64_t sub_217C3D8DC()
{
  unint64_t result = qword_267BB1908;
  if (!qword_267BB1908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1908);
  }
  return result;
}

unint64_t sub_217C3D92C()
{
  unint64_t result = qword_267BB1910;
  if (!qword_267BB1910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1910);
  }
  return result;
}

unint64_t sub_217C3D97C()
{
  unint64_t result = qword_267BB1918;
  if (!qword_267BB1918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1918);
  }
  return result;
}

unint64_t sub_217C3D9CC()
{
  unint64_t result = qword_267BB1920;
  if (!qword_267BB1920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1920);
  }
  return result;
}

unint64_t sub_217C3DA1C()
{
  unint64_t result = qword_267BB1928;
  if (!qword_267BB1928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1928);
  }
  return result;
}

unint64_t sub_217C3DA6C()
{
  unint64_t result = qword_267BB1930;
  if (!qword_267BB1930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1930);
  }
  return result;
}

unint64_t sub_217C3DABC()
{
  unint64_t result = qword_267BB1938;
  if (!qword_267BB1938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1938);
  }
  return result;
}

unint64_t sub_217C3DB0C()
{
  unint64_t result = qword_267BB1940;
  if (!qword_267BB1940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1940);
  }
  return result;
}

void type metadata accessor for PHPickerMode()
{
}

void type metadata accessor for PHPickerFilter()
{
}

uint64_t destroy for PHPickerConfiguration(uint64_t a1)
{
  if (*(void *)(a1 + 80)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  }
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 128)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  }
  swift_release();
  if (*(void *)(a1 + 176)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  }
  if (*(void *)(a1 + 216)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  }
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 280)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  }
  if (*(void *)(a1 + 320)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PHPickerConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)(a2 + 32);
  unint64_t v6 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  uint64_t v7 = a1 + 56;
  uint64_t v8 = a2 + 56;
  uint64_t v9 = *(void *)(a2 + 80);
  id v10 = v5;
  id v11 = v6;
  if (v9)
  {
    uint64_t v12 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v9;
    *(void *)(a1 + 88) = v12;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(v7, v8, v9);
  }
  else
  {
    long long v13 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v8;
    *(_OWORD *)(v7 + 16) = v13;
    *(void *)(v7 + 32) = *(void *)(v8 + 32);
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v14 = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v14;
    *(void *)(a1 + 136) = v15;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v14 - 8))(a1 + 104, a2 + 104, v14);
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 120) = v16;
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
  }
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v17 = *(void *)(a2 + 176);
  swift_retain();
  if (v17)
  {
    uint64_t v18 = *(void *)(a2 + 184);
    *(void *)(a1 + 176) = v17;
    *(void *)(a1 + 184) = v18;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v17 - 8))(a1 + 152, a2 + 152, v17);
  }
  else
  {
    long long v19 = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 168) = v19;
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
  }
  uint64_t v20 = (_OWORD *)(a1 + 192);
  uint64_t v21 = (_OWORD *)(a2 + 192);
  uint64_t v22 = *(void *)(a2 + 216);
  if (v22)
  {
    uint64_t v23 = *(void *)(a2 + 224);
    *(void *)(a1 + 216) = v22;
    *(void *)(a1 + 224) = v23;
    (**(void (***)(_OWORD *, _OWORD *))(v22 - 8))(v20, v21);
  }
  else
  {
    long long v24 = *(_OWORD *)(a2 + 208);
    *uint64_t v20 = *v21;
    *(_OWORD *)(a1 + 208) = v24;
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
  }
  uint64_t v25 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v25;
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(_WORD *)(a1 + 249) = *(_WORD *)(a2 + 249);
  uint64_t v26 = *(void *)(a2 + 280);
  swift_bridgeObjectRetain();
  if (v26)
  {
    uint64_t v27 = *(void *)(a2 + 288);
    *(void *)(a1 + 280) = v26;
    *(void *)(a1 + 288) = v27;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v26 - 8))(a1 + 256, a2 + 256, v26);
  }
  else
  {
    long long v28 = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
    *(_OWORD *)(a1 + 272) = v28;
    *(void *)(a1 + 288) = *(void *)(a2 + 288);
  }
  uint64_t v29 = (_OWORD *)(a1 + 296);
  uint64_t v30 = (_OWORD *)(a2 + 296);
  uint64_t v31 = *(void *)(a2 + 320);
  if (v31)
  {
    uint64_t v32 = *(void *)(a2 + 328);
    *(void *)(a1 + 320) = v31;
    *(void *)(a1 + 328) = v32;
    (**(void (***)(_OWORD *, _OWORD *))(v31 - 8))(v29, v30);
  }
  else
  {
    long long v33 = *(_OWORD *)(a2 + 312);
    *uint64_t v29 = *v30;
    *(_OWORD *)(a1 + 312) = v33;
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
  }
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PHPickerConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void **)(a1 + 32);
  unint64_t v6 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v6;
  id v7 = v6;

  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v9;
  id v10 = v9;

  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  id v11 = (_OWORD *)(a1 + 56);
  uint64_t v12 = (_OWORD *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
    }
    else
    {
      sub_217C3D100(a1 + 56);
      uint64_t v14 = *(void *)(a2 + 88);
      long long v15 = *(_OWORD *)(a2 + 72);
      *id v11 = *v12;
      *(_OWORD *)(a1 + 72) = v15;
      *(void *)(a1 + 88) = v14;
    }
  }
  else if (v13)
  {
    *(void *)(a1 + 80) = v13;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 56, a2 + 56);
  }
  else
  {
    long long v16 = *v12;
    long long v17 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *id v11 = v16;
    *(_OWORD *)(a1 + 72) = v17;
  }
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = (_OWORD *)(a1 + 104);
  long long v19 = (_OWORD *)(a2 + 104);
  uint64_t v20 = *(void *)(a2 + 128);
  if (*(void *)(a1 + 128))
  {
    if (v20)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
    }
    else
    {
      sub_217C3D100(a1 + 104);
      uint64_t v21 = *(void *)(a2 + 136);
      long long v22 = *(_OWORD *)(a2 + 120);
      *uint64_t v18 = *v19;
      *(_OWORD *)(a1 + 120) = v22;
      *(void *)(a1 + 136) = v21;
    }
  }
  else if (v20)
  {
    *(void *)(a1 + 128) = v20;
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 104, a2 + 104);
  }
  else
  {
    long long v23 = *v19;
    long long v24 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *uint64_t v18 = v23;
    *(_OWORD *)(a1 + 120) = v24;
  }
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  uint64_t v25 = (_OWORD *)(a1 + 152);
  uint64_t v26 = (_OWORD *)(a2 + 152);
  uint64_t v27 = *(void *)(a2 + 176);
  if (*(void *)(a1 + 176))
  {
    if (v27)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 152), (uint64_t *)(a2 + 152));
    }
    else
    {
      sub_217C3D100(a1 + 152);
      uint64_t v28 = *(void *)(a2 + 184);
      long long v29 = *(_OWORD *)(a2 + 168);
      *uint64_t v25 = *v26;
      *(_OWORD *)(a1 + 168) = v29;
      *(void *)(a1 + 184) = v28;
    }
  }
  else if (v27)
  {
    *(void *)(a1 + 176) = v27;
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    (**(void (***)(uint64_t, uint64_t))(v27 - 8))(a1 + 152, a2 + 152);
  }
  else
  {
    long long v30 = *v26;
    long long v31 = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *uint64_t v25 = v30;
    *(_OWORD *)(a1 + 168) = v31;
  }
  uint64_t v32 = (_OWORD *)(a1 + 192);
  long long v33 = (_OWORD *)(a2 + 192);
  uint64_t v34 = *(void *)(a2 + 216);
  if (*(void *)(a1 + 216))
  {
    if (v34)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 192), (uint64_t *)(a2 + 192));
    }
    else
    {
      sub_217C3D100(a1 + 192);
      uint64_t v35 = *(void *)(a2 + 224);
      long long v36 = *(_OWORD *)(a2 + 208);
      *uint64_t v32 = *v33;
      *(_OWORD *)(a1 + 208) = v36;
      *(void *)(a1 + 224) = v35;
    }
  }
  else if (v34)
  {
    *(void *)(a1 + 216) = v34;
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    (**(void (***)(uint64_t, uint64_t))(v34 - 8))(a1 + 192, a2 + 192);
  }
  else
  {
    long long v37 = *v33;
    long long v38 = *(_OWORD *)(a2 + 208);
    *(void *)(a1 + 224) = *(void *)(a2 + 224);
    *uint64_t v32 = v37;
    *(_OWORD *)(a1 + 208) = v38;
  }
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(unsigned char *)(a1 + 249) = *(unsigned char *)(a2 + 249);
  *(unsigned char *)(a1 + 250) = *(unsigned char *)(a2 + 250);
  uint64_t v39 = (_OWORD *)(a1 + 256);
  uint64_t v40 = (_OWORD *)(a2 + 256);
  uint64_t v41 = *(void *)(a2 + 280);
  if (*(void *)(a1 + 280))
  {
    if (v41)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 256), (uint64_t *)(a2 + 256));
    }
    else
    {
      sub_217C3D100(a1 + 256);
      uint64_t v42 = *(void *)(a2 + 288);
      long long v43 = *(_OWORD *)(a2 + 272);
      *uint64_t v39 = *v40;
      *(_OWORD *)(a1 + 272) = v43;
      *(void *)(a1 + 288) = v42;
    }
  }
  else if (v41)
  {
    *(void *)(a1 + 280) = v41;
    *(void *)(a1 + 288) = *(void *)(a2 + 288);
    (**(void (***)(uint64_t, uint64_t))(v41 - 8))(a1 + 256, a2 + 256);
  }
  else
  {
    long long v44 = *v40;
    long long v45 = *(_OWORD *)(a2 + 272);
    *(void *)(a1 + 288) = *(void *)(a2 + 288);
    *uint64_t v39 = v44;
    *(_OWORD *)(a1 + 272) = v45;
  }
  uint64_t v46 = (_OWORD *)(a1 + 296);
  uint64_t v47 = (_OWORD *)(a2 + 296);
  uint64_t v48 = *(void *)(a2 + 320);
  if (*(void *)(a1 + 320))
  {
    if (v48)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 296), (uint64_t *)(a2 + 296));
    }
    else
    {
      sub_217C3D100(a1 + 296);
      uint64_t v49 = *(void *)(a2 + 328);
      long long v50 = *(_OWORD *)(a2 + 312);
      *uint64_t v46 = *v47;
      *(_OWORD *)(a1 + 312) = v50;
      *(void *)(a1 + 328) = v49;
    }
  }
  else if (v48)
  {
    *(void *)(a1 + 320) = v48;
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    (**(void (***)(uint64_t, uint64_t))(v48 - 8))(a1 + 296, a2 + 296);
  }
  else
  {
    long long v51 = *v47;
    long long v52 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *uint64_t v46 = v51;
    *(_OWORD *)(a1 + 312) = v52;
  }
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy344_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x158uLL);
}

uint64_t assignWithTake for PHPickerConfiguration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  unint64_t v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);

  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  if (*(void *)(a1 + 80))
  {
    if (*(void *)(a2 + 80)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 56);
    }
    else {
      sub_217C3D100(a1 + 56);
    }
  }
  long long v7 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 128))
  {
    if (*(void *)(a2 + 128)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 104);
    }
    else {
      sub_217C3D100(a1 + 104);
    }
  }
  long long v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v8;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  if (*(void *)(a1 + 176))
  {
    if (*(void *)(a2 + 176)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 152);
    }
    else {
      sub_217C3D100(a1 + 152);
    }
  }
  long long v9 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = v9;
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  if (*(void *)(a1 + 216))
  {
    if (*(void *)(a2 + 216)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 192);
    }
    else {
      sub_217C3D100(a1 + 192);
    }
  }
  long long v10 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v10;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  uint64_t v11 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v11;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 248) = *(unsigned char *)(a2 + 248);
  *(_WORD *)(a1 + 249) = *(_WORD *)(a2 + 249);
  if (*(void *)(a1 + 280))
  {
    if (*(void *)(a2 + 280)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 256);
    }
    else {
      sub_217C3D100(a1 + 256);
    }
  }
  long long v12 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v12;
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  if (*(void *)(a1 + 320))
  {
    if (*(void *)(a2 + 320)) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 296);
    }
    else {
      sub_217C3D100(a1 + 296);
    }
  }
  uint64_t v13 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  long long v14 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v14;
  *(void *)(a1 + 336) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 344))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 144);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PHPickerConfiguration(uint64_t result, int a2, int a3)
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
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 344) = 1;
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
      *(void *)(result + 144) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 344) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PHPickerConfiguration()
{
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration.AssetRepresentationMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PHPickerConfiguration.AssetRepresentationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x217C3E7F8);
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

uint64_t sub_217C3E820(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_217C3E828(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for PHPickerConfiguration.AssetRepresentationMode()
{
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration.Selection(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PHPickerConfiguration.Selection(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x217C3E990);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for PHPickerConfiguration.Selection()
{
}

uint64_t initializeBufferWithCopyOfBuffer for PHPickerConfiguration.Update(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PHPickerConfiguration.Update(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PHPickerConfiguration.Update(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 41) = v3;
  return result;
}

void type metadata accessor for PHPickerConfiguration.Update()
{
}

void *initializeBufferWithCopyOfBuffer for PHPickerResult(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for PHPickerResult(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for PHPickerResult(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  BOOL v7 = *(void **)(a2 + 8);
  long long v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for PHPickerResult(uint64_t a1, _OWORD *a2)
{
  unsigned int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for PHPickerResult(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PHPickerResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for PHPickerResult()
{
}

uint64_t dispatch thunk of PHPickerViewControllerDelegate.picker(_:didFinishPicking:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t destroy for _PHPickerCollectionConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _PHPickerCollectionConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for _PHPickerCollectionConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for _PHPickerCollectionConfiguration(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _PHPickerCollectionConfiguration(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _PHPickerCollectionConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for _PHPickerCollectionConfiguration()
{
}

void type metadata accessor for _PHPickerSuggestionGroup()
{
}

void type metadata accessor for _PHPickerCollectionSuggestionType(uint64_t a1)
{
}

void type metadata accessor for _PHPickerCollectionType(uint64_t a1)
{
}

void type metadata accessor for _PHPickerPrivateCapabilities(uint64_t a1)
{
}

void type metadata accessor for PHPickerCapabilities(uint64_t a1)
{
}

void type metadata accessor for NSDirectionalRectEdge(uint64_t a1)
{
}

void type metadata accessor for __PHPickerMode(uint64_t a1)
{
}

void sub_217C3EF5C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_217C3EFA4()
{
  return sub_217C3EFEC(&qword_267BB19F0, type metadata accessor for __PHPickerMode);
}

uint64_t sub_217C3EFEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_217C3F034()
{
  return sub_217C3EFEC(&qword_267BB19F8, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217C3F07C()
{
  return sub_217C3EFEC(&qword_267BB1A00, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217C3F0C4()
{
  return sub_217C3EFEC(&qword_267BB1A08, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217C3F10C()
{
  return sub_217C3EFEC(&qword_267BB1A10, type metadata accessor for NSDirectionalRectEdge);
}

uint64_t sub_217C3F154()
{
  return sub_217C3EFEC(&qword_267BB1A18, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217C3F19C()
{
  return sub_217C3EFEC(&qword_267BB1A20, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217C3F1E4()
{
  return sub_217C3EFEC(&qword_267BB1A28, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217C3F22C()
{
  return sub_217C3EFEC(&qword_267BB1A30, type metadata accessor for PHPickerCapabilities);
}

uint64_t sub_217C3F274()
{
  return sub_217C3EFEC(&qword_267BB1A38, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217C3F2BC()
{
  return sub_217C3EFEC(&qword_267BB1A40, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217C3F304()
{
  return sub_217C3EFEC(&qword_267BB1A48, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217C3F34C()
{
  return sub_217C3EFEC(&qword_267BB1A50, type metadata accessor for _PHPickerPrivateCapabilities);
}

uint64_t sub_217C3F394()
{
  return sub_217C3EFEC(&qword_267BB1A58, type metadata accessor for _PHPickerCollectionType);
}

uint64_t sub_217C3F3DC()
{
  return sub_217C3EFEC(&qword_267BB1A60, type metadata accessor for _PHPickerCollectionType);
}

uint64_t sub_217C3F424()
{
  return sub_217C3EFEC(&qword_267BB1A68, type metadata accessor for _PHPickerCollectionType);
}

uint64_t sub_217C3F46C()
{
  return sub_217C3EFEC(&qword_267BB1A70, type metadata accessor for _PHPickerCollectionType);
}

uint64_t sub_217C3F4B4()
{
  return sub_217C3EFEC(&qword_267BB1A78, type metadata accessor for _PHPickerCollectionSuggestionType);
}

uint64_t sub_217C3F4FC()
{
  return sub_217C3EFEC(&qword_267BB1A80, type metadata accessor for _PHPickerCollectionSuggestionType);
}

uint64_t sub_217C3F544()
{
  return sub_217C3EFEC(&qword_267BB1A88, type metadata accessor for _PHPickerCollectionSuggestionType);
}

uint64_t sub_217C3F58C()
{
  return sub_217C3EFEC(&qword_267BB1A90, type metadata accessor for _PHPickerCollectionSuggestionType);
}

uint64_t sub_217C3F5D4()
{
  return sub_217C3EFEC(&qword_267BB1A98, (void (*)(uint64_t))type metadata accessor for _PHPickerConfigurationStorageForNonEquatableTypes);
}

uint64_t sub_217C3F61C()
{
  return sub_217C3EFEC(&qword_267BB1AA0, type metadata accessor for _PHPickerSourceType);
}

uint64_t sub_217C3F664(uint64_t a1)
{
  return a1;
}

uint64_t sub_217C3F68C(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_217C3F6FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_217C3F738(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v4 = OUTLINED_FUNCTION_37();
  v5(v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_217C3F7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_217C3F828(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_217C3F884(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_46(uint64_t result)
{
  *(void *)(*(void *)(v1 + 144) + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_47(uint64_t result)
{
  *(void *)(*(void *)(v1 + 144) + 24) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_48()
{
  return *(void *)(*(void *)(v0 + 144) + 16);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return *(void *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_50()
{
  return v0;
}

double OUTLINED_FUNCTION_51()
{
  *(void *)(v0 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)uint64_t v0 = 0u;
  return result;
}

id static PickerSuggestionAvailableClasses.all()()
{
  sub_217C412FC();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_217C614A0;
  *(void *)(inited + 32) = type metadata accessor for PickerSuggestionAll();
  *(void *)(inited + 40) = type metadata accessor for PickerSearchBasedSuggestion();
  *(void *)(inited + 48) = type metadata accessor for PickerWallpaperSuggestion();
  *(void *)(inited + 56) = type metadata accessor for PickerAssetCollectionSuggestion();
  *(void *)(inited + 64) = type metadata accessor for PickerLivePhotoWithPossibleMotionEffectSuggestion();
  *(void *)(inited + 72) = type metadata accessor for PickerPanoramasSuggestion();
  *(void *)(inited + 80) = type metadata accessor for PickerSpatialSuggestion();
  *(void *)(inited + 88) = type metadata accessor for PickerGenerativeFeaturedSuggestion();
  uint64_t v1 = type metadata accessor for PickerStyleablePhotoSuggestion();
  uint64_t v2 = sub_217C41490(1, 9, 1, inited);
  *(void *)(v2 + 16) = 9;
  *(void *)(v2 + 96) = v1;
  sub_217C3F6FC(0, &qword_267BB1B58);
  uint64_t v3 = OUTLINED_FUNCTION_0_0();
  sub_217C393F8(v3);
  swift_bridgeObjectRelease();
  return sub_217C3FAC8();
}

id sub_217C3FAC8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_217C5CF68();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

id PickerSuggestionAvailableClasses.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PickerSuggestionAvailableClasses();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PickerSuggestionAvailableClasses.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PickerSuggestionAvailableClasses();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PickerSuggestionAll.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id PickerSuggestionAll.init()()
{
  return sub_217C41174(&OBJC_IVAR___PUPickerSuggestionAll_shouldReverseSortOrder);
}

id PickerSuggestionAll.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  id v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerSuggestionAll.init(coder:)(v0);
}

id PickerSuggestionAll.init(coder:)(void *a1)
{
  return sub_217C41224(a1, &OBJC_IVAR___PUPickerSuggestionAll_shouldReverseSortOrder);
}

unint64_t PickerSearchBasedSuggestion.Mode.init(rawValue:)(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

uint64_t sub_217C3FD08()
{
  return sub_217C3C9CC(*v0);
}

uint64_t sub_217C3FD10(uint64_t a1)
{
  return sub_217C3CA30(a1, *v1);
}

unint64_t sub_217C3FD18@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = PickerSearchBasedSuggestion.Mode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t PickerSearchBasedSuggestion.mode.getter()
{
  return OUTLINED_FUNCTION_10_0(OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

id PickerSearchBasedSuggestion.__allocating_init(mode:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_0_0();
  return PickerSearchBasedSuggestion.init(mode:)(v0);
}

id PickerSearchBasedSuggestion.init(mode:)(uint64_t a1)
{
  return sub_217C40B68(a1, &OBJC_IVAR___PUPickerSearchBasedSuggestion_shouldReverseSortOrder, &OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

BOOL PickerSearchBasedSuggestion.isEqual(_:)(uint64_t a1)
{
  return sub_217C40C00(a1, &OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

uint64_t sub_217C3FE04(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_217C5CFB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_217C41614((uint64_t)v10);
  return v8 & 1;
}

id PickerSearchBasedSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerSearchBasedSuggestion.init(coder:)(v0);
}

id PickerSearchBasedSuggestion.init(coder:)(void *a1)
{
  return sub_217C40D18(a1, &OBJC_IVAR___PUPickerSearchBasedSuggestion_shouldReverseSortOrder, (uint64_t (*)(id))PickerSearchBasedSuggestion.Mode.init(rawValue:), &OBJC_IVAR___PUPickerSearchBasedSuggestion_mode);
}

Swift::Void __swiftcall PickerSearchBasedSuggestion.encode(with:)(NSCoder with)
{
}

void PickerSearchBasedSuggestion.init()()
{
}

uint64_t PickerAssetCollectionSuggestion.localIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PickerAssetCollectionSuggestion.extendedCuratedAssetsOnly.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly);
}

uint64_t PickerAssetCollectionSuggestion.shouldReverseSortOrder.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder);
}

id PickerAssetCollectionSuggestion.__allocating_init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)()
{
  id v0 = objc_allocWithZone((Class)OUTLINED_FUNCTION_5_0());
  return PickerAssetCollectionSuggestion.init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)();
}

id PickerAssetCollectionSuggestion.init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v6 = &v1[OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier];
  *id v6 = v4;
  v6[1] = v3;
  v1[OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly] = v2;
  v1[OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder] = v0;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t PickerAssetCollectionSuggestion.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_217C415AC(a1, (uint64_t)v9);
  if (v10)
  {
    if (OUTLINED_FUNCTION_6_0())
    {
      BOOL v3 = *(void *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier) == *(void *)&v8[OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier]
        && *(void *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier + 8) == *(void *)&v8[OBJC_IVAR___PUPickerAssetCollectionSuggestion_localIdentifier + 8];
      if (v3 || (sub_217C5D078())
        && *(unsigned __int8 *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly) == v8[OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly])
      {
        char v6 = *(unsigned char *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder);
        char v7 = v8[OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder];

        char v4 = v6 ^ v7 ^ 1;
        return v4 & 1;
      }
    }
  }
  else
  {
    sub_217C41614((uint64_t)v9);
  }
  char v4 = 0;
  return v4 & 1;
}

uint64_t static PickerAssetCollectionSuggestion.supportsSecureCoding.getter()
{
  return byte_267BB1B50;
}

uint64_t static PickerAssetCollectionSuggestion.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  byte_267BB1B50 = a1;
  return result;
}

uint64_t (*static PickerAssetCollectionSuggestion.supportsSecureCoding.modify())()
{
  return j__swift_endAccess;
}

uint64_t PickerAssetCollectionSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  char v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerAssetCollectionSuggestion.init(coder:)(v0);
}

uint64_t PickerAssetCollectionSuggestion.init(coder:)(void *a1)
{
  char v2 = v1;
  swift_getObjectType();
  sub_217C3F6FC(0, &qword_267BB1B98);
  id v4 = v2;
  uint64_t v5 = sub_217C5CF88();
  if (v5)
  {
    char v6 = (void *)v5;
    uint64_t v8 = 0;
    sub_217C5CF38();
  }
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall PickerAssetCollectionSuggestion.encode(with:)(NSCoder with)
{
  BOOL v3 = (void *)sub_217C5CF28();
  id v4 = (void *)sub_217C5CF28();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  uint64_t v5 = *(unsigned __int8 *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_extendedCuratedAssetsOnly);
  char v6 = (void *)OUTLINED_FUNCTION_8_0();
  [(objc_class *)with.super.isa encodeBool:v5 forKey:v6];

  uint64_t v7 = *(unsigned __int8 *)(v1 + OBJC_IVAR___PUPickerAssetCollectionSuggestion_shouldReverseSortOrder);
  id v8 = (id)OUTLINED_FUNCTION_8_0();
  [(objc_class *)with.super.isa encodeBool:v7 forKey:v8];
}

void PickerAssetCollectionSuggestion.init()()
{
}

unint64_t PickerWallpaperSuggestion.Mode.init(rawValue:)(unint64_t result)
{
  if (result > 0xD) {
    return 0;
  }
  return result;
}

unint64_t sub_217C407BC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = PickerWallpaperSuggestion.Mode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t PickerWallpaperSuggestion.mode.getter()
{
  return OUTLINED_FUNCTION_10_0(OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

id PickerWallpaperSuggestion.__allocating_init(mode:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_0_0();
  return PickerWallpaperSuggestion.init(mode:)(v0);
}

id PickerWallpaperSuggestion.init(mode:)(uint64_t a1)
{
  return sub_217C40B68(a1, &OBJC_IVAR___PUPickerWallpaperSuggestion_shouldReverseSortOrder, &OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

BOOL PickerWallpaperSuggestion.isEqual(_:)(uint64_t a1)
{
  return sub_217C40C00(a1, &OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

id PickerWallpaperSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerWallpaperSuggestion.init(coder:)(v0);
}

id PickerWallpaperSuggestion.init(coder:)(void *a1)
{
  return sub_217C40D18(a1, &OBJC_IVAR___PUPickerWallpaperSuggestion_shouldReverseSortOrder, (uint64_t (*)(id))PickerWallpaperSuggestion.Mode.init(rawValue:), &OBJC_IVAR___PUPickerWallpaperSuggestion_mode);
}

Swift::Void __swiftcall PickerWallpaperSuggestion.encode(with:)(NSCoder with)
{
}

void PickerWallpaperSuggestion.init()()
{
}

id PickerLivePhotoWithPossibleMotionEffectSuggestion.init()()
{
  return sub_217C41174(&OBJC_IVAR___PUPickerLivePhotoWithPossibleMotionEffectSuggestion_shouldReverseSortOrder);
}

id PickerLivePhotoWithPossibleMotionEffectSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerLivePhotoWithPossibleMotionEffectSuggestion.init(coder:)(v0);
}

id PickerLivePhotoWithPossibleMotionEffectSuggestion.init(coder:)(void *a1)
{
  return sub_217C41224(a1, &OBJC_IVAR___PUPickerLivePhotoWithPossibleMotionEffectSuggestion_shouldReverseSortOrder);
}

unint64_t PickerStyleablePhotoSuggestion.Mode.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t sub_217C40AC8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = PickerStyleablePhotoSuggestion.Mode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t PickerStyleablePhotoSuggestion.mode.getter()
{
  return OUTLINED_FUNCTION_10_0(OBJC_IVAR___PUPickerStyleablePhotoSuggestion_mode);
}

id PickerStyleablePhotoSuggestion.__allocating_init(mode:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_0_0();
  return PickerStyleablePhotoSuggestion.init(mode:)(v0);
}

id PickerStyleablePhotoSuggestion.init(mode:)(uint64_t a1)
{
  return sub_217C40B68(a1, &OBJC_IVAR___PUPickerStyleablePhotoSuggestion_shouldReverseSortOrder, &OBJC_IVAR___PUPickerStyleablePhotoSuggestion_mode);
}

id sub_217C40B68(uint64_t a1, void *a2, void *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v3[*a2] = 0;
  *(void *)&v3[*a3] = a1;
  v9.receiver = v3;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

BOOL PickerStyleablePhotoSuggestion.isEqual(_:)(uint64_t a1)
{
  return sub_217C40C00(a1, &OBJC_IVAR___PUPickerStyleablePhotoSuggestion_mode);
}

BOOL sub_217C40C00(uint64_t a1, uint64_t *a2)
{
  swift_getObjectType();
  sub_217C415AC(a1, (uint64_t)v10);
  if (v11)
  {
    if (swift_dynamicCast())
    {
      uint64_t v5 = *a2;
      uint64_t v6 = *(void *)(v2 + *a2);
      uint64_t v7 = *(void *)&v9[v5];

      return v6 == v7;
    }
  }
  else
  {
    sub_217C41614((uint64_t)v10);
  }
  return 0;
}

id PickerStyleablePhotoSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerStyleablePhotoSuggestion.init(coder:)(v0);
}

id PickerStyleablePhotoSuggestion.init(coder:)(void *a1)
{
  return sub_217C40D18(a1, &OBJC_IVAR___PUPickerStyleablePhotoSuggestion_shouldReverseSortOrder, (uint64_t (*)(id))PickerStyleablePhotoSuggestion.Mode.init(rawValue:), &OBJC_IVAR___PUPickerStyleablePhotoSuggestion_mode);
}

id sub_217C40D18(void *a1, void *a2, uint64_t (*a3)(id), void *a4)
{
  id v8 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v8[*a2] = 0;
  uint64_t v11 = v8;
  long long v12 = (void *)OUTLINED_FUNCTION_4_0();
  id v13 = objc_msgSend(a1, sel_decodeIntegerForKey_, v12);

  uint64_t v14 = a3(v13);
  if (v15)
  {

    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    *(void *)&v11[*a4] = v14;

    v18.receiver = v11;
    v18.super_class = ObjectType;
    id v16 = objc_msgSendSuper2(&v18, sel_init);
  }
  return v16;
}

Swift::Void __swiftcall PickerStyleablePhotoSuggestion.encode(with:)(NSCoder with)
{
}

void sub_217C40E3C(void *a1, void *a2)
{
  uint64_t v4 = *(void *)(v2 + *a2);
  id v5 = (id)OUTLINED_FUNCTION_4_0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v4, v5);
}

void PickerStyleablePhotoSuggestion.init()()
{
}

id PickerPanoramasSuggestion.init()()
{
  return sub_217C41174(&OBJC_IVAR___PUPickerPanoramasSuggestion_shouldReverseSortOrder);
}

id PickerPanoramasSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerPanoramasSuggestion.init(coder:)(v0);
}

id PickerPanoramasSuggestion.init(coder:)(void *a1)
{
  return sub_217C41224(a1, &OBJC_IVAR___PUPickerPanoramasSuggestion_shouldReverseSortOrder);
}

id PickerSpatialSuggestion.init()()
{
  return sub_217C41174(&OBJC_IVAR___PUPickerSpatialSuggestion_shouldReverseSortOrder);
}

BOOL _s8PhotosUI19PickerSuggestionAllC7isEqualySbypSgF_0(uint64_t a1)
{
  swift_getObjectType();
  sub_217C415AC(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_217C41614((uint64_t)v6);
    goto LABEL_5;
  }
  if (!OUTLINED_FUNCTION_6_0())
  {
LABEL_5:
    uint64_t v2 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = v5;
LABEL_6:
  BOOL v3 = v2 != 0;

  return v3;
}

id PickerSpatialSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerSpatialSuggestion.init(coder:)(v0);
}

id PickerSpatialSuggestion.init(coder:)(void *a1)
{
  return sub_217C41224(a1, &OBJC_IVAR___PUPickerSpatialSuggestion_shouldReverseSortOrder);
}

id PickerGenerativeFeaturedSuggestion.init()()
{
  return sub_217C41174(&OBJC_IVAR___PUPickerGenerativeFeaturedSuggestion_shouldReverseSortOrder);
}

id sub_217C41174(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v1[*a1] = 0;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id PickerGenerativeFeaturedSuggestion.__allocating_init(coder:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = (void *)OUTLINED_FUNCTION_0_0();
  return PickerGenerativeFeaturedSuggestion.init(coder:)(v0);
}

id PickerGenerativeFeaturedSuggestion.init(coder:)(void *a1)
{
  return sub_217C41224(a1, &OBJC_IVAR___PUPickerGenerativeFeaturedSuggestion_shouldReverseSortOrder);
}

id sub_217C41224(void *a1, void *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v2[*a2] = 0;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v8, sel_init);

  return v6;
}

id _s8PhotosUI19PickerSuggestionAllCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_217C412FC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1AB8);
  if (dynamic_cast_existential_0_class_conditional(v0)) {
    uint64_t v1 = (uint64_t *)&unk_267BB1C68;
  }
  else {
    uint64_t v1 = (uint64_t *)&unk_267BB1C60;
  }

  return __swift_instantiateConcreteTypeFromMangledName(v1);
}

uint64_t type metadata accessor for PickerSuggestionAll()
{
  return self;
}

uint64_t type metadata accessor for PickerSearchBasedSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerWallpaperSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerAssetCollectionSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerLivePhotoWithPossibleMotionEffectSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerPanoramasSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerSpatialSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerGenerativeFeaturedSuggestion()
{
  return self;
}

uint64_t type metadata accessor for PickerStyleablePhotoSuggestion()
{
  return self;
}

uint64_t sub_217C41490(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_217C412FC();
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    sub_217C3D614((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    memcpy((void *)(v10 + 32), (const void *)(a4 + 32), 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t type metadata accessor for PickerSuggestionAvailableClasses()
{
  return self;
}

uint64_t sub_217C415AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_217C41614(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BB1B68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_217C41678()
{
  unint64_t result = qword_267BB1BE0;
  if (!qword_267BB1BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1BE0);
  }
  return result;
}

unint64_t sub_217C416C8()
{
  unint64_t result = qword_267BB1BE8;
  if (!qword_267BB1BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1BE8);
  }
  return result;
}

unint64_t sub_217C41718()
{
  unint64_t result = qword_267BB1BF0;
  if (!qword_267BB1BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BB1BF0);
  }
  return result;
}

uint64_t method lookup function for PickerSuggestionAll(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerSuggestionAll);
}

uint64_t dispatch thunk of PickerSuggestionAll.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PickerSearchBasedSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerSearchBasedSuggestion);
}

uint64_t dispatch thunk of PickerSearchBasedSuggestion.__allocating_init(mode:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PickerSearchBasedSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for PickerSearchBasedSuggestion.Mode()
{
}

uint64_t method lookup function for PickerAssetCollectionSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerAssetCollectionSuggestion);
}

uint64_t dispatch thunk of PickerAssetCollectionSuggestion.__allocating_init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PickerAssetCollectionSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for PickerWallpaperSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerWallpaperSuggestion);
}

uint64_t dispatch thunk of PickerWallpaperSuggestion.__allocating_init(mode:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PickerWallpaperSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for PickerWallpaperSuggestion.Mode()
{
}

uint64_t method lookup function for PickerLivePhotoWithPossibleMotionEffectSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerLivePhotoWithPossibleMotionEffectSuggestion);
}

uint64_t dispatch thunk of PickerLivePhotoWithPossibleMotionEffectSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PickerStyleablePhotoSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerStyleablePhotoSuggestion);
}

uint64_t dispatch thunk of PickerStyleablePhotoSuggestion.__allocating_init(mode:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PickerStyleablePhotoSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for PickerStyleablePhotoSuggestion.Mode()
{
}

uint64_t method lookup function for PickerPanoramasSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerPanoramasSuggestion);
}

uint64_t dispatch thunk of PickerPanoramasSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PickerSpatialSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerSpatialSuggestion);
}

uint64_t dispatch thunk of PickerSpatialSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PickerGenerativeFeaturedSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PickerGenerativeFeaturedSuggestion);
}

uint64_t dispatch thunk of PickerGenerativeFeaturedSuggestion.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_217C419C8()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t PUPickerFilterAvailableClasses()
{
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
}

void sub_217C44F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t PUPhotosAssetViewShowDebugOverlayView()
{
  uint64_t result = MEMORY[0x21D4598C0]();
  if (result)
  {
    CFPreferencesAppSynchronize(@"-g");
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"EnablePhotosAssetDebugOverlay", @"-g", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v2 = AppBooleanValue == 0;
    }
    else {
      BOOL v2 = 1;
    }
    return !v2;
  }
  return result;
}

void sub_217C4C118(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_217C4D288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C4DCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C4E0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C4E560(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_217C4F0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C516AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217C5245C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose((const void *)(v54 - 248), 8);
  _Block_object_dispose((const void *)(v54 - 200), 8);
  _Block_object_dispose((const void *)(v54 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_217C5A7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, id *a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak((id *)(v26 - 112));
  _Unwind_Resume(a1);
}

void sub_217C5B004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C5B2F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217C5B49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_217C5CED8()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_217C5CEE8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_217C5CEF8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_217C5CF08()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_217C5CF18()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_217C5CF28()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_217C5CF38()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_217C5CF48()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_217C5CF58()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_217C5CF68()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_217C5CF78()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_217C5CF88()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_217C5CF98()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_217C5CFA8()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_217C5CFB8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_217C5CFD8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_217C5CFE8()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_217C5CFF8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_217C5D008()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_217C5D018()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_217C5D028()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_217C5D038()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_217C5D048()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_217C5D058()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_217C5D068()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_217C5D078()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_217C5D088()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_217C5D098()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_217C5D0A8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_217C5D0B8()
{
  return MEMORY[0x270F9FC90]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

uint64_t DCIM_newPLImageWithData()
{
  return MEMORY[0x270F537C8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PFCurrentPlatformLivePhotoBundleType()
{
  return MEMORY[0x270F53AA8]();
}

uint64_t PFExists()
{
  return MEMORY[0x270F53658]();
}

uint64_t PFMap()
{
  return MEMORY[0x270F53680]();
}

uint64_t PFPosterEnableSettlingEffect()
{
  return MEMORY[0x270F53AE0]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x270F536C0]();
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x270F537E0]();
}

uint64_t PLDispatchOnMainQueue()
{
  return MEMORY[0x270F53740]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x270F53800]();
}

uint64_t PLHasInternalUI()
{
  return MEMORY[0x270F53810]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x270F53840]();
}

uint64_t PLPhotoLibraryFrameworkBundle()
{
  return MEMORY[0x270F53878]();
}

uint64_t PLPhotoPickerGetLog()
{
  return MEMORY[0x270F53880]();
}

uint64_t PLPickerGetLog()
{
  return MEMORY[0x270F53898]();
}

uint64_t PLServicesLocalizedFrameworkString()
{
  return MEMORY[0x270F538D0]();
}

uint64_t PLStickerSuggestionConfidenceThreshold()
{
  return MEMORY[0x270F53790]();
}

uint64_t PLUIGetLog()
{
  return MEMORY[0x270F538D8]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x270F536E0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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