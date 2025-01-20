uint64_t BiomeLibraryNode()
{
  return objc_opt_class();
}

id sub_1B30E8A08(uint64_t a1, uint64_t a2, void (*a3)(void), void *a4)
{
  a3();
  sub_1B359E858();
  OUTLINED_FUNCTION_6();

  return a4;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_3()
{
  return 0xD000000000000010;
}

unint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t BiomeLibrary()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_1(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_1B30E8A08(a1, a2, a3, (void *)(a4 & 0xFFFFFFFFFFFFLL | 0xD000000000000000));
}

unint64_t static _BMIPBridgeGenerativeExperiencesLibraryNode.identifier()()
{
  return OUTLINED_FUNCTION_4(21);
}

unint64_t static _BMIPBridgeIntelligenceFlowLibraryNode.identifier()()
{
  return OUTLINED_FUNCTION_3();
}

unint64_t static _BMIPBridgeGenerativeModelsLibraryNode.identifier()()
{
  return OUTLINED_FUNCTION_3();
}

unint64_t static _BMIPBridgeAdAttributionKitLibraryNode.identifier()()
{
  return OUTLINED_FUNCTION_3();
}

uint64_t static _BMIPBridgeAdAttributionKitLibraryNode.streamNames()()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t static _BMIPBridgeAdAttributionKitLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeAdAttributionKitLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_0(a1, a2, 19, 17);
}

void *sub_1B3106708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1B3107378(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

uint64_t static _BMIPBridgeAdAttributionKitLibraryNode.sublibraries()()
{
  return sub_1B3106E94(type metadata accessor for _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode);
}

id _BMIPBridgeAdAttributionKitLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeAdAttributionKitLibraryNode);
}

unint64_t static _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode.identifier()()
{
  return OUTLINED_FUNCTION_4(19);
}

void *static _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode.streamNames()()
{
  return &unk_1F0B46B40;
}

uint64_t static _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_0(a1, a2, 39, 37);
}

void (*sub_1B310687C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t)))(uint64_t)
{
  uint64_t v5 = sub_1B359E868();
  a4(v5);
  OUTLINED_FUNCTION_6();

  return a4;
}

uint64_t static _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode.sublibraries()()
{
  return MEMORY[0x1E4FBC860];
}

id _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode);
}

void *static _BMIPBridgeGenerativeExperiencesLibraryNode.streamNames()()
{
  return &unk_1F0B46B80;
}

uint64_t static _BMIPBridgeGenerativeExperiencesLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeGenerativeExperiencesLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_0(a1, a2, 24, 22);
}

uint64_t static _BMIPBridgeGenerativeExperiencesLibraryNode.sublibraries()()
{
  return MEMORY[0x1E4FBC860];
}

id _BMIPBridgeGenerativeExperiencesLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeGenerativeExperiencesLibraryNode);
}

uint64_t static _BMIPBridgeGenerativeModelsLibraryNode.streamNames()()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t static _BMIPBridgeGenerativeModelsLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeGenerativeModelsLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_0(a1, a2, 19, 17);
}

uint64_t static _BMIPBridgeGenerativeModelsLibraryNode.sublibraries()()
{
  return sub_1B3106E94(type metadata accessor for _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode);
}

id sub_1B3106A2C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5240C0);
  sub_1B359E898();
  OUTLINED_FUNCTION_2();

  return v3;
}

id _BMIPBridgeGenerativeModelsLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeGenerativeModelsLibraryNode);
}

unint64_t static _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode.identifier()()
{
  return OUTLINED_FUNCTION_4(19);
}

void *static _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode.streamNames()()
{
  return &unk_1F0B44510;
}

uint64_t static _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_0(a1, a2, 39, 37);
}

uint64_t static _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode.sublibraries()()
{
  return MEMORY[0x1E4FBC860];
}

id _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode);
}

void *static _BMIPBridgeIntelligenceFlowLibraryNode.streamNames()()
{
  return &unk_1F0B44550;
}

uint64_t static _BMIPBridgeIntelligenceFlowLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeIntelligenceFlowLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_0(a1, a2, 19, 17);
}

uint64_t static _BMIPBridgeIntelligenceFlowLibraryNode.sublibraries()()
{
  return MEMORY[0x1E4FBC860];
}

id _BMIPBridgeIntelligenceFlowLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeIntelligenceFlowLibraryNode);
}

uint64_t static _BMIPBridgeLLMCacheLibraryNode.identifier()()
{
  return 0x65686361434D4C4CLL;
}

void *static _BMIPBridgeLLMCacheLibraryNode.streamNames()()
{
  return &unk_1F0B444B0;
}

uint64_t static _BMIPBridgeLLMCacheLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeLLMCacheLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return sub_1B3106E10(a1, a2, 0x65686361434D4C4CLL);
}

uint64_t static _BMIPBridgeLLMCacheLibraryNode.sublibraries()()
{
  return MEMORY[0x1E4FBC860];
}

id _BMIPBridgeLLMCacheLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeLLMCacheLibraryNode);
}

uint64_t static _BMIPBridgeZeoliteLibraryNode.identifier()()
{
  return 0x6574696C6F655ALL;
}

uint64_t static _BMIPBridgeZeoliteLibraryNode.streamNames()()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t static _BMIPBridgeZeoliteLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeZeoliteLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return sub_1B3106E10(a1, a2, 0x2E6574696C6F655ALL);
}

uint64_t sub_1B3106E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B359E888();
  uint64_t v3 = sub_1B359E848();
  OUTLINED_FUNCTION_5(v3);
  OUTLINED_FUNCTION_6();
  swift_bridgeObjectRelease();
  return a3;
}

uint64_t static _BMIPBridgeZeoliteLibraryNode.sublibraries()()
{
  return sub_1B3106E94(type metadata accessor for _BMIPBridgeZeoliteLedgerLibraryNode);
}

uint64_t sub_1B3106E94(uint64_t (*a1)(void))
{
  sub_1B3107170();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1B35D6270;
  *(void *)(v2 + 32) = a1();
  return v2;
}

id _BMIPBridgeZeoliteLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeZeoliteLibraryNode);
}

uint64_t static _BMIPBridgeZeoliteLedgerLibraryNode.identifier()()
{
  return 0x72656764654CLL;
}

void *static _BMIPBridgeZeoliteLedgerLibraryNode.streamNames()()
{
  return &unk_1F0B444E0;
}

uint64_t static _BMIPBridgeZeoliteLedgerLibraryNode.validKeyPaths()()
{
  return MEMORY[0x1E4FBC870];
}

uint64_t static _BMIPBridgeZeoliteLedgerLibraryNode.stream(withName:)(uint64_t a1, uint64_t a2)
{
  return sub_1B3107014(a1, a2, 17, 0x2E6574696C6F655ALL);
}

uint64_t sub_1B3107014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B359E8B8();
  swift_bridgeObjectRelease();
  sub_1B359E888();
  uint64_t v5 = sub_1B359E848();
  OUTLINED_FUNCTION_5(v5);
  OUTLINED_FUNCTION_6();
  swift_bridgeObjectRelease();
  return a4;
}

uint64_t static _BMIPBridgeZeoliteLedgerLibraryNode.sublibraries()()
{
  return MEMORY[0x1E4FBC860];
}

id _BMIPBridgeZeoliteLedgerLibraryNode.__deallocating_deinit()
{
  return sub_1B3107138(type metadata accessor for _BMIPBridgeZeoliteLedgerLibraryNode);
}

id sub_1B3107138(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1B3107170()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5240C0);
  if (dynamic_cast_existential_0_class_conditional(v0)) {
    v1 = (uint64_t *)&unk_1E9CB8DE8;
  }
  else {
    v1 = (uint64_t *)&unk_1EB5240C8;
  }

  return __swift_instantiateConcreteTypeFromMangledName(v1);
}

uint64_t type metadata accessor for _BMIPBridgeAdAttributionKitAggregatedReportingLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeAdAttributionKitLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeGenerativeExperiencesLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeGenerativeModelsGenerativeFunctionsLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeGenerativeModelsLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeIntelligenceFlowLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeLLMCacheLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeZeoliteLedgerLibraryNode()
{
  return self;
}

uint64_t type metadata accessor for _BMIPBridgeZeoliteLibraryNode()
{
  return self;
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

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType()) {
    return a1;
  }
  else {
    return 0;
  }
}

unint64_t sub_1B3107378(uint64_t a1, uint64_t a2)
{
  sub_1B359E8D8();
  sub_1B359E878();
  uint64_t v4 = sub_1B359E8E8();

  return sub_1B31073F0(a1, a2, v4);
}

unint64_t sub_1B31073F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B359E8C8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B359E8C8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B3107014(a1, a2, a3, a4 & 0xFFFFFFFFFFFFLL | 0xD000000000000000);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_5(uint64_t a1)
{
  return sub_1B3106708(v1, v2, a1);
}

unsigned char *BMAudioRouteChangeReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAudioRouteChangeReasonFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_13);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAudioRouteChangeReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAudioRouteChangeReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAudioRouteTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAudioRouteTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_33);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMAudioRouteTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAudioRouteTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAudioRouteChangeReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAudioRouteChangeReasonAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6027590[a1];
  }

  return v1;
}

__CFString *BMAudioRouteTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60275D0[a1];
  }

  return v1;
}

uint64_t BMAudioRouteChangeReasonDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAudioRouteTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPortraitTopicAlgorithmFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPortraitTopicAlgorithmFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_113);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPortraitTopicAlgorithmFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPortraitTopicAlgorithmFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPortraitTopicAlgorithmFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPortraitTopicAlgorithmAsString(uint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6027670[a1];
  }

  return v1;
}

uint64_t BMPortraitTopicAlgorithmDecode(uint64_t result)
{
  if (result >= 0xC) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAeroMLPhotosSearchInsightsUISurfaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAeroMLPhotosSearchInsightsUISurfaceTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_289);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosLiveTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAeroMLPhotosSearchInsightsUISurfaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAeroMLPhotosSearchInsightsUISurfaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAeroMLPhotosSearchInsightsUISurfaceTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60277A0[a1];
  }

  return v1;
}

uint64_t BMAeroMLPhotosSearchInsightsUISurfaceTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMIntelligencePlatformEmailMessageIdsSourceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligencePlatformEmailMessageIdsSourceTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_449);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligencePlatformEmailMessageIdsSourceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligencePlatformEmailMessageIdsSourceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligencePlatformEmailMessageIdsSourceTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60277F8[a1];
  }

  return v1;
}

uint64_t BMIntelligencePlatformEmailMessageIdsSourceTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMomentsEventDataPhotoMomentInferenceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPhotoMomentInferenceTypeFromString_sortedStrings, 0x1FuLL, 8uLL, &__block_literal_global_795);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataPhotoMomentInferenceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPhotoMomentInferenceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataPhotoMomentInferenceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataPhotoMomentInferenceTypeAsString(uint64_t a1)
{
  if (a1 >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029AF0[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataActionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataActionTypeFromString_sortedStrings, 0xCuLL, 8uLL, &__block_literal_global_1050);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataActionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataActionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataActionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataActionTypeAsString(uint64_t a1)
{
  if (a1 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029C70[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataPRTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPRTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_1419);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPRTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataPRTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataPRTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029FF0[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataEventProviderTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventProviderTypeFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_323);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataEventProviderTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventProviderTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataEventCategoryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventCategoryTypeFromString_sortedStrings, 0x18uLL, 8uLL, &__block_literal_global_376);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataEventCategoryTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventCategoryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_425);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataGeoPOICategoryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataGeoPOICategoryTypeFromString_sortedStrings, 0x4DuLL, 8uLL, &__block_literal_global_684);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataGeoPOICategoryTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataGeoPOICategoryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataPlaceDiscoveryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPlaceDiscoveryTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_692);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPlaceDiscoveryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataLocationModeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataLocationModeTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_700);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataLocationModeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataWorkoutActivityTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataWorkoutActivityTypeFromString_sortedStrings, 0x54uLL, 8uLL, &__block_literal_global_1013);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataWorkoutActivityTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataWorkoutActivityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataGenreTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataGenreTypeFromString_sortedStrings, 0x1CuLL, 8uLL, &__block_literal_global_1237);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataGenreTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataGenreTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataMediaTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataMediaTypeFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_1254);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataMediaTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataMediaTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataSourceAppTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataSourceAppTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_727);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataSourceAppTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataSourceAppTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataPhotoMomentSourceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPhotoMomentSourceTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_708);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPhotoMomentSourceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataSuggestedEventCategoryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataSuggestedEventCategoryTypeFromString_sortedStrings, 0xCuLL, 8uLL, &__block_literal_global_408);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataSuggestedEventCategoryTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataSuggestedEventCategoryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataTripModeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataTripModeTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_716);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataTripModeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataMapItemSourceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataMapItemSourceTypeFromString_sortedStrings, 0x11uLL, 8uLL, &__block_literal_global_1469);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataMapItemSourceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataMapItemSourceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataVisitPlaceTypesFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataVisitPlaceTypesFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1477);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataVisitPlaceTypesFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataPlaceInferenceGranularityTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPlaceInferenceGranularityTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_1488);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataPlaceInferenceGranularityTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPlaceInferenceGranularityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataPlaceInferenceGranularityTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataVisitPlaceTypesFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataMapItemSourceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataTripModeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataSuggestedEventCategoryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataPhotoMomentSourceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataSourceAppTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataMediaTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataGenreTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataWorkoutActivityTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataLocationModeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataPlaceDiscoveryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataGeoPOICategoryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataEventCategoryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataEventProviderTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

