unsigned char *destructiveInjectEnumTag for ALBtAdvInfoType7.Placement(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t getEnumTag for ALBtAdvInfoType7.Placement(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t destroy for ALBtNotifications()
{
  return swift_bridgeObjectRelease();
}

uint64_t destroy for ALBtNotification()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for ALBtNotifications(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ALWiFiScanSingleAccessPoint()
{
  return swift_bridgeObjectRelease();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiScanSingleAccessPoint()
{
  return &type metadata for ALWiFiScanSingleAccessPoint;
}

__n128 ALBtNotification.timestamp.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  char v3 = *(unsigned char *)(v1 + 40);
  char v4 = *(unsigned char *)(v1 + 41);
  __n128 result = *(__n128 *)v1;
  long long v6 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v3;
  *(unsigned char *)(a1 + 41) = v4;
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint.isMoving.getter()
{
  return *(unsigned __int8 *)(v0 + 54);
}

uint64_t ALWiFiScanSingleAccessPoint.isAph.getter()
{
  return *(unsigned __int8 *)(v0 + 53);
}

uint64_t destroy for ALWiFiNotification()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for ALWiFiNotification()
{
  return &type metadata for ALWiFiNotification;
}

unsigned char *ALWiFiScanSingleAccessPoint._band.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 55) = *result;
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint.mac.getter()
{
  return *(void *)v0;
}

uint64_t ALWiFiNotification.associatedMac.getter()
{
  return *(void *)(v0 + 112);
}

ValueMetadata *type metadata accessor for ALWiFiScanSingleAccessPoint.Band()
{
  return &type metadata for ALWiFiScanSingleAccessPoint.Band;
}

uint64_t ALWiFiScanSingleAccessPoint._channel.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 40) = result;
  *(unsigned char *)(v1 + 44) = BYTE4(result) & 1;
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint._rssidB.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 32) = result;
  *(unsigned char *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint._ageSec.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 48) = result;
  *(unsigned char *)(v1 + 52) = BYTE4(result) & 1;
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint._mac.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiScanSingleAccessPoint.Mode()
{
  return &type metadata for ALWiFiScanSingleAccessPoint.Mode;
}

ValueMetadata *type metadata accessor for ALWiFiScanResult()
{
  return &type metadata for ALWiFiScanResult;
}

uint64_t ALWiFiNotifications.results.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ALWiFiNotifications.isLastBatch.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t ALWiFiScanResult.accessPoints.getter()
{
  return swift_bridgeObjectRetain();
}

void ALWiFiScanSingleAccessPoint.mode.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 37);
}

void ALWiFiScanSingleAccessPoint.band.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 55);
}

ValueMetadata *type metadata accessor for ALWiFiNotification.NotiType()
{
  return &type metadata for ALWiFiNotification.NotiType;
}

ValueMetadata *type metadata accessor for ALTimeStamp()
{
  return &type metadata for ALTimeStamp;
}

unint64_t ALWiFiScanSingleAccessPoint.channel.getter()
{
  return *(unsigned int *)(v0 + 40) | ((unint64_t)*(unsigned __int8 *)(v0 + 44) << 32);
}

unint64_t ALWiFiScanSingleAccessPoint.rssidB.getter()
{
  return *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
}

unint64_t ALWiFiScanSingleAccessPoint.ageSec.getter()
{
  return *(unsigned int *)(v0 + 48) | ((unint64_t)*(unsigned __int8 *)(v0 + 52) << 32);
}

uint64_t (*ALWiFiScanResult._accessPoints.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

ValueMetadata *type metadata accessor for ALWiFiNotifications()
{
  return &type metadata for ALWiFiNotifications;
}

ValueMetadata *type metadata accessor for ALResultOptions()
{
  return &type metadata for ALResultOptions;
}

uint64_t ALTimeStamp.cfAbsoluteTimeSec.getter()
{
  return *(void *)v0;
}

uint64_t ALWiFiNotification._simulated.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 123) = result;
  return result;
}

uint64_t ALWiFiNotification._simulated.getter()
{
  return *(unsigned __int8 *)(v0 + 123);
}

uint64_t ALWiFiNotification._available.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 124) = result;
  return result;
}

uint64_t ALWiFiNotification._available.getter()
{
  return *(unsigned __int8 *)(v0 + 124);
}

__n128 __swift_memcpy106_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 90) = *(long long *)((char *)a2 + 90);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

unsigned char *ALWiFiNotification._type.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t ALTimeStamp.machAbsoluteTimeSec.getter()
{
  return *(void *)(v0 + 16);
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

unint64_t ALWiFiScanSingleAccessPoint.frequencyKhz.getter()
{
  return *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
}

uint64_t (*ALWiFiScanResult._scanTimestamp.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t getEnumTagSinglePayload for ALResultOptions(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t ALWiFiNotification._associatedMac.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 112) = result;
  *(unsigned char *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t ALTimeStamp._machContinuousTimeSec.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t ALTimeStamp._machAbsoluteTimeSec.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t ALTimeStamp._cfAbsoluteTimeSec.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t ALWiFiNotifications._isLastBatch.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t ALWiFiNotification._isApAwake.getter()
{
  return *(unsigned __int8 *)(v0 + 125);
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

uint64_t initializeWithCopy for ALWiFiScanSingleAccessPoint(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_WORD *)(a1 + 36) = *(_WORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  int v4 = *(_DWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 52) = *(unsigned char *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = v4;
  *(unsigned char *)(a1 + 53) = *(unsigned char *)(a2 + 53);
  *(_WORD *)(a1 + 54) = *(_WORD *)(a2 + 54);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 90) = *(_OWORD *)(a2 + 90);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t ALWiFiNotification.scanResult.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 104);
  long long v3 = *(_OWORD *)(v1 + 72);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 88);
  *(void *)(a1 + 48) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t getEnumTagSinglePayload for ALTimeStamp(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t ALWiFiScanSingleAccessPoint.ssid.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void ALWiFiNotification.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t storeEnumTagSinglePayload for ALTimeStamp(uint64_t result, int a2, int a3)
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

void __swiftcall ALTimeStamp.init()(ALDataTypes::ALTimeStamp *__return_ptr retstr)
{
  retstr->_cfAbsoluteTimeSec.value = 0.0;
  retstr->_cfAbsoluteTimeSec.is_nil = 1;
  retstr->_machAbsoluteTimeSec.value = 0.0;
  retstr->_machAbsoluteTimeSec.is_nil = 1;
  retstr->_machContinuousTimeSec.value = 0.0;
  retstr->_machContinuousTimeSec.is_nil = 1;
}

uint64_t getEnumTagSinglePayload for ALWiFiScanSingleAccessPoint.Mode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

void __swiftcall ALWiFiScanResult.init()(ALDataTypes::ALWiFiScanResult *__return_ptr retstr)
{
  *(_OWORD *)retstr->_scanTimestamp.value.gap19 = 0u;
  *(_OWORD *)&retstr->_scanTimestamp.value._cfAbsoluteTimeSec.value = 0u;
  *(_OWORD *)&retstr->_scanTimestamp.value._machAbsoluteTimeSec.value = 0u;
  retstr->_scanTimestamp.is_nil = 1;
  retstr->_accessPoints._rawValue = (void *)MEMORY[0x263F8EE78];
}

__n128 ALWiFiScanResult._scanTimestamp.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 41);
  __n128 result = *(__n128 *)a1;
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 16) = v6;
  *(void *)(v1 + 32) = v2;
  *(unsigned char *)(v1 + 40) = v3;
  *(unsigned char *)(v1 + 41) = v4;
  return result;
}

__n128 ALWiFiNotification.timestamp.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 40);
  char v3 = *(unsigned char *)(v1 + 48);
  char v4 = *(unsigned char *)(v1 + 49);
  __n128 result = *(__n128 *)(v1 + 8);
  long long v6 = *(_OWORD *)(v1 + 24);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v3;
  *(unsigned char *)(a1 + 41) = v4;
  return result;
}

__n128 ALWiFiNotification._timestamp.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 41);
  __n128 result = *(__n128 *)a1;
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 8) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 24) = v6;
  *(void *)(v1 + 40) = v2;
  *(unsigned char *)(v1 + 48) = v3;
  *(unsigned char *)(v1 + 49) = v4;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

double ALWiFiScanSingleAccessPoint.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_WORD *)(a1 + 36) = 1025;
  *(_DWORD *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 44) = 1;
  *(_DWORD *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 52) = 1;
  *(_WORD *)(a1 + 53) = 514;
  *(unsigned char *)(a1 + 55) = 4;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 89) = 0u;
  *(unsigned char *)(a1 + 105) = 1;
  return result;
}

__n128 __swift_memcpy127_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(_OWORD *)(a1 + 111) = *(long long *)((char *)a2 + 111);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ALWiFiScanResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

ALDataTypes::ALWiFiNotifications __swiftcall ALWiFiNotifications.init()()
{
  *(void *)uint64_t v0 = MEMORY[0x263F8EE78];
  *(unsigned char *)(v0 + 8) = 1;
  return result;
}

uint64_t initializeWithCopy for ALWiFiNotification(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 34) = *(_OWORD *)(a2 + 34);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
  uint64_t v3 = *(void *)(a2 + 104);
  uint64_t v4 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 104) = v3;
  *(void *)(a1 + 112) = v4;
  *(_DWORD *)(a1 + 121) = *(_DWORD *)(a2 + 121);
  *(_WORD *)(a1 + 125) = *(_WORD *)(a2 + 125);
  swift_bridgeObjectRetain();
  return a1;
}

__n128 ALWiFiScanSingleAccessPoint.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 41);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_WORD *)(a2 + 36) = 1025;
  *(_DWORD *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 44) = 1;
  *(_DWORD *)(a2 + 48) = 0;
  *(unsigned char *)(a2 + 52) = 1;
  *(_WORD *)(a2 + 53) = 514;
  *(unsigned char *)(a2 + 55) = 4;
  *(_DWORD *)(a2 + 56) = 0;
  *(unsigned char *)(a2 + 60) = 1;
  __n128 result = *(__n128 *)a1;
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 80) = v6;
  *(void *)(a2 + 96) = v2;
  *(unsigned char *)(a2 + 104) = v3;
  *(unsigned char *)(a2 + 105) = v4;
  return result;
}

unsigned char *storeEnumTagSinglePayload for ALWiFiScanSingleAccessPoint.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        break;
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t initializeWithCopy for ALWiFiScanResult(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t (*ALWiFiNotifications._results.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

ALDataTypes::ALWiFiNotifications __swiftcall ALWiFiNotifications.init(_results:_isLastBatch:)(Swift::OpaquePointer _results, Swift::Bool_optional _isLastBatch)
{
  *(Swift::OpaquePointer *)uint64_t v2 = _results;
  *(unsigned char *)(v2 + 8) = _isLastBatch.value == 2 || _isLastBatch.value;
  result._results = _results;
  result._isLastBatch = _isLastBatch.value;
  return result;
}

uint64_t storeEnumTagSinglePayload for ALWiFiScanResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)ALDataTypes::ALWiFiNotifications result = a2 ^ 0x80000000;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

double ALWiFiNotification.init()@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 15;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 33) = 0u;
  *(unsigned char *)(a1 + 49) = 1;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_WORD *)(a1 + 120) = 3841;
  *(_DWORD *)(a1 + 122) = 33686018;
  *(unsigned char *)(a1 + 126) = 2;
  return result;
}

__n128 ALWiFiNotification._scanResult.setter(long long *a1)
{
  long long v5 = a1[1];
  long long v6 = *a1;
  __n128 v4 = (__n128)a1[2];
  uint64_t v2 = *((void *)a1 + 6);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v1 + 56) = v6;
  *(_OWORD *)(v1 + 72) = v5;
  __n128 result = v4;
  *(__n128 *)(v1 + 88) = v4;
  *(void *)(v1 + 104) = v2;
  return result;
}

