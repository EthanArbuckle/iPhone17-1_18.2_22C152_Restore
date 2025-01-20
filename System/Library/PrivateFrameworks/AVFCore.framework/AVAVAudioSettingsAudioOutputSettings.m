@interface AVAVAudioSettingsAudioOutputSettings
+ (id)_audioOutputSettingsWithAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
+ (id)eligibleOutputSettingsDictionaryKeys;
- (AVAVAudioSettingsAudioOutputSettings)initWithAVAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4;
- (AVAVAudioSettingsAudioOutputSettings)initWithTrustedAVAudioSettingsDictionary:(id)a3;
- (AudioChannelLayout)copyAudioChannelLayoutForSourceFormatDescription:(opaqueCMFormatDescription *)a3 audioChannelLayoutSize:(unint64_t *)a4;
- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3;
- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3;
- (BOOL)willYieldCompressedSamples;
- (id)audioOptions;
- (void)getAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3 forAudioFileTypeID:(unsigned int)a4 sourceFormatDescription:(opaqueCMFormatDescription *)a5;
@end

@implementation AVAVAudioSettingsAudioOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F151E0], *MEMORY[0x1E4F15270], *MEMORY[0x1E4F15228], *MEMORY[0x1E4F151F0], *MEMORY[0x1E4F151F8], *MEMORY[0x1E4F15208], *MEMORY[0x1E4F15218], *MEMORY[0x1E4F151A8], *MEMORY[0x1E4F151C0], *MEMORY[0x1E4F151C8], *MEMORY[0x1E4F151B0], *MEMORY[0x1E4F15238], *MEMORY[0x1E4F15260], *MEMORY[0x1E4F15198], *MEMORY[0x1E4F151D0], *MEMORY[0x1E4F151A0], 0);
}

+ (id)_audioOutputSettingsWithAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAVAudioSettingsDictionary:a3 exceptionReason:a4];
  return v4;
}

- (AVAVAudioSettingsAudioOutputSettings)initWithAVAudioSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  v135 = 0;
  v7 = [(AVAudioOutputSettings *)self initWithAudioSettingsDictionary:a3 exceptionReason:&v135];
  v8 = (objc_class *)v7;
  if (!a3)
  {
    v111 = v7;
    v117 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(v8, a2, @"invalid parameter not satisfying: %s", v112, v113, v114, v115, v116, (uint64_t)"avAudioSettingsDictionary != nil"), 0 reason userInfo];
    objc_exception_throw(v117);
  }
  if (!v7)
  {
LABEL_180:
    result = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_181;
  }
  v130 = a4;
  v9 = (void *)[a3 allKeys];
  uint64_t v133 = *MEMORY[0x1E4F151E0];
  int v10 = objc_msgSend(v9, "containsObject:");
  if ((v10 & 1) == 0) {
    v135 = @"AVAudioSettings dictionary must contain AVFormatIDKey";
  }
  uint64_t v11 = *MEMORY[0x1E4F151C0];
  int v12 = [v9 containsObject:*MEMORY[0x1E4F151C0]];
  uint64_t v13 = *MEMORY[0x1E4F151C8];
  int v14 = [v9 containsObject:*MEMORY[0x1E4F151C8]];
  BOOL v15 = (v10 & v12) != 1 || v14 == 0;
  v16 = (uint64_t *)MEMORY[0x1E4F15208];
  v17 = (uint64_t *)MEMORY[0x1E4F151F0];
  v131 = (AVAVAudioSettingsAudioOutputSettings *)v8;
  uint64_t v128 = v13;
  uint64_t v129 = v11;
  if (v15)
  {
    if (!v10)
    {
      int v19 = 0;
      goto LABEL_19;
    }
    uint64_t v18 = *MEMORY[0x1E4F15208];
    if ((![v9 containsObject:*MEMORY[0x1E4F15208]]
       || [v9 containsObject:*v17])
      && (([v9 containsObject:v18] & 1) != 0 || !objc_msgSend(v9, "containsObject:", *v17)))
    {
      int v19 = 1;
      goto LABEL_19;
    }
    int v19 = 0;
    v20 = @"If one of AVLinearPCMIsFloatKey and AVLinearPCMBitDepthKey is specified, both must be specified";
  }
  else
  {
    int v19 = 0;
    v20 = @"Cannot specify both AVEncoderBitRateKey and AVEncoderBitRatePerChannelKey";
  }
  v135 = v20;
