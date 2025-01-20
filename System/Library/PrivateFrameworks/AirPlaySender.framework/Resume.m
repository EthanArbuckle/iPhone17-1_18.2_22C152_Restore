@interface Resume
@end

@implementation Resume

void __screenstreamudp_Resume_block_invoke(uint64_t a1)
{
  buffer[2] = *MEMORY[0x1E4F143B8];
  v2 = *(const void **)(a1 + 32);
  if (*(void *)(a1 + 48)) {
    v3 = (void *)(a1 + 56);
  }
  else {
    v3 = 0;
  }
  v133 = v3;
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  v134 = v2;
  if (DerivedStorage[24])
  {
    int v20 = -16762;
    goto LABEL_150;
  }
  v5 = DerivedStorage;
  if (DerivedStorage[26] || !DerivedStorage[25]) {
    goto LABEL_69;
  }
  uint64_t v6 = CMBaseObjectGetDerivedStorage();
  CFDictionaryRef v148 = 0;
  CFTypeRef v149 = 0;
  buffer[0] = 0;
  buffer[1] = 0;
  CFDataRef v146 = 0;
  uint64_t v147 = 0;
  CFTypeRef v144 = 0;
  uint64_t v145 = 0;
  CFTypeRef v142 = 0;
  CFTypeRef v143 = 0;
  uint64_t v141 = 0;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v136 = *MEMORY[0x1E4F1DB30];
  int v135 = 0;
  if (!*(void *)(v6 + 48))
  {
    int v20 = -16760;
LABEL_155:
    APSLogErrorAt();
    CFMutableDictionaryRef v21 = 0;
    CFMutableDictionaryRef Mutable = 0;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  if (!*(void *)(v6 + 40))
  {
    int v20 = -16760;
    goto LABEL_155;
  }
  int v8 = RandomBytes();
  if (v8)
  {
    int v20 = v8;
    goto LABEL_155;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  FigCFDictionarySetInt32();
  uint64_t v11 = *(void *)(v7 + 48);
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  v14 = *(uint64_t (**)(uint64_t, uint64_t, CFMutableDictionaryRef))(v13 + 64);
  if (!v14)
  {
    int v20 = -12782;
LABEL_19:
    APSLogErrorAt();
    CFMutableDictionaryRef v21 = 0;
LABEL_20:
    v22 = 0;
    CFStringRef v23 = 0;
LABEL_38:
    if (gLogCategory_APEndpointStreamScreenUDP <= 90
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      if (!v22) {
        goto LABEL_45;
      }
    }
    else if (!v22)
    {
      goto LABEL_45;
    }
LABEL_44:
    CFRelease(v22);
    goto LABEL_45;
  }
  CFAllocatorRef allocator = v9;
  int v15 = v14(v11, 1935897205, Mutable);
  if (v15)
  {
    int v20 = v15;
    goto LABEL_19;
  }
  int v16 = [*(id *)(v7 + 40) getClientUPID:&v147];
  if (v16)
  {
    int v20 = v16;
    goto LABEL_19;
  }
  uint64_t Int64 = CFNumberCreateInt64();
  uint64_t CMBaseObject = FigTransportStreamGetCMBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  v24 = *(uint64_t (**)(uint64_t, void, uint64_t))(v19 + 56);
  if (!v24)
  {
    int v20 = -12782;
LABEL_37:
    APSLogErrorAt();
    CFMutableDictionaryRef v21 = 0;
    CFStringRef v23 = 0;
    v22 = (const void *)Int64;
    goto LABEL_38;
  }
  int v25 = v24(CMBaseObject, *MEMORY[0x1E4F47718], Int64);
  if (v25)
  {
    int v20 = v25;
    goto LABEL_37;
  }
  uint64_t v26 = *(void *)(v7 + 104);
  uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v27) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = 0;
  }
  v29 = *(uint64_t (**)(uint64_t))(v28 + 8);
  if (!v29)
  {
    int v20 = -12782;
    goto LABEL_37;
  }
  int v30 = v29(v26);
  if (v30)
  {
    int v20 = v30;
    goto LABEL_37;
  }
  v125 = v5;
  uint64_t v31 = CMBaseObjectGetDerivedStorage();
  v152 = 0;
  v32 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v32)
  {
    APSLogErrorAt();
    CFMutableDictionaryRef theDict = 0;
    int v20 = -6728;
LABEL_198:
    APSLogErrorAt();
    CFStringRef v23 = 0;
    v22 = (const void *)Int64;
    CFMutableDictionaryRef v21 = theDict;
    v5 = v125;
    goto LABEL_38;
  }
  v33 = v32;
  v34 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFDictionarySetValue(v32, @"useAVConfMirroring", (const void *)*MEMORY[0x1E4F1CFD0]);
  FigCFDictionarySetInt32();
  v122 = (const void *)*MEMORY[0x1E4F1CFC8];
  v123 = v34;
  if (*(unsigned char *)(v31 + 268)) {
    v35 = v34;
  }
  else {
    v35 = (const void *)*MEMORY[0x1E4F1CFC8];
  }
  CFMutableDictionaryRef theDict = v33;
  CFDictionarySetValue(v33, @"remoteShouldShowHUD", v35);
  uint64_t v36 = FigTransportStreamGetCMBaseObject();
  uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v37) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = 0;
  }
  v40 = *(uint64_t (**)(uint64_t, void, const __CFAllocator *, const void **))(v38 + 48);
  v5 = v125;
  if (!v40)
  {
    int v20 = -12782;
LABEL_91:
    APSLogErrorAt();
    valuea = 0;
LABEL_92:
    CFMutableDictionaryRef v45 = 0;
LABEL_93:
    CFRelease(theDict);
    CFMutableDictionaryRef theDict = 0;
    goto LABEL_96;
  }
  int v41 = v40(v36, *MEMORY[0x1E4F47760], allocator, &v152);
  if (v41)
  {
    int v20 = v41;
    goto LABEL_91;
  }
  CFDictionarySetValue(theDict, @"networkInfo", v152);
  v42 = (const void *)[*(id *)(v31 + 40) negotiationDataForPresentationMode:*(void *)(v31 + 240) == 1];
  if (!v42)
  {
    APSLogErrorAt();
    valuea = 0;
    CFMutableDictionaryRef v45 = 0;
    int v20 = -16761;
    goto LABEL_93;
  }
  CFDictionarySetValue(theDict, @"negotiationData", v42);
  CFDictionarySetInt64();
  CFDictionaryRef value = screenstreamudp_getDisplayHDRMode(v31);
  CFDictionarySetInt64();
  if (value) {
    CFDictionarySetValue(theDict, @"displayHDRMode", value);
  }
  if (*(unsigned char *)(v31 + 255)) {
    v43 = v123;
  }
  else {
    v43 = v122;
  }
  CFDictionarySetValue(theDict, @"hdrMirroringSupported", v43);
  valuea = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!valuea)
  {
    APSLogErrorAt();
    valuea = 0;
    CFMutableDictionaryRef v45 = 0;
LABEL_211:
    int v20 = -6728;
    goto LABEL_93;
  }
  if (!*(unsigned char *)(v31 + 112)) {
    goto LABEL_87;
  }
  int v44 = RandomBytes();
  if (v44)
  {
    int v20 = v44;
    APSLogErrorAt();
    goto LABEL_92;
  }
  CFMutableDictionaryRef v45 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v45)
  {
    APSLogErrorAt();
    goto LABEL_211;
  }
  int v46 = CFDictionarySetInt64();
  if (v46)
  {
    int v20 = v46;
    APSLogErrorAt();
    goto LABEL_93;
  }
  CFDictionarySetValue(valuea, @"streamConnectionTypeMediaDataControl", v45);
  CFRelease(v45);