double static ALTimeStamp.now()@<D0>(uint64_t a1@<X8>)
{
  double v2 = machContTimeSec()();
  type metadata accessor for TimesSync();
  static TimesSync.instance.getter();
  uint64_t v3 = dispatch thunk of TimesSync.mctMinusMatNs.getter();
  swift_release();
  double v4 = v2 - NsToSec.getter() * (double)(unint64_t)v3;
  static TimesSync.instance.getter();
  dispatch thunk of TimesSync.cfaMinusMctSec.getter();
  double v6 = v5;
  swift_release();
  double result = v2 + v6;
  *(double *)a1 = v2 + v6;
  *(unsigned char *)(a1 + 8) = 0;
  *(double *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = 0;
  *(double *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

Swift::Double __swiftcall machContTimeSec()()
{
  return machAbsTimeSec()(MEMORY[0x270FA53A8]);
}

Swift::Double machAbsTimeSec()(uint64_t (*a1)(void))
{
  Swift::UInt64 v1 = a1();
  Swift::UInt64 v2 = convertTicksToNs(_:)(v1);
  if (one-time initialization token for NsToSec != -1) {
    swift_once();
  }
  return NsToSec * (double)v2;
}

Swift::UInt64 __swiftcall convertTicksToNs(_:)(Swift::UInt64 result)
{
  Swift::UInt64 v1 = result;
  if (one-time initialization token for sTicksInfo != -1) {
    double result = swift_once();
  }
  if (is_mul_ok(v1, static sTicksInfo in FuncData #1 in ticksInfo()))
  {
    if (static sTicksInfo in FuncData #1 in ticksInfo()) {
      return v1 * static sTicksInfo in FuncData #1 in ticksInfo() / static sTicksInfo in FuncData #1 in ticksInfo();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void __swiftcall ALTimeStamp.init(machContinuousTimeSec:)(ALDataTypes::ALTimeStamp *__return_ptr retstr, Swift::Double machContinuousTimeSec)
{
  type metadata accessor for TimesSync();
  static TimesSync.instance.getter();
  uint64_t v4 = dispatch thunk of TimesSync.mctMinusMatNs.getter();
  swift_release();
  Swift::Double v5 = machContinuousTimeSec - NsToSec.getter() * (double)(unint64_t)v4;
  static TimesSync.instance.getter();
  dispatch thunk of TimesSync.cfaMinusMctSec.getter();
  double v7 = v6;
  swift_release();
  retstr->_cfAbsoluteTimeSec.value = v7 + machContinuousTimeSec;
  retstr->_cfAbsoluteTimeSec.is_nil = 0;
  retstr->_machAbsoluteTimeSec.value = v5;
  retstr->_machAbsoluteTimeSec.is_nil = 0;
  retstr->_machContinuousTimeSec.value = machContinuousTimeSec;
  retstr->_machContinuousTimeSec.is_nil = 0;
}

uint64_t static TimesSync.instance.getter()
{
  type metadata accessor for TimesSync();

  return swift_initStaticObject();
}

uint64_t type metadata accessor for TimesSync()
{
  return self;
}

double TimesSync._cfaMinusMctSec.getter()
{
  swift_beginAccess();
  return *(double *)(v0 + 24);
}

uint64_t dispatch thunk of TimesSync.cfaMinusMctSec.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t TimesSync._mctMinusMatNs.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t dispatch thunk of TimesSync.mctMinusMatNs.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t TimesSync.mctMinusMatNs.getter()
{
  (*(void (**)(void))(*(void *)v0 + 120))();
  Swift::UInt64 v1 = *(uint64_t (**)(void))(*(void *)v0 + 144);

  return v1();
}

uint64_t TimesSync.cfaMinusMctSec.getter()
{
  (*(void (**)(void))(*(void *)v0 + 120))();
  Swift::UInt64 v1 = *(uint64_t (**)(void))(*(void *)v0 + 168);

  return v1();
}

Swift::Void __swiftcall TimesSync.sync()()
{
  uint64_t v3 = v0;
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v11 = (char *)&v30 - v10;
  if (((*(uint64_t (**)(uint64_t))(*(void *)v0 + 112))(v9) & 1) == 0) {
    return;
  }
  Swift::UInt64 v37 = 0;
  Swift::UInt64 v38 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  mach_get_times();
  Swift::UInt64 v12 = v38;
  if (v38 < v37)
  {
    __break(1u);
    goto LABEL_12;
  }
  Swift::UInt64 v13 = convertTicksToNs(_:)(v38 - v37);
  (*(void (**)(Swift::UInt64))(*(void *)v0 + 152))(v13);
  double v1 = (double)v35;
  double v2 = (double)v36;
  if (one-time initialization token for NsToSec != -1) {
LABEL_12:
  }
    swift_once();
  double v14 = NsToSec;
  Swift::Double v15 = NsToSec * v2 + v1;
  Swift::UInt64 v16 = convertTicksToNs(_:)(v12);
  (*(void (**)(double))(*(void *)v0 + 176))(v15 - v14 * (double)v16 - *MEMORY[0x263EFFB00]);
  (*(void (**)(Swift::UInt64, void))(*(void *)v0 + 200))(v12, 0);
  uint64_t v17 = corelog.unsafeMutableAddressor();
  v32 = *(void (**)(char *))(v5 + 16);
  uint64_t v33 = v17;
  v32(v11);
  v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (_DWORD *)swift_slowAlloc();
    uint64_t v31 = v5;
    v21 = v20;
    _DWORD *v20 = 134349824;
    swift_beginAccess();
    Swift::UInt64 v40 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v21 + 6) = 2050;
    swift_beginAccess();
    Swift::UInt64 v39 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v21 + 11) = 2050;
    swift_beginAccess();
    double v34 = *(double *)&v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v21 + 16) = 2050;
    double v34 = *(double *)&v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246D43000, v18, v19, "TimeSync,mat,%{public}llu,mct,%{public}llu,tp,%{public}ld,%{public}ld", (uint8_t *)v21, 0x2Au);
    v22 = v21;
    uint64_t v5 = v31;
    MEMORY[0x24C548760](v22, -1, -1);
  }

  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v23 = v5 + 8;
  v24 = v25;
  v25(v11, v4);
  ((void (*)(char *, uint64_t, uint64_t))v32)(v8, v33, v4);
  swift_retain();
  v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 134349312;
    uint64_t v31 = v23;
    double v34 = NsToSec * (double)(unint64_t)(*(uint64_t (**)(void))(*(void *)v3 + 144))();
    uint64_t v29 = UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v28 + 12) = 2050;
    double v34 = (*(double (**)(uint64_t))(*(void *)v3 + 168))(v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_246D43000, v26, v27, "TimeSync,mct-mat,%{public}f,cfa-mct,%{public}f", (uint8_t *)v28, 0x16u);
    MEMORY[0x24C548760](v28, -1, -1);
  }
  else
  {

    swift_release();
  }
  v24(v8, v4);
}

Swift::Bool __swiftcall TimesSync.needsSync()()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 192))();
  if (v2)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    uint64_t v3 = v1;
    uint64_t v4 = mach_continuous_time();
    unint64_t v5 = v4;
    if (one-time initialization token for SyncIntervalTicks != -1) {
      LOBYTE(v4) = swift_once();
    }
    if (__CFADD__(v3, static TimesSync.SyncIntervalTicks)) {
      __break(1u);
    }
    else {
      LOBYTE(v4) = v3 + static TimesSync.SyncIntervalTicks < v5;
    }
  }
  return v4;
}

uint64_t TimesSync._lastsyncMctTicks.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 32);
}

double NsToSec.getter()
{
  return NsToUs.getter(&one-time initialization token for NsToSec, (uint64_t)&NsToSec);
}

double NsToUs.getter(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

uint64_t ALWiFiScanResult.description.getter()
{
  uint64_t v2 = *(void *)v0;
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  char v6 = *(unsigned char *)(v0 + 40);
  char v7 = *(unsigned char *)(v0 + 41);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  v9._countAndFlagsBits = 745825133;
  v9._object = (void *)0xE400000000000000;
  String.append(_:)(v9);
  if (v7)
  {
    uint64_t v10 = 0;
    char v11 = 1;
  }
  else
  {
    uint64_t v16 = v2;
    char v17 = v1 & 1;
    uint64_t v18 = v4;
    char v19 = v3 & 1;
    uint64_t v20 = v5;
    char v21 = v6 & 1;
    uint64_t v10 = ALTimeStamp.machContinuousTimeSec.getter();
    char v11 = v12 & 1;
  }
  uint64_t v16 = v10;
  char v17 = v11;
  DefaultStringInterpolation.appendInterpolation<A>(_:)((uint64_t)&v16, MEMORY[0x263F8D538], MEMORY[0x263F8D5A8]);
  v13._countAndFlagsBits = 0x2C746E756F632CLL;
  v13._object = (void *)0xE700000000000000;
  String.append(_:)(v13);
  uint64_t v16 = *(void *)(v8 + 16);
  v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t ALWiFiNotification.description.getter()
{
  uint64_t v2 = *((void *)v0 + 3);
  uint64_t v1 = *((void *)v0 + 4);
  uint64_t v3 = *((void *)v0 + 5);
  unsigned __int8 v4 = v0[48];
  unsigned __int8 v5 = v0[49];
  Swift::String v6 = *(Swift::String *)(v0 + 56);
  long long v7 = *(_OWORD *)(v0 + 72);
  uint64_t v9 = *((void *)v0 + 11);
  uint64_t v8 = *((void *)v0 + 12);
  uint64_t v10 = *((void *)v0 + 13);
  uint64_t v28 = *((void *)v0 + 14);
  int v29 = *v0;
  unsigned __int8 v30 = v0[120];
  int v31 = v0[123];
  int v32 = v0[125];
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  if ((v5 & 1) == 0)
  {
    v38._countAndFlagsBits = 0;
    v38._object = (void *)0xE000000000000000;
    v11._countAndFlagsBits = 0x3A656D6974;
    v11._object = (void *)0xE500000000000000;
    long long v26 = v7;
    Swift::String v27 = v6;
    String.append(_:)(v11);
    *(void *)&long long v34 = v2;
    BYTE8(v34) = v1 & 1;
    uint64_t v35 = v3;
    LOBYTE(v36) = v4 & 1;
    v33._countAndFlagsBits = ALTimeStamp.machContinuousTimeSec.getter();
    LOBYTE(v33._object) = v12 & 1;
    DefaultStringInterpolation.appendInterpolation<A>(_:)((uint64_t)&v33, MEMORY[0x263F8D538], MEMORY[0x263F8D5A8]);
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    long long v7 = v26;
    Swift::String v6 = v27;
  }
  if (v10)
  {
    v38._countAndFlagsBits = 0x3A6E6163732CLL;
    v38._object = (void *)0xE600000000000000;
    Swift::String v33 = v6;
    long long v34 = v7;
    uint64_t v35 = v9;
    __int16 v36 = v8 & 0x1FF;
    uint64_t v37 = v10;
    v13._countAndFlagsBits = ALWiFiScanResult.description.getter();
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
  }
  if (v29 != 15)
  {
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    v14._countAndFlagsBits = 0x70795469746F6E2CLL;
    v14._object = (void *)0xEA00000000003A65;
    String.append(_:)(v14);
    LOBYTE(v38._countAndFlagsBits) = v29;
    _print_unlocked<A, B>(_:_:)();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }
  if ((v30 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = MEMORY[0x263F8E970];
    *(_OWORD *)(v15 + 16) = xmmword_246D4EC90;
    uint64_t v17 = MEMORY[0x263F8E9C0];
    *(void *)(v15 + 56) = v16;
    *(void *)(v15 + 64) = v17;
    *(void *)(v15 + 32) = v28;
    v18._countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
  }
  if (v31 != 2)
  {
    v33._countAndFlagsBits = 0x74616C756D69732CLL;
    v33._object = (void *)0xEB000000003A6465;
    if (v31) {
      uint64_t v19 = 1702195828;
    }
    else {
      uint64_t v19 = 0x65736C6166;
    }
    if (v31) {
      unint64_t v20 = 0xE400000000000000;
    }
    else {
      unint64_t v20 = 0xE500000000000000;
    }
    unint64_t v21 = v20;
    String.append(_:)(*(Swift::String *)&v19);
    swift_bridgeObjectRelease();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }
  if (v32 != 2)
  {
    v33._countAndFlagsBits = 0x656B61774170612CLL;
    v33._object = (void *)0xE90000000000003ALL;
    if (v32) {
      uint64_t v22 = 1702195828;
    }
    else {
      uint64_t v22 = 0x65736C6166;
    }
    if (v32) {
      unint64_t v23 = 0xE400000000000000;
    }
    else {
      unint64_t v23 = 0xE500000000000000;
    }
    unint64_t v24 = v23;
    String.append(_:)(*(Swift::String *)&v22);
    swift_bridgeObjectRelease();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }
  return v39;
}

uint64_t ALTimeStamp.machContinuousTimeSec.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  uint64_t v10 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v16[3] = MEMORY[0x263F8D310];
    v16[4] = MEMORY[0x263F8D378];
    v16[0] = 7104878;
    v16[1] = 0xE300000000000000;
  }
  else
  {
    uint64_t v14 = a2;
    uint64_t v15 = a3;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v13);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(boxed_opaque_existential_1, v9, a2);
    outlined init with take of CVarArg(&v13, (uint64_t)v16);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CustomStringConvertible);
  _print_unlocked<A, B>(_:_:)();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t outlined init with take of CVarArg(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unsigned char *storeEnumTagSinglePayload for ALWiFiNotification.NotiType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
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
        break;
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
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ALWiFiNotification.NotiType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

ALDataTypes::ALBtAdvertisement::BtType_optional __swiftcall ALBtAdvertisement.BtType.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 18) {
    char v2 = 2;
  }
  else {
    char v2 = 3;
  }
  if (rawValue == 7) {
    char v3 = 1;
  }
  else {
    char v3 = v2;
  }
  if (!rawValue) {
    char v3 = 0;
  }
  *uint64_t v1 = v3;
  return (ALDataTypes::ALBtAdvertisement::BtType_optional)rawValue;
}