uint64_t BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeDecode(uint64_t result)
{
  if (result == 100) {
    unsigned int v1 = 100;
  }
  else {
    unsigned int v1 = 0;
  }
  if (result >= 5) {
    return v1;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataWorkoutActivityTypeDecode(uint64_t result)
{
  if (result == 3000) {
    int v1 = 3000;
  }
  else {
    int v1 = 0;
  }
  if ((result - 82) >= 3) {
    unsigned int v2 = v1;
  }
  else {
    unsigned int v2 = result;
  }
  if (result >= 0x51) {
    return v2;
  }
  else {
    return result;
  }
}

__CFString *BMMomentsEventDataEventProviderTypeAsString(uint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E6029668[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataEventCategoryTypeAsString(uint64_t a1)
{
  if (a1 >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_1E60296C8[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString(uint64_t a1)
{
  int v3 = a1;
  uint64_t v4 = @"Unknown";
  switch(v3)
  {
    case 0:
      goto LABEL_19;
    case 1:
      uint64_t v4 = @"Home";
      break;
    case 2:
      uint64_t v4 = @"Work";
      break;
    case 3:
      uint64_t v4 = @"School";
      break;
    case 4:
      uint64_t v4 = @"Gym";
      break;
    default:
      if (a1 == 100)
      {
        uint64_t v4 = @"OutingEligible";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
      }
      break;
  }
  return v4;
}

__CFString *BMMomentsEventDataGeoPOICategoryTypeAsString(uint64_t a1)
{
  if (a1 >= 0x4E)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60297F8[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataPlaceDiscoveryTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029A68[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataLocationModeTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029A80[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataWorkoutActivityTypeAsString(uint64_t a1)
{
  int v3 = a1;
  uint64_t v4 = @"Unknown";
  switch(v3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      uint64_t v4 = @"AmericanFootball";
      return v4;
    case 2:
      uint64_t v4 = @"Archery";
      return v4;
    case 3:
      uint64_t v4 = @"AustralianFootball";
      return v4;
    case 4:
      uint64_t v4 = @"Badminton";
      return v4;
    case 5:
      uint64_t v4 = @"Baseball";
      return v4;
    case 6:
      uint64_t v4 = @"Basketball";
      return v4;
    case 7:
      uint64_t v4 = @"Bowling";
      return v4;
    case 8:
      uint64_t v4 = @"Boxing";
      return v4;
    case 9:
      uint64_t v4 = @"Climbing";
      return v4;
    case 10:
      uint64_t v4 = @"Cricket";
      return v4;
    case 11:
      uint64_t v4 = @"CrossTraining";
      return v4;
    case 12:
      uint64_t v4 = @"Curling";
      return v4;
    case 13:
      uint64_t v4 = @"Cycling";
      return v4;
    case 14:
      uint64_t v4 = @"Dance";
      return v4;
    case 15:
      uint64_t v4 = @"DanceInspiredTraining";
      return v4;
    case 16:
      uint64_t v4 = @"Elliptical";
      return v4;
    case 17:
      uint64_t v4 = @"EquestrianSports";
      return v4;
    case 18:
      uint64_t v4 = @"Fencing";
      return v4;
    case 19:
      uint64_t v4 = @"Fishing";
      return v4;
    case 20:
      uint64_t v4 = @"FunctionalStrengthTraining";
      return v4;
    case 21:
      uint64_t v4 = @"Golf";
      return v4;
    case 22:
      uint64_t v4 = @"Gymnastics";
      return v4;
    case 23:
      uint64_t v4 = @"Handball";
      return v4;
    case 24:
      uint64_t v4 = @"Hiking";
      return v4;
    case 25:
      uint64_t v4 = @"Hockey";
      return v4;
    case 26:
      uint64_t v4 = @"Hunting";
      return v4;
    case 27:
      uint64_t v4 = @"Lacrosse";
      return v4;
    case 28:
      uint64_t v4 = @"MartialArts";
      return v4;
    case 29:
      uint64_t v4 = @"MindAndBody";
      return v4;
    case 30:
      uint64_t v4 = @"MixedMetabolicCardioTraining";
      return v4;
    case 31:
      uint64_t v4 = @"PaddleSports";
      return v4;
    case 32:
      uint64_t v4 = @"Play";
      return v4;
    case 33:
      uint64_t v4 = @"PreparationAndRecovery";
      return v4;
    case 34:
      uint64_t v4 = @"Racquetball";
      return v4;
    case 35:
      uint64_t v4 = @"Rowing";
      return v4;
    case 36:
      uint64_t v4 = @"Rugby";
      return v4;
    case 37:
      uint64_t v4 = @"Running";
      return v4;
    case 38:
      uint64_t v4 = @"Sailing";
      return v4;
    case 39:
      uint64_t v4 = @"SkatingSports";
      return v4;
    case 40:
      uint64_t v4 = @"SnowSports";
      return v4;
    case 41:
      uint64_t v4 = @"Soccer";
      return v4;
    case 42:
      uint64_t v4 = @"Softball";
      return v4;
    case 43:
      uint64_t v4 = @"Squash";
      return v4;
    case 44:
      uint64_t v4 = @"StairClimbing";
      return v4;
    case 45:
      uint64_t v4 = @"SurfingSports";
      return v4;
    case 46:
      uint64_t v4 = @"Swimming";
      return v4;
    case 47:
      uint64_t v4 = @"TableTennis";
      return v4;
    case 48:
      uint64_t v4 = @"Tennis";
      return v4;
    case 49:
      uint64_t v4 = @"TrackAndField";
      return v4;
    case 50:
      uint64_t v4 = @"TraditionalStrengthTraining";
      return v4;
    case 51:
      uint64_t v4 = @"Volleyball";
      return v4;
    case 52:
      uint64_t v4 = @"Walking";
      return v4;
    case 53:
      uint64_t v4 = @"WaterFitness";
      return v4;
    case 54:
      uint64_t v4 = @"WaterPolo";
      return v4;
    case 55:
      uint64_t v4 = @"WaterSports";
      return v4;
    case 56:
      uint64_t v4 = @"Wrestling";
      return v4;
    case 57:
      uint64_t v4 = @"Yoga";
      return v4;
    case 58:
      uint64_t v4 = @"Barre";
      return v4;
    case 59:
      uint64_t v4 = @"CoreTraining";
      return v4;
    case 60:
      uint64_t v4 = @"CrossCountrySkiing";
      return v4;
    case 61:
      uint64_t v4 = @"DownhillSkiing";
      return v4;
    case 62:
      uint64_t v4 = @"Flexibility";
      return v4;
    case 63:
      uint64_t v4 = @"HighIntensityIntervalTraining";
      return v4;
    case 64:
      uint64_t v4 = @"JumpRope";
      return v4;
    case 65:
      uint64_t v4 = @"Kickboxing";
      return v4;
    case 66:
      uint64_t v4 = @"Pilates";
      return v4;
    case 67:
      uint64_t v4 = @"Snowboarding";
      return v4;
    case 68:
      uint64_t v4 = @"Stairs";
      return v4;
    case 69:
      uint64_t v4 = @"StepTraining";
      return v4;
    case 70:
      uint64_t v4 = @"WheelchairWalkPace";
      return v4;
    case 71:
      uint64_t v4 = @"WheelchairRunPace";
      return v4;
    case 72:
      uint64_t v4 = @"TaiChi";
      return v4;
    case 73:
      uint64_t v4 = @"MixedCardio";
      return v4;
    case 74:
      uint64_t v4 = @"HandCycling";
      return v4;
    case 75:
      uint64_t v4 = @"DiscSports";
      return v4;
    case 76:
      uint64_t v4 = @"FitnessGaming";
      return v4;
    case 77:
      uint64_t v4 = @"CardioDance";
      return v4;
    case 78:
      uint64_t v4 = @"SocialDance";
      return v4;
    case 79:
      uint64_t v4 = @"Pickleball";
      return v4;
    case 80:
      uint64_t v4 = @"Cooldown";
      return v4;
    case 81:
      goto LABEL_9;
    case 82:
      uint64_t v4 = @"SwimBikeRun";
      return v4;
    case 83:
      uint64_t v4 = @"Transition";
      return v4;
    case 84:
      uint64_t v4 = @"UnderwaterDiving";
      return v4;
    default:
      if (a1 == 3000)
      {
        uint64_t v4 = @"Other";
      }
      else
      {
LABEL_9:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
        uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      }
      return v4;
  }
}

__CFString *BMMomentsEventDataGenreTypeAsString(uint64_t a1)
{
  if (a1 >= 0x1D)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029CD8[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataMediaTypeAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029DC0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataSourceAppTypeAsString(uint64_t a1)
{
  if a1 < 5 && ((0x1Bu >> a1))
  {
    uint64_t v1 = off_1E6029AC8[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

__CFString *BMMomentsEventDataPhotoMomentSourceTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029A98[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataSuggestedEventCategoryTypeAsString(uint64_t a1)
{
  if (a1 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029790[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataTripModeTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029AB0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataMapItemSourceTypeAsString(uint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A008[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataVisitPlaceTypesAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A098[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataPlaceInferenceGranularityTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A0B8[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataEventBundleResourceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventBundleResourceTypeFromString_sortedStrings, 0x10uLL, 8uLL, &__block_literal_global_801);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataEventBundleResourceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventBundleResourceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_63);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataEventBundleResourceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataEventBundleResourceTypeAsString(uint64_t a1)
{
  if (a1 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029558[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60295E0[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataPersonRelationshipTagFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPersonRelationshipTagFromString_sortedStrings, 0x1DuLL, 8uLL, &__block_literal_global_1836);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataPersonRelationshipTagFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPersonRelationshipTagFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataPersonRelationshipTagFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataPersonRelationshipTagAsString(uint64_t a1)
{
  if (a1 >= 0x1E)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A438[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataPlaceInferencePlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPlaceInferencePlaceTypeFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_454);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataPlaceInferencePlaceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPlaceInferencePlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataPlaceInferencePlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

uint64_t BMMomentsEventDataPlaceInferencePlaceTypeDecode(uint64_t result)
{
  if ((result - 100) >= 3) {
    unsigned int v1 = 0;
  }
  else {
    unsigned int v1 = result;
  }
  if (result >= 7) {
    return v1;
  }
  else {
    return result;
  }
}

__CFString *BMMomentsEventDataPlaceInferencePlaceTypeAsString(uint64_t a1)
{
  if ((int)a1 > 99)
  {
    switch(a1)
    {
      case 'd':
        int v3 = @"City";
        break;
      case 'e':
        int v3 = @"State";
        break;
      case 'f':
        int v3 = @"Country";
        break;
      default:
LABEL_33:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
        int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:
        break;
    }
  }
  else
  {
    int v3 = @"Unknown";
    switch((int)a1)
    {
      case 0:
        goto LABEL_34;
      case 1:
        int v3 = @"NonClassified";
        break;
      case 2:
        int v3 = @"AreaOfInterest";
        break;
      case 3:
        int v3 = @"PointOfInterest";
        break;
      case 4:
        int v3 = @"Address";
        break;
      case 5:
        int v3 = @"CoarseAddress";
        break;
      case 6:
        int v3 = @"Custom";
        break;
      default:
        goto LABEL_33;
    }
  }
  return v3;
}

unsigned char *BMMomentsEventDataStateOfMindDomainFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataStateOfMindDomainFromString_sortedStrings, 0x12uLL, 8uLL, &__block_literal_global_1731);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataStateOfMindDomainFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataStateOfMindDomainFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataStateOfMindLabelFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataStateOfMindLabelFromString_sortedStrings, 0x26uLL, 8uLL, &__block_literal_global_1687);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataStateOfMindLabelFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataStateOfMindLabelFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataStateOfMindReflectiveIntervalFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataStateOfMindReflectiveIntervalFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_1759);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataStateOfMindReflectiveIntervalFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataStateOfMindValenceClassificationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataStateOfMindValenceClassificationFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_1751);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataStateOfMindValenceClassificationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataStateOfMindValenceClassificationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataStateOfMindValenceClassificationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataStateOfMindReflectiveIntervalFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataStateOfMindLabelFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataStateOfMindDomainFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataStateOfMindDomainAsString(uint64_t a1)
{
  if (a1 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A348[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataStateOfMindLabelAsString(uint64_t a1)
{
  if (a1 >= 0x27)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A210[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataStateOfMindReflectiveIntervalAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A420[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataStateOfMindValenceClassificationAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A3E0[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataBundleInterfaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataBundleInterfaceTypeFromString_sortedStrings, 0xFuLL, 8uLL, &__block_literal_global_1030);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementBundleInterfaceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataBundleInterfaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataTimeTagTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataTimeTagTypeFromString_sortedStrings, 0x24uLL, 8uLL, &__block_literal_global_1157);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataTimeTagTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataTimeTagTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataBundleEngagementTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataBundleEngagementTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1293);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataBundleEngagementTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataSuggestionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataSuggestionTypeFromString_sortedStrings, 0x19uLL, 8uLL, &__block_literal_global_1370);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataSuggestionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataSuggestionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataAppEntryEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataAppEntryEventTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_1372);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataAppEntryEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataClientActivityEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataClientActivityEventTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_1386);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementClientActivityEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataClientActivityEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataPhotoSourceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPhotoSourceTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_1400);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataPhotoSourceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPhotoSourceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataPhotoLibraryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataPhotoLibraryTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1411);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataPhotoLibraryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataRankingTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataRankingTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1499);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataRankingTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataLabelConfidenceScoreTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataLabelConfidenceScoreTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1510);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataLabelConfidenceScoreTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataTimeCorrelationScoreTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataTimeCorrelationScoreTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1512);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataTimeCorrelationScoreTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataCallDurationTypesFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataCallDurationTypesFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1531);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataCallDurationTypesFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataInteractionCountTypesFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataInteractionCountTypesFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1536);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataInteractionCountTypesFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataBundleInteractionTypesFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataBundleInteractionTypesFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_1553);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataBundleInteractionTypesFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataBundleInteractionTypesFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataCallPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataCallPlaceTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1555);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataCallPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataDistanceFromHomeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataDistanceFromHomeTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_1523);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMShareSheetFeedbackEngagementTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataDistanceFromHomeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataAvailabilityTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataAvailabilityTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_1563);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataAvailabilityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataAnomalousTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataAnomalousTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_1571);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataAnomalousTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataEventBundleBundleSuperTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventBundleBundleSuperTypeFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_83);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataEventBundleBundleSuperTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventBundleBundleSuperTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataEventBundleBundleSubTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventBundleBundleSubTypeFromString_sortedStrings, 0x44uLL, 8uLL, &__block_literal_global_280);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataEventBundleBundleSubTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventBundleBundleSubTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataEventBundleSummarizationGranularityFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataEventBundleSummarizationGranularityFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_288);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataEventBundleSummarizationGranularityFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataEventBundleSummarizationGranularityFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataEventBundleBundleSubTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataEventBundleBundleSuperTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataAnomalousTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataAvailabilityTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataDistanceFromHomeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataCallPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataBundleInteractionTypesFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataInteractionCountTypesFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataCallDurationTypesFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataTimeCorrelationScoreTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataLabelConfidenceScoreTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataRankingTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataPhotoLibraryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataPhotoSourceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataClientActivityEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataAppEntryEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataSuggestionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataBundleEngagementTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataTimeTagTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataBundleInterfaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

BOOL BMMomentsEventDataEventBundleReadFrom(uint64_t a1, uint64_t a2)
{
  v455 = objc_opt_new();
  v450 = objc_opt_new();
  v451 = objc_opt_new();
  v453 = objc_opt_new();
  v452 = objc_opt_new();
  v454 = objc_opt_new();
  int v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = objc_opt_new();
  unint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
LABEL_782:
    uint64_t v420 = objc_msgSend(v455, "copy", v449);
    v421 = *(void **)(a1 + 376);
    *(void *)(a1 + 376) = v420;

    uint64_t v422 = [v450 copy];
    v423 = *(void **)(a1 + 392);
    *(void *)(a1 + 392) = v422;

    v424 = v5;
    uint64_t v425 = [v451 copy];
    v426 = *(void **)(a1 + 464);
    *(void *)(a1 + 464) = v425;

    v427 = v453;
    uint64_t v428 = [v453 copy];
    v429 = *(void **)(a1 + 472);
    *(void *)(a1 + 472) = v428;

    v430 = v454;
    uint64_t v431 = [v452 copy];
    v432 = *(void **)(a1 + 480);
    *(void *)(a1 + 480) = v431;

    uint64_t v433 = [v454 copy];
    v434 = *(void **)(a1 + 488);
    *(void *)(a1 + 488) = v433;

    uint64_t v435 = [v3 copy];
    v436 = *(void **)(a1 + 496);
    *(void *)(a1 + 496) = v435;

    uint64_t v437 = [v4 copy];
    v438 = *(void **)(a1 + 512);
    *(void *)(a1 + 512) = v437;

    uint64_t v439 = [v424 copy];
    v440 = *(void **)(a1 + 520);
    *(void *)(a1 + 520) = v439;
    v441 = v451;
    v442 = v450;

    v443 = v424;
    v444 = v3;
    v445 = v455;
    v446 = v452;
    BOOL v447 = *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) == 0;
    goto LABEL_783;
  }
  v8 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
      goto LABEL_782;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = *v6;
      uint64_t v13 = *(void *)(a2 + v12);
      unint64_t v14 = v13 + 1;
      if (v13 == -1 || v14 > *(void *)(a2 + *v7)) {
        break;
      }
      char v15 = *(unsigned char *)(*(void *)(a2 + *v8) + v13);
      *(void *)(a2 + v12) = v14;
      v11 |= (unint64_t)(v15 & 0x7F) << v9;
      if ((v15 & 0x80) == 0) {
        goto LABEL_12;
      }
      v9 += 7;
      BOOL v16 = v10++ >= 9;
      if (v16)
      {
        unint64_t v11 = 0;
        int v17 = *(unsigned __int8 *)(a2 + (int)*MEMORY[0x1E4F940C8]);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
LABEL_12:
    int v17 = *(unsigned __int8 *)(a2 + (int)*MEMORY[0x1E4F940C8]);
    if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
      unint64_t v11 = 0;
    }
LABEL_14:
    if (v17 || (v11 & 7) == 4) {
      goto LABEL_782;
    }
    switch((v11 >> 3))
    {
      case 1u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 360;
        goto LABEL_234;
      case 2u:
        *(unsigned char *)(a1 + 16) = 1;
        uint64_t v21 = *v6;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 24;
        goto LABEL_780;
      case 3u:
        *(unsigned char *)(a1 + 32) = 1;
        uint64_t v24 = *v6;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v25);
          *(void *)(a2 + v24) = v25 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 40;
        goto LABEL_780;
      case 4u:
        *(unsigned char *)(a1 + 48) = 1;
        uint64_t v26 = *v6;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v27);
          *(void *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 56;
        goto LABEL_780;
      case 5u:
        *(unsigned char *)(a1 + 64) = 1;
        uint64_t v28 = *v6;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v29);
          *(void *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 72;
        goto LABEL_780;
      case 6u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v33 = *v6;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v8) + v34);
            *(void *)(a2 + v33) = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if (v36 < 0)
            {
              v30 += 7;
              BOOL v16 = v31++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_487;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_487:
        if (v32 >= 0x10) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 232;
        goto LABEL_738;
      case 7u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v39 = 0;
        *(unsigned char *)(a1 + 177) = 1;
        while (2)
        {
          uint64_t v40 = *v6;
          uint64_t v41 = *(void *)(a2 + v40);
          unint64_t v42 = v41 + 1;
          if (v41 == -1 || v42 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v8) + v41);
            *(void *)(a2 + v40) = v42;
            v39 |= (unint64_t)(v43 & 0x7F) << v37;
            if (v43 < 0)
            {
              v37 += 7;
              BOOL v16 = v38++ >= 9;
              if (v16)
              {
                uint64_t v39 = 0;
                goto LABEL_493;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v39 = 0;
        }
LABEL_493:
        BOOL v414 = v39 != 0;
        uint64_t v415 = 176;
        goto LABEL_743;
      case 8u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v46 = 0;
        *(unsigned char *)(a1 + 179) = 1;
        while (2)
        {
          uint64_t v47 = *v6;
          uint64_t v48 = *(void *)(a2 + v47);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + *v8) + v48);
            *(void *)(a2 + v47) = v49;
            v46 |= (unint64_t)(v50 & 0x7F) << v44;
            if (v50 < 0)
            {
              v44 += 7;
              BOOL v16 = v45++ >= 9;
              if (v16)
              {
                uint64_t v46 = 0;
                goto LABEL_497;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v46 = 0;
        }
LABEL_497:
        BOOL v414 = v46 != 0;
        uint64_t v415 = 178;
        goto LABEL_743;
      case 9u:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v53 = 0;
        *(unsigned char *)(a1 + 181) = 1;
        while (2)
        {
          uint64_t v54 = *v6;
          uint64_t v55 = *(void *)(a2 + v54);
          unint64_t v56 = v55 + 1;
          if (v55 == -1 || v56 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v57 = *(unsigned char *)(*(void *)(a2 + *v8) + v55);
            *(void *)(a2 + v54) = v56;
            v53 |= (unint64_t)(v57 & 0x7F) << v51;
            if (v57 < 0)
            {
              v51 += 7;
              BOOL v16 = v52++ >= 9;
              if (v16)
              {
                uint64_t v53 = 0;
                goto LABEL_501;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v53 = 0;
        }
LABEL_501:
        BOOL v414 = v53 != 0;
        uint64_t v415 = 180;
        goto LABEL_743;
      case 0xAu:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v60 = 0;
        *(unsigned char *)(a1 + 183) = 1;
        while (2)
        {
          uint64_t v61 = *v6;
          uint64_t v62 = *(void *)(a2 + v61);
          unint64_t v63 = v62 + 1;
          if (v62 == -1 || v63 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v8) + v62);
            *(void *)(a2 + v61) = v63;
            v60 |= (unint64_t)(v64 & 0x7F) << v58;
            if (v64 < 0)
            {
              v58 += 7;
              BOOL v16 = v59++ >= 9;
              if (v16)
              {
                uint64_t v60 = 0;
                goto LABEL_505;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v60 = 0;
        }
LABEL_505:
        BOOL v414 = v60 != 0;
        uint64_t v415 = 182;
        goto LABEL_743;
      case 0xBu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 368;
        goto LABEL_234;
      case 0xCu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 592;
        goto LABEL_234;
      case 0xDu:
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v67 = 0;
        *(unsigned char *)(a1 + 214) = 1;
        while (2)
        {
          uint64_t v68 = *v6;
          uint64_t v69 = *(void *)(a2 + v68);
          unint64_t v70 = v69 + 1;
          if (v69 == -1 || v70 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v71 = *(unsigned char *)(*(void *)(a2 + *v8) + v69);
            *(void *)(a2 + v68) = v70;
            v67 |= (unint64_t)(v71 & 0x7F) << v65;
            if (v71 < 0)
            {
              v65 += 7;
              BOOL v16 = v66++ >= 9;
              if (v16)
              {
                uint64_t v67 = 0;
                goto LABEL_509;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v67 = 0;
        }
LABEL_509:
        BOOL v414 = v67 != 0;
        uint64_t v415 = 213;
        goto LABEL_743;
      case 0xEu:
        char v72 = 0;
        unsigned int v73 = 0;
        uint64_t v74 = 0;
        while (2)
        {
          uint64_t v75 = *v6;
          uint64_t v76 = *(void *)(a2 + v75);
          unint64_t v77 = v76 + 1;
          if (v76 == -1 || v77 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v78 = *(unsigned char *)(*(void *)(a2 + *v8) + v76);
            *(void *)(a2 + v75) = v77;
            v74 |= (unint64_t)(v78 & 0x7F) << v72;
            if (v78 < 0)
            {
              v72 += 7;
              BOOL v16 = v73++ >= 9;
              if (v16)
              {
                uint64_t v79 = 0;
                goto LABEL_514;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v79 = 0;
        }
        else {
          uint64_t v79 = v74;
        }
LABEL_514:
        int v416 = BMMomentsEventDataPlaceInferencePlaceTypeDecode(v79);
        uint64_t v417 = 340;
        goto LABEL_727;
      case 0xFu:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v82 = 0;
        while (2)
        {
          uint64_t v83 = *v6;
          uint64_t v84 = *(void *)(a2 + v83);
          unint64_t v85 = v84 + 1;
          if (v84 == -1 || v85 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v86 = *(unsigned char *)(*(void *)(a2 + *v8) + v84);
            *(void *)(a2 + v83) = v85;
            v82 |= (unint64_t)(v86 & 0x7F) << v80;
            if (v86 < 0)
            {
              v80 += 7;
              BOOL v16 = v81++ >= 9;
              if (v16)
              {
                uint64_t v87 = 0;
                goto LABEL_519;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v87 = 0;
        }
        else {
          uint64_t v87 = v82;
        }
LABEL_519:
        int v416 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeDecode(v87);
        uint64_t v417 = 344;
        goto LABEL_727;
      case 0x10u:
        char v88 = 0;
        unsigned int v89 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v90 = *v6;
          uint64_t v91 = *(void *)(a2 + v90);
          unint64_t v92 = v91 + 1;
          if (v91 == -1 || v92 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v93 = *(unsigned char *)(*(void *)(a2 + *v8) + v91);
            *(void *)(a2 + v90) = v92;
            v32 |= (unint64_t)(v93 & 0x7F) << v88;
            if (v93 < 0)
            {
              v88 += 7;
              BOOL v16 = v89++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_523;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_523:
        if (v32 >= 0x19) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 348;
        goto LABEL_738;
      case 0x11u:
        uint64_t v94 = PBReaderReadString();
        if (!v94) {
          goto LABEL_784;
        }
        v95 = (void *)v94;
        v96 = v455;
        goto LABEL_438;
      case 0x12u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        id v97 = [[BMMomentsEventDataAction alloc] initByReadFrom:a2];
        if (!v97) {
          goto LABEL_784;
        }
        uint64_t v98 = 384;
        goto LABEL_483;
      case 0x13u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        v449 = v3;
        v99 = v454;
        id v100 = [[BMMomentsEventDataAction alloc] initByReadFrom:a2];
        if (!v100) {
          goto LABEL_786;
        }
        v101 = v100;
        v102 = v450;
        goto LABEL_455;
      case 0x14u:
        char v103 = 0;
        unsigned int v104 = 0;
        uint64_t v105 = 0;
        *(unsigned char *)(a1 + 185) = 1;
        while (2)
        {
          uint64_t v106 = *v6;
          uint64_t v107 = *(void *)(a2 + v106);
          unint64_t v108 = v107 + 1;
          if (v107 == -1 || v108 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v109 = *(unsigned char *)(*(void *)(a2 + *v8) + v107);
            *(void *)(a2 + v106) = v108;
            v105 |= (unint64_t)(v109 & 0x7F) << v103;
            if (v109 < 0)
            {
              v103 += 7;
              BOOL v16 = v104++ >= 9;
              if (v16)
              {
                uint64_t v105 = 0;
                goto LABEL_529;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v105 = 0;
        }
LABEL_529:
        BOOL v414 = v105 != 0;
        uint64_t v415 = 184;
        goto LABEL_743;
      case 0x15u:
        char v110 = 0;
        unsigned int v111 = 0;
        uint64_t v112 = 0;
        while (2)
        {
          uint64_t v113 = *v6;
          uint64_t v114 = *(void *)(a2 + v113);
          unint64_t v115 = v114 + 1;
          if (v114 == -1 || v115 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v116 = *(unsigned char *)(*(void *)(a2 + *v8) + v114);
            *(void *)(a2 + v113) = v115;
            v112 |= (unint64_t)(v116 & 0x7F) << v110;
            if (v116 < 0)
            {
              v110 += 7;
              BOOL v16 = v111++ >= 9;
              if (v16)
              {
                uint64_t v117 = 0;
                goto LABEL_534;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v117 = 0;
        }
        else {
          uint64_t v117 = v112;
        }
LABEL_534:
        int v416 = BMMomentsEventDataTimeTagTypeDecode(v117);
        uint64_t v417 = 236;
        goto LABEL_727;
      case 0x16u:
        char v118 = 0;
        unsigned int v119 = 0;
        uint64_t v120 = 0;
        *(unsigned char *)(a1 + 216) = 1;
        while (2)
        {
          uint64_t v121 = *v6;
          uint64_t v122 = *(void *)(a2 + v121);
          unint64_t v123 = v122 + 1;
          if (v122 == -1 || v123 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v124 = *(unsigned char *)(*(void *)(a2 + *v8) + v122);
            *(void *)(a2 + v121) = v123;
            v120 |= (unint64_t)(v124 & 0x7F) << v118;
            if (v124 < 0)
            {
              v118 += 7;
              BOOL v16 = v119++ >= 9;
              if (v16)
              {
                uint64_t v120 = 0;
                goto LABEL_538;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v120 = 0;
        }
LABEL_538:
        BOOL v414 = v120 != 0;
        uint64_t v415 = 215;
        goto LABEL_743;
      case 0x17u:
        char v125 = 0;
        unsigned int v126 = 0;
        uint64_t v127 = 0;
        *(unsigned char *)(a1 + 218) = 1;
        while (2)
        {
          uint64_t v128 = *v6;
          uint64_t v129 = *(void *)(a2 + v128);
          unint64_t v130 = v129 + 1;
          if (v129 == -1 || v130 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v131 = *(unsigned char *)(*(void *)(a2 + *v8) + v129);
            *(void *)(a2 + v128) = v130;
            v127 |= (unint64_t)(v131 & 0x7F) << v125;
            if (v131 < 0)
            {
              v125 += 7;
              BOOL v16 = v126++ >= 9;
              if (v16)
              {
                uint64_t v127 = 0;
                goto LABEL_542;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v127 = 0;
        }
LABEL_542:
        BOOL v414 = v127 != 0;
        uint64_t v415 = 217;
        goto LABEL_743;
      case 0x18u:
        char v132 = 0;
        unsigned int v133 = 0;
        uint64_t v134 = 0;
        *(unsigned char *)(a1 + 220) = 1;
        while (2)
        {
          uint64_t v135 = *v6;
          uint64_t v136 = *(void *)(a2 + v135);
          unint64_t v137 = v136 + 1;
          if (v136 == -1 || v137 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v138 = *(unsigned char *)(*(void *)(a2 + *v8) + v136);
            *(void *)(a2 + v135) = v137;
            v134 |= (unint64_t)(v138 & 0x7F) << v132;
            if (v138 < 0)
            {
              v132 += 7;
              BOOL v16 = v133++ >= 9;
              if (v16)
              {
                uint64_t v134 = 0;
                goto LABEL_546;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v134 = 0;
        }
LABEL_546:
        BOOL v414 = v134 != 0;
        uint64_t v415 = 219;
        goto LABEL_743;
      case 0x19u:
        char v139 = 0;
        unsigned int v140 = 0;
        uint64_t v141 = 0;
        *(unsigned char *)(a1 + 222) = 1;
        while (2)
        {
          uint64_t v142 = *v6;
          uint64_t v143 = *(void *)(a2 + v142);
          unint64_t v144 = v143 + 1;
          if (v143 == -1 || v144 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v145 = *(unsigned char *)(*(void *)(a2 + *v8) + v143);
            *(void *)(a2 + v142) = v144;
            v141 |= (unint64_t)(v145 & 0x7F) << v139;
            if (v145 < 0)
            {
              v139 += 7;
              BOOL v16 = v140++ >= 9;
              if (v16)
              {
                uint64_t v141 = 0;
                goto LABEL_550;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v141 = 0;
        }
LABEL_550:
        BOOL v414 = v141 != 0;
        uint64_t v415 = 221;
        goto LABEL_743;
      case 0x1Au:
        char v146 = 0;
        unsigned int v147 = 0;
        uint64_t v148 = 0;
        *(unsigned char *)(a1 + 224) = 1;
        while (2)
        {
          uint64_t v149 = *v6;
          uint64_t v150 = *(void *)(a2 + v149);
          unint64_t v151 = v150 + 1;
          if (v150 == -1 || v151 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v152 = *(unsigned char *)(*(void *)(a2 + *v8) + v150);
            *(void *)(a2 + v149) = v151;
            v148 |= (unint64_t)(v152 & 0x7F) << v146;
            if (v152 < 0)
            {
              v146 += 7;
              BOOL v16 = v147++ >= 9;
              if (v16)
              {
                uint64_t v148 = 0;
                goto LABEL_554;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v148 = 0;
        }
LABEL_554:
        BOOL v414 = v148 != 0;
        uint64_t v415 = 223;
        goto LABEL_743;
      case 0x1Bu:
        char v153 = 0;
        unsigned int v154 = 0;
        uint64_t v155 = 0;
        *(unsigned char *)(a1 + 226) = 1;
        while (2)
        {
          uint64_t v156 = *v6;
          uint64_t v157 = *(void *)(a2 + v156);
          unint64_t v158 = v157 + 1;
          if (v157 == -1 || v158 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v159 = *(unsigned char *)(*(void *)(a2 + *v8) + v157);
            *(void *)(a2 + v156) = v158;
            v155 |= (unint64_t)(v159 & 0x7F) << v153;
            if (v159 < 0)
            {
              v153 += 7;
              BOOL v16 = v154++ >= 9;
              if (v16)
              {
                uint64_t v155 = 0;
                goto LABEL_558;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v155 = 0;
        }
LABEL_558:
        BOOL v414 = v155 != 0;
        uint64_t v415 = 225;
        goto LABEL_743;
      case 0x1Cu:
        char v160 = 0;
        unsigned int v161 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v162 = *v6;
          uint64_t v163 = *(void *)(a2 + v162);
          unint64_t v164 = v163 + 1;
          if (v163 == -1 || v164 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v165 = *(unsigned char *)(*(void *)(a2 + *v8) + v163);
            *(void *)(a2 + v162) = v164;
            v32 |= (unint64_t)(v165 & 0x7F) << v160;
            if (v165 < 0)
            {
              v160 += 7;
              BOOL v16 = v161++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_562;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_562:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 352;
        goto LABEL_738;
      case 0x1Du:
        *(unsigned char *)(a1 + 186) = 1;
        uint64_t v166 = *v6;
        unint64_t v167 = *(void *)(a2 + v166);
        if (v167 <= 0xFFFFFFFFFFFFFFF7 && v167 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v167);
          *(void *)(a2 + v166) = v167 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 400;
        goto LABEL_780;
      case 0x1Eu:
        *(unsigned char *)(a1 + 187) = 1;
        uint64_t v168 = *v6;
        unint64_t v169 = *(void *)(a2 + v168);
        if (v169 <= 0xFFFFFFFFFFFFFFF7 && v169 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v169);
          *(void *)(a2 + v168) = v169 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 408;
        goto LABEL_780;
      case 0x1Fu:
        char v170 = 0;
        unsigned int v171 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v172 = *v6;
          uint64_t v173 = *(void *)(a2 + v172);
          unint64_t v174 = v173 + 1;
          if (v173 == -1 || v174 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v175 = *(unsigned char *)(*(void *)(a2 + *v8) + v173);
            *(void *)(a2 + v172) = v174;
            v32 |= (unint64_t)(v175 & 0x7F) << v170;
            if (v175 < 0)
            {
              v170 += 7;
              BOOL v16 = v171++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_568;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_568:
        if (v32 >= 0x1A) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 240;
        goto LABEL_738;
      case 0x20u:
        *(unsigned char *)(a1 + 80) = 1;
        uint64_t v176 = *v6;
        unint64_t v177 = *(void *)(a2 + v176);
        if (v177 <= 0xFFFFFFFFFFFFFFF7 && v177 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v177);
          *(void *)(a2 + v176) = v177 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 88;
        goto LABEL_780;
      case 0x21u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 416;
        goto LABEL_234;
      case 0x22u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 424;
        goto LABEL_234;
      case 0x23u:
        *(unsigned char *)(a1 + 188) = 1;
        uint64_t v178 = *v6;
        unint64_t v179 = *(void *)(a2 + v178);
        if (v179 <= 0xFFFFFFFFFFFFFFFBLL && v179 + 4 <= *(void *)(a2 + *v7))
        {
          float v180 = *(float *)(*(void *)(a2 + *v8) + v179);
          *(void *)(a2 + v178) = v179 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          float v180 = 0.0;
        }
        double v23 = v180;
        uint64_t v419 = 432;
        goto LABEL_780;
      case 0x24u:
        char v181 = 0;
        unsigned int v182 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v183 = *v6;
          uint64_t v184 = *(void *)(a2 + v183);
          unint64_t v185 = v184 + 1;
          if (v184 == -1 || v185 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v186 = *(unsigned char *)(*(void *)(a2 + *v8) + v184);
            *(void *)(a2 + v183) = v185;
            v32 |= (unint64_t)(v186 & 0x7F) << v181;
            if (v186 < 0)
            {
              v181 += 7;
              BOOL v16 = v182++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_574;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_574:
        if (v32 >= 5) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 244;
        goto LABEL_738;
      case 0x25u:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 440;
        goto LABEL_234;
      case 0x26u:
        *(unsigned char *)(a1 + 96) = 1;
        uint64_t v187 = *v6;
        unint64_t v188 = *(void *)(a2 + v187);
        if (v188 <= 0xFFFFFFFFFFFFFFF7 && v188 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v188);
          *(void *)(a2 + v187) = v188 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 104;
        goto LABEL_780;
      case 0x27u:
        *(unsigned char *)(a1 + 112) = 1;
        uint64_t v189 = *v6;
        unint64_t v190 = *(void *)(a2 + v189);
        if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v190);
          *(void *)(a2 + v189) = v190 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 120;
        goto LABEL_780;
      case 0x28u:
        *(unsigned char *)(a1 + 128) = 1;
        uint64_t v191 = *v6;
        unint64_t v192 = *(void *)(a2 + v191);
        if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v192);
          *(void *)(a2 + v191) = v192 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 136;
        goto LABEL_780;
      case 0x29u:
        char v193 = 0;
        unsigned int v194 = 0;
        uint64_t v195 = 0;
        *(unsigned char *)(a1 + 189) = 1;
        while (2)
        {
          uint64_t v196 = *v6;
          uint64_t v197 = *(void *)(a2 + v196);
          unint64_t v198 = v197 + 1;
          if (v197 == -1 || v198 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v199 = *(unsigned char *)(*(void *)(a2 + *v8) + v197);
            *(void *)(a2 + v196) = v198;
            v195 |= (unint64_t)(v199 & 0x7F) << v193;
            if (v199 < 0)
            {
              v193 += 7;
              BOOL v16 = v194++ >= 9;
              if (v16)
              {
                LODWORD(v195) = 0;
                goto LABEL_580;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v195) = 0;
        }
LABEL_580:
        uint64_t v418 = 248;
        goto LABEL_627;
      case 0x2Au:
        char v200 = 0;
        unsigned int v201 = 0;
        uint64_t v195 = 0;
        *(unsigned char *)(a1 + 190) = 1;
        while (2)
        {
          uint64_t v202 = *v6;
          uint64_t v203 = *(void *)(a2 + v202);
          unint64_t v204 = v203 + 1;
          if (v203 == -1 || v204 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v205 = *(unsigned char *)(*(void *)(a2 + *v8) + v203);
            *(void *)(a2 + v202) = v204;
            v195 |= (unint64_t)(v205 & 0x7F) << v200;
            if (v205 < 0)
            {
              v200 += 7;
              BOOL v16 = v201++ >= 9;
              if (v16)
              {
                LODWORD(v195) = 0;
                goto LABEL_584;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v195) = 0;
        }
LABEL_584:
        uint64_t v418 = 252;
        goto LABEL_627;
      case 0x2Bu:
        char v206 = 0;
        unsigned int v207 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v208 = *v6;
          uint64_t v209 = *(void *)(a2 + v208);
          unint64_t v210 = v209 + 1;
          if (v209 == -1 || v210 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v211 = *(unsigned char *)(*(void *)(a2 + *v8) + v209);
            *(void *)(a2 + v208) = v210;
            v32 |= (unint64_t)(v211 & 0x7F) << v206;
            if (v211 < 0)
            {
              v206 += 7;
              BOOL v16 = v207++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_588;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_588:
        if (v32 >= 5) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 256;
        goto LABEL_738;
      case 0x2Cu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 448;
        goto LABEL_234;
      case 0x2Du:
        *(unsigned char *)(a1 + 144) = 1;
        uint64_t v212 = *v6;
        unint64_t v213 = *(void *)(a2 + v212);
        if (v213 <= 0xFFFFFFFFFFFFFFF7 && v213 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v213);
          *(void *)(a2 + v212) = v213 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 152;
        goto LABEL_780;
      case 0x2Eu:
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 456;
LABEL_234:
        v214 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_781;
      case 0x2Fu:
        char v215 = 0;
        unsigned int v216 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v217 = *v6;
          uint64_t v218 = *(void *)(a2 + v217);
          unint64_t v219 = v218 + 1;
          if (v218 == -1 || v219 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v220 = *(unsigned char *)(*(void *)(a2 + *v8) + v218);
            *(void *)(a2 + v217) = v219;
            v32 |= (unint64_t)(v220 & 0x7F) << v215;
            if (v220 < 0)
            {
              v215 += 7;
              BOOL v16 = v216++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_594;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_594:
        if (v32 >= 6) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 260;
        goto LABEL_738;
      case 0x30u:
        char v221 = 0;
        unsigned int v222 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v223 = *v6;
          uint64_t v224 = *(void *)(a2 + v223);
          unint64_t v225 = v224 + 1;
          if (v224 == -1 || v225 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v226 = *(unsigned char *)(*(void *)(a2 + *v8) + v224);
            *(void *)(a2 + v223) = v225;
            v32 |= (unint64_t)(v226 & 0x7F) << v221;
            if (v226 < 0)
            {
              v221 += 7;
              BOOL v16 = v222++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_600;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_600:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 264;
        goto LABEL_738;
      case 0x31u:
        char v227 = 0;
        unsigned int v228 = 0;
        uint64_t v229 = 0;
        *(unsigned char *)(a1 + 192) = 1;
        while (2)
        {
          uint64_t v230 = *v6;
          uint64_t v231 = *(void *)(a2 + v230);
          unint64_t v232 = v231 + 1;
          if (v231 == -1 || v232 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v233 = *(unsigned char *)(*(void *)(a2 + *v8) + v231);
            *(void *)(a2 + v230) = v232;
            v229 |= (unint64_t)(v233 & 0x7F) << v227;
            if (v233 < 0)
            {
              v227 += 7;
              BOOL v16 = v228++ >= 9;
              if (v16)
              {
                uint64_t v229 = 0;
                goto LABEL_606;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v229 = 0;
        }
LABEL_606:
        BOOL v414 = v229 != 0;
        uint64_t v415 = 191;
        goto LABEL_743;
      case 0x32u:
        char v234 = 0;
        unsigned int v235 = 0;
        uint64_t v236 = 0;
        *(unsigned char *)(a1 + 194) = 1;
        while (2)
        {
          uint64_t v237 = *v6;
          uint64_t v238 = *(void *)(a2 + v237);
          unint64_t v239 = v238 + 1;
          if (v238 == -1 || v239 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v240 = *(unsigned char *)(*(void *)(a2 + *v8) + v238);
            *(void *)(a2 + v237) = v239;
            v236 |= (unint64_t)(v240 & 0x7F) << v234;
            if (v240 < 0)
            {
              v234 += 7;
              BOOL v16 = v235++ >= 9;
              if (v16)
              {
                uint64_t v236 = 0;
                goto LABEL_610;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v236 = 0;
        }
LABEL_610:
        BOOL v414 = v236 != 0;
        uint64_t v415 = 193;
        goto LABEL_743;
      case 0x33u:
        char v241 = 0;
        unsigned int v242 = 0;
        uint64_t v243 = 0;
        *(unsigned char *)(a1 + 196) = 1;
        while (2)
        {
          uint64_t v244 = *v6;
          uint64_t v245 = *(void *)(a2 + v244);
          unint64_t v246 = v245 + 1;
          if (v245 == -1 || v246 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v247 = *(unsigned char *)(*(void *)(a2 + *v8) + v245);
            *(void *)(a2 + v244) = v246;
            v243 |= (unint64_t)(v247 & 0x7F) << v241;
            if (v247 < 0)
            {
              v241 += 7;
              BOOL v16 = v242++ >= 9;
              if (v16)
              {
                uint64_t v243 = 0;
                goto LABEL_614;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v243 = 0;
        }
LABEL_614:
        BOOL v414 = v243 != 0;
        uint64_t v415 = 195;
        goto LABEL_743;
      case 0x34u:
        char v248 = 0;
        unsigned int v249 = 0;
        uint64_t v250 = 0;
        *(unsigned char *)(a1 + 198) = 1;
        while (2)
        {
          uint64_t v251 = *v6;
          uint64_t v252 = *(void *)(a2 + v251);
          unint64_t v253 = v252 + 1;
          if (v252 == -1 || v253 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v254 = *(unsigned char *)(*(void *)(a2 + *v8) + v252);
            *(void *)(a2 + v251) = v253;
            v250 |= (unint64_t)(v254 & 0x7F) << v248;
            if (v254 < 0)
            {
              v248 += 7;
              BOOL v16 = v249++ >= 9;
              if (v16)
              {
                uint64_t v250 = 0;
                goto LABEL_618;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v250 = 0;
        }
LABEL_618:
        BOOL v414 = v250 != 0;
        uint64_t v415 = 197;
        goto LABEL_743;
      case 0x35u:
        char v255 = 0;
        unsigned int v256 = 0;
        uint64_t v257 = 0;
        *(unsigned char *)(a1 + 200) = 1;
        while (2)
        {
          uint64_t v258 = *v6;
          uint64_t v259 = *(void *)(a2 + v258);
          unint64_t v260 = v259 + 1;
          if (v259 == -1 || v260 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v261 = *(unsigned char *)(*(void *)(a2 + *v8) + v259);
            *(void *)(a2 + v258) = v260;
            v257 |= (unint64_t)(v261 & 0x7F) << v255;
            if (v261 < 0)
            {
              v255 += 7;
              BOOL v16 = v256++ >= 9;
              if (v16)
              {
                uint64_t v257 = 0;
                goto LABEL_622;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v257 = 0;
        }
LABEL_622:
        BOOL v414 = v257 != 0;
        uint64_t v415 = 199;
        goto LABEL_743;
      case 0x36u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        v449 = v3;
        v99 = v454;
        id v262 = [[BMMomentsEventDataPR alloc] initByReadFrom:a2];
        if (!v262) {
          goto LABEL_786;
        }
        v101 = v262;
        v102 = v451;
        goto LABEL_455;
      case 0x37u:
        char v263 = 0;
        unsigned int v264 = 0;
        uint64_t v195 = 0;
        *(unsigned char *)(a1 + 201) = 1;
        while (2)
        {
          uint64_t v265 = *v6;
          uint64_t v266 = *(void *)(a2 + v265);
          unint64_t v267 = v266 + 1;
          if (v266 == -1 || v267 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v268 = *(unsigned char *)(*(void *)(a2 + *v8) + v266);
            *(void *)(a2 + v265) = v267;
            v195 |= (unint64_t)(v268 & 0x7F) << v263;
            if (v268 < 0)
            {
              v263 += 7;
              BOOL v16 = v264++ >= 9;
              if (v16)
              {
                LODWORD(v195) = 0;
                goto LABEL_626;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v195) = 0;
        }
LABEL_626:
        uint64_t v418 = 268;
LABEL_627:
        *(_DWORD *)(a1 + v418) = v195;
        goto LABEL_781;
      case 0x38u:
        char v269 = 0;
        unsigned int v270 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v271 = *v6;
          uint64_t v272 = *(void *)(a2 + v271);
          unint64_t v273 = v272 + 1;
          if (v272 == -1 || v273 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v274 = *(unsigned char *)(*(void *)(a2 + *v8) + v272);
            *(void *)(a2 + v271) = v273;
            v32 |= (unint64_t)(v274 & 0x7F) << v269;
            if (v274 < 0)
            {
              v269 += 7;
              BOOL v16 = v270++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_631;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_631:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 272;
        goto LABEL_738;
      case 0x39u:
        char v275 = 0;
        unsigned int v276 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v277 = *v6;
          uint64_t v278 = *(void *)(a2 + v277);
          unint64_t v279 = v278 + 1;
          if (v278 == -1 || v279 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v280 = *(unsigned char *)(*(void *)(a2 + *v8) + v278);
            *(void *)(a2 + v277) = v279;
            v32 |= (unint64_t)(v280 & 0x7F) << v275;
            if (v280 < 0)
            {
              v275 += 7;
              BOOL v16 = v276++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_637;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_637:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 276;
        goto LABEL_738;
      case 0x3Au:
        char v281 = 0;
        unsigned int v282 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v283 = *v6;
          uint64_t v284 = *(void *)(a2 + v283);
          unint64_t v285 = v284 + 1;
          if (v284 == -1 || v285 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v286 = *(unsigned char *)(*(void *)(a2 + *v8) + v284);
            *(void *)(a2 + v283) = v285;
            v32 |= (unint64_t)(v286 & 0x7F) << v281;
            if (v286 < 0)
            {
              v281 += 7;
              BOOL v16 = v282++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_643;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_643:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 280;
        goto LABEL_738;
      case 0x3Bu:
        char v287 = 0;
        unsigned int v288 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v289 = *v6;
          uint64_t v290 = *(void *)(a2 + v289);
          unint64_t v291 = v290 + 1;
          if (v290 == -1 || v291 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v292 = *(unsigned char *)(*(void *)(a2 + *v8) + v290);
            *(void *)(a2 + v289) = v291;
            v32 |= (unint64_t)(v292 & 0x7F) << v287;
            if (v292 < 0)
            {
              v287 += 7;
              BOOL v16 = v288++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_649;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_649:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 284;
        goto LABEL_738;
      case 0x3Cu:
        char v293 = 0;
        unsigned int v294 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v295 = *v6;
          uint64_t v296 = *(void *)(a2 + v295);
          unint64_t v297 = v296 + 1;
          if (v296 == -1 || v297 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v298 = *(unsigned char *)(*(void *)(a2 + *v8) + v296);
            *(void *)(a2 + v295) = v297;
            v32 |= (unint64_t)(v298 & 0x7F) << v293;
            if (v298 < 0)
            {
              v293 += 7;
              BOOL v16 = v294++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_655;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_655:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 288;
        goto LABEL_738;
      case 0x3Du:
        char v299 = 0;
        unsigned int v300 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v301 = *v6;
          uint64_t v302 = *(void *)(a2 + v301);
          unint64_t v303 = v302 + 1;
          if (v302 == -1 || v303 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v304 = *(unsigned char *)(*(void *)(a2 + *v8) + v302);
            *(void *)(a2 + v301) = v303;
            v32 |= (unint64_t)(v304 & 0x7F) << v299;
            if (v304 < 0)
            {
              v299 += 7;
              BOOL v16 = v300++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_661;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_661:
        if (v32 >= 6) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 292;
        goto LABEL_738;
      case 0x3Eu:
        char v305 = 0;
        unsigned int v306 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v307 = *v6;
          uint64_t v308 = *(void *)(a2 + v307);
          unint64_t v309 = v308 + 1;
          if (v308 == -1 || v309 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v310 = *(unsigned char *)(*(void *)(a2 + *v8) + v308);
            *(void *)(a2 + v307) = v309;
            v32 |= (unint64_t)(v310 & 0x7F) << v305;
            if (v310 < 0)
            {
              v305 += 7;
              BOOL v16 = v306++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_667;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_667:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 296;
        goto LABEL_738;
      case 0x3Fu:
        char v311 = 0;
        unsigned int v312 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v313 = *v6;
          uint64_t v314 = *(void *)(a2 + v313);
          unint64_t v315 = v314 + 1;
          if (v314 == -1 || v315 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v316 = *(unsigned char *)(*(void *)(a2 + *v8) + v314);
            *(void *)(a2 + v313) = v315;
            v32 |= (unint64_t)(v316 & 0x7F) << v311;
            if (v316 < 0)
            {
              v311 += 7;
              BOOL v16 = v312++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_673;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_673:
        if (v32 >= 5) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 300;
        goto LABEL_738;
      case 0x40u:
        char v317 = 0;
        unsigned int v318 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v319 = *v6;
          uint64_t v320 = *(void *)(a2 + v319);
          unint64_t v321 = v320 + 1;
          if (v320 == -1 || v321 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v322 = *(unsigned char *)(*(void *)(a2 + *v8) + v320);
            *(void *)(a2 + v319) = v321;
            v32 |= (unint64_t)(v322 & 0x7F) << v317;
            if (v322 < 0)
            {
              v317 += 7;
              BOOL v16 = v318++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_679;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_679:
        if (v32 >= 3) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 304;
        goto LABEL_738;
      case 0x41u:
        char v323 = 0;
        unsigned int v324 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v325 = *v6;
          uint64_t v326 = *(void *)(a2 + v325);
          unint64_t v327 = v326 + 1;
          if (v326 == -1 || v327 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v328 = *(unsigned char *)(*(void *)(a2 + *v8) + v326);
            *(void *)(a2 + v325) = v327;
            v32 |= (unint64_t)(v328 & 0x7F) << v323;
            if (v328 < 0)
            {
              v323 += 7;
              BOOL v16 = v324++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_685;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_685:
        if (v32 >= 3) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 308;
        goto LABEL_738;
      case 0x42u:
        char v329 = 0;
        unsigned int v330 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v331 = *v6;
          uint64_t v332 = *(void *)(a2 + v331);
          unint64_t v333 = v332 + 1;
          if (v332 == -1 || v333 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v334 = *(unsigned char *)(*(void *)(a2 + *v8) + v332);
            *(void *)(a2 + v331) = v333;
            v32 |= (unint64_t)(v334 & 0x7F) << v329;
            if (v334 < 0)
            {
              v329 += 7;
              BOOL v16 = v330++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_691;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_691:
        if (v32 >= 0x12) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 312;
        goto LABEL_738;
      case 0x43u:
        char v335 = 0;
        unsigned int v336 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v337 = *v6;
          uint64_t v338 = *(void *)(a2 + v337);
          unint64_t v339 = v338 + 1;
          if (v338 == -1 || v339 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v340 = *(unsigned char *)(*(void *)(a2 + *v8) + v338);
            *(void *)(a2 + v337) = v339;
            v32 |= (unint64_t)(v340 & 0x7F) << v335;
            if (v340 < 0)
            {
              v335 += 7;
              BOOL v16 = v336++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_697;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_697:
        if (v32 >= 4) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 316;
        goto LABEL_738;
      case 0x44u:
        char v341 = 0;
        unsigned int v342 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v343 = *v6;
          uint64_t v344 = *(void *)(a2 + v343);
          unint64_t v345 = v344 + 1;
          if (v344 == -1 || v345 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v346 = *(unsigned char *)(*(void *)(a2 + *v8) + v344);
            *(void *)(a2 + v343) = v345;
            v32 |= (unint64_t)(v346 & 0x7F) << v341;
            if (v346 < 0)
            {
              v341 += 7;
              BOOL v16 = v342++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_703;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_703:
        if (v32 >= 6) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 320;
        goto LABEL_738;
      case 0x45u:
        char v347 = 0;
        unsigned int v348 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v349 = *v6;
          uint64_t v350 = *(void *)(a2 + v349);
          unint64_t v351 = v350 + 1;
          if (v350 == -1 || v351 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v352 = *(unsigned char *)(*(void *)(a2 + *v8) + v350);
            *(void *)(a2 + v349) = v351;
            v32 |= (unint64_t)(v352 & 0x7F) << v347;
            if (v352 < 0)
            {
              v347 += 7;
              BOOL v16 = v348++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_709;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_709:
        if (v32 >= 3) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 324;
        goto LABEL_738;
      case 0x46u:
        char v353 = 0;
        unsigned int v354 = 0;
        uint64_t v355 = 0;
        *(unsigned char *)(a1 + 203) = 1;
        while (2)
        {
          uint64_t v356 = *v6;
          uint64_t v357 = *(void *)(a2 + v356);
          unint64_t v358 = v357 + 1;
          if (v357 == -1 || v358 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v359 = *(unsigned char *)(*(void *)(a2 + *v8) + v357);
            *(void *)(a2 + v356) = v358;
            v355 |= (unint64_t)(v359 & 0x7F) << v353;
            if (v359 < 0)
            {
              v353 += 7;
              BOOL v16 = v354++ >= 9;
              if (v16)
              {
                uint64_t v355 = 0;
                goto LABEL_715;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v355 = 0;
        }
LABEL_715:
        BOOL v414 = v355 != 0;
        uint64_t v415 = 202;
        goto LABEL_743;
      case 0x47u:
        char v360 = 0;
        unsigned int v361 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v362 = *v6;
          uint64_t v363 = *(void *)(a2 + v362);
          unint64_t v364 = v363 + 1;
          if (v363 == -1 || v364 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v365 = *(unsigned char *)(*(void *)(a2 + *v8) + v363);
            *(void *)(a2 + v362) = v364;
            v32 |= (unint64_t)(v365 & 0x7F) << v360;
            if (v365 < 0)
            {
              v360 += 7;
              BOOL v16 = v361++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_719;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_719:
        if (v32 >= 0xA) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 328;
        goto LABEL_738;
      case 0x48u:
        char v366 = 0;
        unsigned int v367 = 0;
        uint64_t v368 = 0;
        while (2)
        {
          uint64_t v369 = *v6;
          uint64_t v370 = *(void *)(a2 + v369);
          unint64_t v371 = v370 + 1;
          if (v370 == -1 || v371 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v372 = *(unsigned char *)(*(void *)(a2 + *v8) + v370);
            *(void *)(a2 + v369) = v371;
            v368 |= (unint64_t)(v372 & 0x7F) << v366;
            if (v372 < 0)
            {
              v366 += 7;
              BOOL v16 = v367++ >= 9;
              if (v16)
              {
                uint64_t v373 = 0;
                goto LABEL_726;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v373 = 0;
        }
        else {
          uint64_t v373 = v368;
        }
LABEL_726:
        int v416 = BMMomentsEventDataEventBundleBundleSubTypeDecode(v373);
        uint64_t v417 = 332;
LABEL_727:
        *(_DWORD *)(a1 + v417) = v416;
        goto LABEL_781;
      case 0x49u:
        char v374 = 0;
        unsigned int v375 = 0;
        uint64_t v376 = 0;
        *(unsigned char *)(a1 + 205) = 1;
        while (2)
        {
          uint64_t v377 = *v6;
          uint64_t v378 = *(void *)(a2 + v377);
          unint64_t v379 = v378 + 1;
          if (v378 == -1 || v379 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v380 = *(unsigned char *)(*(void *)(a2 + *v8) + v378);
            *(void *)(a2 + v377) = v379;
            v376 |= (unint64_t)(v380 & 0x7F) << v374;
            if (v380 < 0)
            {
              v374 += 7;
              BOOL v16 = v375++ >= 9;
              if (v16)
              {
                uint64_t v376 = 0;
                goto LABEL_731;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v376 = 0;
        }
LABEL_731:
        BOOL v414 = v376 != 0;
        uint64_t v415 = 204;
        goto LABEL_743;
      case 0x4Au:
        char v381 = 0;
        unsigned int v382 = 0;
        uint64_t v32 = 0;
        while (2)
        {
          uint64_t v383 = *v6;
          uint64_t v384 = *(void *)(a2 + v383);
          unint64_t v385 = v384 + 1;
          if (v384 == -1 || v385 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v386 = *(unsigned char *)(*(void *)(a2 + *v8) + v384);
            *(void *)(a2 + v383) = v385;
            v32 |= (unint64_t)(v386 & 0x7F) << v381;
            if (v386 < 0)
            {
              v381 += 7;
              BOOL v16 = v382++ >= 9;
              if (v16)
              {
                LODWORD(v32) = 0;
                goto LABEL_735;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          LODWORD(v32) = 0;
        }
LABEL_735:
        if (v32 >= 3) {
          LODWORD(v32) = 0;
        }
        uint64_t v413 = 336;
LABEL_738:
        *(_DWORD *)(a1 + v413) = v32;
        goto LABEL_781;
      case 0x4Bu:
        char v387 = 0;
        unsigned int v388 = 0;
        uint64_t v389 = 0;
        *(unsigned char *)(a1 + 207) = 1;
        while (2)
        {
          uint64_t v390 = *v6;
          uint64_t v391 = *(void *)(a2 + v390);
          unint64_t v392 = v391 + 1;
          if (v391 == -1 || v392 > *(void *)(a2 + *v7))
          {
            *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          }
          else
          {
            char v393 = *(unsigned char *)(*(void *)(a2 + *v8) + v391);
            *(void *)(a2 + v390) = v392;
            v389 |= (unint64_t)(v393 & 0x7F) << v387;
            if (v393 < 0)
            {
              v387 += 7;
              BOOL v16 = v388++ >= 9;
              if (v16)
              {
                uint64_t v389 = 0;
                goto LABEL_742;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8])) {
          uint64_t v389 = 0;
        }
LABEL_742:
        BOOL v414 = v389 != 0;
        uint64_t v415 = 206;
LABEL_743:
        *(unsigned char *)(a1 + v415) = v414;
        goto LABEL_781;
      case 0x4Cu:
        uint64_t v394 = PBReaderReadString();
        if (!v394) {
          goto LABEL_784;
        }
        v95 = (void *)v394;
        v96 = v453;
        goto LABEL_438;
      case 0x4Du:
        uint64_t v395 = PBReaderReadString();
        if (!v395) {
          goto LABEL_784;
        }
        v95 = (void *)v395;
        v96 = v452;
LABEL_438:
        objc_msgSend(v96, "addObject:", v95, v449);
        goto LABEL_448;
      case 0x4Eu:
        *(unsigned char *)(a1 + 160) = 1;
        uint64_t v396 = *v6;
        unint64_t v397 = *(void *)(a2 + v396);
        if (v397 <= 0xFFFFFFFFFFFFFFF7 && v397 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v397);
          *(void *)(a2 + v396) = v397 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 168;
        goto LABEL_780;
      case 0x4Fu:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        v449 = v3;
        id v398 = [[BMMomentsEventDataEventBundleResource alloc] initByReadFrom:a2];
        if (v398)
        {
          v101 = v398;
          v102 = v454;
LABEL_455:
          objc_msgSend(v102, "addObject:", v101, v449);
          PBReaderRecallMark();
LABEL_458:

          int v3 = v449;
LABEL_781:
          if (*(void *)(a2 + *v6) >= *(void *)(a2 + *v7)) {
            goto LABEL_782;
          }
          continue;
        }
        BOOL v447 = 0;
        v445 = v455;
        v442 = v450;
        v441 = v451;
        v443 = v5;
        v444 = v3;
        v430 = v454;
LABEL_785:
        v446 = v452;
        v427 = v453;
LABEL_783:

        return v447;
      case 0x50u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        id v399 = [[BMMomentsEventDataEventBundlePerson alloc] initByReadFrom:a2];
        if (!v399) {
          goto LABEL_784;
        }
        v95 = v399;
        [v3 addObject:v399];
        PBReaderRecallMark();
LABEL_448:

        goto LABEL_781;
      case 0x51u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        id v97 = [[BMMomentsEventDataEventBundlePlace alloc] initByReadFrom:a2];
        if (!v97) {
          goto LABEL_784;
        }
        uint64_t v98 = 504;
        goto LABEL_483;
      case 0x52u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        v449 = v3;
        v99 = v454;
        id v400 = [[BMMomentsEventDataEventBundlePlace alloc] initByReadFrom:a2];
        if (!v400)
        {
LABEL_786:
          BOOL v447 = 0;
          v445 = v455;
          v442 = v450;
          v441 = v451;
          v446 = v452;
          v427 = v453;
          v443 = v5;
          v430 = v99;
          v444 = v449;
          goto LABEL_783;
        }
        v101 = v400;
        v102 = v4;
        goto LABEL_455;
      case 0x53u:
        v449 = v3;
        v99 = v454;
        uint64_t v401 = PBReaderReadString();
        if (!v401) {
          goto LABEL_786;
        }
        v101 = (void *)v401;
        [v5 addObject:v401];
        goto LABEL_458;
      case 0x54u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        id v97 = [[BMMomentsEventDataEventBundleClusterMetadata alloc] initByReadFrom:a2];
        if (!v97) {
          goto LABEL_784;
        }
        uint64_t v98 = 528;
        goto LABEL_483;
      case 0x55u:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        id v97 = [[BMMomentsEventDataEventBundleOutlierMetadata alloc] initByReadFrom:a2];
        if (!v97) {
          goto LABEL_784;
        }
        uint64_t v98 = 536;
        goto LABEL_483;
      case 0x56u:
        *(unsigned char *)(a1 + 208) = 1;
        uint64_t v402 = *v6;
        unint64_t v403 = *(void *)(a2 + v402);
        if (v403 <= 0xFFFFFFFFFFFFFFF7 && v403 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v403);
          *(void *)(a2 + v402) = v403 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 544;
        goto LABEL_780;
      case 0x57u:
        *(unsigned char *)(a1 + 209) = 1;
        uint64_t v404 = *v6;
        unint64_t v405 = *(void *)(a2 + v404);
        if (v405 <= 0xFFFFFFFFFFFFFFF7 && v405 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v405);
          *(void *)(a2 + v404) = v405 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 552;
        goto LABEL_780;
      case 0x58u:
        *(unsigned char *)(a1 + 210) = 1;
        uint64_t v406 = *v6;
        unint64_t v407 = *(void *)(a2 + v406);
        if (v407 <= 0xFFFFFFFFFFFFFFF7 && v407 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v407);
          *(void *)(a2 + v406) = v407 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 560;
        goto LABEL_780;
      case 0x59u:
        *(unsigned char *)(a1 + 211) = 1;
        uint64_t v408 = *v6;
        unint64_t v409 = *(void *)(a2 + v408);
        if (v409 <= 0xFFFFFFFFFFFFFFF7 && v409 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v409);
          *(void *)(a2 + v408) = v409 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 568;
        goto LABEL_780;
      case 0x5Au:
        *(unsigned char *)(a1 + 212) = 1;
        uint64_t v410 = *v6;
        unint64_t v411 = *(void *)(a2 + v410);
        if (v411 <= 0xFFFFFFFFFFFFFFF7 && v411 + 8 <= *(void *)(a2 + *v7))
        {
          double v23 = *(double *)(*(void *)(a2 + *v8) + v411);
          *(void *)(a2 + v410) = v411 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + (int)*MEMORY[0x1E4F940C8]) = 1;
          double v23 = 0.0;
        }
        uint64_t v419 = 576;
LABEL_780:
        *(double *)(a1 + v419) = v23;
        goto LABEL_781;
      case 0x5Bu:
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_784;
        }
        id v97 = [[BMMomentsEventDataEventBundleMetadataForRank alloc] initByReadFrom:a2];
        if (!v97) {
          goto LABEL_784;
        }
        uint64_t v98 = 584;
LABEL_483:
        v412 = *(void **)(a1 + v98);
        *(void *)(a1 + v98) = v97;

        PBReaderRecallMark();
        goto LABEL_781;
      default:
        if (PBReaderSkipValueWithTag()) {
          goto LABEL_781;
        }
LABEL_784:
        BOOL v447 = 0;
        v442 = v450;
        v441 = v451;
        v443 = v5;
        v444 = v3;
        v430 = v454;
        v445 = v455;
        goto LABEL_785;
    }
  }
}

uint64_t BMMomentsEventDataTimeTagTypeDecode(uint64_t result)
{
  if ((result - 2000) >= 3) {
    unsigned int v1 = 0;
  }
  else {
    unsigned int v1 = result;
  }
  if ((result - 100) >= 0xF) {
    unsigned int v2 = v1;
  }
  else {
    unsigned int v2 = result;
  }
  if (result >= 0x13) {
    return v2;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataEventBundleBundleSubTypeDecode(uint64_t result)
{
  if ((int)result <= 600)
  {
    if ((int)result > 300)
    {
      if ((result - 401) >= 0xA && (result - 501) >= 4 && (result - 301) >= 3) {
        return 0;
      }
    }
    else if ((result - 201) >= 7 && (result - 101) >= 6 && result)
    {
      return 0;
    }
  }
  else if ((int)result <= 700)
  {
    if ((result - 601) >= 0x11) {
      return 0;
    }
  }
  else if ((result - 901) >= 0xA {
         && (result - 701) >= 9
  }
         && (result - 801) >= 2)
  {
    return 0;
  }
  return result;
}

__CFString *BMMomentsEventDataBundleInterfaceTypeAsString(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    unsigned int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v1 = off_1E6029BF0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataTimeTagTypeAsString(uint64_t a1)
{
  if ((int)a1 > 99)
  {
    if ((int)a1 > 1999)
    {
      switch(a1)
      {
        case 0x7D0:
          int v3 = @"Breakfast";
          break;
        case 0x7D1:
          int v3 = @"Lunch";
          break;
        case 0x7D2:
          int v3 = @"Dinner";
          break;
        default:
LABEL_116:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
          int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_117:
          break;
      }
    }
    else
    {
      switch((int)a1)
      {
        case 'd':
          int v3 = @"Today";
          break;
        case 'e':
          int v3 = @"Yesterday";
          break;
        case 'f':
          int v3 = @"Sunday";
          break;
        case 'g':
          int v3 = @"Monday";
          break;
        case 'h':
          int v3 = @"Tuesday";
          break;
        case 'i':
          int v3 = @"Wednesday";
          break;
        case 'j':
          int v3 = @"Thursday";
          break;
        case 'k':
          int v3 = @"Friday";
          break;
        case 'l':
          int v3 = @"Saturday";
          break;
        case 'm':
          int v3 = @"ThisWeek";
          break;
        case 'n':
          int v3 = @"LastWeek";
          break;
        case 'o':
          int v3 = @"ThisMonth";
          break;
        case 'p':
          int v3 = @"LastMonth";
          break;
        case 'q':
          int v3 = @"ThisYear";
          break;
        case 'r':
          int v3 = @"LastYear";
          break;
        default:
          goto LABEL_116;
      }
    }
  }
  else
  {
    int v3 = @"Unknown";
    switch((int)a1)
    {
      case 0:
        goto LABEL_117;
      case 1:
        int v3 = @"Custom";
        break;
      case 2:
        int v3 = @"Morning";
        break;
      case 3:
        int v3 = @"Afternoon";
        break;
      case 4:
        int v3 = @"Evening";
        break;
      case 5:
        int v3 = @"Night";
        break;
      case 6:
        int v3 = @"MidNight";
        break;
      case 7:
        int v3 = @"Day";
        break;
      case 8:
        int v3 = @"Week";
        break;
      case 9:
        int v3 = @"Month";
        break;
      case 10:
        int v3 = @"Year";
        break;
      case 11:
        int v3 = @"LongTerm";
        break;
      case 12:
        int v3 = @"Weekday";
        break;
      case 13:
        int v3 = @"Weekend";
        break;
      case 14:
        int v3 = @"LongWeekend";
        break;
      case 15:
        int v3 = @"Holiday";
        break;
      case 16:
        int v3 = @"Vacation";
        break;
      case 17:
        int v3 = @"Prenoon";
        break;
      case 18:
        int v3 = @"Preevening";
        break;
      default:
        goto LABEL_116;
    }
  }
  return v3;
}

__CFString *BMMomentsEventDataBundleEngagementTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029E60[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataSuggestionTypeAsString(uint64_t a1)
{
  if (a1 >= 0x1A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029E80[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataAppEntryEventTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029F50[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataClientActivityEventTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029F78[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataPhotoSourceTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029FA0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataPhotoLibraryTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029FD0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataRankingTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A0E8[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataLabelConfidenceScoreTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A108[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataTimeCorrelationScoreTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A108[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataCallDurationTypesAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A150[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataInteractionCountTypesAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A170[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataBundleInteractionTypesAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A190[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataCallPlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A1C0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataDistanceFromHomeTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A128[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataAvailabilityTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A1E0[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataAnomalousTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A1F8[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataEventBundleBundleSuperTypeAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029600[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataEventBundleBundleSubTypeAsString(uint64_t a1)
{
  if ((int)a1 <= 600)
  {
    if ((int)a1 > 302)
    {
      switch((int)a1)
      {
        case 401:
          unsigned int v2 = @"SongOnRepeat";
          break;
        case 402:
          unsigned int v2 = @"PlayedSong";
          break;
        case 403:
          unsigned int v2 = @"PlayedPodCast";
          break;
        case 404:
          unsigned int v2 = @"MediaOnRepeatWeeklySummary";
          break;
        case 405:
          unsigned int v2 = @"PlayedMediaWeeklySummary";
          break;
        case 406:
          unsigned int v2 = @"MediaSuppressed";
          break;
        case 407:
          unsigned int v2 = @"MediaOnRepeatThirdParty";
          break;
        case 408:
          unsigned int v2 = @"PlayedMediaThirdParty";
          break;
        case 409:
          unsigned int v2 = @"MediaOnRepeatWeeklySummaryThirdParty";
          break;
        case 410:
          unsigned int v2 = @"PlayedMediaWeeklySummaryThirdParty";
          break;
        default:
          switch((int)a1)
          {
            case 501:
              unsigned int v2 = @"TimeAtHome";
              break;
            case 502:
              unsigned int v2 = @"PhotosAtHome";
              break;
            case 503:
              unsigned int v2 = @"HostingAtHome";
              break;
            case 504:
              unsigned int v2 = @"EvergreenAtHome";
              break;
            default:
              if (a1 == 303)
              {
                unsigned int v2 = @"ContactTrend";
              }
              else
              {
LABEL_81:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
                unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
          break;
      }
    }
    else if ((int)a1 <= 200)
    {
      switch((int)a1)
      {
        case 'e':
          unsigned int v2 = @"Visit";
          break;
        case 'f':
          unsigned int v2 = @"Flight";
          break;
        case 'g':
          unsigned int v2 = @"Dining";
          break;
        case 'h':
          unsigned int v2 = @"Shopping";
          break;
        case 'i':
          unsigned int v2 = @"Trip";
          break;
        case 'j':
          unsigned int v2 = @"PreOnboardedVisit";
          break;
        default:
          if (a1) {
            goto LABEL_81;
          }
          unsigned int v2 = @"Unknown";
          break;
      }
    }
    else
    {
      switch((int)a1)
      {
        case 201:
          unsigned int v2 = @"Workout";
          break;
        case 202:
          unsigned int v2 = @"WorkoutWeeklySummary";
          break;
        case 203:
          unsigned int v2 = @"WorkoutRoutine";
          break;
        case 204:
          unsigned int v2 = @"MotionActivityWalking";
          break;
        case 205:
          unsigned int v2 = @"WorkoutTransit";
          break;
        case 206:
          unsigned int v2 = @"MotionActivityTransit";
          break;
        case 207:
          unsigned int v2 = @"MotionActivityRunning";
          break;
        default:
          if (a1 == 301)
          {
            unsigned int v2 = @"Contact";
          }
          else
          {
            if (a1 != 302) {
              goto LABEL_81;
            }
            unsigned int v2 = @"ContactWeeklySummary";
          }
          break;
      }
    }
  }
  else if ((int)a1 <= 800)
  {
    switch((int)a1)
    {
      case 601:
        unsigned int v2 = @"PhotoMemorySingleMoment";
        break;
      case 602:
        unsigned int v2 = @"PhotoMemoryPerson";
        break;
      case 603:
        unsigned int v2 = @"PhotoMemorySocialGroup";
        break;
      case 604:
        unsigned int v2 = @"PhotoMemoryLastMonthAtHome";
        break;
      case 605:
        unsigned int v2 = @"PhotoMemoryLookbacks";
        break;
      case 606:
        unsigned int v2 = @"PhotoMemoryFoodie";
        break;
      case 607:
        unsigned int v2 = @"PhotoMemoryPet";
        break;
      case 608:
        unsigned int v2 = @"PhotoMemoryLocation";
        break;
      case 609:
        unsigned int v2 = @"PhotoMemoryMeaningfulEvent";
        break;
      case 610:
        unsigned int v2 = @"PhotoMemoryTrip";
        break;
      case 611:
        unsigned int v2 = @"PhotoMemoryPastSuperSet";
        break;
      case 612:
        unsigned int v2 = @"PhotoMemorySeason";
        break;
      case 613:
        unsigned int v2 = @"PhotoMemoryRecentHighlights";
        break;
      case 614:
        unsigned int v2 = @"PhotoMemoryFamily";
        break;
      case 615:
        unsigned int v2 = @"PhotoMemoryExcitingMoments";
        break;
      case 616:
        unsigned int v2 = @"PhotoMemoryTrends";
        break;
      case 617:
        unsigned int v2 = @"PhotoMemoryOthers";
        break;
      default:
        switch((int)a1)
        {
          case 701:
            unsigned int v2 = @"EvergreenGratitude";
            break;
          case 702:
            unsigned int v2 = @"EvergreenWisdom";
            break;
          case 703:
            unsigned int v2 = @"EvergreenResillience";
            break;
          case 704:
            unsigned int v2 = @"EvergreenCreativity";
            break;
          case 705:
            unsigned int v2 = @"EvergreenKindness";
            break;
          case 706:
            unsigned int v2 = @"EvergreenPurpose";
            break;
          case 707:
            unsigned int v2 = @"TimeAtHomeEvergreenGratitude";
            break;
          case 708:
            unsigned int v2 = @"TimeAtHomeEvergreenResilience";
            break;
          case 709:
            unsigned int v2 = @"TimeAtHomeEvergreenPurpose";
            break;
          default:
            goto LABEL_81;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 901:
        unsigned int v2 = @"ClusteringOutingRoutine";
        break;
      case 902:
        unsigned int v2 = @"ClusteringActivityRoutine";
        break;
      case 903:
        unsigned int v2 = @"ClusteringContactRoutine";
        break;
      case 904:
        unsigned int v2 = @"ClusteringTimeAtHomeRoutine";
        break;
      case 905:
        unsigned int v2 = @"ClusteringLocationGrouping";
        break;
      case 906:
        unsigned int v2 = @"ClusteringActivityGrouping";
        break;
      case 907:
        unsigned int v2 = @"ClusteringContactGrouping";
        break;
      case 908:
        unsigned int v2 = @"ClusteringThematicGrouping";
        break;
      case 909:
        unsigned int v2 = @"ClusteringTimeAtHomeGrouping";
        break;
      case 910:
        unsigned int v2 = @"ClusteringUnspecifiedGrouping";
        break;
      default:
        if (a1 == 801)
        {
          unsigned int v2 = @"DailyMood";
        }
        else
        {
          if (a1 != 802) {
            goto LABEL_81;
          }
          unsigned int v2 = @"MomentaryEmotion";
        }
        break;
    }
  }
  return v2;
}

__CFString *BMMomentsEventDataEventBundleSummarizationGranularityAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029650[a1];
  }

  return v1;
}

unsigned char *BMMomentsEventDataAgeRangeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataAgeRangeTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_1274);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataAgeRangeTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataAgeRangeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataBiologicalSexTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataBiologicalSexTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1282);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataBiologicalSexTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEventDataOnboardingFlowCompletionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEventDataOnboardingFlowCompletionFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_1847);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEventDataOnboardingFlowCompletionFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEventDataOnboardingFlowCompletionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEventDataOnboardingFlowCompletionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataBiologicalSexTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEventDataAgeRangeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEventDataAgeRangeTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029E08[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataBiologicalSexTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6029E40[a1];
  }

  return v1;
}

__CFString *BMMomentsEventDataOnboardingFlowCompletionAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A528[a1];
  }

  return v1;
}

uint64_t BMMomentsEventDataEventBundleResourceTypeDecode(uint64_t result)
{
  if (result >= 0x11) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataEventBundleResourcePhotoAssetMediaTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataEventBundleBundleSuperTypeDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataEventBundleSummarizationGranularityDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataEventProviderTypeDecode(uint64_t result)
{
  if (result >= 0xC) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataEventCategoryTypeDecode(uint64_t result)
{
  if (result >= 0x19) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataSuggestedEventCategoryTypeDecode(uint64_t result)
{
  if (result >= 0xD) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataGeoPOICategoryTypeDecode(uint64_t result)
{
  if (result >= 0x4E) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPlaceDiscoveryTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataLocationModeTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPhotoMomentSourceTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataTripModeTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataSourceAppTypeDecode(unsigned int a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return dword_1B35D6F50[a1];
  }
}

uint64_t BMMomentsEventDataPhotoMomentInferenceTypeDecode(uint64_t result)
{
  if (result >= 0x20) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataBundleInterfaceTypeDecode(uint64_t result)
{
  if (result >= 0x10) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataActionTypeDecode(uint64_t result)
{
  if (result >= 0xD) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataGenreTypeDecode(uint64_t result)
{
  if (result >= 0x1D) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataMediaTypeDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataAgeRangeTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataBiologicalSexTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataBundleEngagementTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataSuggestionTypeDecode(uint64_t result)
{
  if (result >= 0x1A) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataAppEntryEventTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataClientActivityEventTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPhotoSourceTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPhotoLibraryTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPRTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataMapItemSourceTypeDecode(uint64_t result)
{
  if (result >= 0x12) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataVisitPlaceTypesDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPlaceInferenceGranularityTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataRankingTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataLabelConfidenceScoreTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataTimeCorrelationScoreTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataDistanceFromHomeTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataCallDurationTypesDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataInteractionCountTypesDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataBundleInteractionTypesDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataCallPlaceTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataAvailabilityTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataAnomalousTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataStateOfMindLabelDecode(uint64_t result)
{
  if (result >= 0x27) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataStateOfMindDomainDecode(uint64_t result)
{
  if (result >= 0x13) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataStateOfMindValenceClassificationDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataStateOfMindReflectiveIntervalDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataPersonRelationshipTagDecode(uint64_t result)
{
  if (result >= 0x1E) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEventDataOnboardingFlowCompletionDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosNotificationTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosNotificationTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_919);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosNotificationTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosNotificationTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosNotificationTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A578[a1];
  }

  return v1;
}

uint64_t BMPhotosNotificationTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMUserFocusModeComputedUpdateReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusModeComputedUpdateReasonFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1136);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusModeComputedUpdateReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMUserFocusModeComputedSemanticTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusModeComputedSemanticTypeFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_48);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMUserFocusModeComputedSemanticTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusModeComputedSemanticTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMUserFocusModeComputedUpdateSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusModeComputedUpdateSourceFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_59);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusModeComputedUpdateSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMUserFocusModeComputedUpdateSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMUserFocusModeComputedSemanticTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMUserFocusModeComputedUpdateReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMUserFocusModeComputedUpdateReasonAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A650[a1];
  }

  return v1;
}

__CFString *BMUserFocusModeComputedSemanticTypeAsString(uint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A670[a1];
  }

  return v1;
}

__CFString *BMUserFocusModeComputedUpdateSourceAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A6D0[a1];
  }

  return v1;
}

uint64_t BMUserFocusModeComputedUpdateReasonDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMUserFocusModeComputedSemanticTypeDecode(uint64_t result)
{
  if (result >= 0xC) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMUserFocusModeComputedUpdateSourceDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariPageLoadPlatformFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariPageLoadPlatformFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_1718);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariPageLoadPlatformFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariPageLoadDeviceClassFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariPageLoadDeviceClassFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_21);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariPageLoadDeviceClassFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariPageLoadEntryPointFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariPageLoadEntryPointFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_29);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariPageLoadEntryPointFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariPageLoadEntryPointFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariPageLoadDeviceClassFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariPageLoadPlatformFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariPageLoadPlatformAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A7C8[a1];
  }

  return v1;
}

__CFString *BMSafariPageLoadDeviceClassAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A7E8[a1];
  }

  return v1;
}

__CFString *BMSafariPageLoadEntryPointAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A800[a1];
  }

  return v1;
}

uint64_t BMSafariPageLoadPlatformDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariPageLoadDeviceClassDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariPageLoadEntryPointDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMContextSyncLOIUserSpecificPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncLOIUserSpecificPlaceTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_2190);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncLOIUserSpecificPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMContextSyncLOIPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncLOIPlaceTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_27);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncLOIPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMContextSyncLOIPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMContextSyncLOIUserSpecificPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMContextSyncLOIUserSpecificPlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A930[a1];
  }

  return v1;
}

__CFString *BMContextSyncLOIPlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602A958[a1];
  }

  return v1;
}

uint64_t BMContextSyncLOIUserSpecificPlaceTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMContextSyncLOIPlaceTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceAccessoryChargingSessionSideFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceAccessoryChargingSessionSideFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_3312);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceAccessoryChargingSessionSideFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceAccessoryChargingSessionSideFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceAccessoryChargingSessionSideAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602AA78[a1];
  }

  return v1;
}

uint64_t BMDeviceAccessoryChargingSessionSideDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMContextSyncCellularAvailabilityStatusDeviceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncCellularAvailabilityStatusDeviceTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_24);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncCellularAvailabilityStatusDeviceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMContextSyncCellularAvailabilityStatusStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncCellularAvailabilityStatusStateFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_4011);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncCellularAvailabilityStatusStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMContextSyncCellularAvailabilityStatusStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMContextSyncCellularAvailabilityStatusDeviceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMContextSyncCellularAvailabilityStatusDeviceTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602AB68[a1];
  }

  return v1;
}

__CFString *BMContextSyncCellularAvailabilityStatusStateAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602AB40[a1];
  }

  return v1;
}

uint64_t BMContextSyncCellularAvailabilityStatusStateDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMContextSyncCellularAvailabilityStatusDeviceTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSensitiveContentAnalysisUIInteractionInteractionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisUIInteractionInteractionTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_4565);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisUIInteractionInteractionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisUIInteractionAgeGroupFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisUIInteractionAgeGroupFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_24_4552);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisUIInteractionAgeGroupFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisUIInteractionEventDirectionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisUIInteractionEventDirectionFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_35);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisUIInteractionEventDirectionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisUIInteractionScreenFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisUIInteractionScreenFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_43);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisUIInteractionScreenFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisUIInteractionActionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisUIInteractionActionFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_72);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSensitiveContentAnalysisUIInteractionActionFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisUIInteractionActionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisUIInteractionContentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisUIInteractionContentTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_80);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisUIInteractionContentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSensitiveContentAnalysisUIInteractionContentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisUIInteractionActionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisUIInteractionScreenFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisUIInteractionEventDirectionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisUIInteractionAgeGroupFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisUIInteractionInteractionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSensitiveContentAnalysisUIInteractionInteractionTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602AC80[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisUIInteractionAgeGroupAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602ACA0[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisUIInteractionEventDirectionAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602ACC0[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisUIInteractionScreenAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602ACE0[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisUIInteractionActionAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602ACF8[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisUIInteractionContentTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602AD48[a1];
  }

  return v1;
}

uint64_t BMSensitiveContentAnalysisUIInteractionInteractionTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisUIInteractionAgeGroupDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisUIInteractionEventDirectionDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisUIInteractionScreenDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisUIInteractionActionDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisUIInteractionContentTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriExecutionTaskStepFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriExecutionTaskStepFromString_sortedStrings, 0x5EuLL, 8uLL, &__block_literal_global_4773);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriExecutionTaskStepFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriExecutionTaskStepFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriExecutionTaskStepFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriExecutionTaskStepAsString(uint64_t a1)
{
  if (a1 >= 0x5F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602B090[a1];
  }

  return v1;
}

uint64_t BMSiriExecutionTaskStepDecode(uint64_t result)
{
  if (result >= 0x5F) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMHealthWorkoutEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMHealthWorkoutEventTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_5007);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMHealthWorkoutEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMHealthWorkoutEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMHealthWorkoutEventTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602B3D8[a1];
  }

  return v1;
}

uint64_t BMHealthWorkoutEventTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSageTranscriptSerializationFormatFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSageTranscriptSerializationFormatFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_5667);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSageTranscriptSerializationFormatFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSageTranscriptSerializationFormatFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSageTranscriptSerializationFormatAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602B690[a1];
  }

  return v1;
}

uint64_t BMSageTranscriptSerializationFormatDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMWalletTransactionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletTransactionTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_6456);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMContextSyncWalletTransactionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletTransactionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletTransactionMerchantTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletTransactionMerchantTypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_45);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletSettledTransactionMerchantTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletTransactionMerchantTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMWalletTransactionMerchantTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletTransactionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMWalletTransactionTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602B7B8[a1];
  }

  return v1;
}

__CFString *BMWalletTransactionMerchantTypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602B7F0[a1];
  }

  return v1;
}

uint64_t BMWalletTransactionTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletTransactionMerchantTypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLocationHashedCoordinatesSpeedRangeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationHashedCoordinatesSpeedRangeFromString_sortedStrings, 0xAuLL, 8uLL, &__block_literal_global_7111);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMLocationHashedCoordinatesSpeedRangeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationHashedCoordinatesSpeedRangeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMLocationHashedCoordinatesAltitudeRangeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationHashedCoordinatesAltitudeRangeFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_63_7101);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMLocationHashedCoordinatesAltitudeRangeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationHashedCoordinatesAltitudeRangeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMLocationHashedCoordinatesDistanceRangeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationHashedCoordinatesDistanceRangeFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_71);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMLocationHashedCoordinatesDistanceRangeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationHashedCoordinatesDistanceRangeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLocationHashedCoordinatesDistanceRangeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMLocationHashedCoordinatesAltitudeRangeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMLocationHashedCoordinatesSpeedRangeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLocationHashedCoordinatesSpeedRangeAsString(uint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602B9C0[a1];
  }

  return v1;
}

__CFString *BMLocationHashedCoordinatesAltitudeRangeAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BA18[a1];
  }

  return v1;
}

__CFString *BMLocationHashedCoordinatesDistanceRangeAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BA68[a1];
  }

  return v1;
}

uint64_t BMLocationHashedCoordinatesSpeedRangeDecode(uint64_t result)
{
  if (result >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationHashedCoordinatesAltitudeRangeDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationHashedCoordinatesDistanceRangeDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMLSELabeledDataStoreLabelingEvidenceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSELabeledDataStoreLabelingEvidenceTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_7934);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSELabeledDataStoreLabelingEvidenceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSELabeledDataStoreLabelingEvidenceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSELabeledDataStoreLabelingEvidenceTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BBE0[a1];
  }

  return v1;
}

uint64_t BMMLSELabeledDataStoreLabelingEvidenceTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosDeleteTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosDeleteTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_8241);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMPhotosDeleteTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosDeleteTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosDeleteTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BC48[a1];
  }

  return v1;
}

uint64_t BMPhotosDeleteTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMediaNowPlayingOutputDeviceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaNowPlayingOutputDeviceTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_8546);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMediaRouteOutputDeviceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaNowPlayingOutputDeviceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMediaNowPlayingOutputDeviceSubTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaNowPlayingOutputDeviceSubTypeFromString_sortedStrings, 0x14uLL, 8uLL, &__block_literal_global_81);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMediaNowPlayingOutputDeviceSubTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaNowPlayingOutputDeviceSubTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMediaNowPlayingOutputDeviceSubTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMediaNowPlayingOutputDeviceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMediaNowPlayingOutputDeviceTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BE78[a1];
  }

  return v1;
}

__CFString *BMMediaNowPlayingOutputDeviceSubTypeAsString(uint64_t a1)
{
  if (a1 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BEA8[a1];
  }

  return v1;
}

unsigned char *BMMediaNowPlayingPlaybackStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaNowPlayingPlaybackStateFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_98);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMediaNowPlayingPlaybackStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaNowPlayingPlaybackStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMediaNowPlayingMediaTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaNowPlayingMediaTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_106);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaNowPlayingMediaTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMediaNowPlayingMediaSubtypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaNowPlayingMediaSubtypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_129);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMediaNowPlayingMediaSubtypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaNowPlayingMediaSubtypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMediaNowPlayingMediaSubtypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMediaNowPlayingMediaTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMediaNowPlayingPlaybackStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMediaNowPlayingPlaybackStateAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BF50[a1];
  }

  return v1;
}

__CFString *BMMediaNowPlayingMediaTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BF80[a1];
  }

  return v1;
}

__CFString *BMMediaNowPlayingMediaSubtypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602BF98[a1];
  }

  return v1;
}

uint64_t BMMediaNowPlayingOutputDeviceTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaNowPlayingOutputDeviceSubTypeDecode(uint64_t result)
{
  if (result >= 0x15) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaNowPlayingPlaybackStateDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaNowPlayingMediaTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaNowPlayingMediaSubtypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString_sortedStrings, 0x11uLL, 8uLL, &__block_literal_global_9125);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMCommCenterEmergencyVoiceCallSIP380ProcedureFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMCommCenterEmergencyVoiceCallSIP380ProcedureFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_69);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosLiveTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMCommCenterEmergencyVoiceCallSIP380ProcedureFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMCommCenterEmergencyVoiceCallEmergencyURNFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMCommCenterEmergencyVoiceCallEmergencyURNFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_86);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMCommCenterEmergencyVoiceCallEmergencyURNFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMCommCenterEmergencyVoiceCallEmergencyURNFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMCommCenterEmergencyVoiceCallEmergencyURNFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMCommCenterEmergencyVoiceCallSIP380ProcedureFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMCommCenterEmergencyVoiceCallMatchedEmNumSourceAsString(uint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C108[a1];
  }

  return v1;
}

__CFString *BMCommCenterEmergencyVoiceCallSIP380ProcedureAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C198[a1];
  }

  return v1;
}

__CFString *BMCommCenterEmergencyVoiceCallEmergencyURNAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C1C0[a1];
  }

  return v1;
}

uint64_t BMCommCenterEmergencyVoiceCallMatchedEmNumSourceDecode(uint64_t result)
{
  if (result >= 0x12) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMCommCenterEmergencyVoiceCallSIP380ProcedureDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMCommCenterEmergencyVoiceCallEmergencyURNDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAdPlatformsDiscardReasonsDiscardReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAdPlatformsDiscardReasonsDiscardReasonFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_9395);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAdPlatformsDiscardReasonsDiscardReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAdPlatformsDiscardReasonsDiscardReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAdPlatformsDiscardReasonsPlacementFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAdPlatformsDiscardReasonsPlacementFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_45_9358);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAdPlatformsDiscardReasonsPlacementFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAdPlatformsDiscardReasonsPlacementFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAdPlatformsDiscardReasonsPlacementFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAdPlatformsDiscardReasonsDiscardReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

uint64_t BMAdPlatformsDiscardReasonsPlacementDecode(uint64_t result)
{
  if ((int)result > 7004)
  {
    if ((result - 7005) >= 4 && result != 9000) {
      return 0;
    }
  }
  else if ((result - 100) >= 6 && result)
  {
    return 0;
  }
  return result;
}

__CFString *BMAdPlatformsDiscardReasonsDiscardReasonAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 2701)
    {
      unsigned int v2 = @"Frequency";
    }
    else if (a1 == 2700)
    {
      unsigned int v2 = @"Age";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

__CFString *BMAdPlatformsDiscardReasonsPlacementAsString(uint64_t a1)
{
  if ((int)a1 > 7004)
  {
    switch((int)a1)
    {
      case 7005:
        unsigned int v2 = @"ASLanding";
        break;
      case 7006:
        unsigned int v2 = @"ASToday";
        break;
      case 7007:
        unsigned int v2 = @"ASProduct";
        break;
      case 7008:
        unsigned int v2 = @"ASDownload";
        break;
      default:
        if (a1 == 9000)
        {
          unsigned int v2 = @"Downey";
        }
        else
        {
LABEL_42:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
          unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 'd':
        unsigned int v2 = @"Content";
        break;
      case 'e':
        unsigned int v2 = @"List";
        break;
      case 'f':
        unsigned int v2 = @"Grid";
        break;
      case 'g':
        unsigned int v2 = @"Interstitial";
        break;
      case 'h':
        unsigned int v2 = @"Video";
        break;
      case 'i':
        unsigned int v2 = @"Audio";
        break;
      default:
        if (a1) {
          goto LABEL_42;
        }
        unsigned int v2 = @"Unknown";
        break;
    }
  }
  return v2;
}

uint64_t BMAdPlatformsDiscardReasonsDiscardReasonDecode(uint64_t result)
{
  if ((result - 2700) < 2 || result == 0) {
    return result;
  }
  else {
    return 0;
  }
}

unsigned char *BMIntelligencePlatformFeatureStoreCategoryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligencePlatformFeatureStoreCategoryTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_9764);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligencePlatformFeatureStoreCategoryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligencePlatformFeatureStoreCategoryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligencePlatformFeatureStoreCategoryTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C350[a1];
  }

  return v1;
}

uint64_t BMIntelligencePlatformFeatureStoreCategoryTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAppIntentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_10013);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMAppIntentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAppIntentHandlingStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentHandlingStatusFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_36_9988);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriRemembersInteractionInteractionStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentHandlingStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAppIntentInteractionDirectionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInteractionDirectionFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_47);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInteractionDirectionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppIntentInteractionDirectionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAppIntentHandlingStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAppIntentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppIntentTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C430[a1];
  }

  return v1;
}

__CFString *BMAppIntentHandlingStatusAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C450[a1];
  }

  return v1;
}

__CFString *BMAppIntentInteractionDirectionAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C490[a1];
  }

  return v1;
}

uint64_t BMAppIntentTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentHandlingStatusDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInteractionDirectionDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMLSEShareSheetFeedbackTimeoutOccurrenceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEShareSheetFeedbackTimeoutOccurrenceFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_10422);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEShareSheetFeedbackTimeoutOccurrenceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEShareSheetFeedbackTimeoutOccurrenceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEShareSheetFeedbackTimeoutOccurrenceAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C590[a1];
  }

  return v1;
}

unsigned char *BMMLSEShareSheetFeedbackEngagementTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEShareSheetFeedbackEngagementTypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_33_10546);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEShareSheetFeedbackEngagementTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEShareSheetFeedbackEngagementTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMLSEShareSheetFeedbackInferenceSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEShareSheetFeedbackInferenceSourceFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_41);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEShareSheetFeedbackInferenceSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEShareSheetFeedbackInferenceSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMLSEShareSheetFeedbackEngagementTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEShareSheetFeedbackEngagementTypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C5A8[a1];
  }

  return v1;
}

__CFString *BMMLSEShareSheetFeedbackInferenceSourceAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C5E8[a1];
  }

  return v1;
}

uint64_t BMMLSEShareSheetFeedbackTimeoutOccurrenceDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMLSEShareSheetFeedbackEngagementTypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMLSEShareSheetFeedbackInferenceSourceDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

CFComparisonResult __BMPhotosSearchTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosSearchTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"Select";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

BOOL BMPhotosSearchTypeFromString(const void *a1)
{
  return bsearch_b(a1, BMPhotosSearchTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_10836) != 0;
}

uint64_t BMPhotosSearchTypeDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketTimeBucketFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketTimeBucketFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_11783);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMShareSheetFeedbackEngagementTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketTimeBucketFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketTimeBucketFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketTimeBucketAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C9B0[a1];
  }

  return v1;
}

unsigned char *BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_27_12017);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C9D8[a1];
  }

  return v1;
}

unsigned char *BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_41_12044);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602C9F8[a1];
  }

  return v1;
}

unsigned char *BMSiriAssistantSuggestionFeaturesLoggingTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriAssistantSuggestionFeaturesLoggingTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_49);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriAssistantSuggestionFeaturesLoggingTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriAssistantSuggestionFeaturesLoggingTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriAssistantSuggestionFeaturesLoggingTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602CA20[a1];
  }

  return v1;
}

uint64_t BMSiriAssistantSuggestionFeaturesAppUsageFeaturesAppUsageTimeBucketTimeBucketDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHashedLocationDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriAssistantSuggestionFeaturesTemporalFeaturesTimePeriodDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriAssistantSuggestionFeaturesLoggingTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariAutoPlayAutoPlaySignalFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariAutoPlayAutoPlaySignalFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_12249);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariAutoPlayAutoPlaySignalFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariAutoPlayAutoPlaySignalFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariAutoPlayAutoPlaySignalAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602CA78[a1];
  }

  return v1;
}

uint64_t BMSafariAutoPlayAutoPlaySignalDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

id _CurrentBootSessionUUID()
{
  if (_CurrentBootSessionUUID_onceToken != -1) {
    dispatch_once(&_CurrentBootSessionUUID_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)_CurrentBootSessionUUID_bootSessionUUID;

  return v0;
}

unsigned char *BMTextUnderstandingPoemAnalyticsSourcesFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMTextUnderstandingPoemAnalyticsSourcesFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_12934);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMTextUnderstandingPoemAnalyticsSourcesFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMTextUnderstandingPoemAnalyticsSourcesFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMTextUnderstandingPoemAnalyticsSourcesFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMTextUnderstandingPoemAnalyticsSourcesAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602CBC0[a1];
  }

  return v1;
}

uint64_t BMTextUnderstandingPoemAnalyticsSourcesDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString_sortedStrings, 0x16uLL, 8uLL, &__block_literal_global_13137);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketAsString(uint64_t a1)
{
  if (a1 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602E370[a1];
  }

  return v1;
}

__CFString *BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"NotAvailable";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

unsigned char *BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString_sortedStrings, 0x2C5uLL, 8uLL, &__block_literal_global_2204);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString(uint64_t a1)
{
  if (a1 >= 0x2C6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602E428[a1];
  }

  return v1;
}

uint64_t BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketDecode(uint64_t result)
{
  if (result >= 0x17) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonFromString(const void *a1)
{
  return bsearch_b(a1, BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_75) != 0;
}

uint64_t BMMLSEVirtualFeatureStoreFeatureFeatureValueMissingReasonDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMLSEVirtualFeatureStoreFeaturefeatureNameDecode(uint64_t result)
{
  if (result >= 0x2C6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLifeEventActivityActivityTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLifeEventActivityActivityTypeFromString_sortedStrings, 0x11uLL, 8uLL, &__block_literal_global_14776);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMLifeEventActivityActivityTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLifeEventActivityActivityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLifeEventActivityActivityTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLifeEventActivityActivityTypeAsString(uint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FB88[a1];
  }

  return v1;
}

uint64_t BMLifeEventActivityActivityTypeDecode(uint64_t result)
{
  if (result >= 0x12) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSleepScheduleStateStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSleepScheduleStateStateFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_14970);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSleepScheduleStateStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSleepScheduleStateStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSleepScheduleStateChangeReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSleepScheduleStateChangeReasonFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_39);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSleepScheduleStateChangeReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSleepScheduleStateChangeReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSleepScheduleStateChangeReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSleepScheduleStateStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSleepScheduleStateStateAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FC80[a1];
  }

  return v1;
}

__CFString *BMSleepScheduleStateChangeReasonAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FCB0[a1];
  }

  return v1;
}

uint64_t BMSleepScheduleStateStateDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSleepScheduleStateChangeReasonDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMUserFocusSleepModeStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusSleepModeStateFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_15166);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusSleepModeStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMUserFocusSleepModeChangeReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusSleepModeChangeReasonFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_42);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMUserFocusSleepModeChangeReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusSleepModeChangeReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMUserFocusSleepModeChangeReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMUserFocusSleepModeStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMUserFocusSleepModeStateAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FD60[a1];
  }

  return v1;
}

__CFString *BMUserFocusSleepModeChangeReasonAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FD80[a1];
  }

  return v1;
}

uint64_t BMUserFocusSleepModeStateDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMUserFocusSleepModeChangeReasonDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriRemembersInteractionInteractionStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRemembersInteractionInteractionStatusFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_15595);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriRemembersInteractionInteractionStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRemembersInteractionInteractionStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSiriRemembersInteractionInteractionDirectionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRemembersInteractionInteractionDirectionFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_36_15582);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRemembersInteractionInteractionDirectionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSiriRemembersInteractionInteractionSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRemembersInteractionInteractionSourceFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_44_15570);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRemembersInteractionInteractionSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSiriRemembersInteractionUserDonatorTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRemembersInteractionUserDonatorTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_55);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRemembersInteractionUserDonatorTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriRemembersInteractionUserDonatorTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSiriRemembersInteractionInteractionSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSiriRemembersInteractionInteractionDirectionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSiriRemembersInteractionInteractionStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriRemembersInteractionInteractionStatusAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FED0[a1];
  }

  return v1;
}

__CFString *BMSiriRemembersInteractionInteractionDirectionAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FF10[a1];
  }

  return v1;
}

__CFString *BMSiriRemembersInteractionInteractionSourceAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FF30[a1];
  }

  return v1;
}

__CFString *BMSiriRemembersInteractionUserDonatorTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FF48[a1];
  }

  return v1;
}