LABEL_19:
  uint64_t v127 = *v17;
  uint64_t v21 = objc_msgSend(a3, "objectForKey:");
  v22 = (void *)v21;
  if (v19 && v21)
  {
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithInteger:8];
    uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:16];
    uint64_t v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:24];
    v27 = objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", 32), 0);
    if ([v27 containsObject:v22])
    {
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
      v135 = (__CFString *)[NSString stringWithFormat:@"Bit depth can only be one of: %@", objc_msgSend((id)objc_msgSend(v27, "allObjects"), "componentsJoinedByString:", @", ")];
    }
  }
  uint64_t v126 = *MEMORY[0x1E4F151B0];
  uint64_t v28 = objc_msgSend(a3, "objectForKey:");
  if (v19)
  {
    uint64_t v29 = v28;
    if (v28)
    {
      v30 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithInteger:16];
      uint64_t v32 = [MEMORY[0x1E4F28ED0] numberWithInteger:20];
      uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:24];
      v34 = objc_msgSend(v30, "setWithObjects:", v31, v32, v33, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", 32), 0);
      if ([v34 containsObject:v29])
      {
        int v19 = 1;
      }
      else
      {
        int v19 = 0;
        v135 = (__CFString *)[NSString stringWithFormat:@"Bit depth hint can only be one of: %@", objc_msgSend((id)objc_msgSend(v34, "allObjects"), "componentsJoinedByString:", @", ")];
      }
    }
  }
  uint64_t v125 = *MEMORY[0x1E4F151D0];
  uint64_t v35 = objc_msgSend(a3, "objectForKey:");
  v36 = (void *)v35;
  if (v19 && v35)
  {
    v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F14F38], *MEMORY[0x1E4F14F40], *MEMORY[0x1E4F14F50], *MEMORY[0x1E4F14F48], 0);
    if ([v37 containsObject:v36])
    {
      int v19 = 1;
    }
    else
    {
      int v19 = 0;
      v135 = (__CFString *)[NSString stringWithFormat:@"Bit rate strategy can only be one of: %@", objc_msgSend((id)objc_msgSend(v37, "allObjects"), "componentsJoinedByString:", @", ")];
    }
  }
  uint64_t v124 = *MEMORY[0x1E4F151A0];
  uint64_t v38 = objc_msgSend(a3, "objectForKey:");
  if (v19 && v38)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v36 && ([v36 isEqualToString:*MEMORY[0x1E4F14F48]] & 1) != 0)
      {
        int v19 = 1;
        goto LABEL_43;
      }
      uint64_t v41 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot specify a value for AVEncoderAudioQualityForVBRKey without also specifying AVAudioBitRateStrategy_Variable for AVEncoderBitRateStrategyKey", v118);
    }
    else
    {
      v39 = NSString;
      v40 = (objc_class *)objc_opt_class();
      uint64_t v41 = [v39 stringWithFormat:@"Value for AVEncoderAudioQualityForVBRKey must be an instance of %@", NSStringFromClass(v40)];
    }
    int v19 = 0;
    v135 = (__CFString *)v41;
  }
LABEL_43:
  uint64_t v123 = *v16;
  v42 = objc_msgSend(a3, "objectForKey:");
  if (v19 && v42 && v22)
  {
    if ([v42 BOOLValue] && objc_msgSend(v22, "integerValue") != 32)
    {
      int v19 = 0;
      v135 = @"Floating-point LPCM must be 32-bit";
    }
    else
    {
      int v19 = 1;
    }
  }
  uint64_t v43 = *MEMORY[0x1E4F15228];
  v44 = (void *)[a3 objectForKey:*MEMORY[0x1E4F15228]];
  v45 = v44;
  if (v19 && v44)
  {
    if ([v44 integerValue] <= 0)
    {
      int v19 = 0;
      v135 = @"Channel count must be positive";
    }
    else
    {
      int v19 = 1;
    }
  }
  *(void *)inSpecifierSize = 0;
  uint64_t v46 = *MEMORY[0x1E4F15198];
  v47 = copyAudioChannelLayoutFromData((void *)[a3 objectForKey:*MEMORY[0x1E4F15198]], (unint64_t *)inSpecifierSize);
  v48 = v47;
  if (v19 && v47)
  {
    if (AudioFormatGetProperty(0x7661636Cu, inSpecifierSize[0], v47, 0, 0))
    {
      int v19 = 0;
      v49 = @"AudioChannelLayout is invalid";
LABEL_66:
      v135 = v49;
      goto LABEL_67;
    }
    LODWORD(outPropertyData) = 0;
    ioPropertyDataSize[0] = 4;
    if (AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], v48, ioPropertyDataSize, &outPropertyData)
      || (uint64_t v50 = outPropertyData, !outPropertyData))
    {
      int v19 = 0;
      v49 = @"AudioChannelLayout channel count must be positive";
      goto LABEL_66;
    }
    if (v45 && [v45 integerValue] != v50)
    {
      int v19 = 0;
      v49 = @"AudioChannelLayout channel count does not match AVNumberOfChannelsKey channel count";
      goto LABEL_66;
    }
    int v19 = 1;
  }
LABEL_67:
  uint64_t v51 = *MEMORY[0x1E4F15270];
  v52 = (void *)[a3 objectForKey:*MEMORY[0x1E4F15270]];
  v53 = v52;
  if (v19 && v52)
  {
    [v52 floatValue];
    if (v54 < 8000.0 || v54 > 192000.0)
    {
      int v19 = 0;
      v135 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Invalid value %.2f for AVSampleRateKey; sample rate must be between 8.0 and 192.0 kHz inclusive",
                             v54);
    }
    else
    {
      int v19 = 1;
    }
  }
  inSpecifier = v48;
  uint64_t v55 = *MEMORY[0x1E4F15238];
  uint64_t v56 = [a3 objectForKey:*MEMORY[0x1E4F15238]];
  if (!v19) {
    goto LABEL_79;
  }
  v57 = (void *)v56;
  if (!v56) {
    goto LABEL_79;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v64 = @"Value for AVSampleRateConverterAlgorithmKey must be an instance of NSString";
LABEL_114:
    v75 = inSpecifier;
    v135 = v64;
    [a3 objectForKey:v133];
LABEL_115:
    a4 = v130;
    goto LABEL_116;
  }
  if (([v57 isEqualToString:*MEMORY[0x1E4F15258]] & 1) == 0
    && ([v57 isEqualToString:*MEMORY[0x1E4F15248]] & 1) == 0)
  {
    v64 = (__CFString *)[NSString stringWithFormat:@"Unrecognized value \"%@\" for AVSampleRateConverterAlgorithmKey", v57];
    goto LABEL_114;
  }
  int v19 = 1;