LABEL_87:
  CFDictionarySetValue(theDict, @"streamConnections", valuea);
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFMutableDictionaryRef v45 = 0;
  int v20 = 0;
LABEL_96:
  if (v152) {
    CFRelease(v152);
  }
  if (valuea) {
    CFRelease(valuea);
  }
  if (v45) {
    CFRelease(v45);
  }
  if (v20) {
    goto LABEL_198;
  }
  if (gLogCategory_APEndpointStreamScreenUDP <= 40)
  {
    if (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_APEndpointStreamScreenUDP <= 40
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  uint64_t v47 = *(void *)(v7 + 48);
  uint64_t v48 = *(unsigned int *)(v7 + 96);
  uint64_t v49 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v49) {
    uint64_t v50 = v49;
  }
  else {
    uint64_t v50 = 0;
  }
  v51 = *(uint64_t (**)(uint64_t, uint64_t, CFMutableDictionaryRef, const __CFDictionary **, CFTypeRef *, void))(v50 + 40);
  if (!v51)
  {
    int v20 = -12782;
LABEL_232:
    APSLogErrorAt();
    CFStringRef v23 = 0;
    goto LABEL_233;
  }
  int v52 = v51(v47, v48, theDict, &v148, &v149, 0);
  if (v52)
  {
    int v20 = v52;
    goto LABEL_232;
  }
  CFDictionaryRef v53 = v148;
  if (!v148)
  {
LABEL_206:
    APSLogErrorAt();
    CFStringRef v23 = 0;
    int v20 = -16765;
LABEL_233:
    v22 = (const void *)Int64;
    CFMutableDictionaryRef v21 = theDict;
    goto LABEL_38;
  }
  int v150 = 0;
  uint64_t v54 = CMBaseObjectGetDerivedStorage();
  CFDictionaryGetTypeID();
  valueb = (void *)CFDictionaryGetTypedValue();
  if (v150) {
    goto LABEL_131;
  }
  v124 = (void *)v54;
  uint64_t v55 = FigTransportStreamGetCMBaseObject();
  uint64_t v56 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v56) {
    uint64_t v57 = v56;
  }
  else {
    uint64_t v57 = 0;
  }
  v58 = *(uint64_t (**)(uint64_t, void, void *))(v57 + 56);
  if (!v58)
  {
    int v150 = -12782;
    goto LABEL_131;
  }
  int v150 = v58(v55, *MEMORY[0x1E4F477C0], valueb);
  if (v150)
  {
LABEL_131:
    APSLogErrorAt();
    v64 = 0;
    goto LABEL_215;
  }
  CFDataGetTypeID();
  valuec = (void *)CFDictionaryGetTypedValue();
  if (v150) {
    goto LABEL_213;
  }
  if (!CFDictionaryContainsKey(v53, @"streamConnections")) {
    goto LABEL_214;
  }
  CFDictionaryRef v59 = (const __CFDictionary *)CFDictionaryGetValue(v53, @"streamConnections");
  if (!CFDictionaryContainsKey(v59, @"streamConnectionTypeMediaDataControl")) {
    goto LABEL_214;
  }
  CFDictionaryGetValue(v59, @"streamConnectionTypeMediaDataControl");
  CFDictionaryGetInt64();
  if (v150)
  {
LABEL_213:
    APSLogErrorAt();
LABEL_214:
    v64 = valuec;
    goto LABEL_215;
  }
  uint64_t v60 = v124[6];
  uint64_t v61 = v124[17];
  v152 = 0;
  uint64_t v121 = APTransportStreamIDMakeWithPort();
  CFTypeRef v151 = 0;
  uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v62) {
    uint64_t v63 = v62;
  }
  else {
    uint64_t v63 = 0;
  }
  v65 = *(uint64_t (**)(uint64_t))(v63 + 24);
  if (!v65)
  {
    int v72 = -12782;
LABEL_139:
    APSLogErrorAt();
    CFMutableDictionaryRef v70 = 0;
    CFStringRef v73 = 0;
LABEL_140:
    v64 = valuec;
    goto LABEL_164;
  }
  uint64_t v120 = v61;
  int v66 = v65(v60);
  if (v66)
  {
    int v72 = v66;
    goto LABEL_139;
  }
  CFMutableDictionaryRef v67 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v67)
  {
    APSLogErrorAt();
    CFMutableDictionaryRef v70 = 0;
    CFStringRef v73 = 0;
    int v72 = -6728;
    goto LABEL_140;
  }
  CFMutableDictionaryRef v68 = v67;
  CFDictionarySetInt64();
  CFDictionarySetInt64();
  CFDictionarySetInt64();
  uint64_t v69 = *(void *)(CMBaseObjectGetVTable() + 16);
  CFMutableDictionaryRef v70 = v68;
  if (v69) {
    uint64_t v71 = v69;
  }
  else {
    uint64_t v71 = 0;
  }
  v64 = valuec;
  v74 = *(uint64_t (**)(uint64_t, uint64_t, CFMutableDictionaryRef, const void **))(v71 + 64);
  if (!v74)
  {
    int v72 = -12782;
LABEL_163:
    APSLogErrorAt();
    CFStringRef v73 = 0;
    goto LABEL_164;
  }
  int v75 = v74(v60, v121, v68, &v152);
  if (v75)
  {
    int v72 = v75;
    goto LABEL_163;
  }
  int v76 = APSSetFBOPropertyInt64();
  if (v76)
  {
    int v72 = v76;
    goto LABEL_163;
  }
  uint64_t v77 = APSenderSessionGetCMBaseObject(v60);
  uint64_t v78 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v78) {
    uint64_t v79 = v78;
  }
  else {
    uint64_t v79 = 0;
  }
  v80 = *(uint64_t (**)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))(v79 + 48);
  if (!v80)
  {
    int v72 = -12782;
    goto LABEL_163;
  }
  int v81 = v80(v77, @"KeyHolder", allocator, &v151);
  if (v81)
  {
    int v72 = v81;
    goto LABEL_163;
  }
  CFStringRef v73 = APKeyHolderCoreUtilsEncryptionContextDataStreamCreateWithSeed(allocator, v120);
  if (!v73)
  {
    APSLogErrorAt();
    int v72 = -6728;
LABEL_164:
    if (v152)
    {
      uint64_t v86 = FigTransportStreamGetCMBaseObject();
      if (v86)
      {
        uint64_t v87 = v86;
        uint64_t v88 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v89 = v88 ? v88 : 0;
        v90 = *(void (**)(uint64_t))(v89 + 24);
        if (v90) {
          v90(v87);
        }
      }
      CFRelease(v152);
      v152 = 0;
    }
    if (!v70) {
      goto LABEL_174;
    }
    goto LABEL_173;
  }
  CFTypeRef v83 = v151;
  v82 = v152;
  uint64_t v84 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v84) {
    uint64_t v85 = v84;
  }
  else {
    uint64_t v85 = 0;
  }
  v91 = *(uint64_t (**)(const void *, CFTypeRef, CFStringRef))(v85 + 80);
  if (!v91)
  {
    int v72 = -12782;
LABEL_190:
    APSLogErrorAt();
    goto LABEL_164;
  }
  int v92 = v91(v82, v83, v73);
  if (v92)
  {
    int v72 = v92;
    v5 = v125;
    v64 = valuec;
    goto LABEL_190;
  }
  int v93 = APSSetFBOPropertyInt64();
  if (v93)
  {
    int v72 = v93;
    goto LABEL_204;
  }
  v94 = v152;
  uint64_t v95 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v95) {
    uint64_t v96 = v95;
  }
  else {
    uint64_t v96 = 0;
  }
  v97 = *(uint64_t (**)(const void *))(v96 + 8);
  if (!v97)
  {
    int v72 = -12782;
    goto LABEL_204;
  }
  int v98 = v97(v94);
  if (v98)
  {
    int v72 = v98;
    goto LABEL_204;
  }
  v99 = v152;
  uint64_t v100 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v100) {
    uint64_t v101 = v100;
  }
  else {
    uint64_t v101 = 0;
  }
  v102 = *(uint64_t (**)(const void *))(v101 + 16);
  if (!v102)
  {
    int v72 = -12782;
    goto LABEL_204;
  }
  int v72 = v102(v99);
  if (v72)
  {
LABEL_204:
    APSLogErrorAt();
    v5 = v125;
    v64 = valuec;
    goto LABEL_164;
  }
  v5 = v125;
  v124[15] = v152;
  v152 = 0;
  v64 = valuec;