uint64_t BMSiriRemembersInteractionInteractionStatusDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriRemembersInteractionInteractionDirectionDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriRemembersInteractionInteractionSourceDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriRemembersInteractionUserDonatorTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLocationSemanticUserSpecificPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationSemanticUserSpecificPlaceTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_15832);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationSemanticUserSpecificPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMLocationSemanticPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationSemanticPlaceTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_27_15819);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationSemanticPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLocationSemanticPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMLocationSemanticUserSpecificPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLocationSemanticUserSpecificPlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FFC0[a1];
  }

  return v1;
}

__CFString *BMLocationSemanticPlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E602FFE8[a1];
  }

  return v1;
}

uint64_t BMLocationSemanticUserSpecificPlaceTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationSemanticPlaceTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriContextRefreshTriggersContextRefreshTriggerFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriContextRefreshTriggersContextRefreshTriggerFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_16381);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriContextRefreshTriggersContextRefreshTriggerFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriContextRefreshTriggersContextRefreshTriggerFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriContextRefreshTriggersContextRefreshTriggerAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030090[a1];
  }

  return v1;
}

uint64_t BMSiriContextRefreshTriggersContextRefreshTriggerDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosCurationTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosCurationTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_16707);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMindfulnessSessionStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMPhotosCurationTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosCurationTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosCurationTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60300F8[a1];
  }

  return v1;
}