uint64_t ALBtAdvertisement.BtType.rawValue.getter()
{
  return qword_246D4EF40[*v0];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ALBtAdvertisement.BtType(char *a1, char *a2)
{
  return qword_246D4EF40[*a1] == qword_246D4EF40[*a2];
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ALBtAdvertisement.BtType()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(qword_246D4EF40[v1]);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ALBtAdvertisement.BtType()
{
  Hasher._combine(_:)(qword_246D4EF40[*v0]);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ALBtAdvertisement.BtType()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(qword_246D4EF40[v1]);
  return Hasher._finalize()();
}

ALDataTypes::ALBtAdvertisement::BtType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ALBtAdvertisement.BtType(Swift::Int *a1)
{
  return ALBtAdvertisement.BtType.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ALBtAdvertisement.BtType(void *a1@<X8>)
{
  *a1 = qword_246D4EF40[*v1];
}

uint64_t ALBtAdvertisement.machContTimeNs.getter()
{
  return *(void *)v0;
}

uint64_t ALBtAdvertisement.mac.getter()
{
  return *(void *)(v0 + 16);
}

unint64_t ALBtAdvertisement.rssidB.getter()
{
  return *(unsigned int *)(v0 + 28) | ((unint64_t)*(unsigned __int8 *)(v0 + 32) << 32);
}

unint64_t ALBtAdvertisement.channel.getter()
{
  return *(unsigned int *)(v0 + 36) | ((unint64_t)*(unsigned __int8 *)(v0 + 40) << 32);
}

void ALBtAdvertisement.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 49);
}

uint64_t ALBtAdvertisement.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ALBtAdvertisement.idsDeviceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ALBtAdvertisement.payload.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  outlined copy of Data?(v1, *(void *)(v0 + 136));
  return v1;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t ALBtAdvertisement.deviceFlags.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t ALBtAdvertisement.discoveryFlags.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t ALBtAdvertisement.machContTimeSec.getter()
{
  if (*(unsigned char *)(v0 + 8))
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    double v2 = (double)*(unint64_t *)v0;
    *(double *)&uint64_t result = NsToSec.getter() * v2;
  }
  return result;
}

uint64_t ALBtAdvertisement.cfAbsTimeSec.getter()
{
  if (*(unsigned char *)(v0 + 8))
  {
    *(double *)&uint64_t result = 0.0;
  }
  else
  {
    double v2 = (double)*(unint64_t *)v0;
    double v3 = NsToSec.getter() * v2;
    type metadata accessor for TimesSync();
    static TimesSync.instance.getter();
    dispatch thunk of TimesSync.cfaMinusMctSec.getter();
    double v5 = v4;
    swift_release();
    *(double *)&uint64_t result = v3 + v5;
  }
  return result;
}

uint64_t ALBtAdvertisement.description.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 24);
  int v4 = *(_DWORD *)(v0 + 28);
  int v5 = *(unsigned __int8 *)(v0 + 32);
  int v6 = *(unsigned __int8 *)(v0 + 40);
  int v56 = *(char *)(v0 + 49);
  uint64_t v50 = *(void *)(v0 + 56);
  uint64_t v51 = *(void *)(v0 + 72);
  char v57 = *(unsigned char *)(v0 + 64);
  char v58 = *(unsigned char *)(v0 + 80);
  int v53 = *(_DWORD *)(v0 + 36);
  char v54 = *(unsigned char *)(v0 + 84);
  __int16 v48 = *(_WORD *)(v0 + 82);
  int v49 = *(_DWORD *)(v0 + 88);
  char v55 = *(unsigned char *)(v0 + 92);
  uint64_t v52 = *(void *)(v0 + 96);
  uint64_t v60 = *(void *)(v0 + 104);
  int v59 = *(_DWORD *)(v0 + 149);
  unint64_t v7 = *(void *)v0;
  v61._uint64_t countAndFlagsBits = 980706157;
  v61._object = (void *)0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_246D4EC90;
  double v9 = (double)v7 * 0.000000001;
  uint64_t v10 = MEMORY[0x263F8D5B8];
  if (v1) {
    double v9 = 0.0;
  }
  *(void *)(v8 + 56) = MEMORY[0x263F8D538];
  *(void *)(v8 + 64) = v10;
  *(double *)(v8 + 32) = v9;
  v11._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  Swift::String v12 = v61;
  v61._uint64_t countAndFlagsBits = 0;
  v61._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  v64._uint64_t countAndFlagsBits = 0xD000000000000011;
  v64._object = (void *)0x8000000246D4F620;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_246D4EC90;
  if (v3)
  {
    uint64_t v14 = MEMORY[0x263F8D750];
    *(void *)(v13 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v13 + 64) = v14;
    *(void *)(v13 + 32) = 0;
  }
  else
  {
    uint64_t v62 = MEMORY[0x263F8E970];
    uint64_t v63 = MEMORY[0x263F8E9C0];
    v61._uint64_t countAndFlagsBits = bswap64(v2);
    outlined init with take of CVarArg((long long *)&v61._countAndFlagsBits, v13 + 32);
  }
  v15._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  uint64_t countAndFlagsBits = v64._countAndFlagsBits;
  object = v64._object;
  Swift::String v61 = v12;
  swift_bridgeObjectRetain();
  v18._uint64_t countAndFlagsBits = countAndFlagsBits;
  v18._object = object;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::String v19 = v61;
  v61._uint64_t countAndFlagsBits = 0x3A69737372202CLL;
  v61._object = (void *)0xE700000000000000;
  if (v5) {
    int v20 = 0;
  }
  else {
    int v20 = v4;
  }
  LODWORD(v64._countAndFlagsBits) = v20;
  v21._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  Swift::String v22 = v61;
  Swift::String v61 = v19;
  swift_bridgeObjectRetain();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::String v23 = v61;
  v61._uint64_t countAndFlagsBits = 0x656E6E616863202CLL;
  v61._object = (void *)0xEA00000000003A6CLL;
  int v24 = v53;
  if (v6) {
    int v24 = -1;
  }
  LODWORD(v64._countAndFlagsBits) = v24;
  v25._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  Swift::String v26 = v61;
  Swift::String v61 = v23;
  swift_bridgeObjectRetain();
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v54 & 1) == 0)
  {
    strcpy((char *)&v64, ", vid:0x");
    BYTE1(v64._object) = 0;
    WORD1(v64._object) = 0;
    HIDWORD(v64._object) = -402653184;
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = MEMORY[0x263F8E888];
    *(_OWORD *)(v27 + 16) = xmmword_246D4EC90;
    uint64_t v29 = MEMORY[0x263F8E8E8];
    *(void *)(v27 + 56) = v28;
    *(void *)(v27 + 64) = v29;
    *(_WORD *)(v27 + 32) = v48;
    v30._uint64_t countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  if ((v55 & 1) == 0)
  {
    strcpy((char *)&v64, ", pid:0x");
    BYTE1(v64._object) = 0;
    WORD1(v64._object) = 0;
    HIDWORD(v64._object) = -402653184;
    uint64_t v31 = swift_allocObject();
    uint64_t v32 = MEMORY[0x263F8E8F8];
    *(_OWORD *)(v31 + 16) = xmmword_246D4EC90;
    uint64_t v33 = MEMORY[0x263F8E960];
    *(void *)(v31 + 56) = v32;
    *(void *)(v31 + 64) = v33;
    *(_DWORD *)(v31 + 32) = v49;
    v34._uint64_t countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v34);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  uint64_t v35 = MEMORY[0x263F8E970];
  uint64_t v36 = MEMORY[0x263F8E9C0];
  if (v56 == 3)
  {
    if (v57) {
      goto LABEL_17;
    }
  }
  else
  {
    strcpy((char *)&v64, ", type:");
    v64._object = (void *)0xE700000000000000;
    v45._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v45);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
    if (v57)
    {
LABEL_17:
      if (v58) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  v64._uint64_t countAndFlagsBits = 0;
  v64._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  v64._uint64_t countAndFlagsBits = 0xD000000000000010;
  v64._object = (void *)0x8000000246D4F660;
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_246D4EC90;
  *(void *)(v46 + 56) = v35;
  *(void *)(v46 + 64) = v36;
  *(void *)(v46 + 32) = v50;
  v47._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v47);
  swift_bridgeObjectRelease();
  String.append(_:)(v64);
  swift_bridgeObjectRelease();
  if ((v58 & 1) == 0)
  {
LABEL_18:
    v64._uint64_t countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v64._uint64_t countAndFlagsBits = 0xD000000000000013;
    v64._object = (void *)0x8000000246D4F640;
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_246D4EC90;
    *(void *)(v37 + 56) = v35;
    *(void *)(v37 + 64) = v36;
    *(void *)(v37 + 32) = v51;
    v38._uint64_t countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
LABEL_19:
  uint64_t v39 = v60;
  if (v60)
  {
    strcpy((char *)&v64, ", identifier:");
    HIWORD(v64._object) = -4864;
    uint64_t v40 = v52;
    String.append(_:)(*(Swift::String *)(&v39 - 1));
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  if (v59 != 3)
  {
    strcpy((char *)&v64, ", type7:{");
    WORD1(v64._object) = 0;
    HIDWORD(v64._object) = -385875968;
    v41._uint64_t countAndFlagsBits = ALBtAdvInfoType7.description.getter();
    String.append(_:)(v41);
    swift_bridgeObjectRelease();
    v42._uint64_t countAndFlagsBits = 125;
    v42._object = (void *)0xE100000000000000;
    String.append(_:)(v42);
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  v64._uint64_t countAndFlagsBits = 0x7B20744223;
  v64._object = (void *)0xE500000000000000;
  String.append(_:)(v61);
  swift_bridgeObjectRelease();
  v43._uint64_t countAndFlagsBits = 125;
  v43._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  return v64._countAndFlagsBits;
}

uint64_t ALBtAdvInfoType7.description.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  int v3 = v0[2];
  int v4 = v0[3];
  int v5 = v0[4];
  int v6 = v0[5];
  uint64_t v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  if (v1 == 2)
  {
    if (v2 == 2) {
      goto LABEL_3;
    }
  }
  else
  {
    strcpy((char *)&v24, "sameAccount:");
    BYTE5(v24._object) = 0;
    HIWORD(v24._object) = -5120;
    if (v1) {
      uint64_t v9 = 1702195828;
    }
    else {
      uint64_t v9 = 0x65736C6166;
    }
    if (v1) {
      unint64_t v10 = 0xE400000000000000;
    }
    else {
      unint64_t v10 = 0xE500000000000000;
    }
    unint64_t v11 = v10;
    String.append(_:)(*(Swift::String *)&v9);
    swift_bridgeObjectRelease();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    if (v2 == 2)
    {
LABEL_3:
      if (v3 == 2) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  strcpy((char *)&v24, ",family:");
  BYTE1(v24._object) = 0;
  WORD1(v24._object) = 0;
  HIDWORD(v24._object) = -402653184;
  if (v2) {
    uint64_t v12 = 1702195828;
  }
  else {
    uint64_t v12 = 0x65736C6166;
  }
  if (v2) {
    unint64_t v13 = 0xE400000000000000;
  }
  else {
    unint64_t v13 = 0xE500000000000000;
  }
  unint64_t v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  if (v3 == 2)
  {
LABEL_4:
    if (v4 == 2) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_23:
  strcpy((char *)&v24, ",sharedHome:");
  BYTE5(v24._object) = 0;
  HIWORD(v24._object) = -5120;
  if (v3) {
    uint64_t v15 = 1702195828;
  }
  else {
    uint64_t v15 = 0x65736C6166;
  }
  if (v3) {
    unint64_t v16 = 0xE400000000000000;
  }
  else {
    unint64_t v16 = 0xE500000000000000;
  }
  unint64_t v17 = v16;
  String.append(_:)(*(Swift::String *)&v15);
  swift_bridgeObjectRelease();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  if (v4 == 2)
  {
LABEL_5:
    if (v5 == 2) {
      goto LABEL_6;
    }
LABEL_37:
    strcpy((char *)&v24, ",inCase:");
    BYTE1(v24._object) = 0;
    WORD1(v24._object) = 0;
    HIDWORD(v24._object) = -402653184;
    if (v5) {
      uint64_t v21 = 1702195828;
    }
    else {
      uint64_t v21 = 0x65736C6166;
    }
    if (v5) {
      unint64_t v22 = 0xE400000000000000;
    }
    else {
      unint64_t v22 = 0xE500000000000000;
    }
    unint64_t v23 = v22;
    String.append(_:)(*(Swift::String *)&v21);
    swift_bridgeObjectRelease();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    if (v6 != 8) {
      goto LABEL_7;
    }
    return v25;
  }
LABEL_30:
  v24._uint64_t countAndFlagsBits = 0x3A7466656C2CLL;
  v24._object = (void *)0xE600000000000000;
  if (v4) {
    uint64_t v18 = 1702195828;
  }
  else {
    uint64_t v18 = 0x65736C6166;
  }
  if (v4) {
    unint64_t v19 = 0xE400000000000000;
  }
  else {
    unint64_t v19 = 0xE500000000000000;
  }
  unint64_t v20 = v19;
  String.append(_:)(*(Swift::String *)&v18);
  swift_bridgeObjectRelease();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  if (v5 != 2) {
    goto LABEL_37;
  }
LABEL_6:
  if (v6 != 8)
  {
LABEL_7:
    strcpy((char *)&v24, ",placement:");
    HIDWORD(v24._object) = -352321536;
    v7._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
  }
  return v25;
}

double ALBtAdvertisement.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(_DWORD *)(a1 + 28) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(_DWORD *)(a1 + 36) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(_DWORD *)(a1 + 44) = 0;
  *(_WORD *)(a1 + 48) = 769;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 82) = 0;
  *(unsigned char *)(a1 + 84) = 1;
  *(_DWORD *)(a1 + 88) = 0;
  *(unsigned char *)(a1 + 92) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0xF000000000000000;
  *(_DWORD *)(a1 + 144) = 0;
  *(unsigned char *)(a1 + 148) = 1;
  *(_WORD *)(a1 + 153) = 0;
  *(_DWORD *)(a1 + 149) = 3;
  return result;
}

uint64_t variable initialization expression of ALBtAdvertisement._machContTimeNs()
{
  return 0;
}

void variable initialization expression of ALBtAdvertisement._type(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t variable initialization expression of ALBtAdvertisement._vendorID()
{
  return 0x10000;
}

uint64_t variable initialization expression of ALBtAdvertisement._productID()
{
  return 0x100000000;
}

uint64_t variable initialization expression of ALBtAdvertisement._identifier()
{
  return 0;
}

uint64_t variable initialization expression of ALBtAdvertisement._payload()
{
  return 0;
}

void variable initialization expression of ALBtAdvertisement._type7Info(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 4) = 0;
  *(_DWORD *)a1 = 3;
}

uint64_t ALBtAdvertisement._machContTimeNs.setter(uint64_t result, char a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._machContTimeNs.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._mac.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._mac.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._rssidB.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 28) = result;
  *(unsigned char *)(v1 + 32) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._rssidB.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._channel.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 36) = result;
  *(unsigned char *)(v1 + 40) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._channel.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALBtAdvertisement._antennaIndex.getter()
{
  return *(unsigned int *)(v0 + 44) | ((unint64_t)*(unsigned __int8 *)(v0 + 48) << 32);
}

uint64_t ALBtAdvertisement._antennaIndex.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 44) = result;
  *(unsigned char *)(v1 + 48) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._antennaIndex.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unsigned char *ALBtAdvertisement._type.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 49) = *result;
  return result;
}