LABEL_173:
  CFRelease(v70);
LABEL_174:
  if (v151) {
    CFRelease(v151);
  }
  if (v73) {
    CFRelease(v73);
  }
  int v150 = v72;
  if (!v72) {
    goto LABEL_216;
  }
  APSLogErrorAt();
LABEL_215:
  int v20 = v150;
  if (v150) {
    goto LABEL_232;
  }
LABEL_216:
  uint64_t v103 = FigTransportStreamGetCMBaseObject();
  uint64_t v104 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v104) {
    uint64_t v105 = v104;
  }
  else {
    uint64_t v105 = 0;
  }
  v106 = *(uint64_t (**)(uint64_t, void, const __CFAllocator *, const __CFData **))(v105 + 48);
  if (!v106)
  {
    int v20 = -12782;
    goto LABEL_232;
  }
  int v107 = v106(v103, *MEMORY[0x1E4F47780], allocator, &v146);
  if (v107)
  {
    int v20 = v107;
    goto LABEL_232;
  }
  v154.location = 0;
  v154.length = 16;
  CFDataGetBytes(v146, v154, (UInt8 *)buffer);
  uint64_t v108 = APSenderSessionGetCMBaseObject(*(void *)(v7 + 48));
  uint64_t v109 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v109) {
    uint64_t v110 = v109;
  }
  else {
    uint64_t v110 = 0;
  }
  v111 = *(uint64_t (**)(uint64_t, __CFString *, const __CFAllocator *, CFTypeRef *))(v110 + 48);
  if (!v111)
  {
    int v20 = -12782;
    goto LABEL_232;
  }
  int v112 = v111(v108, @"KeyHolder", allocator, &v144);
  if (v112)
  {
    int v20 = v112;
    goto LABEL_232;
  }
  if (!v144) {
    goto LABEL_206;
  }
  CFStringRef v23 = APKeyHolderCoreUtilsEncryptionContextDataStreamCreateWithSeed(allocator, v145);
  if (!v23)
  {
    APSLogErrorAt();
    int v20 = -6728;
    goto LABEL_233;
  }
  CFTypeRef v113 = v144;
  uint64_t v114 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v114) {
    uint64_t v115 = v114;
  }
  else {
    uint64_t v115 = 0;
  }
  v116 = *(uint64_t (**)(CFTypeRef, CFStringRef, uint64_t, CFTypeRef *, uint64_t, CFTypeRef *))(v115 + 64);
  if (!v116)
  {
    int v20 = -12782;
LABEL_242:
    APSLogErrorAt();
    goto LABEL_233;
  }
  int v117 = v116(v113, v23, 46, &v143, 46, &v142);
  if (v117)
  {
    int v20 = v117;
    goto LABEL_242;
  }
  if (*(void *)(v7 + 240) == 1)
  {
    APSScreenGetMediaPresentationParams();
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    long long v136 = *(_OWORD *)(v7 + 152);
    int v135 = *(_DWORD *)(v7 + 260);
  }
  long long v137 = v136;
  LODWORD(v138) = v135;
  *((void *)&v138 + 1) = v142;
  *(void *)&long long v139 = v143;
  BYTE8(v139) = *(void *)(v7 + 240) == 1;
  CFDictionaryRef DisplayHDRMode = screenstreamudp_getDisplayHDRMode(v7);
  uint64_t v119 = *(void *)(v7 + 192);
  *(void *)&long long v140 = DisplayHDRMode;
  *((void *)&v140 + 1) = v119;
  LOBYTE(v141) = *(unsigned char *)(v7 + 248);
  int v20 = [*(id *)(v7 + 40) startWithNWConnectionClientID:buffer negotiatedBlob:v64 screenOptions:&v137 completion:v133];
  if (v20) {
    goto LABEL_242;
  }
  v22 = (const void *)Int64;
  CFMutableDictionaryRef v21 = theDict;
  if (Int64) {
    goto LABEL_44;
  }