LABEL_79:
  v122 = v45;
  v58 = (void *)[a3 objectForKey:v133];
  if (!v19) {
    goto LABEL_176;
  }
  v59 = v58;
  if (!v58) {
    goto LABEL_176;
  }
  unsigned int v60 = [v58 unsignedIntValue];
  uint64_t v61 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v133, v51, v43, v55, *MEMORY[0x1E4F15260], v46, 0);
  v62 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:", v62), "intersectSet:", v61);
  if (v60 == 1634492771)
  {
    uint64_t v63 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v126, 0, v119, v120, v121);
  }
  else if (v60 == 1819304813)
  {
    uint64_t v63 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v127, *MEMORY[0x1E4F151F8], v123, *MEMORY[0x1E4F15218], 0);
  }
  else
  {
    v65 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v66 = *MEMORY[0x1E4F151A8];
    int v67 = [v62 containsObject:v128];
    uint64_t v68 = v129;
    if (v67) {
      uint64_t v68 = v128;
    }
    uint64_t v63 = objc_msgSend(v65, "setWithObjects:", v66, v68, v125, v124, 0);
  }
  uint64_t v69 = v63;
  v70 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v62];
  [v70 minusSet:v61];
  v71 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v69];
  [v71 intersectSet:v70];
  unint64_t v72 = [v71 count];
  if (v72 < [v70 count])
  {
    v73 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v70];
    [v73 minusSet:v71];
    uint64_t v74 = [NSString stringWithFormat:@"The following keys are not allowed when format ID is '%@': %@", AVStringForOSType(v60), objc_msgSend((id)objc_msgSend(v73, "allObjects"), "componentsJoinedByString:", @", ")];
LABEL_91:
    v135 = (__CFString *)v74;
    a4 = v130;
    v75 = inSpecifier;
LABEL_116:
    free(v75);
LABEL_179:

    goto LABEL_180;
  }
  unsigned int v76 = [v59 unsignedIntValue];
  if (!encoderExistsForFormat(v76)) {
    goto LABEL_176;
  }
  if (v53)
  {
    [v53 doubleValue];
    double v78 = v77;
    LODWORD(outPropertyData) = v76;
    ioPropertyDataSize[0] = 0;
    if (AudioFormatGetPropertyInfo(0x61657372u, 4u, &outPropertyData, ioPropertyDataSize))
    {
      v79 = 0;
    }
    else
    {
      v79 = (char *)malloc_type_malloc(ioPropertyDataSize[0], 0x17C14BADuLL);
      if (v79 && !AudioFormatGetProperty(0x61657372u, 4u, &outPropertyData, ioPropertyDataSize, v79))
      {
        double v80 = 0.0;
        if (ioPropertyDataSize[0] < 0x10) {
          goto LABEL_119;
        }
        uint64_t v81 = 0;
        double v82 = 3.40282347e38;
        while (1)
        {
          double v83 = *(double *)&v79[v81];
          double v84 = *(double *)&v79[v81 + 8];
          if (v83 == 0.0 && v84 == 0.0) {
            break;
          }
          if (v83 <= v78 && v84 >= v78) {
            break;
          }
          if (v84 >= v78)
          {
            if (v83 - v78 < v82)
            {
              double v80 = *(double *)&v79[v81];
              double v82 = v83 - v78;
            }
          }
          else if (v78 - v84 < v82)
          {
            double v80 = *(double *)&v79[v81 + 8];
            double v82 = v78 - v84;
          }
          v81 += 16;
          if ((ioPropertyDataSize[0] & 0xFFFFFFF0) == v81) {
            goto LABEL_119;
          }
        }
      }
    }
    double v80 = v78;
LABEL_119:
    free(v79);
    if (v78 != v80)
    {
      uint64_t v74 = [NSString stringWithFormat:@"%g Hz is not a valid sample rate for Format ID '%@'.  Use kAudioFormatProperty_AvailableEncodeSampleRates (<AudioToolbox/AudioFormat.h>) to enumerate available rates for a given format.", *(void *)&v78, AVStringForOSType(v76)];
      goto LABEL_91;
    }
  }
  v75 = inSpecifier;
  if (!v122) {
    goto LABEL_157;
  }
  uint64_t v86 = [v122 unsignedIntegerValue];
  ioPropertyDataSize[0] = 0;
  uint64_t v139 = 0;
  long long outPropertyData = 0u;
  long long v138 = 0u;
  DWORD2(outPropertyData) = v76;
  if (AudioFormatGetPropertyInfo(0x61766E63u, 0x28u, &outPropertyData, ioPropertyDataSize))
  {
    v87 = 0;
LABEL_156:
    free(v87);
    goto LABEL_157;
  }
  v87 = malloc_type_malloc(ioPropertyDataSize[0], 0x1DBBAE27uLL);
  if (AudioFormatGetProperty(0x61766E63u, 0x28u, &outPropertyData, ioPropertyDataSize, v87)) {
    goto LABEL_156;
  }
  LODWORD(v88) = ioPropertyDataSize[0] >> 2;
  if (ioPropertyDataSize[0] >> 2 == 1 && *v87 == -1) {
    goto LABEL_156;
  }
  if (ioPropertyDataSize[0] >= 4)
  {
    int v90 = 0;
    char v91 = 0;
    unsigned int v92 = 0;
    if (v88 <= 1) {
      uint64_t v88 = 1;
    }
    else {
      uint64_t v88 = v88;
    }
    v93 = v87;
    while (1)
    {
      unsigned int v95 = *v93++;
      unsigned int v94 = v95;
      if (v95 == v86) {
        break;
      }
      if (v94 == 1) {
        int v96 = 1;
      }
      else {
        int v96 = v90;
      }
      if (v94 == 2) {
        char v91 = 1;
      }
      else {
        int v90 = v96;
      }
      if (v94 > v92 && v94 < v86) {
        unsigned int v92 = v86;
      }
      if (!--v88)
      {
        int v98 = 2;
        goto LABEL_147;
      }
    }
    char v91 = 1;
    int v98 = v86;
    unsigned int v92 = v86;
LABEL_147:
    if (v90) {
      int v99 = 1;
    }
    else {
      int v99 = v92;
    }
    if (v91) {
      int v89 = v98;
    }
    else {
      int v89 = v99;
    }
  }
  else
  {
    int v89 = 0;
  }
  free(v87);
  if (v89 != v86)
  {
    v135 = (__CFString *)[NSString stringWithFormat:@"%d is not a valid channel count for Format ID '%@'.  Use kAudioFormatProperty_AvailableEncodeNumberChannels (<AudioToolbox/AudioFormat.h>) to enumerate available channel counts for a given format.", v86, AVStringForOSType(v76)];
    goto LABEL_115;
  }