uint64_t (*ALBtAdvertisement._type.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._deviceFlags.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 56) = result;
  *(unsigned char *)(v2 + 64) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._deviceFlags.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._discoveryFlags.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 72) = result;
  *(unsigned char *)(v2 + 80) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._discoveryFlags.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._vendorID.getter()
{
  return *(unsigned __int16 *)(v0 + 82) | (*(unsigned __int8 *)(v0 + 84) << 16);
}

uint64_t ALBtAdvertisement._vendorID.setter(uint64_t result)
{
  *(_WORD *)(v1 + 82) = result;
  *(unsigned char *)(v1 + 84) = BYTE2(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._vendorID.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALBtAdvertisement._productID.getter()
{
  return *(unsigned int *)(v0 + 88) | ((unint64_t)*(unsigned __int8 *)(v0 + 92) << 32);
}

uint64_t ALBtAdvertisement._productID.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 88) = result;
  *(unsigned char *)(v1 + 92) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._productID.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return result;
}

uint64_t (*ALBtAdvertisement._identifier.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._idsDeviceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*ALBtAdvertisement._idsDeviceID.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data?(*(void *)(v2 + 128), *(void *)(v2 + 136));
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*ALBtAdvertisement._payload.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALBtAdvertisement._deviceInfoKw.getter()
{
  return *(unsigned int *)(v0 + 144) | ((unint64_t)*(unsigned __int8 *)(v0 + 148) << 32);
}

uint64_t ALBtAdvertisement._deviceInfoKw.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 144) = result;
  *(unsigned char *)(v1 + 148) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._deviceInfoKw.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

void ALBtAdvertisement._type7Info.getter(uint64_t a1@<X8>)
{
  int v2 = *(_DWORD *)(v1 + 149);
  *(_WORD *)(a1 + 4) = *(_WORD *)(v1 + 153);
  *(_DWORD *)a1 = v2;
}

int *ALBtAdvertisement._type7Info.setter(int *result)
{
  int v2 = *result;
  *(_WORD *)(v1 + 153) = *((_WORD *)result + 2);
  *(_DWORD *)(v1 + 149) = v2;
  return result;
}

uint64_t (*ALBtAdvertisement._type7Info.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification.isApOn.getter()
{
  return *(unsigned __int8 *)(v0 + 57);
}

uint64_t ALBtNotification.isScreenOn.getter()
{
  return *(unsigned __int8 *)(v0 + 58);
}

uint64_t ALBtNotification.advertisements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ALBtNotification.description.getter()
{
  char v1 = v0[41];
  int v2 = v0[57];
  int v19 = v0[58];
  int v20 = v0[56];
  v3._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  if ((v1 & 1) == 0)
  {
    lazy protocol witness table accessor for type ALTimeStamp and conformance ALTimeStamp();
    v4._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    v5._uint64_t countAndFlagsBits = 0x3A656D69742CLL;
    v5._object = (void *)0xE600000000000000;
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
  }
  if (v2 != 2)
  {
    if (v2) {
      uint64_t v6 = 1702195828;
    }
    else {
      uint64_t v6 = 0x65736C6166;
    }
    if (v2) {
      unint64_t v7 = 0xE400000000000000;
    }
    else {
      unint64_t v7 = 0xE500000000000000;
    }
    unint64_t v8 = v7;
    String.append(_:)(*(Swift::String *)&v6);
    swift_bridgeObjectRelease();
    v9._uint64_t countAndFlagsBits = 0x3A6E4F70612CLL;
    v9._object = (void *)0xE600000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
  }
  if (v19 != 2)
  {
    if (v19) {
      uint64_t v10 = 1702195828;
    }
    else {
      uint64_t v10 = 0x65736C6166;
    }
    if (v19) {
      unint64_t v11 = 0xE400000000000000;
    }
    else {
      unint64_t v11 = 0xE500000000000000;
    }
    unint64_t v12 = v11;
    String.append(_:)(*(Swift::String *)&v10);
    swift_bridgeObjectRelease();
    v13._uint64_t countAndFlagsBits = 0x4F6E65657263732CLL;
    v13._object = (void *)0xEA00000000003A6ELL;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
  }
  if (v20 != 2)
  {
    if (v20) {
      uint64_t v14 = 1702195828;
    }
    else {
      uint64_t v14 = 0x65736C6166;
    }
    if (v20) {
      unint64_t v15 = 0xE400000000000000;
    }
    else {
      unint64_t v15 = 0xE500000000000000;
    }
    unint64_t v16 = v15;
    String.append(_:)(*(Swift::String *)&v14);
    swift_bridgeObjectRelease();
    v17._uint64_t countAndFlagsBits = 0x74616C756D69732CLL;
    v17._object = (void *)0xEB000000003A6465;
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
  }
  return 0x3A746E756F63;
}

void __swiftcall ALBtNotification.init()(ALDataTypes::ALBtNotification *__return_ptr retstr)
{
  *(_OWORD *)retstr->_timestamp.value.gap19 = 0u;
  *(_OWORD *)&retstr->_timestamp.value._cfAbsoluteTimeSec.value = 0u;
  *(_OWORD *)&retstr->_timestamp.value._machAbsoluteTimeSec.value = 0u;
  char v1 = (void *)MEMORY[0x263F8EE78];
  retstr->_timestamp.is_nil = 1;
  retstr->_advertisements._rawValue = v1;
  *(_WORD *)&retstr->_simulated.value = 514;
  retstr->_isScreenOn.value = 2;
}

double variable initialization expression of ALBtNotification._timestamp@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 25) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 41) = 1;
  return result;
}

uint64_t variable initialization expression of ALBtNotification._advertisements()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of ALBtNotification._simulated()
{
  return 2;
}

__n128 ALBtNotification._timestamp.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 41);
  __n128 result = *(__n128 *)a1;
  long long v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v1 = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 16) = v6;
  *(void *)(v1 + 32) = v2;
  *(unsigned char *)(v1 + 40) = v3;
  *(unsigned char *)(v1 + 41) = v4;
  return result;
}

uint64_t (*ALBtNotification._timestamp.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._advertisements.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*ALBtNotification._advertisements.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._simulated.getter()
{
  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t ALBtNotification._simulated.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 56) = result;
  return result;
}

uint64_t (*ALBtNotification._simulated.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._isApOn.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 57) = result;
  return result;
}

uint64_t (*ALBtNotification._isApOn.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._isScreenOn.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 58) = result;
  return result;
}

uint64_t (*ALBtNotification._isScreenOn.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotifications.results.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ALBtNotifications.isLastBatch.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

Swift::String __swiftcall ALBtNotifications.description()()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  strcpy((char *)v10, "results,count,");
  HIBYTE(v10[1]) = -18;
  v2._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 0x2C7473616C2CLL;
  v3._object = (void *)0xE600000000000000;
  String.append(_:)(v3);
  if (v1) {
    uint64_t v4 = 1702195828;
  }
  else {
    uint64_t v4 = 0x65736C6166;
  }
  if (v1) {
    unint64_t v5 = 0xE400000000000000;
  }
  else {
    unint64_t v5 = 0xE500000000000000;
  }
  unint64_t v6 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  uint64_t v7 = v10[0];
  unint64_t v8 = (void *)v10[1];
  result._object = v8;
  result._uint64_t countAndFlagsBits = v7;
  return result;
}

ALDataTypes::ALBtNotifications __swiftcall ALBtNotifications.init()()
{
  *(void *)uint64_t v0 = MEMORY[0x263F8EE78];
  *(unsigned char *)(v0 + 8) = 1;
  return result;
}

uint64_t variable initialization expression of ALBtNotifications._isLastBatch()
{
  return 1;
}

ALDataTypes::ALBtNotifications __swiftcall ALBtNotifications.init(results:isLastBatch:)(Swift::OpaquePointer results, Swift::Bool isLastBatch)
{
  *(Swift::OpaquePointer *)uint64_t v2 = results;
  *(unsigned char *)(v2 + 8) = isLastBatch;
  result._results = results;
  result._isLastBatch = isLastBatch;
  return result;
}

uint64_t ALBtNotifications._results.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v1 = a1;
  return result;
}

uint64_t (*ALBtNotifications._results.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotifications._isLastBatch.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 8) = result;
  return result;
}

uint64_t (*ALBtNotifications._isLastBatch.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

ALDataTypes::ALBtAdvInfoType7::Placement_optional __swiftcall ALBtAdvInfoType7.Placement.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 8;
  if ((unint64_t)rawValue < 8) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (ALDataTypes::ALBtAdvInfoType7::Placement_optional)rawValue;
}

uint64_t ALBtAdvInfoType7.Placement.rawValue.getter()
{
  return *v0;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

unint64_t lazy protocol witness table accessor for type ALTimeStamp and conformance ALTimeStamp()
{
  unint64_t result = lazy protocol witness table cache variable for type ALTimeStamp and conformance ALTimeStamp;
  if (!lazy protocol witness table cache variable for type ALTimeStamp and conformance ALTimeStamp)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALTimeStamp and conformance ALTimeStamp);
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ALBtAdvInfoType7.Placement(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ALBtAdvInfoType7.Placement()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ALBtAdvInfoType7.Placement()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ALBtAdvInfoType7.Placement()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

ALDataTypes::ALBtAdvInfoType7::Placement_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ALBtAdvInfoType7.Placement(Swift::Int *a1)
{
  return ALBtAdvInfoType7.Placement.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ALBtAdvInfoType7.Placement(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ALBtAdvInfoType7.isSameAccount.getter()
{
  return *v0;
}

uint64_t ALBtAdvInfoType7.isFamily.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ALBtAdvInfoType7.isSharedHome.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t ALBtAdvInfoType7.isCase.getter()
{
  return *(unsigned __int8 *)(v0 + 4);
}

ALDataTypes::ALBtAdvInfoType7 __swiftcall ALBtAdvInfoType7.init()()
{
  *(_DWORD *)uint64_t v0 = 33686018;
  *(_WORD *)(v0 + 4) = 2050;
  return result;
}

void variable initialization expression of ALBtAdvInfoType7._placement(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t ALBtAdvInfoType7._isSameAccount.getter()
{
  return *v0;
}

uint64_t ALBtAdvInfoType7._isSameAccount.setter(uint64_t result)
{
  *Swift::UInt v1 = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isSameAccount.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isFamily.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isFamily.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isSharedHome.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isSharedHome.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isLeftBud.getter()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t ALBtAdvInfoType7._isLeftBud.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isLeftBud.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isCase.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 4) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isCase.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

void ALBtAdvInfoType7._placement.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 5);
}

unsigned char *ALBtAdvInfoType7._placement.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 5) = *result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._placement.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t lazy protocol witness table accessor for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType()
{
  unint64_t result = lazy protocol witness table cache variable for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType;
  if (!lazy protocol witness table cache variable for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement()
{
  unint64_t result = lazy protocol witness table cache variable for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement;
  if (!lazy protocol witness table cache variable for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement);
  }
  return result;
}

uint64_t destroy for ALBtAdvertisement(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 136);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 128);
    return outlined consume of Data._Representation(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for ALBtAdvertisement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  int v4 = *(_DWORD *)(a2 + 44);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_DWORD *)(a1 + 44) = v4;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_WORD *)(a1 + 82) = *(_WORD *)(a2 + 82);
  *(unsigned char *)(a1 + 84) = *(unsigned char *)(a2 + 84);
  int v5 = *(_DWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(_DWORD *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  unint64_t v8 = (uint64_t *)(a2 + 128);
  unint64_t v9 = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)v8;
  }
  else
  {
    uint64_t v10 = *v8;
    outlined copy of Data._Representation(*v8, v9);
    *(void *)(a1 + 128) = v10;
    *(void *)(a1 + 136) = v9;
  }
  *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 148) = *(unsigned char *)(a2 + 148);
  *(_DWORD *)(a1 + 149) = *(_DWORD *)(a2 + 149);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  return a1;
}