uint64_t BMPhotosCurationTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLocationEmergencySessionStartLocationProtocolFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationEmergencySessionStartLocationProtocolFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_17535);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosLiveTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationEmergencySessionStartLocationProtocolFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLocationEmergencySessionStartLocationProtocolFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLocationEmergencySessionStartLocationProtocolAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030240[a1];
  }

  return v1;
}

uint64_t BMLocationEmergencySessionStartLocationProtocolDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t __BMRootLibrary()
{
  return objc_opt_class();
}

uint64_t __BMRootLibraryNode()
{
  return objc_opt_class();
}

CFComparisonResult __BMPhotosPickerTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosPickerTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"Select";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

BOOL BMPhotosPickerTypeFromString(const void *a1)
{
  return bsearch_b(a1, BMPhotosPickerTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_18140) != 0;
}

uint64_t BMPhotosPickerTypeDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariWindowProxyPropertyFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariWindowProxyPropertyFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_18957);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementClientActivityEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariWindowProxyPropertyFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariWindowProxyPropertyFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariWindowProxyPropertyAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030450[a1];
  }

  return v1;
}

uint64_t BMSafariWindowProxyPropertyDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_19730);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030638[a1];
  }

  return v1;
}

uint64_t BMAeroMLPhotosSearchDataCorrelationsUISurfaceTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMWebAppInFocusWebAppTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWebAppInFocusWebAppTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_19974);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWebAppInFocusWebAppTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMWebAppInFocusWebAppTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMWebAppInFocusWebAppTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60306A0[a1];
  }

  return v1;
}

uint64_t BMWebAppInFocusWebAppTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString_sortedStrings, 0xAuLL, 8uLL, &__block_literal_global_20396);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeAsString(uint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030968[a1];
  }

  return v1;
}

uint64_t BMSiriMusicInferenceTrainingIndependentSignalsInferenceAppResolutionTypeDecode(uint64_t result)
{
  if (result >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceMetadataDevicePlatformFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceMetadataDevicePlatformFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_21300);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceMetadataDevicePlatformFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceMetadataDevicePlatformFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceMetadataDevicePlatformFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceMetadataDevicePlatformAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030A40[a1];
  }

  return v1;
}

uint64_t BMDeviceMetadataDevicePlatformDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDisplayAppearanceStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDisplayAppearanceStateFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_24_21914);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDisplayAppearanceStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDisplayAppearanceReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDisplayAppearanceReasonFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_21898);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDisplayAppearanceReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDisplayAppearanceReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDisplayAppearanceStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDisplayAppearanceStateAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030B78[a1];
  }

  return v1;
}

__CFString *BMDisplayAppearanceReasonAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030B50[a1];
  }

  return v1;
}

uint64_t BMDisplayAppearanceReasonDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDisplayAppearanceStateDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceSmartChargingModeOfOperationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceSmartChargingModeOfOperationFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_72_22304);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceSmartChargingModeOfOperationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceSmartChargingModeOfOperationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceSmartChargingOBCEventFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceSmartChargingOBCEventFromString_sortedStrings, 0xEuLL, 8uLL, &__block_literal_global_22258);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceSmartChargingOBCEventFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceSmartChargingOBCEventFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceSmartChargingOBCEventFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceSmartChargingModeOfOperationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceSmartChargingModeOfOperationAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030D08[a1];
  }

  return v1;
}

__CFString *BMDeviceSmartChargingOBCEventAsString(uint64_t a1)
{
  if (a1 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030C90[a1];
  }

  return v1;
}

uint64_t BMDeviceSmartChargingOBCEventDecode(uint64_t result)
{
  if (result >= 0xF) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceSmartChargingModeOfOperationDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMTextUnderstandingPoemPredicateTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMTextUnderstandingPoemPredicateTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_22909);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMTextUnderstandingPoemPredicateTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMTextUnderstandingPoemPredicateTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMTextUnderstandingPoemPredicateTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030E48[a1];
  }

  return v1;
}

uint64_t BMTextUnderstandingPoemPredicateTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMCarPlayConnectedReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMCarPlayConnectedReasonFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_23076);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMCarPlayConnectedReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMCarPlayConnectedReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMCarPlayConnectedReasonAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6030E80[a1];
  }

  return v1;
}

uint64_t BMCarPlayConnectedReasonDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMNotificationUsageTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMNotificationUsageTypeFromString_sortedStrings, 0x1BuLL, 8uLL, &__block_literal_global_24378);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMNotificationUsageTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMNotificationUsageTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMNotificationUsageTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMNotificationUsageTypeAsString(uint64_t a1)
{
  if (a1 >= 0x1C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60310F0[a1];
  }

  return v1;
}

uint64_t BMNotificationUsageTypeDecode(uint64_t result)
{
  if (result >= 0x1C) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMContextSyncDeviceActivityLevelActivityStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncDeviceActivityLevelActivityStateFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_26238);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMailCategorizationCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncDeviceActivityLevelActivityStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMContextSyncDeviceActivityLevelActivityStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMContextSyncDeviceActivityLevelActivityStateAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60314C0[a1];
  }

  return v1;
}