LABEL_157:
  if (!inSpecifier) {
    goto LABEL_176;
  }
  UInt32 v100 = inSpecifierSize[0];
  LODWORD(outPropertyData) = 0;
  UInt32 outPropertyDataSize = 0;
  ioPropertyDataSize[0] = 4;
  OSStatus Property = AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], inSpecifier, ioPropertyDataSize, &outPropertyData);
  int v102 = outPropertyData;
  if (Property) {
    int v102 = 0;
  }
  long long outPropertyData = 0u;
  long long v138 = 0u;
  uint64_t v139 = 0;
  DWORD2(outPropertyData) = v76;
  HIDWORD(v138) = v102;
  if (AudioFormatGetPropertyInfo(0x6165636Cu, 0x28u, &outPropertyData, &outPropertyDataSize)) {
    goto LABEL_161;
  }
  v103 = malloc_type_malloc(outPropertyDataSize, 0x9BEB004FuLL);
  if (!v103 || AudioFormatGetProperty(0x6165636Cu, 0x28u, &outPropertyData, &outPropertyDataSize, v103))
  {
LABEL_183:
    free(v103);
LABEL_161:
    free(inSpecifier);
    a4 = v130;
    goto LABEL_177;
  }
  UInt32 v104 = outPropertyDataSize;
  int v136 = 0;
  UInt32 outPropertyDataSize = 4;
  if (AudioFormatGetProperty(0x636D7074u, v100, inSpecifier, &outPropertyDataSize, &v136)) {
    goto LABEL_184;
  }
  int v105 = v136;
  if (v104 >= 4)
  {
    LODWORD(v106) = v104 >> 2;
    if (v104 >> 2 <= 1) {
      uint64_t v106 = 1;
    }
    else {
      uint64_t v106 = v106;
    }
    v107 = (int *)v103;
    do
    {
      int v108 = *v107++;
      if (v108 == v136) {
        goto LABEL_183;
      }
    }
    while (--v106);
  }
  if (v76 != 1634754915 && v76 != 1667330147 && v76 != 1902211171)
  {
LABEL_184:
    free(v103);
LABEL_185:
    v110 = @"Unsupported encoding format";
    if (v76 == 1634754915 || v76 == 1667330147)
    {
      a4 = v130;
      v75 = inSpecifier;
    }
    else
    {
      a4 = v130;
      v75 = inSpecifier;
      if (v76 != 1902211171) {
        v110 = (__CFString *)[NSString stringWithFormat:@"Channel layout is not valid for Format ID '%@'.  Use kAudioFormatProperty_AvailableEncodeChannelLayoutTags (<AudioToolbox/AudioFormat.h>) to enumerate available channel layout tags for a given format.", AVStringForOSType(v76)];
      }
    }
    v135 = v110;
    goto LABEL_116;
  }
  free(v103);
  if (v105 != -266338299) {
    goto LABEL_185;
  }
LABEL_176:
  free(inSpecifier);
  a4 = v130;
  if ((v19 & 1) == 0) {
    goto LABEL_179;
  }
LABEL_177:
  result = v131;
  if (!a4) {
    return result;
  }
LABEL_181:
  *a4 = v135;
  return result;
}

- (AVAVAudioSettingsAudioOutputSettings)initWithTrustedAVAudioSettingsDictionary:(id)a3
{
  return [(AVAudioOutputSettings *)self initWithAudioSettingsDictionary:a3 exceptionReason:0];
}