uint64_t assignWithCopy for ALBtAdvertisement(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  LODWORD(v5) = *((_DWORD *)a2 + 7);
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  *(_DWORD *)(a1 + 28) = v5;
  LODWORD(v5) = *((_DWORD *)a2 + 9);
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(_DWORD *)(a1 + 36) = v5;
  LODWORD(v5) = *((_DWORD *)a2 + 11);
  *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
  *(_DWORD *)(a1 + 44) = v5;
  *(unsigned char *)(a1 + 49) = *((unsigned char *)a2 + 49);
  uint64_t v6 = a2[7];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = a2[9];
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(void *)(a1 + 72) = v7;
  LOWORD(v7) = *((_WORD *)a2 + 41);
  *(unsigned char *)(a1 + 84) = *((unsigned char *)a2 + 84);
  *(_WORD *)(a1 + 82) = v7;
  LODWORD(v7) = *((_DWORD *)a2 + 22);
  *(unsigned char *)(a1 + 92) = *((unsigned char *)a2 + 92);
  *(_DWORD *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = a2[12];
  *(void *)(a1 + 104) = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = a2[14];
  *(void *)(a1 + 120) = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v8 = a2 + 16;
  unint64_t v9 = a2[17];
  if (*(void *)(a1 + 136) >> 60 != 15)
  {
    if (v9 >> 60 != 15)
    {
      uint64_t v11 = *v8;
      outlined copy of Data._Representation(*v8, a2[17]);
      uint64_t v12 = *(void *)(a1 + 128);
      unint64_t v13 = *(void *)(a1 + 136);
      *(void *)(a1 + 128) = v11;
      *(void *)(a1 + 136) = v9;
      outlined consume of Data._Representation(v12, v13);
      goto LABEL_8;
    }
    outlined destroy of Data(a1 + 128);
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 128) = *(_OWORD *)v8;
    goto LABEL_8;
  }
  uint64_t v10 = *v8;
  outlined copy of Data._Representation(*v8, a2[17]);
  *(void *)(a1 + 128) = v10;
  *(void *)(a1 + 136) = v9;
LABEL_8:
  int v14 = *((_DWORD *)a2 + 36);
  *(unsigned char *)(a1 + 148) = *((unsigned char *)a2 + 148);
  *(_DWORD *)(a1 + 144) = v14;
  int v15 = *(_DWORD *)((char *)a2 + 149);
  *(_WORD *)(a1 + 153) = *(_WORD *)((char *)a2 + 153);
  *(_DWORD *)(a1 + 149) = v15;
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy155_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 139) = *(_OWORD *)(a2 + 139);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for ALBtAdvertisement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  int v4 = *(_DWORD *)(a2 + 44);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_DWORD *)(a1 + 44) = v4;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_WORD *)(a1 + 82) = *(_WORD *)(a2 + 82);
  *(unsigned char *)(a1 + 84) = *(unsigned char *)(a2 + 84);
  int v5 = *(_DWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(_DWORD *)(a1 + 88) = v5;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  swift_bridgeObjectRelease();
  long long v8 = (void *)(a2 + 128);
  unint64_t v9 = *(void *)(a1 + 136);
  if (v9 >> 60 != 15)
  {
    unint64_t v10 = *(void *)(a2 + 136);
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *(void *)(a1 + 128);
      *(void *)(a1 + 128) = *v8;
      *(void *)(a1 + 136) = v10;
      outlined consume of Data._Representation(v11, v9);
      goto LABEL_6;
    }
    outlined destroy of Data(a1 + 128);
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)v8;
LABEL_6:
  *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
  *(unsigned char *)(a1 + 148) = *(unsigned char *)(a2 + 148);
  *(_DWORD *)(a1 + 149) = *(_DWORD *)(a2 + 149);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALBtAdvertisement(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 155)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 104);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtAdvertisement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 154) = 0;
    *(_WORD *)(result + 152) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 155) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 155) = 0;
    }
    if (a2) {
      *(void *)(result + 104) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvertisement()
{
  return &type metadata for ALBtAdvertisement;
}

uint64_t getEnumTagSinglePayload for ALBtAdvertisement.BtType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ALBtAdvertisement.BtType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x246D49484);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvertisement.BtType()
{
  return &type metadata for ALBtAdvertisement.BtType;
}

uint64_t initializeBufferWithCopyOfBuffer for ALBtNotification(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for ALBtNotification(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ALBtNotification(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  long long v5 = a2[1];
  *(_OWORD *)(a1 + 26) = *(long long *)((char *)a2 + 26);
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(unsigned char *)(a1 + 57) = *((unsigned char *)a2 + 57);
  *(unsigned char *)(a1 + 58) = *((unsigned char *)a2 + 58);
  return a1;
}

__n128 __swift_memcpy59_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 43) = *(_OWORD *)(a2 + 43);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ALBtNotification(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALBtNotification(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 59)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtNotification(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 58) = 0;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 59) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 59) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtNotification()
{
  return &type metadata for ALBtNotification;
}

uint64_t assignWithCopy for ALBtNotifications(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for ALBtNotifications(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALBtNotifications(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtNotifications(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtNotifications()
{
  return &type metadata for ALBtNotifications;
}

uint64_t __swift_memcpy6_1(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ALBtAdvInfoType7(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && a1[6]) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *a1;
  if (v3 >= 2) {
    int v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v4 = -2;
  }
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtAdvInfoType7(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 6) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 6) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvInfoType7()
{
  return &type metadata for ALBtAdvInfoType7;
}

uint64_t getEnumTagSinglePayload for ALBtAdvInfoType7.Placement(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ALBtAdvInfoType7.Placement(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x246D49A1CLL);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvInfoType7.Placement()
{
  return &type metadata for ALBtAdvInfoType7.Placement;
}

float ALResultOptions.intervalSec.getter()
{
  float result = *(float *)(v0 + 8);
  if (*(unsigned char *)(v0 + 12)) {
    return 0.0;
  }
  return result;
}

uint64_t key path getter for ALResultOptions.intervalSec : ALResultOptions@<X0>(uint64_t result@<X0>, float *a2@<X8>)
{
  float v2 = *(float *)(result + 8);
  if (*(unsigned char *)(result + 12)) {
    float v2 = 0.0;
  }
  *a2 = v2;
  return result;
}

_DWORD *key path setter for ALResultOptions.intervalSec : ALResultOptions(_DWORD *result, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = *result;
  *(unsigned char *)(a2 + 12) = 0;
  return result;
}

void ALResultOptions.intervalSec.setter(float a1)
{
  *(float *)(v1 + 8) = a1;
  *(unsigned char *)(v1 + 12) = 0;
}

uint64_t *(*ALResultOptions.intervalSec.modify(uint64_t a1))(uint64_t *result)
{
  *(void *)a1 = v1;
  float v2 = *(float *)(v1 + 8);
  if (*(unsigned char *)(v1 + 12)) {
    float v2 = 0.0;
  }
  *(float *)(a1 + 8) = v2;
  return ALResultOptions.intervalSec.modify;
}

uint64_t *ALResultOptions.intervalSec.modify(uint64_t *result)
{
  uint64_t v1 = *result;
  *(_DWORD *)(v1 + 8) = *((_DWORD *)result + 2);
  *(unsigned char *)(v1 + 12) = 0;
  return result;
}

void ALResultOptions.init()(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 20) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
}

unint64_t ALResultOptions._maxBatchSize.getter()
{
  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t ALResultOptions._maxBatchSize.setter(uint64_t result)
{
  *(_DWORD *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALResultOptions._maxBatchSize.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALResultOptions._intervalSec.getter()
{
  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

uint64_t ALResultOptions._intervalSec.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 8) = result;
  *(unsigned char *)(v1 + 12) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALResultOptions._intervalSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALResultOptions._maxAgeSec.getter()
{
  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t ALResultOptions._maxAgeSec.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 16) = result;
  *(unsigned char *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALResultOptions._maxAgeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALResultOptions._startCfaTimeSec.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t ALResultOptions._startCfaTimeSec.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 24) = result;
  *(unsigned char *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*ALResultOptions._startCfaTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALResultOptions._endCfaTimeSec.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t ALResultOptions._endCfaTimeSec.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 40) = result;
  *(unsigned char *)(v2 + 48) = a2 & 1;
  return result;
}

uint64_t (*ALResultOptions._endCfaTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for ALResultOptions(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
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
  *(unsigned char *)(result + 49) = v3;
  return result;
}

ALDataTypes::ALWiFiScanSingleAccessPoint::Band_optional __swiftcall ALWiFiScanSingleAccessPoint.Band.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (ALDataTypes::ALWiFiScanSingleAccessPoint::Band_optional)rawValue;
}

uint64_t ALWiFiScanSingleAccessPoint.Band.rawValue.getter()
{
  return *v0;
}

ALDataTypes::ALWiFiScanSingleAccessPoint::Band_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ALWiFiScanSingleAccessPoint.Band(Swift::Int *a1)
{
  return ALWiFiScanSingleAccessPoint.Band.init(rawValue:)(*a1);
}

double ALWiFiScanSingleAccessPoint.machContTimeSec.getter()
{
  if ((*(unsigned char *)(v0 + 105) & 1) == 0 && (*(unsigned char *)(v0 + 104) & 1) == 0 && (*(unsigned char *)(v0 + 52) & 1) == 0) {
    return *(double *)(v0 + 96) - *(float *)(v0 + 48);
  }
  return result;
}

double ALWiFiScanSingleAccessPoint.cfAbsTimeSec.getter()
{
  if ((*(unsigned char *)(v0 + 105) & 1) == 0 && (*(void *)(v0 + 72) & 1) == 0 && (*(unsigned char *)(v0 + 52) & 1) == 0) {
    return *(double *)(v0 + 64) - *(float *)(v0 + 48);
  }
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint.description.getter()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 36);
  char v3 = *((unsigned char *)v0 + 44);
  int v4 = *((unsigned __int8 *)v0 + 52);
  int v5 = *((unsigned __int8 *)v0 + 55);
  uint64_t v27 = v0[9];
  int v28 = *((unsigned __int8 *)v0 + 104);
  char v6 = *((unsigned char *)v0 + 105);
  if (v0[1])
  {
    if (*((unsigned char *)v0 + 36)) {
      goto LABEL_3;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8E970];
    *(_OWORD *)(v7 + 16) = xmmword_246D4EC90;
    uint64_t v9 = MEMORY[0x263F8E9C0];
    *(void *)(v7 + 56) = v8;
    *(void *)(v7 + 64) = v9;
    *(void *)(v7 + 32) = v1;
    v10._uint64_t countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._uint64_t countAndFlagsBits = 979591533;
    v11._object = (void *)0xE400000000000000;
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      if (v5 == 4) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  v12._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._uint64_t countAndFlagsBits = 0x3A697373722CLL;
  v13._object = (void *)0xE600000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  if (v5 == 4)
  {
LABEL_4:
    if (v3) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  v14._uint64_t countAndFlagsBits = 0x3A646E61622CLL;
  v14._object = (void *)0xE600000000000000;
  String.append(_:)(v14);
  _print_unlocked<A, B>(_:_:)();
  v15._uint64_t countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  if (v3)
  {
LABEL_5:
    if (v4) {
      goto LABEL_6;
    }
LABEL_12:
    v18._uint64_t countAndFlagsBits = 0x3A6365536567612CLL;
    v18._object = (void *)0xE800000000000000;
    String.append(_:)(v18);
    Float.write<A>(to:)();
    v19._uint64_t countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
LABEL_11:
  v16._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 0x6C656E6E6168632CLL;
  v17._object = (void *)0xE90000000000003ALL;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  if (v6) {
    goto LABEL_17;
  }
LABEL_13:
  if (((v27 | v4) & 1) == 0)
  {
    v20._uint64_t countAndFlagsBits = 0x3A6166632CLL;
    v20._object = (void *)0xE500000000000000;
    String.append(_:)(v20);
    Double.write<A>(to:)();
    v21._uint64_t countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
  }
  if (((v28 | v4) & 1) == 0)
  {
    v22._uint64_t countAndFlagsBits = 0x3A74636D2CLL;
    v22._object = (void *)0xE500000000000000;
    String.append(_:)(v22);
    Double.write<A>(to:)();
    v23._uint64_t countAndFlagsBits = 0;
    v23._object = (void *)0xE000000000000000;
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
  }
LABEL_17:
  v24._uint64_t countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._uint64_t countAndFlagsBits = 125;
  v25._object = (void *)0xE100000000000000;
  String.append(_:)(v25);
  return 0x7B2069466957;
}

void variable initialization expression of ALWiFiScanSingleAccessPoint._mode(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t (*ALWiFiScanSingleAccessPoint._mac.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._ssid.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._ssid.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiScanSingleAccessPoint._rssidB.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unsigned char *ALWiFiScanSingleAccessPoint._mode.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 37) = *result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._mode.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiScanSingleAccessPoint._channel.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiScanSingleAccessPoint._ageSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._isAph.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 53) = result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._isAph.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._isMoving.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 54) = result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._isMoving.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiScanSingleAccessPoint._band.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._frequencyKhz.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 56) = result;
  *(unsigned char *)(v1 + 60) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._frequencyKhz.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

__n128 ALWiFiScanSingleAccessPoint._scanTimestamp.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 96);
  char v3 = *(unsigned char *)(v1 + 104);
  char v4 = *(unsigned char *)(v1 + 105);
  __n128 result = *(__n128 *)(v1 + 64);
  long long v6 = *(_OWORD *)(v1 + 80);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v2;
  *(unsigned char *)(a1 + 40) = v3;
  *(unsigned char *)(a1 + 41) = v4;
  return result;
}

Swift::Bool __swiftcall ALWiFiScanResult.isOlderThan(timestamp:)(Swift::Double timestamp)
{
  if (*(unsigned char *)(v1 + 41)) {
    return 1;
  }
  else {
    return *(unsigned char *)(v1 + 40) & 1 | (*(double *)(v1 + 32) < timestamp);
  }
}

uint64_t ALWiFiScanResult._accessPoints.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

BOOL static ALWiFiNotification.NotiType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ALWiFiNotification.NotiType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

void ALWiFiNotification.scanType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 121);
}

uint64_t ALWiFiNotification.power.getter()
{
  return *(unsigned __int8 *)(v0 + 122);
}

uint64_t ALWiFiNotification.isInvoluntaryLinkDown.getter()
{
  return *(unsigned __int8 *)(v0 + 126);
}

void variable initialization expression of ALWiFiNotification._type(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

double variable initialization expression of ALWiFiNotification._scanResult@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t (*ALWiFiNotification._type.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiNotification._timestamp.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiNotification._scanResult.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiNotification._associatedMac.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unsigned char *ALWiFiNotification._scanType.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 121) = *result;
  return result;
}

uint64_t (*ALWiFiNotification._scanType.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._power.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 122) = result;
  return result;
}

uint64_t (*ALWiFiNotification._power.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiNotification._simulated.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALWiFiNotification._available.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._isApAwake.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 125) = result;
  return result;
}