uint64_t BMContextSyncDeviceActivityLevelActivityStateDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMFamilyAskToBuyRequestStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFamilyAskToBuyRequestStatusFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_26562);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFamilyAskToBuyRequestStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFamilyAskToBuyRequestStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFamilyAskToBuyRequestStatusAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031580[a1];
  }

  return v1;
}

uint64_t BMFamilyAskToBuyRequestStatusDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSensitiveContentAnalysisMediaAnalysisContentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisMediaAnalysisContentTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_26774);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisMediaAnalysisContentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisMediaAnalysisAgeGroupFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisMediaAnalysisAgeGroupFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_21_26761);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisMediaAnalysisAgeGroupFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSensitiveContentAnalysisMediaAnalysisIsSensitiveFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSensitiveContentAnalysisMediaAnalysisIsSensitiveFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_29_26753);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSensitiveContentAnalysisMediaAnalysisIsSensitiveFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSensitiveContentAnalysisMediaAnalysisIsSensitiveFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisMediaAnalysisAgeGroupFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSensitiveContentAnalysisMediaAnalysisContentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSensitiveContentAnalysisMediaAnalysisContentTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031600[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisMediaAnalysisAgeGroupAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031618[a1];
  }

  return v1;
}

__CFString *BMSensitiveContentAnalysisMediaAnalysisIsSensitiveAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031638[a1];
  }

  return v1;
}

uint64_t BMSensitiveContentAnalysisMediaAnalysisContentTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisMediaAnalysisAgeGroupDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSensitiveContentAnalysisMediaAnalysisIsSensitiveDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMTextUnderstandingPoemBufferExtractionExtractionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMTextUnderstandingPoemBufferExtractionExtractionTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_27801);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementClientActivityEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMTextUnderstandingPoemBufferExtractionExtractionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMTextUnderstandingPoemBufferExtractionRoleTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMTextUnderstandingPoemBufferExtractionRoleTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_27_27784);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMTextUnderstandingPoemBufferExtractionRoleTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMTextUnderstandingPoemBufferExtractionRoleTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMTextUnderstandingPoemBufferExtractionExtractionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMTextUnderstandingPoemBufferExtractionExtractionTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60317A8[a1];
  }

  return v1;
}

__CFString *BMTextUnderstandingPoemBufferExtractionRoleTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60317D0[a1];
  }

  return v1;
}

uint64_t BMTextUnderstandingPoemBufferExtractionExtractionTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMTextUnderstandingPoemBufferExtractionRoleTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMIntelligenceEngineInteractionUserAlignmentFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligenceEngineInteractionUserAlignmentFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_39_29120);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMIntelligenceEngineInteractionUserAlignmentFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligenceEngineInteractionUserAlignmentFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligenceEngineInteractionUserAlignmentFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligenceEngineInteractionUserAlignmentAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031A08[a1];
  }

  return v1;
}

unsigned char *BMIntelligenceEngineInteractionDonationTriggerFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligenceEngineInteractionDonationTriggerFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_29260);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosLiveTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligenceEngineInteractionDonationTriggerFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligenceEngineInteractionDonationTriggerFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligenceEngineInteractionDonationTriggerAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60319E0[a1];
  }

  return v1;
}

uint64_t BMIntelligenceEngineInteractionDonationTriggerDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMIntelligenceEngineInteractionUserAlignmentDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMClockAlarmEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMClockAlarmEventTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_29850);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMClockAlarmEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMClockAlarmEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMClockAlarmLastEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMClockAlarmLastEventTypeFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_54);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMClockAlarmLastEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMClockAlarmLastEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMClockAlarmLastEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMClockAlarmEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMClockAlarmEventTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031B50[a1];
  }

  return v1;
}

__CFString *BMClockAlarmLastEventTypeAsString(uint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031B88[a1];
  }

  return v1;
}

uint64_t BMClockAlarmEventTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMClockAlarmLastEventTypeDecode(uint64_t result)
{
  if (result >= 0xC) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMIntelligencePlatformMessageTermsTermCountTermTermTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligencePlatformMessageTermsTermCountTermTermTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_30036);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMIntelligencePlatformMessageTermsTermCountTermTermTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligencePlatformMessageTermsTermCountTermTermTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligencePlatformMessageTermsTermCountTermTermTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligencePlatformMessageTermsTermCountTermTermTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031C80[a1];
  }

  return v1;
}

uint64_t BMIntelligencePlatformMessageTermsTermCountTermTermTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriRequestCountsMetadataScheduleFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRequestCountsMetadataScheduleFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_30464);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRequestCountsMetadataScheduleFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriRequestCountsMetadataScheduleFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriRequestCountsMetadataScheduleAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031D10[a1];
  }

  return v1;
}

uint64_t BMSiriRequestCountsMetadataScheduleDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_30712);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031D90[a1];
  }

  return v1;
}

id -[BMDisplayAlwaysOn _blockingPoliciesJSONArray](BMDisplayAlwaysOn *self, SEL a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMDisplayAlwaysOn *)self blockingPolicies];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

unsigned char *BMDisplayAlwaysOnStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDisplayAlwaysOnStateFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_27_30801);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDisplayAlwaysOnStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDisplayAlwaysOnStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDisplayAlwaysOnStateAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6031DC0[a1];
  }

  return v1;
}

uint64_t BMDisplayAlwaysOnBlockingPolicyBlockingPolicyModeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDisplayAlwaysOnStateDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosUserAnalyticsMediaTypeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosUserAnalyticsMediaTypeTypeFromString_sortedStrings, 0xCuLL, 8uLL, &__block_literal_global_115_31625);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosUserAnalyticsMediaTypeTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosUserAnalyticsMediaTypeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosUserAnalyticsImportSourceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosUserAnalyticsImportSourceTypeFromString_sortedStrings, 0xCuLL, 8uLL, &__block_literal_global_77);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosUserAnalyticsImportSourceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosUserAnalyticsImportSourceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosUserAnalyticsAssetAgeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosUserAnalyticsAssetAgeTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_31569);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosUserAnalyticsAssetAgeTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosUserAnalyticsAssetAgeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosUserAnalyticsLibrarySizeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosUserAnalyticsLibrarySizeTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_39_31552);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosStyleLibrarySizeTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosUserAnalyticsLibrarySizeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_132);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosStyleUserLibraryAgeInDaysTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosUserAnalyticsLibrarySizeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosUserAnalyticsAssetAgeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosUserAnalyticsImportSourceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosUserAnalyticsMediaTypeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosUserAnalyticsMediaTypeTypeAsString(uint64_t a1)
{
  if (a1 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60321A8[a1];
  }

  return v1;
}

__CFString *BMPhotosUserAnalyticsImportSourceTypeAsString(uint64_t a1)
{
  if (a1 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032140[a1];
  }

  return v1;
}

__CFString *BMPhotosUserAnalyticsAssetAgeTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60320D8[a1];
  }

  return v1;
}

__CFString *BMPhotosUserAnalyticsLibrarySizeTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032110[a1];
  }

  return v1;
}

__CFString *BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032210[a1];
  }

  return v1;
}

uint64_t BMPhotosUserAnalyticsAssetAgeTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosUserAnalyticsLibrarySizeTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosUserAnalyticsImportSourceTypeDecode(uint64_t result)
{
  if (result >= 0xD) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosUserAnalyticsMediaTypeTypeDecode(uint64_t result)
{
  if (result >= 0xD) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosUserAnalyticsUserLibraryAgeInDaysTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMActivitySchedulerDependencyResultEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMActivitySchedulerDependencyResultEventTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_32414);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMActivitySchedulerDependencyResultEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMActivitySchedulerDependencyResultEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMActivitySchedulerDependencyResultEventTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032300[a1];
  }

  return v1;
}

uint64_t BMActivitySchedulerDependencyResultEventTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPortraitEntityCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPortraitEntityCategoryFromString_sortedStrings, 0x15uLL, 8uLL, &__block_literal_global_32982);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPortraitEntityCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPortraitEntityCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPortraitEntityAlgorithmFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPortraitEntityAlgorithmFromString_sortedStrings, 0x11uLL, 8uLL, &__block_literal_global_120);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPortraitEntityAlgorithmFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPortraitEntityAlgorithmFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPortraitEntityAlgorithmFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPortraitEntityCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPortraitEntityCategoryAsString(uint64_t a1)
{
  if (a1 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60324B0[a1];
  }

  return v1;
}

__CFString *BMPortraitEntityAlgorithmAsString(uint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032560[a1];
  }

  return v1;
}

uint64_t BMPortraitEntityCategoryDecode(uint64_t result)
{
  if (result >= 0x16) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPortraitEntityAlgorithmDecode(uint64_t result)
{
  if (result >= 0x12) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMUserFocusDoNotDisturbWhileDrivingReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusDoNotDisturbWhileDrivingReasonFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_33193);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMUserFocusDoNotDisturbWhileDrivingReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusDoNotDisturbWhileDrivingReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMUserFocusDoNotDisturbWhileDrivingReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMUserFocusDoNotDisturbWhileDrivingReasonAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032630[a1];
  }

  return v1;
}

uint64_t BMUserFocusDoNotDisturbWhileDrivingReasonDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_33428);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMGenerativeExperiencesTransparencyLogExecutionEnvironmentFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMGenerativeExperiencesTransparencyLogExecutionEnvironmentAsString(uint64_t a1)
{
  if a1 < 6 && ((0x3Bu >> a1))
  {
    uint64_t v1 = off_1E60326D8[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

uint64_t BMGenerativeExperiencesTransparencyLogExecutionEnvironmentDecode(unsigned int a1)
{
  if (a1 > 5) {
    return 0;
  }
  else {
    return dword_1B35D81E8[a1];
  }
}

unsigned char *BMAppWebUsageStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppWebUsageStateFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_33657);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMAppWebUsageStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppWebUsageStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppWebUsageStateAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032768[a1];
  }

  return v1;
}

uint64_t BMAppWebUsageStateDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMediaRouteOutputDeviceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaRouteOutputDeviceTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_34028);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMediaRouteOutputDeviceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaRouteOutputDeviceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMediaRouteOutputDeviceSubTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaRouteOutputDeviceSubTypeFromString_sortedStrings, 0x15uLL, 8uLL, &__block_literal_global_84);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMediaRouteOutputDeviceSubTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaRouteOutputDeviceSubTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMediaRouteOutputDeviceSubTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMediaRouteOutputDeviceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMediaRouteOutputDeviceTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60328F0[a1];
  }

  return v1;
}

__CFString *BMMediaRouteOutputDeviceSubTypeAsString(uint64_t a1)
{
  if (a1 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032920[a1];
  }

  return v1;
}

unsigned char *BMMediaRouteOutputDeviceClusterTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaRouteOutputDeviceClusterTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_95);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaRouteOutputDeviceClusterTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMediaRouteOutputDeviceClusterTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMediaRouteOutputDeviceClusterTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60329D0[a1];
  }

  return v1;
}

unsigned char *BMMediaRouteRouteTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMediaRouteRouteTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_103);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMediaRouteRouteTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMediaRouteRouteTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMediaRouteRouteTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60329F0[a1];
  }

  return v1;
}

uint64_t BMMediaRouteOutputDeviceTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaRouteOutputDeviceSubTypeDecode(uint64_t result)
{
  if (result >= 0x16) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaRouteOutputDeviceClusterTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMediaRouteRouteTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSpringBoardDominoStackRotationReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSpringBoardDominoStackRotationReasonFromString_sortedStrings, 0xAuLL, 8uLL, &__block_literal_global_34543);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSpringBoardDominoStackRotationReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSpringBoardDominoStackRotationReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSpringBoardDominoStackRotationReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSpringBoardDominoStackRotationReasonAsString(uint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032AB8[a1];
  }

  return v1;
}

uint64_t BMSpringBoardDominoStackRotationReasonDecode(uint64_t result)
{
  if (result >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMessagesCommunicationSafetyResultEventDirectionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMessagesCommunicationSafetyResultEventDirectionFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_35551);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMessagesCommunicationSafetyResultEventDirectionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMessagesCommunicationSafetyResultEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMessagesCommunicationSafetyResultEventTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_27_35535);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceBatteryGaugingQMaxStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMessagesCommunicationSafetyResultEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMessagesCommunicationSafetyResultContentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMessagesCommunicationSafetyResultContentTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_38);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMessagesCommunicationSafetyResultContentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMessagesCommunicationSafetyResultContentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMessagesCommunicationSafetyResultEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMessagesCommunicationSafetyResultEventDirectionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMessagesCommunicationSafetyResultEventDirectionAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032C58[a1];
  }

  return v1;
}

__CFString *BMMessagesCommunicationSafetyResultEventTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032C78[a1];
  }

  return v1;
}

__CFString *BMMessagesCommunicationSafetyResultContentTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6032CA0[a1];
  }

  return v1;
}

uint64_t BMMessagesCommunicationSafetyResultEventDirectionDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMessagesCommunicationSafetyResultEventTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMessagesCommunicationSafetyResultContentTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_36554);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6033E80[a1];
  }

  return v1;
}

CFComparisonResult __BMMLSEDurableFeatureStoreFeatureValueMissingReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEDurableFeatureStoreFeatureValueMissingReasonAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"NotAvailable";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

unsigned char *BMMLSEDurableFeatureStorefeatureNameFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEDurableFeatureStorefeatureNameFromString_sortedStrings, 0x1FDuLL, 8uLL, &__block_literal_global_1564);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEDurableFeatureStorefeatureNameFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEDurableFeatureStorefeatureNameFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEDurableFeatureStorefeatureNameFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEDurableFeatureStorefeatureNameAsString(uint64_t a1)
{
  if (a1 >= 0x1FE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6033ED0[a1];
  }

  return v1;
}

uint64_t BMMLSEDurableFeatureStoreFeatureValueHistogramBucketCounttimeIntervalDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL BMMLSEDurableFeatureStoreFeatureValueMissingReasonFromString(const void *a1)
{
  return bsearch_b(a1, BMMLSEDurableFeatureStoreFeatureValueMissingReasonFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_24_36624) != 0;
}

uint64_t BMMLSEDurableFeatureStoreFeatureValueMissingReasonDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

__CFString *BMMLSEDurableFeatureStorefeatureTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6033EB0[a1];
  }

  return v1;
}

unsigned char *BMMLSEDurableFeatureStorefeatureTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEDurableFeatureStorefeatureTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_35_37350);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEDurableFeatureStorefeatureTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEDurableFeatureStorefeatureTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

uint64_t BMMLSEDurableFeatureStorefeatureTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMLSEDurableFeatureStorefeatureNameDecode(uint64_t result)
{
  if (result >= 0x1FE) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMActivitySchedulerDependencyCompletionEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMActivitySchedulerDependencyCompletionEventTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_37548);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMActivitySchedulerDependencyCompletionEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMActivitySchedulerDependencyCompletionEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMActivitySchedulerDependencyCompletionEventTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6034EF0[a1];
  }

  return v1;
}

uint64_t BMActivitySchedulerDependencyCompletionEventTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMIntelligenceFlowUserAlignmentScoreCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligenceFlowUserAlignmentScoreCategoryFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_37689);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMIntelligenceFlowUserAlignmentScoreCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligenceFlowUserAlignmentScoreCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligenceFlowUserAlignmentScoreCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligenceFlowUserAlignmentScoreCategoryAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6034F40[a1];
  }

  return v1;
}

uint64_t BMIntelligenceFlowUserAlignmentScoreCategoryDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAppInFocusTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppInFocusTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_38022);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMAppInFocusTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppInFocusTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppInFocusTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035020[a1];
  }

  return v1;
}

uint64_t BMAppInFocusTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

__CFString *BMAppInFocusLaunchTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035020[a1];
  }

  return v1;
}

unsigned char *BMAppInFocusLaunchTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppInFocusLaunchTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_15);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppInFocusLaunchTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppInFocusLaunchTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

uint64_t BMAppInFocusLaunchTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMScreenTimeChildStateScreenTimeChildStateKindFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMScreenTimeChildStateScreenTimeChildStateKindFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_38383);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMScreenTimeChildStateScreenTimeChildStateKindFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMScreenTimeChildStateScreenTimeChildStateKindFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMScreenTimeChildStateScreenTimeChildStateKindAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60350B0[a1];
  }

  return v1;
}

uint64_t BMScreenTimeChildStateScreenTimeChildStateKindDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSchoolTimeSessionReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSchoolTimeSessionReasonFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_39953);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSchoolTimeSessionReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSchoolTimeSessionReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSchoolTimeSessionReasonAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60352F0[a1];
  }

  return v1;
}

uint64_t BMSchoolTimeSessionReasonDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_40406);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035848[a1];
  }

  return v1;
}

unsigned char *BMAppIntentInvocationValueTypeContainerTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationValueTypeContainerTypeFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_36_40665);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppIntentInvocationValueTypeContainerTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationValueTypeContainerTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAppIntentInvocationValueTypeLegacyIntentFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationValueTypeLegacyIntentFromString_sortedStrings, 0xFuLL, 8uLL, &__block_literal_global_83_40615);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppIntentInvocationValueTypeLegacyIntentFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationValueTypeLegacyIntentFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAppIntentInvocationValueTypeMeasurementUnitFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationValueTypeMeasurementUnitFromString_sortedStrings, 0x17uLL, 8uLL, &__block_literal_global_154);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppIntentInvocationValueTypeMeasurementUnitFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationValueTypeMeasurementUnitFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAppIntentInvocationValueTypePrimitiveFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationValueTypePrimitiveFromString_sortedStrings, 0xDuLL, 8uLL, &__block_literal_global_195);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppIntentInvocationValueTypePrimitiveFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationValueTypePrimitiveFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppIntentInvocationValueTypePrimitiveFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAppIntentInvocationValueTypeMeasurementUnitFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAppIntentInvocationValueTypeLegacyIntentFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAppIntentInvocationValueTypeContainerTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppIntentInvocationValueTypeContainerTypeAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035860[a1];
  }

  return v1;
}

__CFString *BMAppIntentInvocationValueTypeLegacyIntentAsString(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60358A8[a1];
  }

  return v1;
}

__CFString *BMAppIntentInvocationValueTypeMeasurementUnitAsString(uint64_t a1)
{
  if (a1 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035928[a1];
  }

  return v1;
}

__CFString *BMAppIntentInvocationValueTypePrimitiveAsString(uint64_t a1)
{
  if (a1 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60359E8[a1];
  }

  return v1;
}

unsigned char *BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString_sortedStrings, 0x22uLL, 8uLL, &__block_literal_global_299);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppIntentInvocationActionOutputConfirmationActionNameTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppIntentInvocationActionOutputConfirmationActionNameTypeAsString(uint64_t a1)
{
  if (a1 >= 0x23)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035A58[a1];
  }

  return v1;
}

unsigned char *BMAppIntentInvocationActionOutputHintFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationActionOutputHintFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_310);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationActionOutputHintFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppIntentInvocationActionOutputHintFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppIntentInvocationActionOutputHintAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035B70[a1];
  }

  return v1;
}

unsigned char *BMAppIntentInvocationSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppIntentInvocationSourceFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_336_41016);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppIntentInvocationSourceFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppIntentInvocationSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppIntentInvocationSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppIntentInvocationSourceAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035B90[a1];
  }

  return v1;
}

uint64_t BMAppIntentInvocationValueTypeArrayCapabilitiesCapabilitiesValueDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationValueTypeContainerTypeDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationValueTypeLegacyIntentDecode(uint64_t result)
{
  if (result >= 0x10) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationValueTypeMeasurementUnitDecode(uint64_t result)
{
  if (result >= 0x18) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationValueTypePrimitiveDecode(uint64_t result)
{
  if (result >= 0xE) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationActionOutputConfirmationActionNameTypeDecode(uint64_t result)
{
  if (result >= 0x23) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationActionOutputHintDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppIntentInvocationSourceDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString_sortedStrings, 0x18uLL, 8uLL, &__block_literal_global_41443);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDAsString(uint64_t a1)
{
  if (a1 >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035D08[a1];
  }

  return v1;
}

uint64_t BMIntelligencePlatformEntityTaggingPersonInferenceEntityTagIDDecode(uint64_t result)
{
  if (result >= 0x19) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriRequestContextUserClassificationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRequestContextUserClassificationFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_41929);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRequestContextUserClassificationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriRequestContextUserClassificationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriRequestContextUserClassificationAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035FC0[a1];
  }

  return v1;
}

unsigned char *BMSiriRequestContextDeviceIdiomFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriRequestContextDeviceIdiomFromString_sortedStrings, 0xAuLL, 8uLL, &__block_literal_global_48_42275);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriRequestContextDeviceIdiomFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriRequestContextDeviceIdiomFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriRequestContextDeviceIdiomFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriRequestContextDeviceIdiomAsString(uint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6035FE8[a1];
  }

  return v1;
}

uint64_t BMSiriRequestContextUserClassificationDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriRequestContextDeviceIdiomDecode(uint64_t result)
{
  if (result >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMShareSheetFeedbackEngagementTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMShareSheetFeedbackEngagementTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_44347);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMShareSheetFeedbackEngagementTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMShareSheetFeedbackEngagementTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMShareSheetFeedbackEngagementTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMShareSheetFeedbackEngagementTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60362A0[a1];
  }

  return v1;
}

uint64_t BMShareSheetFeedbackEngagementTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosShareTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosShareTypeFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_44931);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosShareTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMPhotosShareTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosShareTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosShareTypeAsString(uint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036370[a1];
  }

  return v1;
}

uint64_t BMPhotosShareTypeDecode(uint64_t result)
{
  if (result >= 0xC) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosEditTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosEditTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_45308);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosEditTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMPhotosEditTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosEditTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosEditTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036440[a1];
  }

  return v1;
}

uint64_t BMPhotosEditTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariBrowsingAssistantBuildTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantBuildTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_24_46663);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementClientActivityEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantBuildTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariBrowsingAssistantSearchBarPositionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantSearchBarPositionFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_46651);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantSearchBarPositionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariBrowsingAssistantTreatmentAllocationStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantTreatmentAllocationStatusFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_106_46628);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantTreatmentAllocationStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariBrowsingAssistantTreatmentAllocationStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantTreatmentAllocationStatusAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60369F8[a1];
  }

  return v1;
}

CFComparisonResult __BMSafariBrowsingAssistantSearchBarPositionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariBrowsingAssistantBuildTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantBuildTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60368F8[a1];
  }

  return v1;
}

__CFString *BMSafariBrowsingAssistantSearchBarPositionAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60368E0[a1];
  }

  return v1;
}

unsigned char *BMSafariBrowsingAssistantHideReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantHideReasonFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_87_46738);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantHideReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariBrowsingAssistantHideReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantHideReasonAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60369C0[a1];
  }

  return v1;
}

unsigned char *BMSafariBrowsingAssistantComponentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantComponentTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_35_46876);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantComponentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariBrowsingAssistantCardTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantCardTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_43_46871);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantCardTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariBrowsingAssistantEntityTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantEntityTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_57);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMindfulnessSessionStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantEntityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariBrowsingAssistantReaderViewSectionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantReaderViewSectionTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_62);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantReaderViewSectionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariBrowsingAssistantReaderViewSectionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariBrowsingAssistantEntityTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariBrowsingAssistantCardTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariBrowsingAssistantComponentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantComponentTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036920[a1];
  }

  return v1;
}

__CFString *BMSafariBrowsingAssistantCardTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036940[a1];
  }

  return v1;
}

__CFString *BMSafariBrowsingAssistantEntityTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036958[a1];
  }

  return v1;
}

__CFString *BMSafariBrowsingAssistantReaderViewSectionTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036980[a1];
  }

  return v1;
}

unsigned char *BMSafariBrowsingAssistantUserInteractionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantUserInteractionTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_76);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMKeyboardTokenFrequencyTokenTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantUserInteractionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariBrowsingAssistantHideShowButtonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantHideShowButtonFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_114);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantHideShowButtonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariBrowsingAssistantHideShowButtonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantHideShowButtonAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036A18[a1];
  }

  return v1;
}

CFComparisonResult __BMSafariBrowsingAssistantUserInteractionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantUserInteractionTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036998[a1];
  }

  return v1;
}

unsigned char *BMSafariBrowsingAssistantRequestTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariBrowsingAssistantRequestTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_95_47048);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariBrowsingAssistantRequestTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariBrowsingAssistantRequestTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariBrowsingAssistantRequestTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60369E0[a1];
  }

  return v1;
}

uint64_t BMSafariBrowsingAssistantSearchBarPositionDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantBuildTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantComponentTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantCardTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantEntityTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantReaderViewSectionTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantUserInteractionTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantHideReasonDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantRequestTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantTreatmentAllocationStatusDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariBrowsingAssistantHideShowButtonDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosStyleStyleSelectionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosStyleStyleSelectionTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_47527);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosStyleStyleSelectionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosStyleLibrarySizeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosStyleLibrarySizeTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_27_47502);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosStyleLibrarySizeTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosStyleLibrarySizeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosStyleUserLibraryAgeInDaysTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosStyleUserLibraryAgeInDaysTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_44_47485);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosStyleUserLibraryAgeInDaysTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosStyleUserLibraryAgeInDaysTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosStyleUserLibraryAgeInDaysTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosStyleLibrarySizeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosStyleStyleSelectionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosStyleStyleSelectionTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036B40[a1];
  }

  return v1;
}