- (BOOL)willYieldCompressedSamples
{
  v2 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
  return objc_msgSend(-[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x1E4F151E0]), "unsignedIntValue") != 1819304813;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  v4 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
  id v5 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F151E0]];
  char v6 = encoderExistsForFormat([v5 unsignedIntValue]);
  if ((v6 & 1) == 0)
  {
    v7 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11834, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"soun", @"AVErrorMediaTypeKey", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v5, 0), @"AVErrorMediaSubTypeKey", 0));
    if (a3) {
      *a3 = v7;
    }
  }
  return v6;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
  uint64_t v5 = *MEMORY[0x1E4F151E0];
  uint64_t v6 = *MEMORY[0x1E4F15198];
  v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", *MEMORY[0x1E4F151E0], *MEMORY[0x1E4F15270], *MEMORY[0x1E4F15198], 0);
  int v8 = objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", v5), "unsignedIntValue");
  id v9 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F15228]];
  if (v9 && (unint64_t)([v9 integerValue] - 1) <= 1) {
    [v7 removeObject:v6];
  }
  if (v8 == 1634492771)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F151B0], 0, v19, v20, v21);
  }
  else
  {
    if (v8 != 1819304813) {
      goto LABEL_9;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F151F0], *MEMORY[0x1E4F151F8], *MEMORY[0x1E4F15208], *MEMORY[0x1E4F15218], 0);
  }
  [v7 unionSet:v10];
LABEL_9:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (![(NSDictionary *)v4 objectForKey:v15])
        {
          uint64_t v17 = [NSString stringWithFormat:@"Missing required key %@", v15];
          if (!a3) {
            return 0;
          }
          uint64_t v18 = (void *)v17;
          BOOL result = 0;
          *a3 = v18;
          return result;
        }
      }
      uint64_t v12 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)getAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3 forAudioFileTypeID:(unsigned int)a4 sourceFormatDescription:(opaqueCMFormatDescription *)a5
{
  uint64_t v70 = 0;
  long long outPropertyData = 0u;
  long long v69 = 0u;
  if (!a5)
  {
    uint64_t v11 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
    StreamBasicDescription = 0;
    goto LABEL_5;
  }
  RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(a5);
  if (!RichestDecodableFormat)
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a5);
    uint64_t v11 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
    if (StreamBasicDescription) {
      goto LABEL_7;
    }
LABEL_5:
    BOOL v12 = 0;
    char v13 = 1;
    goto LABEL_8;
  }
  StreamBasicDescription = &RichestDecodableFormat->mASBD;
  uint64_t v11 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
LABEL_7:
  char v13 = 0;
  BOOL v12 = StreamBasicDescription->mFormatID == 1819304813;
LABEL_8:
  int v14 = objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E4F151E0]), "unsignedIntValue");
  DWORD2(outPropertyData) = v14;
  if (v14 == 1634492771)
  {
    uint64_t v17 = objc_msgSend(-[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E4F151B0]), "integerValue");
    if ((v13 & 1) == 0 && StreamBasicDescription->mFormatID == 1819304813)
    {
      uint64_t mBitsPerChannel = StreamBasicDescription->mBitsPerChannel;
      if mBitsPerChannel == 32 && (StreamBasicDescription->mFormatFlags) {
        uint64_t mBitsPerChannel = 24;
      }
      if (v17 > mBitsPerChannel || v17 == 0) {
        uint64_t v17 = mBitsPerChannel;
      }
    }
    goto LABEL_28;
  }
  if (v14 != 1819304813)
  {
    uint64_t v17 = 0;
LABEL_28:
    *((void *)&v21 + 1) = v17;
    *(void *)&long long v21 = v17 - 16;
    unint64_t v20 = v21 >> 2;
    if (v20 > 4) {
      int v22 = 0;
    }
    else {
      int v22 = dword_194C5FEA8[v20];
    }
    DWORD2(v69) = 0;
    *(void *)&long long v69 = 0;
    HIDWORD(outPropertyData) = v22;
    goto LABEL_115;
  }
  desc[0] = 0;
  if (v12) {
    char v15 = 1;
  }
  else {
    char v15 = v13;
  }
  if ((v15 & 1) == 0)
  {
    CFArrayRef v23 = (const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObject:a5];
    CMAudioFormatDescriptionCreateSummary((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v23, 0, desc);
    long long v24 = CMAudioFormatDescriptionGetStreamBasicDescription(desc[0]);
    int v25 = HIDWORD(outPropertyData);
LABEL_39:
    HIDWORD(outPropertyData) = v25 | 8;
    goto LABEL_41;
  }
  if (a5) {
    v16 = (const opaqueCMFormatDescription *)CFRetain(a5);
  }
  else {
    v16 = 0;
  }
  desc[0] = v16;
  if (v12) {
    char v26 = v13;
  }
  else {
    char v26 = 1;
  }
  if (v26)
  {
    int v25 = 0;
    long long v24 = StreamBasicDescription;
    goto LABEL_39;
  }
  HIDWORD(outPropertyData) = StreamBasicDescription->mFormatFlags & 0x18;
  long long v24 = StreamBasicDescription;
LABEL_41:
  id v27 = -[NSDictionary objectForKey:](v11, "objectForKey:", *MEMORY[0x1E4F15218], desc[0]);
  if (v27)
  {
    int v28 = [v27 BOOLValue];
    int v29 = HIDWORD(outPropertyData);
    if (v28)
    {
      unsigned int v30 = HIDWORD(outPropertyData) | 0x20;
LABEL_47:
      HIDWORD(outPropertyData) = v30;
      goto LABEL_48;
    }
LABEL_46:
    unsigned int v30 = v29 & 0xFFFFFFDF;
    goto LABEL_47;
  }
  if (a4)
  {
    int v29 = HIDWORD(outPropertyData);
    goto LABEL_46;
  }
  if (v24)
  {
    unsigned int v30 = HIDWORD(outPropertyData) | v24->mFormatFlags & 0x20;
    goto LABEL_47;
  }
LABEL_48:
  id v31 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F151F8]];
  if (v31)
  {
    int v32 = [v31 BOOLValue];
    int v33 = HIDWORD(outPropertyData);
    if (!v32) {
      goto LABEL_59;
    }
LABEL_55:
    unsigned int v34 = v33 | 2;
LABEL_60:
    HIDWORD(outPropertyData) = v34;
    goto LABEL_61;
  }
  if ((int)a4 > 1380333107)
  {
    if (a4 == 1380333108 || a4 == 1463899717)
    {
      int v33 = HIDWORD(outPropertyData);
LABEL_59:
      unsigned int v34 = v33 & 0xFFFFFFFD;
      goto LABEL_60;
    }
  }
  else if (a4 == 1095321155 || a4 == 1095321158)
  {
    int v33 = HIDWORD(outPropertyData);
    goto LABEL_55;
  }
  if (v24)
  {
    unsigned int v34 = HIDWORD(outPropertyData) | v24->mFormatFlags & 2;
    goto LABEL_60;
  }