uint64_t (*ALWiFiNotification._isApAwake.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._isInvoluntaryLinkDown.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 126) = result;
  return result;
}

uint64_t (*ALWiFiNotification._isInvoluntaryLinkDown.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotifications.description.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "results,count,");
  HIBYTE(v8[1]) = -18;
  v2._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 0x2C7473616C2CLL;
  v3._object = (void *)0xE600000000000000;
  String.append(_:)(v3);
  if (v1) {
    uint64_t v4 = 1702195828;
  }
  else {
    uint64_t v4 = 0x65736C6166;
  }
  if (v1) {
    unint64_t v5 = 0xE400000000000000;
  }
  else {
    unint64_t v5 = 0xE500000000000000;
  }
  unint64_t v6 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  return v8[0];
}

uint64_t ALWiFiNotifications._results.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *int v1 = a1;
  return result;
}

uint64_t (*ALWiFiNotifications._isLastBatch.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t lazy protocol witness table accessor for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode()
{
  unint64_t result = lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode;
  if (!lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band()
{
  unint64_t result = lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band;
  if (!lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType()
{
  unint64_t result = lazy protocol witness table cache variable for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType;
  if (!lazy protocol witness table cache variable for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType()
{
  unint64_t result = lazy protocol witness table cache variable for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType;
  if (!lazy protocol witness table cache variable for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType);
  }
  return result;
}

uint64_t assignWithCopy for ALWiFiScanSingleAccessPoint(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v5 = *((_DWORD *)a2 + 8);
  *(unsigned char *)(a1 + 36) = *((unsigned char *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 37) = *((unsigned char *)a2 + 37);
  int v6 = *((_DWORD *)a2 + 10);
  *(unsigned char *)(a1 + 44) = *((unsigned char *)a2 + 44);
  *(_DWORD *)(a1 + 40) = v6;
  int v7 = *((_DWORD *)a2 + 12);
  *(unsigned char *)(a1 + 52) = *((unsigned char *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 53) = *((unsigned char *)a2 + 53);
  *(unsigned char *)(a1 + 54) = *((unsigned char *)a2 + 54);
  *(unsigned char *)(a1 + 55) = *((unsigned char *)a2 + 55);
  int v8 = *((_DWORD *)a2 + 14);
  *(unsigned char *)(a1 + 60) = *((unsigned char *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v8;
  long long v9 = *((_OWORD *)a2 + 4);
  long long v10 = *((_OWORD *)a2 + 5);
  *(_OWORD *)(a1 + 90) = *(_OWORD *)((char *)a2 + 90);
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 80) = v10;
  return a1;
}

uint64_t assignWithTake for ALWiFiScanSingleAccessPoint(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_WORD *)(a1 + 36) = *(_WORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
  *(_OWORD *)(a1 + 90) = *(_OWORD *)(a2 + 90);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for ALWiFiScanSingleAccessPoint(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 106)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiScanSingleAccessPoint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 104) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 106) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 106) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

uint64_t assignWithCopy for ALWiFiScanResult(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  long long v4 = a2[1];
  *(_OWORD *)(a1 + 26) = *(long long *)((char *)a2 + 26);
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ALWiFiScanResult(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithCopy for ALWiFiNotification(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  long long v4 = *(_OWORD *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 34) = *(_OWORD *)(a2 + 34);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  long long v6 = *(_OWORD *)(a2 + 56);
  long long v7 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
  *(_OWORD *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 56) = v6;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v8;
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  *(unsigned char *)(a1 + 122) = *(unsigned char *)(a2 + 122);
  *(unsigned char *)(a1 + 123) = *(unsigned char *)(a2 + 123);
  *(unsigned char *)(a1 + 124) = *(unsigned char *)(a2 + 124);
  *(unsigned char *)(a1 + 125) = *(unsigned char *)(a2 + 125);
  *(unsigned char *)(a1 + 126) = *(unsigned char *)(a2 + 126);
  return a1;
}

uint64_t assignWithTake for ALWiFiNotification(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 34) = *(_OWORD *)(a2 + 34);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(_DWORD *)(a1 + 121) = *(_DWORD *)(a2 + 121);
  *(_WORD *)(a1 + 125) = *(_WORD *)(a2 + 125);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALWiFiNotification(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 127)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 104);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiNotification(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 126) = 0;
    *(_WORD *)(result + 124) = 0;
    *(_DWORD *)(result + 120) = 0;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 127) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 127) = 0;
    }
    if (a2) {
      *(void *)(result + 104) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiNotification.ScanType()
{
  return &type metadata for ALWiFiNotification.ScanType;
}

uint64_t (*ALTimeStamp._cfAbsoluteTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALTimeStamp._machAbsoluteTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t (*ALTimeStamp._machContinuousTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

void __swiftcall ALTimeStamp.init(cfAbsoluteTimeSec:)(ALDataTypes::ALTimeStamp *__return_ptr retstr, Swift::Double cfAbsoluteTimeSec)
{
  type metadata accessor for TimesSync();
  static TimesSync.instance.getter();
  dispatch thunk of TimesSync.cfaMinusMctSec.getter();
  double v5 = v4;
  swift_release();
  Swift::Double v6 = cfAbsoluteTimeSec - v5;
  static TimesSync.instance.getter();
  uint64_t v7 = dispatch thunk of TimesSync.mctMinusMatNs.getter();
  swift_release();
  double v8 = NsToSec.getter();
  retstr->_cfAbsoluteTimeSec.value = cfAbsoluteTimeSec;
  retstr->_cfAbsoluteTimeSec.is_nil = 0;
  retstr->_machAbsoluteTimeSec.value = v6 - v8 * (double)(unint64_t)v7;
  retstr->_machAbsoluteTimeSec.is_nil = 0;
  retstr->_machContinuousTimeSec.value = v6;
  retstr->_machContinuousTimeSec.is_nil = 0;
}

uint64_t ALTimeStamp.description.getter()
{
  double v1 = *(double *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  double v3 = *(double *)(v0 + 16);
  int v4 = *(unsigned __int8 *)(v0 + 24);
  double v5 = *(double *)(v0 + 32);
  int v6 = *(unsigned __int8 *)(v0 + 40);
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_246D4EC90;
  uint64_t v8 = MEMORY[0x263F8D538];
  uint64_t v9 = MEMORY[0x263F8D5B8];
  *(void *)(v7 + 56) = MEMORY[0x263F8D538];
  *(void *)(v7 + 64) = v9;
  if (v2) {
    double v10 = -1.0;
  }
  else {
    double v10 = v1;
  }
  *(double *)(v7 + 32) = v10;
  v11._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = 0x2074616D202CLL;
  v12._object = (void *)0xE600000000000000;
  String.append(_:)(v12);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_246D4EC90;
  *(void *)(v13 + 56) = v8;
  *(void *)(v13 + 64) = v9;
  if (v4) {
    double v14 = -1.0;
  }
  else {
    double v14 = v3;
  }
  *(double *)(v13 + 32) = v14;
  v15._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._uint64_t countAndFlagsBits = 0x2074636D202CLL;
  v16._object = (void *)0xE600000000000000;
  String.append(_:)(v16);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_246D4EC90;
  *(void *)(v17 + 56) = v8;
  *(void *)(v17 + 64) = v9;
  if (v6) {
    double v18 = -1.0;
  }
  else {
    double v18 = v5;
  }
  *(double *)(v17 + 32) = v18;
  v19._uint64_t countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  return 543254115;
}

Swift::String __swiftcall prettyFunctionName(_:_:)(Swift::String a1, Swift::String a2)
{
  object = a2._object;
  uint64_t countAndFlagsBits = a2._countAndFlagsBits;
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v4 = StringProtocol.components<A>(separatedBy:)();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v4 + 16 * v5;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v7 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v9._uint64_t countAndFlagsBits = 35;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v10._uint64_t countAndFlagsBits = countAndFlagsBits;
    v10._object = object;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    uint64_t countAndFlagsBits = v8;
    object = v7;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  uint64_t v11 = countAndFlagsBits;
  Swift::String v12 = object;
  result._object = v12;
  result._uint64_t countAndFlagsBits = v11;
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t Logger._fault(_:function:file:line:)(uint64_t (*a1)(void), void *a2, unint64_t a3, uint64_t a4, char a5, unint64_t a6, uint64_t a7, char a8)
{
  uint64_t result = a1();
  uint64_t v15 = result;
  unint64_t v17 = v16;
  if (a8)
  {
    unint64_t v14 = HIDWORD(a6);
    if (!HIDWORD(a6))
    {
      if (a6 >> 11 == 27)
      {
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      LODWORD(v14) = WORD1(a6);
      if (WORD1(a6) <= 0x10u)
      {
        if ((a6 & 0xFFFFFF80) == 0)
        {
          if (a6 > 0xFF)
          {
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
          unsigned int v18 = (a6 + 1);
          goto LABEL_10;
        }
LABEL_28:
        int v30 = (a6 & 0x3F) << 8;
        unsigned int v31 = (v30 | (a6 >> 6)) + 33217;
        unsigned int v32 = (v30 | (a6 >> 6) & 0x3F) << 8;
        unsigned int v33 = (((v32 | (a6 >> 12) & 0x3F) << 8) | (a6 >> 18)) - 2122219023;
        unsigned int v34 = (v32 | (a6 >> 12)) + 8487393;
        if (v14) {
          unsigned int v18 = v33;
        }
        else {
          unsigned int v18 = v34;
        }
        if (a6 < 0x800) {
          unsigned int v18 = v31;
        }
LABEL_10:
        uint64_t v40 = (v18 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v18) >> 3)) & 7)));
        goto LABEL_11;
      }
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (!a6)
  {
    __break(1u);
    goto LABEL_26;
  }
LABEL_11:
  uint64_t result = static String._fromUTF8Repairing(_:)();
  a6 = result;
  a2 = v19;
  if ((a5 & 1) == 0)
  {
    if (a3) {
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  unint64_t v14 = HIDWORD(a3);
  if (HIDWORD(a3))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (a3 >> 11 == 27)
  {
LABEL_46:
    __break(1u);
    return result;
  }
  LODWORD(v14) = WORD1(a3);
  if (WORD1(a3) > 0x10u)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    int v35 = (a3 & 0x3F) << 8;
    unsigned int v36 = (v35 | (a3 >> 6)) + 33217;
    unsigned int v37 = (v35 | (a3 >> 6) & 0x3F) << 8;
    unsigned int v38 = (((v37 | (a3 >> 12) & 0x3F) << 8) | (a3 >> 18)) - 2122219023;
    unsigned int v39 = (v37 | (a3 >> 12)) + 8487393;
    if (v14) {
      unsigned int v20 = v38;
    }
    else {
      unsigned int v20 = v39;
    }
    if (a3 < 0x800) {
      unsigned int v20 = v36;
    }
    goto LABEL_20;
  }
  if ((a3 & 0xFFFFFF80) != 0) {
    goto LABEL_38;
  }
  if (a3 > 0xFF)
  {
    __break(1u);
    goto LABEL_45;
  }
  unsigned int v20 = (a3 + 1);
LABEL_20:
  uint64_t v40 = (v20 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v20) >> 3)) & 7)));
LABEL_21:
  v21._uint64_t countAndFlagsBits = static String._fromUTF8Repairing(_:)();
  Swift::String v23 = v22;
  v24._uint64_t countAndFlagsBits = a6;
  v24._object = a2;
  v21._object = v23;
  Swift::String v25 = prettyFunctionName(_:_:)(v24, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v26 = static os_log_type_t.fault.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v27 = Logger.logObject.getter();
  if (os_log_type_enabled(v27, v26))
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v40 = v29;
    *(_DWORD *)uint64_t v28 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25._countAndFlagsBits, (unint64_t)v25._object, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D43000, v27, v26, "fault,func,%s,message,%s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C548760](v29, -1, -1);
    MEMORY[0x24C548760](v28, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  reportBug(type:subType:subTypeContext:fatalCallback:)(0x746C756166, 0xE500000000000000, v25._countAndFlagsBits, (unint64_t)v25._object, 0, 0, 0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t Logger._fatal(_:function:file:line:)(uint64_t (*a1)(void), void *a2, unint64_t a3, uint64_t a4, char a5, unint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  uint64_t v46 = a1();
  if (a8)
  {
    unint64_t v18 = HIDWORD(a6);
    if (HIDWORD(a6)) {
      goto LABEL_21;
    }
    if (a6 >> 11 != 27)
    {
      LODWORD(v18) = WORD1(a6);
      if (WORD1(a6) > 0x10u) {
        goto LABEL_22;
      }
      if ((a6 & 0xFFFFFF80) != 0) {
        goto LABEL_24;
      }
      if (a6 <= 0xFF)
      {
        Swift::String v9 = v17;
        unsigned int v19 = (a6 + 1);
        goto LABEL_10;
      }
      __break(1u);
LABEL_31:
      __break(1u);
    }
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_43;
  }
  if (!a6) {
    goto LABEL_20;
  }
  Swift::String v9 = v17;
  while (1)
  {
    uint64_t v10 = static String._fromUTF8Repairing(_:)();
    a2 = v17;
    if ((a5 & 1) == 0)
    {
      if (a3) {
        goto LABEL_43;
      }
      __break(1u);
    }
    unint64_t v18 = HIDWORD(a3);
    if (HIDWORD(a3)) {
      goto LABEL_23;
    }
    if (a3 >> 11 == 27) {
      goto LABEL_33;
    }
    LODWORD(v18) = WORD1(a3);
    if (WORD1(a3) > 0x10u) {
      goto LABEL_31;
    }
    if ((a3 & 0xFFFFFF80) != 0) {
      break;
    }
    if (a3 <= 0xFF)
    {
      unsigned int v30 = (a3 + 1);
      goto LABEL_42;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    Swift::String v9 = v17;
    int v20 = (a6 & 0x3F) << 8;
    unsigned int v21 = (v20 | (a6 >> 6)) + 33217;
    unsigned int v22 = (v20 | (a6 >> 6) & 0x3F) << 8;
    unsigned int v23 = (((v22 | (a6 >> 12) & 0x3F) << 8) | (a6 >> 18)) - 2122219023;
    unsigned int v24 = (v22 | (a6 >> 12)) + 8487393;
    if (v18) {
      unsigned int v19 = v23;
    }
    else {
      unsigned int v19 = v24;
    }
    if (a6 < 0x800) {
      unsigned int v19 = v21;
    }
LABEL_10:
    uint64_t v47 = (v19 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v19) >> 3)) & 7)));
  }
  int v25 = (a3 & 0x3F) << 8;
  unsigned int v26 = (v25 | (a3 >> 6)) + 33217;
  unsigned int v27 = (v25 | (a3 >> 6) & 0x3F) << 8;
  unsigned int v28 = (((v27 | (a3 >> 12) & 0x3F) << 8) | (a3 >> 18)) - 2122219023;
  unsigned int v29 = (v27 | (a3 >> 12)) + 8487393;
  if (v18) {
    unsigned int v30 = v28;
  }
  else {
    unsigned int v30 = v29;
  }
  if (a3 < 0x800) {
    unsigned int v30 = v26;
  }
LABEL_42:
  uint64_t v47 = (v30 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v30) >> 3)) & 7)));
LABEL_43:
  v31._uint64_t countAndFlagsBits = static String._fromUTF8Repairing(_:)();
  unsigned int v33 = v32;
  v34._uint64_t countAndFlagsBits = v10;
  v34._object = a2;
  v31._object = v33;
  Swift::String v35 = prettyFunctionName(_:_:)(v34, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v33) = static os_log_type_t.error.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unsigned int v36 = Logger.logObject.getter();
  os_log_type_t type = v33;
  if (os_log_type_enabled(v36, (os_log_type_t)v33))
  {
    uint64_t v37 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v47 = v44;
    *(_DWORD *)uint64_t v37 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35._countAndFlagsBits, (unint64_t)v35._object, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, (unint64_t)v9, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246D43000, v36, type, "fatal,func,%s,message,%s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C548760](v44, -1, -1);
    MEMORY[0x24C548760](v37, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v46;
  *(void *)(v38 + 24) = v9;
  *(void *)(v38 + 32) = a6;
  *(void *)(v38 + 40) = a7;
  *(unsigned char *)(v38 + 48) = a8;
  *(void *)(v38 + 56) = a9;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  reportBug(type:subType:subTypeContext:fatalCallback:)(0x6C61746166, 0xE500000000000000, v35._countAndFlagsBits, (unint64_t)v35._object, v46, v9, (void (*)(void))partial apply for closure #1 in Logger._fatal(_:function:file:line:), v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_msgSend(self, sel_sleepForTimeInterval_, 10.0);
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  v39._object = (void *)0x8000000246D4F6A0;
  v39._uint64_t countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v39);
  Double.write<A>(to:)();
  uint64_t v40 = v47;
  Swift::String v41 = (void *)v48;
  uint64_t v47 = v46;
  unint64_t v48 = (unint64_t)v9;
  swift_bridgeObjectRetain();
  v42._uint64_t countAndFlagsBits = v40;
  v42._object = v41;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *ALLogger.subsystem.unsafeMutableAddressor()
{
  return &static ALLogger.subsystem;
}

unint64_t static ALLogger.subsystem.getter()
{
  return 0xD000000000000013;
}

uint64_t one-time initialization function for core(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.core);
}

uint64_t ALLogger.core.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for core, (uint64_t)static ALLogger.core);
}