LABEL_45:
  if (v146) {
    CFRelease(v146);
  }
  if (v21) {
    CFRelease(v21);
  }
  if (v149) {
    CFRelease(v149);
  }
  if (v148) {
    CFRelease(v148);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v144) {
    CFRelease(v144);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v143) {
    CFRelease(v143);
  }
  if (v142) {
    CFRelease(v142);
  }
  if (!v20)
  {
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5[27] = 1;
    goto LABEL_69;
  }
LABEL_150:
  APSLogErrorAt();
  if (gLogCategory_APEndpointStreamScreenUDP <= 90
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  screenstreamudp_dispatchCallback(v134, v133, v20);
  screenstreamudp_handleFatalError(v134, v20, @"Resume failed");
LABEL_69:
  v39 = *(const void **)(a1 + 40);
  if (v39) {
    CFRelease(v39);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __audioEngineCarPlay_Resume_block_invoke(uint64_t a1)
{
  uint64_t v32 = 0;
  memset(__s1, 0, sizeof(__s1));
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v2 + 120))
  {
    if (*(void *)(v2 + 72) && *(void *)(v2 + 80) && *(void *)(v2 + 96))
    {
      uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
      v33 = 0;
      CFTypeRef v34 = 0;
      if (*(unsigned char *)(DerivedStorage + 120))
      {
        APSLogErrorAt();
        int v5 = -72077;
      }
      else
      {
        uint64_t v4 = DerivedStorage;
        if (*(void *)(DerivedStorage + 64))
        {
          if (*(void *)(DerivedStorage + 88))
          {
            int v5 = 0;
          }
          else
          {
            uint64_t v6 = *MEMORY[0x1E4F1CF80];
            int v7 = APTransportStreamSendBackingProviderCreateWithStreamID();
            if (v7)
            {
              int v5 = v7;
              APSLogErrorAt();
            }
            else
            {
              size_t v8 = *(void *)(v4 + 64);
              __int16 v9 = arc4random();
              int v5 = APMessageRingCreate(v6, v8, v9, v33, 48, 0, (uint64_t *)&v34);
              if (v5)
              {
                APSLogErrorAt();
                if (v34) {
                  CFRelease(v34);
                }
              }
              else
              {
                *(void *)(v4 + 88) = v34;
                CFTypeRef v34 = 0;
              }
            }
          }
        }
        else
        {
          APSLogErrorAt();
          int v5 = -72071;
        }
      }
      if (v33) {
        CFRelease(v33);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        goto LABEL_54;
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 72);
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v12 = v11 ? (void *)v11 : 0;
      if (*v12 < 2uLL)
      {
        int v14 = -12781;
      }
      else
      {
        uint64_t v13 = (uint64_t (*)(uint64_t, _OWORD *))v12[1];
        int v14 = v13 ? v13(v10, __s1) : -12782;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v14;
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        goto LABEL_54;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      if (!memcmp(__s1, (const void *)(v15 + 24), 0x28uLL))
      {
        *(_DWORD *)(v15 + 4) = *(_DWORD *)v15 * *(double *)(v15 + 24) / (1000 * *(_DWORD *)(v15 + 44));
        int v16 = *(NSObject **)(v15 + 128);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 0x40000000;
        block[2] = __audioEngineCarPlay_Resume_block_invoke_2;
        block[3] = &__block_descriptor_tmp_20;
        block[4] = v15;
        dispatch_sync(v16, block);
        APSSetFBOPropertyInt64();
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 48);
        uint64_t v19 = *(void *)(v17 + 72);
        uint64_t v20 = *(unsigned int *)(v17 + 4);
        uint64_t v21 = *(void *)(v17 + 128);
        v22 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v22) {
          CFStringRef v23 = v22;
        }
        else {
          CFStringRef v23 = 0;
        }
        if (*v23 >= 2uLL)
        {
          v24 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t))v23[3];
          if (v24) {
            v24(v19, v20, v21, audioEngineCarPlay_HandleDataReady, v18);
          }
        }
        if (gLogCategory_APAudioEngineCarPlay <= 40
          && (gLogCategory_APAudioEngineCarPlay != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 72);
        uint64_t v26 = *(void **)(CMBaseObjectGetVTable() + 16);
        if (v26) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = 0;
        }
        if (*v27 < 2uLL)
        {
          int v29 = -12781;
        }
        else
        {
          uint64_t v28 = (uint64_t (*)(uint64_t))v27[4];
          if (v28) {
            int v29 = v28(v25);
          }
          else {
            int v29 = -12782;
          }
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v29;
        if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(a1 + 40) + 120) = 1;
          goto LABEL_45;
        }