LABEL_61:
  id v35 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F15208]];
  if (v35)
  {
    if ([v35 BOOLValue])
    {
      unsigned int v36 = HIDWORD(outPropertyData) & 0xFFFFFFFA | 1;
      goto LABEL_82;
    }
    BOOL v38 = a4 == 1380333108 || a4 == 1463899717;
    unsigned int v36 = HIDWORD(outPropertyData) & 0xFFFFFFFA;
    if (v38 && v70 == 8) {
      goto LABEL_82;
    }
LABEL_77:
    v36 |= 4u;
    goto LABEL_82;
  }
  if ((v13 & 1) == 0 && StreamBasicDescription->mFormatID == 1634492771)
  {
    HIDWORD(outPropertyData) = HIDWORD(outPropertyData) & 0xFFFFFFFA | 4;
    id v37 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F151F0]];
    if (v37)
    {
LABEL_84:
      LODWORD(v70) = [v37 unsignedIntegerValue];
      goto LABEL_113;
    }
    goto LABEL_86;
  }
  if (a4 == 1095321158)
  {
    unsigned int v36 = HIDWORD(outPropertyData) & 0xFFFFFFFE;
    goto LABEL_77;
  }
  if (!v24) {
    goto LABEL_83;
  }
  HIDWORD(outPropertyData) |= v24->mFormatFlags & 1;
  unsigned int v36 = v24->mFormatFlags & 4 | HIDWORD(outPropertyData);
LABEL_82:
  HIDWORD(outPropertyData) = v36;
LABEL_83:
  id v37 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F151F0]];
  if (v37) {
    goto LABEL_84;
  }
  if ((v13 & 1) == 0)
  {
LABEL_86:
    if (StreamBasicDescription->mFormatID == 1634492771)
    {
      switch(StreamBasicDescription->mFormatFlags)
      {
        case 1u:
          goto LABEL_88;
        case 2u:
          int v39 = 20;
          goto LABEL_112;
        case 3u:
          goto LABEL_111;
        case 4u:
          goto LABEL_109;
        default:
          goto LABEL_113;
      }
      goto LABEL_113;
    }
  }
  if (!v24) {
    goto LABEL_113;
  }
  LODWORD(v70) = v24->mBitsPerChannel;
  if ((int)a4 > 1380333107)
  {
    if (a4 == 1463899717) {
      goto LABEL_96;
    }
    int v40 = 1380333108;
  }
  else
  {
    if (a4 == 1095321155) {
      goto LABEL_96;
    }
    int v40 = 1095321158;
  }
  if (a4 != v40) {
    goto LABEL_113;
  }
LABEL_96:
  HIDWORD(outPropertyData) = HIDWORD(outPropertyData) & 0xFFFFFFE7 | 8;
  if (v24->mFormatFlags)
  {
    if (a4 == 1095321158) {
      goto LABEL_111;
    }
  }
  else
  {
    if (a4 == 1095321155 || a4 == 1463899717 || a4 == 1380333108)
    {
      unsigned int v41 = v24->mBitsPerChannel;
      if (v41 >= 0x40)
      {
        int v39 = 64;
        goto LABEL_112;
      }
    }
    else
    {
      unsigned int v41 = v24->mBitsPerChannel;
    }
    if (v41 >= 0x20)
    {
LABEL_109:
      int v39 = 32;
      goto LABEL_112;
    }
    if (v41 >= 0x18)
    {
LABEL_111:
      int v39 = 24;
      goto LABEL_112;
    }
    if (v41 >= 0x10)
    {
LABEL_88:
      int v39 = 16;
LABEL_112:
      LODWORD(v70) = v39;
      goto LABEL_113;
    }
    if (v41 >= 8)
    {
      int v39 = 8;
      goto LABEL_112;
    }
  }