uint64_t static ALLogger.core.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for core, (uint64_t)static ALLogger.core, a1);
}

uint64_t one-time initialization function for util(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.util);
}

uint64_t ALLogger.util.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for util, (uint64_t)static ALLogger.util);
}

uint64_t static ALLogger.util.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for util, (uint64_t)static ALLogger.util, a1);
}

uint64_t one-time initialization function for xpc(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.xpc);
}

uint64_t ALLogger.xpc.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for xpc, (uint64_t)static ALLogger.xpc);
}

uint64_t static ALLogger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for xpc, (uint64_t)static ALLogger.xpc, a1);
}

uint64_t one-time initialization function for rpc(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.rpc);
}

uint64_t one-time initialization function for core(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t ALLogger.rpc.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for rpc, (uint64_t)static ALLogger.rpc);
}

uint64_t static ALLogger.rpc.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for rpc, (uint64_t)static ALLogger.rpc, a1);
}

uint64_t static ALLogger.core.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t ALLogger.deinit()
{
  return v0;
}

uint64_t ALLogger.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t ALLogger.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t one-time initialization function for corelog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, corelog, &one-time initialization token for core, (uint64_t)static ALLogger.core);
}

uint64_t corelog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for corelog, (uint64_t)corelog);
}

uint64_t corelog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for corelog, (uint64_t)corelog, a1);
}

uint64_t one-time initialization function for allog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, allog, &one-time initialization token for core, (uint64_t)static ALLogger.core);
}

uint64_t allog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for allog, (uint64_t)allog);
}

uint64_t allog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for allog, (uint64_t)allog, a1);
}

uint64_t one-time initialization function for rpclog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, rpclog, &one-time initialization token for rpc, (uint64_t)static ALLogger.rpc);
}

uint64_t rpclog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for rpclog, (uint64_t)rpclog);
}

uint64_t rpclog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for rpclog, (uint64_t)rpclog, a1);
}

uint64_t one-time initialization function for utillog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, utillog, &one-time initialization token for util, (uint64_t)static ALLogger.util);
}

uint64_t utillog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for utillog, (uint64_t)utillog);
}

uint64_t utillog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for utillog, (uint64_t)utillog, a1);
}

uint64_t one-time initialization function for xpclog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, xpclog, &one-time initialization token for xpc, (uint64_t)static ALLogger.xpc);
}

uint64_t one-time initialization function for corelog(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v7, a2);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v7, a4);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v10(v8, v9, v7);
}

uint64_t xpclog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for xpclog, (uint64_t)xpclog);
}

uint64_t ALLogger.core.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t xpclog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for xpclog, (uint64_t)xpclog, a1);
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_246D4C914()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void partial apply for closure #1 in Logger._fatal(_:function:file:line:)()
{
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for ALLogger()
{
  return self;
}

uint64_t method lookup function for ALLogger(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ALLogger);
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void reportBug(type:subType:subTypeContext:fatalCallback:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, void *a6, void (*a7)(void), uint64_t a8)
{
  uint64_t v67 = a8;
  uint64_t v15 = type metadata accessor for Logger();
  unint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v63 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v68 = (char *)&v58 - v19;
  id v71 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AA8]), sel_init);
  Class v70 = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F7C078]), sel_init);
  int v20 = (void *)MEMORY[0x24C548260](0xD000000000000010, 0x8000000246D4F920);
  uint64_t v60 = a1;
  unint64_t v64 = a2;
  unsigned int v21 = (void *)MEMORY[0x24C548260](a1, a2);
  uint64_t v61 = a3;
  unint64_t v65 = a4;
  unsigned int v22 = (void *)MEMORY[0x24C548260](a3, a4);
  uint64_t v69 = v15;
  unint64_t v66 = (unint64_t)a6;
  uint64_t v62 = a5;
  if (a6) {
    a6 = (void *)MEMORY[0x24C548260](a5, a6);
  }
  id v23 = objc_msgSend(v71, sel_processName);
  if (!v23)
  {
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v23 = (id)MEMORY[0x24C548260](v24);
    swift_bridgeObjectRelease();
  }
  id v25 = [(objc_class *)v70 signatureWithDomain:v20 type:v21 subType:v22 subtypeContext:a6 detectedProcess:v23 triggerThresholdValues:0];

  if (!v25)
  {
    uint64_t v42 = utillog.unsafeMutableAddressor();
    Swift::String v43 = v63;
    uint64_t v44 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v63, v42, v69);
    Swift::String v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = a7;
      unint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v48 = 0;
      _os_log_impl(&dword_246D43000, v45, v46, "reportBugBlocking,signature,nil", v48, 2u);
      int v49 = v48;
      a7 = v47;
      MEMORY[0x24C548760](v49, -1, -1);
    }

    uint64_t v50 = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v43, v44);
    if (a7) {
      a7(v50);
    }
    goto LABEL_24;
  }
  if (a7) {
    double v26 = 0.0;
  }
  else {
    double v26 = 6.0;
  }
  uint64_t v27 = utillog.unsafeMutableAddressor();
  unint64_t v28 = v16;
  unsigned int v29 = v68;
  uint64_t v30 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v68, v27, v69);
  unint64_t v31 = v66;
  swift_bridgeObjectRetain_n();
  unint64_t v32 = v64;
  swift_bridgeObjectRetain_n();
  unint64_t v33 = v65;
  swift_bridgeObjectRetain_n();
  Swift::String v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  LODWORD(v63) = v35;
  BOOL v36 = os_log_type_enabled(v34, v35);
  int v59 = a7;
  if (v36)
  {
    uint64_t v37 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    aBlock[0] = v58;
    *(_DWORD *)uint64_t v37 = 136315906;
    swift_bridgeObjectRetain();
    uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v32, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    unint64_t v64 = v28;
    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v33, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 22) = 2080;
    if (v31) {
      uint64_t v38 = v62;
    }
    else {
      uint64_t v38 = 45;
    }
    id v39 = v25;
    if (v31) {
      unint64_t v40 = v31;
    }
    else {
      unint64_t v40 = 0xE100000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v40, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    id v25 = v39;
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 32) = 2048;
    uint64_t v72 = *(void *)&v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246D43000, v34, (os_log_type_t)v63, "reportBug,type:%s,subtype:%s,context:%s,delay:%f", (uint8_t *)v37, 0x2Au);
    uint64_t v41 = v58;
    swift_arrayDestroy();
    MEMORY[0x24C548760](v41, -1, -1);
    MEMORY[0x24C548760](v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v68, v69);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  }
  aBlock[0] = 0;
  id v51 = v25;
  static Dictionary._forceBridgeFromObjectiveC(_:result:)();
  if (aBlock[0])
  {

    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v53 = swift_allocObject();
    uint64_t v54 = (uint64_t)v59;
    uint64_t v55 = v67;
    *(void *)(v53 + 16) = v59;
    *(void *)(v53 + 24) = v55;
    aBlock[4] = (uint64_t)partial apply for closure #1 in reportBug(type:subType:subTypeContext:fatalCallback:);
    aBlock[5] = v53;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?) -> ();
    aBlock[3] = (uint64_t)&block_descriptor;
    int v56 = _Block_copy(aBlock);
    outlined copy of (@escaping @callee_guaranteed () -> ())?(v54);
    swift_release();
    Class v57 = v70;
    [(objc_class *)v70 snapshotWithSignature:isa delay:0 events:0 payload:0 actions:v56 reply:v26];
    _Block_release(v56);

    Class v70 = isa;
    id v71 = v51;