__CFString *BMPhotosStyleLibrarySizeTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036B58[a1];
  }

  return v1;
}

__CFString *BMPhotosStyleUserLibraryAgeInDaysTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036B88[a1];
  }

  return v1;
}

uint64_t BMPhotosStyleStyleSelectionTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosStyleLibrarySizeTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosStyleUserLibraryAgeInDaysTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceBluetoothDeviceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceBluetoothDeviceTypeFromString_sortedStrings, 0x32uLL, 8uLL, &__block_literal_global_47790);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceBluetoothDeviceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceBluetoothDeviceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceBluetoothDeviceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceBluetoothDeviceTypeAsString(uint64_t a1)
{
  if (a1 >= 0x33)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6036DA0[a1];
  }

  return v1;
}

uint64_t BMDeviceBluetoothDeviceTypeDecode(uint64_t result)
{
  if (result >= 0x33) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMFeedbackEvaluationResponseUserResponseFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFeedbackEvaluationResponseUserResponseFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_48643);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFeedbackEvaluationResponseUserResponseFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFeedbackEvaluationResponseUserResponseFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFeedbackEvaluationResponseUserResponseFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFeedbackEvaluationResponseUserResponseAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037070[a1];
  }

  return v1;
}

uint64_t BMFeedbackEvaluationResponseUserResponseDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMomentsEngagementBundleInterfaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEngagementBundleInterfaceTypeFromString_sortedStrings, 0xFuLL, 8uLL, &__block_literal_global_155_49754);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementBundleInterfaceTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEngagementBundleInterfaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMomentsEngagementBundleSummaryVisibilityCategoryForUIFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEngagementBundleSummaryVisibilityCategoryForUIFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_49738);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEngagementBundleSummaryVisibilityCategoryForUIFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEngagementBundleSummaryVisibilityCategoryForUIFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMomentsEngagementBundleInterfaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEngagementBundleInterfaceTypeAsString(uint64_t a1)
{
  if (a1 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037650[a1];
  }

  return v1;
}

__CFString *BMMomentsEngagementBundleSummaryVisibilityCategoryForUIAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037528[a1];
  }

  return v1;
}

unsigned char *BMMomentsEngagementSuggestionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEngagementSuggestionTypeFromString_sortedStrings, 0x1FuLL, 8uLL, &__block_literal_global_108);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementSuggestionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEngagementSuggestionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEngagementSuggestionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEngagementSuggestionTypeAsString(uint64_t a1)
{
  if (a1 >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037550[a1];
  }

  return v1;
}

unsigned char *BMMomentsEngagementAppEntryEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEngagementAppEntryEventTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_157);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEngagementAppEntryEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEngagementAppEntryEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEngagementAppEntryEventTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60376D0[a1];
  }

  return v1;
}

unsigned char *BMMomentsEngagementClientActivityEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMomentsEngagementClientActivityEventTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_171);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMomentsEngagementClientActivityEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMomentsEngagementClientActivityEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMomentsEngagementClientActivityEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMomentsEngagementClientActivityEventTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60376F8[a1];
  }

  return v1;
}

uint64_t BMMomentsEngagementBundleSummaryVisibilityCategoryForUIDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEngagementSuggestionTypeDecode(uint64_t result)
{
  if (result >= 0x20) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEngagementBundleInterfaceTypeDecode(uint64_t result)
{
  if (result >= 0x10) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEngagementAppEntryEventTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMomentsEngagementClientActivityEventTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMailRecategorizationCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMailRecategorizationCategoryFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_50493);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMailRecategorizationCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMailRecategorizationCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMailRecategorizationScopeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMailRecategorizationScopeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_30);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMailRecategorizationScopeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMailRecategorizationScopeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMailRecategorizationCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMailRecategorizationCategoryAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037798[a1];
  }

  return v1;
}

__CFString *BMMailRecategorizationScopeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60377D0[a1];
  }

  return v1;
}

uint64_t BMMailRecategorizationCategoryDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMailRecategorizationScopeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceBluetoothGATTSessionStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceBluetoothGATTSessionStateFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_50858);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceBluetoothGATTSessionStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceBluetoothGATTSessionStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceBluetoothGATTSessionStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceBluetoothGATTSessionStateAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037850[a1];
  }

  return v1;
}

uint64_t BMDeviceBluetoothGATTSessionStateDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMFindMyContactActivityEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFindMyContactActivityEventTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_51211);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFindMyContactActivityEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFindMyContactActivityEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFindMyContactActivityEventTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60378D0[a1];
  }

  return v1;
}

uint64_t BMFindMyContactActivityEventTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMiCloudSubscriptionEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMiCloudSubscriptionEventTypeFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_51497);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMiCloudSubscriptionEventTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMiCloudSubscriptionEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMiCloudSubscriptionEntryTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMiCloudSubscriptionEntryTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_33_51481);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMiCloudSubscriptionEntryTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMiCloudSubscriptionEntryTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMiCloudSubscriptionEntryTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMiCloudSubscriptionEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMiCloudSubscriptionEventTypeAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037980[a1];
  }

  return v1;
}

__CFString *BMiCloudSubscriptionEntryTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60379B0[a1];
  }

  return v1;
}

uint64_t BMiCloudSubscriptionEventTypeDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMiCloudSubscriptionEntryTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariMemoryFootprintFootprintFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariMemoryFootprintFootprintFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_52602);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSafariMemoryFootprintFootprintFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariMemoryFootprintFootprintFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariMemoryFootprintPageCountFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariMemoryFootprintPageCountFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_30_52589);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariMemoryFootprintPageCountFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariMemoryFootprintLifetimeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariMemoryFootprintLifetimeFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_56_52563);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSafariMemoryFootprintLifetimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariMemoryFootprintLifetimeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariMemoryFootprintLifetimeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariMemoryFootprintPageCountFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariMemoryFootprintFootprintFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariMemoryFootprintFootprintAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037C28[a1];
  }

  return v1;
}

__CFString *BMSafariMemoryFootprintPageCountAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037C58[a1];
  }

  return v1;
}

__CFString *BMSafariMemoryFootprintLifetimeAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037C78[a1];
  }

  return v1;
}

uint64_t BMSafariMemoryFootprintFootprintDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariMemoryFootprintPageCountDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariMemoryFootprintLifetimeDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosMemoryCreationMemoryAssetCountFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosMemoryCreationMemoryAssetCountFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_53710);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriPostSiriEngagementFeaturesTaskSuccessFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosMemoryCreationMemoryAssetCountFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosMemoryCreationMemoryAssetCountFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosMemoryCreationMemoryAssetCountAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6037F08[a1];
  }

  return v1;
}

uint64_t BMPhotosMemoryCreationMemoryAssetCountDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMContextSyncWalletTransactionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncWalletTransactionTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_54206);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMContextSyncWalletTransactionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncWalletTransactionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMContextSyncWalletTransactionMerchantTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextSyncWalletTransactionMerchantTypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_45_54181);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletSettledTransactionMerchantTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextSyncWalletTransactionMerchantTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMContextSyncWalletTransactionMerchantTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMContextSyncWalletTransactionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMContextSyncWalletTransactionTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038018[a1];
  }

  return v1;
}

__CFString *BMContextSyncWalletTransactionMerchantTypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038050[a1];
  }

  return v1;
}

uint64_t BMContextSyncWalletTransactionTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMContextSyncWalletTransactionMerchantTypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAppleIDChildSetupChildSetupScreenFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppleIDChildSetupChildSetupScreenFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_54679);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMAppleIDChildSetupChildSetupScreenFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppleIDChildSetupChildSetupScreenFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMAppleIDChildSetupFlowTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAppleIDChildSetupFlowTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_36_54669);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAppleIDChildSetupFlowTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAppleIDChildSetupFlowTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMAppleIDChildSetupChildSetupScreenFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAppleIDChildSetupChildSetupScreenAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038170[a1];
  }

  return v1;
}

__CFString *BMAppleIDChildSetupFlowTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60381B8[a1];
  }

  return v1;
}

uint64_t BMAppleIDChildSetupChildSetupScreenDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMAppleIDChildSetupFlowTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMUserFocusInferredModeOriginFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusInferredModeOriginFromString_sortedStrings, 0x11uLL, 8uLL, &__block_literal_global_56286);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMUserFocusInferredModeOriginFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusInferredModeOriginFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMUserFocusInferredModeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMUserFocusInferredModeTypeFromString_sortedStrings, 0x12uLL, 8uLL, &__block_literal_global_108_56220);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMUserFocusInferredModeTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMUserFocusInferredModeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMUserFocusInferredModeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMUserFocusInferredModeOriginFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMUserFocusInferredModeOriginAsString(uint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038470[a1];
  }

  return v1;
}

__CFString *BMUserFocusInferredModeTypeAsString(uint64_t a1)
{
  if (a1 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038500[a1];
  }

  return v1;
}

uint64_t BMUserFocusInferredModeOriginDecode(uint64_t result)
{
  if (result >= 0x12) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMUserFocusInferredModeTypeDecode(uint64_t result)
{
  if (result >= 0x13) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMEmojiEngagementInputModeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMEmojiEngagementInputModeFromString_sortedStrings, 0xAuLL, 8uLL, &__block_literal_global_57639);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMEmojiEngagementInputModeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMEmojiEngagementInputModeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMEmojiEngagementInputModeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMEmojiEngagementInputModeAsString(uint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038700[a1];
  }

  return v1;
}

uint64_t BMEmojiEngagementInputModeDecode(uint64_t result)
{
  if (result >= 0xB) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_21_58106);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMFrontBoardDisplayElementDisplayBacklightStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFrontBoardDisplayElementDisplayBacklightStatusFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_29_58098);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFrontBoardDisplayElementDisplayBacklightStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFrontBoardDisplayElementDisplayBacklightStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMFrontBoardDisplayElementDisplayInterfaceOrientationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMFrontBoardDisplayElementDisplayTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFrontBoardDisplayElementDisplayTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"Main";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

__CFString *BMFrontBoardDisplayElementDisplayInterfaceOrientationAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038888[a1];
  }

  return v1;
}

__CFString *BMFrontBoardDisplayElementDisplayBacklightStatusAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60388B0[a1];
  }

  return v1;
}

unsigned char *BMFrontBoardDisplayElementTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFrontBoardDisplayElementTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_43_58284);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFrontBoardDisplayElementTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMFrontBoardDisplayElementChangeTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFrontBoardDisplayElementChangeTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_54_58269);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFrontBoardDisplayElementChangeTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFrontBoardDisplayElementChangeTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMFrontBoardDisplayElementTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFrontBoardDisplayElementTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60388C8[a1];
  }

  return v1;
}

__CFString *BMFrontBoardDisplayElementChangeTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60388F0[a1];
  }

  return v1;
}

BOOL BMFrontBoardDisplayElementDisplayTypeFromString(const void *a1)
{
  return bsearch_b(a1, BMFrontBoardDisplayElementDisplayTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_58087) != 0;
}

uint64_t BMFrontBoardDisplayElementDisplayTypeDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFrontBoardDisplayElementDisplayInterfaceOrientationDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFrontBoardDisplayElementDisplayBacklightStatusDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFrontBoardDisplayElementTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFrontBoardDisplayElementChangeTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMFindMyLocationChangeStateChangeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFindMyLocationChangeStateChangeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_30_58448);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFindMyLocationChangeStateChangeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMFindMyLocationChangeActivityStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFindMyLocationChangeActivityStateFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_58429);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFindMyLocationChangeActivityStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFindMyLocationChangeActivityStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFindMyLocationChangeActivityStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMFindMyLocationChangeStateChangeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFindMyLocationChangeStateChangeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60389A0[a1];
  }

  return v1;
}

__CFString *BMFindMyLocationChangeActivityStateAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038970[a1];
  }

  return v1;
}

uint64_t BMFindMyLocationChangeActivityStateDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFindMyLocationChangeStateChangeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_58694);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_21_58684);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_38_58665);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_57_58657);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_49_58646);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038A68[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038A88[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038AA0[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038AF0[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038AD0[a1];
  }

  return v1;
}

uint64_t BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMContextualUnderstandingActivityInferenceActivityTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMContextualUnderstandingActivityInferenceActivityTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_58855);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMContextualUnderstandingActivityInferenceActivityTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMContextualUnderstandingActivityInferenceActivityTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMContextualUnderstandingActivityInferenceActivityTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038B38[a1];
  }

  return v1;
}

uint64_t BMContextualUnderstandingActivityInferenceActivityTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLighthouseLedgerDediscoPrivacyEventEventPhaseFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLighthouseLedgerDediscoPrivacyEventEventPhaseFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_59067);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMLighthouseLedgerDediscoPrivacyEventEventPhaseFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLighthouseLedgerDediscoPrivacyEventEventPhaseFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLighthouseLedgerDediscoPrivacyEventEventPhaseFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLighthouseLedgerDediscoPrivacyEventEventPhaseAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038BF0[a1];
  }

  return v1;
}

unsigned char *BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_30_59203);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038C20[a1];
  }

  return v1;
}

uint64_t BMLighthouseLedgerDediscoPrivacyEventEventPhaseDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLighthouseLedgerDediscoPrivacyEventAggregateFunctionDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMHomeKitAccessoryStateValueTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMHomeKitAccessoryStateValueTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_59517);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMHomeKitAccessoryStateValueTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMHomeKitAccessoryStateValueTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMHomeKitAccessoryStateValueTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038C88[a1];
  }

  return v1;
}

uint64_t BMHomeKitAccessoryStateValueTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDiscoverabilityUsageContentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDiscoverabilityUsageContentTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_45_60458);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDiscoverabilityUsageContentTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDiscoverabilityUsageContentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDiscoverabilityUsageIneligibleReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDiscoverabilityUsageIneligibleReasonFromString_sortedStrings, 0x18uLL, 8uLL, &__block_literal_global_119);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDiscoverabilityUsageIneligibleReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDiscoverabilityUsageIneligibleReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDiscoverabilityUsageStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDiscoverabilityUsageStateFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_60353);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDiscoverabilityUsageStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDiscoverabilityUsageStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDiscoverabilityUsageStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDiscoverabilityUsageIneligibleReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDiscoverabilityUsageContentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDiscoverabilityUsageContentTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038F00[a1];
  }

  return v1;
}

__CFString *BMDiscoverabilityUsageIneligibleReasonAsString(uint64_t a1)
{
  if (a1 >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038F28[a1];
  }

  return v1;
}

__CFString *BMDiscoverabilityUsageStateAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6038EB0[a1];
  }

  return v1;
}

uint64_t BMDiscoverabilityUsageStateDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDiscoverabilityUsageContentTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDiscoverabilityUsageIneligibleReasonDecode(uint64_t result)
{
  if (result >= 0x19) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMEnergyModeModeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMEnergyModeModeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_39_61352);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMEnergyModeModeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMEnergyModeReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMEnergyModeReasonFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_61324);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMEnergyModeReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMEnergyModeReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMEnergyModeReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMEnergyModeModeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMEnergyModeModeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039170[a1];
  }

  return v1;
}

__CFString *BMEnergyModeReasonAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039128[a1];
  }

  return v1;
}

uint64_t BMEnergyModeReasonDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMEnergyModeModeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceNightShiftReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceNightShiftReasonFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_62423);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceNightShiftReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceNightShiftReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceNightShiftReasonAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60392C8[a1];
  }

  return v1;
}

uint64_t BMDeviceNightShiftReasonDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceSilentModeClientTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceSilentModeClientTypeFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_63798);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceSilentModeClientTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceSilentModeClientTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceSilentModeClientTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceSilentModeClientTypeAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60394C0[a1];
  }

  return v1;
}

uint64_t BMDeviceSilentModeClientTypeDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_64014);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_39_63986);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039588[a1];
  }

  return v1;
}

__CFString *BMPhotosAutonamingSuggestionsFeedbackAssociationTypeAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60395A8[a1];
  }

  return v1;
}

uint64_t BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPhotosAutonamingSuggestionsFeedbackAssociationTypeDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPlaceInferencePlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPlaceInferencePlaceTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_64964);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPlaceInferencePlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPlaceInferenceUserSpecificPlaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPlaceInferenceUserSpecificPlaceTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_30_64948);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPlaceInferenceUserSpecificPlaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMPlaceInferenceUserSpecificPlaceTypeSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPlaceInferenceUserSpecificPlaceTypeSourceFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_44_64934);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsGazeSampleEyeSideFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPlaceInferenceUserSpecificPlaceTypeSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPlaceInferenceUserSpecificPlaceTypeSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPlaceInferenceUserSpecificPlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMPlaceInferencePlaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPlaceInferencePlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039858[a1];
  }

  return v1;
}

__CFString *BMPlaceInferenceUserSpecificPlaceTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039880[a1];
  }

  return v1;
}

__CFString *BMPlaceInferenceUserSpecificPlaceTypeSourceAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60398A8[a1];
  }

  return v1;
}

unsigned char *BMLocationVisitLocationReferenceFrameFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationVisitLocationReferenceFrameFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_52);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationVisitLocationReferenceFrameFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMLocationVisitLocationSourceAccuracyFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationVisitLocationSourceAccuracyFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_60);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationVisitLocationSourceAccuracyFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLocationVisitLocationSourceAccuracyFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMLocationVisitLocationReferenceFrameFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLocationVisitLocationReferenceFrameAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60398D0[a1];
  }

  return v1;
}

__CFString *BMLocationVisitLocationSourceAccuracyAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E60398E8[a1];
  }

  return v1;
}

unsigned char *BMLocationVisitTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationVisitTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_71_65184);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMLocationVisitTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMLocationVisitSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationVisitSourceFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_82);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationVisitSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLocationVisitSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMLocationVisitTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLocationVisitTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039900[a1];
  }

  return v1;
}

__CFString *BMLocationVisitSourceAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039920[a1];
  }

  return v1;
}

uint64_t BMPlaceInferencePlaceTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPlaceInferenceUserSpecificPlaceTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMPlaceInferenceUserSpecificPlaceTypeSourceDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationVisitLocationReferenceFrameDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationVisitLocationSourceAccuracyDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationVisitTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMLocationVisitSourceDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMCameraCaptureAutoFocusROIFocusRegionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMCameraCaptureAutoFocusROIFocusRegionTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_65717);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMCameraCaptureAutoFocusROIFocusRegionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString_sortedStrings, 0x2EuLL, 8uLL, &__block_literal_global_156_65573);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMCameraCaptureAutoFocusROIClientApplicationIDTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMCameraCaptureAutoFocusROIFocusRegionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMCameraCaptureAutoFocusROIFocusRegionTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039B38[a1];
  }

  return v1;
}

__CFString *BMCameraCaptureAutoFocusROIClientApplicationIDTypeAsString(uint64_t a1)
{
  if (a1 >= 0x2F)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039B60[a1];
  }

  return v1;
}

uint64_t BMCameraCaptureAutoFocusROIFocusRegionTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMCameraCaptureAutoFocusROIClientApplicationIDTypeDecode(uint64_t result)
{
  if (result >= 0x2F) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosLiveTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosLiveTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_66541);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosLiveTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMPhotosLiveTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosLiveTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosLiveTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039DD8[a1];
  }

  return v1;
}

uint64_t BMPhotosLiveTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosFavoriteTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosFavoriteTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_67385);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMPhotosFavoriteTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosFavoriteTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosFavoriteTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039ED8[a1];
  }

  return v1;
}

uint64_t BMPhotosFavoriteTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMKeyboardTokenFrequencyTokenTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMKeyboardTokenFrequencyTokenTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_67807);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMKeyboardTokenFrequencyTokenTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMKeyboardTokenFrequencyTokenTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMKeyboardTokenFrequencyTokenTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMKeyboardTokenFrequencyTokenTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6039F60[a1];
  }

  return v1;
}

uint64_t BMKeyboardTokenFrequencyTokenTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariNavigationsPlatformFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariNavigationsPlatformFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_68729);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariNavigationsPlatformFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariNavigationsDeviceClassFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariNavigationsDeviceClassFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_21_68719);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariNavigationsDeviceClassFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariNavigationsErrorResponseFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariNavigationsErrorResponseFromString_sortedStrings, 0x25uLL, 8uLL, &__block_literal_global_134);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSafariNavigationsErrorResponseFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariNavigationsErrorResponseFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariNavigationsErrorResponseFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariNavigationsDeviceClassFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariNavigationsPlatformFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariNavigationsPlatformAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A1C0[a1];
  }

  return v1;
}

__CFString *BMSafariNavigationsDeviceClassAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A1E0[a1];
  }

  return v1;
}

__CFString *BMSafariNavigationsErrorResponseAsString(uint64_t a1)
{
  if (a1 >= 0x26)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A1F8[a1];
  }

  return v1;
}

uint64_t BMSafariNavigationsPlatformDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariNavigationsDeviceClassDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariNavigationsErrorResponseDecode(uint64_t result)
{
  if (result >= 0x26) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAirPlayPredictionFeedbackTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAirPlayPredictionFeedbackTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_69110);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriPostSiriEngagementFeaturesTaskSuccessFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAirPlayPredictionFeedbackTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAirPlayPredictionFeedbackTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAirPlayPredictionFeedbackTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A388[a1];
  }

  return v1;
}

uint64_t BMAirPlayPredictionFeedbackTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMotionActivityConfidenceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMotionActivityConfidenceFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_69588);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMotionActivityConfidenceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMotionActivityConfidenceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMotionActivityConfidenceAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A440[a1];
  }

  return v1;
}

uint64_t BMMotionActivityConfidenceDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLighthouseLedgerTrialdEventEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLighthouseLedgerTrialdEventEventTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_69856);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLighthouseLedgerTrialdEventEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLighthouseLedgerTrialdEventEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLighthouseLedgerTrialdEventEventTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A4A8[a1];
  }

  return v1;
}

uint64_t BMLighthouseLedgerTrialdEventEventTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSafariWebPagePerformancePlatformFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariWebPagePerformancePlatformFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_70768);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariWebPagePerformancePlatformFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSafariWebPagePerformanceWebPerformanceEventFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSafariWebPagePerformanceWebPerformanceEventFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_24_70755);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSafariWebPagePerformanceWebPerformanceEventFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSafariWebPagePerformanceWebPerformanceEventFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSafariWebPagePerformancePlatformFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSafariWebPagePerformancePlatformAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A5B0[a1];
  }

  return v1;
}

__CFString *BMSafariWebPagePerformanceWebPerformanceEventAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A5D0[a1];
  }

  return v1;
}

uint64_t BMSafariWebPagePerformancePlatformDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSafariWebPagePerformanceWebPerformanceEventDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMWalletPaymentsCommerceSearchTagSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceSearchTagSourceFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_63_71010);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceSearchTagSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommerceSearchTagTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceSearchTagTypeFromString_sortedStrings, 0x11uLL, 8uLL, &__block_literal_global_70955);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommerceSearchTagTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceSearchTagTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommerceSearchPassTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommerceSearchPassTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_71_70947);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommerceSearchPassTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMWalletPaymentsCommerceSearchPassTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommerceSearchTagTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommerceSearchTagSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMWalletPaymentsCommerceSearchTagSourceAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A748[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommerceSearchTagTypeAsString(uint64_t a1)
{
  if (a1 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A6B8[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommerceSearchPassTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A760[a1];
  }

  return v1;
}

uint64_t BMWalletPaymentsCommerceSearchTagTypeDecode(uint64_t result)
{
  if (result >= 0x12) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommerceSearchTagSourceDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommerceSearchPassTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriPostSiriEngagementFeaturesTaskSuccessFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriPostSiriEngagementFeaturesTaskSuccessFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_71569);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriPostSiriEngagementFeaturesTaskSuccessFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriPostSiriEngagementFeaturesTaskSuccessFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriPostSiriEngagementFeaturesTaskSuccessFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriPostSiriEngagementFeaturesTaskSuccessAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A8E8[a1];
  }

  return v1;
}

uint64_t BMSiriPostSiriEngagementFeaturesTaskSuccessDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceCellularQualityStatusRATFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceCellularQualityStatusRATFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_36_72168);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularQualityStatusRATFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceCellularQualityStatusRATFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceCellularQualityStatusStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceCellularQualityStatusStateFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_72152);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceCellularQualityStatusStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceCellularQualityStatusRRCFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceCellularQualityStatusRRCFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_44_72144);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceCellularQualityStatusRRCFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceCellularQualityStatusRRCFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceCellularQualityStatusStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceCellularQualityStatusRATFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceCellularQualityStatusRATAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A9C8[a1];
  }

  return v1;
}

__CFString *BMDeviceCellularQualityStatusStateAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603A9A0[a1];
  }

  return v1;
}

__CFString *BMDeviceCellularQualityStatusRRCAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603AA00[a1];
  }

  return v1;
}

uint64_t BMDeviceCellularQualityStatusStateDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceCellularQualityStatusRATDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceCellularQualityStatusRRCDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriTaskAggregationMetadataScheduleFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriTaskAggregationMetadataScheduleFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_72437);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriTaskAggregationMetadataScheduleFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriTaskAggregationMetadataScheduleFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriTaskAggregationMetadataScheduleAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603AAE8[a1];
  }

  return v1;
}

unsigned char *BMSiriTaskAggregationDimensionsSiriProductAreaFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriTaskAggregationDimensionsSiriProductAreaFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_24_72586);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriTaskAggregationDimensionsSiriProductAreaFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriTaskAggregationDimensionsSiriProductAreaFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriTaskAggregationDimensionsSiriProductAreaAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603AB08[a1];
  }

  return v1;
}

uint64_t BMSiriTaskAggregationMetadataScheduleDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriTaskAggregationDimensionsSiriProductAreaDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMLocationSignificantVisitTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMLocationSignificantVisitTypeFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_74066);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMLocationSignificantVisitTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMLocationSignificantVisitTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMLocationSignificantVisitTypeAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603AC88[a1];
  }

  return v1;
}

uint64_t BMLocationSignificantVisitTypeDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMScreenSharingTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMScreenSharingTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_74361);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result - (unsigned char *)BMScreenSharingTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMScreenSharingTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMScreenSharingTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603ACD8[a1];
  }

  return v1;
}

uint64_t BMScreenSharingTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMTextInputSessionInputFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMTextInputSessionInputFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_74900);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMTextInputSessionInputFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMTextInputSessionInputFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMTextInputSessionInputAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603ADC8[a1];
  }

  return v1;
}

uint64_t BMTextInputSessionInputDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriFederatedActivationTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriFederatedActivationTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_75606);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriFederatedActivationTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriFederatedActivationTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriFederatedActivationTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603AF20[a1];
  }

  return v1;
}

uint64_t BMSiriFederatedActivationTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_76249);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEShareSheetMetricsSystemResourceUsageUserTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEShareSheetMetricsSystemResourceUsageUserTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603AFE0[a1];
  }

  return v1;
}

uint64_t BMMLSEShareSheetMetricsSystemResourceUsageUserTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMFamilyScreenTimeRequestKindFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFamilyScreenTimeRequestKindFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_76589);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFamilyScreenTimeRequestKindFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMFamilyScreenTimeRequestStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFamilyScreenTimeRequestStatusFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_21_76576);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFamilyScreenTimeRequestStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMFamilyScreenTimeRequestApprovedTimeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMFamilyScreenTimeRequestApprovedTimeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_32);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMFamilyScreenTimeRequestApprovedTimeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMFamilyScreenTimeRequestApprovedTimeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMFamilyScreenTimeRequestApprovedTimeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMFamilyScreenTimeRequestStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMFamilyScreenTimeRequestKindFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMFamilyScreenTimeRequestKindAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B0B8[a1];
  }

  return v1;
}

__CFString *BMFamilyScreenTimeRequestStatusAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B0D0[a1];
  }

  return v1;
}

__CFString *BMFamilyScreenTimeRequestApprovedTimeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B0F0[a1];
  }

  return v1;
}

uint64_t BMFamilyScreenTimeRequestKindDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFamilyScreenTimeRequestStatusDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMFamilyScreenTimeRequestApprovedTimeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceCellularAvailabilityStatusDeviceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceCellularAvailabilityStatusDeviceTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_24_76799);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceCellularAvailabilityStatusDeviceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceCellularAvailabilityStatusStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceCellularAvailabilityStatusStateFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_76783);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceCellularAvailabilityStatusStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceCellularAvailabilityStatusStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceCellularAvailabilityStatusStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceCellularAvailabilityStatusDeviceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceCellularAvailabilityStatusDeviceTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B198[a1];
  }

  return v1;
}

__CFString *BMDeviceCellularAvailabilityStatusStateAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B170[a1];
  }

  return v1;
}

uint64_t BMDeviceCellularAvailabilityStatusStateDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceCellularAvailabilityStatusDeviceTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriSelfTriggerSuppressionAudioSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriSelfTriggerSuppressionAudioSourceFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_77000);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriSelfTriggerSuppressionAudioSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriSelfTriggerSuppressionAudioSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriSelfTriggerSuppressionAudioSourceAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B1E8[a1];
  }

  return v1;
}

uint64_t BMSiriSelfTriggerSuppressionAudioSourceDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMailCategorizationCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMailCategorizationCategoryFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_77414);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMailCategorizationCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMailCategorizationCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMailCategorizationMailboxTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMailCategorizationMailboxTypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_39_77389);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMailCategorizationMailboxTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMailCategorizationMailboxTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMailCategorizationByTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMailCategorizationByTypeFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_59_77367);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMailCategorizationByTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMailCategorizationByTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMailCategorizationDomainFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMailCategorizationDomainFromString_sortedStrings, 8uLL, 8uLL, &__block_literal_global_82_77341);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMailCategorizationDomainFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMailCategorizationDomainFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMailCategorizationDomainFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMailCategorizationByTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMailCategorizationMailboxTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMailCategorizationCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMailCategorizationCategoryAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B3A8[a1];
  }

  return v1;
}

__CFString *BMMailCategorizationMailboxTypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B3E0[a1];
  }

  return v1;
}

__CFString *BMMailCategorizationByTypeAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B420[a1];
  }

  return v1;
}

__CFString *BMMailCategorizationDomainAsString(uint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B458[a1];
  }

  return v1;
}

uint64_t BMMailCategorizationCategoryDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMailCategorizationMailboxTypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMailCategorizationByTypeDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMailCategorizationDomainDecode(uint64_t result)
{
  if (result >= 9) {
    return 0;
  }
  else {
    return result;
  }
}

CFComparisonResult __BMPhotosMapTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosMapTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"Select";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

BOOL BMPhotosMapTypeFromString(const void *a1)
{
  return bsearch_b(a1, BMPhotosMapTypeFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_77572) != 0;
}

uint64_t BMPhotosMapTypeDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_78057);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommercePaymentRingSuggestionsPaidUsingRingFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommercePaymentRingSuggestionsPaidUsingRingFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_24_78047);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommercePaymentRingSuggestionsPaidUsingRingFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryFromString_sortedStrings, 0xEuLL, 8uLL, &__block_literal_global_65);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_76_77994);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommercePaymentRingSuggestionsPaidUsingRingFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B5E8[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommercePaymentRingSuggestionsPaidUsingRingAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B610[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryAsString(uint64_t a1)
{
  if (a1 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B628[a1];
  }

  return v1;
}

__CFString *BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B6A0[a1];
  }

  return v1;
}

uint64_t BMWalletPaymentsCommercePaymentRingSuggestionsAccountStateDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommercePaymentRingSuggestionsPaidUsingRingDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommercePaymentRingSuggestionsLastPaymentCategoryDecode(uint64_t result)
{
  if (result >= 0xF) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMWalletPaymentsCommercePaymentRingSuggestionsPaymentActionDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceInterfaceOrientationCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceInterfaceOrientationCategoryFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_78357);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceInterfaceOrientationCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceInterfaceOrientationCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceInterfaceOrientationCategoryAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B6F0[a1];
  }

  return v1;
}

uint64_t BMDeviceInterfaceOrientationCategoryDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMHealthFocusedEvaluationModeStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMHealthFocusedEvaluationModeStateFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_78682);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMHealthFocusedEvaluationModeStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMHealthFocusedEvaluationModeStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMHealthFocusedEvaluationModeStateAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B740[a1];
  }

  return v1;
}

uint64_t BMHealthFocusedEvaluationModeStateDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMAeroMLPhotosSearchLabeledDataUISurfaceTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMAeroMLPhotosSearchLabeledDataUISurfaceTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_79752);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMAeroMLPhotosSearchLabeledDataUISurfaceTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMAeroMLPhotosSearchLabeledDataUISurfaceTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMAeroMLPhotosSearchLabeledDataUISurfaceTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603B9A0[a1];
  }

  return v1;
}

uint64_t BMAeroMLPhotosSearchLabeledDataUISurfaceTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMDeviceBatteryGaugingGaugingUpdateTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceBatteryGaugingGaugingUpdateTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_80040);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceBatteryGaugingGaugingUpdateTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceBatteryGaugingQMaxStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceBatteryGaugingQMaxStateFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_27_80024);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMDeviceBatteryGaugingQMaxStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceBatteryGaugingQMaxStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceBatteryGaugingOCVStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceBatteryGaugingOCVStateFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_35_80014);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceBatteryGaugingOCVStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMDeviceBatteryGaugingPeriodicFullChargeStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMDeviceBatteryGaugingPeriodicFullChargeStateFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_46);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMDeviceBatteryGaugingPeriodicFullChargeStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMDeviceBatteryGaugingPeriodicFullChargeStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceBatteryGaugingOCVStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceBatteryGaugingQMaxStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMDeviceBatteryGaugingGaugingUpdateTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMDeviceBatteryGaugingGaugingUpdateTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BA60[a1];
  }

  return v1;
}

__CFString *BMDeviceBatteryGaugingQMaxStateAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BA80[a1];
  }

  return v1;
}

__CFString *BMDeviceBatteryGaugingOCVStateAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BAA8[a1];
  }

  return v1;
}

__CFString *BMDeviceBatteryGaugingPeriodicFullChargeStateAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BAC0[a1];
  }

  return v1;
}

uint64_t BMDeviceBatteryGaugingGaugingUpdateTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceBatteryGaugingQMaxStateDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceBatteryGaugingOCVStateDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMDeviceBatteryGaugingPeriodicFullChargeStateDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_81013);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BCF8[a1];
  }

  return v1;
}

unsigned char *BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString_sortedStrings, 0xBuLL, 8uLL, &__block_literal_global_45_81066);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeAsString(uint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BD10[a1];
  }

  return v1;
}

uint64_t BMMessagesSharedWithYouFeedbackRankableSocialHighlightTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMessagesSharedWithYouFeedbackUnifiedFeedbackTypeDecode(uint64_t result)
{
  if (result >= 0xC) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMindfulnessSessionModeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMindfulnessSessionModeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_81230);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMindfulnessSessionModeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMMindfulnessSessionStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMindfulnessSessionStateFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_27_81214);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMindfulnessSessionStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMindfulnessSessionStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMindfulnessSessionStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMMindfulnessSessionModeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMindfulnessSessionModeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BDB8[a1];
  }

  return v1;
}

__CFString *BMMindfulnessSessionStateAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BDD8[a1];
  }

  return v1;
}

uint64_t BMMindfulnessSessionModeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMindfulnessSessionStateDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMapsRecentConversationsIntentActionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMapsRecentConversationsIntentActionTypeFromString_sortedStrings, 0x12uLL, 8uLL, &__block_literal_global_81638);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMapsRecentConversationsIntentActionTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMapsRecentConversationsIntentActionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMapsRecentConversationsIntentActionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMapsRecentConversationsIntentActionTypeAsString(uint64_t a1)
{
  if (a1 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603BEE8[a1];
  }

  return v1;
}

uint64_t BMMapsRecentConversationsIntentActionTypeDecode(uint64_t result)
{
  if (result >= 0x13) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_81967);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603C058[a1];
  }

  return v1;
}

uint64_t BMSiriUserEngagementStatisticsAccumulatedAggregationStatsAggregatedStatsTriggeredMechanismDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMSiriServiceDismissalReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriServiceDismissalReasonFromString_sortedStrings, 0x35uLL, 8uLL, &__block_literal_global_82396);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriServiceDismissalReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriServiceDismissalReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMSiriServiceRequestSourceFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMSiriServiceRequestSourceFromString_sortedStrings, 0x2CuLL, 8uLL, &__block_literal_global_297_82261);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMSiriServiceRequestSourceFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMSiriServiceRequestSourceFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMSiriServiceRequestSourceFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMSiriServiceDismissalReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMSiriServiceDismissalReasonAsString(uint64_t a1)
{
  if (a1 >= 0x36)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603C3B0[a1];
  }

  return v1;
}

__CFString *BMSiriServiceRequestSourceAsString(uint64_t a1)
{
  if (a1 >= 0x2D)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603C560[a1];
  }

  return v1;
}

uint64_t BMSiriServiceDismissalReasonDecode(uint64_t result)
{
  if (result >= 0x36) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMSiriServiceRequestSourceDecode(uint64_t result)
{
  if (result >= 0x2D) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString_sortedStrings, 0x1DuLL, 8uLL, &__block_literal_global_84084);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeAsString(uint64_t a1)
{
  if (a1 >= 0x1E)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603C970[a1];
  }

  return v1;
}

unsigned char *BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_102);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CA60[a1];
  }

  return v1;
}

uint64_t BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelTypeDecode(uint64_t result)
{
  if (result >= 0x1E) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMMLSEShareSheetInferencePeopleSuggestionsResponseTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMWalletSettledTransactionMerchantTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMWalletSettledTransactionMerchantTypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_84457);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMWalletSettledTransactionMerchantTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMWalletSettledTransactionMerchantTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMWalletSettledTransactionMerchantTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMWalletSettledTransactionMerchantTypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CAD8[a1];
  }

  return v1;
}

uint64_t BMWalletSettledTransactionMerchantTypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosEngagementTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosEngagementTypeFromString_sortedStrings, 7uLL, 8uLL, &__block_literal_global_84634);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMPhotosEngagementTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosEngagementTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosEngagementTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosEngagementTypeAsString(uint64_t a1)
{
  if (a1 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CB68[a1];
  }

  return v1;
}

uint64_t BMPhotosEngagementTypeDecode(uint64_t result)
{
  if (result >= 8) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMPhotosMemoriesViewedDurationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMPhotosMemoriesViewedDurationFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_85398);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMPhotosMemoriesViewedDurationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMPhotosMemoriesViewedDurationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMPhotosMemoriesViewedDurationAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CC30[a1];
  }

  return v1;
}

uint64_t BMPhotosMemoriesViewedDurationDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMNanoSettingsControlCenterUsageTransitionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMNanoSettingsControlCenterUsageTransitionTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_87120);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMNanoSettingsControlCenterUsageTransitionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_15_87110);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMNanoSettingsControlCenterUsageButtonPressTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMNanoSettingsControlCenterUsageButtonPressTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_23);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMNanoSettingsControlCenterUsageButtonPressTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMNanoSettingsControlCenterUsageButtonPressTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMNanoSettingsControlCenterUsageTransitionTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMNanoSettingsControlCenterUsageTransitionTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CF38[a1];
  }

  return v1;
}

__CFString *BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CF58[a1];
  }

  return v1;
}

__CFString *BMNanoSettingsControlCenterUsageButtonPressTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CF70[a1];
  }

  return v1;
}

uint64_t BMNanoSettingsControlCenterUsageTransitionTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMNanoSettingsControlCenterUsageButtonPressTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMTrialNamespaceUpdatesEventTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMTrialNamespaceUpdatesEventTypeFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_87417);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMTrialNamespaceUpdatesEventTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMTrialNamespaceUpdatesEventTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMTrialNamespaceUpdatesEventTypeAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603CFD8[a1];
  }

  return v1;
}

uint64_t BMTrialNamespaceUpdatesEventTypeDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMGazeEnrollmentSampleEnrollmentQualityFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGazeEnrollmentSampleEnrollmentQualityFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_89214);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentQualityFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGazeEnrollmentSampleEnrollmentQualityFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMGazeEnrollmentSampleEnrollmentFailureReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGazeEnrollmentSampleEnrollmentFailureReasonFromString_sortedStrings, 9uLL, 8uLL, &__block_literal_global_78);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentFailureReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGazeEnrollmentSampleEnrollmentFailureReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMGazeEnrollmentSampleAccessibilityModeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGazeEnrollmentSampleAccessibilityModeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_30_89176);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGazeEnrollmentSampleAccessibilityModeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMGazeEnrollmentSampleEyeboxStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGazeEnrollmentSampleEyeboxStatusFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_38_89168);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEyeboxStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGazeEnrollmentSampleEyeboxStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMGazeEnrollmentSampleEnrollmentReasonFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_49_89157);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGazeEnrollmentSampleEnrollmentReasonFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMGazeEnrollmentSampleEnrollmentReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMGazeEnrollmentSampleEyeboxStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMGazeEnrollmentSampleAccessibilityModeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMGazeEnrollmentSampleEnrollmentFailureReasonFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMGazeEnrollmentSampleEnrollmentQualityFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMGazeEnrollmentSampleEnrollmentFailureReasonAsString(uint64_t a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D410[a1];
  }

  return v1;
}

__CFString *BMGazeEnrollmentSampleEnrollmentQualityAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D388[a1];
  }

  return v1;
}

__CFString *BMGazeEnrollmentSampleAccessibilityModeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D3B8[a1];
  }

  return v1;
}

__CFString *BMGazeEnrollmentSampleEyeboxStatusAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D3D8[a1];
  }

  return v1;
}

__CFString *BMGazeEnrollmentSampleEnrollmentReasonAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D3F0[a1];
  }

  return v1;
}

uint64_t BMGazeEnrollmentSampleEnrollmentQualityDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMGazeEnrollmentSampleAccessibilityModeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMGazeEnrollmentSampleEyeboxStatusDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMGazeEnrollmentSampleEnrollmentReasonDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMGazeEnrollmentSampleEnrollmentFailureReasonDecode(uint64_t result)
{
  if (result >= 0xA) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMOasisAnalyticsGazeSampleEyeSideFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsGazeSampleEyeSideFromString_sortedStrings, 4uLL, 8uLL, &__block_literal_global_89638);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsGazeSampleEyeSideFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsGazeSampleEyeSideFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMOasisAnalyticsGazeSamplePupilSizeCategoryFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsGazeSamplePupilSizeCategoryFromString_sortedStrings, 6uLL, 8uLL, &__block_literal_global_33_89616);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsGazeSamplePupilSizeCategoryFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsGazeSamplePupilSizeCategoryFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMOasisAnalyticsGazeSamplePupilSizeCategoryFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMOasisAnalyticsGazeSampleEyeSideFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsGazeSampleEyeSideAsString(uint64_t a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D550[a1];
  }

  return v1;
}

__CFString *BMOasisAnalyticsGazeSamplePupilSizeCategoryAsString(uint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D578[a1];
  }

  return v1;
}

uint64_t BMOasisAnalyticsGazeSampleEyeSideDecode(uint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMOasisAnalyticsGazeSamplePupilSizeCategoryDecode(uint64_t result)
{
  if (result >= 7) {
    return 0;
  }
  else {
    return result;
  }
}

CFComparisonResult __BMOasisAnalyticsProcessIdFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsProcessIdAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unsigned int v2 = @"ARKitD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
      unsigned int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unsigned int v2 = @"Unknown";
  }
  return v2;
}

BOOL BMOasisAnalyticsProcessIdFromString(const void *a1)
{
  return bsearch_b(a1, BMOasisAnalyticsProcessIdFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_89846) != 0;
}

uint64_t BMOasisAnalyticsProcessIdDecode(uint64_t result)
{
  if (result >= 2) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMOasisAnalyticsDeviceWornStatusFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsDeviceWornStatusFromString_sortedStrings, 2uLL, 8uLL, &__block_literal_global_90140);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsDeviceWornStatusFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsDeviceWornStatusFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMOasisAnalyticsDeviceWornStatusFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsDeviceWornStatusAsString(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D638[a1];
  }

  return v1;
}

uint64_t BMOasisAnalyticsDeviceWornStatusDecode(uint64_t result)
{
  if (result >= 3) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMOasisAnalyticsContextSnapshotEnvironmentTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsContextSnapshotEnvironmentTypeFromString_sortedStrings, 0x1FuLL, 8uLL, &__block_literal_global_90464);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsContextSnapshotEnvironmentTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsContextSnapshotEnvironmentTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMOasisAnalyticsContextSnapshotEnvironmentTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsContextSnapshotEnvironmentTypeAsString(uint64_t a1)
{
  if (a1 >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603D990[a1];
  }

  return v1;
}

unsigned char *BMOasisAnalyticsTrackingStateTrackingModeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsTrackingStateTrackingModeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_108_90689);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsTrackingStateTrackingModeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMOasisAnalyticsTrackingStateTrackingModeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsTrackingStateTrackingModeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603DA90[a1];
  }

  return v1;
}

unsigned char *BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_119_90937);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMOasisAnalyticsRelocalizationSucceededDescriptorTypeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsRelocalizationSucceededDescriptorTypeAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603DAB0[a1];
  }

  return v1;
}

uint64_t BMOasisAnalyticsContextSnapshotEnvironmentTypeDecode(uint64_t result)
{
  if (result >= 0x20) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMOasisAnalyticsTrackingStateTrackingModeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMOasisAnalyticsRelocalizationSucceededDescriptorTypeDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMOasisAnalyticsRegionInfoCountryCodeFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMOasisAnalyticsRegionInfoCountryCodeFromString_sortedStrings, 0xFAuLL, 8uLL, &__block_literal_global_91211);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMOasisAnalyticsRegionInfoCountryCodeFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMOasisAnalyticsRegionInfoCountryCodeFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMOasisAnalyticsRegionInfoCountryCodeFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMOasisAnalyticsRegionInfoCountryCodeAsString(uint64_t a1)
{
  if (a1 >= 0xFB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603E310[a1];
  }

  return v1;
}

uint64_t BMOasisAnalyticsRegionInfoCountryCodeDecode(uint64_t result)
{
  if (result >= 0xFB) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMASRRequestMetricsRecordCompletionStateFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMASRRequestMetricsRecordCompletionStateFromString_sortedStrings, 5uLL, 8uLL, &__block_literal_global_92479);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMASRRequestMetricsRecordCompletionStateFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMASRRequestMetricsRecordCompletionStateFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMASRRequestMetricsRecordCompletionStateFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMASRRequestMetricsRecordCompletionStateAsString(uint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603EC18[a1];
  }

  return v1;
}

uint64_t BMASRRequestMetricsRecordCompletionStateDecode(uint64_t result)
{
  if (result >= 6) {
    return 0;
  }
  else {
    return result;
  }
}

unsigned char *BMGeneratedImageUserInteractionPersonalizationFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGeneratedImageUserInteractionPersonalizationFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_92799);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionPersonalizationFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGeneratedImageUserInteractionPersonalizationFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMGeneratedImageUserInteractionResultFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGeneratedImageUserInteractionResultFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_24_92786);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionResultFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGeneratedImageUserInteractionResultFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

unsigned char *BMGeneratedImageUserInteractionFeatureFromString(const void *a1)
{
  uint64_t result = bsearch_b(a1, BMGeneratedImageUserInteractionFeatureFromString_sortedStrings, 3uLL, 8uLL, &__block_literal_global_35_92775);
  if (result) {
    return (unsigned char *)*(unsigned int *)((char *)&BMGeneratedImageUserInteractionFeatureFromString_sortedEnums
  }
                                    + (((unint64_t)(result
                                                         - (unsigned char *)BMGeneratedImageUserInteractionFeatureFromString_sortedStrings) >> 1) & 0x7FFFFFFFFFFFFFFCLL));
  return result;
}

CFComparisonResult __BMGeneratedImageUserInteractionFeatureFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMGeneratedImageUserInteractionResultFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

CFComparisonResult __BMGeneratedImageUserInteractionPersonalizationFromString_block_invoke(int a1, CFStringRef theString1, CFStringRef *a3)
{
  return CFStringCompare(theString1, *a3, 1uLL);
}

__CFString *BMGeneratedImageUserInteractionPersonalizationAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603ED10[a1];
  }

  return v1;
}

__CFString *BMGeneratedImageUserInteractionResultAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603ED30[a1];
  }

  return v1;
}

__CFString *BMGeneratedImageUserInteractionFeatureAsString(uint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E603ED50[a1];
  }

  return v1;
}

uint64_t BMGeneratedImageUserInteractionPersonalizationDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMGeneratedImageUserInteractionResultDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t BMGeneratedImageUserInteractionFeatureDecode(uint64_t result)
{
  if (result >= 4) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t sub_1B359E848()
{
  return MEMORY[0x1F4126E10]();
}

uint64_t sub_1B359E858()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B359E868()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B359E878()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B359E888()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B359E898()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B359E8A8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1B359E8B8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B359E8C8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B359E8D8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B359E8E8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t BMConvertObjectToJSONString()
{
  return MEMORY[0x1F410CA18]();
}

uint64_t BMDevicePlatformAsKeyString()
{
  return MEMORY[0x1F410C828]();
}

uint64_t BMEventBodyDataSQLColumn()
{
  return MEMORY[0x1F410CA20]();
}

uint64_t BMEventBookmarkSQLColumns()
{
  return MEMORY[0x1F410CA28]();
}

uint64_t BMEventClassNameSQLColumn()
{
  return MEMORY[0x1F410CA30]();
}

uint64_t BMEventTimestampSQLColumn()
{
  return MEMORY[0x1F410CA38]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteSint32Field()
{
  return MEMORY[0x1F4147210]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1F40CA578](__key, __base, __nel, __width, __compar);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}