LABEL_113:
  DWORD1(v69) = 1;
  if (desc[0]) {
    CFRelease(desc[0]);
  }
LABEL_115:
  id v42 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F15228]];
  *(void *)inSpecifierSize = 0;
  uint64_t v43 = copyAudioChannelLayoutFromData([(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F15198]], (unint64_t *)inSpecifierSize);
  v44 = v43;
  if (v42) {
    BOOL v45 = 1;
  }
  else {
    BOOL v45 = v43 == 0;
  }
  if (!v45)
  {
    uint64_t v46 = (void *)MEMORY[0x1E4F28ED0];
    LODWORD(desc[0]) = 0;
    UInt32 ioPropertyDataSize = 4;
    if (AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], v43, &ioPropertyDataSize, desc)) {
      uint64_t v47 = 0;
    }
    else {
      uint64_t v47 = LODWORD(desc[0]);
    }
    id v42 = (id)[v46 numberWithInteger:v47];
  }
  id v48 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F15270]];
  uint64_t v49 = [(NSDictionary *)v11 objectForKey:*MEMORY[0x1E4F151C0]];
  if (v13)
  {
    uint64_t v51 = 0;
  }
  else
  {
    v52 = (void *)v49;
    uint64_t v51 = objc_alloc_init(AVAudioSettingsValueConstrainer);
    long long v53 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
    long long v54 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
    uint64_t v66 = *(void *)&StreamBasicDescription->mBitsPerChannel;
    *(_OWORD *)desc = v53;
    long long v65 = v54;
    [(AVAudioSettingsValueConstrainer *)v51 setInputPropertiesFromASBD:desc];
    [(AVAudioSettingsValueConstrainer *)v51 setOutputFormat:DWORD2(outPropertyData)];
    [(AVAudioSettingsValueConstrainer *)v51 setOutputFormatFlags:HIDWORD(outPropertyData)];
    [(AVAudioSettingsValueConstrainer *)v51 setOutputBitsPerChannel:v70];
    if (v48)
    {
      [v48 doubleValue];
      *(float *)&double v55 = v55;
      [(AVAudioSettingsValueConstrainer *)v51 setOutputSampleRate:v55];
    }
    if (v42) {
      -[AVAudioSettingsValueConstrainer setOutputChannelCount:](v51, "setOutputChannelCount:", [v42 unsignedIntegerValue]);
    }
    if (v52) {
      -[AVAudioSettingsValueConstrainer setOutputDataRate:](v51, "setOutputDataRate:", [v52 unsignedIntegerValue]);
    }
  }
  if (v42)
  {
    HIDWORD(v69) = [v42 unsignedIntegerValue];
  }
  else
  {
    if (a4 == 1634562662)
    {
      HIDWORD(v69) = 1;
      if (v48) {
        goto LABEL_134;
      }
LABEL_139:
      *(void *)&long long outPropertyData = 0x40BF400000000000;
      goto LABEL_140;
    }
    if ((v13 & 1) == 0)
    {
      uint64_t v59 = [(AVAudioSettingsValueConstrainer *)v51 availableOutputChannelCountForDesiredChannelCount:StreamBasicDescription->mChannelsPerFrame rounding:-1];
      HIDWORD(v69) = v59;
      [(AVAudioSettingsValueConstrainer *)v51 setOutputChannelCount:v59];
    }
  }
  if (v48)
  {
LABEL_134:
    [v48 doubleValue];
    *(void *)&long long outPropertyData = v50;
    goto LABEL_140;
  }
  if (a4 == 1634562662) {
    goto LABEL_139;
  }
  if ((v13 & 1) == 0)
  {
    double mSampleRate = StreamBasicDescription->mSampleRate;
    *(float *)&double mSampleRate = StreamBasicDescription->mSampleRate;
    [(AVAudioSettingsValueConstrainer *)v51 applicableOutputSampleRateForDesiredSampleRate:1 rounding:mSampleRate];
    *(double *)&long long outPropertyData = v63;
    -[AVAudioSettingsValueConstrainer setOutputSampleRate:](v51, "setOutputSampleRate:");
  }
LABEL_140:
  if (DWORD2(outPropertyData) == 1819304813)
  {
    if ((BYTE12(outPropertyData) & 8) != 0)
    {
      LODWORD(v50) = v70;
      unsigned int mBytesPerFrame = vcvtpd_u64_f64((double)v50 * 0.125);
    }
    else
    {
      if (v12) {
        char v56 = v13;
      }
      else {
        char v56 = 1;
      }
      if ((v56 & 1) != 0 || (AudioFormatFlags mFormatFlags = StreamBasicDescription->mFormatFlags, (mFormatFlags & 8) != 0))
      {
        unsigned int mBytesPerFrame = ((v70 >> 3) + 3) & 0x3FFFFFFC;
      }
      else
      {
        unsigned int mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
        if ((mFormatFlags & 0x20) == 0) {
          mBytesPerFrame /= StreamBasicDescription->mChannelsPerFrame;
        }
      }
    }
    if ((BYTE12(outPropertyData) & 0x20) != 0) {
      int v60 = 1;
    }
    else {
      int v60 = HIDWORD(v69);
    }
    LODWORD(v69) = mBytesPerFrame * v60;
    DWORD2(v69) = mBytesPerFrame * v60;
  }
  free(v44);
  LODWORD(desc[0]) = 40;
  AudioFormatGetProperty(0x666D7469u, 0, 0, (UInt32 *)desc, &outPropertyData);
  if (a3)
  {
    long long v61 = v69;
    *(_OWORD *)&a3->double mSampleRate = outPropertyData;
    *(_OWORD *)&a3->mBytesPerPacket = v61;
    *(void *)&a3->uint64_t mBitsPerChannel = v70;
  }
}