LABEL_24:

    return;
  }
  __break(1u);
}

uint64_t logginResponse(_:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  int64_t v9 = (char *)&v42 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v42 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v42 - v13;
  if (a1)
  {
    id v45 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v46 = v15;
    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    if (*(void *)(a1 + 16) && (unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v47), (v17 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v48);
    }
    else
    {
      long long v48 = 0u;
      long long v49 = 0u;
    }
    outlined destroy of AnyHashable((uint64_t)v47);
    if (*((void *)&v49 + 1))
    {
      type metadata accessor for NSNumber();
      if (swift_dynamicCast())
      {
        id v18 = v45;
        if (objc_msgSend(v45, sel_BOOLValue))
        {
          swift_bridgeObjectRelease();
          uint64_t v19 = utillog.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v14, v19, v2);
          int v20 = Logger.logObject.getter();
          os_log_type_t v21 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v20, v21))
          {
            unsigned int v22 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unsigned int v22 = 0;
            _os_log_impl(&dword_246D43000, v20, v21, "reportBug,successful", v22, 2u);
            MEMORY[0x24C548760](v22, -1, -1);
          }

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v14, v2);
        }
        uint64_t v32 = utillog.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v32, v2);
        swift_bridgeObjectRetain();
        unint64_t v33 = Logger.logObject.getter();
        int v34 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v33, (os_log_type_t)v34))
        {

          swift_bridgeObjectRelease_n();
LABEL_33:

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v12, v2);
        }
        int v43 = v34;
        os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v42 = swift_slowAlloc();
        uint64_t v44 = v42;
        *(_DWORD *)os_log_type_t v35 = 136315138;
        id v45 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v46 = v36;
        AnyHashable.init<A>(_:)();
        if (*(void *)(a1 + 16)
          && (unint64_t v37 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v47), (v38 & 1) != 0))
        {
          outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v37, (uint64_t)&v48);
        }
        else
        {
          long long v48 = 0u;
          long long v49 = 0u;
        }
        outlined destroy of AnyHashable((uint64_t)v47);
        if (*((void *)&v49 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v39 = (uint64_t)v45;
            unint64_t v40 = v46;
LABEL_32:
            v47[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, &v44);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_246D43000, v33, (os_log_type_t)v43, "reportBug,failed,reason,%s ", v35, 0xCu);
            uint64_t v41 = v42;
            swift_arrayDestroy();
            MEMORY[0x24C548760](v41, -1, -1);
            MEMORY[0x24C548760](v35, -1, -1);

            goto LABEL_33;
          }
        }
        else
        {
          outlined destroy of Any?((uint64_t)&v48);
        }
        unint64_t v40 = 0xE700000000000000;
        uint64_t v39 = 0x6E776F6E6B6E75;
        goto LABEL_32;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      outlined destroy of Any?((uint64_t)&v48);
    }
    uint64_t v28 = utillog.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v28, v2);
    unsigned int v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v31 = 0;
      _os_log_impl(&dword_246D43000, v29, v30, "reportBug,response,malformed", v31, 2u);
      MEMORY[0x24C548760](v31, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  else
  {
    uint64_t v24 = utillog.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v24, v2);
    id v25 = Logger.logObject.getter();
    uint64_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, (os_log_type_t)v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_246D43000, v25, (os_log_type_t)v26, "reportBug,response,nil", v27, 2u);
      MEMORY[0x24C548760](v27, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_246D4D860()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in reportBug(type:subType:subTypeContext:fatalCallback:)(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v1 + 16);
  uint64_t result = logginResponse(_:)(a1);
  if (v2) {
    return v2(result);
  }
  return result;
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

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C548380](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int *NsInUs.unsafeMutableAddressor()
{
  return &NsInUs;
}

uint64_t NsInUs.getter()
{
  return 1000;
}

Swift::Int *NsInMs.unsafeMutableAddressor()
{
  return &NsInMs;
}

uint64_t NsInMs.getter()
{
  return 1000000;
}

Swift::Int *NsInSec.unsafeMutableAddressor()
{
  return &NsInSec;
}

uint64_t NsInSec.getter()
{
  return 1000000000;
}

Swift::Int *UsInMs.unsafeMutableAddressor()
{
  return &UsInMs;
}

Swift::Int *UsInSec.unsafeMutableAddressor()
{
  return &UsInSec;
}

Swift::Int *MsInSec.unsafeMutableAddressor()
{
  return &MsInSec;
}

Swift::Int *SecInMin.unsafeMutableAddressor()
{
  return &SecInMin;
}

uint64_t SecInMin.getter()
{
  return 60;
}

Swift::Int *SecInHr.unsafeMutableAddressor()
{
  return &SecInHr;
}

uint64_t SecInHr.getter()
{
  return 3600;
}

void one-time initialization function for NsToUs()
{
  NsToUs = 0.001;
}

Swift::Double *NsToUs.unsafeMutableAddressor()
{
  if (one-time initialization token for NsToUs != -1) {
    swift_once();
  }
  return &NsToUs;
}

double NsToUs.getter()
{
  return NsToUs.getter(&one-time initialization token for NsToUs, (uint64_t)&NsToUs);
}

void one-time initialization function for NsToMs()
{
  NsToMs = 0.000001;
}

Swift::Double *NsToMs.unsafeMutableAddressor()
{
  if (one-time initialization token for NsToMs != -1) {
    swift_once();
  }
  return &NsToMs;
}

double NsToMs.getter()
{
  return NsToUs.getter(&one-time initialization token for NsToMs, (uint64_t)&NsToMs);
}

void one-time initialization function for NsToSec()
{
  NsToSec = 0.000000001;
}

Swift::Double *NsToSec.unsafeMutableAddressor()
{
  if (one-time initialization token for NsToSec != -1) {
    swift_once();
  }
  return &NsToSec;
}

void one-time initialization function for UsToMs()
{
  UsToMs = 0.001;
}

Swift::Double *UsToMs.unsafeMutableAddressor()
{
  if (one-time initialization token for UsToMs != -1) {
    swift_once();
  }
  return &UsToMs;
}

double UsToMs.getter()
{
  return NsToUs.getter(&one-time initialization token for UsToMs, (uint64_t)&UsToMs);
}

void one-time initialization function for UsToSec()
{
  UsToSec = 0.000001;
}

Swift::Double *UsToSec.unsafeMutableAddressor()
{
  if (one-time initialization token for UsToSec != -1) {
    swift_once();
  }
  return &UsToSec;
}

double UsToSec.getter()
{
  return NsToUs.getter(&one-time initialization token for UsToSec, (uint64_t)&UsToSec);
}

void one-time initialization function for UsToMin()
{
  UsToMin = 0.0000000166666667;
}

Swift::Double *UsToMin.unsafeMutableAddressor()
{
  if (one-time initialization token for UsToMin != -1) {
    swift_once();
  }
  return &UsToMin;
}

double UsToMin.getter()
{
  return NsToUs.getter(&one-time initialization token for UsToMin, (uint64_t)&UsToMin);
}

void one-time initialization function for MsToSec()
{
  MsToSec = 0.001;
}

Swift::Double *MsToSec.unsafeMutableAddressor()
{
  if (one-time initialization token for MsToSec != -1) {
    swift_once();
  }
  return &MsToSec;
}

double MsToSec.getter()
{
  return NsToUs.getter(&one-time initialization token for MsToSec, (uint64_t)&MsToSec);
}

uint64_t TicksInfo.denominator.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t variable initialization expression of TicksInfo.precisionReductionBits()
{
  return 0;
}

uint64_t TicksInfo.precisionReductionBits.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t ticksInfo()()
{
  if (one-time initialization token for sTicksInfo != -1) {
    swift_once();
  }
  return static sTicksInfo in FuncData #1 in ticksInfo();
}

Swift::UInt64 __swiftcall convertNsToTicks(_:)(Swift::UInt64 result)
{
  Swift::UInt64 v1 = result;
  if (one-time initialization token for sTicksInfo != -1) {
    unint64_t result = swift_once();
  }
  if (is_mul_ok(v1, static sTicksInfo in FuncData #1 in ticksInfo()))
  {
    if (static sTicksInfo in FuncData #1 in ticksInfo()) {
      return v1 * static sTicksInfo in FuncData #1 in ticksInfo() / static sTicksInfo in FuncData #1 in ticksInfo();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall machAbsTimeNs()()
{
  Swift::UInt64 v0 = mach_absolute_time();

  return convertTicksToNs(_:)(v0);
}

Swift::Double __swiftcall machAbsTimeSec()()
{
  return machAbsTimeSec()(MEMORY[0x270FA53A0]);
}

Swift::UInt64 __swiftcall machContTimeNs()()
{
  Swift::UInt64 v0 = mach_continuous_time();

  return convertTicksToNs(_:)(v0);
}

uint64_t one-time initialization function for instance()
{
  type metadata accessor for TimesSync();
  uint64_t result = swift_initStaticObject();
  static TimesSync.instance = result;
  return result;
}

uint64_t *TimesSync.instance.unsafeMutableAddressor()
{
  if (one-time initialization token for instance != -1) {
    swift_once();
  }
  return &static TimesSync.instance;
}

double variable initialization expression of TimesSync._cfaMinusMctSec()
{
  return 0.0;
}

uint64_t *TimesSync.SyncIntervalTicks.unsafeMutableAddressor()
{
  if (one-time initialization token for SyncIntervalTicks != -1) {
    swift_once();
  }
  return &static TimesSync.SyncIntervalTicks;
}

void *TimesSync.SyncIntervalSec.unsafeMutableAddressor()
{
  return &static TimesSync.SyncIntervalSec;
}

uint64_t static TimesSync.SyncIntervalSec.getter()
{
  return 100;
}

Swift::UInt64 one-time initialization function for SyncIntervalTicks()
{
  Swift::UInt64 result = convertNsToTicks(_:)(0x174876E800uLL);
  static TimesSync.SyncIntervalTicks = result;
  return result;
}

uint64_t static TimesSync.SyncIntervalTicks.getter()
{
  if (one-time initialization token for SyncIntervalTicks != -1) {
    swift_once();
  }
  return static TimesSync.SyncIntervalTicks;
}

uint64_t TimesSync._mctMinusMatNs.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TimesSync._mctMinusMatNs.modify())()
{
  return TimesSync._mctMinusMatNs.modify;
}

uint64_t TimesSync._mctMinusMatNs.modify()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t TimesSync._cfaMinusMctSec.setter(double a1)
{
  uint64_t result = swift_beginAccess();
  *(double *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TimesSync._cfaMinusMctSec.modify())()
{
  return TimesSync._cfaMinusMctSec.modify;
}

uint64_t TimesSync._lastsyncMctTicks.setter(uint64_t a1, char a2)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v2 + 32) = a1;
  *(unsigned char *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*TimesSync._lastsyncMctTicks.modify())()
{
  return TimesSync._cfaMinusMctSec.modify;
}

uint64_t TimesSync.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 41, 7);
}

uint64_t one-time initialization function for sTicksInfo()
{
  uint64_t result = closure #1 in variable initialization expression of static sTicksInfo in FuncData #1 in ticksInfo()();
  static sTicksInfo in FuncData #1 in ticksInfo() = result;
  static sTicksInfo in FuncData #1 in ticksInfo() = v1;
  return result;
}

uint64_t closure #1 in variable initialization expression of static sTicksInfo in FuncData #1 in ticksInfo()()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&info - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  mach_timebase_info info = (mach_timebase_info)0x100000001;
  if (mach_timebase_info(&info))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!info.numer)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
  }
  if (!info.denom) {
    goto LABEL_9;
  }
  uint64_t v4 = utillog.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109376;
    swift_beginAccess();
    uint32_t numer = info.numer;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v7 + 8) = 1024;
    uint32_t numer = info.denom;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_246D43000, v5, v6, "ticksInfo,numer,%u,denom,%u", (uint8_t *)v7, 0xEu);
    MEMORY[0x24C548760](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  return info.numer;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TicksInfo(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TicksInfo(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TicksInfo()
{
  return &type metadata for TicksInfo;
}

uint64_t method lookup function for TimesSync(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TimesSync);
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

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1810]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1828]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1848]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19A8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x270F9D6B0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
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

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x270EF23E0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA130]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA150]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA280](info);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}