LABEL_54:
        APSLogErrorAt();
        goto LABEL_45;
      }
    }
    APSLogErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -72074;
  }
LABEL_45:
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __audioEngineCarPlay_Resume_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(v2 + 40);
  *(_OWORD *)(v2 + 144) = *(_OWORD *)(v2 + 24);
  *(_OWORD *)(v2 + 160) = v3;
  *(void *)(v2 + 176) = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(const void **)(v4 + 184);
  uint64_t v6 = *(const void **)(v4 + 72);
  *(void *)(v4 + 184) = v6;
  if (v6) {
    CFRetain(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  size_t v8 = *(const void **)(v7 + 192);
  __int16 v9 = *(const void **)(v7 + 80);
  *(void *)(v7 + 192) = v9;
  if (v9) {
    CFRetain(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(const void **)(v10 + 200);
  uint64_t v12 = *(const void **)(v10 + 88);
  *(void *)(v10 + 200) = v12;
  if (v12) {
    CFRetain(v12);
  }
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  int v14 = *(const void **)(v13 + 208);
  uint64_t v15 = *(const void **)(v13 + 96);
  *(void *)(v13 + 208) = v15;
  if (v15) {
    CFRetain(v15);
  }
  if (v14) {
    CFRelease(v14);
  }
  *(void *)(*(void *)(a1 + 32) + 216) = *(void *)(*(void *)(a1 + 32) + 104);
  *(void *)(*(void *)(a1 + 32) + 224) = *(void *)(*(void *)(a1 + 32) + 112);
  uint64_t v16 = *(void *)(a1 + 32);
  *(_DWORD *)(v16 + 232) = 0;
  *(unsigned char *)(v16 + 236) = 0;
  *(unsigned char *)(v16 + 136) = 1;
}

void __screenstream_Resume_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v4 = DerivedStorage;
  int v5 = &unk_1EA629000;
  if (*(unsigned char *)(DerivedStorage + 24))
  {
    int v69 = -16762;
    goto LABEL_123;
  }
  if (*(unsigned char *)(DerivedStorage + 26) || !*(unsigned char *)(DerivedStorage + 25))
  {
LABEL_133:
    int v69 = 0;
    goto LABEL_134;
  }
  if (!*(void *)(DerivedStorage + 160))
  {
    int v69 = -16768;
    goto LABEL_123;
  }
  atomic_store(0, (unsigned int *)(DerivedStorage + 1176));
  int v97 = 0;
  uint64_t v6 = CMBaseObjectGetDerivedStorage();
  CFTypeRef v95 = 0;
  CFTypeRef v96 = 0;
  uint64_t v7 = (CFTypeRef *)(v6 + 136);
  if (!*(void *)(v6 + 136))
  {
    uint64_t v8 = v6;
    if (gLogCategory_APEndpointStreamScreen <= 40
      && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (!Mutable)
    {
      APSLogErrorAt();
      uint64_t v20 = 0;
      int v97 = -16761;
LABEL_109:
      if (v95) {
        CFRelease(v95);
      }
      if (v20) {
        CFRelease(v20);
      }
      goto LABEL_113;
    }
    uint64_t v11 = Mutable;
    FigCFDictionarySetInt32();
    if (!*(void *)(v8 + 48))
    {
      uint64_t v12 = *(const void **)(v8 + 128);
      if (!v12)
      {
        APSLogErrorAt();
        uint64_t v20 = 0;
        int v97 = -16765;
        goto LABEL_107;
      }
      *uint64_t v7 = CFRetain(v12);
      if (gLogCategory_APEndpointStreamScreen <= 50
        && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v20 = 0;
      goto LABEL_51;
    }
    if (*(unsigned char *)(v8 + 378))
    {
      CFDictionarySetValue(v11, @"uuid", *(const void **)(v8 + 296));
      if (*(void *)(v8 + 120))
      {
        uint64_t v90 = MEMORY[0x1E4F143A8];
        uint64_t v91 = 0x40000000;
        int v92 = __screenstream_ensureTransportStream_block_invoke;
        int v93 = &__block_descriptor_tmp_112_1;
        v94 = v11;
        CFDictionaryApplyBlock();
      }
    }
    else if (*(unsigned char *)(v8 + 389))
    {
      CFTypeRef v13 = APDemoManagerCopyDeviceInfo();
      if (v13)
      {
        int v14 = v13;
        CFDictionarySetValue(v11, @"DemoDeviceInfo", v13);
        CFRelease(v14);
      }
    }
    uint64_t v15 = *(void *)(v8 + 48);
    uint64_t v16 = *(unsigned int *)(v8 + 88);
    uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v17) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, __CFDictionary *, CFTypeRef *, CFTypeRef *, void))(v18 + 40);
    if (v19)
    {
      uint64_t v86 = v11;
      int v97 = v19(v15, v16, v11, &v95, &v96, 0);
      if (!v97)
      {
        CFDictionaryGetInt64();
        if (!v97)
        {
          if (gLogCategory_APEndpointStreamScreen <= 50
            && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          uint64_t v21 = v7;
          v22 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          FigCFDictionarySetInt32();
          FigCFDictionarySetInt32();
          FigCFDictionarySetInt32();
          if (*(unsigned char *)(v8 + 378))
          {
            CFStringRef v23 = (const void *)*MEMORY[0x1E4F22028];
            CFUUIDRef v24 = CFUUIDGetConstantUUIDWithBytes(0, 0x99u, 0xA4u, 0x2Au, 0xF4u, 0x23u, 0xE3u, 0x4Au, 0, 0x91u, 0x6Eu, 0xC1u, 0x43u, 0xD3u, 0x32u, 0x3Bu, 0x92u);
            CFDictionarySetValue(v22, v23, v24);
          }
          uint64_t v25 = *(void *)(v8 + 48);
          uint64_t v26 = APTransportStreamIDMakeWithPort();
          uint64_t v27 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v27) {
            uint64_t v28 = v27;
          }
          else {
            uint64_t v28 = 0;
          }
          int v29 = *(uint64_t (**)(uint64_t, uint64_t, __CFDictionary *, CFTypeRef *))(v28 + 64);
          if (v29)
          {
            uint64_t v30 = v26;
            uint64_t v20 = v22;
            int v97 = v29(v25, v30, v22, v21);
            if (!v97)
            {
              if (gLogCategory_APEndpointStreamScreen <= 50
                && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              uint64_t v7 = v21;
              int v97 = APSSetFBOPropertyInt64();
              if (!v97)
              {
                uint64_t v11 = v86;
LABEL_51:
                if (*(int *)(v8 + 1160) >= 1)
                {
                  if (gLogCategory_APEndpointStreamScreen <= 50
                    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
                  {
                    LogPrintF();
                  }
                  APSSetFBOPropertyInt64();
                }
                uint64_t v84 = v20;
                uint64_t v85 = v2;
                uint64_t v87 = v11;
                uint64_t v31 = CMBaseObjectGetDerivedStorage();
                *(void *)(v31 + 1152) = mach_absolute_time();
                uint64_t v32 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
                v33 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
                CFTypeRef v34 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                v35 = CFDictionaryCreateMutable(v9, 0, v32, v33);
                uint64_t v36 = *(const void **)(v8 + 1104);
                if (v36)
                {
                  CFRelease(v36);
                  *(void *)(v8 + 1104) = 0;
                }
                uint64_t v37 = (const void *)*MEMORY[0x1E4F4A200];
                CFDictionarySetValue(v34, (const void *)*MEMORY[0x1E4F4A200], @"fps");
                FigCFDictionarySetDouble();
                uint64_t v38 = (const void *)*MEMORY[0x1E4F4A1F8];
                CFDictionarySetValue(v34, (const void *)*MEMORY[0x1E4F4A1F8], @"Source Frames");
                v39 = (const void *)APSStatsHistogramCreate();
                if (v39)
                {
                  v40 = v39;
                  CFDictionarySetValue(v35, @"Source Frames", v39);
                  CFRelease(v40);
                }
                CFDictionarySetValue(v34, v38, @"Sent Frames");
                int v41 = (const void *)APSStatsHistogramCreate();
                if (v41)
                {
                  v42 = v41;
                  CFDictionarySetValue(v35, @"Sent Frames", v41);
                  CFRelease(v42);
                }
                CFDictionarySetValue(v34, v38, @"Dropped Overflow Frames");
                v43 = (const void *)APSStatsHistogramCreate();
                if (v43)
                {
                  int v44 = v43;
                  CFDictionarySetValue(v35, @"Dropped Overflow Frames", v43);
                  CFRelease(v44);
                }
                CFDictionarySetValue(v34, v37, @"Mbps");
                FigCFDictionarySetDouble();
                CFDictionarySetValue(v34, v38, @"Used Bandwidth");
                CFMutableDictionaryRef v45 = (const void *)APSStatsHistogramCreate();
                if (v45)
                {
                  int v46 = v45;
                  CFDictionarySetValue(v35, @"Used Bandwidth", v45);
                  CFRelease(v46);
                }
                FigCFDictionarySetDouble();
                FigCFDictionarySetInt32();
                CFDictionarySetValue(v34, v38, @"Available Bandwidth");
                uint64_t v47 = (const void *)APSStatsHistogramCreate();
                if (v47)
                {
                  uint64_t v48 = v47;
                  CFDictionarySetValue(v35, @"Available Bandwidth", v47);
                  CFRelease(v48);
                }
                CFRelease(v34);
                *(void *)(v8 + 1104) = v35;
                CFTypeRef v49 = v96;
                uint64_t v50 = *(const void **)(v8 + 912);
                *(void *)(v8 + 912) = v96;
                uint64_t v2 = v85;
                uint64_t v11 = v87;
                if (v49) {
                  CFRetain(v49);
                }
                int v5 = &unk_1EA629000;
                if (v50) {
                  CFRelease(v50);
                }
                if (v49)
                {
                  uint64_t v51 = *(void *)(CMBaseObjectGetVTable() + 16);
                  uint64_t v20 = v84;
                  if (v51) {
                    uint64_t v52 = v51;
                  }
                  else {
                    uint64_t v52 = 0;
                  }
                  uint64_t v54 = *(uint64_t (**)(CFTypeRef))(v52 + 8);
                  if (v54) {
                    uint64_t v53 = v54(v49);
                  }
                  else {
                    uint64_t v53 = 0;
                  }
                }
                else
                {
                  uint64_t v53 = 0;
                  uint64_t v20 = v84;
                }
                *(void *)(v8 + 920) = v53;
                uint64_t v55 = *(const void **)(v8 + 960);
                uint64_t v56 = *(const void **)(v8 + 64);
                *(void *)(v8 + 960) = v56;
                if (v56) {
                  CFRetain(v56);
                }
                if (v55) {
                  CFRelease(v55);
                }
                CFTypeRef v57 = *v7;
                uint64_t v58 = *(void *)(CMBaseObjectGetVTable() + 16);
                if (v58) {
                  uint64_t v59 = v58;
                }
                else {
                  uint64_t v59 = 0;
                }
                uint64_t v60 = *(uint64_t (**)(CFTypeRef))(v59 + 8);
                if (v60)
                {
                  int v97 = v60(v57);
                  if (!v97)
                  {
                    CFTypeRef v61 = *v7;
                    uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
                    if (v62) {
                      uint64_t v63 = v62;
                    }
                    else {
                      uint64_t v63 = 0;
                    }
                    v64 = *(uint64_t (**)(CFTypeRef))(v63 + 16);
                    if (v64)
                    {
                      int v97 = v64(v61);
                      if (!v97)
                      {
                        CFTypeRef v65 = *v7;
                        uint64_t v66 = *(void *)(CMBaseObjectGetVTable() + 16);
                        if (v66) {
                          uint64_t v67 = v66;
                        }
                        else {
                          uint64_t v67 = 0;
                        }
                        CFMutableDictionaryRef v68 = *(uint64_t (**)(CFTypeRef, void, const void *))(v67 + 64);
                        if (v68)
                        {
                          int v97 = v68(v65, screenstream_dequeueAndProcessSampleBuffer, v85);
                          if (!v97) {
                            goto LABEL_107;
                          }
                        }
                        else
                        {
                          int v97 = -12782;
                        }
                      }
                    }
                    else
                    {
                      int v97 = -12782;
                    }
                  }
                }
                else
                {
                  int v97 = -12782;
                }
                APSLogErrorAt();
LABEL_107:
                CFRelease(v11);
                if (v96) {
                  CFRelease(v96);
                }
                goto LABEL_109;
              }
              APSLogErrorAt();
LABEL_146:
              int v5 = (_DWORD *)&unk_1EA629000;
              uint64_t v11 = v86;
              goto LABEL_107;
            }
          }
          else
          {
            int v97 = -12782;
          }
          APSLogErrorAt();
          int v5 = (_DWORD *)&unk_1EA629000;
          uint64_t v11 = v86;
          uint64_t v20 = v22;
          goto LABEL_107;
        }
        APSLogErrorAt();
        uint64_t v20 = 0;
        goto LABEL_146;
      }
    }
    else
    {
      int v97 = -12782;
    }
    APSLogErrorAt();
    uint64_t v20 = 0;
    goto LABEL_107;
  }
LABEL_113:
  int v69 = v97;
  if (!v97)
  {
    uint64_t v70 = *(void *)(v4 + 160);
    uint64_t v71 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v71) {
      uint64_t v72 = v71;
    }
    else {
      uint64_t v72 = 0;
    }
    CFStringRef v73 = *(uint64_t (**)(uint64_t))(v72 + 32);
    if (v73)
    {
      int v74 = v73(v70);
      if (!v74)
      {
        uint64_t v75 = CMBaseObjectGetDerivedStorage();
        int v76 = v5[642];
        if (v76 <= 30 && (v76 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        uint64_t v78 = *(NSObject **)(v75 + 200);
        dispatch_time_t v79 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v78, v79, 0x3B9ACA00uLL, 0x5F5E100uLL);
        screenStream_setResumedAndNotifiyObservers(v2, 1);
        int v80 = v5[642];
        if (v80 <= 50 && (v80 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        goto LABEL_133;
      }
      int v69 = v74;
    }
    else
    {
      int v69 = -12782;
    }
  }
LABEL_123:
  APSLogErrorAt();
  int v77 = v5[642];
  if (v77 <= 90 && (v77 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  screenstream_cleanup();
LABEL_134:
  if (*(void *)(a1 + 48))
  {
    CFRetain(*(CFTypeRef *)(a1 + 32));
    int v81 = *(NSObject **)(*(void *)(a1 + 56) + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 0x40000000;
    block[2] = __screenstream_Resume_block_invoke_2;
    block[3] = &__block_descriptor_tmp_104;
    uint64_t v82 = *(void *)(a1 + 32);
    block[4] = *(void *)(a1 + 48);
    void block[5] = v82;
    int v89 = v69;
    block[6] = *(void *)(a1 + 64);
    dispatch_async(v81, block);
  }
  CFTypeRef v83 = *(const void **)(a1 + 40);
  if (v83) {
    CFRelease(v83);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __screenstream_Resume_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void, void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), *(void *)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end