- (AudioChannelLayout)copyAudioChannelLayoutForSourceFormatDescription:(opaqueCMFormatDescription *)a3 audioChannelLayoutSize:(unint64_t *)a4
{
  unint64_t v18 = 0;
  uint64_t v6 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
  id v7 = [(NSDictionary *)v6 objectForKey:*MEMORY[0x1E4F15198]];
  id v8 = [(NSDictionary *)v6 objectForKey:*MEMORY[0x1E4F15228]];
  if (v7)
  {
    id v9 = copyAudioChannelLayoutFromData(v7, &v18);
LABEL_3:
    uint64_t v10 = (AudioChannelLayout *)v9;
    goto LABEL_4;
  }
  BOOL v12 = v8;
  if (a3)
  {
    *(void *)inSpecifierSize = 0;
    uint64_t v10 = (AudioChannelLayout *)AVCopyBestAudioChannelLayoutFromFormatDescription(a3, (size_t *)inSpecifierSize);
    if (!v10 || !v12) {
      goto LABEL_13;
    }
    unsigned int v13 = [v12 unsignedIntegerValue];
    UInt32 ioPropertyDataSize = 4;
    int outPropertyData = 0;
    OSStatus Property = AudioFormatGetProperty(0x6E63686Du, inSpecifierSize[0], v10, &ioPropertyDataSize, &outPropertyData);
    int v15 = outPropertyData;
    if (Property) {
      int v15 = 0;
    }
    if (v15 != v13)
    {
      v16 = (AudioChannelLayout *)copyDefaultChannelLayoutForChannelCount(v13, (uint64_t *)&v18);
      free(v10);
      uint64_t v10 = v16;
    }
    else
    {
LABEL_13:
      unint64_t v18 = *(void *)inSpecifierSize;
    }
  }
  else
  {
    if (v8)
    {
      id v9 = copyDefaultChannelLayoutForChannelCount([v8 integerValue], (uint64_t *)&v18);
      goto LABEL_3;
    }
    uint64_t v10 = 0;
  }
LABEL_4:
  if (a4) {
    *a4 = v18;
  }
  return v10;
}

- (id)audioOptions
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(AVAudioOutputSettings *)self audioSettingsDictionary];
  uint64_t v5 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F151C0]];
  uint64_t v6 = (void *)MEMORY[0x1E4F32600];
  if (v5) {
    [v3 setObject:v5 forKey:*MEMORY[0x1E4F32600]];
  }
  uint64_t v7 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F151A8]];
  if (v7) {
    [v3 setObject:v7 forKey:*MEMORY[0x1E4F32620]];
  }
  id v8 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F151C8]];
  uint64_t v9 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F15228]];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = (void *)v9;
    uint64_t v12 = [v8 integerValue];
    uint64_t v13 = [v11 integerValue];
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", v13 * v12), *v6);
  }
  id v14 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F151D0]];
  if (v14)
  {
    int v15 = v14;
    v16 = (void *)MEMORY[0x1E4F28ED0];
    if ([v14 isEqualToString:*MEMORY[0x1E4F14F38]])
    {
      uint64_t v17 = 0;
    }
    else if ([v15 isEqualToString:*MEMORY[0x1E4F14F40]])
    {
      uint64_t v17 = 1;
    }
    else if ([v15 isEqualToString:*MEMORY[0x1E4F14F48]])
    {
      uint64_t v17 = 3;
    }
    else
    {
      if (([v15 isEqualToString:*MEMORY[0x1E4F14F50]] & 1) == 0) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unrecognized bit rate strategy" userInfo:0]);
      }
      uint64_t v17 = 2;
    }
    uint64_t v18 = [v16 numberWithUnsignedInteger:v17];
    [v3 setObject:v18 forKey:*MEMORY[0x1E4F32618]];
  }
  uint64_t v19 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F151A0]];
  if (v19) {
    [v3 setObject:v19 forKey:*MEMORY[0x1E4F32638]];
  }
  id v20 = [(NSDictionary *)v4 objectForKey:*MEMORY[0x1E4F15238]];
  if (v20)
  {
    long long v21 = v20;
    int v22 = (void *)MEMORY[0x1E4F28ED0];
    if ([v20 isEqualToString:*MEMORY[0x1E4F15258]])
    {
      uint64_t v23 = 1852797549;
    }
    else if ([v21 isEqualToString:*MEMORY[0x1E4F15248]])
    {
      uint64_t v23 = 1650553971;
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v24 = [v22 numberWithUnsignedInt:v23];
    [v3 setObject:v24 forKey:*MEMORY[0x1E4F32608]];
  }
  [(AVAVAudioSettingsAudioOutputSettings *)self willYieldCompressedSamples];
  return v3;
}

@end