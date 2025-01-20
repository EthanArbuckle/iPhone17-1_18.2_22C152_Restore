uint64_t autoloopSettingsDestroy(uint64_t result)
{
  uint64_t v1;
  uint64_t vars8;

  if (result)
  {
    v1 = *(void *)(result + 240);
    if (v1) {
      MEMORY[0x1E01B4150](v1, 0x1000C40D4159EFELL);
    }
    JUMPOUT(0x1E01B4150);
  }
  return result;
}

uint64_t sub_1DD3A73F0@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, CMTime *a5@<X8>)
{
  v10 = (CMTime *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)&a5->value = *MEMORY[0x1E4F1FA48];
  a5->epoch = v10->epoch;
  if (a2)
  {
    CMTime v23 = *v10;
    CMTime v22 = *(CMTime *)(a1 + 120);
    CMTimeMaximum(&v24, &v23, &v22);
    *a5 = v24;
    if (!a3)
    {
LABEL_3:
      if (!a4) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_3;
  }
  CMTime v21 = *a5;
  CMTime v20 = *(CMTime *)(a1 + 248);
  CMTimeMaximum(&v24, &v21, &v20);
  *a5 = v24;
  if (a4)
  {
LABEL_4:
    CMTime time1 = *a5;
    CMTime time2 = *(CMTime *)(a1 + 320);
    CMTimeMaximum(&v24, &time1, &time2);
    *a5 = v24;
  }
LABEL_5:
  CMTime v17 = *a5;
  CMTime v16 = *v10;
  uint64_t result = CMTimeCompare(&v17, &v16);
  if ((result & 0x80000000) != 0)
  {
    *(_OWORD *)&a5->value = *(_OWORD *)&v10->value;
    a5->epoch = v10->epoch;
    if (!a2) {
      return result;
    }
  }
  else if (!a2)
  {
    return result;
  }
  CMTimeValue v12 = *(void *)(a1 + 120);
  CMTimeScale v13 = *(_DWORD *)(a1 + 128);
  CMTime v15 = *a5;
  v14.value = v12;
  v14.timescale = v13;
  *(void *)&v14.flags = *(void *)(a1 + 132);
  HIDWORD(v14.epoch) = *(_DWORD *)(a1 + 140);
  uint64_t result = CMTimeCompare(&v15, &v14);
  if (result) {
    return printf("WARNING: MIN REQUIRED INPUT LENGTH INCREASED BY BOUNCE AND/OR LONG EXPOSURE SETTINGS TO %lld/%d (AutoLoop requires %lld/%d)\n.", a5->value, a5->timescale, v12, v13);
  }
  return result;
}

void create_default_internal_autoloopSettings()
{
}

double sub_1DD3A763C(uint64_t a1, CMTime *a2)
{
  *(unsigned char *)(a1 + 368) = 1;
  memset(&v15, 0, sizeof(v15));
  CMTimeMake(&time1, 80, 600);
  CMTime time2 = *a2;
  CMTimeMinimum(&v15, &time1, &time2);
  CMTime lhs = *a2;
  CMTime rhs = v15;
  CMTimeSubtract(&v12, &lhs, &rhs);
  *(CMTime *)(a1 + 120) = v12;
  uint64_t v4 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)(a1 + 168) = *MEMORY[0x1E4F1FA48];
  *(void *)(a1 + 184) = *(void *)(v4 + 16);
  *(_DWORD *)(a1 + 192) = 0;
  CMTime v9 = *a2;
  CMTime v8 = v15;
  CMTimeSubtract(&v12, &v9, &v8);
  *(CMTime *)(a1 + 248) = v12;
  *(_OWORD *)(a1 + 296) = *(_OWORD *)v4;
  *(void *)(a1 + 312) = *(void *)(v4 + 16);
  CMTime v7 = *a2;
  CMTime v6 = v15;
  CMTimeSubtract(&v12, &v7, &v6);
  double result = *(double *)&v12.value;
  *(CMTime *)(a1 + 320) = v12;
  return result;
}

void get_default_autoloopSettings_0()
{
}

void createAutoLoopSettingsForAsset(void *a1)
{
  id v1 = a1;
  get_default_autoloopSettings_0();
}

void sub_1DD3A7ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t validateInputVideoAndGetDuration(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(_OWORD *)a2 = *MEMORY[0x1E4F1F9F8];
  *(void *)(a2 + 16) = v4;
  uint64_t v5 = sub_1DD3A7D2C(v3, &v16);
  if (!v5)
  {
    CMTime time1 = v16;
    CMTime v6 = (CMTime *)MEMORY[0x1E4F1FA48];
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    if (CMTimeCompare(&time1, &time2) < 1)
    {
      CMTime v13 = v17;
      CMTime v12 = *v6;
      if (CMTimeCompare(&v13, &v12) <= 0)
      {
        NSLog(&cfstr_InputVideoDura.isa);
      }
      else
      {
        CMTime v11 = v17;
        getMinimumSafeInputDuration_0(&v10);
        if (CMTimeCompare(&v11, &v10) > 0)
        {
          uint64_t v5 = 0;
          *(CMTime *)a2 = v17;
          goto LABEL_10;
        }
        getMinimumSafeInputDuration_0(&time);
        Float64 Seconds = CMTimeGetSeconds(&time);
        NSLog(&cfstr_InputVideoDura_0.isa, *(void *)&Seconds);
      }
      uint64_t v5 = 7;
      goto LABEL_10;
    }
    NSLog(&cfstr_VideoTrackDoes.isa);
    uint64_t v5 = 5;
  }
LABEL_10:

  return v5;
}

void sub_1DD3A7C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t createBundleDefaultGatingClassifierURL()
{
  v0 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.acg.AutoLoop"];
  uint64_t v1 = [v0 URLForResource:@"gatingClassifier" withExtension:@"plist"];

  return v1;
}

void sub_1DD3A7CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getGatingOptionFlagsForSuggestions()
{
  return 7;
}

uint64_t getGatingOptionFlagsForDiagnostics()
{
  return 23;
}

uint64_t autoloopSettingsSetGating(uint64_t result, uint64_t a2, uint64_t a3, char a4, int a5)
{
  if (result)
  {
    *(void *)(result + 224) = a3;
    *(void *)(result + 232) = a2;
    *(unsigned char *)(result + 216) = a4;
    uint64_t v5 = 7;
    if (a5) {
      uint64_t v5 = 23;
    }
    *(void *)(result + 208) = v5;
  }
  return result;
}

uint64_t autoloopSettingsSetRecipeProviderCallback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 392) = a2;
  return result;
}

uint64_t autoloopSettingsSetGatingFeaturesProviderCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 400) = a2;
  *(void *)(result + 408) = a3;
  return result;
}

uint64_t autoloopSettingsSetLongerBounce(uint64_t result, int a2)
{
  *(_DWORD *)(result + 372) = a2;
  return result;
}

uint64_t autoloopSettingsSetOptimizeForMemoryUse(uint64_t result, char a2)
{
  *(unsigned char *)(result + 206) = a2;
  return result;
}

uint64_t autoloopSettingsSetDisableStabilizationGPU(uint64_t result, char a2)
{
  *(unsigned char *)(result + 205) = a2;
  return result;
}

uint64_t sub_1DD3A7D2C(void *a1, _OWORD *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    CMTime v6 = v5;
    if (v5 && [v5 count])
    {
      CMTime v7 = [v6 objectAtIndex:0];
      CMTime v8 = v7;
      if (v7)
      {
        [v7 timeRange];
        uint64_t v9 = 0;
        *a2 = v11;
        a2[1] = v12;
        a2[2] = v13;
      }
      else
      {
        NSLog(&cfstr_MissingInputAs_0.isa);
        uint64_t v9 = 5;
      }
    }
    else
    {
      NSLog(&cfstr_MissingInputAs_0.isa);
      uint64_t v9 = 5;
    }
  }
  else
  {
    NSLog(&cfstr_MissingInputAs.isa);
    uint64_t v9 = 5;
  }

  return v9;
}

void sub_1DD3A7E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3A7E54(void *a1, void *a2, uint64_t a3, int *a4, CMTime *a5)
{
  id v9 = a2;
  CMTime v10 = v9;
  if (!a1) {
    goto LABEL_46;
  }
  uint64_t v11 = sub_1DD3A7D2C(v9, &v65);
  if (v11) {
    goto LABEL_47;
  }
  char v12 = 0;
  char v13 = 0;
  char v14 = 0;
  if (a3)
  {
    char v15 = 1;
    do
    {
      int v16 = *a4++;
      switch(v16)
      {
        case 0:
          char v14 = 1;
          break;
        case 1:
          char v13 = 1;
          break;
        case 2:
          char v12 = 1;
          break;
        case 3:
          break;
        default:
          char v15 = 0;
          break;
      }
      --a3;
    }
    while (a3);
    if ((v15 & 1) == 0) {
      goto LABEL_46;
    }
  }
  sub_1DD3A73F0((uint64_t)a1, v14 & 1, v13 & 1, v12 & 1, &v51.start);
  *(_OWORD *)&a5->value = *(_OWORD *)&v51.start.value;
  a5->epoch = v51.start.epoch;
  memset(&v64, 0, sizeof(v64));
  getMinimumSafeInputDuration_0(&v64);
  CMTime time1 = v65.duration;
  CMTime time2 = *a5;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    NSLog(&cfstr_InputVideoTrac.isa, v65.duration.value, v65.duration.timescale);
LABEL_32:
    uint64_t v11 = 7;
    goto LABEL_47;
  }
  CMTime v61 = v65.duration;
  CMTime v60 = v64;
  if (CMTimeCompare(&v61, &v60) < 0)
  {
    NSLog(&cfstr_InputVideoTrac_0.isa, v65.duration.value, v65.duration.timescale);
    goto LABEL_32;
  }
  if (*((unsigned char *)a1 + 368)) {
    NSLog(&cfstr_WarningUsingSh.isa, v65.duration.value, v65.duration.timescale);
  }
  CMTime v59 = *(CMTime *)((unsigned char *)a1 + 6);
  CMTime v17 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime v58 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&v59, &v58) < 1) {
    goto LABEL_46;
  }
  v18 = a1 + 18;
  CMTime v57 = *(CMTime *)((unsigned char *)a1 + 6);
  CMTime v56 = *(CMTime *)((unsigned char *)a1 + 5);
  if (CMTimeCompare(&v57, &v56) < 0) {
    goto LABEL_46;
  }
  CMTimeRange range = v65;
  CMTime time = *(CMTime *)((unsigned char *)a1 + 3);
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    NSLog(&cfstr_TrimStartLldDO.isa, a1[9], *((unsigned int *)a1 + 20));
LABEL_39:
    uint64_t v11 = 12;
    goto LABEL_47;
  }
  v19 = a1 + 12;
  if ((*((_DWORD *)a1 + 27) & 0x1D) == 1)
  {
    *(_OWORD *)&v53.value = *v19;
    v53.epoch = a1[14];
    CMTime v52 = *v17;
    if (CMTimeCompare(&v53, &v52) <= 0)
    {
      NSLog(&cfstr_TrimLengthZero.isa);
      goto LABEL_39;
    }
  }
  CMTimeRange v50 = v65;
  memset(&v51, 0, sizeof(v51));
  CMTime start = *(CMTime *)((unsigned char *)a1 + 3);
  *(_OWORD *)&duration.value = *v19;
  duration.epoch = a1[14];
  CMTimeRangeMake(&otherRange, &start, &duration);
  CMTimeRangeGetIntersection(&v51, &v50, &otherRange);
  CMTime v46 = v51.duration;
  CMTime v44 = v64;
  CMTime v43 = *a5;
  CMTimeMaximum(&v45, &v44, &v43);
  if (CMTimeCompare(&v46, &v45) < 0)
  {
    NSLog(&cfstr_TrimLengthLldD.isa, v51.duration.value, v51.duration.timescale);
    goto LABEL_39;
  }
  if ((~*((_DWORD *)a1 + 3) & 0x11) != 0)
  {
    CMTimeRange v42 = v51;
    CMTime v41 = *(CMTime *)a1;
    if (!CMTimeRangeContainsTime(&v42, &v41))
    {
      NSLog(&cfstr_ReferenceTimeL.isa, *a1, *((unsigned int *)a1 + 2));
      goto LABEL_46;
    }
  }
  if ((*((unsigned char *)a1 + 36) & 1) != 0 && (*((unsigned char *)a1 + 60) & 1) != 0 && !a1[8] && (a1[6] & 0x8000000000000000) == 0)
  {
    long long v21 = *(_OWORD *)(a1 + 5);
    *(_OWORD *)&v40.start.value = *(_OWORD *)(a1 + 3);
    *(_OWORD *)&v40.start.epoch = v21;
    *(_OWORD *)&v40.duration.timescale = *(_OWORD *)(a1 + 7);
    if ((*((_DWORD *)a1 + 3) & 0x1D) == 1)
    {
      long long v22 = *(_OWORD *)(a1 + 5);
      *(_OWORD *)&v38.start.value = *(_OWORD *)(a1 + 3);
      *(_OWORD *)&v38.start.epoch = v22;
      *(_OWORD *)&v38.duration.timescale = *(_OWORD *)(a1 + 7);
      CMTime v36 = *(CMTime *)a1;
      CMTime v35 = *v17;
      CMTimeRangeMake(&v37, &v36, &v35);
      CMTimeRangeGetUnion(&v39, &v38, &v37);
      CMTimeRange v40 = v39;
    }
    CMTimeRange v34 = v51;
    CMTimeRange v33 = v40;
    if (!CMTimeRangeContainsTimeRange(&v34, &v33))
    {
      NSLog(&cfstr_RequiredRangeO.isa);
      goto LABEL_46;
    }
    CMTime v32 = v40.duration;
    *(_OWORD *)&v30.value = *v18;
    v30.epoch = a1[20];
    CMTime v29 = *(CMTime *)(a1 + 34);
    CMTimeMinimum(&v31, &v30, &v29);
    if (CMTimeCompare(&v32, &v31) >= 1)
    {
      NSLog(&cfstr_EffectiveRequi.isa);
      goto LABEL_46;
    }
  }
  if (v14)
  {
    CMTime v28 = *(CMTime *)((unsigned char *)a1 + 5);
    *(_OWORD *)&v27.value = *v18;
    v27.epoch = a1[20];
    if (CMTimeCompare(&v28, &v27) > 0)
    {
      NSLog(&cfstr_InvalidSetting.isa);
LABEL_46:
      uint64_t v11 = 11;
      goto LABEL_47;
    }
  }
  if (v13)
  {
    CMTime v26 = *(CMTime *)(a1 + 31);
    CMTime v25 = *(CMTime *)(a1 + 34);
    if (CMTimeCompare(&v26, &v25) > 0)
    {
      NSLog(&cfstr_InvalidSetting_0.isa);
      goto LABEL_46;
    }
  }
  if (v12)
  {
    CMTime v24 = *(CMTime *)(a1 + 40);
    CMTime v23 = *(CMTime *)(a1 + 43);
    if (CMTimeCompare(&v24, &v23) >= 1)
    {
      NSLog(&cfstr_InvalidSetting_1.isa);
      goto LABEL_46;
    }
  }
  uint64_t v11 = 0;
LABEL_47:

  return v11;
}

void sub_1DD3A84A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void autoloopSettingsSetPointOfInterestAndTrim(uint64_t a1, long long *a2, CMTime *a3, CMTime *a4, void *a5, int *a6)
{
  id v11 = a5;
  *a6 = 0;
  if ((a3->flags & 0x1D) != 1) {
    goto LABEL_16;
  }
  CMTime time1 = *a3;
  char v12 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2) < 0) {
    goto LABEL_16;
  }
  if ((a4->flags & 0x1D) != 1) {
    goto LABEL_16;
  }
  CMTime v41 = *a4;
  CMTime v40 = *v12;
  if (CMTimeCompare(&v41, &v40) <= 0) {
    goto LABEL_16;
  }
  CMTime v39 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  if (v11) {
    int Duration = validateInputVideoAndGetDuration(v11, (uint64_t)&v39);
  }
  else {
    int Duration = 5;
  }
  *a6 = Duration;
  memset(&v38, 0, sizeof(v38));
  sub_1DD3A73F0(a1, 1, 1, 1, &v38);
  if (*a6) {
    goto LABEL_18;
  }
  CMTime v37 = v39;
  CMTime v36 = v38;
  if (CMTimeCompare(&v37, &v36) < 0)
  {
    int v20 = 7;
    goto LABEL_17;
  }
  if (*a6) {
    goto LABEL_18;
  }
  long long v14 = *(_OWORD *)&a3->value;
  *(void *)(a1 + 88) = a3->epoch;
  *(_OWORD *)(a1 + 72) = v14;
  long long v15 = *(_OWORD *)&a4->value;
  *(void *)(a1 + 112) = a4->epoch;
  *(_OWORD *)(a1 + 96) = v15;
  long long v16 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v16;
  memset(&v35, 0, sizeof(v35));
  CMTime v34 = v39;
  long long v17 = *(_OWORD *)&a4->value;
  v32.epoch = a4->epoch;
  *(_OWORD *)&v32.value = v17;
  long long v18 = *(_OWORD *)&v12->value;
  v30.epoch = v12->epoch;
  *(_OWORD *)&v30.value = v18;
  CMTime lhs = v39;
  long long v19 = *(_OWORD *)&a3->value;
  rhs.epoch = a3->epoch;
  *(_OWORD *)&rhs.value = v19;
  CMTimeSubtract(&v29, &lhs, &rhs);
  CMTimeMaximum(&v31, &v30, &v29);
  CMTimeMinimum(&v33, &v32, &v31);
  CMTimeMinimum(&v35, &v34, &v33);
  CMTime v26 = v35;
  getMinimumSafeInputDuration_0(&v25);
  if (CMTimeCompare(&v26, &v25) < 0)
  {
LABEL_16:
    int v20 = 12;
LABEL_17:
    *a6 = v20;
    goto LABEL_18;
  }
  if ((v35.flags & 0x1D) == 1)
  {
    CMTime v24 = v35;
    CMTime v23 = v38;
    if (CMTimeCompare(&v24, &v23) < 0)
    {
      CMTime v22 = v35;
      sub_1DD3A763C(a1, &v22);
    }
  }
  *a6 = sub_1DD3A7E54((void *)a1, v11, 0, 0, &v21);
LABEL_18:
}

void sub_1DD3A8800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3A8820(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v3 = [NSNumber numberWithUnsignedInteger:*(unsigned int *)(a1 + 208)];
  [v2 setObject:v3 forKeyedSubscript:qword_1EAB20A20];

  uint64_t v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 216)];
  [v2 setObject:v4 forKeyedSubscript:qword_1EAB20A28];

  CMTime time = *(CMTime *)a1;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v2 setObject:v6 forKeyedSubscript:qword_1EAB20A30];

  long long v7 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 24);
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 56);
  CFDictionaryRef v8 = CMTimeRangeCopyAsDictionary(&range, v5);
  [v2 setObject:v8 forKeyedSubscript:qword_1EAB20A38];

  CMTime v25 = *(CMTime *)(a1 + 72);
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&v25, v5);
  [v2 setObject:v9 forKeyedSubscript:qword_1EAB20A40];

  CMTime v24 = *(CMTime *)(a1 + 96);
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v24, v5);
  [v2 setObject:v10 forKeyedSubscript:qword_1EAB20A48];

  CMTime v23 = *(CMTime *)(a1 + 168);
  CFDictionaryRef v11 = CMTimeCopyAsDictionary(&v23, v5);
  [v2 setObject:v11 forKeyedSubscript:qword_1EAB20A50];

  char v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 196)];
  [v2 setObject:v12 forKeyedSubscript:qword_1EAB20A58];

  char v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 200)];
  [v2 setObject:v13 forKeyedSubscript:qword_1EAB20A60];

  long long v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 204)];
  [v2 setObject:v14 forKeyedSubscript:qword_1EAB20A68];

  long long v15 = [NSNumber numberWithInt:**(unsigned int **)(a1 + 240)];
  [v2 setObject:v15 forKeyedSubscript:qword_1EAB20A70];

  uint64_t v16 = *(void *)(a1 + 240);
  CMTimeEpoch v17 = *(void *)(v16 + 20);
  *(_OWORD *)&v22.value = *(_OWORD *)(v16 + 4);
  v22.epoch = v17;
  CFDictionaryRef v18 = CMTimeCopyAsDictionary(&v22, v5);
  [v2 setObject:v18 forKeyedSubscript:qword_1EAB20A78];

  long long v19 = [NSNumber numberWithInteger:*(int *)(*(void *)(a1 + 240) + 36)];
  [v2 setObject:v19 forKeyedSubscript:qword_1EAB20A80];

  int v20 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 240) + 40)];
  [v2 setObject:v20 forKeyedSubscript:qword_1EAB20A88];

  return v2;
}

void sub_1DD3A8B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id alInterpolateMetadataForGap(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v80 = a4;
  id v77 = a5;
  v75 = (CMTime *)a1;
  if (*(unsigned char *)(a1 + 12))
  {
    v74 = (CMTime *)a2;
    if ((*(unsigned char *)(a2 + 12) & 1) == 0)
    {
      if (a6)
      {
        uint64_t v118 = *MEMORY[0x1E4F28228];
        char v13 = [NSString stringWithFormat:@"End frame time not valid"];
        v119 = v13;
        obunint64_t j = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];

        id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AutoLoopsErrorDomain" code:5 userInfo:obj];
        goto LABEL_7;
      }
LABEL_8:
      id v76 = 0;
      goto LABEL_87;
    }
    if (qword_1EBE9D6C0 != -1) {
      dispatch_once(&qword_1EBE9D6C0, &unk_1F3891F38);
    }
    id v73 = (id)qword_1EBE9D6B8;
    v78 = objc_opt_new();
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    obunint64_t j = v73;
    uint64_t v14 = [obj countByEnumeratingWithState:&v100 objects:v117 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v101;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v101 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          CFDictionaryRef v18 = [v81 objectForKey:v17];

          long long v19 = [v80 objectForKey:v17];

          if (v18 != 0 && v19 != 0)
          {
            [v78 addObject:v17];
          }
          else if ((v18 != 0) != (v19 != 0))
          {
            if (a6)
            {
              uint64_t v115 = *MEMORY[0x1E4F28228];
              v62 = [NSString stringWithFormat:@"Metadata key not found in both start and end data: %@", v17];
              v116 = v62;
              v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];

              *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AutoLoopsErrorDomain" code:5 userInfo:v63];
            }
            goto LABEL_84;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v100 objects:v117 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    if ([v78 count])
    {
      if ([v77 count])
      {
        __p = 0;
        v98 = 0;
        v99 = 0;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v20 = v77;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v93 objects:v110 count:16];
        if (!v21) {
          goto LABEL_48;
        }
        uint64_t v22 = *(void *)v94;
LABEL_25:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v94 != v22) {
            objc_enumerationMutation(v20);
          }
          CFDictionaryRef v24 = *(const __CFDictionary **)(*((void *)&v93 + 1) + 8 * v23);
          memset(&v122, 0, sizeof(v122));
          CMTimeMakeFromDictionary(&v122, v24);
          if ((v122.flags & 1) == 0) {
            break;
          }
          CMTime v25 = v98;
          if (v98 >= (void *)v99)
          {
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * (((char *)v98 - (unsigned char *)__p) >> 3);
            unint64_t v28 = v27 + 1;
            if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_1DD3A9B50();
            }
            if (0x5555555555555556 * ((v99 - (unsigned char *)__p) >> 3) > v28) {
              unint64_t v28 = 0x5555555555555556 * ((v99 - (unsigned char *)__p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v99 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
              unint64_t v29 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v29 = v28;
            }
            if (v29) {
              CMTime v30 = (char *)sub_1DD3A9BF8((uint64_t)&v99, v29);
            }
            else {
              CMTime v30 = 0;
            }
            CMTime v31 = &v30[24 * v27];
            long long v32 = *(_OWORD *)&v122.value;
            *((void *)v31 + 2) = v122.epoch;
            *(_OWORD *)CMTime v31 = v32;
            CMTime v34 = (char *)__p;
            CMTime v33 = (char *)v98;
            CMTime v35 = v31;
            if (v98 != __p)
            {
              do
              {
                long long v36 = *(_OWORD *)(v33 - 24);
                *((void *)v35 - 1) = *((void *)v33 - 1);
                *(_OWORD *)(v35 - 24) = v36;
                v35 -= 24;
                v33 -= 24;
              }
              while (v33 != v34);
              CMTime v33 = (char *)__p;
            }
            CMTime v37 = v31 + 24;
            __p = v35;
            v98 = v31 + 24;
            v99 = &v30[24 * v29];
            if (v33) {
              operator delete(v33);
            }
            v98 = v37;
          }
          else
          {
            long long v26 = *(_OWORD *)&v122.value;
            v98[2] = v122.epoch;
            *CMTime v25 = v26;
            v98 = (void *)v25 + 3;
          }
          if (++v23 == v21)
          {
            uint64_t v21 = [v20 countByEnumeratingWithState:&v93 objects:v110 count:16];
            if (!v21)
            {
LABEL_48:

              id v76 = (id)objc_opt_new();
              CMTime v38 = (CMTime *)__p;
              v71 = (CMTime *)v98;
              if (__p == v98) {
                goto LABEL_95;
              }
              while (2)
              {
                CMTime v92 = *v75;
                CMTime v91 = *v74;
                CMTime v90 = *v38;
                v72 = v38;
                id v39 = v78;
                id v85 = v81;
                id v86 = v80;
                v87 = objc_opt_new();
                long long v106 = 0u;
                long long v107 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                id v84 = v39;
                uint64_t v40 = [v84 countByEnumeratingWithState:&v104 objects:&v122 count:16];
                if (!v40) {
                  goto LABEL_79;
                }
                uint64_t v88 = *(void *)v105;
LABEL_51:
                uint64_t v89 = v40;
                uint64_t v41 = 0;
LABEL_52:
                if (*(void *)v105 != v88) {
                  objc_enumerationMutation(v84);
                }
                uint64_t v42 = *(void *)(*((void *)&v104 + 1) + 8 * v41);
                if (([@"privECMVct" isEqualToString:v42] & 1) != 0
                  || [@"privEMBVct" isEqualToString:v42])
                {
                  CMTime v43 = [v85 objectForKeyedSubscript:v42];
                  CMTime v44 = [v86 objectForKeyedSubscript:v42];
                  sub_1DD3A9A00(&v92, &v91, &v90);
                  double v46 = v45;
                  id v47 = v43;
                  id v48 = v44;
                  uint64_t v49 = [v47 count];
                  if (v49 == [v48 count])
                  {
                    CMTimeRange v50 = objc_opt_new();
                    for (unint64_t j = 0; [v47 count] > j; ++j)
                    {
                      CMTime v52 = [v47 objectAtIndexedSubscript:j];
                      [v52 doubleValue];
                      double v54 = v53;

                      v55 = [v48 objectAtIndexedSubscript:j];
                      [v55 doubleValue];
                      double v57 = v56;

                      CMTime v58 = [NSNumber numberWithDouble:v54 + v46 * (v57 - v54)];
                      [v50 addObject:v58];
                    }
                  }
                  else
                  {
                    CMTimeRange v50 = 0;
                  }

                  [v87 setObject:v50 forKeyedSubscript:v42];
                  goto LABEL_74;
                }
                if (([@"privET" isEqualToString:v42] & 1) != 0
                  || ([@"privTZF" isEqualToString:v42] & 1) != 0
                  || ([@"privImgG" isEqualToString:v42] & 1) != 0
                  || ([@"privAFS" isEqualToString:v42] & 1) != 0
                  || ([@"privAFSt" isEqualToString:v42] & 1) != 0
                  || [@"privFM" isEqualToString:v42])
                {
                  sub_1DD3A9A00(&v92, &v91, &v90);
                  double v60 = v59;
                  if (v59 >= 0.5)
                  {
                    uint64_t v61 = [v86 objectForKeyedSubscript:v42];
                    v82 = (void *)v61;
                  }
                  else
                  {
                    uint64_t v61 = [v85 objectForKeyedSubscript:v42];
                    v83 = (void *)v61;
                  }
                  [v87 setObject:v61 forKeyedSubscript:v42];
                  if (v60 >= 0.5) {
                    id v47 = v82;
                  }
                  else {
                    id v47 = v83;
                  }
LABEL_74:
                }
                else
                {
                  NSLog(&cfstr_Getgapfilldata.isa, v42);
                }
                if (++v41 == v89)
                {
                  uint64_t v40 = [v84 countByEnumeratingWithState:&v104 objects:&v122 count:16];
                  if (!v40)
                  {
LABEL_79:

                    [v76 addObject:v87];
                    CMTime v38 = v72 + 1;
                    if (&v72[1] == v71) {
                      goto LABEL_95;
                    }
                    continue;
                  }
                  goto LABEL_51;
                }
                goto LABEL_52;
              }
            }
            goto LABEL_25;
          }
        }
        if (a6)
        {
          uint64_t v108 = *MEMORY[0x1E4F28228];
          v67 = objc_msgSend(NSString, "stringWithFormat:", @"Fill time CMTime dict at index %zu is invalid", 0xAAAAAAAAAAAAAAABLL * (((char *)v98 - (unsigned char *)__p) >> 3));
          v109 = v67;
          v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];

          *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AutoLoopsErrorDomain" code:5 userInfo:v68];
        }
        id v76 = 0;
LABEL_95:
        if (__p)
        {
          v98 = __p;
          operator delete(__p);
        }
        goto LABEL_85;
      }
      if (a6)
      {
        uint64_t v111 = *MEMORY[0x1E4F28228];
        v69 = [NSString stringWithFormat:@"No fill times provided to interpolate"];
        v112 = v69;
        v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];

        *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AutoLoopsErrorDomain" code:5 userInfo:v70];
      }
    }
    else if (a6)
    {
      uint64_t v113 = *MEMORY[0x1E4F28228];
      CMTimeRange v65 = [NSString stringWithFormat:@"No keys available to interpolate"];
      v114 = v65;
      v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];

      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AutoLoopsErrorDomain" code:5 userInfo:v66];
    }
LABEL_84:
    id v76 = 0;
LABEL_85:

    goto LABEL_86;
  }
  if (!a6) {
    goto LABEL_8;
  }
  uint64_t v120 = *MEMORY[0x1E4F28228];
  CFDictionaryRef v11 = [NSString stringWithFormat:@"Start frame time not valid"];
  v121 = v11;
  obunint64_t j = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v121 forKeys:&v120 count:1];

  id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AutoLoopsErrorDomain" code:5 userInfo:obj];
LABEL_7:
  id v76 = 0;
  *a6 = v12;
LABEL_86:

LABEL_87:

  return v76;
}

void sub_1DD3A96FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,void *__p,uint64_t a53)
{
  _Unwind_Resume(a1);
}

void sub_1DD3A9940()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"privECMVct";
  v2[1] = @"privEMBVct";
  v2[2] = @"privET";
  v2[3] = @"privTZF";
  v2[4] = @"privImgG";
  v2[5] = @"privAFS";
  v2[6] = @"privAFSt";
  v2[7] = @"privFM";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  uint64_t v1 = (void *)qword_1EBE9D6B8;
  qword_1EBE9D6B8 = v0;
}

void sub_1DD3A9A00(CMTime *a1, CMTime *a2, CMTime *a3)
{
  CMTime lhs = *a3;
  CMTime rhs = *a1;
  CMTimeSubtract(&v17, &lhs, &rhs);
  CMTime time1 = v17;
  CFAllocatorRef v5 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    CMTime v11 = *a2;
    CMTime v10 = *a1;
    CMTimeSubtract(&v12, &v11, &v10);
    CMTime v9 = v12;
    CMTime v8 = *v5;
    if (CMTimeCompare(&v9, &v8))
    {
      CMTime time = v17;
      CMTimeGetSeconds(&time);
      CMTime v6 = v12;
      CMTimeGetSeconds(&v6);
    }
  }
}

void sub_1DD3A9B50()
{
}

void sub_1DD3A9B68(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1DD3A9BC4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6CBFC58, MEMORY[0x1E4FBA1C8]);
}

void sub_1DD3A9BB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1DD3A9BC4(std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *sub_1DD3A9BF8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1DD3A9C40();
  }
  return operator new(24 * a2);
}

void sub_1DD3A9C40()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1DD3A9E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3A9E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  CMTime v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AutoLoopStabilizer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1DD3A9E9C(void *a1)
{
}

void sub_1DD3AA0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3AA184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3AA384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3AA548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3AB3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  _Unwind_Resume(a1);
}

void sub_1DD3ABAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3ABBB0(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      sub_1DD3A9B50();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    CMTime v6 = (char *)sub_1DD3A9BF8(v3, a2);
    long long v7 = &v6[24 * v5];
    CMTime v9 = &v6[24 * v8];
    CMTime v11 = (char *)*a1;
    CMTime v10 = (char *)a1[1];
    CMTime v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      CMTime v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void *sub_1DD3AC17C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_1DD3A9C40();
  }
  return operator new(48 * a2);
}

uint64_t runLiveAnalysisPipeline(void *a1, void *a2, void *a3, uint64_t a4, int *a5, void *a6, void *a7)
{
  return sub_1DD3AC1D0(a1, a2, a3, a4, a5, a6, 0, a7);
}

uint64_t sub_1DD3AC1D0(void *a1, void *a2, void *a3, uint64_t a4, int *a5, void *a6, void *a7, void *a8)
{
  ptr = a1;
  id v73 = a2;
  id v71 = a3;
  v74 = a8;
  long long v13 = sub_1DD3D425C(1);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, &ptr);

  uint64_t v15 = sub_1DD3D425C(1);
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD3A6000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ALRunLiveAnalysisPipeline", (const char *)&unk_1DD3F30A9, buf, 2u);
  }

  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  v67 = a7;
  CMTime v17 = (CMTime *)MEMORY[0x1E4F1F9F0];
  CMTime v106 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  int Duration = validateInputVideoAndGetDuration(v71, (uint64_t)&v106);
  if (Duration) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v73 == 0;
  }
  if (v19) {
    int v20 = 28;
  }
  else {
    int v20 = Duration;
  }
  CMTime v105 = *v17;
  unsigned int v75 = v20;
  if (!v20)
  {
    unsigned int v75 = sub_1DD3A7E54(ptr, v71, a4, a5, &v105);
    if (!v75) {
      operator new();
    }
  }
  v72 = operator new(0x10uLL);
  _OWORD *v72 = xmmword_1DD3E83C0;
  __p = 0;
  long long v102 = 0;
  uint64_t v104 = 0;
  uint64_t v21 = ptr[2];
  long long v100 = *(_OWORD *)ptr;
  uint64_t v101 = v21;
  CMTime v99 = *(CMTime *)((unsigned char *)ptr + 3);
  long long v97 = *((_OWORD *)ptr + 6);
  uint64_t v98 = ptr[14];
  memset(&v96, 0, sizeof(v96));
  long long v22 = *(_OWORD *)(ptr + 15);
  lhs.epoch = ptr[17];
  *(_OWORD *)&lhs.value = v22;
  long long v23 = *(_OWORD *)(ptr + 21);
  rhs.epoch = ptr[23];
  *(_OWORD *)&rhs.value = v23;
  CMTimeAdd(&time1, &lhs, &rhs);
  CMTime time2 = v105;
  CMTimeMaximum(&v96, &time1, &time2);
  CFDictionaryRef v24 = 0;
  int v91 = -2;
  if (!v75)
  {
    unint64_t v25 = 0;
    do
      unint64_t v26 = v25++;
    while (v26 <= 3 && *((_DWORD *)v72 + v26) != 1);
    int v27 = v25 - 1;
    if (v26 >= 4) {
      float v28 = 0.0;
    }
    else {
      float v28 = (float)v27 * 0.25;
    }
    int v29 = v74[2](v74, v28 + 0.0);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = sub_1DD3ADAD4;
    v87[3] = &unk_1E6CBFEC0;
    uint64_t v88 = v74;
    float v89 = v28;
    int v90 = 1048576000;
    CMTime v30 = (void *)MEMORY[0x1E01B45D0](v87);
    if (v29)
    {
      CMTime v83 = v106;
      long long v81 = v100;
      uint64_t v82 = v101;
      CMTime v80 = v99;
      uint64_t v79 = v98;
      long long v78 = v97;
      unsigned int v75 = sub_1DD3ADAF0((uint64_t)buf, (uint64_t)ptr, &v83, (uint64_t)&v81, &v80, (uint64_t)&v78);
      if (v75)
      {
        CFDictionaryRef v24 = 0;
      }
      else
      {
        id v77 = 0;
        int v31 = v86;
        if (v86) {
          long long v32 = &v76;
        }
        else {
          long long v32 = 0;
        }
        if (v86) {
          id v76 = 0;
        }
        unsigned int v75 = sub_1DD3ADFF8(v71, (uint64_t)buf, v30, &v77, &v91, v32);
        id v33 = v77;
        if (v31) {
          id v34 = v76;
        }
        else {
          id v34 = 0;
        }
        if (v67) {
          void *v67 = v33;
        }
        id v35 = v33;
        if ((ptr[26] & 2) != 0)
        {
          long long v36 = v102;
          if (__p != v102)
          {
            unint64_t v37 = 0;
            unsigned int v38 = 1;
            int v39 = v91;
            do
            {
              uint64_t v40 = *(void *)(v36[v37] + 24);
              *(_DWORD *)(v40 + 96) = v39;
              objc_storeStrong((id *)(v40 + 104), v34);
              unint64_t v37 = v38;
              long long v36 = v102;
              ++v38;
            }
            while (v37 < ((unsigned char *)__p - (unsigned char *)v102) >> 3);
          }
        }

        CFDictionaryRef v24 = v35;
      }
    }
    else
    {
      CFDictionaryRef v24 = 0;
      unsigned int v75 = v29 ^ 1;
    }
  }
  if (!v75)
  {
    uint64_t v41 = ptr;
    if ((ptr[26] & 2) != 0)
    {
      uint64_t v42 = v102;
      if (__p != v102)
      {
        unint64_t v43 = 0;
        unsigned int v44 = 1;
        do
        {
          sub_1DD3CBCEC(v42[v43]);
          unint64_t v43 = v44;
          uint64_t v42 = v102;
          ++v44;
        }
        while (v43 < ((unsigned char *)__p - (unsigned char *)v102) >> 3);
      }
      uint64_t v41 = ptr;
    }
    id v45 = v24;
    uint64_t v46 = [v45 frameTimes];
    memset(v112, 0, sizeof(v112));
    sub_1DD3B1900(v112, *(const void **)v46, *(void *)(v46 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v46 + 8) - *(void *)v46) >> 3));
    long long v110 = 0uLL;
    uint64_t v111 = 0;
    if (v45) {
      [v45 roiLength];
    }
    uint64_t v47 = v41[30];
    if ((~*(_DWORD *)(v47 + 16) & 0x11) != 0)
    {
      long long v108 = *(_OWORD *)(v47 + 4);
      uint64_t v109 = *(void *)(v47 + 20);
    }
    else
    {
      sub_1DD3E4B28(v112, 0, (uint64_t)buf);
      long long v108 = *(_OWORD *)buf;
      uint64_t v109 = v85;
      uint64_t v47 = v41[30];
    }
    long long v113 = v108;
    uint64_t v114 = v109;
    int v48 = *(_DWORD *)v47;
    *(_OWORD *)buf = v108;
    *(void *)&long long v85 = v109;
    long long v108 = v110;
    uint64_t v109 = v111;
    sub_1DD3DE15C(v48);
  }
  if (ptr[49]) {
    BOOL v49 = 1;
  }
  else {
    BOOL v49 = ptr[48] != 0;
  }
  uint64_t v66 = ptr[51];
  BOOL v69 = v49;
  int v68 = v75 != 0 || !v49;
  if (v75 == 0 && v49)
  {
    if (sub_1DD3BE1B0(0, 2)) {
      operator new();
    }
    CMTimeRange v50 = ptr;
    CMTimeRange v51 = (void (*)(void, void, uint64_t, void))ptr[49];
    if (v51)
    {
      v51(ptr[47], 0, 2, 0);
      CMTimeRange v50 = ptr;
    }
    CMTime v52 = (void (*)(void, void, uint64_t, void))v50[48];
    if (v52) {
      v52(v50[47], 0, 2, 0);
    }
  }
  if ((v69 & v68) == 1)
  {
    double v53 = ptr;
    double v54 = (void (*)(void, void, uint64_t, void))ptr[49];
    if (v54)
    {
      v54(ptr[47], v75, 2, 0);
      double v53 = ptr;
    }
    v55 = (void (*)(void, void, uint64_t, void))v53[48];
    if (v55) {
      v55(v53[47], v75, 2, 0);
    }
  }
  if (v66)
  {
    double v56 = (void (*)(void, void))ptr[51];
    if (v56) {
      v56(ptr[50], 0);
    }
  }
  double v57 = v102;
  if (__p != v102)
  {
    unint64_t v58 = 0;
    unsigned int v59 = 1;
    do
    {
      uint64_t v60 = v57[v58];
      if (*(void *)(v60 + 24))
      {
        uint64_t v61 = sub_1DD3B6EFC();
        MEMORY[0x1E01B4150](v61, 0x10A0C40581A9675);
      }
      uint64_t v62 = sub_1DD3CB950(v60);
      MEMORY[0x1E01B4150](v62, 0xA0C40A3561BEDLL);
      unint64_t v58 = v59;
      double v57 = v102;
      ++v59;
    }
    while (v58 < ((unsigned char *)__p - (unsigned char *)v102) >> 3);
  }
  ((void (*)(float))v74[2])(1.0);
  v63 = sub_1DD3D425C(1);
  CMTime v64 = v63;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD3A6000, v64, OS_SIGNPOST_INTERVAL_END, v14, "ALRunLiveAnalysisPipeline", (const char *)&unk_1DD3F30A9, buf, 2u);
  }

  if (v102)
  {
    __p = v102;
    operator delete(v102);
  }
  operator delete(v72);

  return v75;
}

void sub_1DD3AD7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21)
{
  long long v23 = (void *)STACK[0x358];
  if (STACK[0x358])
  {
    STACK[0x360] = (unint64_t)v23;
    operator delete(v23);
  }
  operator delete(a19);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3ADAB8(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40) + (float)(*(float *)(a1 + 44) * a2));
}

uint64_t sub_1DD3ADAD4(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40) + (float)(*(float *)(a1 + 44) * a2));
}

uint64_t sub_1DD3ADAF0(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, CMTime *a5, uint64_t a6)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if ((a5->flags & 0x1D) == 1) {
    CMTime v10 = a5;
  }
  else {
    CMTime v10 = (CMTime *)(a2 + 72);
  }
  CMTime v62 = *v10;
  CMTime v11 = (CMTime *)(a2 + 96);
  if ((*(_DWORD *)(a6 + 12) & 0x1D) == 1) {
    uint64_t v12 = a6;
  }
  else {
    uint64_t v12 = a2 + 96;
  }
  long long v13 = *(_OWORD *)v12;
  v61.CMTimeEpoch epoch = *(void *)(v12 + 16);
  *(_OWORD *)&v61.value = v13;
  memset(&v60, 0, sizeof(v60));
  long long v14 = *(_OWORD *)&v10->value;
  start.CMTimeEpoch epoch = v10->epoch;
  *(_OWORD *)&start.value = v14;
  long long v15 = *(_OWORD *)v12;
  duration.CMTimeEpoch epoch = *(void *)(v12 + 16);
  *(_OWORD *)&duration.value = v15;
  CMTimeRangeMake(&v60, &start, &duration);
  if ((*(_DWORD *)(a4 + 12) & 0x1D) == 1) {
    uint64_t v16 = a4;
  }
  else {
    uint64_t v16 = a2;
  }
  CMTimeValue v63 = *(void *)v16;
  CMTimeFlags v17 = *(_DWORD *)(v16 + 12);
  CMTimeScale v64 = *(_DWORD *)(v16 + 8);
  CMTimeEpoch v18 = *(void *)(v16 + 16);
  CMTime time1 = v62;
  CMTime time2 = *(CMTime *)(a2 + 72);
  if (CMTimeCompare(&time1, &time2) < 0) {
    return 15;
  }
  CMTime v55 = v61;
  CMTime v54 = *v11;
  if (CMTimeCompare(&v55, &v54) > 0) {
    return 15;
  }
  memset(&v53, 0, sizeof(v53));
  int v20 = (CMTime *)MEMORY[0x1E4F1FA48];
  CMTime v51 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime v50 = *a3;
  CMTimeRangeMake(&range, &v51, &v50);
  CMTimeRange otherRange = v60;
  CMTimeRangeGetIntersection(&v53, &range, &otherRange);
  if ((~v17 & 0x11) != 0
    && (CMTimeRange v48 = v53,
        time.value = v63,
        time.timescale = v64,
        time.flags = v17,
        time.CMTimeEpoch epoch = v18,
        !CMTimeRangeContainsTime(&v48, &time)))
  {
    NSLog(&cfstr_Runautoloopsta.isa);
    return 13;
  }
  else
  {
    *(_WORD *)(a1 + 125) = *(_WORD *)(a2 + 205);
    *(_DWORD *)a1 = *(_DWORD *)(a2 + 200);
    *(void *)(a1 + 4) = v63;
    *(_DWORD *)(a1 + 12) = v64;
    *(_DWORD *)(a1 + 16) = v17;
    *(void *)(a1 + 20) = v18;
    *(CMTime *)(a1 + 28) = v62;
    *(CMTime *)(a1 + 52) = v61;
    *(unsigned char *)(a1 + 124) = (*(unsigned char *)(a2 + 208) & 2) != 0;
    memset(&v53, 0, 24);
    sub_1DD3A73F0(a2, 1, 1, 1, &v53.start);
    memset(&v46, 0, sizeof(v46));
    CMTime v45 = v61;
    CMTime v44 = *a3;
    CMTimeMinimum(&v46, &v45, &v44);
    CMTime v43 = *v20;
    CMTime v42 = v46;
    CMTime v41 = v53.start;
    if (CMTimeCompare(&v42, &v41) >= 1)
    {
      CMTime lhs = v46;
      CMTime rhs = v53.start;
      CMTimeSubtract(&v43, &lhs, &rhs);
    }
    memset(&v38, 0, sizeof(v38));
    CMTime v37 = v43;
    CMTimeMultiplyByRatio(&v38, &v37, 1, 2);
    CMTime v36 = v38;
    CMTime v35 = v38;
    if ((*(unsigned char *)(a2 + 36) & 1) != 0
      && (*(unsigned char *)(a2 + 60) & 1) != 0
      && !*(void *)(a2 + 64)
      && (*(void *)(a2 + 48) & 0x8000000000000000) == 0)
    {
      CMTime v34 = v38;
      CMTime v32 = *(CMTime *)(a2 + 24);
      CMTime v31 = v62;
      CMTimeSubtract(&v33, &v32, &v31);
      CMTimeMinimum(&v36, &v34, &v33);
      memset(&v30, 0, sizeof(v30));
      CMTime v29 = *a3;
      CMTimeRange v27 = v60;
      CMTimeRangeGetEnd(&v28, &v27);
      CMTimeMinimum(&v30, &v29, &v28);
      CMTime v26 = v35;
      CMTime v24 = v30;
      CMTime v23 = *(CMTime *)(a2 + 24);
      CMTimeSubtract(&v25, &v24, &v23);
      CMTimeMinimum(&v35, &v26, &v25);
    }
    CMTimeEpoch epoch = v20->epoch;
    *(void *)(a1 + 92) = epoch;
    long long v22 = *(_OWORD *)&v20->value;
    *(_OWORD *)(a1 + 76) = *(_OWORD *)&v20->value;
    *(_OWORD *)(a1 + 100) = v22;
    *(void *)(a1 + 116) = epoch;
    if (*(unsigned char *)(a2 + 204))
    {
      *(CMTime *)(a1 + 76) = v36;
      *(CMTime *)(a1 + 100) = v35;
    }
    return 0;
  }
}

uint64_t sub_1DD3ADFF8(void *a1, uint64_t a2, void *a3, void *a4, int *a5, void *a6)
{
  id v11 = a1;
  uint64_t ptr = a2;
  id v12 = a3;
  long long v13 = sub_1DD3D425C(1);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, &ptr);

  long long v15 = sub_1DD3D425C(1);
  uint64_t v16 = v15;
  unint64_t v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD3A6000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ALRunAutoLoopStabilize", (const char *)&unk_1DD3F30A9, buf, 2u);
  }
  uint64_t v40 = a4;
  os_signpost_id_t spid = v14;

  *a5 = -2;
  CMTimeEpoch v18 = objc_alloc_init(AutoLoopStabilizer);
  uint64_t v19 = ptr;
  id v20 = v11;
  uint64_t v21 = (uint64_t (**)(void, double))v12;
  long long v22 = v18;
  int v23 = v21[2](v21, 0.0);
  if (v23)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v54 = 3221225472;
    CMTime v55 = sub_1DD3B18F0;
    double v56 = &unk_1E6CBFEE8;
    double v57 = v21;
    [(AutoLoopStabilizer *)v22 setStatusUpdateBlock:buf];
    [(AutoLoopStabilizer *)v22 setMovieAssetIn:v20];
    long long v24 = *(_OWORD *)(v19 + 4);
    uint64_t v52 = *(void *)(v19 + 20);
    *(_OWORD *)CMTime v51 = v24;
    [(AutoLoopStabilizer *)v22 setRefFrameTime:v51];
    if ((*(_DWORD *)(v19 + 40) & 0x1D) == 1)
    {
      [(AutoLoopStabilizer *)v22 setUseLimitedTime:1];
      long long v49 = *(_OWORD *)(v19 + 28);
      uint64_t v50 = *(void *)(v19 + 44);
      [(AutoLoopStabilizer *)v22 setTrimStart:&v49];
      CMTime v25 = (long long *)(v19 + 52);
      if ((*(_DWORD *)(v19 + 64) & 0x1D) != 1) {
        CMTime v25 = (long long *)MEMORY[0x1E4F1FA10];
      }
      long long v47 = *v25;
      uint64_t v48 = *((void *)v25 + 2);
      [(AutoLoopStabilizer *)v22 setTrimLength:&v47];
    }
    [(AutoLoopStabilizer *)v22 setDisableGPUStabilization:*(unsigned __int8 *)(v19 + 125)];
    [(AutoLoopStabilizer *)v22 setOptimizeProcessingForMemory:*(unsigned __int8 *)(v19 + 126)];
    long long v45 = *(_OWORD *)(v19 + 76);
    uint64_t v46 = *(void *)(v19 + 92);
    [(AutoLoopStabilizer *)v22 setMaxAllowedTrimTimeStart:&v45];
    long long v43 = *(_OWORD *)(v19 + 100);
    uint64_t v44 = *(void *)(v19 + 116);
    [(AutoLoopStabilizer *)v22 setMaxAllowedTrimTimeEnd:&v43];
  }
  uint64_t v26 = v23 ^ 1u;

  *(void *)buf = 0;
  if (v26)
  {
    uint64_t v28 = 0;
    int v27 = -8888;
    if (!v26) {
      goto LABEL_15;
    }
LABEL_19:
    if (!a6) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  int v27 = [(AutoLoopStabilizer *)v22 analyzeForAutoloopWithDirect:0 toAnalysisOutput:buf];
  uint64_t v28 = *(void *)buf;
  if (*(void *)buf) {
    uint64_t v26 = 16 * (v27 == 0);
  }
  else {
    uint64_t v26 = 16 * (v27 != -1);
  }
  if (v26) {
    goto LABEL_19;
  }
LABEL_15:
  CMTime v29 = (_DWORD *)ptr;
  CMTime v30 = v22;
  CMTime v31 = v30;
  *a5 = -2;
  if (v27 == -1)
  {
    *a5 = -1;
    uint64_t v26 = 1;
    goto LABEL_31;
  }
  if (!v27)
  {
    *a5 = 0;
LABEL_30:
    uint64_t v26 = 16;
    goto LABEL_31;
  }
  CMTime v32 = v30;
  if (*v29 == 4) {
    int v33 = [(AutoLoopStabilizer *)v30 processStabilizationAnalysisForCinematicL1:v28];
  }
  else {
    int v33 = [(AutoLoopStabilizer *)v30 processStabilizationAnalysis:v28 forcePassThru:*v29 == 3 forceSmoothing:*v29 == 2 forceSequentialTripod:*v29 == 1];
  }
  *a5 = v33;
  CMTime v31 = v32;
  if ((v33 + 1) >= 2)
  {
    CMTime v34 = [[StabilizeParamGenerator alloc] initWithStabilizer:v32];
    CMTime v35 = [(StabilizeParamGenerator *)v34 generateStabilizeParams];
    if (![v35 numFrames])
    {

      CMTime v35 = 0;
      *a5 = 0;
    }
    id v36 = v35;
    *uint64_t v40 = v36;

    int v33 = *a5;
    CMTime v31 = v32;
  }
  uint64_t v26 = v33 == -1;
  if (!v33) {
    goto LABEL_30;
  }
LABEL_31:

  if (!a6) {
    goto LABEL_34;
  }
LABEL_32:
  if (*(unsigned char *)(ptr + 124))
  {
    *a6 = [(AutoLoopStabilizer *)v22 featuresDictionary];
  }
LABEL_34:
  if (*(void *)buf) {
    ICDestroyResult();
  }
  v21[2](v21, 1.0);
  CMTime v37 = sub_1DD3D425C(1);
  CMTime v38 = v37;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)CMTime v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD3A6000, v38, OS_SIGNPOST_INTERVAL_END, spid, "ALRunAutoLoopStabilize", (const char *)&unk_1DD3F30A9, v51, 2u);
  }

  return v26;
}

void sub_1DD3AE4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3AE52C(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40) + (float)(*(float *)(a1 + 44) * a2));
}

uint64_t sub_1DD3AE548(long long *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t **a9)
{
  uint64_t ptr = a1;
  id v14 = a2;
  id v15 = a3;
  uint64_t v16 = a4;
  id v46 = a6;
  unint64_t v17 = sub_1DD3D425C(1);
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, &ptr);

  uint64_t v19 = sub_1DD3D425C(1);
  id v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD3A6000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "ALRunAutoLoopAnalyze", (const char *)&unk_1DD3F30A9, buf, 2u);
  }

  v16[2](v16, 0.0);
  os_signpost_id_t spid = v18;
  unint64_t v45 = v18 - 1;
  if (a8)
  {
    sub_1DD3BE1B0(a8, 0);
    BOOL v47 = sub_1DD3BE1B0(a8, 1);
    sub_1DD3BE1B0(a8, 2);
    sub_1DD3BE1B0(a8, 3);
    unsigned int v21 = (*(uint64_t (**)(uint64_t))(*(void *)a7 + 24))(a7);
    if (v47) {
      unsigned int v22 = 4;
    }
    else {
      unsigned int v22 = 2;
    }
    if (v21 >= v22)
    {
      long long v61 = 0uLL;
      uint64_t v62 = 0;
      CMTime time = *(CMTime *)(a7 + 60);
      int32_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)a7 + 24))(a7);
      CMTimeMultiply(&v85, &time, v24);
      CMTime v84 = *(CMTime *)((unsigned char *)ptr + 5);
      CMTime v83 = *(CMTime *)((unsigned char *)ptr + 7);
      sub_1DD3C4930(&v85, &v84, &v83, (uint64_t)&v61, *((float *)ptr + 48));
      CMTime v25 = (_OWORD *)(a7 + 60);
      CMTime time = *(CMTime *)(a7 + 60);
      int32_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)a7 + 24))(a7);
      CMTimeMultiply(&v82, &time, v26);
      long long v80 = *(long long *)((char *)ptr + 120);
      uint64_t v81 = *((void *)ptr + 17);
      long long v78 = ptr[9];
      uint64_t v79 = *((void *)ptr + 20);
      long long v76 = v61;
      uint64_t v77 = v62;
      uint64_t v23 = sub_1DD3C4ACC((uint64_t)buf, (long long *)&v82.value, &v80, &v78, &v76);
      BOOL v27 = v47;
      if (v23) {
        BOOL v27 = 0;
      }
      if (v27)
      {
        long long v61 = 0uLL;
        uint64_t v62 = 0;
        *(_OWORD *)&time.value = *v25;
        time.CMTimeEpoch epoch = *(void *)(a7 + 76);
        int32_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)a7 + 24))(a7);
        CMTimeMultiply(&v75, &time, v28);
        CMTime v74 = *(CMTime *)((char *)ptr + 248);
        CMTime v73 = *(CMTime *)((char *)ptr + 296);
        sub_1DD3C4930(&v75, &v74, &v73, (uint64_t)&v61, *((float *)ptr + 48));
        *(_OWORD *)&time.value = *v25;
        time.CMTimeEpoch epoch = *(void *)(a7 + 76);
        int32_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)a7 + 24))(a7);
        CMTimeMultiply(&v72, &time, v29);
        long long v70 = *(long long *)((char *)ptr + 248);
        uint64_t v71 = *((void *)ptr + 33);
        long long v68 = ptr[17];
        uint64_t v69 = *((void *)ptr + 36);
        long long v66 = v61;
        uint64_t v67 = v62;
        uint64_t v23 = sub_1DD3C4ACC((uint64_t)v86, (long long *)&v72.value, &v70, &v68, &v66);
      }
      if (!v23)
      {
        long long v30 = *ptr;
        uint64_t v60 = *((void *)ptr + 2);
        long long v31 = *(long long *)((char *)ptr + 24);
        long long v32 = *(long long *)((char *)ptr + 40);
        v58[2] = *(long long *)((char *)ptr + 56);
        long long v59 = v30;
        v58[0] = v31;
        v58[1] = v32;
        uint64_t v23 = sub_1DD3D43A8(a7, (uint64_t)&time, (uint64_t)buf, (uint64_t)&v59, (uint64_t)v58, 1u);
        v51[0] = 0;
        v54[0] = v51;
        if (sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54)[5])
        {
          v51[0] = 0;
          v54[0] = v51;
          int v33 = sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54);
          *((_DWORD *)v33[5] + 52) = v65 == 0;
        }
        BOOL v34 = v47;
        if (v23) {
          BOOL v34 = 0;
        }
        if (v34)
        {
          long long v35 = *ptr;
          uint64_t v57 = *((void *)ptr + 2);
          long long v36 = *(long long *)((char *)ptr + 24);
          long long v37 = *(long long *)((char *)ptr + 40);
          v55[2] = *(long long *)((char *)ptr + 56);
          long long v56 = v35;
          v55[0] = v36;
          v55[1] = v37;
          uint64_t v23 = sub_1DD3D43A8(a7, (uint64_t)&v61, (uint64_t)v86, (uint64_t)&v56, (uint64_t)v55, 2u);
          v51[0] = 1;
          v54[0] = v51;
          if (sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54)[5])
          {
            v51[0] = 1;
            v54[0] = v51;
            CMTime v38 = sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54);
            *((_DWORD *)v38[5] + 52) = v63 == 0;
          }
        }
        if (!v23)
        {
          v51[0] = 3;
          v54[0] = v51;
          if (sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54)[5])
          {
            v51[0] = 3;
            v54[0] = v51;
            *((_DWORD *)sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54)[5] + 52) = 1;
          }
          v51[0] = 2;
          v54[0] = v51;
          if (sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54)[5])
          {
            v51[0] = 2;
            v54[0] = v51;
            *((_DWORD *)sub_1DD3B1A5C(a9, v51, (uint64_t)&unk_1DD3E83E0, v54)[5] + 52) = 1;
          }
          sub_1DD3D4808();
        }
      }
    }
    else
    {
      uint64_t v23 = 14;
    }
  }
  else
  {
    uint64_t v23 = 32;
  }
  memset(v54, 0, sizeof(v54));
  *(void *)CMTime v51 = 0;
  *(void *)multiplier = 0;
  uint64_t v53 = 0;
  memset(v49, 0, sizeof(v49));
  uint64_t v50 = 0x100000000;
  (*(void (**)(uint64_t))(*(void *)a7 + 24))(a7);
  (*(void (**)(uint64_t))(*(void *)a7 + 24))(a7);
  if (objc_opt_respondsToSelector())
  {
    int v39 = [v15 URL];
    id v40 = [v39 lastPathComponent];
    [v40 UTF8String];
  }
  v16[2](v16, 1.0);
  CMTime v41 = sub_1DD3D425C(1);
  CMTime v42 = v41;
  if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    *(_WORD *)uint64_t v48 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DD3A6000, v42, OS_SIGNPOST_INTERVAL_END, spid, "ALRunAutoLoopAnalyze", (const char *)&unk_1DD3F30A9, v48, 2u);
  }

  *(void *)CMTime v51 = v54;
  sub_1DD3B1844((void ***)v51);

  return v23;
}

void sub_1DD3B04DC(void *a1)
{
  MEMORY[0x1E01B4150](v1, 0x10F1C408F4C135DLL);
  __cxa_begin_catch(a1);
  NSLog(&cfstr_ErrorCreatingV.isa);
  __cxa_end_catch();
  JUMPOUT(0x1DD3B03B8);
}

void sub_1DD3B0530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,void *a22,uint64_t a23,void *a24)
{
  __cxa_end_catch();

  _Unwind_Resume(a1);
}

uint64_t runAutoLoopStabilize(uint64_t a1, void *a2, void *a3, void *a4, int *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = (CMTime *)MEMORY[0x1E4F1F9F0];
  CMTime v21 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
  uint64_t Duration = validateInputVideoAndGetDuration(v9, (uint64_t)&v21);
  if (Duration
    || (CMTime v19 = v21,
        CMTime v18 = *v11,
        CMTime v17 = v18,
        CMTime v16 = v18,
        uint64_t Duration = sub_1DD3ADAF0((uint64_t)v20, a1, &v19, (uint64_t)&v18, &v17, (uint64_t)&v16),
        Duration))
  {
    id v13 = 0;
  }
  else
  {
    id v15 = 0;
    uint64_t Duration = sub_1DD3ADFF8(v9, (uint64_t)v20, v10, &v15, a5, 0);
    id v13 = v15;
    if (a4 && !Duration)
    {
      id v13 = v13;
      *a4 = v13;
    }
  }

  return Duration;
}

void sub_1DD3B0998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_1DD3B09B4(int a1, unint64_t a2)
{
  if ((a1 + 2) > 3)
  {
    uint64_t v3 = @"Unknown gating result.";
    if (!a2) {
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v3 = off_1E6CBFF08[a1 + 2];
    if (!a2) {
      goto LABEL_41;
    }
  }
  if ((a2 & 0x40) != 0)
  {
    uint64_t v3 = [(__CFString *)v3 stringByAppendingString:@"shortInputFail "];
  }
  if ((a2 & 2) != 0)
  {
    uint64_t v4 = [(__CFString *)v3 stringByAppendingString:@"preGateStillFail "];

    uint64_t v3 = (__CFString *)v4;
  }
  if ((a2 & 4) != 0)
  {
    uint64_t v5 = [(__CFString *)v3 stringByAppendingString:@"preGateVideoTrimFail "];

    uint64_t v3 = (__CFString *)v5;
  }
  if ((a2 & 8) != 0)
  {
    uint64_t v6 = [(__CFString *)v3 stringByAppendingString:@"preGateVideoMLFail "];

    uint64_t v3 = (__CFString *)v6;
  }
  if ((a2 & 0x80) != 0)
  {
    uint64_t v7 = [(__CFString *)v3 stringByAppendingString:@"preGateFacesFail "];

    uint64_t v3 = (__CFString *)v7;
  }
  if ((a2 & 0x10) != 0)
  {
    uint64_t v8 = [(__CFString *)v3 stringByAppendingString:@"tripodStabilizeFail "];

    uint64_t v3 = (__CFString *)v8;
  }
  if ((a2 & 0x20) != 0)
  {
    uint64_t v9 = [(__CFString *)v3 stringByAppendingString:@"postGateFail "];

    uint64_t v3 = (__CFString *)v9;
  }
  if ((a2 & 0x10000) != 0)
  {
    uint64_t v10 = [(__CFString *)v3 stringByAppendingString:@"activityGateFail "];

    uint64_t v3 = (__CFString *)v10;
  }
  if ((a2 & 0x4000) != 0)
  {
    uint64_t v11 = [(__CFString *)v3 stringByAppendingString:@"shortInputError "];

    uint64_t v3 = (__CFString *)v11;
  }
  if ((a2 & 0x200) != 0)
  {
    uint64_t v12 = [(__CFString *)v3 stringByAppendingString:@"preGateStillError "];

    uint64_t v3 = (__CFString *)v12;
  }
  if ((a2 & 0x400) != 0)
  {
    uint64_t v13 = [(__CFString *)v3 stringByAppendingString:@"preGateVideoTrimError "];

    uint64_t v3 = (__CFString *)v13;
  }
  if ((a2 & 0x800) != 0)
  {
    uint64_t v14 = [(__CFString *)v3 stringByAppendingString:@"preGateVideoMLError "];

    uint64_t v3 = (__CFString *)v14;
  }
  if ((a2 & 0x8000) != 0)
  {
    uint64_t v15 = [(__CFString *)v3 stringByAppendingString:@"preGateFacesError "];

    uint64_t v3 = (__CFString *)v15;
  }
  if ((a2 & 0x1000) != 0)
  {
    uint64_t v16 = [(__CFString *)v3 stringByAppendingString:@"tripodStabilizeError "];

    uint64_t v3 = (__CFString *)v16;
  }
  if ((a2 & 0x2000) != 0)
  {
    uint64_t v17 = [(__CFString *)v3 stringByAppendingString:@"postGateError "];

    uint64_t v3 = (__CFString *)v17;
  }
  if ((a2 & 0x20000) != 0)
  {
    uint64_t v18 = [(__CFString *)v3 stringByAppendingString:@"activityGateError "];

    uint64_t v3 = (__CFString *)v18;
  }
  if (HIWORD(a2))
  {
    CMTime v19 = +[PregateAnalyzer pregateFailureReasonsToString:](PregateAnalyzer, "pregateFailureReasonsToString:");
    if (v19)
    {
      uint64_t v20 = [(__CFString *)v3 stringByAppendingString:v19];

      uint64_t v3 = (__CFString *)v20;
    }
  }
LABEL_41:

  return v3;
}

void sub_1DD3B0C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B0CB4(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v5 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || a2 > 3) {
    goto LABEL_43;
  }
  if (!sub_1DD3BE1B0(a1, a2))
  {
    uint64_t v5 = 0;
    goto LABEL_42;
  }
  uint64_t v8 = sub_1DD3BE450(a1, a2);
  uint64_t v5 = (uint64_t)v8;
  if (!v8)
  {
LABEL_42:
    uint64_t result = 0xFFFFFFFFLL;
    goto LABEL_43;
  }
  uint64_t result = *((unsigned int *)v8 + 1);
  int v9 = *(_DWORD *)(v5 + 8);
  uint64_t v10 = result == 0;
  if (!v9) {
    v10 |= 0x40uLL;
  }
  int v11 = *(_DWORD *)(v5 + 12);
  int v12 = *(_DWORD *)(v5 + 16);
  if (!v11) {
    v10 |= 2uLL;
  }
  if (!v12) {
    v10 |= 4uLL;
  }
  int v13 = *(_DWORD *)(v5 + 20);
  int v14 = *(_DWORD *)(v5 + 24);
  if (!v13) {
    v10 |= 8uLL;
  }
  if (!v14) {
    v10 |= 0x80uLL;
  }
  int v15 = *(_DWORD *)(v5 + 28);
  int v16 = *(_DWORD *)(v5 + 32);
  if (!v15) {
    v10 |= 0x10uLL;
  }
  int v17 = *(_DWORD *)(v5 + 36);
  if (!v17) {
    v10 |= 0x20uLL;
  }
  if (!v16) {
    v10 |= 0x10000uLL;
  }
  if (result == -2) {
    v10 |= 0x100uLL;
  }
  if (v9 == -2) {
    uint64_t v18 = v10 | 0x4000;
  }
  else {
    uint64_t v18 = v10;
  }
  if (v11 == -2) {
    v18 |= 0x200uLL;
  }
  if (v12 == -2) {
    v18 |= 0x400uLL;
  }
  if (v13 == -2) {
    v18 |= 0x800uLL;
  }
  if (v14 == -2) {
    v18 |= 0x8000uLL;
  }
  if (v15 == -2) {
    v18 |= 0x1000uLL;
  }
  if (v17 == -2) {
    v18 |= 0x2000uLL;
  }
  if (v16 == -2) {
    v18 |= 0x20000uLL;
  }
  uint64_t v5 = v18 | (*(void *)(v5 + 56) << 48);
LABEL_43:
  if (a3) {
    *a3 = v5;
  }
  return result;
}

uint64_t getGatingResult(uint64_t a1, unsigned int a2, void *a3)
{
  unint64_t v7 = -1;
  uint64_t v4 = sub_1DD3B0CB4(a1, a2, (uint64_t *)&v7);
  uint64_t v5 = v4;
  if (a3)
  {
    sub_1DD3B09B4(v4, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

id sub_1DD3B0E7C(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v3 = [v2 UUIDString];
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v1 path];
    uint64_t v6 = [v4 attributesOfItemAtPath:v5 error:0];

    unint64_t v7 = [v1 URLByAppendingPathComponent:v3 isDirectory:1];
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = 0;
    char v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v6 error:&v12];
    id v10 = v12;

    if ((v9 & 1) == 0)
    {
      NSLog(&cfstr_ErrorCreatingU.isa, v7, v10);

      unint64_t v7 = 0;
    }
  }
  else
  {
    id v10 = 0;
    unint64_t v7 = 0;
  }

  return v7;
}

void sub_1DD3B0FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1DD3B1048(void *a1, double a2, double a3, float a4)
{
  id v7 = a1;
  uint64_t v8 = v7;
  double width = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a4 > 0.0)
  {
    double v11 = a2 <= a3 ? a3 : a2;
    float v12 = v11;
    float v13 = v12 / a4;
    double width = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v13 > 1.0)
    {
      double v14 = v13;
      float v15 = a2 / v13;
      float v16 = ceilf(v15 * 0.5);
      double v17 = (double)(float)(v16 + v16);
      *(float *)&double v14 = a3 / v14;
      *(float *)&double v14 = ceilf(*(float *)&v14 * 0.5);
      unsigned int v18 = (float)(*(float *)&v14 + *(float *)&v14);
      BOOL v19 = a2 < v17 || a3 < (double)v18;
      double width = *MEMORY[0x1E4F1DB30];
      double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (!v19)
      {
        double width = v17;
        double v10 = (double)v18;
      }
    }
  }
  if (width != *MEMORY[0x1E4F1DB30] || v10 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    CMTime v21 = [v7 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    unsigned int v22 = v21;
    if (v21 && [v21 count] == 1)
    {
      uint64_t v23 = [v22 objectAtIndex:0];
      int32_t v24 = v23;
      if (v23)
      {
        [v23 preferredTransform];
        v27.origin.x = 0.0;
        v27.origin.y = 0.0;
        v27.size.double width = width;
        v27.size.height = v10;
        CGRect v28 = CGRectApplyAffineTransform(v27, &v26);
        double width = v28.size.width;
      }
    }
  }

  return width;
}

void sub_1DD3B11D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t renderGIF_0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F16330] assetWithURL:v5];
  char v9 = (uint64_t *)sub_1DD3D0C38(v8, (uint64_t)v22);

  if (v9)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    sub_1DD3E4B28(v9, 0, (uint64_t)&v19);
    float v10 = (float)(int)v20 / (float)v19;
    double v11 = (void *)*v9;
    if (*v9)
    {
      v9[1] = (uint64_t)v11;
      operator delete(v11);
    }
    MEMORY[0x1E01B4150](v9, 0x20C40960023A9);
    if (sub_1DD3DF478(v5, (uint64_t)v6, 0x280u, v7, v10))
    {
      float v12 = +[LoopQuicktimeMetadata metadataStringForAssetURL:v5];
      if (!v12)
      {
        uint64_t v17 = 1;
LABEL_16:

        goto LABEL_17;
      }
      CFDataRef v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6];
      CFDataRef v14 = v13;
      if (v13)
      {
        float v15 = sub_1DD3D8818(v13, v12);
        float v16 = v15;
        if (v15)
        {
          uint64_t v17 = [(__CFData *)v15 writeToURL:v6 atomically:1];
          if ((v17 & 1) == 0) {
            NSLog(&cfstr_Creategiffromv_0.isa);
          }
          CFRelease(v16);
          goto LABEL_15;
        }
        NSLog(&cfstr_Creategiffromv.isa);
      }
      uint64_t v17 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  uint64_t v17 = 0;
LABEL_17:

  return v17;
}

void sub_1DD3B13B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id liveAnalysisResultToDictionary(void *a1)
{
  if (a1)
  {
    a1 = sub_1DD3BF0A0((uint64_t)a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

void liveAnalysisResultFromDictionary(void *a1)
{
  id v1 = a1;
  operator new();
}

void sub_1DD3B14B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t validateLiveAnalysisDictionaryFormatAndVersion(void *a1)
{
  if (a1) {
    operator new();
  }

  return 4294967292;
}

void sub_1DD3B1568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3B1580(void *a1, int a2)
{
  if (a1)
  {
    int v5 = 0;
    uint64_t v3 = (uint64_t *)sub_1DD3BE598(a1, a2, &v5);
    a1 = 0;
    if (v3 && !v5)
    {
      a1 = sub_1DD3C9BE4(v3);
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

id buildLoopRecipeDictFromLiveAnalysisDict(void *a1)
{
  id v1 = a1;
  if (v1) {
    liveAnalysisResultFromDictionary(v1);
  }

  return 0;
}

void sub_1DD3B1644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t liveAnalysisResultDestroy(uint64_t result)
{
  if (result)
  {
    sub_1DD3BE594();
    JUMPOUT(0x1E01B4150);
  }
  return result;
}

__CFString *autoloopErrorCodeToString(unsigned int a1)
{
  if (a1 > 0x21) {
    return @"Failed: Other error";
  }
  else {
    return off_1E6CBFF28[a1];
  }
}

uint64_t sub_1DD3B16B8(unsigned int a1)
{
  sub_1DD3BE68C(a1);
  id v1 = objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 UTF8String];

  return v2;
}

void sub_1DD3B16F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_1DD3B1704(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a3;
  a1[1] = a2;
  if ((sub_1DD3DCFD4(a3, (void *)(a2 + 160)) & 1) == 0)
  {
    fwrite("VideoParserNormalizer: VideoParser and FrameTimeNormalizer disagree on raw frame times.\n", 0x58uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](exception, "VideoParserNormalizer frame time error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  return a1;
}

void sub_1DD3B1794(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DD3B17A8(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1DD3B17FC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1DD3B17FC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    int v5 = *(void **)(i - 24);
    uint64_t v4 = v5;
    if (v5) {
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void sub_1DD3B1844(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_1DD3B1898((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_1DD3B1898(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      id v6 = *(void **)(v4 - 24);
      v4 -= 24;
      int v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t sub_1DD3B18F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_1DD3B1900(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    id v6 = result;
    uint64_t result = sub_1DD3B197C(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DD3B1960(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1DD3B197C(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1DD3A9B50();
  }
  uint64_t result = (char *)sub_1DD3A9BF8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_1DD3B19D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1DD3A9C40();
  }
  return operator new(8 * a2);
}

void sub_1DD3B1A08(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1DD3B1A08(a1, *a2);
    sub_1DD3B1A08(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **sub_1DD3B1A5C(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  id v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        char v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        id v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      id v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    char v9 = a1 + 1;
LABEL_10:
    double v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    sub_1DD3B1B20(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_1DD3B1B20(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_1DD3B1B78(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1DD3B1B78(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            char v9 = (uint64_t **)a2[2];
          }
          else
          {
            char v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *char v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t validateAutoLoopSettings(void *a1, void *a2)
{
  int v4 = 0;
  return sub_1DD3A7E54(a1, a2, 1, &v4, &v3);
}

uint64_t runAutoLoopPipeline(void *a1, void *a2, void *a3, uint64_t *a4, void *a5, uint64_t a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a7;
  uint64_t v21 = 0;
  int v20 = 0;
  uint64_t v16 = sub_1DD3AC1D0(a1, v13, v14, 1, &v20, &v21, a5, v15);
  uint64_t v17 = v16;
  if (a4)
  {
    if (!v16)
    {
      BOOL v18 = liveAnalysisResultCopyRecipe(v21, 0, a4);
      if (v18)
      {
        printf("Error retrieving autoloop recipe, laRecipeErrorCode = %d.\n", v18);
        *a4 = 0;
      }
    }
  }
  if (a6 && !v17 && v21 && sub_1DD3BE450((uint64_t)v21, 0)) {
    operator new();
  }
  liveAnalysisResultDestroy((uint64_t)v21);

  return v17;
}

void sub_1DD3B1EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL liveAnalysisResultCopyRecipe(void *a1, int a2, uint64_t *a3)
{
  if (a3) {
    *a3 = 0;
  }
  int v4 = -1;
  int v7 = -1;
  if (a1)
  {
    uint64_t v5 = sub_1DD3BE598(a1, a2, &v7);
    int v4 = v7;
    if (a3)
    {
      if (v5 && !v7) {
        *a3 = v5;
      }
    }
  }
  return v4 != 0;
}

unint64_t runAutoLoopRender(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6)
  {
    id v15 = sub_1DD3B0E7C(v11);
    if (v15)
    {
      if (v14[2](v14, 0.0))
      {
        int v16 = *(_DWORD *)(a6 + 24);
        if (v16 && v16 != 3)
        {
          NSLog(&cfstr_AutoloopRender.isa);
          unint64_t v18 = 5;
        }
        else
        {
          if (*(unsigned char *)(a1 + 196)) {
            char v17 = sub_1DD3B44CC(v12) == 0;
          }
          else {
            char v17 = 0;
          }
          double v19 = sub_1DD3B1048(v12, *(double *)(a6 + 48), *(double *)(a6 + 56), (float)*(int *)(*(void *)(a1 + 240) + 28));
          unint64_t v18 = sub_1DD3B39F8(v12, a6, 0, v15, v17, v14, v13, v19, v20);
        }
      }
      else
      {
        unint64_t v18 = 1;
      }
      v14[2](v14, 1.0);
      uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v21 removeItemAtURL:v15 error:0];
    }
    else
    {
      unint64_t v18 = 28;
    }
  }
  else
  {
    unint64_t v18 = 5;
  }

  return v18;
}

void sub_1DD3B20C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t runPingPongRender(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6)
  {
    id v15 = sub_1DD3B0E7C(v11);
    if (v15)
    {
      if (v14[2](v14, 0.0))
      {
        if (*(_DWORD *)(a6 + 24) == 1)
        {
          double v16 = sub_1DD3B1048(v12, *(double *)(a6 + 48), *(double *)(a6 + 56), (float)*(int *)(*(void *)(a1 + 240) + 28));
          CMTime v22 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
          if (*(void *)(a6 + 8) != *(void *)a6) {
            CMTime v22 = *(CMTime *)(**(void **)a6 + 24);
          }
          CMTime v21 = v22;
          uint64_t v18 = sub_1DD3BD2FC(v12, (uint64_t *)a6, 0, v15, 0, &v21, v14, v13, v16, v17);
          if (v18) {
            NSLog(&cfstr_ErrorOnAlpingp.isa);
          }
        }
        else
        {
          NSLog(&cfstr_CalledPingpong.isa);
          uint64_t v18 = 5;
        }
      }
      else
      {
        uint64_t v18 = 1;
      }
      v14[2](v14, 1.0);
      double v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v19 removeItemAtURL:v15 error:0];
    }
    else
    {
      uint64_t v18 = 28;
    }
  }
  else
  {
    uint64_t v18 = 5;
  }

  return v18;
}

void sub_1DD3B22C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t renderStabilizedVideo(void *a1, void *a2, void *a3, int a4, void *a5, double a6, double a7)
{
  id v13 = a1;
  id v14 = a3;
  id v15 = a5;
  if (a2)
  {
    double v16 = sub_1DD3B0E7C(v13);
    if (v16)
    {
      unint64_t v17 = 5;
      if (v14 && v15)
      {
        id v18 = a2;
        unint64_t v17 = sub_1DD3B4384(v18, v14, v16, a4, &unk_1F3891F58, v15, a6, a7);
        double v19 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v19 removeItemAtURL:v16 error:0];
      }
    }
    else
    {
      unint64_t v17 = 28;
    }
  }
  else
  {
    unint64_t v17 = 5;
  }

  return v17;
}

void sub_1DD3B240C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B2440()
{
  return 1;
}

void alStabilizeParamsDestroy(id a1)
{
  if (a1) {
}
  }

id alStabilizeParamsToDict(void *a1)
{
  if (a1)
  {
    a1 = [a1 infoAsDict];
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t alStabilizeParamsFromDictionary(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t alGatingResultsDestroy(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;

    JUMPOUT(0x1E01B4150);
  }
  return result;
}

uint64_t extractGatingDecision(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 4);
  }
  else {
    return 4294967294;
  }
}

uint64_t extractGatingResult(uint64_t a1, unsigned int a2, uint64_t *a3, int *a4)
{
  uint64_t result = sub_1DD3B0CB4(a1, a2, a3);
  if (a4)
  {
    int v6 = result == -1;
    if (result == -2) {
      int v6 = 3;
    }
    *a4 = v6;
  }
  return result;
}

uint64_t createGatingDetailString(int a1, unint64_t a2)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t getFlavor(uint64_t result, _DWORD *a2)
{
  if (a2)
  {
    *a2 = 0;
    if (!result)
    {
      *a2 = 1;
      return result;
    }
    return *(unsigned int *)(result + 24);
  }
  if (result) {
    return *(unsigned int *)(result + 24);
  }
  return result;
}

uint64_t alLoopRecipeDestroy(uint64_t result)
{
  if (result)
  {
    sub_1DD3B4C78();
    JUMPOUT(0x1E01B4150);
  }
  return result;
}

uint64_t *alLoopRecipeToDict(uint64_t *a1)
{
  if (a1)
  {
    sub_1DD3C9BE4(a1);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

void alLoopRecipeFromDictionary(void *a1)
{
  id v1 = a1;
  operator new();
}

void sub_1DD3B2698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t createGIFFromVideo(void *a1, void *a2)
{
  return renderGIF_0(a1, a2, &unk_1F3891FF8);
}

uint64_t sub_1DD3B26DC()
{
  return 1;
}

void *sub_1DD3B26E4(uint64_t a1, long long *a2)
{
  size_t v2 = *((unsigned int *)a2 + 3);
  if (v2)
  {
    uint64_t v5 = *(_DWORD **)(a1 + 8);
    unsigned int v7 = v5[6];
    unsigned int v6 = v5[7];
    int v8 = *((_DWORD *)a2 + 5);
    unint64_t v9 = v5[17];
    int v29 = 1065353216;
    sub_1DD3B2E2C(&v30, v9, &v29);
    if (*(_DWORD *)(*(void *)(a1 + 8) + 64) == 875704438 && v31 != v30)
    {
      uint64_t v10 = 0;
      unsigned int v11 = 0;
      do
      {
        float v12 = sub_1DD3D4104(v11);
        id v13 = v30;
        v30[v10] = v12;
        uint64_t v10 = ++v11;
      }
      while (v11 < (unint64_t)(v31 - v13));
    }
    id v14 = malloc_type_calloc(4 * v6 * (unint64_t)v7 * v2, 1uLL, 0x49C4D4CDuLL);
    qos_class_t v15 = qos_class_self();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 1174405120;
    v18[2] = sub_1DD3B28C8;
    v18[3] = &unk_1F3891F08;
    int v23 = v8;
    long long v24 = *a2;
    uint64_t v25 = *((void *)a2 + 2);
    int v26 = v2;
    v18[4] = a1;
    __p = 0;
    double v20 = 0;
    uint64_t v21 = 0;
    sub_1DD3B2F2C(&__p, v30, (uint64_t)v31, v31 - v30);
    global_queue = dispatch_get_global_queue(v15, 0);
    CMTime v22 = v14;
    unsigned int v27 = v6;
    unsigned int v28 = v7;
    dispatch_apply(v2, global_queue, v18);
    if (__p)
    {
      double v20 = __p;
      operator delete(__p);
    }
    if (v30)
    {
      long long v31 = v30;
      operator delete(v30);
    }
  }
  else
  {
    puts("createPixelDifferenceBuffer error: Fade length 0 is invalid.");
    return 0;
  }
  return v14;
}

void sub_1DD3B28A4(_Unwind_Exception *exception_object)
{
  CMTime v3 = *(void **)(v1 - 88);
  if (v3)
  {
    *(void *)(v1 - 80) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B28C8(uint64_t a1, unint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 72);
  if (v4 == 1)
  {
    unint64_t v7 = *(unsigned int *)(a1 + 100);
    unint64_t v8 = v7 >> 1;
    if (v7 >> 1 > a2)
    {
      int v9 = *(_DWORD *)(a1 + 76);
      uint64_t v5 = (v9 - a2);
      uint64_t v6 = (v9 + a2);
      goto LABEL_9;
    }
    if ((v7 & 0xFFFFFFFE) > a2)
    {
      int v10 = *(_DWORD *)(a1 + 76) + *(_DWORD *)(a1 + 80) - 1;
      int v11 = a2 - v8;
      uint64_t v5 = (v10 - v11);
      uint64_t v6 = (v10 + v11);
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
    uint64_t v5 = (*(_DWORD *)(a1 + 76) + a2);
    uint64_t v6 = (v5 + *(_DWORD *)(a1 + 80));
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  uint64_t v5 = 0;
LABEL_9:
  float v12 = *(void **)(a1 + 32);
  int v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)*v12 + 16))(*v12, v5);
  uint64_t v14 = v12[1];
  uint64_t v15 = *(void *)(v14 + 184);
  int v16 = *(_DWORD *)(v14 + 192);
  unint64_t v17 = *(void **)(a1 + 32);
  int v18 = (*(uint64_t (**)(void, uint64_t))(*(void *)*v17 + 16))(*v17, v6);
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(_DWORD *)(result + 68))
  {
    unint64_t v20 = 0;
    uint64_t v60 = v15 + (v16 * v13);
    uint64_t v59 = *(void *)(v17[1] + 184) + (*(_DWORD *)(v17[1] + 192) * v18);
    do
    {
      long long v61 = (int *)sub_1DD3DB26C(result, v20);
      uint64_t v22 = v59;
      uint64_t v21 = v60;
      if (v20)
      {
        uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
        int v24 = 1;
        uint64_t v21 = v60;
        do
        {
          uint64_t v25 = sub_1DD3DB26C(v23, v24 - 1);
          v21 += (*(_DWORD *)(v25 + 4) * *(_DWORD *)(v25 + 8));
          BOOL v37 = v20 == v24++;
        }
        while (!v37);
        uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 8);
        int v27 = 1;
        uint64_t v22 = v59;
        do
        {
          uint64_t v28 = sub_1DD3DB26C(v26, v27 - 1);
          v22 += (*(_DWORD *)(v28 + 4) * *(_DWORD *)(v28 + 8));
          BOOL v37 = v20 == v27++;
        }
        while (!v37);
      }
      uint64_t v29 = v61[1];
      if (v29)
      {
        int v30 = 0;
        uint64_t v31 = 0;
        int v32 = v61[5];
        int v33 = v61[6];
        float v34 = *(float *)(*(void *)(a1 + 40) + 4 * v20) * (float)(1.0 / (float)(v33 * v32));
        int v35 = v61[2];
        int v36 = *v61;
        BOOL v37 = v32 == 1 && v33 == 1;
        char v38 = v37;
        do
        {
          if (v36)
          {
            unsigned int v39 = 0;
            unsigned int v40 = 0;
            int v41 = 0;
            uint64_t v42 = (v35 * v31);
            uint64_t v43 = v21 + v42;
            uint64_t v44 = v22 + v42;
            uint64_t v45 = v61[4];
            do
            {
              unsigned int v46 = 0;
              if (v45)
              {
                uint64_t v47 = v45;
                unsigned int v48 = v40;
                do
                {
                  int v49 = *(unsigned __int8 *)(v43 + v48) - *(unsigned __int8 *)(v44 + v48);
                  if (v49 < 0) {
                    int v49 = *(unsigned __int8 *)(v44 + v48) - *(unsigned __int8 *)(v43 + v48);
                  }
                  v46 += v49;
                  ++v48;
                  --v47;
                }
                while (v47);
              }
              float v50 = v34 * (float)v46;
              if (v38)
              {
                unint64_t v51 = ((v41 + *(_DWORD *)(a1 + 104) * v31) * *(_DWORD *)(a1 + 100)) + a2;
                *(float *)(*(void *)(a1 + 64) + 4 * v51) = v50 + *(float *)(*(void *)(a1 + 64) + 4 * v51);
              }
              else if (v32)
              {
                int v52 = 0;
                int v53 = v30;
                do
                {
                  if (v33)
                  {
                    unsigned int v54 = *(_DWORD *)(a1 + 108);
                    unsigned int v55 = v39;
                    int v56 = v33;
                    do
                    {
                      if (v52 + v32 * (int)v31 < v54)
                      {
                        unsigned int v57 = *(_DWORD *)(a1 + 104);
                        if (v55 < v57)
                        {
                          unint64_t v58 = *(_DWORD *)(a1 + 100) * (v55 + v53 * v57) + a2;
                          *(float *)(*(void *)(a1 + 64) + 4 * v58) = v50 + *(float *)(*(void *)(a1 + 64) + 4 * v58);
                        }
                      }
                      ++v55;
                      --v56;
                    }
                    while (v56);
                  }
                  ++v52;
                  ++v53;
                }
                while (v52 != v32);
              }
              ++v41;
              v40 += v45;
              v39 += v33;
            }
            while (v41 != v36);
          }
          ++v31;
          v30 += v32;
        }
        while (v31 != v29);
      }
      ++v20;
      uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
    }
    while (v20 < *(unsigned int *)(result + 68));
  }
  return result;
}

void *sub_1DD3B2C30(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  size_t v2 = (void *)(a1 + 40);
  v2[2] = 0;
  return sub_1DD3B2F2C(v2, *(const void **)(a2 + 40), *(void *)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 2);
}

void sub_1DD3B2C4C(uint64_t a1)
{
  size_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void sub_1DD3B2C64()
{
}

void sub_1DD3B2E08(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x80C40D6874129);
  _Unwind_Resume(a1);
}

void *sub_1DD3B2E2C(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B2EB0(a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    unint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1DD3B2E94(_Unwind_Exception *exception_object)
{
  CMTime v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1DD3B2EB0(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1DD3A9B50();
  }
  uint64_t result = (char *)sub_1DD3B2EF4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_1DD3B2EF4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1DD3A9C40();
  }
  return operator new(4 * a2);
}

void *sub_1DD3B2F2C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1DD3B2EB0(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DD3B2F8C(_Unwind_Exception *exception_object)
{
  CMTime v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3B2FA8(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(a1 + 40) = a2;
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = *(_DWORD *)(v5 + 24);
  LODWORD(v5) = *(_DWORD *)(v5 + 28);
  *(_DWORD *)(a1 + 48) = v6;
  *(_DWORD *)(a1 + 52) = v5;
  sub_1DD3B3408((void *)(a1 + 80), (v5 * v6));
  sub_1DD3B3408((void *)(a1 + 104), (*(_DWORD *)(a1 + 52) * *(_DWORD *)(a1 + 48)));
  *(_DWORD *)(a1 + 72) = a3;
  operator new();
}

void sub_1DD3B3044(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;
  MEMORY[0x1E01B4150](v5, 0x10F0C40DDF9AC21);
  uint64_t v7 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 112) = v7;
    operator delete(v7);
  }
  size_t v8 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 88) = v8;
    operator delete(v8);
  }
  _Unwind_Resume(a1);
}

void *sub_1DD3B30A0(void *a1)
{
  size_t v2 = (void *)a1[4];
  if (v2)
  {
    CMTime v3 = (void *)v2[17];
    if (v3)
    {
      v2[18] = v3;
      operator delete(v3);
    }
    uint64_t v4 = (void *)v2[14];
    if (v4)
    {
      v2[15] = v4;
      operator delete(v4);
    }
    uint64_t v5 = (void *)v2[11];
    if (v5)
    {
      v2[12] = v5;
      operator delete(v5);
    }
    int v6 = (void *)v2[8];
    if (v6)
    {
      void v2[9] = v6;
      operator delete(v6);
    }
    uint64_t v7 = (void *)v2[5];
    if (v7)
    {
      v2[6] = v7;
      operator delete(v7);
    }
    MEMORY[0x1E01B4150](v2, 0x10F0C40DDF9AC21);
  }
  size_t v8 = (void *)a1[13];
  if (v8)
  {
    a1[14] = v8;
    operator delete(v8);
  }
  int v9 = (void *)a1[10];
  if (v9)
  {
    a1[11] = v9;
    operator delete(v9);
  }
  return a1;
}

uint64_t sub_1DD3B3158(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(result + 64) = a2;
  *(_DWORD *)(result + 68) = a3;
  return result;
}

void sub_1DD3B3160(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 128);
  uint64_t v3 = *(unsigned int *)(a1 + 64);
  if (v2 != v3)
  {
    signed int v5 = *(_DWORD *)(a1 + 68);
LABEL_13:
    sub_1DD3D3E48(*(uint64_t **)(a1 + 40), v3, v5, (unint64_t *)(a1 + 80), (unint64_t *)(a1 + 104));
    goto LABEL_14;
  }
  signed int v4 = *(_DWORD *)(a1 + 132);
  signed int v5 = *(_DWORD *)(a1 + 68);
  if (v4 == v5) {
    return;
  }
  if (v2 == -1 || v4 == -1 || v4 >= v5) {
    goto LABEL_13;
  }
  sub_1DD3D3DDC(*(void *)(a1 + 40), *(unsigned int *)(a1 + 132), v2, *(_DWORD *)(a1 + 68), (void *)(a1 + 80), (void *)(a1 + 104));
LABEL_14:
  sub_1DD3B9570(*(void *)(a1 + 32), a1 + 80, a1 + 104);
  sub_1DD3B9820(*(void *)(a1 + 32), *(_DWORD *)(a1 + 72));
  sub_1DD3B9AE0(*(void *)(a1 + 32), *(uint64_t **)(a1 + 40), *(unsigned int *)(a1 + 64), *(_DWORD *)(a1 + 68));
  int v8 = *(_DWORD *)(a1 + 68);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(a1 + 132) = v8;
}

__n128 sub_1DD3B3214(uint64_t a1, unsigned int a2, float a3)
{
  sub_1DD3B3160(a1);
  *(_DWORD *)a1 = sub_1DD3B9A10(*(void *)(a1 + 32), a2, a3);
  *(_DWORD *)(a1 + 4) = a2;
  *(float *)(a1 + 8) = a3;
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 160);
  *(__n128 *)(a1 + 12) = result;
  return result;
}

__CFDictionary *sub_1DD3B326C(_DWORD *a1)
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v3 = Mutable;
  signed int v4 = a1 + 6;
  if (*a1) {
    signed int v5 = (const void **)MEMORY[0x1E4F1CFD0];
  }
  else {
    signed int v5 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  CFDictionaryAddValue(Mutable, @"levelExceeded", *v5);
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 1);
  CFDictionaryAddValue(v3, @"levelThreshold", v6);
  CFRelease(v6);
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberFloat32Type, a1 + 2);
  CFDictionaryAddValue(v3, @"areaThreshold", v7);
  CFRelease(v7);
  CFNumberRef v8 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 3);
  CFDictionaryAddValue(v3, @"runStartRow", v8);
  CFRelease(v8);
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 4);
  CFDictionaryAddValue(v3, @"runStartCol", v9);
  CFRelease(v9);
  CFNumberRef v10 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 5);
  CFDictionaryAddValue(v3, @"runNumRows", v10);
  CFRelease(v10);
  CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt32Type, v4);
  CFDictionaryAddValue(v3, @"runNumCols", v11);
  CFRelease(v11);
  return v3;
}

void *sub_1DD3B3408(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B347C(a1, a2);
    signed int v4 = (char *)a1[1];
    signed int v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1DD3B3460(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1DD3B347C(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    sub_1DD3A9B50();
  }
  __n128 result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void *sub_1DD3B34C0(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    CFNumberRef v6 = result;
    __n128 result = sub_1DD3B347C(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DD3B3520(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3B353C(unint64_t *a1, size_t a2)
{
  signed int v5 = (char *)a1[1];
  signed int v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      sub_1DD3A9B50();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    float v12 = &v7[v11];
    int v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      uint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      signed int v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void *sub_1DD3B3678(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B2EB0(a1, a2);
    signed int v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1DD3B36D4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DD3B36F0(void *a1, unint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B197C(a1, a2);
    unint64_t v6 = (void *)a1[1];
    uint64_t v7 = 3 * a2;
    unint64_t v8 = &v6[3 * a2];
    uint64_t v9 = 8 * v7;
    do
    {
      *unint64_t v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
      sub_1DD3B2F2C(v6, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1DD3B378C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_1DD3B37AC()
{
}

void sub_1DD3B37C4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1DD3B3820(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6CBFC60, MEMORY[0x1E4FBA1D0]);
}

void sub_1DD3B380C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1DD3B3820(std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void *sub_1DD3B3854(void *result)
{
  *__n128 result = 0;
  result[1] = 0;
  return result;
}

id *sub_1DD3B385C(id *a1)
{
  return a1;
}

uint64_t sub_1DD3B3890(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"ALGFeatInstrGlobalParams"];
  signed int v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;

  uint64_t v6 = [v3 objectForKeyedSubscript:@"ALGFeatInstrFeatureList"];
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = v6;

  if (*(void *)a1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    NSLog(&cfstr_Algfeatureinst.isa);
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

void sub_1DD3B391C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B392C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (!v5)
  {
    NSLog(&cfstr_Unpackfeaturea.isa);
LABEL_6:
    uint64_t v8 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"ALGFeatId"];

  if (!v7)
  {
    NSLog(&cfstr_Unpackfeaturea_0.isa);
    goto LABEL_6;
  }
  *a2 = [v6 objectForKeyedSubscript:@"ALGFeatId"];
  [v6 objectForKeyedSubscript:@"ALGFeatParams"];
  uint64_t v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

void sub_1DD3B39E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t sub_1DD3B39F8(void *a1, uint64_t a2, void *a3, void *a4, char a5, void *a6, void *a7, double a8, double a9)
{
  id v17 = a1;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  uint64_t v22 = v21;
  if (!v17 || !v21)
  {
    NSLog(&cfstr_AllooprenderNi.isa);
    unint64_t v27 = 5;
    goto LABEL_32;
  }
  unint64_t v51 = v21;
  int v49 = v20;
  double v24 = *(double *)a2;
  uint64_t v23 = *(void *)(a2 + 8);
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  BOOL v25 = a9 != 0.0 && a8 != 0.0;
  context = (void *)MEMORY[0x1E01B4410]();
  if (v18)
  {
    uint64_t v26 = +[LoopQuicktimeMetadata metadataArrayForDictionary:v18];
    if ((a5 & 1) == 0)
    {
      unint64_t v27 = v26;
LABEL_11:
      id v46 = v19;
      id v47 = v18;
      id v28 = v51;
      float v50 = (void *)v27;
      goto LABEL_15;
    }
    float v50 = v26;
  }
  else
  {
    float v50 = 0;
    unint64_t v27 = 0;
    if ((a5 & 1) == 0) {
      goto LABEL_11;
    }
  }
  if (v19)
  {
    id v46 = v19;
    id v47 = v18;
    id v29 = v19;
    int v30 = NSString;
    uint64_t v31 = [MEMORY[0x1E4F28F80] processInfo];
    int v32 = [v31 globallyUniqueString];
    int v33 = [v30 stringWithFormat:@"%@.%s", v32, "mov"];

    id v28 = [v29 URLByAppendingPathComponent:v33 isDirectory:0];

    unint64_t v27 = 0;
LABEL_15:
    uint64_t v34 = (v23 - *(void *)&v24) >> 3;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    v75[3] = sub_1DD3B3FE0;
    v75[4] = sub_1DD3B3FF0;
    id v76 = 0;
    uint64_t v69 = 0;
    long long v70 = &v69;
    uint64_t v71 = 0x3032000000;
    CMTime v72 = sub_1DD3B3FE0;
    CMTime v73 = sub_1DD3B3FF0;
    id v74 = 0;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1DD3B3FF8;
    _OWORD v58[3] = &unk_1E6CC0060;
    uint64_t v62 = &v69;
    BOOL v68 = v25;
    double v65 = a8;
    double v66 = a9;
    id v35 = v28;
    id v59 = v35;
    int v36 = (LoopAudioComposer *)(id)v27;
    uint64_t v60 = v36;
    char v63 = v75;
    id v20 = v49;
    id v61 = v49;
    CMTimeScale v64 = v77;
    uint64_t v67 = v34;
    BOOL v37 = (void *)MEMORY[0x1E01B45D0](v58);
    unsigned int v38 = alRender(v17, (double *)a2, v37);
    LODWORD(v27) = v38;
    if (v38)
    {
      unsigned int v39 = autoloopErrorCodeToString(v38);
      NSLog(&cfstr_AllooprenderAl.isa, v39);
      if (v27 == 1)
      {
        unsigned int v40 = [(id)v70[5] lastError];
        LODWORD(v27) = sub_1DD3B428C(v40);
        unsigned int v41 = 0;
        int v42 = 1;
LABEL_26:

        goto LABEL_27;
      }
      unsigned int v41 = 0;
      int v42 = 1;
    }
    else
    {
      if (a5)
      {
        unint64_t v27 = objc_alloc_init(LoopAudioComposer);
        uint64_t v43 = [MEMORY[0x1E4F16330] assetWithURL:v35];
        long long v56 = *(_OWORD *)(a2 + 64);
        uint64_t v57 = *(void *)(a2 + 80);
        long long v54 = *(_OWORD *)(a2 + 112);
        uint64_t v55 = *(void *)(a2 + 128);
        long long v52 = *(_OWORD *)(a2 + 88);
        uint64_t v53 = *(void *)(a2 + 104);
        int v44 = [(id)v27 composeLoopWithAudio:v43 withAudioSource:v17 startTime:&v56 fadeTime:&v54 periodTime:&v52 metadata:v50 andOutputURL:v51];

        if (v44)
        {
          NSLog(&cfstr_GenfadeloopErr.isa);
          unsigned int v41 = 27;
        }
        else
        {
          unsigned int v41 = 0;
        }

        unsigned int v40 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v40 removeItemAtURL:v35 error:0];
        int v42 = 0;
        goto LABEL_26;
      }
      int v42 = 0;
      unsigned int v41 = 0;
    }
LABEL_27:

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(v75, 8);

    id v19 = v46;
    id v18 = v47;
    goto LABEL_28;
  }
  NSLog(&cfstr_GenfadeloopReq.isa);
  unsigned int v41 = 0;
  LODWORD(v27) = 5;
  int v42 = 1;
  id v20 = v49;
LABEL_28:

  if (v42) {
    unint64_t v27 = v27;
  }
  else {
    unint64_t v27 = v41;
  }
  _Block_object_dispose(v77, 8);
  uint64_t v22 = v51;
LABEL_32:

  return v27;
}

void sub_1DD3B3EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,void *a34)
{
  _Block_object_dispose((const void *)(v39 - 232), 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);

  _Block_object_dispose((const void *)(v39 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B3FE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD3B3FF0(uint64_t a1)
{
}

uint64_t sub_1DD3B3FF8(uint64_t a1, void *a2, long long *a3, __CVBuffer *a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*(unsigned char *)(a1 + 104))
    {
      double v14 = *(double *)(a1 + 80);
      double v15 = *(double *)(a1 + 88);
    }
    else
    {
      [v7 extent];
      double v14 = v18;
      double v15 = v19;
    }
    int v20 = sub_1DD3DA94C(a4);
    id v21 = [VideoWriter alloc];
    uint64_t v22 = v20 | 0xE00u;
    uint64_t v23 = *MEMORY[0x1E4F15AB0];
    uint64_t v24 = *MEMORY[0x1E4F16228];
    uint64_t v25 = *((unsigned int *)a3 + 2);
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v37[0] = *MEMORY[0x1E4F1DAB8];
    v37[1] = v26;
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    LODWORD(v34) = v22;
    uint64_t v27 = [(VideoWriter *)v21 initForURL:*(void *)(a1 + 32) fileType:v23 codecType:v24 imgWidth:v14 imgHeight:v15 fps:v25 timeScale:COERCE_DOUBLE(__PAIR64__(DWORD1(v38), 30.0)) transform:v37 pixFormat:v34 metadata:*(void *)(a1 + 40)];
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      NSLog(&cfstr_AllooprenderEr.isa);
      goto LABEL_16;
    }
    int v30 = [[VideoContext alloc] initWithWriter:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) pixelFormatFlags:v22 colorManagement:1];
    uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8);
    int v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      NSLog(&cfstr_AllooprenderEr_0.isa);
      goto LABEL_16;
    }
  }
  if (v8)
  {
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v9 = sub_1DD3DB694(v8, 0, *(double *)(a1 + 80), *(double *)(a1 + 88));

      uint64_t v8 = (void *)v9;
    }
    size_t v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    long long v35 = *a3;
    uint64_t v36 = *((void *)a3 + 2);
    if (![v10 appendFrame:v8 frameTime:&v35 srcPixBuf:a4])
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      unint64_t v12 = *(void *)(v11 + 24);
      *(void *)(v11 + 24) = v12 + 1;
      uint64_t v13 = (*(uint64_t (**)(float))(*(void *)(a1 + 48) + 16))((float)v12 / (float)*(unint64_t *)(a1 + 96));
      goto LABEL_19;
    }
LABEL_16:
    uint64_t v13 = 0;
    goto LABEL_19;
  }
  uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) finish];
  id v17 = (void *)v16;
  uint64_t v13 = v16 == 0;
  if (v16) {
    NSLog(&cfstr_AllooprenderEr_1.isa, v16);
  }
  else {
    (*(void (**)(float))(*(void *)(a1 + 48) + 16))(1.0);
  }

  uint64_t v8 = 0;
LABEL_19:

  return v13;
}

void sub_1DD3B426C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B428C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 code];
    if (v3 == -11823)
    {
      uint64_t v4 = 31;
    }
    else
    {
      id v5 = [v2 userInfo];
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
        uint64_t v8 = v7;
        if (v7) {
          uint64_t v3 = [v7 code];
        }
      }
      if (v3 == -11823) {
        unsigned int v9 = 31;
      }
      else {
        unsigned int v9 = 29;
      }
      if (v3 == -12915) {
        uint64_t v4 = 30;
      }
      else {
        uint64_t v4 = v9;
      }
    }
  }
  else
  {
    uint64_t v4 = 29;
  }

  return v4;
}

void sub_1DD3B4358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t sub_1DD3B4384(void *a1, void *a2, void *a3, int a4, void *a5, void *a6, double a7, double a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  int v20 = v19;
  unint64_t v21 = 5;
  if (v15 && v16 && v19)
  {
    sub_1DD3B4568((uint64_t)v24);
    sub_1DD3B4F10((uint64_t)v24, v15, -2);
    if (a4) {
      char v22 = sub_1DD3B44CC(v16) == 0;
    }
    else {
      char v22 = 0;
    }
    unint64_t v21 = sub_1DD3B39F8(v16, (uint64_t)v24, 0, v17, v22, v18, v20, a7, a8);
    sub_1DD3B4C78(v24);
  }

  return v21;
}

void sub_1DD3B4498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1DD3B4C78(&a9);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B44CC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 tracksWithMediaType:*MEMORY[0x1E4F15BA8]];
    uint64_t v4 = v3;
    if (v3) {
      uint64_t v5 = 8 * ([v3 count] == 0);
    }
    else {
      uint64_t v5 = 8;
    }
  }
  else
  {
    uint64_t v5 = 5;
  }

  return v5;
}

void sub_1DD3B454C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1DD3B4568(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  uint64_t v1 = MEMORY[0x1E4F1F9F0];
  long long v2 = *MEMORY[0x1E4F1F9F0];
  *(_OWORD *)(a1 + 64) = *MEMORY[0x1E4F1F9F0];
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 88) = v2;
  *(void *)(a1 + 104) = v3;
  *(void *)(a1 + 128) = v3;
  *(void *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 112) = v2;
  double result = NAN;
  *(void *)(a1 + 24) = 0xFFFFFFFE00000000;
  return result;
}

uint64_t sub_1DD3B45A8(uint64_t a1, uint64_t a2, float *a3)
{
  if (a2)
  {
    *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 56);
    *(float *)(a1 + 24) = a3[5];
    long long v6 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 48) = v6;
    CMTime v16 = *(CMTime *)a2;
    unint64_t v7 = *(unsigned int *)a3;
    uint64_t v8 = *(void *)(a2 + 64);
    if (v7 >= (*(void *)(a2 + 72) - v8) >> 3) {
      unsigned int v9 = (long long *)MEMORY[0x1E4F1F9F8];
    }
    else {
      unsigned int v9 = *(long long **)(v8 + 8 * v7);
    }
    long long v11 = *v9;
    *(void *)(a1 + 80) = *((void *)v9 + 2);
    *(_OWORD *)(a1 + 64) = v11;
    CMTime time = v16;
    CMTimeMultiply(&v15, &time, *((_DWORD *)a3 + 1));
    *(CMTime *)(a1 + 88) = v15;
    CMTime v13 = v16;
    CMTimeMultiply(&v15, &v13, *((_DWORD *)a3 + 2));
    *(CMTime *)(a1 + 112) = v15;
    uint64_t v10 = sub_1DD3B46E0(a1, (CMTime *)a2, a3);
    if ((v10 & 1) == 0) {
      NSLog(&cfstr_AllooprecipeEr_0.isa);
    }
  }
  else
  {
    NSLog(&cfstr_AllooprecipeEr.isa);
    return 0;
  }
  return v10;
}

uint64_t sub_1DD3B46E0(uint64_t a1, CMTime *a2, float *a3)
{
  v39[0] = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 0;
  }
  float v25 = *a3;
  int v4 = *((_DWORD *)a3 + 2);
  unint64_t v23 = *((unsigned int *)a3 + 1);
  sub_1DD3B59AC(&v36, v23);
  uint64_t v5 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v5;
    operator delete(v5);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  *(CMTime *)a1 = v36;
  CMTime v36 = *a2;
  if (v4)
  {
    memset(&v35, 0, sizeof(v35));
    CMTime time = v36;
    CMTimeMultiply(&v35, &time, v23 - v4);
    long long v6 = operator new(8uLL);
    *long long v6 = LODWORD(v25) | ((unint64_t)(v23 + LODWORD(v25)) << 32);
    int v32 = v6 + 1;
    int v33 = v6 + 1;
    uint64_t v31 = v6;
    unint64_t v7 = (float *)operator new(8uLL);
    float v8 = (float)1u / (float)(v4 + 1);
    id v29 = v7 + 2;
    int v30 = v7 + 2;
    *unint64_t v7 = v8;
    v7[1] = 1.0 - v8;
    __p = v7;
    operator new();
  }
  uint64_t v9 = 1;
  if (v23)
  {
    unsigned int v24 = v23 + LODWORD(v25);
    memset(&v35, 0, sizeof(v35));
    CMTime v27 = v36;
    CMTimeMultiply(&v35, &v27, 0);
    long long v11 = (float *)operator new(4uLL);
    uint64_t v31 = v11;
    *long long v11 = v25;
    int v32 = v11 + 1;
    int v33 = v11 + 1;
    unint64_t v12 = (float *)operator new(4uLL);
    __p = v12;
    *unint64_t v12 = 1.0;
    id v29 = v12 + 1;
    int v30 = v12 + 1;
    CMTimeEpoch epoch = a2[2].epoch;
    unint64_t v14 = (a2[3].value - epoch) >> 3;
    if (v14 > LODWORD(v25))
    {
      uint64_t v15 = *(void *)(*(void *)(epoch + 8 * LODWORD(v25)) + 48);
      if (v15)
      {
        if (*(unsigned char *)v15)
        {
          float v16 = *(float *)(v15 + 4);
          unsigned int v17 = *(_DWORD *)(v15 + 8);
          if (LODWORD(v16) <= LODWORD(v25)) {
            float v18 = v25;
          }
          else {
            float v18 = *(float *)(v15 + 4);
          }
          while (LODWORD(v18) != LODWORD(v16))
          {
            ++LODWORD(v16);
            if (--v17 <= 1)
            {
              int v19 = 0;
              float v18 = v16;
              goto LABEL_20;
            }
          }
          int v19 = 1;
LABEL_20:
          unint64_t v20 = v17 + LODWORD(v18);
          if (v20 <= v24) {
            int v21 = v19;
          }
          else {
            int v21 = 0;
          }
          if (v14 <= v20) {
            int v22 = 0;
          }
          else {
            int v22 = v21;
          }
          if (v22)
          {
            float __src = v18;
            LODWORD(v38) = v17 + LODWORD(v18);
            sub_1DD3B542C((char *)&v31, (char *)&__src, (uint64_t)v39, 2uLL);
            float __src = (float)(v20 - LODWORD(v25)) / (float)v17;
            float v38 = 1.0 - __src;
            sub_1DD3B542C((char *)&__p, (char *)&__src, (uint64_t)v39, 2uLL);
          }
        }
      }
    }
    operator new();
  }
  return v9;
}

void sub_1DD3B4B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,void *a28,uint64_t a29)
{
  if (__p) {
    operator delete(__p);
  }
  if (a28) {
    operator delete(a28);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B4BB8(uint64_t a1)
{
  long long v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3 == v2)
  {
    long long v2 = v3;
    if (!v3) {
      return a1;
    }
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  do
  {
    uint64_t v6 = v2[v5];
    if (v6)
    {
      unint64_t v7 = *(void **)(v6 + 96);
      if (v7)
      {
        *(void *)(v6 + 104) = v7;
        operator delete(v7);
      }
      uint64_t v10 = (void **)(v6 + 72);
      sub_1DD3B1844(&v10);
      float v8 = *(void **)(v6 + 48);
      if (v8)
      {
        *(void *)(v6 + 56) = v8;
        operator delete(v8);
      }
      MEMORY[0x1E01B4150](v6, 0x10A0C4091D32064);
      long long v2 = *(void **)a1;
      uint64_t v3 = *(void **)(a1 + 8);
    }
    ++v5;
  }
  while (v5 < v3 - v2);
  if (v2)
  {
LABEL_11:
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_1DD3B4C7C(uint64_t a1, long long *a2, uint64_t *a3, void *a4, long long *a5, char a6)
{
  uint64_t v11 = *a3;
  uint64_t v10 = a3[1];
  unint64_t v12 = (v10 - *a3) >> 2;
  *(unsigned char *)(a1 + 120) = a6;
  long long v13 = *a5;
  *(void *)(a1 + 16) = *((void *)a5 + 2);
  *(_OWORD *)a1 = v13;
  if (a2)
  {
    long long v33 = *a2;
    uint64_t v14 = *((void *)a2 + 2);
  }
  else
  {
    long long v33 = *MEMORY[0x1E4F1F9F8];
    uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  uint64_t v34 = v14;
  *(_OWORD *)(a1 + 24) = v33;
  *(void *)(a1 + 40) = v14;
  sub_1DD3B5360(&v33, v12, MEMORY[0x1E4F1F9F8]);
  float v16 = (void *)(a1 + 48);
  uint64_t v15 = *(void **)(a1 + 48);
  if (v15)
  {
    *(void *)(a1 + 56) = v15;
    operator delete(v15);
    *float v16 = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
  }
  *(_OWORD *)(a1 + 48) = v33;
  *(void *)(a1 + 64) = v34;
  int v31 = 0;
  sub_1DD3B2E2C(__p, 9uLL, &v31);
  sub_1DD3B36F0(&v33, v12, (uint64_t)__p);
  sub_1DD3B53F0((uint64_t *)(a1 + 72));
  *(_OWORD *)(a1 + 72) = v33;
  *(void *)(a1 + 88) = v34;
  uint64_t v34 = 0;
  long long v33 = 0uLL;
  CMTime v35 = (void **)&v33;
  sub_1DD3B1844(&v35);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  uint64_t v17 = v10;
  LODWORD(__p[0]) = 0;
  sub_1DD3B2E2C(&v33, v12, __p);
  int v19 = (void *)(a1 + 96);
  float v18 = *(void **)(a1 + 96);
  if (v18)
  {
    *(void *)(a1 + 104) = v18;
    operator delete(v18);
    void *v19 = 0;
    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 112) = 0;
  }
  char v20 = 0;
  *(_OWORD *)(a1 + 96) = v33;
  *(void *)(a1 + 112) = v34;
  if (a2 && (uint64_t)(a4[1] - *a4) >> 2 == v12)
  {
    if (v17 == v11)
    {
      char v20 = 1;
    }
    else
    {
      uint64_t v21 = 0;
      unsigned int v22 = 1;
      char v20 = 1;
      do
      {
        unint64_t v23 = *(unsigned int *)(*a3 + 4 * v21);
        uint64_t v24 = *((void *)a2 + 8);
        if (v23 < (*((void *)a2 + 9) - v24) >> 3 && (float v25 = *(long long **)(v24 + 8 * v23)) != 0)
        {
          uint64_t v26 = *v16 + 24 * v21;
          long long v27 = *v25;
          *(void *)(v26 + 16) = *((void *)v25 + 2);
          *(_OWORD *)uint64_t v26 = v27;
          uint64_t v28 = (char *)(*(void *)(a1 + 72) + 24 * v21);
          if (v28 != (char *)v25 + 24) {
            sub_1DD3B542C(v28, *((char **)v25 + 3), *((void *)v25 + 4), (uint64_t)(*((void *)v25 + 4) - *((void *)v25 + 3)) >> 2);
          }
        }
        else
        {
          printf("alLoopFrameInstruction::initializeLoopFrameInstruction error, output frame %d, norm index %d.\n", v22 - 1, v23);
          char v20 = 0;
        }
        *(_DWORD *)(*v19 + 4 * v21) = *(_DWORD *)(*a4 + 4 * v21);
        uint64_t v21 = v22;
      }
      while (v12 > v22++);
    }
  }
  return v20 & 1;
}

void sub_1DD3B4EF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DD3B4F10(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  *(_DWORD *)(a1 + 24) = 3;
  *(_DWORD *)(a1 + 28) = a3;
  if (v5)
  {
    [v5 cropRect];
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v10;
    [v6 roiStart];
    *(_OWORD *)(a1 + 64) = v15;
    *(void *)(a1 + 80) = v16;
    [v6 roiLength];
    *(_OWORD *)(a1 + 88) = v15;
    *(void *)(a1 + 104) = v16;
    uint64_t v11 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)(a1 + 112) = *MEMORY[0x1E4F1FA48];
    *(void *)(a1 + 128) = *(void *)(v11 + 16);
    unsigned int v12 = [v6 numFrames];
    sub_1DD3B59AC(&v15, v12);
    long long v13 = *(void **)a1;
    if (*(void *)a1)
    {
      *(void *)(a1 + 8) = v13;
      operator delete(v13);
      *(void *)a1 = 0;
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
    }
    *(_OWORD *)a1 = v15;
    *(void *)(a1 + 16) = v16;
    if (v12)
    {
      [v6 getFrameInfo:0 frameInfo:&v15];
      operator new();
    }
  }
  else
  {
    NSLog(&cfstr_Preparerecipef.isa);
  }

  return v6 != 0;
}

void sub_1DD3B52FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3B5360(void *a1, unint64_t a2, long long *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B197C(a1, a2);
    uint64_t v6 = a1[1];
    uint64_t v7 = v6 + 24 * a2;
    uint64_t v8 = 24 * a2;
    do
    {
      long long v9 = *a3;
      *(void *)(v6 + 16) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v6 = v9;
      v6 += 24;
      v8 -= 24;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1DD3B53D4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3B53F0(uint64_t *a1)
{
  if (*a1)
  {
    sub_1DD3B1898(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_1DD3B542C(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  long long v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      sub_1DD3A9B50();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    double result = sub_1DD3B2EB0(v7, v11);
    long long v13 = (char *)v7[1];
    unsigned int v12 = (void **)(v7 + 1);
    long long v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      float v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unsigned int v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    double result = (char *)memmove(*(void **)result, __src, v14 - v9);
    long long v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    float v18 = v9;
    int v19 = v16;
LABEL_18:
    double result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *unsigned int v12 = &v9[v17];
  return result;
}

char *sub_1DD3B5538(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  long long v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    double result = sub_1DD3B197C(v7, v12);
    uint64_t v14 = (char *)v7[1];
    long long v13 = (void **)(v7 + 1);
    long long v9 = v14;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      float v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v13 = (void **)(result + 8);
  unint64_t v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    double result = (char *)memmove(*(void **)result, __src, v15 - v9);
    long long v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    float v18 = v9;
    int v19 = v16;
LABEL_18:
    double result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *long long v13 = &v9[v17];
  return result;
}

void sub_1DD3B5674(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  long long v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    sub_1DD3B53F0((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_1DD3B197C((void *)a1, v11);
    unint64_t v12 = sub_1DD3B5800(v8, a2, a3, *(void **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    uint64_t v13 = a2 + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3);
    sub_1DD3B593C((int)&v20, a2, v13, v9);
    unint64_t v12 = sub_1DD3B5800(v8, v13, a3, *(void **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  sub_1DD3B593C((int)&v21, a2, a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    uint64_t v17 = *(void *)(a1 + 8);
    do
    {
      int v19 = *(void **)(v17 - 24);
      v17 -= 24;
      float v18 = v19;
      if (v19)
      {
        *(void *)(v16 - 16) = v18;
        operator delete(v18);
      }
      uint64_t v16 = v17;
    }
    while (v17 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_1DD3B57F0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1DD3B57F8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *sub_1DD3B5800(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v4 = a4;
  unint64_t v10 = a4;
  unint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *int v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      sub_1DD3B2F2C(v4, *(const void **)v6, *(void *)(v6 + 8), (uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2);
      int v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_1DD3B58B4((uint64_t)v8);
  return v4;
}

void sub_1DD3B58A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1DD3B58B4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1DD3B58EC(a1);
  }
  return a1;
}

void sub_1DD3B58EC(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  if (v1 != v2)
  {
    uint64_t v3 = **(void **)(a1 + 16);
    do
    {
      id v5 = *(void **)(v3 - 24);
      v3 -= 24;
      int v4 = v5;
      if (v5)
      {
        *(void *)(v1 - 16) = v4;
        operator delete(v4);
      }
      uint64_t v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t sub_1DD3B593C(int a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if ((char *)v5 != a4) {
        sub_1DD3B542C(a4, *(char **)v5, *(void *)(v5 + 8), (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
      }
      v5 += 24;
      a4 += 24;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void *sub_1DD3B59AC(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B5A24(a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1DD3B5A08(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1DD3B5A24(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1DD3A9B50();
  }
  double result = (char *)sub_1DD3B19D0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_1DD3B5A68(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B197C(a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1DD3B5AE8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double sub_1DD3B5B04(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = @"Unknown";
  *(void *)(a1 + 88) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 41) = 0u;
  *(void *)(a1 + 60) = 0;
  *(void *)(a1 + 76) = 0;
  *(void *)(a1 + 68) = 0;
  *(_DWORD *)(a1 + 96) = -2;
  *(void *)(a1 + 104) = 0;
  uint64_t v2 = MEMORY[0x1E4F1F9F8];
  long long v3 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(a1 + 112) = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(v2 + 16);
  *(void *)(a1 + 128) = v4;
  *(void *)(a1 + 152) = v4;
  *(_OWORD *)(a1 + 136) = v3;
  *(void *)(a1 + 176) = v4;
  *(_OWORD *)(a1 + 160) = v3;
  *(void *)(a1 + 200) = v4;
  *(_OWORD *)(a1 + 184) = v3;
  *(_DWORD *)(a1 + 208) = -1;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 304) = 0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  return result;
}

uint64_t sub_1DD3B5B84(uint64_t a1)
{
  return *(unsigned int *)(a1 + 96);
}

uint64_t sub_1DD3B5B8C(uint64_t a1)
{
  if ((*(unsigned char *)a1 & 4) == 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(uint64_t ***)(a1 + 48);
  if (!v2 || !*(unsigned char *)(a1 + 56)) {
    return 0xFFFFFFFFLL;
  }
  sub_1DD3D34F0(v2, (unsigned int *)(a1 + 60), (uint64_t)&v4);
  uint64_t result = 0;
  *(_OWORD *)(a1 + 112) = v4;
  *(void *)(a1 + 128) = v5;
  return result;
}

uint64_t sub_1DD3B5BF4(uint64_t a1)
{
  if ((*(unsigned char *)a1 & 4) == 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(uint64_t **)(a1 + 48);
  if (!v2 || !*(unsigned char *)(a1 + 56)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = sub_1DD3D32F4(v2);
  uint64_t result = 0;
  *(void *)(a1 + 216) = v3;
  return result;
}

uint64_t sub_1DD3B5C48(uint64_t a1)
{
  if ((*(unsigned char *)a1 & 4) == 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(void **)(a1 + 48);
  if (!v2 || !*(unsigned char *)(a1 + 56)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = sub_1DD3D36A8(v2);
  uint64_t result = 0;
  *(void *)(a1 + 240) = v3;
  return result;
}

uint64_t sub_1DD3B5C9C(uint64_t a1)
{
  if (*(void *)(a1 + 248)) {
    return 0;
  }
  if ((*(unsigned char *)a1 & 4) != 0 && *(void *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 56)) {
      operator new();
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1DD3B5D30(uint64_t a1)
{
  if ((*(unsigned char *)a1 & 4) == 0 || !*(void *)(a1 + 48) || !*(unsigned char *)(a1 + 56)) {
    return 0xFFFFFFFFLL;
  }
  sub_1DD3B5B8C(a1);
  sub_1DD3B5BF4(a1);
  sub_1DD3B5C48(a1);
  return 0;
}

float sub_1DD3B5D8C(uint64_t a1, void *a2, int *a3)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 80))
  {
    int v6 = *a3;
  }
  else
  {
    int v6 = sub_1DD3CC2B4(a1 + 24, a1 + 80);
    *a3 = v6;
  }
  float v7 = 0.0;
  if (!v6)
  {
    if (*(unsigned char *)(a1 + 80)) {
      float v7 = sub_1DD3CC1C0((float *)(a1 + 80), v5, a3);
    }
    else {
      *a3 = -1;
    }
  }

  return v7;
}

void sub_1DD3B5E24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_1DD3B5E34(uint64_t *a1, uint64_t a2, int a3, int a4)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_1DD3B84E0(&v17);
  uint64_t v24 = 0;
  uint64_t v23 = 0;
  char v20 = 0;
  uint64_t v21 = 0;
  char v22 = 0;
  int v19 = 0;
  id v16 = 0;

  sub_1DD3B8698((uint64_t)&v11, a2, a3, a4);
  *(void *)&long long v17 = v11;
  objc_storeStrong((id *)&v17 + 1, v12);
  sub_1DD3B542C((char *)v18, (char *)__p, (uint64_t)v14, (v14 - (unsigned char *)__p) >> 2);
  v18[3] = v15;
  if (__p)
  {
    uint64_t v14 = __p;
    operator delete(__p);
  }

  unint64_t v8 = a1[1];
  if (v8 >= a1[2])
  {
    uint64_t v9 = sub_1DD3B8924(a1, (uint64_t)&v16);
  }
  else
  {
    sub_1DD3B8A4C((uint64_t)(a1 + 2), (__n128 *)a1[1], (uint64_t)&v16);
    uint64_t v9 = v8 + 104;
    a1[1] = v8 + 104;
  }
  a1[1] = v9;
  if (v19)
  {
    char v20 = v19;
    operator delete(v19);
  }
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }

  return a1;
}

void sub_1DD3B5F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_1DD3B6008((uint64_t)va);
  sub_1DD3B8830((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B5FCC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }

  return a1;
}

uint64_t sub_1DD3B6008(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    *(void *)(a1 + 64) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(void *)(a1 + 32) = v3;
    operator delete(v3);
  }

  return a1;
}

float sub_1DD3B605C(uint64_t *a1, void *a2, int *a3)
{
  id v5 = a2;
  uint64_t v6 = *a1;
  if (a1[1] == *a1)
  {
    puts("algProcImage:: Must initialize with input image before calling process.");
    *a3 = -1;
    float v8 = 0.0;
  }
  else
  {
    id v10 = *(id *)v6;
    sub_1DD3B87BC((uint64_t)v11, v6 + 8);
    __p = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    sub_1DD3B8D90(&__p, *(const void **)(v6 + 56), *(void *)(v6 + 64), (uint64_t)(*(void *)(v6 + 64) - *(void *)(v6 + 56)) >> 3);
    long long v7 = *(_OWORD *)(v6 + 80);
    int v18 = *(_DWORD *)(v6 + 96);
    long long v17 = v7;
    float v8 = sub_1DD3B5D8C((uint64_t)&v10, v5, a3);
    if (__p)
    {
      uint64_t v15 = __p;
      operator delete(__p);
    }
    if (v12)
    {
      uint64_t v13 = v12;
      operator delete(v12);
    }
  }
  return v8;
}

void sub_1DD3B6168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  sub_1DD3B6008((uint64_t)&a10);

  _Unwind_Resume(a1);
}

float sub_1DD3B61B0(uint64_t *a1, void *a2, void *a3, int *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (a1[1] == *a1)
  {
    puts("algProcImage:: Must initialize with input image before calling process.");
    *a4 = -1;
    float v18 = 0.0;
  }
  else
  {
    if (v7)
    {
      id v46 = a4;
      unint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v45 = v8;
      while (v10 < [v7 count])
      {
        uint64_t v12 = *a1 + 104 * v11;
        long long v49 = 0uLL;
        __p = 0;
        sub_1DD3B8D90(&__p, *(const void **)(v12 + 56), *(void *)(v12 + 64), (uint64_t)(*(void *)(v12 + 64) - *(void *)(v12 + 56)) >> 3);
        uint64_t v13 = __p;
        if ((void *)v49 == __p)
        {
          uint64_t v13 = (void *)v49;
LABEL_14:
          if (v13)
          {
            *(void *)&long long v49 = v13;
            operator delete(v13);
          }
          break;
        }
        unint64_t v14 = 0;
        unsigned int v15 = 1;
        while (1)
        {
          uint64_t v16 = *(void **)(*a1 + 104 * *((void *)v13 + v14));
          long long v17 = [v7 objectAtIndexedSubscript:v10];
          LOBYTE(v16) = [v16 isEqualToString:v17];

          if (v16) {
            break;
          }
          unint64_t v14 = v15;
          uint64_t v13 = __p;
          ++v15;
          if (v14 >= (uint64_t)(v49 - (void)__p) >> 3) {
            goto LABEL_14;
          }
        }
        uint64_t v11 = *((void *)__p + v14);
        ++v10;
        *(void *)&long long v49 = __p;
        operator delete(__p);
      }
      while (v10 < [v7 count])
      {
        __p = 0;
        sub_1DD3B84E0(&v49);
        uint64_t v56 = 0;
        uint64_t v57 = 0;
        uint64_t v53 = 0;
        uint64_t v54 = 0;
        long long v52 = 0;
        char v55 = 0;
        char v20 = [v7 objectAtIndexedSubscript:v10];
        uint64_t v21 = __p;
        __p = v20;

        char v47 = 0;
        uint64_t v22 = *a1;
        uint64_t v23 = [v7 objectAtIndexedSubscript:v10];
        sub_1DD3D01C8(v22 + 104 * v11 + 8, (uint64_t)&v49, v23, &v47);

        if (v47)
        {
          *id v46 = -1;
          uint64_t v24 = v11;
        }
        else
        {
          uint64_t v25 = *a1;
          unint64_t v26 = a1[1];
          if (v26 >= a1[2])
          {
            uint64_t v27 = sub_1DD3B8924(a1, (uint64_t)&__p);
          }
          else
          {
            sub_1DD3B8A4C((uint64_t)(a1 + 2), (__n128 *)a1[1], (uint64_t)&__p);
            uint64_t v27 = v26 + 104;
            a1[1] = v26 + 104;
          }
          uint64_t v24 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v26 - v25) >> 3);
          a1[1] = v27;
          uint64_t v28 = *a1 + 104 * v11;
          unint64_t v31 = *(void *)(v28 + 72);
          int v30 = (void *)(v28 + 72);
          unint64_t v29 = v31;
          long long v33 = (uint64_t **)(v30 - 1);
          int v32 = (uint64_t *)*(v30 - 1);
          if ((unint64_t)v32 >= v31)
          {
            CMTime v35 = (void **)(v30 - 2);
            CMTime v36 = (uint64_t *)*(v30 - 2);
            uint64_t v37 = v32 - v36;
            unint64_t v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 61) {
              sub_1DD3A9B50();
            }
            uint64_t v39 = v29 - (void)v36;
            if (v39 >> 2 > v38) {
              unint64_t v38 = v39 >> 2;
            }
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v40 = v38;
            }
            if (v40)
            {
              unsigned int v41 = (char *)sub_1DD3B19D0((uint64_t)v30, v40);
              int v32 = *v33;
              CMTime v36 = (uint64_t *)*v35;
            }
            else
            {
              unsigned int v41 = 0;
            }
            int v42 = (uint64_t *)&v41[8 * v37];
            *int v42 = v24;
            uint64_t v34 = v42 + 1;
            while (v32 != v36)
            {
              uint64_t v43 = *--v32;
              *--int v42 = v43;
            }
            *CMTime v35 = v42;
            *long long v33 = v34;
            *int v30 = &v41[8 * v40];
            if (v36) {
              operator delete(v36);
            }
          }
          else
          {
            *int v32 = v24;
            uint64_t v34 = v32 + 1;
          }
          *long long v33 = v34;
        }
        if (v52)
        {
          uint64_t v53 = v52;
          operator delete(v52);
        }
        if (v50)
        {
          unint64_t v51 = v50;
          operator delete(v50);
        }

        ++v10;
        uint64_t v11 = v24;
      }
      uint64_t v9 = v45;
      float v19 = sub_1DD3B5D8C(*a1 + 104 * v11, v45, v46);
    }
    else
    {
      float v19 = sub_1DD3B605C(a1, v8, a4);
    }
    float v18 = v19;
  }

  return v18;
}

void sub_1DD3B6580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  _Unwind_Resume(a1);
}

float sub_1DD3B6614(void *a1, void *a2, int *a3)
{
  id v5 = a2;
  *a3 = 0;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ALGFP_ImageId"];
  id v7 = [v5 objectForKeyedSubscript:@"ALGFP_ImageFilter"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"ALGFP_Statistic"];
  uint64_t v9 = (void *)v8;
  if (v6 && v8)
  {
    uint64_t v10 = a1[6];
    if (v10)
    {
      sub_1DD3D32D4(v10);
      uint64_t v11 = a1[6];
      if (v11) {
        sub_1DD3D32E4(v11);
      }
    }
    if ([v6 isEqualToString:@"ALGFP_ImageId_Activity"])
    {
      uint64_t v13 = (uint64_t *)a1[34];
      if (!v13)
      {
        if (!a1[30]) {
          sub_1DD3B5C48((uint64_t)a1);
        }
        operator new();
      }
    }
    else if ([v6 isEqualToString:@"ALGFP_ImageId_Activity_FirstThird"])
    {
      uint64_t v13 = (uint64_t *)a1[36];
      if (!v13)
      {
        if (!a1[30]) {
          sub_1DD3B5C48((uint64_t)a1);
        }
        operator new();
      }
    }
    else if ([v6 isEqualToString:@"ALGFP_ImageId_Activity_LastThird"])
    {
      uint64_t v13 = (uint64_t *)a1[37];
      if (!v13)
      {
        if (!a1[30]) {
          sub_1DD3B5C48((uint64_t)a1);
        }
        operator new();
      }
    }
    else if ([v6 isEqualToString:@"ALGFP_ImageId_Activity_FirstLastThirdMin"])
    {
      uint64_t v13 = (uint64_t *)a1[38];
      if (!v13)
      {
        if (!a1[30]) {
          sub_1DD3B5C48((uint64_t)a1);
        }
        operator new();
      }
    }
    else if ([v6 isEqualToString:@"ALGFP_ImageId_Variability"])
    {
      uint64_t v13 = (uint64_t *)a1[35];
      if (!v13)
      {
        if (!a1[30]) {
          sub_1DD3B5C48((uint64_t)a1);
        }
        operator new();
      }
    }
    else if ([v6 isEqualToString:@"ALGFP_ImageId_LoopClosure"])
    {
      uint64_t v13 = (uint64_t *)a1[32];
      if (!v13)
      {
        if (!a1[27]) {
          sub_1DD3B5BF4((uint64_t)a1);
        }
        operator new();
      }
    }
    else if ([v6 isEqualToString:@"ALGFP_ImageId_CandidateEnergies"])
    {
      uint64_t v13 = (uint64_t *)a1[33];
      if (!v13) {
        operator new();
      }
    }
    else
    {
      printf("processImageFeature error: Unknown image id: %s\n", (const char *)[v6 UTF8String]);
      uint64_t v13 = 0;
      *a3 = -1;
    }
    float v14 = sub_1DD3B61B0(v13, v7, v9, a3);
    if (*a3) {
      float v12 = 0.0;
    }
    else {
      float v12 = v14;
    }
  }
  else
  {
    *a3 = -1;
    float v12 = 0.0;
  }

  return v12;
}

void sub_1DD3B69FC(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v5, 0x20C40960023A9);

  _Unwind_Resume(a1);
}

float sub_1DD3B6A74(uint64_t a1, void *a2, void *a3, int *a4)
{
  id v7 = a2;
  id v8 = a3;
  *a4 = 0;
  if ([v7 isEqualToString:@"ALGFID_ProcessedImage"])
  {
    float Seconds = sub_1DD3B6614((void *)a1, v8, a4);
  }
  else if ([v7 isEqualToString:@"ALGFID_ActivityDetected3Levels"])
  {
    *a4 = -1;
    float Seconds = -1.0;
  }
  else if ([v7 isEqualToString:@"ALGFID_MaxIrisGapInLoop"])
  {
    if ((*(_DWORD *)(a1 + 124) & 0x1D) == 1)
    {
      int v10 = 0;
    }
    else
    {
      sub_1DD3B5B8C(a1);
      if ((*(_DWORD *)(a1 + 124) & 0x1D) == 1) {
        int v10 = 0;
      }
      else {
        int v10 = -1;
      }
    }
    *a4 = v10;
    CMTime time = *(CMTime *)(a1 + 112);
    float Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    *a4 = -1;
    printf("extractRequestedFeature error: Unknown featureId %s.\n", (const char *)[v7 UTF8String]);
    float Seconds = 0.0;
  }

  return Seconds;
}

void sub_1DD3B6BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B6BD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = sub_1DD3D32D0(v2);
    MEMORY[0x1E01B4150](v3, 0x20C40A4A59CD2);
    *(void *)(a1 + 48) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 216);
  if (v4)
  {
    uint64_t v5 = *(void **)v4;
    if (*(void *)v4)
    {
      *(void *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x1E01B4150](v4, 0x80C40D6874129);
    *(void *)(a1 + 216) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 224);
  if (v6)
  {
    id v7 = *(void **)v6;
    if (*(void *)v6)
    {
      *(void *)(v6 + 8) = v7;
      operator delete(v7);
    }
    MEMORY[0x1E01B4150](v6, 0x80C40D6874129);
    *(void *)(a1 + 224) = 0;
  }
  if (*(void *)(a1 + 240))
  {
    uint64_t v8 = sub_1DD3D327C();
    MEMORY[0x1E01B4150](v8, 0x20C40769AC3DALL);
    *(void *)(a1 + 240) = 0;
  }
  uint64_t v9 = *(id **)(a1 + 16);
  if (v9)
  {
    int v10 = sub_1DD3B385C(v9);
    MEMORY[0x1E01B4150](v10, 0x80C40803F642BLL);
    *(void *)(a1 + 16) = 0;
  }
  uint64_t v11 = *(void *)(a1 + 24);
  if (v11)
  {
    float v12 = *(void **)v11;
    if (*(void *)v11)
    {
      *(void *)(v11 + 8) = v12;
      operator delete(v12);
    }
    MEMORY[0x1E01B4150](v11, 0x80C40D6874129);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v13 = *(id **)(a1 + 32);
  if (v13)
  {
    float v14 = sub_1DD3B385C(v13);
    MEMORY[0x1E01B4150](v14, 0x80C40803F642BLL);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15)
  {
    uint64_t v16 = *(void **)v15;
    if (*(void *)v15)
    {
      *(void *)(v15 + 8) = v16;
      operator delete(v16);
    }
    MEMORY[0x1E01B4150](v15, 0x80C40D6874129);
    *(void *)(a1 + 40) = 0;
  }
  uint64_t v17 = *(void *)(a1 + 256);
  if (v17)
  {
    uint64_t v27 = *(void ***)(a1 + 256);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v17, 0x20C40960023A9);
    *(void *)(a1 + 256) = 0;
  }
  uint64_t v18 = *(void *)(a1 + 264);
  if (v18)
  {
    uint64_t v27 = *(void ***)(a1 + 264);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v18, 0x20C40960023A9);
    *(void *)(a1 + 264) = 0;
  }
  uint64_t v19 = *(void *)(a1 + 272);
  if (v19)
  {
    uint64_t v27 = *(void ***)(a1 + 272);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v19, 0x20C40960023A9);
    *(void *)(a1 + 272) = 0;
  }
  uint64_t v20 = *(void *)(a1 + 280);
  if (v20)
  {
    uint64_t v27 = *(void ***)(a1 + 280);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v20, 0x20C40960023A9);
    *(void *)(a1 + 280) = 0;
  }
  uint64_t v21 = *(void *)(a1 + 288);
  if (v21)
  {
    uint64_t v27 = *(void ***)(a1 + 288);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v21, 0x20C40960023A9);
    *(void *)(a1 + 288) = 0;
  }
  uint64_t v22 = *(void *)(a1 + 296);
  if (v22)
  {
    uint64_t v27 = *(void ***)(a1 + 296);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v22, 0x20C40960023A9);
    *(void *)(a1 + 296) = 0;
  }
  uint64_t v23 = *(void *)(a1 + 304);
  if (v23)
  {
    uint64_t v27 = *(void ***)(a1 + 304);
    sub_1DD3B8830(&v27);
    MEMORY[0x1E01B4150](v23, 0x20C40960023A9);
    *(void *)(a1 + 304) = 0;
  }
  uint64_t v24 = *(void *)(a1 + 248);
  if (v24)
  {
    uint64_t v25 = *(void **)v24;
    if (*(void *)v24)
    {
      *(void *)(v24 + 8) = v25;
      operator delete(v25);
    }
    MEMORY[0x1E01B4150](v24, 0x20C40960023A9);
    *(void *)(a1 + 248) = 0;
  }

  return a1;
}

id sub_1DD3B6F00(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 96)];
  [v6 setObject:v7 forKeyedSubscript:qword_1EAB20AF0];

  [v6 setObject:*(void *)(a1 + 104) forKeyedSubscript:qword_1EAB20AF8];
  CMTime time = *(CMTime *)(a1 + 136);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v6 setObject:v9 forKeyedSubscript:qword_1EAB20B08];

  CMTime v38 = *(CMTime *)(a1 + 160);
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v38, v8);
  [v6 setObject:v10 forKeyedSubscript:qword_1EAB20B10];

  CMTime v37 = *(CMTime *)(a1 + 184);
  CFDictionaryRef v11 = CMTimeCopyAsDictionary(&v37, v8);
  [v6 setObject:v11 forKeyedSubscript:qword_1EAB20B18];

  CMTime v36 = *(CMTime *)(a1 + 112);
  CFDictionaryRef v12 = CMTimeCopyAsDictionary(&v36, v8);
  [v6 setObject:v12 forKeyedSubscript:qword_1EAB20B00];

  uint64_t v13 = NSNumber;
  CMTime v35 = *(CMTime *)(a1 + 112);
  Float64 Seconds = CMTimeGetSeconds(&v35);
  *(float *)&Float64 Seconds = Seconds;
  uint64_t v15 = [v13 numberWithFloat:Seconds];
  [v6 setObject:v15 forKeyedSubscript:qword_1EAB20B48];

  uint64_t v16 = *(void *)(a1 + 8);
  if (v16) {
    [v6 setObject:v16 forKeyedSubscript:qword_1EAB20B38];
  }
  uint64_t v17 = *(uint64_t **)(a1 + 24);
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(v17[1] - *v17) >> 2];
    uint64_t v20 = *v17;
    if (v17[1] != *v17)
    {
      unint64_t v21 = 0;
      do
      {
        LODWORD(v19) = *(_DWORD *)(v20 + 4 * v21);
        uint64_t v22 = [NSNumber numberWithFloat:v19];
        [v18 addObject:v22];

        ++v21;
        uint64_t v20 = *v17;
      }
      while (v21 < (v17[1] - *v17) >> 2);
    }
    [v6 setObject:v18 forKeyedSubscript:qword_1EAB20B40];
  }
  if (*(void *)(a1 + 248))
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v24 = **(void **)(a1 + 248);
    if (*(void *)(*(void *)(a1 + 248) + 8) != v24)
    {
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      do
      {
        uint64_t v27 = sub_1DD3B326C((_DWORD *)(v24 + v25));
        [v23 addObject:v27];

        ++v26;
        uint64_t v24 = **(void **)(a1 + 248);
        v25 += 28;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((*(void *)(*(void *)(a1 + 248) + 8) - v24) >> 2) > v26);
    }
    [v6 setObject:v23 forKeyedSubscript:qword_1EAB20B20];
  }
  uint64_t v28 = *(void **)(a1 + 88);
  if (v28)
  {
    if (a2)
    {
      unint64_t v29 = [v28 featuresDict];

      if (v29)
      {
        int v30 = [*(id *)(a1 + 88) featuresDict];
        [v6 setObject:v30 forKeyedSubscript:qword_1EAB20B28];
      }
    }
    if (a3)
    {
      unint64_t v31 = [*(id *)(a1 + 88) fullFeaturesDict];

      if (v31 || ![*(id *)(a1 + 88) processFullDictionary:0])
      {
        int v32 = [*(id *)(a1 + 88) fullFeaturesDict];

        if (v32)
        {
          long long v33 = [*(id *)(a1 + 88) fullFeaturesDict];
          [v6 setObject:v33 forKeyedSubscript:qword_1EAB20B30];
        }
      }
    }
  }

  return v6;
}

void sub_1DD3B72E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3B7364(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v7)
  {
    sub_1DD3B7414(a1, v7, v5);
    sub_1DD3B75A8(a1, v7, v6);
    sub_1DD3B76DC(a1, v7, v6);
  }
  else
  {
    puts("PostGateFeatureExtractor: Can't dump features; output directory URL unset.");
  }
}

void sub_1DD3B73FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3B7414(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 216) || (sub_1DD3B5BF4(a1), *(void *)(a1 + 216)))
  {
    if (!*(void *)(a1 + 48) || !*(unsigned char *)(a1 + 56)) {
      puts("Can't dump loopClosureEnergyMap without postGateFeatureExtractor.");
    }
    if (v16)
    {
      uint64_t v6 = [NSString stringWithFormat:@"loopClosureEnergyMap%@.txt", v5];
      id v7 = [v16 URLByAppendingPathComponent:v6];
      id v8 = [v7 path];
      CFDictionaryRef v9 = (char *)[v8 UTF8String];

      CFDictionaryRef v10 = *(void **)(a1 + 216);
      uint64_t v11 = *(void *)(a1 + 48);
      if (v11)
      {
        int v12 = sub_1DD3D32D4(v11);
        uint64_t v13 = *(void *)(a1 + 48);
        if (v13)
        {
          int v14 = sub_1DD3D32E4(v13);
LABEL_13:
          sub_1DD3B7A78(v10, v12, v14, v9);

          goto LABEL_16;
        }
      }
      else
      {
        int v12 = 0;
      }
      int v14 = 0;
      goto LABEL_13;
    }
    uint64_t v15 = "Can't dump loopClosureEnergyMap; output directory URL unset.";
  }
  else
  {
    uint64_t v15 = "No loopClosureEnergyMap features available to dump: error extracting.";
  }
  puts(v15);
LABEL_16:
}

void sub_1DD3B7568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3B75A8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 224))
  {
    if (v11)
    {
      uint64_t v6 = [NSString stringWithFormat:@"candidateLoopClosureEnergies%@.txt", v5];
      id v7 = [v11 URLByAppendingPathComponent:v6];
      id v8 = [v7 path];
      CFDictionaryRef v9 = (char *)[v8 UTF8String];

      sub_1DD3B7A78(*(void **)(a1 + 224), *(_DWORD *)(a1 + 232), *(_DWORD *)(a1 + 236), v9);
      goto LABEL_7;
    }
    CFDictionaryRef v10 = "Can't dump candidateLoopEnergyFeatures; output directory URL unset.";
  }
  else
  {
    CFDictionaryRef v10 = "No candidateLoopEnergy features available to dump (must be set via setCandidateLoopEnergyFeatures()).";
  }
  puts(v10);
LABEL_7:
}

void sub_1DD3B76A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3B76DC(uint64_t a1, void *a2, void *a3)
{
  id v31 = a2;
  id v5 = a3;
  if (!*(void *)(a1 + 240))
  {
    sub_1DD3B5C48(a1);
    if (!*(void *)(a1 + 240))
    {
      CFDictionaryRef v10 = "No activity map features available to dump: error extracting.";
      goto LABEL_16;
    }
  }
  if (!*(void *)(a1 + 48) || !*(unsigned char *)(a1 + 56)) {
    puts("Can't dump activity features without postGateFeatureExtractor.");
  }
  if (!v31)
  {
    CFDictionaryRef v10 = "Can't dump activity features; output directory URL unset.";
LABEL_16:
    puts(v10);
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    int v7 = sub_1DD3D32D4(v6);
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8)
    {
      int v9 = sub_1DD3D32E4(v8);
      goto LABEL_13;
    }
  }
  else
  {
    int v7 = 0;
  }
  int v9 = 0;
LABEL_13:
  id v11 = [NSString stringWithFormat:@"activityMap%@.txt", v5];
  int v12 = [v31 URLByAppendingPathComponent:v11];
  id v13 = [v12 path];
  int v14 = (char *)[v13 UTF8String];

  sub_1DD3B7A78(**(void ***)(a1 + 240), v7, v9, v14);
  uint64_t v15 = [NSString stringWithFormat:@"firstThirdActivityMap%@.txt", v5];
  id v16 = [v31 URLByAppendingPathComponent:v15];
  id v17 = [v16 path];
  uint64_t v18 = (char *)[v17 UTF8String];

  sub_1DD3B7A78(*(void **)(*(void *)(a1 + 240) + 16), v7, v9, v18);
  double v19 = [NSString stringWithFormat:@"lastThirdActivityMap%@.txt", v5];
  uint64_t v20 = [v31 URLByAppendingPathComponent:v19];
  id v21 = [v20 path];
  uint64_t v22 = (char *)[v21 UTF8String];

  sub_1DD3B7A78(*(void **)(*(void *)(a1 + 240) + 24), v7, v9, v22);
  id v23 = [NSString stringWithFormat:@"firstLastThirdMinActivityMap%@.txt", v5];
  uint64_t v24 = [v31 URLByAppendingPathComponent:v23];
  id v25 = [v24 path];
  unint64_t v26 = (char *)[v25 UTF8String];

  sub_1DD3B7A78(*(void **)(*(void *)(a1 + 240) + 32), v7, v9, v26);
  if (*(void *)(*(void *)(a1 + 240) + 8))
  {
    uint64_t v27 = [NSString stringWithFormat:@"variabilityMap%@.txt", v5];
    uint64_t v28 = [v31 URLByAppendingPathComponent:v27];
    id v29 = [v28 path];
    int v30 = (char *)[v29 UTF8String];

    sub_1DD3B7A78(*(void **)(*(void *)(a1 + 240) + 8), v7, v9, v30);
  }
LABEL_17:
}

void sub_1DD3B7A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

FILE *sub_1DD3B7A78(void *a1, int a2, int a3, char *__filename)
{
  uint64_t result = fopen(__filename, "w");
  if (result)
  {
    uint64_t v8 = result;
    fprintf(result, "%d %d\n", a2, a3);
    unsigned int v9 = a3 * a2;
    if (a3 * a2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 4 * v9;
      do
      {
        fprintf(v8, "%f ", *(float *)(*a1 + v10));
        v10 += 4;
      }
      while (v11 != v10);
    }
    return (FILE *)fclose(v8);
  }
  return result;
}

BOOL sub_1DD3B7B4C(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 56)) {
    puts("validatePostGateFeatures error: no valid loopData");
  }
  return v1 != 0;
}

uint64_t sub_1DD3B7B84(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    id v3 = *(id *)(v1 + 8);
    if ([v3 count])
    {
      NSLog(&cfstr_Algatingfeatur.isa);
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v11;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(v4);
            }
            NSLog(&stru_1F3893878.isa, *(void *)(*((void *)&v10 + 1) + 8 * v7++));
          }
          while (v5 != v7);
          uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v5);
      }
    }
    id v8 = **(id **)(a1 + 16);
    operator new();
  }
  return 0xFFFFFFFFLL;
}

void sub_1DD3B7E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B7E98(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v38 = *(id *)(v1 + 8);
    if ([v38 count])
    {
      NSLog(&cfstr_Algatingfeatur.isa);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v2 = v38;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v3)
      {
        uint64_t v4 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v45 != v4) {
              objc_enumerationMutation(v2);
            }
            NSLog(&stru_1F3893878.isa, *(void *)(*((void *)&v44 + 1) + 8 * i));
          }
          uint64_t v3 = [v2 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v3);
      }
    }
    id v6 = **(id **)(a1 + 32);
    __p = 0;
    int v42 = 0;
    uint64_t v43 = 0;
    sub_1DD3B8438(&__p, [v6 count]);
    uint64_t v7 = 0;
    id v8 = 0;
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    while (1)
    {
      unsigned int v11 = v10;
      if ([v6 count] <= (unint64_t)v10) {
        break;
      }
      long long v12 = [v6 objectAtIndexedSubscript:v10];
      id v39 = v8;
      id v40 = v7;
      int v13 = sub_1DD3B392C(v12, &v40, &v39);
      id v14 = v40;

      id v15 = v39;
      if (v13
        || ((int v16 = [v14 isEqualToString:@"ALGFID_ActivityDetect"], v15) ? (v17 = v16) : (v17 = 0),
            v17 != 1))
      {
        uint64_t v20 = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t v18 = [v15 objectForKeyedSubscript:@"ALGFP_ActivityLevel"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v19 = [v18 integerValue];
        }
        else {
          int v19 = -1;
        }
        id v21 = [v15 objectForKeyedSubscript:@"ALGFP_ActivityArea"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v21 floatValue];
          uint64_t v20 = 0xFFFFFFFFLL;
          if ((v19 & 0x80000000) == 0)
          {
            float v23 = v22;
            if (v22 >= 0.0)
            {
              uint64_t v24 = (float *)v42;
              if (v42 >= v43)
              {
                unint64_t v26 = (float *)__p;
                uint64_t v27 = (v42 - (unsigned char *)__p) >> 3;
                unint64_t v28 = v27 + 1;
                if ((unint64_t)(v27 + 1) >> 61) {
                  sub_1DD3A9B50();
                }
                uint64_t v29 = v43 - (unsigned char *)__p;
                if ((v43 - (unsigned char *)__p) >> 2 > v28) {
                  unint64_t v28 = v29 >> 2;
                }
                if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v30 = v28;
                }
                if (v30)
                {
                  id v31 = (char *)sub_1DD3B19D0((uint64_t)&v43, v30);
                  unint64_t v26 = (float *)__p;
                  uint64_t v24 = (float *)v42;
                }
                else
                {
                  id v31 = 0;
                }
                int v32 = (int *)&v31[8 * v27];
                *int v32 = v19;
                *((float *)v32 + 1) = v23;
                long long v33 = v32;
                if (v24 != v26)
                {
                  do
                  {
                    uint64_t v34 = *((void *)v24 - 1);
                    v24 -= 2;
                    *((void *)v33 - 1) = v34;
                    v33 -= 2;
                  }
                  while (v24 != v26);
                  unint64_t v26 = (float *)__p;
                }
                id v25 = (char *)(v32 + 2);
                __p = v33;
                int v42 = (char *)(v32 + 2);
                uint64_t v43 = &v31[8 * v30];
                if (v26) {
                  operator delete(v26);
                }
              }
              else
              {
                *(_DWORD *)int v42 = v19;
                v24[1] = v22;
                id v25 = (char *)(v24 + 2);
              }
              int v42 = v25;
              uint64_t v20 = v9;
            }
          }
        }
        else
        {
          uint64_t v20 = 0xFFFFFFFFLL;
        }
      }
      unsigned int v10 = v11 + 1;
      uint64_t v7 = v14;
      id v8 = v15;
      uint64_t v9 = v20;
    }
    if (!v9 && !sub_1DD3B5C9C(a1))
    {
      [v6 count];
      operator new();
    }

    if (__p)
    {
      int v42 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    CMTime v35 = (const char *)sub_1DD3B16B8(*(_DWORD *)(a1 + 80));
    printf("ALGatingFeatures (%s): no activity-detector feature instructions available\n", v35);
  }
  return 0xFFFFFFFFLL;
}

void sub_1DD3B836C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  MEMORY[0x1E01B4150](v18, 0x80C40D6874129);

  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3B8438(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_1DD3A9B50();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    id v6 = (char *)sub_1DD3B19D0(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    unsigned int v11 = (char *)*a1;
    unsigned int v10 = (char *)a1[1];
    long long v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      unsigned int v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

_OWORD *sub_1DD3B84E0(_OWORD *a1)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  sub_1DD3B854C((uint64_t)(a1 + 1), 0);
  return a1;
}

void sub_1DD3B8524(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  int64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 24) = v5;
    operator delete(v5);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3B854C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_1DD3B857C((char **)a1, a2 - v2);
  }
}

void sub_1DD3B857C(char **a1, unint64_t a2)
{
  id v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      sub_1DD3A9B50();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      id v14 = (char *)sub_1DD3B2EF4(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      id v14 = 0;
    }
    id v15 = &v14[4 * v11];
    int v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    int v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

uint64_t sub_1DD3B8698(uint64_t a1, uint64_t a2, int a3, int a4)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  sub_1DD3B8704(a1, a2, a3, a4, 0, 0);
  return a1;
}

void sub_1DD3B86E0(_Unwind_Exception *a1)
{
  uint64_t v4 = *(void **)(v1 + 16);
  if (v4)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3B8704(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6)
{
  id v13 = a6;
  *(void *)a1 = a5;
  objc_storeStrong((id *)(a1 + 8), a6);
  *(_DWORD *)(a1 + 40) = a3;
  *(_DWORD *)(a1 + 44) = a4;
  sub_1DD3B854C(a1 + 16, a4 * a3);
  uint64_t v12 = *(void *)(a2 + 8);
  if (v12 != *(void *)a2) {
    memmove(*(void **)(a1 + 16), *(const void **)a2, v12 - *(void *)a2);
  }
}

void sub_1DD3B87A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B87BC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  sub_1DD3B8704(a1, a2 + 16, *(_DWORD *)(a2 + 40), *(_DWORD *)(a2 + 44), *(void *)a2, *(void **)(a2 + 8));
  return a1;
}

void sub_1DD3B880C(_Unwind_Exception *a1)
{
  uint64_t v4 = *(void **)(v1 + 16);
  if (v4)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3B8830(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    int64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 104;
        sub_1DD3B88C8((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      int64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DD3B88C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 56);
  if (v3)
  {
    *(void *)(a2 + 64) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(a2 + 24);
  if (v4)
  {
    *(void *)(a2 + 32) = v4;
    operator delete(v4);
  }

  int64_t v5 = *(void **)a2;
}

uint64_t sub_1DD3B8924(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x276276276276276) {
    sub_1DD3A9B50();
  }
  if (0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 3);
  }
  if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((a1[2] - *a1) >> 3)) >= 0x13B13B13B13B13BLL) {
    unint64_t v6 = 0x276276276276276;
  }
  else {
    unint64_t v6 = v4;
  }
  id v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)sub_1DD3B8B70((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v10 = v7;
  uint64_t v11 = (__n128 *)&v7[104 * v3];
  id v13 = &v7[104 * v6];
  sub_1DD3B8A4C((uint64_t)(a1 + 2), v11, a2);
  uint64_t v12 = &v11[6].n128_i8[8];
  sub_1DD3B8AF8(a1, &v10);
  uint64_t v8 = a1[1];
  sub_1DD3B8D14(&v10);
  return v8;
}

void sub_1DD3B8A38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DD3B8D14((void **)va);
  _Unwind_Resume(a1);
}

__n128 sub_1DD3B8A4C(uint64_t a1, __n128 *a2, uint64_t a3)
{
  uint64_t v5 = a3 + 8;
  a2->n128_u64[0] = (unint64_t)*(id *)a3;
  sub_1DD3B87BC((uint64_t)&a2->n128_i64[1], v5);
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[4].n128_u64[1] = 0;
  sub_1DD3B8D90(&a2[3].n128_u64[1], *(const void **)(a3 + 56), *(void *)(a3 + 64), (uint64_t)(*(void *)(a3 + 64) - *(void *)(a3 + 56)) >> 3);
  __n128 result = *(__n128 *)(a3 + 80);
  a2[6].n128_u32[0] = *(_DWORD *)(a3 + 96);
  a2[5] = result;
  return result;
}

void sub_1DD3B8AC4(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 24);
  if (v3)
  {
    *(void *)(v1 + 32) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3B8AF8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1DD3B8BBC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1DD3B8B70(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x276276276276277) {
    sub_1DD3A9C40();
  }
  return operator new(104 * a2);
}

uint64_t sub_1DD3B8BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  char v14 = 0;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 104;
      sub_1DD3B8A4C(a1, (__n128 *)(v7 - 104), v9);
      uint64_t v7 = *((void *)&v16 + 1) - 104;
      *((void *)&v16 + 1) -= 104;
    }
    while (v9 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  sub_1DD3B8C88((uint64_t)v13);
  return v11;
}

void sub_1DD3B8C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1DD3B8C88(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1DD3B8CC0((uint64_t *)a1);
  }
  return a1;
}

void sub_1DD3B8CC0(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_1DD3B88C8(v3, v1);
      v1 += 104;
    }
    while (v1 != v2);
  }
}

void **sub_1DD3B8D14(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1DD3B8D48(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 104;
    sub_1DD3B88C8(v4, i - 104);
  }
}

void *sub_1DD3B8D90(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1DD3B5A24(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DD3B8DF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3B922C(void *a1, void *a2, int a3, int a4, float a5)
{
  src.data = a1;
  src.height = a3;
  src.double width = a4;
  src.rowBytes = a4;
  dest.data = a2;
  dest.height = a3;
  dest.double width = a4;
  dest.rowBytes = a4;
  int v6 = (int)(float)((float)(ceilf(a5) * 2.0) + 1.0);
  sub_1DD3B3408(kernel, (v6 * v6));
  sub_1DD3B9310((uint64_t)kernel[0], v6, 255, 0, a5);
  vImage_Error v7 = vImageErode_Planar8(&src, &dest, 0, 0, kernel[0], v6, v6, 8u);
  if (v7) {
    printf("erodePlanarU8Image vImage_Error: %zd", v7);
  }
  if (kernel[0])
  {
    kernel[1] = kernel[0];
    operator delete(kernel[0]);
  }
}

void sub_1DD3B92F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B9310(uint64_t result, int a2, char a3, char a4, float a5)
{
  if (a2 >= 0) {
    int v5 = a2;
  }
  else {
    int v5 = a2 + 1;
  }
  if (a2 >= 1)
  {
    uint64_t v6 = 0;
    unsigned int v7 = v5 >> 1;
    float v8 = a5 * a5;
    uint64x2_t v9 = (uint64x2_t)vdupq_n_s64((unint64_t)a2 - 1);
    int64x2_t v10 = vdupq_n_s64(2uLL);
    int32x2_t v11 = vdup_n_s32(v7);
    uint64_t v12 = (unsigned char *)(result + 1);
    do
    {
      int v13 = (v6 - v7) * (v6 - v7);
      uint64_t v14 = (a2 + 1) & 0x1FFFFFFFELL;
      long long v15 = v12;
      int64x2_t v16 = (int64x2_t)xmmword_1DD3E8420;
      int32x2_t v17 = (int32x2_t)0x100000000;
      do
      {
        int32x2_t v18 = vmovn_s64((int64x2_t)vcgeq_u64(v9, (uint64x2_t)v16));
        int32x2_t v19 = vsub_s32(v17, v11);
        if (v18.i8[0])
        {
          if (v8 >= (float)(int)(vmul_s32(v19, v19).u32[0] + v13)) {
            char v20 = a3;
          }
          else {
            char v20 = a4;
          }
          *(v15 - 1) = v20;
        }
        if (v18.i8[4])
        {
          if (v8 >= (float)(vmul_s32(v19, v19).i32[1] + v13)) {
            char v21 = a3;
          }
          else {
            char v21 = a4;
          }
          *long long v15 = v21;
        }
        int64x2_t v16 = vaddq_s64(v16, v10);
        int32x2_t v17 = vadd_s32(v17, (int32x2_t)0x200000002);
        v15 += 2;
        v14 -= 2;
      }
      while (v14);
      ++v6;
      v12 += a2;
    }
    while (v6 != a2);
  }
  return result;
}

void sub_1DD3B93F8(void *a1, void *a2, int a3, int a4, float a5)
{
  src.data = a1;
  src.height = a3;
  src.double width = a4;
  src.rowBytes = a4;
  dest.data = a2;
  dest.height = a3;
  dest.double width = a4;
  dest.rowBytes = a4;
  int v6 = (int)(float)((float)(ceilf(a5) * 2.0) + 1.0);
  sub_1DD3B3408(kernel, (v6 * v6));
  sub_1DD3B9310((uint64_t)kernel[0], v6, 0, 255, a5);
  vImage_Error v7 = vImageDilate_Planar8(&src, &dest, 0, 0, kernel[0], v6, v6, 8u);
  if (v7) {
    printf("dilatePlanarU8Image vImage_Error: %zd", v7);
  }
  if (kernel[0])
  {
    kernel[1] = kernel[0];
    operator delete(kernel[0]);
  }
}

void sub_1DD3B94C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B94DC(uint64_t a1, int a2, int a3)
{
  *(unsigned char *)a1 = 0;
  *(_DWORD *)(a1 + 4) = a2;
  *(_DWORD *)(a1 + 8) = a3;
  size_t v4 = a3 * a2;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  sub_1DD3B3408((void *)(a1 + 40), v4);
  sub_1DD3B3408((void *)(a1 + 64), v4);
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  return a1;
}

void sub_1DD3B9550(_Unwind_Exception *exception_object)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B9570(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a3;
  return result;
}

void sub_1DD3B9578(uint64_t a1, int a2)
{
  uint64_t v6 = *(void *)(a1 + 40);
  size_t v4 = (unint64_t *)(a1 + 40);
  uint64_t v5 = v6;
  unint64_t v7 = *((int *)v4 - 8) * (uint64_t)*((int *)v4 - 9);
  unint64_t v8 = v4[1] - v6;
  if (v7 <= v8)
  {
    if (v7 < v8) {
      *(void *)(a1 + 48) = v5 + v7;
    }
  }
  else
  {
    sub_1DD3B353C(v4, v7 - v8);
  }
  qos_class_t v9 = qos_class_self();
  global_queue = dispatch_get_global_queue(v9, 0);
  int v11 = *(_DWORD *)(a1 + 4);
  BOOL v13 = __OFADD__(v11, 7);
  int v14 = v11 + 7;
  BOOL v12 = v11 + 7 < 0;
  int v15 = v11 + 14;
  if (v12 == v13) {
    int v15 = v14;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = sub_1DD3B9654;
  block[3] = &unk_1E6CBFE58;
  block[4] = a1;
  block[5] = (uint64_t)v15 >> 3;
  int v17 = a2;
  dispatch_apply(8uLL, global_queue, block);
}

uint64_t sub_1DD3B9654(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  int v4 = v2 * a2;
  unint64_t v5 = v2 * a2 + v2;
  if (v5 >= *(int *)(v3 + 4)) {
    int v6 = *(_DWORD *)(v3 + 4);
  }
  else {
    int v6 = v5;
  }
  if (v6 > v4)
  {
    uint64_t v7 = result;
    int v8 = *(_DWORD *)(v3 + 8);
    do
    {
      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        do
        {
          int64x2_t v10 = *(void **)(v3 + 24);
          if (v10[1] - *v10 <= (unint64_t)(v9 + v4 * v8)
            || (v11 = sub_1DD3B9774(**(void **)(v3 + 32), v8, *(_DWORD *)(v3 + 4), v9, v4, *(_DWORD *)(v7 + 48), *(unsigned __int8 *)(*v10 + v4 * (uint64_t)v8 + v9)), int v12 = *(_DWORD *)(v3 + 8), v13 = *(void **)(v3 + 32), v13[1] - *v13 <= (unint64_t)(v9 + v12 * (uint64_t)v4)))
          {
            sub_1DD3B37AC();
          }
          uint64_t result = sub_1DD3B9774(**(void **)(v3 + 24), v12, *(_DWORD *)(v3 + 4), v9, v4, *(_DWORD *)(v7 + 48), *(unsigned __int8 *)(*v13 + v4 * (uint64_t)v12 + v9));
          if (result >= v11) {
            char v14 = v11;
          }
          else {
            char v14 = result;
          }
          *(unsigned char *)(*(void *)(v3 + 40) + *(int *)(v3 + 8) * (uint64_t)v4 + v9) = v14;
          int v8 = *(_DWORD *)(v3 + 8);
          ++v9;
        }
        while ((int)v9 < v8);
      }
      ++v4;
    }
    while (v4 != v6);
  }
  return result;
}

uint64_t sub_1DD3B9774(uint64_t a1, int a2, int a3, int a4, int a5, int a6, unsigned int a7)
{
  uint64_t v7 = (a5 - a6) & ~((a5 - a6) >> 31);
  if (a6 + a5 >= a3) {
    int v8 = a3 - 1;
  }
  else {
    int v8 = a6 + a5;
  }
  if ((int)v7 <= v8)
  {
    int v10 = a6 + a4;
    if (a6 + a4 >= a2) {
      int v10 = a2 - 1;
    }
    uint64_t v11 = (a4 - a6) & ~((a4 - a6) >> 31);
    uint64_t v12 = a2;
    uint64_t v13 = (v8 + 1);
    char v14 = (unsigned __int8 *)(a1 + v11 + a2 * v7);
    unsigned __int8 v9 = -1;
    do
    {
      uint64_t v15 = (v10 + 1) - v11;
      int64x2_t v16 = v14;
      if ((int)v11 <= v10)
      {
        do
        {
          unsigned int v17 = *v16++;
          unsigned __int8 v18 = a7 - v17;
          unsigned __int8 v19 = v17 - a7;
          if (v17 <= a7) {
            unsigned __int8 v19 = v18;
          }
          if (v19 < v9) {
            unsigned __int8 v9 = v19;
          }
          --v15;
        }
        while (v15);
      }
      ++v7;
      v14 += v12;
    }
    while (v7 != v13);
  }
  else
  {
    return -1;
  }
  return v9;
}

void sub_1DD3B9820(uint64_t a1, int a2)
{
  unint64_t v5 = (void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 64);
  unint64_t v6 = *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 4);
  unint64_t v7 = *(void *)(a1 + 72) - v4;
  if (v6 <= v7)
  {
    if (v6 < v7) {
      *(void *)(a1 + 72) = v4 + v6;
    }
  }
  else
  {
    sub_1DD3B353C((unint64_t *)(a1 + 64), v6 - v7);
  }
  sub_1DD3B9578(a1, a2);
  sub_1DD3B3408(__p, *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 4));
  sub_1DD3B93F8(*(void **)(a1 + 40), __p[0], *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), 1.0);
  sub_1DD3B922C(__p[0], *(void **)(a1 + 64), *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), 2.0);
  size_t v8 = *(unsigned int *)(a1 + 8);
  uint64_t v9 = *(int *)(a1 + 4);
  int v10 = *(_DWORD *)(a1 + 8);
  int v11 = llroundf((float)(int)v9 * 0.07);
  if (v11 >= (int)v9) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = v11;
  }
  int v13 = llroundf((float)(int)v8 * 0.07);
  if (v13 >= (int)v8) {
    uint64_t v14 = v8;
  }
  else {
    uint64_t v14 = v13;
  }
  if ((int)v12 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v12;
    do
    {
      if ((int)v8 >= 1) {
        bzero((void *)(*v5 + v15), v8);
      }
      v15 += (int)v8;
      --v16;
    }
    while (v16);
    uint64_t v17 = (int)v9 - (int)v12;
    uint64_t v18 = v10 * v17;
    do
    {
      if (v10 >= 1) {
        bzero((void *)(*v5 + v18), v8);
      }
      ++v17;
      v18 += (int)v8;
    }
    while (v17 < v9);
  }
  if ((int)v9 >= 1)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    do
    {
      if ((int)v14 >= 1)
      {
        uint64_t v21 = *v5 + v20 * (int)v8;
        float v22 = (unsigned char *)(*v5 + v19);
        int v23 = v10 - 1;
        uint64_t v24 = v14;
        do
        {
          *v22++ = 0;
          *(unsigned char *)(v21 + v23--) = 0;
          --v24;
        }
        while (v24);
      }
      ++v20;
      v19 += (int)v8;
    }
    while (v20 != v9);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1DD3B99F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B9A10(uint64_t a1, unsigned int a2, float a3)
{
  *(unsigned char *)(a1 + 12) = a2;
  *(float *)(a1 + 16) = a3;
  sub_1DD3CE2B4((uint64_t *)(a1 + 112), a2, *(void *)(a1 + 64), *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 8));

  return sub_1DD3B9A60(a1);
}

uint64_t sub_1DD3B9A60(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 4);
  if (v2 >= *(_DWORD *)(a1 + 8)) {
    int v2 = *(_DWORD *)(a1 + 8);
  }
  unsigned int v3 = vcvtps_s32_f32(*(float *)(a1 + 16) * (float)v2);
  uint64_t v4 = a1 + 112;
  BOOL v5 = sub_1DD3CE478((void *)(a1 + 112), v3, v3, (_DWORD *)(a1 + 160), (_DWORD *)(a1 + 168));
  return v5 & sub_1DD3CE4B8(v4, v3, v3, (_DWORD *)(a1 + 164), (_DWORD *)(a1 + 172));
}

void sub_1DD3B9AE0(uint64_t a1, uint64_t *a2, uint64_t a3, int a4)
{
  unint64_t v7 = (_DWORD *)sub_1DD3DB26C(a2[1], 0);
  int v8 = v7[1];
  unint64_t v28 = v7;
  int v27 = v7[4] * *v7;
  unint64_t v9 = (v27 * v8);
  int v33 = 0;
  sub_1DD3B9DF8(__p, v9, &v33);
  qos_class_t v10 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v10, 0);
  int v26 = a4 - a3;
  if (a4 - (int)a3 >= 2)
  {
    uint64_t v12 = global_queue;
    unsigned int v13 = (v8 + 7) >> 3;
    int v14 = a4 - 1;
    do
    {
      int v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)*a2 + 16))(*a2, a3);
      a3 = (a3 + 1);
      uint64_t v16 = a2[1];
      uint64_t v17 = *(void *)(v16 + 184);
      int v18 = *(_DWORD *)(v16 + 192);
      int v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)*a2 + 16))(*a2, a3);
      uint64_t v20 = a2[1];
      uint64_t v21 = *(void *)(v20 + 184);
      LODWORD(v20) = *(_DWORD *)(v20 + 192);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = sub_1DD3B9D30;
      block[3] = &unk_1E6CC0080;
      block[4] = a1;
      block[5] = a2;
      void block[6] = v17 + (v18 * v15);
      block[7] = v28;
      block[8] = v21 + (v20 * v19);
      unsigned int v31 = v13;
      int v32 = v27;
      block[9] = __p;
      dispatch_apply(8uLL, v12, block);
    }
    while (v14 != a3);
  }
  int v33 = 0;
  sub_1DD3B9DC8(a1 + 88, v9, &v33);
  float v22 = __p[0];
  if (v9)
  {
    int v23 = *(float **)(a1 + 88);
    uint64_t v24 = (int *)__p[0];
    do
    {
      int v25 = *v24++;
      *v23++ = (float)v25 / (float)v26;
      --v9;
    }
    while (v9);
  }
  else if (!__p[0])
  {
    return;
  }
  __p[1] = v22;
  operator delete(v22);
}

void sub_1DD3B9D08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3B9D30(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 80);
  unsigned int v3 = v2 * a2;
  unsigned int v4 = v2 * a2 + v2;
  unsigned int v5 = *(_DWORD *)(*(void *)(result + 32) + 4);
  if (v4 < v5) {
    unsigned int v5 = v4;
  }
  if (v3 < v5)
  {
    uint64_t v6 = *(void *)(result + 48);
    uint64_t v7 = *(void *)(result + 56);
    uint64_t v8 = *(void *)(result + 64);
    LODWORD(v9) = *(_DWORD *)(result + 84);
    do
    {
      if (v9)
      {
        unint64_t v10 = 0;
        uint64_t v11 = *(_DWORD *)(v7 + 8) * (v3 / *(_DWORD *)(v7 + 24));
        uint64_t v12 = v6 + v11;
        uint64_t v13 = v8 + v11;
        uint64_t v14 = **(void **)(result + 72);
        do
        {
          int v15 = *(unsigned __int8 *)(v12 + v10) - *(unsigned __int8 *)(v13 + v10);
          if (v15 < 0) {
            int v15 = *(unsigned __int8 *)(v13 + v10) - *(unsigned __int8 *)(v12 + v10);
          }
          *(_DWORD *)(v14 + 4 * (v10++ + v3 * v9)) += v15;
          unint64_t v9 = *(unsigned int *)(result + 84);
        }
        while (v10 < v9);
      }
      ++v3;
    }
    while (v3 != v5);
  }
  return result;
}

void sub_1DD3B9DC8(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_1DD3B9E7C((void **)a1, a2 - v3, a3);
  }
}

void *sub_1DD3B9DF8(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B2EB0(a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1DD3B9E60(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3B9E7C(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_1DD3A9B50();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      int v15 = (char *)sub_1DD3B2EF4(v6, v14);
    }
    else {
      int v15 = 0;
    }
    int v18 = &v15[4 * v12];
    int v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    uint64_t v21 = v18;
    do
    {
      *(_DWORD *)uint64_t v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    float v22 = &v15[4 * v14];
    int v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

uint64_t sub_1DD3BD2FC(void *a1, uint64_t *a2, void *a3, void *a4, char a5, CMTime *a6, void *a7, void *a8, double a9, double a10)
{
  id v17 = a1;
  id v76 = a3;
  id v81 = a4;
  long long v80 = a7;
  long long v78 = v17;
  id v79 = a8;
  if (!v17 || !v81 || !v79)
  {
    NSLog(&cfstr_Alpingpongrend.isa);
    uint64_t v22 = 5;
    goto LABEL_53;
  }
  int v18 = (void *)MEMORY[0x1E01B4410]();
  CMTime v75 = [MEMORY[0x1E4F28CB8] defaultManager];
  CMTime v82 = [v81 URLByAppendingPathComponent:@"pingPongTempFwd.mov"];
  uint64_t v77 = [v81 URLByAppendingPathComponent:@"pingPongTempRev.mov"];
  [v75 removeItemAtURL:v82 error:0];
  [v75 removeItemAtURL:v77 error:0];
  [v75 removeItemAtURL:v79 error:0];
  unsigned int v19 = sub_1DD3B39F8(v17, (uint64_t)a2, 0, v81, a5, &unk_1F3891F78, v82, a9, a10);
  unsigned int v20 = v19;
  if (v19)
  {
    int v21 = 1;
    LODWORD(v22) = v19;
    goto LABEL_50;
  }
  uint64_t v24 = *a2;
  uint64_t v23 = a2[1];
  id v25 = [[VideoReader alloc] initFromFile:v82];
  if (!v25)
  {
    int v26 = [v82 path];
    NSLog(&cfstr_Alpingpongrend_0.isa, v26);

    [v75 removeItemAtURL:v82 error:0];
  }
  [v25 setPixelFormatOptions:3588];
  [v25 setReadAheadEnable:0];
  uint64_t v69 = v18;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  id v28 = 0;
  unsigned int v20 = 0;
  uint64_t v29 = (v23 - v24) >> 3;
  uint64_t v30 = v29 - 1;
  CMTime v101 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  uint64_t v70 = *MEMORY[0x1E4F16228];
  uint64_t v72 = *MEMORY[0x1E4F15AB0];
  uint64_t v73 = v29;
  float v31 = (float)(unint64_t)v29;
  uint64_t v68 = v29 - 1;
  do
  {
    int v32 = (void *)MEMORY[0x1E01B4410]();
    if ((unint64_t)(v30 - 1) >= 0x10) {
      uint64_t v33 = 16;
    }
    else {
      uint64_t v33 = v30 - 1;
    }
    uint64_t v34 = *(long long **)(*a2 + 8 * (v30 - v33));
    long long v35 = *v34;
    uint64_t v100 = *((void *)v34 + 2);
    long long v99 = v35;
    [v25 setReadStartT:&v99];
    value.CMTime value = 0;
    uint64_t v36 = v33;
    if (v33)
    {
      while (1)
      {
        unsigned int v37 = [v25 getFrameAsSampleBuf:&value];
        if (v37) {
          break;
        }
        CFArrayAppendValue(Mutable, (const void *)value.value);
        CFRelease((CFTypeRef)value.value);
        if (!--v36) {
          goto LABEL_16;
        }
      }
      id v39 = [v82 path];
      id v40 = sub_1DD3DA8AC(v37);
      NSLog(&cfstr_Alpingpongrend_1.isa, v39, v40);

      goto LABEL_19;
    }
LABEL_16:
    if (v20)
    {
      int v38 = 2;
    }
    else
    {
      [v25 reset];
      if (!v28)
      {
        ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(Mutable, 0);
        ImageBuffer = CMSampleBufferGetImageBuffer(ValueAtIndex);
        int v43 = sub_1DD3DA94C(ImageBuffer);
        long long v44 = [VideoWriter alloc];
        size_t Width = CVPixelBufferGetWidth(ImageBuffer);
        size_t Height = CVPixelBufferGetHeight(ImageBuffer);
        uint64_t timescale = a6->timescale;
        long long v48 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v97[0] = *MEMORY[0x1E4F1DAB8];
        v97[1] = v48;
        long long v98 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        LODWORD(v66) = v43 | 0xE00;
        id v28 = [(VideoWriter *)v44 initForURL:v77 fileType:v72 codecType:v70 imgWidth:Width imgHeight:Height fps:timescale timeScale:COERCE_DOUBLE(__PAIR64__(DWORD1(v98), 30.0)) transform:v97 pixFormat:v66 metadata:0];
        if (!v28)
        {
          NSLog(&cfstr_Alpingpongrend_2.isa);
          id v28 = 0;
LABEL_19:
          int v38 = 2;
          unsigned int v20 = 9;
          goto LABEL_32;
        }
      }
      if (v33)
      {
        CFIndex v49 = v33 - 1;
        while (1)
        {
          float v50 = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(Mutable, v49);
          CVImageBufferRef v51 = CMSampleBufferGetImageBuffer(v50);
          CMTime v96 = v101;
          uint64_t v52 = [v28 addFrameAsPixelBuf:v51 atFrameTime:&v96];
          uint64_t v53 = (void *)v52;
          if (v52) {
            break;
          }
          CMTime lhs = v101;
          CMTime rhs = *a6;
          CMTimeAdd(&v95, &lhs, &rhs);
          CMTime v101 = v95;
          if (--v49 == -1) {
            goto LABEL_26;
          }
        }
        NSLog(&cfstr_Alpingpongrend_3.isa, v52);
        uint64_t v54 = [v28 lastError];
        unsigned int v20 = sub_1DD3B428C(v54);
      }
      else
      {
LABEL_26:
        unsigned int v20 = 0;
      }
      CFArrayRemoveAllValues(Mutable);
      if (v80[2]((float)(unint64_t)(v73 - (v30 - v33)) / v31))
      {
        int v38 = 0;
      }
      else
      {
        unsigned int v20 = 1;
        int v38 = 2;
      }
      v30 -= v33;
    }
LABEL_32:
  }
  while (!v38 && v30 != 1);
  CFRelease(Mutable);
  if (v20)
  {
    [v75 removeItemAtURL:v82 error:0];
    [v75 removeItemAtURL:v77 error:0];
    int v21 = 1;
    LODWORD(v22) = v20;
  }
  else
  {
    uint64_t v55 = [v28 finish];
    uint64_t v56 = (void *)v55;
    if (v55)
    {
      NSLog(&cfstr_Alpingpongrend_4.isa, v55);
      [v75 removeItemAtURL:v82 error:0];
      [v75 removeItemAtURL:v77 error:0];
      uint64_t v57 = [v28 lastError];
      LODWORD(v22) = sub_1DD3B428C(v57);
      unsigned int v20 = 0;
      int v21 = 1;
    }
    else
    {

      uint64_t v57 = [MEMORY[0x1E4F16590] composition];
      uint64_t v58 = *MEMORY[0x1E4F15C18];
      id v74 = [v57 addMutableTrackWithMediaType:*MEMORY[0x1E4F15C18] preferredTrackID:0];
      uint64_t v71 = [MEMORY[0x1E4F166C8] assetWithURL:v82];
      id v59 = [MEMORY[0x1E4F166C8] assetWithURL:v77];
      uint64_t v60 = [v71 tracksWithMediaType:v58];
      uint64_t v22 = [v59 tracksWithMediaType:v58];
      if (v60 && [v60 count] == 1 && v22 && objc_msgSend((id)v22, "count") == 1)
      {
        id v61 = [v60 objectAtIndexedSubscript:0];
        uint64_t v67 = [(id)v22 objectAtIndexedSubscript:0];
        CMTime v95 = *(CMTime *)*(void *)(*a2 + 8 * v68);
        CMTime v91 = v95;
        CMTime v90 = *a6;
        CMTimeAdd(&value, &v91, &v90);
        CMTime v95 = value;
        if (v61) {
          [v61 timeRange];
        }
        else {
          memset(v89, 0, sizeof(v89));
        }
        long long v87 = *MEMORY[0x1E4F1FA48];
        uint64_t v88 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
        [v74 insertTimeRange:v89 ofTrack:v61 atTime:&v87 error:0];
        if (v67) {
          [v67 timeRange];
        }
        else {
          memset(v86, 0, sizeof(v86));
        }
        CMTime v85 = v95;
        [v74 insertTimeRange:v86 ofTrack:v67 atTime:&v85 error:0];
        id v63 = objc_alloc(MEMORY[0x1E4F16360]);
        CMTimeScale v64 = (void *)[v63 initWithAsset:v57 presetName:*MEMORY[0x1E4F15758]];
        [v64 setOutputURL:v79];
        [v64 setOutputFileType:v72];
        [v64 setShouldOptimizeForNetworkUse:1];
        if (v76)
        {
          double v65 = +[LoopQuicktimeMetadata metadataArrayForDictionary:v76];
          [v64 setMetadata:v65];
        }
        unsigned int v20 = sub_1DD3BDDAC(v64);
        v80[2](1.0);
        [v75 removeItemAtURL:v82 error:0];
        [v75 removeItemAtURL:v77 error:0];

        int v21 = 0;
      }
      else
      {
        NSLog(&cfstr_Alpingpongrend_5.isa);
        [v75 removeItemAtURL:v82 error:0];
        [v75 removeItemAtURL:v77 error:0];
        unsigned int v20 = 0;
        int v21 = 1;
      }

      id v28 = 0;
      LODWORD(v22) = 9;
    }
  }
  int v18 = v69;
LABEL_50:

  if (v21) {
    uint64_t v22 = v22;
  }
  else {
    uint64_t v22 = v20;
  }
LABEL_53:

  return v22;
}

void sub_1DD3BDBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3BDDA4()
{
  return 1;
}

uint64_t sub_1DD3BDDAC(void *a1)
{
  id v1 = a1;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = sub_1DD3BDFC0;
  uint64_t v16 = &unk_1E6CC00A8;
  id v3 = v1;
  id v17 = v3;
  unsigned int v19 = &v21;
  unsigned int v20 = &v25;
  unsigned int v4 = v2;
  int v18 = v4;
  [v3 exportAsynchronouslyWithCompletionHandler:&v13];
  if (!*((unsigned char *)v26 + 24))
  {
    int v7 = 0;
    float v8 = 0.0;
    do
    {
      dispatch_time_t v9 = dispatch_time(0, 1000000000);
      if (!dispatch_semaphore_wait(v4, v9) || *((unsigned char *)v26 + 24)) {
        break;
      }
      [v3 progress];
      if (v10 == v8 && ++v7 == 10)
      {
        uint64_t v11 = [v3 status];
        uint64_t v12 = [v3 error];
        NSLog(&cfstr_ExportTimedOut.isa, v11, v12, v13, v14, v15, v16, v17);

        uint64_t v5 = 9;
        goto LABEL_3;
      }
      float v8 = v10;
    }
    while (!*((unsigned char *)v26 + 24));
  }
  uint64_t v5 = *((unsigned int *)v22 + 6);
LABEL_3:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v5;
}

void sub_1DD3BDF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  int v15 = v13;

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 80), 8);

  _Unwind_Resume(a1);
}

intptr_t sub_1DD3BDFC0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) status];
  if (v2 == 5)
  {
    NSLog(&cfstr_ExportCanceled.isa);
    int v4 = 1;
  }
  else
  {
    if (v2 != 4) {
      goto LABEL_6;
    }
    id v3 = [*(id *)(a1 + 32) error];
    NSLog(&cfstr_ExportFailed.isa, v3);

    int v4 = 9;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
LABEL_6:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

void sub_1DD3BE06C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3BE07C(void *result, uint64_t a2, uint64_t a3)
{
  result[2] = 0;
  id v3 = result + 2;
  result[1] = result + 2;
  result[3] = 0;
  result[4] = 0x100000001;
  *uint64_t result = 0;
  if (a2)
  {
    for (uint64_t i = 0; i != a2; ++i)
    {
      uint64_t v5 = *v3;
      if (!*v3) {
        goto LABEL_13;
      }
      int v6 = *(_DWORD *)(a3 + 4 * i);
      int v7 = result + 2;
      do
      {
        int v8 = *(_DWORD *)(v5 + 32);
        BOOL v9 = v8 < v6;
        if (v8 >= v6) {
          float v10 = (uint64_t *)v5;
        }
        else {
          float v10 = (uint64_t *)(v5 + 8);
        }
        if (!v9) {
          int v7 = (uint64_t *)v5;
        }
        uint64_t v5 = *v10;
      }
      while (*v10);
      if (v7 == v3 || *((_DWORD *)v7 + 8) > v6) {
LABEL_13:
      }
        operator new();
    }
  }
  return result;
}

void sub_1DD3BE198(_Unwind_Exception *a1)
{
  sub_1DD3B1A08(v1, *v2);
  _Unwind_Resume(a1);
}

BOOL sub_1DD3BE1B0(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v2 = a1 + 16;
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v5 = v2;
  do
  {
    int v6 = *(_DWORD *)(v3 + 32);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      int v8 = (uint64_t *)v3;
    }
    else {
      int v8 = (uint64_t *)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v5 == v2 || *(_DWORD *)(v5 + 32) > a2) {
LABEL_11:
  }
    uint64_t v5 = v2;
  return v5 != v2;
}

uint64_t *sub_1DD3BE200(uint64_t a1, int a2)
{
  int v8 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = a1 + 16;
  do
  {
    int v4 = *(_DWORD *)(v2 + 32);
    BOOL v5 = v4 < a2;
    if (v4 >= a2) {
      int v6 = (uint64_t *)v2;
    }
    else {
      int v6 = (uint64_t *)(v2 + 8);
    }
    if (!v5) {
      uint64_t v3 = v2;
    }
    uint64_t v2 = *v6;
  }
  while (*v6);
  if (v3 == a1 + 16 || *(_DWORD *)(v3 + 32) > a2) {
    return 0;
  }
  BOOL v9 = &v8;
  return sub_1DD3B1A5C((uint64_t **)(a1 + 8), &v8, (uint64_t)&unk_1DD3E8448, &v9)[5];
}

uint64_t sub_1DD3BE290(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v6 = sub_1DD3BE200(a1, a2);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  BOOL v7 = v6;
  uint64_t v8 = v6[1];
  if (v8) {
    MEMORY[0x1E01B4150](v8, 0x1000C40504FFAC1);
  }
  uint64_t result = 0;
  v7[1] = a3;
  *(_DWORD *)BOOL v7 = a4;
  return result;
}

uint64_t sub_1DD3BE2F8(void *a1)
{
  uint64_t v2 = sub_1DD3BE200((uint64_t)a1, 3);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v2[1];
  if (v4) {
    MEMORY[0x1E01B4150](v4, 0x1000C40504FFAC1);
  }
  uint64_t v5 = sub_1DD3BE370(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t result = 0;
    v3[1] = v6;
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
  }
  *(_DWORD *)uint64_t v3 = result;
  return result;
}

uint64_t sub_1DD3BE370(void *a1)
{
  if (*a1) {
    operator new();
  }
  return 0;
}

uint64_t sub_1DD3BE3D4(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = sub_1DD3BE200(a1, a2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = v4;
  uint64_t v6 = (id *)v4[2];
  if (v6)
  {

    MEMORY[0x1E01B4150](v6, 0x1080C40C39FFA3DLL);
  }
  uint64_t result = 0;
  v5[2] = a3;
  return result;
}

uint64_t *sub_1DD3BE450(uint64_t a1, int a2)
{
  uint64_t result = sub_1DD3BE200(a1, a2);
  if (result) {
    return (uint64_t *)result[2];
  }
  return result;
}

uint64_t sub_1DD3BE470(void *a1, int a2)
{
  uint64_t v4 = sub_1DD3BE200((uint64_t)a1, a2);
  if (v4) {
    return v4[1];
  }
  if (a2 != 3) {
    return 0;
  }

  return sub_1DD3BE370(a1);
}

void *sub_1DD3BE4D0(void *a1)
{
  if (*a1)
  {
    uint64_t v2 = sub_1DD3D5280();
    MEMORY[0x1E01B4150](v2, 0x1080C4022FFC67CLL);
  }
  uint64_t v3 = (void *)a1[1];
  if (v3 != a1 + 2)
  {
    do
    {
      uint64_t v4 = v3[5];
      if (v4)
      {
        uint64_t v5 = sub_1DD3BF4F8(v4);
        MEMORY[0x1E01B4150](v5, 0x1020C40F89CB87BLL);
      }
      uint64_t v6 = (void *)v3[1];
      if (v6)
      {
        do
        {
          BOOL v7 = v6;
          uint64_t v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          BOOL v7 = (void *)v3[2];
          BOOL v8 = *v7 == (void)v3;
          uint64_t v3 = v7;
        }
        while (!v8);
      }
      uint64_t v3 = v7;
    }
    while (v7 != a1 + 2);
  }
  sub_1DD3B1A08((uint64_t)(a1 + 1), (void *)a1[2]);
  return a1;
}

uint64_t sub_1DD3BE598(void *a1, int a2, _DWORD *a3)
{
  *a3 = -1;
  if (*a1 && sub_1DD3BE470(a1, a2)) {
    operator new();
  }
  return 0;
}

void sub_1DD3BE668(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x1080C40AAA5770BLL);
  _Unwind_Resume(a1);
}

__CFString *sub_1DD3BE68C(unsigned int a1)
{
  if (a1 > 3) {
    return @"UnknownFlavor";
  }
  else {
    return off_1E6CC0138[a1];
  }
}

uint64_t sub_1DD3BE6B0(void *a1, _DWORD *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  *a2 = 0;
  if (([v3 isEqualToString:@"AutoLoop"] & 1) == 0)
  {
    if (([v4 isEqualToString:@"Bounce"] & 1) != 0
      || ([v4 isEqualToString:@"PingPong"] & 1) != 0)
    {
      uint64_t v5 = 1;
      goto LABEL_12;
    }
    if ([v4 isEqualToString:@"LongExposure"])
    {
      uint64_t v5 = 2;
      goto LABEL_12;
    }
    if ([v4 isEqualToString:@"Stabilize"])
    {
      uint64_t v5 = 3;
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v5 = 0;
    *a2 = -1;
    goto LABEL_12;
  }
  uint64_t v5 = 0;
LABEL_12:

  return v5;
}

void sub_1DD3BE780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3BE790(uint64_t a1, uint64_t a2)
{
  if (a2 > a1) {
    return 4294967291;
  }
  if (a2 < 2)
  {
    if (a1)
    {
      if (a1 != 1) {
        NSLog(&cfstr_WarningLiveana.isa, a1, 1);
      }
      return 0;
    }
    else
    {
      NSLog(&cfstr_ErrorLiveanaly_0.isa, 0, 1);
      return 4294967294;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorLiveanaly.isa, a1, a2, 1);
    return 4294967293;
  }
}

uint64_t validateLiveAnalysisDictionaryVersion_0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 objectForKeyedSubscript:@"Version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 unsignedIntValue];
      uint64_t v5 = [v2 objectForKeyedSubscript:@"MinVersion"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = sub_1DD3BE790(v4, [v5 unsignedIntValue]);
      }
      else {
        uint64_t v6 = 0xFFFFFFFFLL;
      }
      id v3 = v5;
    }
    else
    {
      uint64_t v6 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v6 = 4294967292;
  }

  return v6;
}

void sub_1DD3BE920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3BE93C(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 24))
  {
    uint64_t v5 = 4294967291;
  }
  else
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"Version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(_DWORD *)(a1 + 32) = [v6 unsignedIntValue];
      BOOL v7 = [v4 objectForKeyedSubscript:@"MinVersion"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v7 unsignedIntValue];
        *(_DWORD *)(a1 + 36) = v8;
        uint64_t v5 = sub_1DD3BE790(*(unsigned int *)(a1 + 32), v8);
        if ((v5 & 0x80000000) == 0)
        {
          float v10 = [v4 objectForKeyedSubscript:@"NormStabilizeInstructions"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            operator new();
          }
          uint64_t v5 = 0xFFFFFFFFLL;
        }
      }
      else
      {
        uint64_t v5 = 0xFFFFFFFFLL;
      }
      uint64_t v6 = v7;
    }
    else
    {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
  }
  return v5;
}

void sub_1DD3BEE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3BEF3C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"loopFlavor"];
  int v4 = 0;
  sub_1DD3BE6B0(v2, &v4);

  if (!v4) {
    operator new();
  }

  return 0;
}

void sub_1DD3BF064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3BF0A0(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  [v2 setObject:v3 forKeyedSubscript:@"Version"];

  int v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
  [v2 setObject:v4 forKeyedSubscript:@"MinVersion"];

  if (*(void *)a1)
  {
    uint64_t v5 = sub_1DD3D5CA0(*(void *)a1);
    [v2 setObject:v5 forKeyedSubscript:@"NormStabilizeInstructions"];

    uint64_t v6 = *(void **)(a1 + 8);
    if (v6 != (void *)(a1 + 16))
    {
      do
      {
        uint64_t v7 = *((int *)v6 + 8);
        uint64_t v8 = (unsigned int *)v6[5];
        if (v8)
        {
          uint64_t v9 = *v8;
          float v10 = (unsigned int *)*((void *)v8 + 1);
          if (v10 && (sub_1DD3BF390(v10), (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v22[0] = @"ErrorCode";
            uint64_t v12 = [NSNumber numberWithInt:v9];
            v22[1] = @"Params";
            v23[0] = v12;
            v23[1] = v11;
            uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
          }
          else
          {
            unsigned int v20 = @"ErrorCode";
            uint64_t v11 = [NSNumber numberWithInt:v9];
            uint64_t v21 = v11;
            uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          }
        }
        else
        {
          uint64_t v13 = 0;
        }
        uint64_t v14 = @"UnknownFlavor";
        if (v7 <= 3) {
          uint64_t v14 = off_1E6CC0138[v7];
        }
        [v2 setObject:v13 forKeyedSubscript:v14];

        int v15 = (void *)v6[1];
        if (v15)
        {
          do
          {
            uint64_t v16 = v15;
            int v15 = (void *)*v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            uint64_t v16 = (void *)v6[2];
            BOOL v17 = *v16 == (void)v6;
            uint64_t v6 = v16;
          }
          while (!v17);
        }
        uint64_t v6 = v16;
      }
      while (v16 != (void *)(a1 + 16));
    }
    id v18 = v2;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void sub_1DD3BF338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3BF390(unsigned int *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v3 = v2;
  uint64_t v4 = (int)a1[5];
  if (v4 > 3) {
    uint64_t v5 = @"UnknownFlavor";
  }
  else {
    uint64_t v5 = off_1E6CC0138[v4];
  }
  [v2 setObject:v5 forKeyedSubscript:@"loopFlavor"];
  uint64_t v6 = [NSNumber numberWithInt:*a1];
  [v3 setObject:v6 forKeyedSubscript:@"loopStart"];

  uint64_t v7 = [NSNumber numberWithInt:a1[1]];
  [v3 setObject:v7 forKeyedSubscript:@"loopPeriod"];

  uint64_t v8 = [NSNumber numberWithInt:a1[2]];
  [v3 setObject:v8 forKeyedSubscript:@"loopFadeLen"];

  LODWORD(v9) = a1[4];
  float v10 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v10 forKeyedSubscript:@"loopEnergy"];

  return v3;
}

void sub_1DD3BF4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3BF4F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    MEMORY[0x1E01B4150](v2, 0x1000C40504FFAC1);
  }
  id v3 = *(id **)(a1 + 16);
  if (v3)
  {

    MEMORY[0x1E01B4150](v3, 0x1080C40C39FFA3DLL);
  }
  return a1;
}

uint64_t sub_1DD3BF700()
{
  if (MEMORY[0x1E4F52798])
  {
    off_1EBE9D6D0 = (_UNKNOWN *)MEMORY[0x1E4F50EC0];
    off_1EBE9D6D8 = (_UNKNOWN *)MEMORY[0x1E4F50EC8];
    qword_1EBE9D6E0 = *MEMORY[0x1E4F52758];
    uint64_t result = *MEMORY[0x1E4F52798];
  }
  else
  {
    off_1EBE9D6D0 = sub_1DD3BF7C8;
    off_1EBE9D6D8 = sub_1DD3BF7D4;
    qword_1EBE9D6E0 = off_1EBE9D698();
    uint64_t result = off_1EBE9D6A0();
  }
  qword_1EBE9D6E8 = result;
  return result;
}

uint64_t sub_1DD3BF7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return off_1EBE9D6A8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1DD3BF7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return off_1EBE9D6B0(a1, a2, a3, a4, a5);
}

id sub_1DD3BF7E0(float a1, float a2, float a3, float a4)
{
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  *(float *)&double v9 = a1;
  float v10 = [NSNumber numberWithFloat:v9];
  [v8 setObject:v10 forKeyedSubscript:@"X"];

  *(float *)&double v11 = a2;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  [v8 setObject:v12 forKeyedSubscript:@"Y"];

  *(float *)&double v13 = a3;
  uint64_t v14 = [NSNumber numberWithFloat:v13];
  [v8 setObject:v14 forKeyedSubscript:@"Width"];

  *(float *)&double v15 = a4;
  uint64_t v16 = [NSNumber numberWithFloat:v15];
  [v8 setObject:v16 forKeyedSubscript:@"Height"];

  return v8;
}

id sub_1DD3BF904(uint64_t a1, int a2)
{
  uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a2];
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    uint64_t v6 = (unsigned int *)(a1 + 24);
    do
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
      uint64_t v8 = [NSNumber numberWithInt:*v6];
      [v7 setObject:v8 forKeyedSubscript:@"objectID"];

      double v9 = sub_1DD3BF7E0(*((float *)v6 - 4), *((float *)v6 - 3), *((float *)v6 - 2), *((float *)v6 - 1));
      [v7 setObject:v9 forKeyedSubscript:@"boundsRect"];

      [v4 addObject:v7];
      v6 += 8;
      --v5;
    }
    while (v5);
  }

  return v4;
}

uint64_t sub_1DD3BFA1C(uint64_t a1, void *a2)
{
  v55[1] = *MEMORY[0x1E4F143B8];
  *a2 = 0;
  if (*(_DWORD *)a1 > 3u) {
    return 4294949854;
  }
  uint64_t v2 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  __int16 v6 = *(_WORD *)(a1 + 42);
  if (v6)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 4);
    uint64_t v7 = [NSNumber numberWithFloat:v5];
    [v4 setObject:v7 forKeyedSubscript:@"privET"];

    __int16 v6 = *(_WORD *)(a1 + 42);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    [v4 setObject:v8 forKeyedSubscript:@"privAFS"];

    __int16 v6 = *(_WORD *)(a1 + 42);
  }
  if ((v6 & 4) != 0)
  {
    v55[0] = *(void *)(a1 + 16);
    long long v44 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v55 length:8];
    [v4 setObject:v44 forKeyedSubscript:@"privECMVct"];

    __int16 v6 = *(_WORD *)(a1 + 42);
    if ((v6 & 8) == 0)
    {
LABEL_8:
      if ((v6 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_51;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_8;
  }
  v55[0] = *(void *)(a1 + 24);
  long long v45 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v55 length:8];
  [v4 setObject:v45 forKeyedSubscript:@"privEMBVct"];

  __int16 v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_52;
  }
LABEL_51:
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  long long v46 = [NSNumber numberWithFloat:v5];
  [v4 setObject:v46 forKeyedSubscript:@"privTZF"];

  __int16 v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_53;
  }
LABEL_52:
  LODWORD(v5) = *(_DWORD *)(a1 + 36);
  long long v47 = [NSNumber numberWithFloat:v5];
  [v4 setObject:v47 forKeyedSubscript:@"privImgG"];

  __int16 v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_53:
  long long v48 = [NSNumber numberWithInteger:*(char *)(a1 + 40)];
  [v4 setObject:v48 forKeyedSubscript:@"privAFSt"];

  if ((*(_WORD *)(a1 + 42) & 0x80) != 0)
  {
LABEL_12:
    double v9 = [NSNumber numberWithInteger:*(char *)(a1 + 41)];
    [v4 setObject:v9 forKeyedSubscript:@"privFM"];
  }
LABEL_13:
  if (*(_DWORD *)(a1 + 44))
  {
    uint64_t v53 = v4;
    uint64_t v54 = v2;
    float v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (*(_DWORD *)(a1 + 44))
    {
      unint64_t v11 = 0;
      uint64_t v12 = a1 + 48;
      do
      {
        double v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
        __int16 v14 = *(_WORD *)(v12 + 30);
        if ((v14 & 2) != 0)
        {
          uint64_t v16 = sub_1DD3BF7E0(*(float *)(v12 + 8), *(float *)(v12 + 12), *(float *)(v12 + 16), *(float *)(v12 + 20));
          [v13 setObject:v16 forKeyedSubscript:@"Rect"];

          __int16 v14 = *(_WORD *)(v12 + 30);
          if ((v14 & 4) != 0)
          {
LABEL_23:
            BOOL v17 = [NSNumber numberWithInt:*(unsigned int *)(v12 + 24)];
            [v13 setObject:v17 forKeyedSubscript:@"faceID"];

            if ((*(_WORD *)(v12 + 30) & 1) == 0) {
              goto LABEL_20;
            }
LABEL_19:
            double v15 = [NSNumber numberWithLongLong:*(void *)v12];
            [v13 setObject:v15 forKeyedSubscript:@"relSampleTime"];

            goto LABEL_20;
          }
        }
        else if ((v14 & 4) != 0)
        {
          goto LABEL_23;
        }
        if (v14) {
          goto LABEL_19;
        }
LABEL_20:
        [v10 addObject:v13];

        ++v11;
        v12 += 32;
      }
      while (v11 < *(unsigned int *)(a1 + 44));
    }
    uint64_t v4 = v53;
    [v53 setObject:v10 forKeyedSubscript:@"privDFArray"];

    uint64_t v2 = v54;
  }
  if (*(_DWORD *)a1 < 2u) {
    goto LABEL_47;
  }
  unsigned int v19 = v4;
  uint64_t v20 = *(unsigned int *)(a1 + 44);
  uint64_t v21 = a1 + 32 * v20;
  uint64_t v24 = *(int *)(v21 + 48);
  uint64_t v22 = (_DWORD *)(v21 + 48);
  uint64_t v23 = v24;
  uint64_t v25 = (int)v22[1];
  uint64_t v26 = (int)v22[2];
  int v27 = v22[3];
  if (v24)
  {
    char v28 = sub_1DD3BF904((uint64_t)(v22 + 4), v23);
    [v19 setObject:v28 forKeyedSubscript:@"humanBodies"];
  }
  if (v25)
  {
    uint64_t v29 = sub_1DD3BF904((uint64_t)&v22[8 * v23 + 4], v25);
    [v19 setObject:v29 forKeyedSubscript:@"catBodies"];
  }
  if (v26)
  {
    uint64_t v30 = sub_1DD3BF904((uint64_t)&v22[8 * v25 + 4 + 8 * v23], v26);
    [v19 setObject:v30 forKeyedSubscript:@"dogBodies"];
  }
  uint64_t v4 = v19;
  if (v27)
  {
    float v31 = sub_1DD3BF904((uint64_t)&v22[8 * v26 + 4 + 8 * (int)v25 + 8 * (int)v23], v27);
    [v19 setObject:v31 forKeyedSubscript:@"salientObjects"];
  }
  if (*(_DWORD *)a1 < 3u) {
    goto LABEL_47;
  }
  uint64_t v32 = v22[3];
  uint64_t v33 = (v22[1] + *v22 + v22[2]);
  uint64_t v34 = (uint64_t)&v22[8 * v33 + 8 * v32];
  __int16 v37 = *(_WORD *)(v34 + 16);
  uint64_t v36 = v34 + 16;
  LOBYTE(v35) = v37;
  if (v37)
  {
    int v38 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:9];
    uint64_t v39 = 0;
    uint64_t v40 = 32 * v20 + 32 * v32 + 32 * v33 + a1 + 68;
    do
    {
      unsigned int v41 = [NSNumber numberWithDouble:*(float *)(v40 + v39)];
      [v38 addObject:v41];

      v39 += 4;
    }
    while (v39 != 36);
    [v4 setObject:v38 forKeyedSubscript:@"privRefHom"];

    __int16 v35 = *(_WORD *)v36;
  }
  if ((v35 & 2) != 0)
  {
    CFIndex v49 = [NSNumber numberWithUnsignedLongLong:*(void *)(v36 + 40)];
    [v4 setObject:v49 forKeyedSubscript:@"ptsInNanos"];

    __int16 v35 = *(_WORD *)v36;
    if ((*(_WORD *)v36 & 4) == 0)
    {
LABEL_43:
      if ((v35 & 8) == 0) {
        goto LABEL_44;
      }
      goto LABEL_57;
    }
  }
  else if ((v35 & 4) == 0)
  {
    goto LABEL_43;
  }
  float v50 = [NSNumber numberWithUnsignedLongLong:*(void *)(v36 + 48)];
  [v4 setObject:v50 forKeyedSubscript:@"originalPTSInNanos"];

  __int16 v35 = *(_WORD *)v36;
  if ((*(_WORD *)v36 & 8) == 0)
  {
LABEL_44:
    if ((v35 & 0x10) == 0) {
      goto LABEL_45;
    }
LABEL_58:
    uint64_t v52 = [NSNumber numberWithChar:*(char *)(v36 + 57)];
    [v4 setObject:v52 forKeyedSubscript:@"IrisSequenceAdjusterDisplacement"];

    if ((*(_WORD *)v36 & 0x20) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_57:
  CVImageBufferRef v51 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v36 + 56)];
  [v4 setObject:v51 forKeyedSubscript:@"IrisSequenceAdjusterRecipe"];

  __int16 v35 = *(_WORD *)v36;
  if ((*(_WORD *)v36 & 0x10) != 0) {
    goto LABEL_58;
  }
LABEL_45:
  if ((v35 & 0x20) != 0)
  {
LABEL_46:
    int v42 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v36 + 58)];
    [v4 setObject:v42 forKeyedSubscript:@"InterpolatedFrame"];
  }
LABEL_47:
  id v43 = v4;
  void *v2 = v43;

  return 0;
}

uint64_t sub_1DD3C00C4(const __CFData *a1, void *a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  unsigned int v14 = 0;
  size_t size = 0;
  uint64_t v6 = off_1EBE9D6D0(BytePtr, Length, 3, 0, &v14, &size);
  if (v6)
  {
    uint64_t v7 = v6;
    NSLog(&cfstr_Figlivephotome.isa, v6);
  }
  else
  {
    uint64_t v8 = malloc_type_malloc(size, 0xAADC7F20uLL);
    if (v8)
    {
      double v9 = v8;
      uint64_t v10 = off_1EBE9D6D8(BytePtr, Length, v14, size, v8);
      if (v10)
      {
        uint64_t v7 = v10;
        NSLog(&cfstr_Figlivephotome_0.isa, v10);
      }
      else
      {
        id v12 = 0;
        uint64_t v7 = sub_1DD3BFA1C((uint64_t)v9, &v12);
        *a2 = v12;
      }
      free(v9);
    }
    else
    {
      NSLog(&cfstr_CouldNotAlloca.isa);
      return 0;
    }
  }
  return v7;
}

uint64_t sub_1DD3C1234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1EAB20CA8 != -1) {
    dispatch_once(&qword_1EAB20CA8, &unk_1F3892018);
  }
  id v12 = (uint64_t (*)())dlsym((void *)qword_1EAB20CB0, "FigLivePhotoMetadataComputeDeserializationSize");
  off_1EBE9D6A8 = v12;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v12)(a1, a2, a3, a4, a5, a6);
}

void *sub_1DD3C12E8()
{
  uint64_t result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 2);
  qword_1EAB20CB0 = (uint64_t)result;
  return result;
}

uint64_t sub_1DD3C1314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1EAB20CA8 != -1) {
    dispatch_once(&qword_1EAB20CA8, &unk_1F3892018);
  }
  uint64_t v10 = (uint64_t (*)())dlsym((void *)qword_1EAB20CB0, "FigLivePhotoMetadataDeserializeIntoBuffer");
  off_1EBE9D6B0 = v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v10)(a1, a2, a3, a4, a5);
}

uint64_t sub_1DD3C13C0()
{
  if (qword_1EAB20CA8 != -1) {
    dispatch_once(&qword_1EAB20CA8, &unk_1F3892018);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)qword_1EAB20CB0, "kFigMetadataDataType_QuickTimeMetadataLivePhotoInfo");
  if (v0)
  {
    uint64_t result = *v0;
    qword_1EAB20CB8 = result;
  }
  else
  {
    uint64_t result = qword_1EAB20CB8;
  }
  off_1EBE9D698 = sub_1DD3C1440;
  return result;
}

uint64_t sub_1DD3C1440()
{
  return qword_1EAB20CB8;
}

uint64_t sub_1DD3C144C()
{
  if (qword_1EAB20CA8 != -1) {
    dispatch_once(&qword_1EAB20CA8, &unk_1F3892018);
  }
  uint64_t v0 = (uint64_t *)dlsym((void *)qword_1EAB20CB0, "kFigMetadataIdentifier_QuickTimeMetadataLivePhotoInfo");
  if (v0)
  {
    uint64_t result = *v0;
    qword_1EAB20CC0 = result;
  }
  else
  {
    uint64_t result = qword_1EAB20CC0;
  }
  off_1EBE9D6A0 = sub_1DD3C14CC;
  return result;
}

uint64_t sub_1DD3C14CC()
{
  return qword_1EAB20CC0;
}

float sub_1DD3C14D8(uint64_t *a1, uint64_t *a2, _DWORD *a3, float result)
{
  *a3 = 0;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = (v5 - *a1) >> 2;
  uint64_t v7 = *a2;
  if (v6 != (a2[1] - *a2) >> 2) {
    *a3 = -1;
  }
  if (v5 != v4)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t result = result + (float)(*(float *)(v4 + 4 * v8) * *(float *)(v7 + 4 * v8));
      ++v8;
    }
    while (v6 > v8);
  }
  return result;
}

float sub_1DD3C1528(uint64_t *a1, uint64_t *a2, uint64_t *a3, _DWORD *a4)
{
  *a4 = 0;
  uint64_t v7 = a2[1] - *a2;
  if (!a1 || !a2 || !a3 || v7 != a3[1] - *a3) {
    *a4 = -1;
  }
  sub_1DD3B854C((uint64_t)a1, v7 >> 2);
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v11 = v10 - *a2;
  if (v10 != *a2)
  {
    uint64_t v12 = 0;
    unint64_t v13 = v11 >> 2;
    uint64_t v14 = *a3;
    uint64_t v15 = *a1;
    do
    {
      float result = *(float *)(v9 + 4 * v12) + *(float *)(v14 + 4 * v12);
      *(float *)(v15 + 4 * v12++) = result;
    }
    while (v13 > v12);
  }
  return result;
}

void sub_1DD3C15CC(void *a1, uint64_t *a2, char **a3, _DWORD *a4)
{
  *a4 = 0;
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  if (a1 && a2 && a3)
  {
    if (v9 != v8) {
      goto LABEL_7;
    }
    uint64_t v8 = a3[1];
  }
  *a4 = -1;
LABEL_7:
  uint64_t v10 = v9 - v8;
  if (!v10) {
    sub_1DD3B37AC();
  }
  if (a2[1] - *a2 != *((void *)v8 + 1) - *(void *)v8) {
    *a4 = -1;
  }
  sub_1DD3B854C((uint64_t)a1, 0xAAAAAAAAAAAAAAABLL * (v10 >> 3));
  uint64_t v11 = *a3;
  if (a3[1] != *a3)
  {
    unint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      float v14 = sub_1DD3C14D8(a2, (uint64_t *)&v11[24 * v12], a4, 0.0);
      if (v12 >= (uint64_t)(a1[1] - *a1) >> 2) {
        sub_1DD3B37AC();
      }
      *(float *)(*a1 + 4 * v12) = v14;
      unint64_t v12 = v13;
      uint64_t v11 = *a3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 3) > v13++);
  }
}

float sub_1DD3C16F0(uint64_t *a1, uint64_t *a2, char **a3, uint64_t *a4, _DWORD *a5)
{
  if (a3)
  {
    sub_1DD3C15CC(a1, a2, a3, a5);
  }
  else if (a1 != a2)
  {
    sub_1DD3B542C((char *)a1, (char *)*a2, a2[1], (a2[1] - *a2) >> 2);
  }
  if (a4 && !*a5)
  {
    return sub_1DD3C1528(a1, a1, a4, a5);
  }
  return result;
}

void sub_1DD3C1790(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v3 = 0;
    unint64_t v4 = (v2 - *a1) >> 2;
    float v5 = 0.0;
    do
      float v5 = v5 + expf(*(float *)(v1 + 4 * v3++));
    while (v4 > v3);
    if (v2 != v1)
    {
      uint64_t v6 = 0;
      do
      {
        *(float *)(v1 + 4 * v6) = expf(*(float *)(v1 + 4 * v6)) / v5;
        ++v6;
      }
      while (v4 > v6);
    }
  }
}

id sub_1DD3C1814(uint64_t *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v4 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      LODWORD(v3) = *(_DWORD *)(v4 + 4 * v5);
      uint64_t v7 = [NSNumber numberWithFloat:v3];
      [v2 addObject:v7];

      unint64_t v5 = v6;
      uint64_t v4 = *a1;
      ++v6;
    }
    while (v5 < (a1[1] - *a1) >> 2);
  }

  return v2;
}

void sub_1DD3C18C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C18E0(void *a1, void *a2)
{
  id v6 = a1;
  sub_1DD3B854C((uint64_t)a2, [v6 count]);
  for (unsigned int i = 0; [v6 count] > (unint64_t)i; ++i)
  {
    uint64_t v4 = [v6 objectAtIndexedSubscript:i];
    [v4 floatValue];
    *(_DWORD *)(*a2 + 4 * i) = v5;
  }
}

void sub_1DD3C1980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1DD3C19A4()
{
  return (id)qword_1EAB20B50;
}

id sub_1DD3C19B0()
{
  return (id)qword_1EAB20B58;
}

id sub_1DD3C19BC()
{
  return (id)qword_1EAB20B60;
}

id sub_1DD3C19C8()
{
  return (id)qword_1EAB20B68;
}

id sub_1DD3C19D4()
{
  return (id)qword_1EAB20B70;
}

uint64_t sub_1DD3C19E0(void *a1)
{
  id v1 = a1;
  if (!v1) {
    printf("ALGatingClassifier: error reading model file.");
  }
  uint64_t v2 = [v1 objectForKeyedSubscript:qword_1EAB20B78];
  if ([v2 isEqual:qword_1EAB20B50]) {
    operator new();
  }
  if ([v2 isEqual:qword_1EAB20B58]) {
    operator new();
  }
  if ([v2 isEqual:qword_1EAB20B60]) {
    operator new();
  }
  if ([v2 isEqual:qword_1EAB20B68]) {
    operator new();
  }
  if ([v2 isEqual:qword_1EAB20B70]) {
    operator new();
  }
  printf("ALGatingClassifier: unrecognized model type.");
  if (sub_1DD3C1C80(0, v1)) {
    puts("ALGatingClassifier: error loading model from file.");
  }

  return 0;
}

void sub_1DD3C1C3C(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v3, 0x10A1C407830D277);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C1C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 objectForKeyedSubscript:qword_1EAB20B78];
    if (v5
      && ((*(void (**)(uint64_t))(*(void *)a1 + 32))(a1),
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v5 isEqual:v6],
          v6,
          (v7 & 1) != 0))
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:qword_1EAB20B80];
      uint64_t v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 objectForKeyedSubscript:qword_1EAB20B90];

        if (v10)
        {
          uint64_t v11 = [v9 objectForKeyedSubscript:qword_1EAB20B90];
          [v11 floatValue];
          *(_DWORD *)(a1 + 12) = v12;
        }
        unsigned int v13 = [v9 objectForKeyedSubscript:qword_1EAB20B98];

        if (v13)
        {
          float v14 = [v9 objectForKeyedSubscript:qword_1EAB20B98];
          *(unsigned char *)(a1 + 16) = [v14 BOOLValue];
        }
        uint64_t v15 = (*(uint64_t (**)(uint64_t, void *))(*(void *)a1 + 40))(a1, v9);
        if (!v15)
        {
          uint64_t v15 = [v4 objectForKeyedSubscript:qword_1EAB20B88];

          if (v15)
          {
            if (!*(void *)(a1 + 24)) {
              operator new();
            }
            if (!*(void *)(a1 + 32)) {
              operator new();
            }
            uint64_t v16 = [v4 objectForKeyedSubscript:qword_1EAB20B88];
            uint64_t v15 = sub_1DD3C2224(v16, *(uint64_t **)(a1 + 24), *(void **)(a1 + 32));
          }
        }
      }
      else
      {
        printf("ALGatingClassifier::loadModel: missing model dictionary key.");
        uint64_t v15 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      printf("ALGatingClassifier::loadModel: missing or mismatched classifier type.");
      uint64_t v15 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    printf("ALGatingClassifier::loadModel: missing model file dict.");
    uint64_t v15 = 0xFFFFFFFFLL;
  }

  return v15;
}

void sub_1DD3C1ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3C1F2C(void *a1)
{
  *a1 = &unk_1F3891CB0;
  uint64_t v2 = a1[3];
  if (v2)
  {
    id v6 = (void **)a1[3];
    sub_1DD3B1844(&v6);
    MEMORY[0x1E01B4150](v2, 0x20C40960023A9);
    a1[3] = 0;
  }
  uint64_t v3 = a1[4];
  if (v3)
  {
    uint64_t v4 = *(void **)v3;
    if (*(void *)v3)
    {
      *(void *)(v3 + 8) = v4;
      operator delete(v4);
    }
    MEMORY[0x1E01B4150](v3, 0x80C40D6874129);
    a1[4] = 0;
  }
  return a1;
}

float sub_1DD3C1FE0(void *a1, uint64_t *a2, _DWORD *a3)
{
  *a3 = 0;
  int v5 = (char **)a1[3];
  id v6 = (uint64_t *)a1[4];
  if (*(_OWORD *)(a1 + 3) == 0) {
    return (*(float (**)(void *, uint64_t *, _DWORD *))(*a1 + 56))(a1, a2, a3);
  }
  __p = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  *a3 = 0;
  float v8 = sub_1DD3C16F0((uint64_t *)&__p, a2, v5, v6, a3);
  float v7 = 0.0;
  if (!*a3) {
    float v7 = (*(float (**)(void *, void **, _DWORD *, float))(*a1 + 56))(a1, &__p, a3, v8);
  }
  if (__p)
  {
    uint64_t v11 = __p;
    operator delete(__p);
  }
  return v7;
}

void sub_1DD3C20E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1DD3C2104(uint64_t a1, uint64_t *a2, _DWORD *a3, float *a4)
{
  float v7 = sub_1DD3C1FE0((void *)a1, a2, a3);
  *a4 = v7;
  if (*a3)
  {
    puts("ALGatingClassifier::predict error.");
    return 0;
  }
  else
  {
    float v9 = *(float *)(a1 + 12);
    if (*(unsigned char *)(a1 + 16)) {
      return v7 <= v9;
    }
    else {
      return v7 > v9;
    }
  }
}

id sub_1DD3C2174(uint64_t a1, int a2, float a3)
{
  double v3 = a3;
  double v4 = *(float *)(a1 + 12);
  if (a2)
  {
    int v5 = @"<=";
    if (!*(unsigned char *)(a1 + 16)) {
      int v5 = @">";
    }
    [NSString stringWithFormat:@"Failed (score = %f %@ threshold = %f).\n", *(void *)&v3, v5, *(void *)&v4];
  }
  else
  {
    id v6 = @">";
    if (!*(unsigned char *)(a1 + 16)) {
      id v6 = @"<=";
    }
    [NSString stringWithFormat:@"Passed (score = %f %@ threshold = %f).\n", *(void *)&v3, v6, *(void *)&v4];
  float v7 = };

  return v7;
}

uint64_t sub_1DD3C2224(void *a1, uint64_t *a2, void *a3)
{
  id v5 = a1;
  id v6 = [v5 objectForKeyedSubscript:qword_1EAB20BA0];

  if (v6)
  {
    float v7 = [v5 objectForKeyedSubscript:qword_1EAB20BA0];
    float v8 = v7;
    if (v7)
    {
      unint64_t v9 = [v7 count];
      sub_1DD3C2CD0(a2, v9);
      if (v9)
      {
        unint64_t v10 = 0;
        unsigned int v11 = 1;
        do
        {
          uint64_t v12 = [v8 objectAtIndex:v10];
          unsigned int v13 = v12;
          if (v12)
          {
            if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) <= v10) {
              sub_1DD3B37AC();
            }
            sub_1DD3C18E0(v12, (void *)(*a2 + 24 * v10));
          }

          unint64_t v10 = v11;
        }
        while (v9 > v11++);
      }
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:qword_1EAB20BA8];

  if (v16)
  {
    BOOL v17 = [v5 objectForKeyedSubscript:qword_1EAB20BA8];
    if (v17)
    {
      id v18 = [v5 objectForKeyedSubscript:qword_1EAB20BA8];
      sub_1DD3C18E0(v18, a3);
    }
    else
    {
      uint64_t v15 = 0xFFFFFFFFLL;
    }
  }
  return v15;
}

void sub_1DD3C23B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float sub_1DD3C23FC(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 12) = 0;
  return 1.0;
}

void sub_1DD3C2414(uint64_t a1)
{
  *(unsigned char *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)a1 = &unk_1F3891C10;
  *(_DWORD *)(a1 + 40) = 0;
  operator new();
}

void sub_1DD3C2490(_Unwind_Exception *a1)
{
  sub_1DD3C1F2C(v1);
  _Unwind_Resume(a1);
}

void *sub_1DD3C24A4(void *a1)
{
  *a1 = &unk_1F3891C10;
  uint64_t v2 = a1[6];
  if (v2)
  {
    double v3 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1E01B4150](v2, 0x80C40D6874129);
    a1[6] = 0;
  }

  return sub_1DD3C1F2C(a1);
}

void sub_1DD3C252C(void *a1)
{
  sub_1DD3C24A4(a1);

  JUMPOUT(0x1E01B4150);
}

float sub_1DD3C2564(uint64_t a1, uint64_t *a2, _DWORD *a3)
{
  *a3 = 0;
  double v3 = *(uint64_t **)(a1 + 48);
  if (a2[1] - *a2 == v3[1] - *v3) {
    return sub_1DD3C14D8(a2, v3, a3, *(float *)(a1 + 40));
  }
  *a3 = -1;
  return -1.0;
}

void *sub_1DD3C25A4(void *a1)
{
  *a1 = &unk_1F3891BC0;
  uint64_t v2 = a1[5];
  if (v2)
  {
    double v3 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1E01B4150](v2, 0x20C40960023A9);
    a1[5] = 0;
  }

  return sub_1DD3C1F2C(a1);
}

void sub_1DD3C262C(void *a1)
{
  sub_1DD3C25A4(a1);

  JUMPOUT(0x1E01B4150);
}

float sub_1DD3C2664(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 0;
  *(void *)(a1 + 48) = -1;
  uint64_t v4 = **(void **)(a1 + 40);
  if (*(unsigned char *)(v4 + 28))
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v5 = v6;
      float v8 = (uint64_t *)(v4 + 40 * v6);
      uint64_t v9 = *v8;
      float v10 = *(float *)(*a2 + 4 * *v8);
      float v11 = *((float *)v8 + 6);
      uint64_t v12 = v8 + 1;
      unsigned int v13 = v8 + 2;
      if (v10 >= v11) {
        unsigned int v13 = v12;
      }
      uint64_t v6 = *v13;
      if (*(unsigned char *)(a1 + 8))
      {
        printf("tree traverse: node %zu (feature %zu): go to node %zu\n", v5, v9, v6);
        uint64_t v4 = **(void **)(a1 + 40);
      }
    }
    while (!*(unsigned char *)(v4 + 40 * v6 + 28));
  }
  *(void *)(a1 + 48) = *(void *)(v4 + 40 * v5);
  if (*(unsigned char *)(a1 + 8))
  {
    printf("tree traverse: leaf %zu: %f\n", v6, *(float *)(v4 + 40 * v6 + 32));
    uint64_t v4 = **(void **)(a1 + 40);
  }
  return *(float *)(v4 + 40 * v6 + 32);
}

BOOL sub_1DD3C2780(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 64);
  uint64_t v2 = *(void *)(*(void *)(a1 + 64) + 8) - v1;
  if (v2)
  {
    unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (v2 >> 3);
    uint64_t v4 = **(void **)(a1 + 72);
    if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)(a1 + 72) + 8) - v4) >> 3) == v3)
    {
      uint64_t v6 = *(void **)v1;
      uint64_t v5 = *(void *)(v1 + 8);
      uint64_t v7 = v5 - *(void *)v1;
      if (v5 != *(void *)v1)
      {
        uint64_t v8 = 0;
        unsigned int v9 = 1;
        while (v6[1] != *v6)
        {
          unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3);
          if (v10 != (uint64_t)(*(void *)(v4 + 24 * v8 + 8) - *(void *)(v4 + 24 * v8)) >> 2) {
            break;
          }
          if (v3 <= v9)
          {
            uint64_t v12 = *(void *)(v1 + 24 * v3 - 16) - *(void *)(v1 + 24 * v3 - 24);
            if (!v12) {
              return 0;
            }
            return *(void *)(a1 + 56) < 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
          }
          uint64_t v8 = v9;
          float v11 = *(void **)(v1 + 24 * v9);
          if (*(void **)(v1 + 24 * v9 + 8) == v11 || v10 == (uint64_t)(v11[1] - *v11) >> 2)
          {
            uint64_t v6 = *(void **)(v1 + 24 * v9++);
            uint64_t v7 = *(void *)(v1 + 24 * v8 + 8) - (void)v6;
            if (v7) {
              continue;
            }
          }
          return 0;
        }
      }
    }
  }
  return 0;
}

void *sub_1DD3C2884(uint64_t a1)
{
  *(void *)a1 = &unk_1F3891C60;
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v5 = *(void ***)(a1 + 64);
    sub_1DD3C3F84(&v5);
    MEMORY[0x1E01B4150](v2, 0x20C40960023A9);
    *(void *)(a1 + 64) = 0;
  }
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3)
  {
    uint64_t v5 = *(void ***)(a1 + 72);
    sub_1DD3B1844(&v5);
    MEMORY[0x1E01B4150](v3, 0x20C40960023A9);
    *(void *)(a1 + 72) = 0;
  }

  return sub_1DD3C1F2C((void *)a1);
}

void sub_1DD3C293C(uint64_t a1)
{
  sub_1DD3C2884(a1);

  JUMPOUT(0x1E01B4150);
}

float sub_1DD3C2974(uint64_t a1, uint64_t a2, int *a3)
{
  *a3 = 0;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == -1)
  {
    int v6 = sub_1DD3C2780(a1);
    *(_DWORD *)(a1 + 40) = v6;
  }
  if (v6 == 1) {
    int v7 = 0;
  }
  else {
    int v7 = -1;
  }
  *a3 = v7;
  __int16 v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  sub_1DD3B2F2C(&v35, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  __p = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  float v8 = 0.0;
  if (*a3) {
    goto LABEL_42;
  }
  uint64_t v9 = **(void **)(a1 + 64);
  if (*(void *)(*(void *)(a1 + 64) + 8) == v9)
  {
LABEL_38:
    uint64_t v30 = __p;
    float v8 = *((float *)__p + *(void *)(a1 + 56));
    goto LABEL_41;
  }
  unint64_t v10 = 0;
  unsigned int v11 = 0;
  uint64_t v12 = @"NeuralNetActivation_ReLU";
  do
  {
    uint64_t v13 = v9 + 24 * v10;
    float v14 = *(void **)v13;
    uint64_t v15 = *(void *)(v13 + 8) - *(void *)v13;
    if (!v15 || (uint64_t v16 = v14[1] - *v14) == 0 || v36 - (unsigned char *)v35 != v16)
    {
LABEL_39:
      *a3 = -1;
      goto LABEL_40;
    }
    sub_1DD3B854C((uint64_t)&__p, 0xAAAAAAAAAAAAAAABLL * (v15 >> 3));
    BOOL v17 = *(uint64_t **)(a1 + 64);
    uint64_t v18 = *v17;
    if (0xAAAAAAAAAAAAAAABLL * ((v17[1] - *v17) >> 3) <= v10) {
      sub_1DD3B37AC();
    }
    unsigned int v19 = *(void **)(a1 + 72);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[1] - *v19) >> 3) <= v10) {
      sub_1DD3B37AC();
    }
    *(float *)&double v20 = sub_1DD3C16F0((uint64_t *)&__p, (uint64_t *)&v35, (char **)(v18 + 24 * v10), (uint64_t *)(*v19 + 24 * v10), a3);
    if (*a3) {
      goto LABEL_40;
    }
    if (-1 - 0x5555555555555555 * ((uint64_t)(*(void *)(*(void *)(a1 + 64) + 8) - **(void **)(a1 + 64)) >> 3) == v10)
    {
      sub_1DD3C1790((uint64_t *)&__p);
      goto LABEL_36;
    }
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", v12, v20))
    {
      uint64_t v22 = (char *)__p;
      uint64_t v21 = (uint64_t)v33;
      if (v33 != __p)
      {
        uint64_t v23 = 0;
        unint64_t v24 = (v33 - (unsigned char *)__p) >> 2;
        do
        {
          if (*(float *)&v22[4 * v23] < 0.0) {
            *(_DWORD *)&v22[4 * v23] = 0;
          }
          ++v23;
        }
        while (v24 > v23);
        goto LABEL_35;
      }
LABEL_34:
      uint64_t v22 = (char *)v21;
      goto LABEL_35;
    }
    if ([*(id *)(a1 + 48) isEqualToString:@"NeuralNetActivation_Sigmoid"])
    {
      uint64_t v22 = (char *)__p;
      uint64_t v21 = (uint64_t)v33;
      if (v33 == __p) {
        goto LABEL_34;
      }
      uint64_t v25 = v12;
      uint64_t v26 = 0;
      unint64_t v27 = (v33 - (unsigned char *)__p) >> 2;
      do
      {
        *(float *)&v22[4 * v26] = 1.0 / (float)(expf(*(float *)&v22[4 * v26]) + 1.0);
        ++v26;
      }
      while (v27 > v26);
    }
    else
    {
      if (![*(id *)(a1 + 48) isEqualToString:@"NeuralNetActivation_Tanh"]) {
        goto LABEL_39;
      }
      uint64_t v22 = (char *)__p;
      uint64_t v21 = (uint64_t)v33;
      if (v33 == __p) {
        goto LABEL_34;
      }
      uint64_t v25 = v12;
      uint64_t v28 = 0;
      unint64_t v29 = (v33 - (unsigned char *)__p) >> 2;
      do
      {
        *(float *)&v22[4 * v28] = tanhf(*(float *)&v22[4 * v28]);
        ++v28;
      }
      while (v29 > v28);
    }
    uint64_t v12 = v25;
LABEL_35:
    sub_1DD3B542C((char *)&v35, v22, v21, (v21 - (uint64_t)v22) >> 2);
LABEL_36:
    uint64_t v9 = **(void **)(a1 + 64);
    unint64_t v10 = ++v11;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)(a1 + 64) + 8) - v9) >> 3) > v11);
  if (!*a3) {
    goto LABEL_38;
  }
LABEL_40:
  uint64_t v30 = __p;
  float v8 = 0.0;
  if (__p)
  {
LABEL_41:
    uint64_t v33 = v30;
    operator delete(v30);
  }
LABEL_42:
  if (v35)
  {
    uint64_t v36 = v35;
    operator delete(v35);
  }
  return v8;
}

void sub_1DD3C2CA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3C2CD0(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_1DD3C3FF8(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      uint64_t v8 = a1[1];
      do
      {
        unint64_t v10 = *(void **)(v8 - 24);
        v8 -= 24;
        uint64_t v9 = v10;
        if (v10)
        {
          *(void *)(v3 - 16) = v9;
          operator delete(v9);
        }
        uint64_t v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

uint64_t sub_1DD3C2D78()
{
  return [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
}

uint64_t sub_1DD3C2D88()
{
  return 0;
}

id sub_1DD3C2D90(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  unint64_t v4 = [NSNumber numberWithFloat:v3];
  [v2 setObject:v4 forKeyedSubscript:qword_1EAB20BB0];

  BOOL v5 = sub_1DD3C1814(*(uint64_t **)(a1 + 48));
  [v2 setObject:v5 forKeyedSubscript:qword_1EAB20BB8];

  return v2;
}

void sub_1DD3C2E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C2E5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 objectForKeyedSubscript:qword_1EAB20BB0];
  if (v4
    && ([v3 objectForKeyedSubscript:qword_1EAB20BB8],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    unint64_t v6 = [v3 objectForKeyedSubscript:qword_1EAB20BB0];
    [v6 floatValue];
    *(_DWORD *)(a1 + 40) = v7;

    uint64_t v8 = [v3 objectForKeyedSubscript:qword_1EAB20BB8];
    sub_1DD3C18E0(v8, *(void **)(a1 + 48));

    uint64_t v9 = 0;
  }
  else
  {
    puts("linearModelFromInnerDictionary: bad or missing keys for model.");
    uint64_t v9 = 0xFFFFFFFFLL;
  }

  return v9;
}

void sub_1DD3C2F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3C2F58(uint64_t a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v22 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v3 = **(void **)(a1 + 40);
  if (*(void *)(*(void *)(a1 + 40) + 8) != v3)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      unint64_t v6 = (unsigned int *)(v3 + 40 * v4);
      if (v6[7])
      {
        unsigned int v18 = v6[8];
        v25[0] = qword_1EAB20BE8;
        unsigned int v11 = [NSNumber numberWithBool:1];
        v25[1] = qword_1EAB20BF0;
        v26[0] = v11;
        LODWORD(v19) = v18;
        uint64_t v12 = [NSNumber numberWithFloat:v19];
        v26[1] = v12;
        BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      }
      else
      {
        uint64_t v7 = *((void *)v6 + 1);
        uint64_t v8 = *((void *)v6 + 2);
        unsigned int v9 = v6[6];
        uint64_t v10 = *v6;
        v23[0] = qword_1EAB20BC8;
        unsigned int v11 = [NSNumber numberWithInt:v10];
        v24[0] = v11;
        v23[1] = qword_1EAB20BD0;
        uint64_t v12 = [NSNumber numberWithInt:v7];
        v24[1] = v12;
        v23[2] = qword_1EAB20BD8;
        uint64_t v13 = [NSNumber numberWithInt:v8];
        v24[2] = v13;
        void v23[3] = qword_1EAB20BE0;
        LODWORD(v14) = v9;
        uint64_t v15 = [NSNumber numberWithFloat:v14];
        v24[3] = v15;
        v23[4] = qword_1EAB20BE8;
        uint64_t v16 = [NSNumber numberWithBool:0];
        v24[4] = v16;
        BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
      }
      [v2 addObject:v17];

      uint64_t v4 = v5;
      uint64_t v3 = **(void **)(a1 + 40);
    }
    while (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(*(void *)(a1 + 40) + 8) - v3) >> 3) > v5++);
  }
  [v22 setObject:v2 forKeyedSubscript:qword_1EAB20BC0];

  return v22;
}

void sub_1DD3C31FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C327C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 objectForKeyedSubscript:qword_1EAB20BC0];
  if (objc_claimAutoreleasedReturnValue()) {
    operator new();
  }
  puts("binaryTreeFromInnerDictionary: bad or missing keys for model.");

  return 0xFFFFFFFFLL;
}

void sub_1DD3C36B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

id sub_1DD3C373C(uint64_t a1)
{
  v27[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v3 = **(void **)(a1 + 64);
  if (*(void *)(*(void *)(a1 + 64) + 8) != v3)
  {
    int v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      sub_1DD3C43D8(&v22, *(void *)(v3 + 24 * v5), *(void *)(v3 + 24 * v5 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v3 + 24 * v5 + 8) - *(void *)(v3 + 24 * v5)) >> 3));
      unint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
      uint64_t v7 = v22;
      if (v23 != v22)
      {
        uint64_t v8 = 0;
        unsigned int v9 = 1;
        do
        {
          uint64_t v10 = sub_1DD3C1814((uint64_t *)(v7 + 24 * v8));
          [v6 addObject:v10];

          uint64_t v8 = v9;
          uint64_t v7 = v22;
          BOOL v11 = 0xAAAAAAAAAAAAAAABLL * ((v23 - v22) >> 3) > v9++;
        }
        while (v11);
      }
      [v2 addObject:v6];

      uint64_t v25 = (void **)&v22;
      sub_1DD3B1844(&v25);
      unint64_t v5 = (v4 + 1);
      uint64_t v12 = *(uint64_t **)(a1 + 64);
      uint64_t v3 = *v12;
      if (0xAAAAAAAAAAAAAAABLL * ((v12[1] - *v12) >> 3) <= v5) {
        break;
      }
      ++v4;
    }
  }
  uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  uint64_t v14 = **(void **)(a1 + 72);
  if (*(void *)(*(void *)(a1 + 72) + 8) != v14)
  {
    uint64_t v15 = 0;
    unsigned int v16 = 1;
    do
    {
      BOOL v17 = sub_1DD3C1814((uint64_t *)(v14 + 24 * v15));
      [v13 addObject:v17];

      uint64_t v15 = v16;
      uint64_t v14 = **(void **)(a1 + 72);
      BOOL v11 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)(a1 + 72) + 8) - v14) >> 3) > v16++;
    }
    while (v11);
  }
  unsigned int v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v26[0] = qword_1EAB20BF8;
  v26[1] = qword_1EAB20C00;
  uint64_t v19 = *(void *)(a1 + 48);
  v27[0] = v18;
  v27[1] = v19;
  v26[2] = qword_1EAB20C10;
  void v26[3] = qword_1EAB20C08;
  v27[2] = v13;
  v27[3] = v2;
  double v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v20;
}

void sub_1DD3C39D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C3A4C(uint64_t a1, void *a2)
{
  id v32 = a2;
  if (!*(void *)(a1 + 64)) {
    operator new();
  }
  if (!*(void *)(a1 + 72)) {
    operator new();
  }
  id v3 = objc_alloc_init(NSString);
  int v4 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v3;

  unint64_t v5 = [v32 objectForKeyedSubscript:qword_1EAB20BF8];
  *(void *)(a1 + 56) = (int)[v5 intValue];

  uint64_t v6 = [v32 objectForKeyedSubscript:qword_1EAB20C00];
  uint64_t v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v6;

  uint64_t v8 = [v32 objectForKeyedSubscript:qword_1EAB20C08];
  unsigned int v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 count];
    sub_1DD3C3E44(*(uint64_t **)(a1 + 64), v10);
    if (v10)
    {
      unint64_t v11 = 0;
      unsigned int v12 = 0;
      do
      {
        uint64_t v13 = v9;
        uint64_t v14 = [v9 objectAtIndexedSubscript:v11];
        sub_1DD3C47F0(&__p, [v14 count]);
        for (unsigned int i = 0; [v14 count] > (unint64_t)i; ++i)
        {
          unsigned int v16 = [v14 objectAtIndexedSubscript:i];
          BOOL v17 = v16;
          if (v16) {
            sub_1DD3C18E0(v16, (void *)__p + 3 * i);
          }
        }
        unsigned int v18 = *(void **)(a1 + 64);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18[1] - *v18) >> 3) <= v11) {
          sub_1DD3B37AC();
        }
        uint64_t v19 = (void **)(*v18 + 24 * v11);
        if (v19 != &__p) {
          sub_1DD3B5674((uint64_t)v19, (uint64_t)__p, (uint64_t)v34, 0xAAAAAAAAAAAAAAABLL * ((v34 - (unsigned char *)__p) >> 3));
        }
        p_p = &__p;
        sub_1DD3B1844(&p_p);

        unint64_t v11 = ++v12;
        unsigned int v9 = v13;
      }
      while (v10 > v12);
    }
  }
  double v20 = v9;
  uint64_t v21 = [v32 objectForKeyedSubscript:qword_1EAB20C10];
  uint64_t v22 = v21;
  if (v21)
  {
    unint64_t v23 = [v21 count];
    sub_1DD3C2CD0(*(uint64_t **)(a1 + 72), v23);
    if (v23)
    {
      unint64_t v24 = 0;
      unsigned int v25 = 1;
      do
      {
        uint64_t v26 = [v22 objectAtIndexedSubscript:v24];
        sub_1DD3B3678(&__p, [v26 count]);

        unint64_t v27 = [v22 objectAtIndexedSubscript:v24];
        sub_1DD3C18E0(v27, &__p);

        uint64_t v28 = *(void **)(a1 + 72);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28[1] - *v28) >> 3) <= v24) {
          sub_1DD3B37AC();
        }
        unint64_t v29 = (char *)(*v28 + 24 * v24);
        if (v29 != (char *)&__p) {
          sub_1DD3B542C(v29, (char *)__p, (uint64_t)v34, (v34 - (unsigned char *)__p) >> 2);
        }
        if (__p)
        {
          uint64_t v34 = __p;
          operator delete(__p);
        }
        unint64_t v24 = v25;
      }
      while (v23 > v25++);
    }
  }

  return 0;
}

void sub_1DD3C3D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C3E44(uint64_t *a1, unint64_t a2)
{
  id v3 = (void **)a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_1DD3C4460(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    while (v3 != (void **)v7)
    {
      v3 -= 3;
      uint64_t v8 = v3;
      sub_1DD3B1844(&v8);
    }
    a1[1] = v7;
  }
}

uint64_t sub_1DD3C3EEC()
{
  return 1;
}

uint64_t sub_1DD3C3EF4()
{
  return 0xFFFFFFFFLL;
}

void sub_1DD3C3F00(void *a1)
{
  sub_1DD3C1F2C(a1);

  JUMPOUT(0x1E01B4150);
}

uint64_t sub_1DD3C3F38()
{
  return 0;
}

void sub_1DD3C3F44(void *a1)
{
  sub_1DD3C24A4(a1);

  JUMPOUT(0x1E01B4150);
}

uint64_t sub_1DD3C3F7C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

void sub_1DD3C3F84(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    unint64_t v4 = (void **)v1[1];
    BOOL v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        unint64_t v6 = v4;
        sub_1DD3B1844(&v6);
      }
      while (v4 != v2);
      BOOL v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DD3C3FF8(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      unsigned int v12 = (char *)sub_1DD3A9BF8(v4, v11);
    }
    else {
      unsigned int v12 = 0;
    }
    uint64_t v15 = v12;
    unsigned int v16 = &v12[24 * v8];
    unsigned int v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    BOOL v17 = &v16[v14];
    sub_1DD3C4160(a1, &v15);
    sub_1DD3C42FC((uint64_t)&v15);
  }
}

void sub_1DD3C414C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DD3C42FC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C4160(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1DD3C41D8((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1DD3C41D8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  id v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_1DD3C427C((uint64_t)v11);
  return v9;
}

uint64_t sub_1DD3C427C(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1DD3C42B4(a1);
  }
  return a1;
}

void sub_1DD3C42B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    id v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t sub_1DD3C42FC(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1DD3C4334(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void *sub_1DD3C4390(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_1DD3A9C40();
  }
  return operator new(40 * a2);
}

void *sub_1DD3C43D8(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_1DD3B197C(result, a4);
    uint64_t result = sub_1DD3B5800((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1DD3C4440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1DD3B1844(&a9);
  _Unwind_Resume(a1);
}

void sub_1DD3C4460(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      char v12 = (char *)sub_1DD3A9BF8(v4, v11);
    }
    else {
      char v12 = 0;
    }
    uint64_t v15 = v12;
    unsigned int v16 = &v12[24 * v8];
    unsigned int v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    BOOL v17 = &v16[v14];
    sub_1DD3C45C8(a1, &v15);
    sub_1DD3C4768(&v15);
  }
}

void sub_1DD3C45B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DD3C4768((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C45C8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1DD3C4640((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1DD3C4640(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  id v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_1DD3C46E4((uint64_t)v11);
  return v9;
}

uint64_t sub_1DD3C46E4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_1DD3C471C(a1);
  }
  return a1;
}

void sub_1DD3C471C(uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    id v3 = v1;
    sub_1DD3B1844(&v3);
    v1 += 3;
  }
}

void **sub_1DD3C4768(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_1DD3C479C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = (void **)(i - 24);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    sub_1DD3B1844(&v5);
  }
}

void *sub_1DD3C47F0(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B197C(a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1DD3C4880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

double sub_1DD3C4894(unsigned int a1, float *a2)
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = a1;
  double result = 0.0;
  do
  {
    float v4 = *a2++;
    *(float *)&double result = *(float *)&result + v4;
    --v2;
  }
  while (v2);
  *(float *)&double result = *(float *)&result / (float)a1;
  return result;
}

float sub_1DD3C48C4(unsigned int a1, float a2)
{
  float v2 = 1.0;
  if (a2 >= 0.0) {
    return a2 / (float)((float)a1 + a2);
  }
  return v2;
}

CMTime *getMinimumSafeInputDuration_0@<X0>(CMTime *a1@<X8>)
{
  return CMTimeMakeWithSeconds(a1, 0.45, 600);
}

__n128 sub_1DD3C48F4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1 = MEMORY[0x1E4F1FA48];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)a1 = *MEMORY[0x1E4F1FA48];
  *(void *)(a1 + 16) = *(void *)(v1 + 16);
  return result;
}

CMTime *sub_1DD3C4910@<X0>(CMTime *a1@<X8>)
{
  return CMTimeMakeWithSeconds(a1, 5.0, 600);
}

CMTime *sub_1DD3C491C@<X0>(CMTime *a1@<X8>)
{
  return CMTimeMakeWithSeconds(a1, 1.0, 600);
}

float sub_1DD3C4928()
{
  return 1.0;
}

CMTime *sub_1DD3C4930@<X0>(CMTime *a1@<X0>, CMTime *a2@<X1>, CMTime *a3@<X2>, uint64_t a4@<X8>, Float64 a5@<D0>)
{
  long long v10 = *(_OWORD *)&a1->value;
  uint64_t v11 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)a4 = *MEMORY[0x1E4F1FA48];
  *(void *)(a4 + 16) = *(void *)(v11 + 16);
  *(_OWORD *)&time1.CMTime value = v10;
  time1.CMTimeEpoch epoch = a1->epoch;
  CMTime time2 = *a2;
  __n128 result = (CMTime *)CMTimeCompare(&time1, &time2);
  if ((int)result <= 0)
  {
    *(_OWORD *)a4 = *(_OWORD *)v11;
    CMTimeEpoch v16 = *(void *)(v11 + 16);
  }
  else
  {
    CMTime lhs = *a1;
    CMTime rhs = *a2;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeMultiplyByFloat64(&v28, &time, a5);
    *(_OWORD *)a4 = *(_OWORD *)&v28.value;
    CMTimeEpoch epoch = v28.epoch;
    *(void *)(a4 + 16) = v28.epoch;
    *(_OWORD *)&v24.CMTime value = *(_OWORD *)a4;
    v24.CMTimeEpoch epoch = epoch;
    CMTime v22 = *a3;
    CMTime v20 = *a2;
    long long v14 = *(_OWORD *)&a1->value;
    v18.CMTimeEpoch epoch = a1->epoch;
    *(_OWORD *)&v18.CMTime value = v14;
    long long v15 = *(_OWORD *)&a2->value;
    v17.CMTimeEpoch epoch = a2->epoch;
    *(_OWORD *)&v17.CMTime value = v15;
    CMTimeSubtract(&v19, &v18, &v17);
    CMTimeMinimum(&v21, &v20, &v19);
    CMTimeMinimum(&v23, &v22, &v21);
    __n128 result = CMTimeMinimum(&v28, &v24, &v23);
    *(_OWORD *)a4 = *(_OWORD *)&v28.value;
    CMTimeEpoch v16 = v28.epoch;
  }
  *(void *)(a4 + 16) = v16;
  return result;
}

uint64_t sub_1DD3C4ACC(uint64_t a1, long long *a2, long long *a3, long long *a4, long long *a5)
{
  long long v6 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v6;
  long long v7 = *a5;
  *(void *)(a1 + 88) = *((void *)a5 + 2);
  *(_OWORD *)(a1 + 72) = v7;
  long long v8 = *a3;
  *(void *)(a1 + 40) = *((void *)a3 + 2);
  *(_OWORD *)(a1 + 24) = v8;
  long long v9 = *a4;
  *(void *)(a1 + 64) = *((void *)a4 + 2);
  *(_OWORD *)(a1 + 48) = v9;
  long long v10 = *a4;
  time1.CMTimeEpoch epoch = *((void *)a4 + 2);
  *(_OWORD *)&time1.CMTime value = v10;
  long long v11 = *(_OWORD *)(a1 + 24);
  time2.CMTimeEpoch epoch = *(void *)(a1 + 40);
  *(_OWORD *)&time2.CMTime value = v11;
  if (CMTimeCompare(&time1, &time2) < 0) {
    return 21;
  }
  char v12 = (_OWORD *)(a1 + 24);
  CMTime v22 = *(CMTime *)(a1 + 72);
  CMTime v21 = *(CMTime *)(a1 + 24);
  if (CMTimeCompare(&v22, &v21) > 0) {
    return 21;
  }
  CMTime v20 = *(CMTime *)a1;
  *(_OWORD *)&v19.CMTime value = *v12;
  v19.CMTimeEpoch epoch = *(void *)(a1 + 40);
  if (CMTimeCompare(&v20, &v19) < 0)
  {
    puts("Input duration shorter than minimum period.");
    return 7;
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    *(_OWORD *)&lhs.CMTime value = *v12;
    lhs.CMTimeEpoch epoch = *(void *)(a1 + 40);
    CMTime rhs = *(CMTime *)(a1 + 72);
    CMTimeAdd(&v18, &lhs, &rhs);
    CMTime v15 = v18;
    CMTime v14 = *(CMTime *)a1;
    if (CMTimeCompare(&v15, &v14) <= 0) {
      return 0;
    }
    else {
      return 21;
    }
  }
}

uint64_t alRender(void *a1, double *a2, void *a3)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  long long v6 = a3;
  id v76 = v5;
  if (!v5 || !a2)
  {
    NSLog(&cfstr_InputvideoNilI.isa);
    uint64_t v60 = 5;
    goto LABEL_110;
  }
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v9 = MEMORY[0x1E01B4410]();
  v115[0] = 0;
  v115[1] = v115;
  v115[2] = 0x3032000000;
  v115[3] = sub_1DD3C5978;
  v115[4] = sub_1DD3C5988;
  id v116 = 0;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  char v114 = 0;
  CMSampleBufferRef sbuf = 0;
  CMSampleBufferRef v111 = 0;
  uint64_t v105 = 0;
  CMTime v106 = &v105;
  uint64_t v107 = 0x3032000000;
  long long v108 = sub_1DD3C5978;
  uint64_t v109 = sub_1DD3C5988;
  id v110 = 0;
  CMTime v104 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  CMTime v103 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  uint64_t v10 = *((void *)a2 + 1) - *(void *)a2;
  uint64_t v72 = v6;
  context = (void *)v9;
  if (!v10)
  {
    NSLog(&cfstr_AlrenderEmptyR.isa);
    uint64_t v77 = 0;
    long long v78 = 0;
    unsigned int v62 = 0;
    unsigned int v11 = 5;
    int v61 = 1;
    goto LABEL_106;
  }
  unsigned int v11 = 0;
  uint64_t v77 = 0;
  long long v78 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  id v71 = 0;
  id v67 = 0;
  uint64_t v73 = 0;
  cf = 0;
  uint64_t v12 = 0;
  unint64_t v13 = v10 >> 3;
  CGFloat v15 = a2[6];
  CGFloat v14 = a2[7];
  CGFloat v17 = a2[4];
  CGFloat v16 = a2[5];
  if (v13 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v13;
  }
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v102.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v102.c = v19;
  *(_OWORD *)&v102.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v64 = *MEMORY[0x1E4F1E418];
  uint64_t v65 = *MEMORY[0x1E4F1E480];
  do
  {
    CMTime v20 = (void *)MEMORY[0x1E01B4410]();
    CMTime v21 = *(long long **)(*(void *)a2 + 8 * v12);
    CMTime v22 = (long long *)*((void *)v21 + 6);
    unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v21 + 7) - (void)v22) >> 3);
    if (v23 != 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v21 + 10) - *((void *)v21 + 9)) >> 3)
      || v23 != (uint64_t)(*((void *)v21 + 13) - *((void *)v21 + 12)) >> 2)
    {
      NSLog(&cfstr_AlrenderMalfor.isa);
      goto LABEL_15;
    }
    CMTime v100 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    long long v98 = *v21;
    uint64_t v99 = *((void *)v21 + 2);
    if (v23 == 1)
    {
      LODWORD(v75) = 0;
      BOOL v26 = 0;
      BOOL v27 = 0;
    }
    else
    {
      if (v23 != 2)
      {
        NSLog(&cfstr_AlrenderMalfor_0.isa);
        int v30 = 2;
        unsigned int v11 = 26;
        goto LABEL_16;
      }
      long long v24 = *v22;
      time1.CMTimeEpoch epoch = *((void *)v22 + 2);
      *(_OWORD *)&time1.CMTime value = v24;
      CMTime time2 = *(CMTime *)((unsigned char *)v22 + 1);
      int32_t v25 = CMTimeCompare(&time1, &time2);
      BOOL v26 = v25 > 0;
      BOOL v27 = v25 < 1;
      uint64_t v28 = *((void *)v21 + 6);
      unint64_t v29 = (CMTime *)(v28 + 24 * (v25 < 1));
      CMTime v101 = *v29;
      CMTime v22 = (long long *)(v28 + 24 * (v25 > 0));
      CMTime v100 = *(CMTime *)v22;
      if (!*((unsigned char *)v21 + 120))
      {
        uint64_t v75 = 0x100000000;
        if (v11)
        {
LABEL_21:
          int v30 = 2;
          goto LABEL_16;
        }
        goto LABEL_24;
      }
      CMTime v100 = *v29;
      LODWORD(v75) = 1;
    }
    HIDWORD(v75) = 0;
    BOOL v31 = v27;
    CMTime v101 = *(CMTime *)v22;
    BOOL v27 = v26;
    BOOL v26 = v31;
    if (v11) {
      goto LABEL_21;
    }
LABEL_24:
    if (v78) {
      goto LABEL_27;
    }
    id v32 = [[VideoReader alloc] initWithAsset:v5];
    long long v78 = v32;
    if (v32)
    {
      [(VideoReader *)v32 setPixelFormatOptions:3588];
      [(VideoReader *)v78 preferredTransform];
      CGAffineTransformInvert(&v117, &v95);
      CGAffineTransform v102 = v117;
      CMTime v94 = v101;
      [(VideoReader *)v78 setReadStartT:&v94];
LABEL_27:
      int v33 = HIDWORD(v75);
      if (v77) {
        int v33 = 0;
      }
      if (v33 != 1) {
        goto LABEL_32;
      }
      uint64_t v34 = [[VideoReader alloc] initWithAsset:v5];
      __int16 v35 = v34;
      if (v34)
      {
        [(VideoReader *)v34 setPixelFormatOptions:3588];
        CMTime v93 = v100;
        uint64_t v77 = v35;
        [(VideoReader *)v35 setReadStartT:&v93];
LABEL_32:
        if (cf)
        {
          CMTime v92 = v104;
          CMTime v91 = v101;
          if (!CMTimeCompare(&v92, &v91))
          {
            CMSampleBufferRef sbuf = cf;
            CFRetain(cf);
          }
        }
        uint64_t v36 = sbuf;
        if (!sbuf && v73)
        {
          CMTime v90 = v103;
          CMTime v89 = v101;
          if (!CMTimeCompare(&v90, &v89))
          {
            CMSampleBufferRef sbuf = v73;
            CFRetain(v73);
          }
          uint64_t v36 = sbuf;
        }
        if (v36)
        {
LABEL_41:
          ImageBuffer = CMSampleBufferGetImageBuffer(v36);
          uint64_t v37 = sub_1DD3DFD8C(ImageBuffer, 0);
          int v38 = (void *)v106[5];
          v106[5] = v37;

          if (!v106[5])
          {
            NSLog(&cfstr_AlrenderErrorC.isa);
            goto LABEL_89;
          }
          if (!v75) {
            goto LABEL_53;
          }
          if (cf)
          {
            CMTime v87 = v104;
            CMTime v86 = v100;
            if (!CMTimeCompare(&v87, &v86))
            {
              CMSampleBufferRef v111 = cf;
              CFRetain(cf);
            }
          }
          uint64_t v39 = v111;
          if (!v111 && v73)
          {
            CMTime v85 = v103;
            CMTime v84 = v100;
            if (!CMTimeCompare(&v85, &v84))
            {
              CMSampleBufferRef v111 = v73;
              CFRetain(v73);
            }
            uint64_t v39 = v111;
          }
          if (v39) {
            goto LABEL_52;
          }
          if (v75) {
            id v59 = v78;
          }
          else {
            id v59 = v77;
          }
          CMTime v83 = v100;
          unsigned int v55 = [(VideoReader *)v59 getFrameAtTime:&v83 exactTime:1 frame:&v111];
          if (!v55)
          {
            uint64_t v39 = v111;
LABEL_52:
            uint64_t v40 = CMSampleBufferGetImageBuffer(v39);
            uint64_t v41 = sub_1DD3DFD8C(v40, 0);

            uint64_t v69 = (void *)v41;
            if (v41)
            {
LABEL_53:
              uint64_t v42 = 0;
              uint64_t v43 = *(void *)(*((void *)v21 + 9) + 24 * v27);
              do
              {
                *(_DWORD *)&v118[v42] = *(_DWORD *)(v43 + v42);
                v42 += 4;
              }
              while (v42 != 36);
              long long v44 = sub_1DD3DB2E0((void *)v106[5], (uint64_t)v118, 0, (long long *)&v102, v17, v16, v15, v14, v7, v8);

              if (v44)
              {
                if (!v75)
                {
                  id v57 = v44;

                  id v54 = v57;
LABEL_70:
                  uint64_t v82 = v99;
                  long long v81 = v98;
                  uint64_t v68 = v54;
                  if (v72[2]())
                  {
                    if (cf) {
                      CFRelease(cf);
                    }
                    if (v73) {
                      CFRelease(v73);
                    }
                    CMSampleBufferRef v58 = sbuf;
                    CMTime v104 = v101;
                    CMSampleBufferRef sbuf = 0;
                    uint64_t v73 = v111;
                    cf = v58;
                    if (v111)
                    {
                      if (v75)
                      {
                        unsigned int v11 = 0;
                        int v30 = 0;
                        CMTime v103 = v100;
                        CMSampleBufferRef v111 = 0;
                      }
                      else
                      {
                        CFRelease(v111);
                        uint64_t v73 = 0;
                        unsigned int v11 = 0;
                        int v30 = 0;
                        CMSampleBufferRef v111 = 0;
                        CMTime v103 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
                      }
                    }
                    else
                    {
                      uint64_t v73 = 0;
                      unsigned int v11 = 0;
                      int v30 = 0;
                    }
                  }
                  else
                  {
                    int v30 = 2;
                    unsigned int v11 = 1;
                  }
                  goto LABEL_91;
                }
                uint64_t v45 = 0;
                uint64_t v46 = *(void *)(*((void *)v21 + 9) + 24 * v26);
                do
                {
                  *(_DWORD *)&v118[v45] = *(_DWORD *)(v46 + v45);
                  v45 += 4;
                }
                while (v45 != 36);
                long long v47 = sub_1DD3DB2E0(v69, (uint64_t)v118, 0, (long long *)&v102, v17, v16, v15, v14, v7, v8);

                if (!v47)
                {
                  id v67 = 0;
                  NSLog(&cfstr_AlrenderErrorT_0.isa);
                  int v30 = 2;
                  unsigned int v11 = 10;
LABEL_91:
                  id v71 = v44;
                  goto LABEL_16;
                }
                float v48 = *(float *)(*((void *)v21 + 12) + 4 * v26);
                id v67 = v47;
                id v71 = v44;
                memset(&v117, 0, 24);
                v117.d = v48;
                CFIndex v49 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorMatrix"];
                [v49 setDefaults];
                [v49 setValue:v67 forKey:v65];
                float v50 = [MEMORY[0x1E4F1E080] vectorWithValues:&v117 count:4];
                [v49 setValue:v50 forKey:@"inputAVector"];

                CVImageBufferRef v51 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
                [v51 setDefaults];
                uint64_t v52 = [v49 outputImage];
                [v51 setValue:v52 forKey:v65];

                [v51 setValue:v71 forKey:v64];
                uint64_t v53 = [v51 outputImage];

                if (v53)
                {
                  id v54 = (id)v53;
                  goto LABEL_70;
                }
                uint64_t v68 = 0;
                NSLog(&cfstr_ErrorOnCiimage.isa);
              }
              else
              {
                id v71 = 0;
                NSLog(&cfstr_AlrenderErrorT.isa);
              }
            }
            else
            {
              uint64_t v69 = 0;
              NSLog(&cfstr_AlrenderErrorC.isa);
            }
LABEL_89:
            int v30 = 2;
            unsigned int v11 = 10;
            goto LABEL_16;
          }
        }
        else
        {
          CMTime v88 = v101;
          unsigned int v55 = [(VideoReader *)v78 getFrameAtTime:&v88 exactTime:1 frame:&sbuf];
          if (!v55)
          {
            uint64_t v36 = sbuf;
            goto LABEL_41;
          }
        }
        uint64_t v56 = sub_1DD3DA8AC(v55);
        NSLog(&cfstr_AlrenderErrorR.isa, v56);
        int v30 = 2;
        unsigned int v11 = 9;
        goto LABEL_16;
      }
      uint64_t v77 = 0;
      goto LABEL_15;
    }
    long long v78 = 0;
LABEL_15:
    int v30 = 2;
    unsigned int v11 = 5;
LABEL_16:
    if (v30) {
      break;
    }
    ++v12;
  }
  while (v12 != v18);
  if (sbuf)
  {
    CFRelease(sbuf);
    CMSampleBufferRef sbuf = 0;
  }
  if (v111)
  {
    CFRelease(v111);
    CMSampleBufferRef v111 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v73) {
    CFRelease(v73);
  }
  if (v11)
  {
    int v61 = 1;
    unsigned int v62 = v11;
  }
  else
  {
    uint64_t v80 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v79 = *MEMORY[0x1E4F1FA48];
    int v61 = 0;
    unsigned int v62 = ((uint64_t (*)(uint64_t (**)(void), void, long long *, void))v72[2])(v72, 0, &v79, 0) ^ 1;
  }

LABEL_106:
  _Block_object_dispose(&v105, 8);

  _Block_object_dispose(v113, 8);
  _Block_object_dispose(v115, 8);

  if (v61) {
    uint64_t v60 = v11;
  }
  else {
    uint64_t v60 = v62;
  }
  long long v6 = v72;
LABEL_110:

  return v60;
}

void sub_1DD3C5854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26)
{
  _Block_object_dispose(&STACK[0x388], 8);
  _Block_object_dispose(&STACK[0x3C8], 8);
  _Block_object_dispose(&STACK[0x3E8], 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C5978(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD3C5988(uint64_t a1)
{
}

uint64_t alGetNumerOfFrames(void *a1)
{
  return (uint64_t)(a1[1] - *a1) >> 3;
}

__n128 alGetLoopPeriod@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *(__n128 *)(a1 + 88);
  *a2 = result;
  a2[1].n128_u64[0] = *(void *)(a1 + 104);
  return result;
}

__n128 alGetLoopStart@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = a1[4];
  *a2 = result;
  a2[1].n128_u64[0] = a1[5].n128_u64[0];
  return result;
}

__n128 alGetFadeDuration@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = a1[7];
  *a2 = result;
  a2[1].n128_u64[0] = a1[8].n128_u64[0];
  return result;
}

void sub_1DD3C59DC(uint64_t a1, float32x2_t *a2, float32x2_t *a3, float *a4)
{
  double v7 = *(float32x2_t **)a1;
  uint64_t v8 = *(void *)(a1 + 8) - *(void *)a1;
  if ((unint64_t)v8 < 9)
  {
    float32x2_t v18 = 0;
    _S9 = 0.0;
    float v33 = 0.0;
    float v34 = 0.0;
    _D3 = 0;
  }
  else
  {
    unint64_t v10 = v8 >> 3;
    _CF = v8 >> 3 != 0;
    uint64_t v12 = (v8 >> 3) - 1;
    float v13 = (float)(unint64_t)v12;
    if (v12 != 0 && _CF) {
      uint64_t v14 = v10;
    }
    else {
      uint64_t v14 = 1;
    }
    float32x2_t v15 = 0;
    do
    {
      float32x2_t v16 = *v7++;
      v17.i32[1] = v16.i32[1];
      float32x2_t v15 = vadd_f32(v15, v16);
      --v14;
    }
    while (v14);
    *(float *)v17.i32 = (float)v10;
    float32x2_t v18 = vdiv_f32(v15, (float32x2_t)vdup_lane_s32(v17, 0));
    sub_1DD3C8D54(&__p, v10);
    long long v19 = *(float32x2_t **)a1;
    CMTime v20 = (float32x2_t *)__p;
    uint64_t v21 = *(void *)(a1 + 8) - *(void *)a1;
    if (v21)
    {
      unint64_t v22 = v21 >> 3;
      if (v22 <= 1) {
        unint64_t v22 = 1;
      }
      unint64_t v23 = (float32x2_t *)__p;
      do
      {
        float32x2_t v24 = *v19++;
        *v23++ = vsub_f32(v24, v18);
        --v22;
      }
      while (v22);
    }
    float v25 = 1.0 / v13;
    if (v45 == v20)
    {
      float32x2_t v27 = 0;
      float v28 = 0.0;
    }
    else
    {
      unint64_t v26 = v45 - v20;
      if (v26 <= 1) {
        unint64_t v26 = 1;
      }
      float32x2_t v27 = 0;
      float v28 = 0.0;
      unint64_t v29 = v20;
      do
      {
        float32x2_t v30 = *v29++;
        float32x2_t v31 = v30;
        float v28 = vmlas_n_f32(v28, v31.f32[0], v31.f32[0]);
        float32x2_t v27 = vmla_lane_f32(v27, v31, v31, 1);
        --v26;
      }
      while (v26);
    }
    _S9 = v25 * v28;
    _D3 = vmul_n_f32(v27, v25);
    float v36 = (float)(v25 * v28) + _D3.f32[1];
    __asm { FMLA            S0, S9, V3.S[1] }
    float v41 = -(_S0 - (float)(v36 * v36) * 0.25);
    float v42 = sqrtf(v41);
    if (v20)
    {
      uint64_t v45 = v20;
      float32x2_t v43 = _D3;
      operator delete(v20);
      _D3 = v43;
    }
    float v33 = v42 + (float)(v36 * 0.5);
    float v34 = -(float)(v42 - (float)(v36 * 0.5));
  }
  *a2 = v18;
  a3->f32[0] = _S9;
  a3->i32[1] = _D3.i32[0];
  a3[1] = _D3;
  *a4 = v33;
  a4[1] = v34;
}

uint64_t sub_1DD3C5B78(uint64_t result, float *a2, float *a3, float *a4, float *a5)
{
  id v5 = *(float **)result;
  uint64_t v6 = *(void *)(result + 8) - *(void *)result;
  if (v6)
  {
    unint64_t v7 = v6 >> 2;
    float v8 = *v5;
    if ((unint64_t)v6 <= 4)
    {
      float v17 = (float)v7;
      float v18 = v8 / (float)v7;
      float v20 = 0.0;
      float v14 = *v5;
    }
    else
    {
      uint64_t v9 = 2;
      if (v7 > 2) {
        uint64_t v9 = v7;
      }
      unint64_t v10 = v5 + 1;
      uint64_t v11 = v9 - 1;
      uint64_t v12 = v11;
      float v13 = *v5;
      float v14 = *v5;
      do
      {
        float v15 = *v10++;
        float v16 = v15;
        if (v14 < v15) {
          float v14 = v16;
        }
        if (v16 < v13) {
          float v13 = v16;
        }
        float v8 = v8 + v16;
        --v12;
      }
      while (v12);
      float v17 = (float)v7;
      float v18 = v8 / (float)v7;
      long long v19 = v5 + 1;
      float v20 = 0.0;
      do
      {
        float v21 = *v19++;
        float v20 = v20 + (float)((float)(v18 - v21) * (float)(v18 - v21));
        --v11;
      }
      while (v11);
      float v8 = v13;
    }
    float v22 = sqrtf(v20 / v17);
  }
  else
  {
    float v14 = 0.0;
    float v8 = 0.0;
    float v22 = 0.0;
    float v18 = 0.0;
  }
  *a2 = v18;
  *a4 = v14;
  *a3 = v8;
  *a5 = v22;
  return result;
}

uint64_t *sub_1DD3C5C40(uint64_t *result, float *a2, float *a3, float *a4, float *a5)
{
  uint64_t v5 = *result;
  uint64_t v6 = result[1] - *result;
  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = v6 >> 3;
    float v9 = (float)v8;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    unint64_t v10 = (float *)(v5 + 4);
    float v11 = 0.0;
    float v12 = 0.0;
    float v13 = 0.0;
    do
    {
      float v14 = sqrtf((float)(*v10 * *v10) + (float)(*(v10 - 1) * *(v10 - 1)));
      if (v13 >= v14) {
        float v13 = v14;
      }
      if (!v7) {
        float v13 = v14;
      }
      float v11 = v11 + v14;
      if (v12 < v14) {
        float v12 = v14;
      }
      ++v7;
      v10 += 2;
    }
    while (v8 != v7);
    float v15 = (float *)(v5 + 4);
    float v16 = 0.0;
    float v17 = v11 / v9;
    do
    {
      float v18 = sqrtf((float)(*v15 * *v15) + (float)(*(v15 - 1) * *(v15 - 1)));
      float v16 = v16 + (float)((float)(v17 - v18) * (float)(v17 - v18));
      v15 += 2;
      --v8;
    }
    while (v8);
    float v19 = sqrtf(v16 / v9);
  }
  else
  {
    float v13 = 0.0;
    float v12 = 0.0;
    float v19 = 0.0;
    float v17 = 0.0;
  }
  *a2 = v17;
  *a3 = v13;
  *a4 = v12;
  *a5 = v19;
  return result;
}

void sub_1DD3C5FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C604C(void **a1, unint64_t a2)
{
  float v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_1DD3A9B50();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_1DD3B2EF4(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    float v9 = &v6[4 * v8];
    unint64_t v10 = (char *)*a1;
    float v11 = (char *)a1[1];
    float v12 = v7;
    if (v11 != *a1)
    {
      float v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1DD3C6334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3C64B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C684C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C6C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C70A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3C72A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C7868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C7A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C7EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C8284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C83B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C87D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3C892C(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return sub_1DD3B1900(a1, *(const void **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
}

char *sub_1DD3C8970(char *result, uint64_t a2)
{
  if (result != (char *)a2) {
    return sub_1DD3B5538(result, *(char **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  }
  return result;
}

void *sub_1DD3C89B8(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return sub_1DD3C8BCC(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
}

char *sub_1DD3C89F0(char *result, uint64_t a2)
{
  if (result != (char *)a2) {
    return sub_1DD3C8C48(result, *(char **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  }
  return result;
}

void *sub_1DD3C8A2C(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return sub_1DD3C8BCC(a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
}

char *sub_1DD3C8A64(char *result, uint64_t a2)
{
  if (result != (char *)a2) {
    return sub_1DD3C8C48(result, *(char **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  }
  return result;
}

void *sub_1DD3C8BCC(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_1DD3B5A24(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DD3C8C2C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1DD3C8C48(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  float v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      sub_1DD3A9B50();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    __n128 result = sub_1DD3B5A24(v7, v11);
    int v13 = (char *)v7[1];
    float v12 = (void **)(v7 + 1);
    float v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      float v18 = v9;
      float v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  float v12 = (void **)(result + 8);
  float v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  float v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    __n128 result = (char *)memmove(*(void **)result, __src, v14 - v9);
    float v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    float v18 = v9;
    float v19 = v16;
LABEL_18:
    __n128 result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *float v12 = &v9[v17];
  return result;
}

void *sub_1DD3C8D54(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B5A24(a1, a2);
    float v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1DD3C8DB0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id sub_1DD3C8DCC(double *a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"origin_x";
  double v2 = *a1;
  *(float *)&double v2 = *a1;
  uint64_t v3 = [NSNumber numberWithFloat:v2];
  v13[0] = v3;
  v12[1] = @"origin_y";
  double v4 = a1[1];
  *(float *)&double v4 = v4;
  int64_t v5 = [NSNumber numberWithFloat:v4];
  v13[1] = v5;
  v12[2] = @"width";
  double v6 = a1[2];
  *(float *)&double v6 = v6;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  v13[2] = v7;
  v12[3] = @"height";
  double v8 = a1[3];
  *(float *)&double v8 = v8;
  float v9 = [NSNumber numberWithFloat:v8];
  void v13[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

void sub_1DD3C8F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1DD3C8F54(void *a1)
{
  id v1 = a1;
  double v2 = [v1 objectForKeyedSubscript:@"origin_x"];
  uint64_t v3 = [v1 objectForKeyedSubscript:@"origin_y"];
  double v4 = [v1 objectForKeyedSubscript:@"width"];
  int64_t v5 = [v1 objectForKeyedSubscript:@"height"];
  [v2 doubleValue];
  double v7 = v6;
  [v3 doubleValue];
  [v4 doubleValue];
  [v5 doubleValue];

  return v7;
}

void sub_1DD3C9048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3C9088(CMTime *a1, void *a2, float a3)
{
  double v6 = [MEMORY[0x1E4F1CA60] dictionary];
  CMTime v15 = *a1;
  CFDictionaryRef v7 = CMTimeCopyAsDictionary(&v15, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v6 setObject:v7 forKeyedSubscript:qword_1EAB20C18];

  double v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:9];
  for (uint64_t i = 0; i != 36; i += 4)
  {
    LODWORD(v9) = *(_DWORD *)(*a2 + i);
    unint64_t v11 = [NSNumber numberWithFloat:v9];
    [v8 addObject:v11];
  }
  [v6 setObject:v8 forKeyedSubscript:qword_1EAB20C20];
  *(float *)&double v12 = a3;
  int v13 = [NSNumber numberWithFloat:v12];
  [v6 setObject:v13 forKeyedSubscript:qword_1EAB20C28];

  return v6;
}

void sub_1DD3C91D0(_Unwind_Exception *a1)
{
  double v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1DD3C9214(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F1CA60] dictionary];
  CMTime time = *(CMTime *)a1;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v4 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v2 setObject:v4 forKeyedSubscript:qword_1EAB20C30];

  CMTime v15 = *(CMTime *)(a1 + 24);
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v15, v3);
  [v2 setObject:v5 forKeyedSubscript:qword_1EAB20C38];

  double v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = *(void *)(a1 + 96);
  if (*(void *)(a1 + 104) != v7)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      float v10 = *(float *)(v7 + 4 * v9);
      CMTime v14 = *(CMTime *)(*(void *)(a1 + 48) + v8);
      unint64_t v11 = sub_1DD3C9088(&v14, (void *)(*(void *)(a1 + 72) + v8), v10);
      [v6 addObject:v11];

      ++v9;
      uint64_t v7 = *(void *)(a1 + 96);
      v8 += 24;
    }
    while (v9 < (*(void *)(a1 + 104) - v7) >> 2);
  }
  [v2 setObject:v6 forKeyedSubscript:qword_1EAB20C40];
  if (*(unsigned char *)(a1 + 120))
  {
    double v12 = [NSNumber numberWithBool:1];
    [v2 setObject:v12 forKeyedSubscript:qword_1EAB20C48];
  }

  return v2;
}

void sub_1DD3C93C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3C9408(void *a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  operator new();
}

void sub_1DD3C9AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C9B88(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(void *)(a1 + 104) = v2;
    operator delete(v2);
  }
  CFDictionaryRef v5 = (void **)(a1 + 72);
  sub_1DD3B1844(&v5);
  CFAllocatorRef v3 = *(void **)(a1 + 48);
  if (v3)
  {
    *(void *)(a1 + 56) = v3;
    operator delete(v3);
  }
  return a1;
}

id sub_1DD3C9BE4(uint64_t *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  CFAllocatorRef v3 = sub_1DD3BE68C(*((_DWORD *)a1 + 6));
  [v2 setObject:v3 forKeyedSubscript:qword_1EAB20C68];

  CFDictionaryRef v4 = [NSNumber numberWithInt:*((unsigned int *)a1 + 7)];
  [v2 setObject:v4 forKeyedSubscript:qword_1EAB20C70];

  CFDictionaryRef v5 = sub_1DD3C8DCC((double *)a1 + 4);
  [v2 setObject:v5 forKeyedSubscript:qword_1EAB20C78];

  *(_OWORD *)&v20.CMTime value = *((_OWORD *)a1 + 4);
  v20.CMTimeEpoch epoch = a1[10];
  *(_OWORD *)&v19.CMTime value = *(_OWORD *)(a1 + 11);
  v19.CMTimeEpoch epoch = a1[13];
  *(_OWORD *)&v18.CMTime value = *((_OWORD *)a1 + 7);
  v18.CMTimeEpoch epoch = a1[16];
  double v6 = [MEMORY[0x1E4F1CA60] dictionary];
  CMTime time = v20;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v6 setObject:v8 forKeyedSubscript:qword_1EAB20C50];

  CMTime v22 = v19;
  CFDictionaryRef v9 = CMTimeCopyAsDictionary(&v22, v7);
  [v6 setObject:v9 forKeyedSubscript:qword_1EAB20C58];

  CMTime v21 = v18;
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&v21, v7);
  [v6 setObject:v10 forKeyedSubscript:qword_1EAB20C60];

  [v2 setObject:v6 forKeyedSubscript:qword_1EAB20C88];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v13 = 0;
    do
    {
      CMTime v14 = sub_1DD3C9214(*(void *)(v12 + 8 * v13));
      [v11 addObject:v14];

      ++v13;
      uint64_t v12 = *a1;
    }
    while (v13 < (a1[1] - *a1) >> 3);
  }
  [v2 setObject:v11 forKeyedSubscript:qword_1EAB20C80];
  CMTime v15 = [NSNumber numberWithUnsignedInt:2];
  [v2 setObject:v15 forKeyedSubscript:qword_1EAB20C90];

  float v16 = [NSNumber numberWithUnsignedInt:1];
  [v2 setObject:v16 forKeyedSubscript:qword_1EAB20C98];

  return v2;
}

void sub_1DD3C9E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3C9F08(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(_DWORD *)(a1 + 136) = sub_1DD3CA510(v3, qword_1EAB20C90);
  uint64_t v4 = sub_1DD3CA510(v3, qword_1EAB20C98);
  *(_DWORD *)(a1 + 140) = v4;
  if (v4 < 3)
  {
    double v6 = [v3 objectForKeyedSubscript:qword_1EAB20C68];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        LODWORD(v21.value) = -1;
        *(_DWORD *)(a1 + 24) = sub_1DD3BE6B0(v6, &v21);
        if (!LODWORD(v21.value))
        {
LABEL_10:
          CFAllocatorRef v7 = [v3 objectForKeyedSubscript:qword_1EAB20C70];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v5 = 0;
LABEL_32:

            goto LABEL_33;
          }
          *(_DWORD *)(a1 + 28) = [v7 intValue];
          id v8 = [v3 objectForKeyedSubscript:qword_1EAB20C78];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v5 = 0;
LABEL_31:

            goto LABEL_32;
          }
          *(double *)(a1 + 32) = sub_1DD3C8F54(v8);
          *(void *)(a1 + 40) = v9;
          *(void *)(a1 + 48) = v10;
          *(void *)(a1 + 56) = v11;
          uint64_t v12 = [v3 objectForKeyedSubscript:qword_1EAB20C88];

          id v8 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v5 = 0;
            size_t v17 = v8;
LABEL_30:

            goto LABEL_31;
          }
          CFDictionaryRef v13 = [v8 objectForKeyedSubscript:qword_1EAB20C50];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CMTimeMakeFromDictionary(&v21, v13);
            *(CMTime *)(a1 + 64) = v21;
            CFDictionaryRef v14 = [v8 objectForKeyedSubscript:qword_1EAB20C58];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              CMTimeMakeFromDictionary(&v21, v14);
              *(CMTime *)(a1 + 88) = v21;
              CFDictionaryRef v15 = [v8 objectForKeyedSubscript:qword_1EAB20C60];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CMTimeMakeFromDictionary(&v21, v15);
                *(CMTime *)(a1 + 112) = v21;

                float v16 = *(void **)a1;
                if (*(void *)a1)
                {
                  *(void *)(a1 + 8) = v16;
                  operator delete(v16);
                  *(void *)a1 = 0;
                  *(void *)(a1 + 8) = 0;
                  *(void *)(a1 + 16) = 0;
                }
                *(void *)(a1 + 16) = 0;
                *(void *)a1 = 0;
                *(void *)(a1 + 8) = 0;
                size_t v17 = [v3 objectForKeyedSubscript:qword_1EAB20C80];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v5 = 0;
                  goto LABEL_30;
                }
                memset(v20, 0, sizeof(v20));
                CFDictionaryRef v13 = v17;
                if ([(__CFDictionary *)v13 countByEnumeratingWithState:v20 objects:v22 count:16])
                {
                  CMTime v18 = (void *)**((void **)&v20[0] + 1);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    sub_1DD3C9408(v18);
                  }
                  uint64_t v5 = 0;
                }
                else
                {
                  uint64_t v5 = 1;
                }
                size_t v17 = v13;
                goto LABEL_29;
              }
              uint64_t v5 = 0;
              CFDictionaryRef v13 = v15;
            }
            else
            {
              uint64_t v5 = 0;
              CFDictionaryRef v13 = v14;
            }
          }
          else
          {
            uint64_t v5 = 0;
          }
          size_t v17 = v8;
LABEL_29:

          goto LABEL_30;
        }
      }
    }
    else if (*(_DWORD *)(a1 + 136) <= 1u)
    {
      *(_DWORD *)(a1 + 24) = 0;
      goto LABEL_10;
    }
    uint64_t v5 = 0;
LABEL_33:

    goto LABEL_34;
  }
  NSLog(&cfstr_AllooprecipeIn.isa, *(unsigned int *)(a1 + 136), v4, 2);
  uint64_t v5 = 0;
LABEL_34:

  return v5;
}

void sub_1DD3CA45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CA510(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v3 = [v2 unsignedIntValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1DD3CA578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_1DD3CA58C(uint64_t a1, int a2)
{
  *(_DWORD *)a1 = a2;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)(a1 + 4) = v2;
  *(_OWORD *)(a1 + 20) = v2;
  *(_DWORD *)(a1 + 36) = -1;
  *(void *)(a1 + 40) = @"NONE";
  *(void *)(a1 + 48) = @"NONE";
  *(void *)(a1 + 56) = 0;
  uint64_t v3 = MEMORY[0x1E4F1F9F8];
  __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(a1 + 64) = *MEMORY[0x1E4F1F9F8];
  uint64_t v5 = *(void *)(v3 + 16);
  *(void *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 88) = result;
  *(void *)(a1 + 104) = v5;
  *(void *)(a1 + 112) = 0x7FC00000FFFFFFFELL;
  *(void *)(a1 + 120) = @"NONE";
  return result;
}

id sub_1DD3CA5E4(uint64_t a1)
{
  v36[18] = *MEMORY[0x1E4F143B8];
  v35[0] = @"finalDecision";
  unsigned int v2 = *(_DWORD *)(a1 + 4) + 2;
  if (v2 > 3) {
    uint64_t v3 = @"UnknownGatingResult";
  }
  else {
    uint64_t v3 = off_1E6CC0158[v2];
  }
  v36[0] = v3;
  v35[1] = @"recipeFlavor";
  uint64_t v4 = [NSString stringWithUTF8String:sub_1DD3B16B8(*(_DWORD *)a1)];
  v36[1] = v4;
  v35[2] = @"mShortInputDecision";
  unsigned int v5 = *(_DWORD *)(a1 + 8) + 2;
  if (v5 > 3) {
    double v6 = @"UnknownGatingResult";
  }
  else {
    double v6 = off_1E6CC0158[v5];
  }
  v36[2] = v6;
  v35[3] = @"mPreGateStillMetadataDecision";
  unsigned int v7 = *(_DWORD *)(a1 + 12) + 2;
  if (v7 > 3) {
    id v8 = @"UnknownGatingResult";
  }
  else {
    id v8 = off_1E6CC0158[v7];
  }
  v36[3] = v8;
  v35[4] = @"mPreGateVideoTrimDecision";
  unsigned int v9 = *(_DWORD *)(a1 + 16) + 2;
  if (v9 > 3) {
    uint64_t v10 = @"UnknownGatingResult";
  }
  else {
    uint64_t v10 = off_1E6CC0158[v9];
  }
  v36[4] = v10;
  v35[5] = @"mPreGateVideoMLDecision";
  unsigned int v11 = *(_DWORD *)(a1 + 20) + 2;
  if (v11 > 3) {
    uint64_t v12 = @"UnknownGatingResult";
  }
  else {
    uint64_t v12 = off_1E6CC0158[v11];
  }
  v36[5] = v12;
  v35[6] = @"mPreGateFacesDecision";
  unsigned int v13 = *(_DWORD *)(a1 + 24) + 2;
  if (v13 > 3) {
    CFDictionaryRef v14 = @"UnknownGatingResult";
  }
  else {
    CFDictionaryRef v14 = off_1E6CC0158[v13];
  }
  v36[6] = v14;
  v35[7] = @"stabilizeGateDecision";
  unsigned int v15 = *(_DWORD *)(a1 + 28) + 2;
  if (v15 > 3) {
    float v16 = @"UnknownGatingResult";
  }
  else {
    float v16 = off_1E6CC0158[v15];
  }
  v36[7] = v16;
  v35[8] = @"loopActivityDecision";
  unsigned int v17 = *(_DWORD *)(a1 + 32) + 2;
  if (v17 > 3) {
    CMTime v18 = @"UnknownGatingResult";
  }
  else {
    CMTime v18 = off_1E6CC0158[v17];
  }
  v36[8] = v18;
  v35[9] = @"postGateDecision";
  unsigned int v19 = *(_DWORD *)(a1 + 36) + 2;
  if (v19 > 3) {
    CMTime v20 = @"UnknownGatingResult";
  }
  else {
    CMTime v20 = off_1E6CC0158[v19];
  }
  uint64_t v21 = *(void *)(a1 + 48);
  v36[9] = v20;
  v36[10] = v21;
  v35[10] = @"preGateStillFailureFeature";
  v35[11] = @"preGateVideoTrimFailureReason";
  CMTime v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  v36[11] = v22;
  v35[12] = @"preGateVideoTrimTimeStart";
  CMTime time = *(CMTime *)(a1 + 64);
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v24 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v36[12] = v24;
  v35[13] = @"preGateVideoTrimTimeLength";
  CMTime v33 = *(CMTime *)(a1 + 88);
  CFDictionaryRef v25 = CMTimeCopyAsDictionary(&v33, v23);
  uint64_t v26 = *(void *)(a1 + 40);
  v36[13] = v25;
  v36[14] = v26;
  v35[14] = @"preGateFacesExplanation";
  v35[15] = @"stabilizeResult";
  float32x2_t v27 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 112)];
  v36[15] = v27;
  v35[16] = @"postGateClassifierScore";
  LODWORD(v28) = *(_DWORD *)(a1 + 116);
  unint64_t v29 = [NSNumber numberWithFloat:v28];
  v35[17] = @"postGateDecisionExplanation";
  uint64_t v30 = *(void *)(a1 + 120);
  v36[16] = v29;
  v36[17] = v30;
  float32x2_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:18];

  return v31;
}

void sub_1DD3CA990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CA9E4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 16) + 16) = -1;
  return result;
}

uint64_t sub_1DD3CA9F4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 16) + 20) = -1;
  return result;
}

uint64_t sub_1DD3CAA04(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 16) + 24) = -1;
  return result;
}

uint64_t sub_1DD3CAA14(uint64_t a1, int a2)
{
  uint64_t v2 = 4294967294;
  *(_DWORD *)(*(void *)(a1 + 16) + 12) = -2;
  if (a2)
  {
    if (*(void *)(*(void *)(a1 + 24) + 88)
      && (id v4 = *(id *)(*(void *)(a1 + 24) + 88),
          [v4 featuresDict],
          unsigned int v5 = objc_claimAutoreleasedReturnValue(),
          v4,
          v5))
    {
      if (*(void *)a1)
      {
        double v6 = [*(id *)a1 objectForKeyedSubscript:@"PreGateStill"];
        unsigned int v7 = v6;
        if (v6)
        {
          uint64_t v41 = [v6 objectForKeyedSubscript:@"ALGClassifier"];
          id v8 = [v7 objectForKeyedSubscript:@"ALGFeatureInstructions"];
          unsigned int v9 = v8;
          if (v8)
          {
            uint64_t v10 = [v8 objectForKeyedSubscript:@"ALGFeatInstrFeatureList"];
          }
          else
          {
            uint64_t v10 = 0;
          }
          unsigned int v11 = (void *)v41;
          if (v41 | v10)
          {
            uint64_t v12 = sub_1DD3C19E0((void *)v41);
            unsigned int v11 = (void *)v41;
            if (v12)
            {
              unsigned int v13 = 0;
              __p = 0;
              uint64_t v45 = 0;
              uint64_t v46 = 0;
              uint64_t v40 = v12;
              while (1)
              {
                unsigned int v14 = v13;
                if ([(id)v10 count] <= (unint64_t)v13) {
                  break;
                }
                unsigned int v15 = [(id)v10 objectAtIndexedSubscript:v13];
                float v16 = [v15 objectForKeyedSubscript:@"ALGFeatParams"];

                if (!v16
                  || ([v5 objectForKeyedSubscript:v16],
                      unsigned int v17 = objc_claimAutoreleasedReturnValue(),
                      v17,
                      !v17))
                {
                  NSLog(&cfstr_Evaluatepregat.isa, v16);

                  goto LABEL_38;
                }
                CMTime v18 = [v5 objectForKeyedSubscript:v16];
                [v18 floatValue];
                int v20 = v19;
                uint64_t v21 = v45;
                if (v45 >= v46)
                {
                  CFAllocatorRef v23 = (char *)__p;
                  uint64_t v24 = (v45 - (unsigned char *)__p) >> 2;
                  unint64_t v25 = v24 + 1;
                  if ((unint64_t)(v24 + 1) >> 62) {
                    sub_1DD3A9B50();
                  }
                  uint64_t v26 = v46 - (unsigned char *)__p;
                  if ((v46 - (unsigned char *)__p) >> 1 > v25) {
                    unint64_t v25 = v26 >> 1;
                  }
                  if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v27 = v25;
                  }
                  if (v27)
                  {
                    double v28 = (char *)sub_1DD3B2EF4((uint64_t)&v46, v27);
                    CFAllocatorRef v23 = (char *)__p;
                    uint64_t v21 = v45;
                  }
                  else
                  {
                    double v28 = 0;
                  }
                  unint64_t v29 = &v28[4 * v24];
                  *(_DWORD *)unint64_t v29 = v20;
                  CMTime v22 = v29 + 4;
                  while (v21 != v23)
                  {
                    int v30 = *((_DWORD *)v21 - 1);
                    v21 -= 4;
                    *((_DWORD *)v29 - 1) = v30;
                    v29 -= 4;
                  }
                  __p = v29;
                  uint64_t v45 = v22;
                  uint64_t v46 = &v28[4 * v27];
                  if (v23) {
                    operator delete(v23);
                  }
                }
                else
                {
                  *(_DWORD *)uint64_t v45 = v19;
                  CMTime v22 = v21 + 4;
                }
                uint64_t v45 = v22;

                unsigned int v13 = v14 + 1;
              }
              int v42 = -1082130432;
              int v43 = -1;
              BOOL v31 = sub_1DD3C2104(v40, (uint64_t *)&__p, &v43, (float *)&v42);
              uint64_t v32 = *(void *)(a1 + 16);
              *(_DWORD *)(v32 + 12) = !v31;
              if (v31)
              {
                CMTime v33 = *(void **)(v32 + 48);
                *(void *)(v32 + 48) = @"Unknown";

                unsigned int v34 = (*(uint64_t (**)(uint64_t))(*(void *)v40 + 24))(v40);
                if ((v34 & 0x80000000) == 0 && [(id)v10 count] > (unint64_t)v34)
                {
                  __int16 v35 = objc_msgSend((id)v10, "objectAtIndexedSubscript:");
                  uint64_t v36 = [v35 objectForKeyedSubscript:@"ALGFeatParams"];
                  uint64_t v37 = *(void *)(a1 + 16);
                  int v38 = *(void **)(v37 + 48);
                  *(void *)(v37 + 48) = v36;
                }
              }
LABEL_38:
              (*(void (**)(uint64_t))(*(void *)v40 + 8))(v40);
              if (__p)
              {
                uint64_t v45 = (char *)__p;
                operator delete(__p);
              }
              unsigned int v11 = (void *)v41;
            }
          }
        }
      }
    }
    else
    {
      NSLog(&cfstr_Algatingevalua.isa);
      unsigned int v5 = 0;
    }
    uint64_t v2 = *(unsigned int *)(*(void *)(a1 + 16) + 12);
  }
  return v2;
}

void sub_1DD3CADD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CAE78(uint64_t a1, CMTime *a2, _OWORD *a3, long long *a4, CMTime *a5, CMTime *a6, int a7)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 4294967294;
  *(_DWORD *)(*(void *)(a1 + 16) + 16) = -2;
  if (a7)
  {
    id v14 = *(id *)(*(void *)(a1 + 24) + 88);
    if (!v14)
    {
LABEL_23:
      uint64_t v7 = *(unsigned int *)(*(void *)(a1 + 16) + 16);

      return v7;
    }
    unsigned int v15 = objc_alloc_init(PregateAnalyzer);
    [(PregateAnalyzer *)v15 setFeatureBuilder:v14];
    CMTime start = *a5;
    CMTime duration = *a6;
    CMTimeRangeMake(&v49, &start, &duration);
    [(PregateAnalyzer *)v15 setInputTrimTime:&v49];
    if (*(void *)a1)
    {
      float v16 = [*(id *)a1 objectForKeyedSubscript:@"PreGateVideoES"];
      if (v16) {
        [(PregateAnalyzer *)v15 setPregateParameters:v16];
      }
    }
    if ((~*((_DWORD *)a4 + 3) & 0x11) == 0)
    {
      CMTimeValue value = *MEMORY[0x1E4F1F9F0];
      CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F0] + 12);
      CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F0] + 8);
      CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
      uint64_t v32 = [v14 featuresDict];
      CMTime v18 = [v32 objectForKeyedSubscript:@"vidTrackStillFrameTime"];
      BOOL v19 = v18 == 0;

      if (!v19)
      {
        CFDictionaryRef v20 = [v32 objectForKeyedSubscript:@"vidTrackStillFrameTime"];
        CMTimeMakeFromDictionary(v35, v20);
        CMTimeValue value = v35[0].value;
        CMTimeFlags flags = v35[0].flags;
        CMTimeScale timescale = v35[0].timescale;
        CMTimeEpoch epoch = v35[0].epoch;
      }
      if ((~flags & 0x11) != 0)
      {
        if ((~a5->flags & 0x11) == 0
          || (CMTime time1 = *a5,
              time2.CMTimeValue value = value,
              time2.CMTimeScale timescale = timescale,
              time2.CMTimeFlags flags = flags,
              time2.CMTimeEpoch epoch = epoch,
              CMTimeCompare(&time1, &time2) <= 0))
        {
          if ((~a6->flags & 0x11) == 0
            || (CMTime lhs = *a5,
                CMTime rhs = *a6,
                CMTimeAdd(&v44, &lhs, &rhs),
                v41.CMTimeValue value = value,
                v41.CMTimeScale timescale = timescale,
                v41.CMTimeFlags flags = flags,
                v41.CMTimeEpoch epoch = epoch,
                (CMTimeCompare(&v44, &v41) & 0x80000000) == 0))
          {
            *(void *)a4 = value;
            *((_DWORD *)a4 + 2) = timescale;
            *((_DWORD *)a4 + 3) = flags;
            *((void *)a4 + 2) = epoch;
          }
        }
      }
    }
    LODWORD(value) = 0;
    long long v39 = *a4;
    uint64_t v40 = *((void *)a4 + 2);
    -[PregateAnalyzer setRequiredFrameTime:](v15, "setRequiredFrameTime:", &v39, epoch);
    long long v21 = a3[1];
    v38[0] = *a3;
    v38[1] = v21;
    v38[2] = a3[2];
    [(PregateAnalyzer *)v15 setRequiredTimeRange:v38];
    long long v36 = *(_OWORD *)&a2->value;
    CMTimeEpoch v37 = a2->epoch;
    [(PregateAnalyzer *)v15 setMinimumRequiredTrimLength:&v36];
    if ([(PregateAnalyzer *)v15 processPregateSuccess:&value])
    {
      uint64_t v22 = *(void *)(a1 + 16);
      int v23 = -2;
    }
    else
    {
      int v24 = value;
      uint64_t v25 = *(void *)(a1 + 16);
      *(void *)(v25 + 56) = value;
      if (v24)
      {
        *(_DWORD *)(v25 + 16) = 0;
        goto LABEL_22;
      }
      memset(v35, 0, sizeof(v35));
      if (v15)
      {
        [(PregateAnalyzer *)v15 outputTrimTime];
        if ((v35[0].flags & 1) != 0
          && ((v35[1].flags | v35[0].flags) & 0x10) == 0
          && (v35[1].flags & 1) != 0
          && !v35[1].epoch
          && (v35[1].value & 0x8000000000000000) == 0)
        {
          CMTime v34 = v35[1];
          CMTime v33 = *a2;
          if ((CMTimeCompare(&v34, &v33) & 0x80000000) == 0)
          {
            *a5 = v35[0];
            *a6 = v35[1];
            uint64_t v27 = *(void *)(a1 + 16);
            long long v28 = *(_OWORD *)&a5->value;
            *(void *)(v27 + 80) = a5->epoch;
            *(_OWORD *)(v27 + 64) = v28;
            uint64_t v29 = *(void *)(a1 + 16);
            long long v30 = *(_OWORD *)&a6->value;
            *(void *)(v29 + 104) = a6->epoch;
            *(_OWORD *)(v29 + 88) = v30;
          }
        }
      }
      uint64_t v22 = *(void *)(a1 + 16);
      int v23 = 1;
    }
    *(_DWORD *)(v22 + 16) = v23;
LABEL_22:

    goto LABEL_23;
  }
  return v7;
}

void sub_1DD3CB294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CB2FC(void *a1, int a2)
{
  uint64_t v2 = 4294967294;
  *(_DWORD *)(a1[2] + 20) = -2;
  if (a2)
  {
    id v4 = *(id *)(a1[3] + 88);
    unsigned int v5 = v4;
    if (v4 && ([v4 featuresDict], (double v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v7 = (void *)a1[1];
      if (v7)
      {
        id v8 = [v7 objectForKeyedSubscript:@"PreGateVideoML"];
        unsigned int v9 = v8;
        if (v8)
        {
          uint64_t v36 = [v8 objectForKeyedSubscript:@"ALGClassifier"];
          uint64_t v10 = [v9 objectForKeyedSubscript:@"ALGFeatureInstructions"];
          __int16 v35 = v10;
          if (v10)
          {
            uint64_t v11 = [v10 objectForKeyedSubscript:@"ALGFeatInstrFeatureList"];
          }
          else
          {
            uint64_t v11 = 0;
          }
          uint64_t v12 = (void *)v36;
          if (v36 | v11)
          {
            uint64_t v13 = sub_1DD3C19E0((void *)v36);
            uint64_t v12 = (void *)v36;
            if (v13)
            {
              unsigned int v14 = 0;
              __p = 0;
              uint64_t v40 = 0;
              CMTime v41 = 0;
              uint64_t v34 = v13;
              while (1)
              {
                unsigned int v15 = v14;
                if ([(id)v11 count] <= (unint64_t)v14) {
                  break;
                }
                float v16 = [(id)v11 objectAtIndexedSubscript:v14];
                unsigned int v17 = [v16 objectForKeyedSubscript:@"ALGFeatParams"];

                if (!v17
                  || ([v6 objectForKeyedSubscript:v17],
                      CMTime v18 = objc_claimAutoreleasedReturnValue(),
                      v18,
                      !v18))
                {
                  NSLog(&cfstr_Evaluatestilla.isa, v17);

                  goto LABEL_36;
                }
                BOOL v19 = [v6 objectForKeyedSubscript:v17];
                [v19 floatValue];
                int v21 = v20;
                uint64_t v22 = v40;
                if (v40 >= v41)
                {
                  int v24 = (char *)__p;
                  uint64_t v25 = (v40 - (unsigned char *)__p) >> 2;
                  unint64_t v26 = v25 + 1;
                  if ((unint64_t)(v25 + 1) >> 62) {
                    sub_1DD3A9B50();
                  }
                  uint64_t v27 = v41 - (unsigned char *)__p;
                  if ((v41 - (unsigned char *)__p) >> 1 > v26) {
                    unint64_t v26 = v27 >> 1;
                  }
                  if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v28 = v26;
                  }
                  if (v28)
                  {
                    uint64_t v29 = (char *)sub_1DD3B2EF4((uint64_t)&v41, v28);
                    int v24 = (char *)__p;
                    uint64_t v22 = v40;
                  }
                  else
                  {
                    uint64_t v29 = 0;
                  }
                  long long v30 = &v29[4 * v25];
                  *(_DWORD *)long long v30 = v21;
                  int v23 = v30 + 4;
                  while (v22 != v24)
                  {
                    int v31 = *((_DWORD *)v22 - 1);
                    v22 -= 4;
                    *((_DWORD *)v30 - 1) = v31;
                    v30 -= 4;
                  }
                  __p = v30;
                  uint64_t v40 = v23;
                  CMTime v41 = &v29[4 * v28];
                  if (v24) {
                    operator delete(v24);
                  }
                }
                else
                {
                  *(_DWORD *)uint64_t v40 = v20;
                  int v23 = v22 + 4;
                }
                uint64_t v40 = v23;

                unsigned int v14 = v15 + 1;
              }
              int v37 = -1082130432;
              int v38 = -1;
              BOOL v32 = sub_1DD3C2104(v34, (uint64_t *)&__p, &v38, (float *)&v37);
              if (!v38) {
                *(_DWORD *)(a1[2] + 20) = !v32;
              }
LABEL_36:
              (*(void (**)(uint64_t))(*(void *)v34 + 8))(v34);
              if (__p)
              {
                uint64_t v40 = (char *)__p;
                operator delete(__p);
              }
              uint64_t v12 = (void *)v36;
            }
          }
        }
      }
    }
    else
    {
      puts("evaluateStillAndVideoMetadataML: metadata dictionary not available.");
      double v6 = 0;
    }
    uint64_t v2 = *(unsigned int *)(a1[2] + 20);
  }
  return v2;
}

void sub_1DD3CB634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CB6D8(void *a1, int a2)
{
  uint64_t v4 = a1[2];
  *(_DWORD *)(v4 + 24) = -2;
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = @"PreGateFaces: missing metadata or parameters.";

  if (a2)
  {
    double v6 = (void *)a1[1];
    if (v6)
    {
      uint64_t v7 = [v6 objectForKeyedSubscript:@"PreGateFaces"];
      id v8 = v7;
      if (v7)
      {
        unsigned int v9 = [v7 objectForKeyedSubscript:@"maxFaceSize"];
        uint64_t v10 = v9;
        if (v9)
        {
          [v9 floatValue];
          float v12 = v11;
          id v13 = *(id *)(a1[3] + 88);
          unsigned int v14 = v13;
          if (v13)
          {
            unsigned int v15 = [v13 featuresDict];
            float v16 = v15;
            if (v15)
            {
              unsigned int v17 = [v15 objectForKeyedSubscript:@"PREGATE_VIDEO_FACE_MAX_SIZE"];
              CMTime v18 = v17;
              if (v17)
              {
                [v17 floatValue];
                uint64_t v20 = a1[2];
                if (v19 <= v12)
                {
                  *(_DWORD *)(v20 + 24) = 1;
                  objc_msgSend(NSString, "stringWithFormat:", @"PreGateFaces: maxRelFaceSize %f <= %f (threshold).\n", v19, v12);
                }
                else
                {
                  *(_DWORD *)(v20 + 24) = 0;
                  objc_msgSend(NSString, "stringWithFormat:", @"PreGateFaces: maxRelFaceSize %f > %f (threshold).\n", v19, v12);
                uint64_t v21 = };
                uint64_t v22 = a1[2];
                int v23 = *(void **)(v22 + 40);
                *(void *)(v22 + 40) = v21;
              }
            }
          }
        }
      }
    }
  }
  return *(unsigned int *)(a1[2] + 24);
}

void sub_1DD3CB874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3CB8AC(void *result, uint64_t a2, uint64_t a3)
{
  *__n128 result = 0;
  result[1] = 0;
  result[2] = a2;
  result[3] = a3;
  result[4] = 0;
  result[5] = 0;
  return result;
}

uint64_t sub_1DD3CB8BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    *(void *)(a1 + 40) = 0;
  }

  return a1;
}

void sub_1DD3CB954(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  objc_storeStrong((id *)a1, a2);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;

  sub_1DD3CB9EC(a1);
  sub_1DD3CBAA0(a1);
}

void sub_1DD3CB9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CB9EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = [v2 objectForKeyedSubscript:@"PostGate"];
    if (v3)
    {
      id v6 = v3;
      uint64_t v4 = [v3 objectForKeyedSubscript:@"ALGClassifier"];
      unsigned int v5 = v4;
      if (v4) {
        *(void *)(a1 + 32) = sub_1DD3C19E0(v4);
      }

      uint64_t v3 = v6;
    }
  }
}

void sub_1DD3CBA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CBAA0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = [v2 objectForKeyedSubscript:@"ActivityDetector"];
    if (v3)
    {
      id v6 = v3;
      uint64_t v4 = [v3 objectForKeyedSubscript:@"ALGClassifier"];
      unsigned int v5 = v4;
      if (v4) {
        *(void *)(a1 + 40) = sub_1DD3C19E0(v4);
      }
      [v6 objectForKeyedSubscript:@"ALGFeatureInstructions"];
      if (objc_claimAutoreleasedReturnValue()) {
        operator new();
      }

      uint64_t v3 = v6;
    }
  }
}

void sub_1DD3CBB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  MEMORY[0x1E01B4150](v12, 0x80C40803F642BLL);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CBBE4(uint64_t a1, CMTime *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = 4294967294;
  *(_DWORD *)(v3 + 8) = -2;
  if (*(void *)(a1 + 8))
  {
    id v6 = [*(id *)(a1 + 8) objectForKeyedSubscript:@"ShortInputGate"];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = [v6 objectForKeyedSubscript:@"desiredMinimumDuration"];
      unsigned int v9 = v8;
      if (v8)
      {
        memset(&v13, 0, sizeof(v13));
        [v8 floatValue];
        CMTimeMakeWithSeconds(&v13, v10, 600);
        CMTime time1 = *a2;
        CMTime v11 = v13;
        *(_DWORD *)(*(void *)(a1 + 16) + 8) = CMTimeCompare(&time1, &v11) >= 0;
      }
    }
    return *(unsigned int *)(*(void *)(a1 + 16) + 8);
  }
  return result;
}

void sub_1DD3CBCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CBCEC(uint64_t a1)
{
  uint64_t result = 4294967294;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  *(_DWORD *)(v4 + 28) = -2;
  *(_DWORD *)(v4 + 112) = -2;
  if (v3)
  {
    int v5 = sub_1DD3B5B84(v3);
    uint64_t v6 = *(void *)(a1 + 16);
    *(_DWORD *)(v6 + 112) = v5;
    uint64_t result = v5 == 1;
    *(_DWORD *)(v6 + 28) = result;
  }
  return result;
}

uint64_t sub_1DD3CBD3C(uint64_t a1)
{
  if (!*(void *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PostGate"];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 objectForKeyedSubscript:@"ALGClassifier"];
    if (v5)
    {
      [v4 objectForKeyedSubscript:@"ALGFeatureInstructions"];
      if (objc_claimAutoreleasedReturnValue()) {
        operator new();
      }
      uint64_t v6 = [v4 objectForKeyedSubscript:@"ExperimentId"];
      if (v6) {
        objc_storeStrong((id *)(*(void *)(a1 + 24) + 8), v6);
      }
    }
  }

  return 0;
}

void sub_1DD3CBE48(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v4, 0x80C40803F642BLL);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CBE94(void *a1)
{
  uint64_t v2 = a1[3];
  *(_DWORD *)(a1[2] + 32) = -2;
  if (v2)
  {
    uint64_t v3 = a1[5];
    if (v3)
    {
      uint64_t v4 = *(uint64_t **)(v2 + 40);
      if (!v4)
      {
        if ((*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3)) {
          return *(unsigned int *)(a1[2] + 32);
        }
        uint64_t v3 = a1[5];
      }
      uint64_t v7 = 0;
      BOOL v5 = sub_1DD3C2104(v3, v4, (_DWORD *)&v7 + 1, (float *)&v7);
      if (!HIDWORD(v7)) {
        *(_DWORD *)(a1[2] + 32) = v5;
      }
    }
  }
  return *(unsigned int *)(a1[2] + 32);
}

uint64_t sub_1DD3CBF34(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  *(_DWORD *)(v2 + 36) = -2;
  int v4 = *(_DWORD *)(v3 + 208);
  if (v4 != 1)
  {
    if (!v4)
    {
      BOOL v5 = *(void **)(v2 + 120);
      *(void *)(v2 + 120) = @"UnoptimizedLoop";

      uint64_t result = 0;
      *(_DWORD *)(a1[2] + 36) = 0;
      return result;
    }
    float v10 = "ALGatingEvaluator::evaluatePostGate error: missing or corrupted gating feature isOptimizedLoop.";
    goto LABEL_12;
  }
  uint64_t v7 = a1[4];
  if (!v7)
  {
    float v10 = "ALGatingEvaluator::evaluatePostGate: cannot evaluate without post-gate classifier.";
LABEL_12:
    puts(v10);
    return *(unsigned int *)(a1[2] + 36);
  }
  id v8 = *(uint64_t **)(v3 + 24);
  if (v8)
  {
LABEL_8:
    int v17 = 0;
    BOOL v9 = sub_1DD3C2104(v7, v8, &v17, (float *)(v2 + 116));
    if (!v17)
    {
      uint64_t v11 = a1[2];
      *(_DWORD *)(v11 + 36) = !v9;
      uint64_t v12 = NSString;
      CMTime v13 = sub_1DD3C2174(a1[4], v9, *(float *)(v11 + 116));
      uint64_t v14 = [v12 stringWithFormat:@"PostGate %@", v13];
      uint64_t v15 = a1[2];
      float v16 = *(void **)(v15 + 120);
      *(void *)(v15 + 120) = v14;

      return *(unsigned int *)(a1[2] + 36);
    }
    float v10 = "ALGatingEvaluator::evaluatePostGate: classifier error.";
    goto LABEL_12;
  }
  if (((*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7) & 1) == 0)
  {
    uint64_t v7 = a1[4];
    uint64_t v2 = a1[2];
    goto LABEL_8;
  }
  return *(unsigned int *)(a1[2] + 36);
}

void sub_1DD3CC088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CC098(int **a1)
{
  id v1 = *a1;
  uint64_t v2 = (char *)a1[1] - (char *)*a1;
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 0;
  unint64_t v4 = v2 >> 2;
  if (v4 <= 1) {
    unint64_t v4 = 1;
  }
  BOOL v5 = *a1;
  unint64_t v6 = v4;
  do
  {
    int v7 = *v5++;
    v3 |= v7 == -2;
    --v6;
  }
  while (v6);
  int v8 = v3 & 1;
  if (v8) {
    uint64_t result = 4294967294;
  }
  else {
    uint64_t result = 0xFFFFFFFFLL;
  }
  if (!v8)
  {
    char v10 = 1;
    uint64_t v11 = v1;
    unint64_t v12 = v4;
    do
    {
      int v13 = *v11++;
      v10 &= v13 == -1;
      --v12;
    }
    while (v12);
    if (v10) {
      return 0xFFFFFFFFLL;
    }
    LOBYTE(result) = 1;
    do
    {
      int v14 = *v1++;
      uint64_t result = (v14 == 1) & result;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_1DD3CC134(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  *(_DWORD *)(v1 + 4) = -2;
  int32x4_t v6 = *(int32x4_t *)(v1 + 24);
  int32x4_t v7 = *(int32x4_t *)(v1 + 8);
  uint64_t v2 = (int32x4_t *)operator new(0x20uLL);
  v8[1] = v2[2].i32;
  v8[2] = v2[2].i32;
  int32x4_t v3 = vrev64q_s32(v6);
  v3.i64[0] = v6.i64[0];
  int32x4_t *v2 = v7;
  v2[1] = v3;
  v8[0] = (int *)v2;
  uint64_t v4 = sub_1DD3CC098(v8);
  *(_DWORD *)(v1 + 4) = v4;
  operator delete(v2);
  return v4;
}

float sub_1DD3CC1C0(float *a1, void *a2, _DWORD *a3)
{
  id v5 = a2;
  *a3 = 0;
  if ([v5 isEqualToString:@"ALGFP_Stat_Min"])
  {
    float v6 = a1[1];
  }
  else if ([v5 isEqualToString:@"ALGFP_Stat_Max"])
  {
    float v6 = a1[2];
  }
  else if ([v5 isEqualToString:@"ALGFP_Stat_Mean"])
  {
    float v6 = a1[3];
  }
  else if ([v5 isEqualToString:@"ALGFP_Stat_StDev"])
  {
    float v6 = a1[4];
  }
  else
  {
    printf("getStatById: unknown statistic id %s.\n", (const char *)[v5 UTF8String]);
    *a3 = -1;
    float v6 = 0.0;
  }

  return v6;
}

void sub_1DD3CC2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CC2B4(uint64_t a1, uint64_t a2)
{
  int32x4_t v3 = *(float **)a1;
  uint64_t v4 = *(void *)(a1 + 8) - *(void *)a1;
  if (v4)
  {
    unint64_t v5 = v4 >> 2;
    float v6 = *v3;
    if (v5 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
    float v8 = 0.0;
    float v9 = *v3;
    float v10 = 0.0;
    do
    {
      float v11 = *v3++;
      float v12 = v11;
      if (v11 < v6) {
        float v6 = v12;
      }
      if (v12 > v9) {
        float v9 = v12;
      }
      float v10 = v10 + v12;
      float v8 = v8 + (float)(v12 * v12);
      --v7;
    }
    while (v7);
    uint64_t result = 0;
    float v14 = v10 / (float)v5;
    *(unsigned char *)a2 = 1;
    *(float *)(a2 + 4) = v6;
    *(float *)(a2 + 8) = v9;
    *(float *)(a2 + 12) = v14;
    *(float *)(a2 + 16) = sqrtf((float)(v8 / (float)v5) - (float)(v14 * v14));
  }
  else
  {
    puts("Can't compute stats for size-zero vector.");
    *(unsigned char *)a2 = 0;
    return 0xFFFFFFFFLL;
  }
  return result;
}

void sub_1DD3CC360(void *a1, uint64_t a2, uint64_t *a3)
{
  qos_class_t v5 = qos_class_self();
  dispatch_get_global_queue(v5, 0);
  objc_claimAutoreleasedReturnValue();
  unsigned int v6 = (*(uint64_t (**)(void))(*(void *)*a1 + 24))();
  sub_1DD3C2CD0(a3, v6);
  unint64_t v7 = *(unsigned int *)(a1[1] + 68);
  int v12 = 1065353216;
  sub_1DD3B2E2C(&v13, v7, &v12);
  if (*(_DWORD *)(a1[1] + 64) == 875704438 && v14 != v13)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    do
    {
      float v10 = sub_1DD3D4104(v9);
      float v11 = v13;
      *((float *)v13 + v8) = v10;
      uint64_t v8 = ++v9;
    }
    while (v9 < (unint64_t)((v14 - v11) >> 2));
  }
  sub_1DD3D25A4();
}

void sub_1DD3CC588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CC5BC(uint64_t a1, unint64_t a2)
{
  int32x4_t v3 = *(void **)(a1 + 32);
  if (a2 < (uint64_t)(v3[1] - *v3) >> 2)
  {
    (*(void (**)(void, void))(***(void ***)(a1 + 40) + 16))(**(void **)(a1 + 40), *(unsigned int *)(*v3 + 4 * a2));
    sub_1DD3D2750();
  }
  sub_1DD3B37AC();
}

void *sub_1DD3CC8CC(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  uint64_t v2 = (void *)(a1 + 64);
  v2[2] = 0;
  return sub_1DD3B2F2C(v2, *(const void **)(a2 + 64), *(void *)(a2 + 72), (uint64_t)(*(void *)(a2 + 72) - *(void *)(a2 + 64)) >> 2);
}

void sub_1DD3CC8E8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }
}

void sub_1DD3CD24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CD388(void *a1, void *a2, CMTime *a3, CMTime *a4, int a5)
{
  id v9 = a1;
  id v10 = a2;
  int32_t timescale = a4->timescale;
  if (a5 == 1) {
    float v12 = 1.0;
  }
  else {
    float v12 = 0.0;
  }
  CMTime v36 = *a3;
  CMTime lhs = *a4;
  CMTime rhs = v36;
  CMTimeSubtract(&time, &lhs, &rhs);
  double Seconds = CMTimeGetSeconds(&time);
  float v14 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:v9];
  long long v31 = *MEMORY[0x1E4F1FA48];
  uint64_t v32 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  objc_msgSend(v14, "setVolume:atTime:", &v31, COERCE_DOUBLE(__PAIR64__(DWORD1(v31), LODWORD(v12))));
  float v15 = Seconds;
  int v16 = -20;
  do
  {
    float v17 = (float)(v16 + 21) / 20.0;
    if (v16 == -1)
    {
      *(_OWORD *)&v30.CMTimeValue value = *(_OWORD *)&a4->value;
      CMTimeEpoch epoch = a4->epoch;
    }
    else
    {
      memset(&v26, 0, 24);
      CMTimeMakeWithSeconds(&v26.start, (float)(v17 * v15), timescale);
      CMTime v28 = v26.start;
      CMTime v27 = *a3;
      CMTimeAdd(&v29, &v28, &v27);
      *(_OWORD *)&v30.CMTimeValue value = *(_OWORD *)&v29.value;
      CMTimeEpoch epoch = v29.epoch;
    }
    v30.CMTimeEpoch epoch = epoch;
    memset(&v26, 0, sizeof(v26));
    CMTime start = v36;
    *(_OWORD *)&end.CMTimeValue value = *(_OWORD *)&v30.value;
    end.CMTimeEpoch epoch = epoch;
    CMTimeRangeFromTimeToTime(&v26, &start, &end);
    float v19 = v17 * 1.5708;
    if (a5)
    {
      float v20 = 0.0;
      if (a5 != 1) {
        goto LABEL_13;
      }
      float v21 = cosf(v19);
    }
    else
    {
      float v21 = sinf(v19);
    }
    float v20 = v21;
LABEL_13:
    CMTimeRange v23 = v26;
    objc_msgSend(v14, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v23, COERCE_DOUBLE(__PAIR64__(v26.duration.flags, LODWORD(v12))), COERCE_DOUBLE(__PAIR64__(HIDWORD(v26.start.epoch), LODWORD(v20))));
    CMTime v36 = v30;
    float v12 = v20;
  }
  while (!__CFADD__(v16++, 1));
  [v10 addObject:v14];
}

void sub_1DD3CD5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CD808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CDA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CDF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3CE13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CE24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CE284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CE2B4(uint64_t *a1, unsigned int a2, uint64_t a3, int a4, int a5, int a6)
{
  sub_1DD3CE378((uint64_t)a1, a4, a5);
  if (a4 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *a1;
    do
    {
      if (a5 < 1)
      {
        int v15 = 0;
      }
      else
      {
        uint64_t v14 = 0;
        int v15 = 0;
        do
        {
          if (*(unsigned __int8 *)(a3 + v14) >= a2)
          {
            ++v15;
            ++*(_DWORD *)(a1[3] + 4 * v14);
          }
          ++v14;
        }
        while (a5 != v14);
      }
      *(_DWORD *)(v13 + 4 * v12++) = v15;
      a3 += a6;
    }
    while (v12 != a4);
  }
}

void sub_1DD3CE378(uint64_t a1, int a2, int a3)
{
  sub_1DD3CE3D4(a1, a2);
  sub_1DD3CE3D4(a1 + 24, a3);
  bzero(*(void **)a1, *(void *)(a1 + 8) - *(void *)a1);
  qos_class_t v5 = *(void **)(a1 + 24);
  size_t v6 = *(void *)(a1 + 32) - (void)v5;

  bzero(v5, v6);
}

void sub_1DD3CE3D4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    sub_1DD3CE4F8((char **)a1, a2 - v2);
  }
}

uint64_t sub_1DD3CE404(uint64_t a1, void *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = v4 - *a2;
  if (v4 == *a2)
  {
    uint64_t result = 0;
    int v7 = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_19;
  }
  uint64_t v6 = 0;
  int v7 = 0;
  LODWORD(result) = 0;
  int v9 = 0;
  unint64_t v10 = v5 >> 2;
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  do
  {
    unsigned int v11 = *(_DWORD *)(*a2 + 4 * v6);
    int v12 = v6 - v9;
    if (v9 >= (int)result) {
      unsigned int v13 = v9 + 1;
    }
    else {
      unsigned int v13 = result;
    }
    if (v9 < (int)result) {
      int v12 = v7;
    }
    if (v11 >= a3) {
      ++v9;
    }
    else {
      int v9 = 0;
    }
    if (v11 >= a3) {
      uint64_t result = v13;
    }
    else {
      uint64_t result = result;
    }
    if (v11 >= a3) {
      int v7 = v12;
    }
    ++v6;
  }
  while (v10 != v6);
  if (a4) {
LABEL_19:
  }
    *a4 = v7;
  return result;
}

BOOL sub_1DD3CE478(void *a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v7 = sub_1DD3CE404((uint64_t)a1, a1, a2, a4);
  if (a5) {
    *a5 = v7;
  }
  return v7 >= a3;
}

BOOL sub_1DD3CE4B8(uint64_t a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v7 = sub_1DD3CE404(a1, (void *)(a1 + 24), a2, a4);
  if (a5) {
    *a5 = v7;
  }
  return v7 >= a3;
}

void sub_1DD3CE4F8(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      sub_1DD3A9B50();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)sub_1DD3B2EF4(v4, v13);
      uint64_t v8 = *a1;
      int v7 = a1[1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    int v15 = &v14[4 * v11];
    int v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    float v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void sub_1DD3CE614(uint64_t a1, CVPixelBufferRef pixelBuffer, size_t planeIndex, char a4)
{
  *(void *)(a1 + 8) = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
  CGRect CleanRect = CVImageBufferGetCleanRect(pixelBuffer);
  double x = CleanRect.origin.x;
  double y = CleanRect.origin.y;
  double width = CleanRect.size.width;
  double height = CleanRect.size.height;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if ((PixelFormatType | 0x10) == 0x34323076)
  {
    if (planeIndex) {
      int v14 = 2;
    }
    else {
      int v14 = 1;
    }
    *(_DWORD *)(a1 + 32) = v14;
    char v15 = planeIndex == 1;
    unint64_t v16 = (unint64_t)height >> (planeIndex == 1);
    *(void *)(a1 + 16) = (unint64_t)width >> (planeIndex == 1);
    *(void *)(a1 + 24) = v16;
    if (a4)
    {
      unint64_t v17 = 1;
      if (planeIndex == 1) {
        unint64_t v17 = 2;
      }
      unint64_t v18 = (unint64_t)(height + (double)v17 + -1.0) >> v15;
      unint64_t v19 = (unint64_t)x >> v15;
      size_t v20 = HeightOfPlane - ((unint64_t)y >> v15);
      uint64_t v21 = *(void *)(a1 + 40);
      size_t v22 = v20 - v18;
      unint64_t v23 = *(void *)(a1 + 8) * v16;
      unint64_t v24 = *(void *)(a1 + 48) - v21;
      if (v23 <= v24)
      {
        if (v23 < v24) {
          *(void *)(a1 + 48) = v21 + v23;
        }
      }
      else
      {
        sub_1DD3B353C((unint64_t *)(a1 + 40), v23 - v24);
      }
      CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
      uint64_t v26 = *(void *)(a1 + 8);
      CMTime v27 = &BaseAddressOfPlane[v26 * HeightOfPlane];
      CMTime v28 = &BaseAddressOfPlane[v26 * v22 + v19 * *(unsigned int *)(a1 + 32)];
      CMTime v29 = &v28[*(void *)(a1 + 24) * v26];
      if (v29 >= v27) {
        CMTime v29 = v27;
      }
      memmove(*(void **)(a1 + 40), v28, v29 - v28);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    }
  }
  else
  {
    NSLog(&cfstr_PixbufplaneUnk.isa, PixelFormatType);
  }
}

uint64_t sub_1DD3CE7EC(uint64_t a1, __CVBuffer *a2, char a3)
{
  *(void *)a1 = &unk_1F3891BA0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 40) = 0;
  sub_1DD3CE864((void *)a1, a2, a3);
  return a1;
}

void sub_1DD3CE848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 24);
  sub_1DD3CF73C(&a10);
  _Unwind_Resume(a1);
}

void sub_1DD3CE864(void *a1, CVImageBufferRef imageBuffer, char a3)
{
  CGRect CleanRect = CVImageBufferGetCleanRect(imageBuffer);
  a1[1] = (unint64_t)CleanRect.size.width;
  a1[2] = (unint64_t)CleanRect.size.height;
  size_t PlaneCount = CVPixelBufferGetPlaneCount(imageBuffer);
  int v7 = a1 + 3;
  sub_1DD3CE900(v7, PlaneCount);
  if (PlaneCount)
  {
    uint64_t v8 = 0;
    for (size_t i = 0; i != PlaneCount; ++i)
    {
      sub_1DD3CE614(*v7 + v8, imageBuffer, i, a3);
      v8 += 64;
    }
  }
}

uint64_t *sub_1DD3CE900(uint64_t *result, unint64_t a2)
{
  unint64_t v2 = result;
  uint64_t v3 = result[1];
  unint64_t v4 = (v3 - *result) >> 6;
  if (a2 <= v4)
  {
    if (a2 < v4)
    {
      uint64_t v6 = *result + (a2 << 6);
      if (v3 != v6)
      {
        uint64_t v7 = v3 - 64;
        uint64_t v8 = (uint64_t (***)(void))(v3 - 64);
        uint64_t v9 = (uint64_t (***)(void))(v3 - 64);
        do
        {
          uint64_t v10 = *v9;
          v9 -= 8;
          uint64_t result = (uint64_t *)(*v10)(v8);
          v7 -= 64;
          BOOL v11 = v8 == (uint64_t (***)(void))v6;
          uint64_t v8 = v9;
        }
        while (!v11);
      }
      v2[1] = v6;
    }
  }
  else
  {
    unint64_t v5 = a2 - v4;
    return (uint64_t *)sub_1DD3CF7FC(result, v5);
  }
  return result;
}

unint64_t sub_1DD3CE9CC(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7)
{
  id v12 = a1;
  id v13 = a2;
  id v14 = a5;
  if ((*(unsigned char *)(a6 + 4) & 4) != 0)
  {
    context = (void *)MEMORY[0x1E01B4410]();
    id v16 = v13;
    [v14 numFrames];
    float v17 = *(float *)a6;
    [v14 cropRect];
    if (v17 != 0.0)
    {
      float v20 = v19 / v17;
      double v19 = roundf(v20);
      float v21 = v18 / v17;
      double v18 = roundf(v21);
    }
    unint64_t v15 = sub_1DD3B4384(v14, v12, 0, 0, &unk_1F3891FB8, v16, v18, v19);
    if (!v15)
    {
      [[VideoAccessIndexNorm alloc] initFromFile:v16 pixelFormat:3588 normalizer:a4];
      [[VideoAccessIndexNorm alloc] initFromFile:v16 pixelFormat:3588 normalizer:a4];
      unint64_t v24 = (*(unsigned int (**)(uint64_t))(*(void *)a4 + 24))(a4);
      sub_1DD3C2CD0(a7, v24);
      sub_1DD3D25A4();
    }
    NSLog(&cfstr_Mapframediffyu_0.isa);
  }
  else
  {
    NSLog(&cfstr_Mapframediffyu.isa);
    unint64_t v15 = 0xFFFFFFFFLL;
  }

  return v15;
}

void sub_1DD3CEEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(void *)(v19 - 112) = a18;
  sub_1DD3CF73C((void ***)(v19 - 112));

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CEF74()
{
  return 1;
}

float sub_1DD3CEF7C(uint64_t a1, __CVBuffer *a2)
{
  v27[1] = *(void ***)MEMORY[0x1E4F143B8];
  sub_1DD3CE7EC((uint64_t)&v23, a2, 0);
  if (CVPixelBufferLockBaseAddress(a2, 1uLL))
  {
    float v4 = -1.0;
    NSLog(&cfstr_ApplydiffcvpEr.isa);
  }
  else
  {
    unint64_t v5 = dispatch_get_global_queue(0, 0);
    uint64_t v6 = *(void *)(a1 + 32) - *(void *)(a1 + 24);
    MEMORY[0x1F4188790]();
    uint64_t v19 = 0;
    float v20 = &v19;
    uint64_t v21 = 0x2020000000;
    size_t v22 = (char *)&block[-1] - v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = sub_1DD3CF418;
    block[3] = &unk_1F3891EA8;
    block[5] = a1;
    id v16 = &unk_1F3891BA0;
    long long v17 = v24;
    memset(v18, 0, 24);
    sub_1DD3CF574(v18, v25, v26, (v26 - v25) >> 6);
    v18[3] = a2;
    block[4] = &v19;
    dispatch_apply(v6 >> 6, v5, block);
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
    if ((v6 & 0x3FFFFFFFC0) != 0)
    {
      OSType v9 = PixelFormatType;
      uint64_t v10 = 0;
      uint64_t v11 = ((unint64_t)v6 >> 6);
      float v4 = 0.0;
      do
      {
        float v12 = (float)(unint64_t)v20[3][v10];
        if (v9 == 875704438) {
          float v12 = sub_1DD3D4104(v10) * v12;
        }
        float v4 = v4 + v12;
        ++v10;
      }
      while (v11 != v10);
    }
    else
    {
      float v4 = 0.0;
    }
    id v16 = &unk_1F3891BA0;
    v27[0] = (void **)v18;
    sub_1DD3CF73C(v27);
    _Block_object_dispose(&v19, 8);
  }
  unint64_t v23 = &unk_1F3891BA0;
  uint64_t v19 = (void **)&v25;
  sub_1DD3CF73C(&v19);
  return v4;
}

void sub_1DD3CF218(_Unwind_Exception *a1)
{
  *(void *)(v4 - 248) = v2;
  *(void *)(v4 - 112) = v3;
  sub_1DD3CF73C((void ***)(v4 - 112));
  _Block_object_dispose((const void *)(v4 - 192), 8);

  *(void *)(v4 - 160) = &unk_1F3891BA0;
  *(void *)(v4 - 192) = v4 - 136;
  sub_1DD3CF73C((void ***)(v4 - 192));
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CF294(uint64_t a1)
{
  *(void *)a1 = &unk_1F3891BA0;
  uint64_t v3 = (void **)(a1 + 24);
  sub_1DD3CF73C(&v3);
  return a1;
}

void *sub_1DD3CF2EC(void *a1)
{
  *a1 = &unk_1F3891AF0;
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1DD3CF33C(void *a1)
{
  *a1 = &unk_1F3891AF0;
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  JUMPOUT(0x1E01B4150);
}

uint64_t sub_1DD3CF3AC(uint64_t a1)
{
  *(void *)a1 = &unk_1F3891BA0;
  uint64_t v3 = (void **)(a1 + 24);
  sub_1DD3CF73C(&v3);
  return MEMORY[0x1E01B4150](a1, 0x10A1C406C85F68BLL);
}

unsigned __int8 *sub_1DD3CF418(uint64_t a1, size_t a2)
{
  uint64_t v4 = *(void *)(a1 + 72);
  size_t v5 = *(void *)(*(void *)(a1 + 40) + 24) + (a2 << 6);
  uint64_t v6 = *(unsigned __int8 **)(v5 + 40);
  uint64_t result = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 96), a2);
  uint64_t v8 = *(void *)(v5 + 24);
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v6;
      float v12 = result;
      for (uint64_t i = *(void *)(v5 + 16) * *(unsigned int *)(v5 + 32); i; --i)
      {
        int v15 = *v11++;
        int v14 = v15;
        int v16 = *v12++;
        LODWORD(v17) = v14 - v16;
        if ((int)v17 >= 0) {
          uint64_t v17 = v17;
        }
        else {
          uint64_t v17 = -(int)v17;
        }
        v10 += v17;
      }
      ++v9;
      result += *(void *)(v4 + (a2 << 6) + 8);
      v6 += *(void *)(v5 + 8);
    }
    while (v9 != v8);
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8 * a2) = v10;
  return result;
}

void *sub_1DD3CF4E4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = &unk_1F3891BA0;
  long long v2 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = 0;
  uint64_t v3 = (void *)(a1 + 72);
  *((_OWORD *)v3 - 1) = v2;
  v3[1] = 0;
  v3[2] = 0;
  return sub_1DD3CF574(v3, *(void *)(a2 + 72), *(void *)(a2 + 80), (uint64_t)(*(void *)(a2 + 80) - *(void *)(a2 + 72)) >> 6);
}

void sub_1DD3CF528(uint64_t a1)
{
  *(void *)(a1 + 48) = &unk_1F3891BA0;
  uint64_t v1 = (void **)(a1 + 72);
  sub_1DD3CF73C(&v1);
}

void *sub_1DD3CF574(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_1DD3CF5FC(result, a4);
    uint64_t result = (void *)sub_1DD3CF678((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1DD3CF5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1DD3CF73C(&a9);
  _Unwind_Resume(a1);
}

char *sub_1DD3CF5FC(void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    sub_1DD3A9B50();
  }
  uint64_t result = (char *)sub_1DD3CF640((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *sub_1DD3CF640(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    sub_1DD3A9C40();
  }
  return operator new(a2 << 6);
}

uint64_t sub_1DD3CF678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      *(void *)(a4 + v7) = &unk_1F3891AF0;
      long long v8 = *(_OWORD *)(a2 + v7 + 8);
      long long v9 = *(_OWORD *)(a2 + v7 + 20);
      *(void *)(a4 + v7 + 40) = 0;
      uint64_t v10 = (void *)(a4 + v7 + 40);
      *(_OWORD *)((char *)v10 - 20) = v9;
      *((_OWORD *)v10 - 2) = v8;
      v10[1] = 0;
      v10[2] = 0;
      sub_1DD3B34C0(v10, *(const void **)(a2 + v7 + 40), *(void *)(a2 + v7 + 48), *(void *)(a2 + v7 + 48) - *(void *)(a2 + v7 + 40));
      v7 += 64;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1DD3CF720(_Unwind_Exception *exception_object)
{
  if (v3) {
    sub_1DD3CFB18(v2, v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3CF73C(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    size_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = v4 - 64;
      uint64_t v7 = v4 - 64;
      long long v8 = v4 - 64;
      do
      {
        long long v9 = *(void (***)(char *))v8;
        v8 -= 64;
        (*v9)(v7);
        v6 -= 64;
        BOOL v10 = v7 == v2;
        uint64_t v7 = v8;
      }
      while (!v10);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1DD3CF7FC(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(result - 8);
  if (a2 <= (v6 - v7) >> 6)
  {
    if (a2)
    {
      uint64_t v14 = v7 + (a2 << 6);
      uint64_t v15 = *(void *)(result - 8);
      do
      {
        *(void *)(v7 + 48) = 0;
        *(void *)(v7 + 56) = 0;
        *(void *)(v7 + 40) = 0;
        *(void *)uint64_t v7 = &unk_1F3891AF0;
        *(void *)(v7 + 8) = 0;
        *(void *)(v7 + 16) = 0;
        *(void *)(v7 + 24) = 0;
        *(_DWORD *)(v7 + 32) = 0;
        v15 += 64;
        v7 += 64;
      }
      while (v7 != v14);
      uint64_t v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - *a1;
    unint64_t v9 = a2 + (v8 >> 6);
    if (v9 >> 58) {
      sub_1DD3A9B50();
    }
    uint64_t v10 = v8 >> 6;
    uint64_t v11 = v5 - *a1;
    if (v11 >> 5 > v9) {
      unint64_t v9 = v11 >> 5;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    v19[4] = result;
    if (v12) {
      id v13 = (char *)sub_1DD3CF640(result, v12);
    }
    else {
      id v13 = 0;
    }
    int v16 = &v13[64 * v10];
    v19[0] = v13;
    v19[1] = v16;
    v19[3] = &v13[64 * v12];
    uint64_t v17 = &v16[64 * a2];
    double v18 = v16;
    do
    {
      *((void *)v18 + 6) = 0;
      *((void *)v18 + 7) = 0;
      *((void *)v18 + 5) = 0;
      *(void *)double v18 = &unk_1F3891AF0;
      *((void *)v18 + 1) = 0;
      *((void *)v18 + 2) = 0;
      *((void *)v18 + 3) = 0;
      *((_DWORD *)v18 + 8) = 0;
      v16 += 64;
      v18 += 64;
    }
    while (v18 != v17);
    v19[2] = v17;
    sub_1DD3CF96C(a1, v19);
    return sub_1DD3CFAAC((uint64_t)v19);
  }
  return result;
}

void sub_1DD3CF958(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_1DD3CFAAC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3CF96C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1DD3CF9E4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1DD3CF9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0; ; i -= 64)
  {
    uint64_t v12 = a3 + i;
    if (a3 + i == a5) {
      break;
    }
    uint64_t v13 = a7 + i;
    *(void *)(v13 - 64) = &unk_1F3891AF0;
    long long v14 = *(_OWORD *)(v12 - 56);
    long long v15 = *(_OWORD *)(v12 - 44);
    *(void *)(v13 - 24) = 0;
    int v16 = (void *)(a7 + i - 24);
    *(_OWORD *)((char *)v16 - 20) = v15;
    *((_OWORD *)v16 - 2) = v14;
    v16[1] = 0;
    v16[2] = 0;
    sub_1DD3B34C0(v16, *(const void **)(v12 - 24), *(void *)(v12 - 16), *(void *)(v12 - 16) - *(void *)(v12 - 24));
  }
  return a6;
}

uint64_t sub_1DD3CFAAC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void (***)(void))(i - 64);
    *(void *)(a1 + 16) = i - 64;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_1DD3CFB18(uint64_t a1, uint64_t (***a2)(void))
{
  uint64_t v3 = a1 - 64;
  uint64_t v4 = (uint64_t (***)(void))(a1 - 64);
  uint64_t v5 = (uint64_t (***)(void))(a1 - 64);
  do
  {
    uint64_t v6 = *v5;
    v5 -= 8;
    uint64_t result = (*v6)(v4);
    v3 -= 64;
    BOOL v8 = v4 == a2;
    uint64_t v4 = v5;
  }
  while (!v8);
  return result;
}

void (***sub_1DD3CFB84(void (***a1)(void), void (***a2)(void)))(void)
{
  uint64_t v3 = a1;
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = *v4;
    v4 += 8;
    (*v5)();
    v3 += 8;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void sub_1DD3CFBE8(uint64_t a1, int a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  sub_1DD3B854C(a1 + 16, a3 * a2);
  *(_DWORD *)(a1 + 40) = a2;
  *(_DWORD *)(a1 + 44) = a3;
  uint64_t v10 = *(void **)(a1 + 8);
  *(void *)a1 = a4;
  *(void *)(a1 + 8) = v9;
}

void sub_1DD3CFC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3CFC68(uint64_t *a1, void *a2, float **a3, int a4, int a5)
{
  sub_1DD3B3678(__p, (a1[1] - *a1) >> 2);
  uint64_t v10 = *a3;
  unint64_t v11 = (char *)a3[1] - (char *)*a3;
  unint64_t v12 = v11 >> 2;
  if (((v11 >> 2) & 0x80000000) == 0) {
    int v13 = v11 >> 2;
  }
  else {
    int v13 = v12 + 1;
  }
  if (a4 >= 1)
  {
    uint64_t v14 = 0;
    int v15 = -(v13 >> 1);
    int v16 = (float *)__p[0];
    uint64_t v17 = (v11 >> 2);
    int v18 = v15 * a5;
    int v19 = v15;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v20 = 0;
        do
        {
          if ((int)v12 < 1)
          {
            float v21 = 0.0;
          }
          else
          {
            float v21 = 0.0;
            uint64_t v22 = v17;
            int v23 = v19;
            int v24 = v18;
            uint64_t v25 = v10;
            do
            {
              if ((v23 & 0x80000000) == 0 && v23 < a4) {
                float v21 = v21 + (float)(*v25 * *(float *)(*a2 + 4 * (v20 + v24)));
              }
              ++v25;
              v24 += a5;
              ++v23;
              --v22;
            }
            while (v22);
          }
          v16[v20 + v14 * a5] = v21;
          ++v20;
        }
        while (v20 != a5);
      }
      ++v14;
      v18 += a5;
      ++v19;
    }
    while (v14 != a4);
    uint64_t v26 = 0;
    uint64_t v27 = *a1;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v28 = 0;
        uint64_t v29 = v26 * a5;
        int v30 = v15;
        do
        {
          float v31 = 0.0;
          if ((int)v12 >= 1)
          {
            uint64_t v32 = v17;
            int v33 = v30;
            uint64_t v34 = v10;
            do
            {
              if ((v33 & 0x80000000) == 0 && v33 < a5) {
                float v31 = v31 + (float)(*v34 * *((float *)__p[0] + v29 + v33));
              }
              ++v34;
              ++v33;
              --v32;
            }
            while (v32);
          }
          *(float *)(v27 + 4 * (v28 + v29)) = v31;
          ++v28;
          ++v30;
        }
        while (v28 != a5);
      }
      ++v26;
    }
    while (v26 != a4);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1DD3CFE2C(uint64_t *a1, uint64_t *a2, int a3, int a4, int a5, float a6)
{
  int v11 = (int)(float)((float)(a6 * 6.0) + 1.0) | 1;
  float v29 = 1.0 / (float)((float)(a6 + a6) * a6);
  if (v11 <= 3) {
    unint64_t v12 = 3;
  }
  else {
    unint64_t v12 = v11;
  }
  sub_1DD3B3678(__p, v12);
  uint64x2_t v28 = (uint64x2_t)vdupq_n_s64(v12 - 1);
  int32x2_t v13 = vdup_n_s32(v12 >> 1);
  uint64_t v14 = (float *)((char *)__p[0] + 4);
  unint64_t v15 = v12 + 1;
  int32x2_t v16 = (int32x2_t)0x100000000;
  uint64x2_t v17 = (uint64x2_t)xmmword_1DD3E8420;
  int64x2_t v27 = vdupq_n_s64(2uLL);
  do
  {
    int32x2_t v32 = vmovn_s64((int64x2_t)vcgeq_u64(v28, v17));
    int64x2_t v33 = (int64x2_t)v17;
    int32x2_t v18 = vsub_s32(v16, v13);
    float32x2_t v19 = vmul_n_f32(vcvt_f32_s32(vneg_s32(vmul_s32(v18, v18))), v29);
    float v30 = v19.f32[0];
    float v31 = expf(v19.f32[1]);
    float v20 = expf(v30);
    if (v32.i8[0]) {
      *(v14 - 1) = v20;
    }
    if (v32.i8[4]) {
      *uint64_t v14 = v31;
    }
    uint64x2_t v17 = (uint64x2_t)vaddq_s64(v33, v27);
    int32x2_t v16 = vadd_s32(v16, (int32x2_t)0x200000002);
    v14 += 2;
    v15 -= 2;
  }
  while (v15);
  sub_1DD3CFC68(a1, a2, (float **)__p, a3, a4);
  if (a5)
  {
    uint64_t v21 = *a2;
    uint64_t v22 = a2[1];
    uint64_t v23 = v22 - *a2;
    if (v22 != *a2)
    {
      uint64_t v24 = 0;
      unint64_t v25 = v23 >> 2;
      uint64_t v26 = *a1;
      do
      {
        *(float *)(v26 + 4 * v24) = *(float *)(v21 + 4 * v24) - *(float *)(v26 + 4 * v24);
        ++v24;
      }
      while (v25 > v24);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1DD3CFFE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3D0000(float **a1, float **a2, int a3, int a4, float a5)
{
  if (a3 >= 1)
  {
    uint64_t v9 = 0;
    int v10 = a3 >> 1;
    int v11 = *a2;
    unint64_t v12 = *a1;
    uint64_t v13 = 4 * a4;
    do
    {
      float v14 = fabsf((float)(v9 - v10));
      float v15 = expf((float)-(float)((float)(v14 / (float)v10) * (float)(v14 / (float)v10)) * a5);
      uint64_t v16 = a4;
      uint64x2_t v17 = v12;
      int32x2_t v18 = v11;
      if (a4 >= 1)
      {
        do
        {
          float v19 = *v18++;
          *v17++ = v15 * v19;
          --v16;
        }
        while (v16);
      }
      ++v9;
      int v11 = (float *)((char *)v11 + v13);
      unint64_t v12 = (float *)((char *)v12 + v13);
    }
    while (v9 != a3);
  }
  if (a4 >= 1)
  {
    uint64_t v20 = 0;
    int v21 = a4 >> 1;
    uint64_t v22 = *a1;
    uint64_t v23 = a4;
    uint64_t v24 = 4 * a4;
    do
    {
      float v25 = fabsf((float)(v20 - v21));
      float v26 = expf((float)-(float)((float)(v25 / (float)v21) * (float)(v25 / (float)v21)) * a5);
      uint64_t v27 = a3;
      uint64x2_t v28 = v22;
      if (a3 >= 1)
      {
        do
        {
          *uint64x2_t v28 = v26 * *v28;
          uint64x2_t v28 = (float *)((char *)v28 + v24);
          --v27;
        }
        while (v27);
      }
      ++v20;
      ++v22;
    }
    while (v20 != v23);
  }
}

void *sub_1DD3D014C(void *result, void *a2, int a3, int a4, int a5)
{
  if (a3 >= 0) {
    int v5 = a3;
  }
  else {
    int v5 = a3 + 1;
  }
  int v6 = v5 >> 1;
  if (a5) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }
  if (a5) {
    int v8 = v6;
  }
  else {
    int v8 = a3;
  }
  if (v7 < v8)
  {
    uint64_t v9 = (_DWORD *)*result;
    uint64_t v10 = v7;
    uint64_t v11 = 4 * a4;
    uint64_t v12 = *a2 + 4 * v7 * (uint64_t)a4;
    do
    {
      uint64_t v13 = a4;
      float v14 = (int *)v12;
      float v15 = v9;
      if (a4 >= 1)
      {
        do
        {
          int v16 = *v14++;
          *v15++ = v16;
          --v13;
        }
        while (v13);
      }
      ++v10;
      uint64_t v9 = (_DWORD *)((char *)v9 + v11);
      v12 += v11;
    }
    while (v10 != v8);
  }
  return result;
}

void sub_1DD3D01C8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  *a4 = 0;
  id v36 = v7;
  if (![v7 isEqual:@"ALGFP_ImageFilter_Nonnegative"])
  {
    if ([v36 isEqual:@"ALGFP_ImageFilter_LowPass_Gaussian3"])
    {
      sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
      int v14 = 0;
LABEL_10:
      float v15 = 3.0;
LABEL_24:
      sub_1DD3CFE2C((uint64_t *)(a2 + 16), (uint64_t *)(a1 + 16), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), v14, v15);
      goto LABEL_25;
    }
    if ([v36 isEqual:@"ALGFP_ImageFilter_LowPass_Gaussian5"])
    {
      sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
      int v14 = 0;
LABEL_13:
      float v15 = 5.0;
      goto LABEL_24;
    }
    if ([v36 isEqual:@"ALGFP_ImageFilter_LowPass_Gaussian7"])
    {
      sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
      int v14 = 0;
    }
    else
    {
      if ([v36 isEqual:@"ALGFP_ImageFilter_HighPass_Gaussian3"])
      {
        sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
        int v14 = 1;
        goto LABEL_10;
      }
      if ([v36 isEqual:@"ALGFP_ImageFilter_HighPass_Gaussian5"])
      {
        sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
        int v14 = 1;
        goto LABEL_13;
      }
      if (![v36 isEqual:@"ALGFP_ImageFilter_HighPass_Gaussian7"])
      {
        if ([v36 isEqual:@"ALGFP_ImageFilter_Top"])
        {
          sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40) / 2, *(_DWORD *)(a1 + 44), a1, v36);
          uint64_t v24 = (void *)(a2 + 16);
          float v25 = (void *)(a1 + 16);
          int v26 = *(_DWORD *)(a1 + 40);
          int v27 = *(_DWORD *)(a1 + 44);
          int v28 = 1;
        }
        else
        {
          if (![v36 isEqual:@"ALGFP_ImageFilter_Bottom"])
          {
            if ([v36 isEqual:@"ALGFP_ImageFilter_Vignette1"])
            {
              sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
              float v31 = (float **)(a2 + 16);
              int32x2_t v32 = (float **)(a1 + 16);
              int v33 = *(_DWORD *)(a1 + 40);
              int v34 = *(_DWORD *)(a1 + 44);
              float v35 = 1.0;
            }
            else if ([v36 isEqual:@"ALGFP_ImageFilter_Vignette2"])
            {
              sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
              float v31 = (float **)(a2 + 16);
              int32x2_t v32 = (float **)(a1 + 16);
              int v33 = *(_DWORD *)(a1 + 40);
              int v34 = *(_DWORD *)(a1 + 44);
              float v35 = 2.0;
            }
            else
            {
              if (![v36 isEqual:@"ALGFP_ImageFilter_Vignette3"])
              {
                *a4 = 1;
                goto LABEL_25;
              }
              sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
              float v31 = (float **)(a2 + 16);
              int32x2_t v32 = (float **)(a1 + 16);
              int v33 = *(_DWORD *)(a1 + 40);
              int v34 = *(_DWORD *)(a1 + 44);
              float v35 = 3.0;
            }
            sub_1DD3D0000(v31, v32, v33, v34, v35);
            goto LABEL_25;
          }
          int v29 = *(_DWORD *)(a1 + 40);
          if (v29 >= 0) {
            int v30 = *(_DWORD *)(a1 + 40);
          }
          else {
            int v30 = v29 + 1;
          }
          sub_1DD3CFBE8(a2, v29 - (v30 >> 1), *(_DWORD *)(a1 + 44), a1, v36);
          uint64_t v24 = (void *)(a2 + 16);
          float v25 = (void *)(a1 + 16);
          int v26 = *(_DWORD *)(a1 + 40);
          int v27 = *(_DWORD *)(a1 + 44);
          int v28 = 0;
        }
        sub_1DD3D014C(v24, v25, v26, v27, v28);
        goto LABEL_25;
      }
      sub_1DD3CFBE8(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
      int v14 = 1;
    }
    float v15 = 7.0;
    goto LABEL_24;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = v9 - v8;
  if (v9 == v8)
  {
    int v12 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = 0;
    unint64_t v13 = v10 >> 2;
    do
    {
      if (*(float *)(v8 + 4 * v11) >= 0.0) {
        ++v12;
      }
      ++v11;
    }
    while (v13 > v11);
  }
  sub_1DD3CFBE8(a2, 1, v12, a1, v36);
  uint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v18 = v17 - v16;
  if (v17 != v16)
  {
    uint64_t v19 = 0;
    int v20 = 0;
    unint64_t v21 = v18 >> 2;
    uint64_t v22 = *(void *)(a2 + 16);
    do
    {
      float v23 = *(float *)(v16 + 4 * v19);
      if (v23 >= 0.0) {
        *(float *)(v22 + 4 * v20++) = v23;
      }
      ++v19;
    }
    while (v21 > v19);
  }
LABEL_25:
}

void sub_1DD3D054C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D0564(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    int v6 = v5;
    if (v5 && [v5 count])
    {
      uint64_t v9 = [v6 objectAtIndex:0];
      if (a2)
      {
        if (v9)
        {
          [v9 timeRange];
        }
        else
        {
          memset(v13, 0, sizeof(v13));
          long long v12 = 0u;
        }
        *(_OWORD *)a2 = *(_OWORD *)((char *)v13 + 8);
        *(void *)(a2 + 16) = *((void *)&v13[1] + 1);
      }
      uint64_t v10 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:v9];
      id v11 = 0;
      id v7 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v4 error:&v11];
      v11;
      [v7 addOutput:v10];
      [v7 startReading];
      operator new();
    }
    NSLog(&cfstr_NoVideoAssetTr.isa);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate.isa);
  }

  return 0;
}

void sub_1DD3D0AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_1DD3D0B90(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0) {
      sub_1DD3A9B50();
    }
    unint64_t v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64) {
      unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    }
    if (v4 <= 0x3FFFFFFFFFFFFFFELL) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    sub_1DD3D0EE4((char **)a1, v7);
    unint64_t v4 = *(void *)(a1 + 8);
  }
  *(void *)(a1 + 8) = v4 + 1;
  uint64_t v8 = *(char **)a1;
  unint64_t v9 = v4 >> 6;
  uint64_t v10 = 1 << v4;
  if (*a2) {
    uint64_t v11 = *(void *)&v8[8 * v9] | v10;
  }
  else {
    uint64_t v11 = *(void *)&v8[8 * v9] & ~v10;
  }
  *(void *)&v8[8 * v9] = v11;
}

uint64_t sub_1DD3D0C38(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = sub_1DD3D0564(v3, a2);
  uint64_t v5 = (void **)v4;
  if (v4)
  {
    unint64_t v6 = *(void **)(v4 + 8);
    if (v6 != *v5) {
      operator new();
    }
    if (v6) {
      operator delete(v6);
    }
    MEMORY[0x1E01B4150](v5, 0x20C40960023A9);
  }

  return 0;
}

void sub_1DD3D0DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  MEMORY[0x1E01B4150](v11, 0x20C40960023A9);
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D0DF8(uint64_t a1, uint64_t a2, uint64_t a3, CMTime *a4)
{
  long long v8 = *(_OWORD *)a3;
  uint64_t v9 = *(void *)(a3 + 16);
  CMTime v7 = *a4;
  uint64_t v5 = (void *)sub_1DD3DC9E8(a1, a2, &v8, &v7);
  *uint64_t v5 = &unk_1F3891DF0;
  sub_1DD3DD940((uint64_t)v5);
  return a1;
}

void sub_1DD3D0E70(_Unwind_Exception *a1)
{
  sub_1DD3D0E84(v1);
  _Unwind_Resume(a1);
}

void *sub_1DD3D0E84(void *a1)
{
  *a1 = &unk_1F3891D00;
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  id v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1DD3D0EE4(char **a1, unint64_t a2)
{
  if (a2 > (void)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      sub_1DD3A9B50();
    }
    uint64_t v10 = 0;
    long long v11 = 0uLL;
    sub_1DD3D0FA4(&v10, a2);
    unint64_t v3 = (unint64_t)a1[1];
    long long v8 = *a1;
    int v9 = 0;
    unint64_t v6 = &v8[8 * (v3 >> 6)];
    int v7 = v3 & 0x3F;
    sub_1DD3D0FEC(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    uint64_t v4 = *a1;
    *a1 = v10;
    uint64_t v10 = v4;
    long long v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    long long v11 = v5;
    if (v4) {
      operator delete(v4);
    }
  }
}

void sub_1DD3D0F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DD3D0FA4(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_1DD3A9B50();
  }
  uint64_t result = sub_1DD3B19D0((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void sub_1DD3D0FEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41) {
      unint64_t v6 = (v5 - 1) >> 6;
    }
    else {
      unint64_t v6 = 0;
    }
    *(void *)(*a1 + 8 * v6) = 0;
  }
  int v7 = *(_DWORD *)(a2 + 8);
  uint64_t v8 = *(void *)a3;
  int v9 = *(_DWORD *)(a3 + 8);
  uint64_t v10 = *a1 + 8 * (v4 >> 6);
  uint64_t v16 = *(void *)a2;
  int v17 = v7;
  uint64_t v14 = v8;
  int v15 = v9;
  uint64_t v12 = v10;
  int v13 = v4 & 0x3F;
  sub_1DD3D1090(&v16, &v14, &v12, (uint64_t)&v11);
}

void sub_1DD3D1090(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5 = *((_DWORD *)a1 + 2);
  uint64_t v6 = *a2;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v16 = *a1;
  int v17 = v5;
  uint64_t v14 = v6;
  int v15 = v7;
  int v8 = *((_DWORD *)a3 + 2);
  uint64_t v12 = *a3;
  int v13 = v8;
  sub_1DD3D1120((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  int v9 = v19;
  uint64_t v10 = v20;
  int v11 = v21;
  *(void *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void sub_1DD3D1120(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v4 = *(void **)a1;
  int v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(void *)a1 != *(void *)a2 || v5 != *(_DWORD *)(a2 + 8); int v5 = *(_DWORD *)(a1 + 8))
  {
    int v8 = *(uint64_t **)a3;
    uint64_t v9 = 1 << i;
    if ((*v4 >> v5)) {
      uint64_t v10 = *v8 | v9;
    }
    else {
      uint64_t v10 = *v8 & ~v9;
    }
    *int v8 = v10;
    if (v5 == 63)
    {
      int v11 = 0;
      *(void *)a1 = v4 + 1;
    }
    else
    {
      int v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    int v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      int i = 0;
      *(void *)a3 += 8;
    }
    else
    {
      int i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    unint64_t v4 = *(void **)a1;
  }
  *(void *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = *(void *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

void sub_1DD3D11F0(CMTime *a1, CMTime *a2, uint64_t a3, char a4)
{
  while (2)
  {
    uint64_t v9 = a2;
    uint64_t v10 = a2 - 1;
    int v11 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v11;
          uint64_t v12 = (char *)v9 - (char *)v11;
          uint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)v11) >> 3);
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0:
              case 1:
                return;
              case 2:
                CMTimeEpoch epoch = a2[-1].epoch;
                v122.CMTimeEpoch epoch = a1->epoch;
                *(_OWORD *)&v122.CMTimeValue value = *(_OWORD *)&a1->value;
                *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)&a2[-1].value;
                time1.CMTimeEpoch epoch = epoch;
                CMTime time2 = v122;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  long long v64 = *(_OWORD *)&a1->value;
                  time1.CMTimeEpoch epoch = a1->epoch;
                  *(_OWORD *)&time1.CMTimeValue value = v64;
                  long long v65 = *(_OWORD *)&v10->value;
                  a1->CMTimeEpoch epoch = a2[-1].epoch;
                  *(_OWORD *)&a1->CMTimeValue value = v65;
                  long long v66 = *(_OWORD *)&time1.value;
                  a2[-1].CMTimeEpoch epoch = time1.epoch;
                  *(_OWORD *)&v10->CMTimeValue value = v66;
                }
                break;
              case 3:
                sub_1DD3D1F4C(a1, a1 + 1, v10);
                break;
              case 4:
                sub_1DD3D2374(a1, a1 + 1, a1 + 2, v10);
                break;
              case 5:
                sub_1DD3D1DC0(a1, a1 + 1, a1 + 2, a1 + 3, v10);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v12 <= 575)
          {
            id v67 = a1 + 1;
            BOOL v69 = a1 == v9 || v67 == v9;
            if (a4)
            {
              if (!v69)
              {
                uint64_t v70 = 0;
                id v71 = a1;
                do
                {
                  long long v72 = *(_OWORD *)&v71->value;
                  CMTimeEpoch v73 = v71->epoch;
                  id v71 = v67;
                  long long v74 = *(_OWORD *)&v67->value;
                  time1.CMTimeEpoch epoch = v67->epoch;
                  *(_OWORD *)&time1.CMTimeValue value = v74;
                  *(_OWORD *)&time2.CMTimeValue value = v72;
                  time2.CMTimeEpoch epoch = v73;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    v127.CMTimeEpoch epoch = v71->epoch;
                    *(_OWORD *)&v127.CMTimeValue value = *(_OWORD *)&v71->value;
                    uint64_t v75 = v70;
                    while (1)
                    {
                      id v76 = (char *)a1 + v75;
                      *(_OWORD *)(v76 + 24) = *(_OWORD *)((char *)&a1->value + v75);
                      *((void *)v76 + 5) = *(CMTimeEpoch *)((char *)&a1->epoch + v75);
                      if (!v75) {
                        break;
                      }
                      v123.CMTimeEpoch epoch = *((void *)v76 - 1);
                      *(_OWORD *)&v123.CMTimeValue value = *(_OWORD *)(v76 - 24);
                      CMTime time1 = v127;
                      CMTime time2 = v123;
                      v75 -= 24;
                      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                      {
                        uint64_t v77 = (uint64_t)&a1[1] + v75;
                        goto LABEL_77;
                      }
                    }
                    uint64_t v77 = (uint64_t)a1;
LABEL_77:
                    *(void *)(v77 + 16) = v127.epoch;
                    *(_OWORD *)uint64_t v77 = *(_OWORD *)&v127.value;
                  }
                  id v67 = v71 + 1;
                  v70 += 24;
                }
                while (&v71[1] != v9);
              }
            }
            else if (!v69)
            {
              do
              {
                long long v113 = *(_OWORD *)&a1->value;
                CMTimeEpoch v114 = a1->epoch;
                a1 = v67;
                long long v115 = *(_OWORD *)&v67->value;
                time1.CMTimeEpoch epoch = v67->epoch;
                *(_OWORD *)&time1.CMTimeValue value = v115;
                *(_OWORD *)&time2.CMTimeValue value = v113;
                time2.CMTimeEpoch epoch = v114;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  v129.CMTimeEpoch epoch = a1->epoch;
                  *(_OWORD *)&v129.CMTimeValue value = *(_OWORD *)&a1->value;
                  id v116 = a1;
                  do
                  {
                    CGAffineTransform v117 = v116 - 1;
                    v116->CMTimeEpoch epoch = v116[-1].epoch;
                    *(_OWORD *)&v116->CMTimeValue value = *(_OWORD *)&v116[-1].value;
                    v125.CMTimeEpoch epoch = v116[-2].epoch;
                    *(_OWORD *)&v125.CMTimeValue value = *(_OWORD *)&v116[-2].value;
                    CMTime time1 = v129;
                    CMTime time2 = v125;
                    int32_t v118 = CMTimeCompare(&time1, &time2);
                    id v116 = v117;
                  }
                  while (v118 < 0);
                  v117->CMTimeEpoch epoch = v129.epoch;
                  *(_OWORD *)&v117->CMTimeValue value = *(_OWORD *)&v129.value;
                }
                id v67 = a1 + 1;
              }
              while (&a1[1] != v9);
            }
            return;
          }
          if (!a3)
          {
            if (a1 != v9)
            {
              int64_t v78 = (unint64_t)(v13 - 2) >> 1;
              int64_t v79 = v78;
              do
              {
                int64_t v80 = v79;
                if (v78 >= v79)
                {
                  uint64_t v81 = (2 * v79) | 1;
                  uint64_t v82 = &a1[v81];
                  if (2 * v79 + 2 < v13)
                  {
                    long long v83 = *(_OWORD *)&v82->value;
                    time1.CMTimeEpoch epoch = v82->epoch;
                    *(_OWORD *)&time1.CMTimeValue value = v83;
                    long long v84 = *(_OWORD *)&v82[1].value;
                    time2.CMTimeEpoch epoch = v82[1].epoch;
                    *(_OWORD *)&time2.CMTimeValue value = v84;
                    if (CMTimeCompare(&time1, &time2) < 0)
                    {
                      ++v82;
                      uint64_t v81 = 2 * v80 + 2;
                    }
                  }
                  CMTime v85 = &a1[v80];
                  long long v86 = *(_OWORD *)&v82->value;
                  time1.CMTimeEpoch epoch = v82->epoch;
                  *(_OWORD *)&time1.CMTimeValue value = v86;
                  long long v87 = *(_OWORD *)&v85->value;
                  time2.CMTimeEpoch epoch = v85->epoch;
                  *(_OWORD *)&time2.CMTimeValue value = v87;
                  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                  {
                    v132.CMTimeEpoch epoch = v85->epoch;
                    *(_OWORD *)&v132.CMTimeValue value = *(_OWORD *)&v85->value;
                    do
                    {
                      CMTime v88 = v82;
                      long long v89 = *(_OWORD *)&v82->value;
                      v85->CMTimeEpoch epoch = v82->epoch;
                      *(_OWORD *)&v85->CMTimeValue value = v89;
                      if (v78 < v81) {
                        break;
                      }
                      uint64_t v90 = (2 * v81) | 1;
                      uint64_t v82 = &a1[v90];
                      uint64_t v91 = 2 * v81 + 2;
                      if (v91 < v13)
                      {
                        long long v92 = *(_OWORD *)&v82->value;
                        time1.CMTimeEpoch epoch = v82->epoch;
                        *(_OWORD *)&time1.CMTimeValue value = v92;
                        long long v93 = *(_OWORD *)&v82[1].value;
                        time2.CMTimeEpoch epoch = v82[1].epoch;
                        *(_OWORD *)&time2.CMTimeValue value = v93;
                        if (CMTimeCompare(&time1, &time2) < 0)
                        {
                          ++v82;
                          uint64_t v90 = v91;
                        }
                      }
                      long long v94 = *(_OWORD *)&v82->value;
                      time1.CMTimeEpoch epoch = v82->epoch;
                      *(_OWORD *)&time1.CMTimeValue value = v94;
                      CMTime time2 = v132;
                      CMTime v85 = v88;
                      uint64_t v81 = v90;
                    }
                    while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
                    v88->CMTimeEpoch epoch = v132.epoch;
                    *(_OWORD *)&v88->CMTimeValue value = *(_OWORD *)&v132.value;
                  }
                }
                int64_t v79 = v80 - 1;
              }
              while (v80);
              int64_t v95 = v12 / 0x18uLL;
              do
              {
                uint64_t v96 = 0;
                CMTimeEpoch v126 = a1->epoch;
                long long v124 = *(_OWORD *)&a1->value;
                uint64_t v97 = (uint64_t)a1;
                do
                {
                  uint64_t v98 = v97 + 24 * v96 + 24;
                  uint64_t v99 = (2 * v96) | 1;
                  uint64_t v100 = 2 * v96 + 2;
                  if (v100 < v95)
                  {
                    CMTimeEpoch v134 = *(void *)(v97 + 24 * v96 + 40);
                    v128.CMTimeEpoch epoch = *(void *)(v97 + 24 * v96 + 64);
                    *(_OWORD *)&v128.CMTimeValue value = *(_OWORD *)(v97 + 24 * v96 + 48);
                    *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)v98;
                    time1.CMTimeEpoch epoch = v134;
                    CMTime time2 = v128;
                    if (CMTimeCompare(&time1, &time2) < 0)
                    {
                      v98 += 24;
                      uint64_t v99 = v100;
                    }
                  }
                  long long v101 = *(_OWORD *)v98;
                  *(void *)(v97 + 16) = *(void *)(v98 + 16);
                  *(_OWORD *)uint64_t v97 = v101;
                  uint64_t v97 = v98;
                  uint64_t v96 = v99;
                }
                while (v99 <= (uint64_t)((unint64_t)(v95 - 2) >> 1));
                CGAffineTransform v102 = a2 - 1;
                BOOL v5 = v98 == (void)--a2;
                if (v5)
                {
                  *(void *)(v98 + 16) = v126;
                  *(_OWORD *)uint64_t v98 = v124;
                }
                else
                {
                  long long v103 = *(_OWORD *)&v102->value;
                  *(void *)(v98 + 16) = v102->epoch;
                  *(_OWORD *)uint64_t v98 = v103;
                  v102->CMTimeEpoch epoch = v126;
                  *(_OWORD *)&v102->CMTimeValue value = v124;
                  uint64_t v104 = v98 - (void)a1 + 24;
                  if (v104 >= 25)
                  {
                    unint64_t v105 = (v104 / 0x18uLL - 2) >> 1;
                    CMTime v106 = &a1[v105];
                    long long v107 = *(_OWORD *)&v106->value;
                    time1.CMTimeEpoch epoch = v106->epoch;
                    *(_OWORD *)&time1.CMTimeValue value = v107;
                    long long v108 = *(_OWORD *)v98;
                    time2.CMTimeEpoch epoch = *(void *)(v98 + 16);
                    *(_OWORD *)&time2.CMTimeValue value = v108;
                    if (CMTimeCompare(&time1, &time2) < 0)
                    {
                      v133.CMTimeEpoch epoch = *(void *)(v98 + 16);
                      *(_OWORD *)&v133.CMTimeValue value = *(_OWORD *)v98;
                      do
                      {
                        uint64_t v109 = (uint64_t)v106;
                        long long v110 = *(_OWORD *)&v106->value;
                        *(void *)(v98 + 16) = v106->epoch;
                        *(_OWORD *)uint64_t v98 = v110;
                        if (!v105) {
                          break;
                        }
                        unint64_t v105 = (v105 - 1) >> 1;
                        CMTime v106 = &a1[v105];
                        long long v111 = *(_OWORD *)&v106->value;
                        time1.CMTimeEpoch epoch = v106->epoch;
                        *(_OWORD *)&time1.CMTimeValue value = v111;
                        CMTime time2 = v133;
                        uint64_t v98 = v109;
                      }
                      while (CMTimeCompare(&time1, &time2) < 0);
                      *(void *)(v109 + 16) = v133.epoch;
                      *(_OWORD *)uint64_t v109 = *(_OWORD *)&v133.value;
                    }
                  }
                }
              }
              while (v95-- > 2);
            }
            return;
          }
          unint64_t v14 = (unint64_t)v13 >> 1;
          int v15 = &a1[(unint64_t)v13 >> 1];
          if ((unint64_t)v12 < 0xC01)
          {
            sub_1DD3D1F4C(v15, a1, v10);
          }
          else
          {
            sub_1DD3D1F4C(a1, v15, v10);
            uint64_t v16 = v14;
            sub_1DD3D1F4C(a1 + 1, &a1[v16 - 1], a2 - 2);
            sub_1DD3D1F4C(a1 + 2, &a1[v16 + 1], a2 - 3);
            sub_1DD3D1F4C(&a1[v16 - 1], v15, &a1[v16 + 1]);
            long long v17 = *(_OWORD *)&a1->value;
            time1.CMTimeEpoch epoch = a1->epoch;
            *(_OWORD *)&time1.CMTimeValue value = v17;
            CMTimeEpoch v18 = v15->epoch;
            *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&v15->value;
            a1->CMTimeEpoch epoch = v18;
            long long v19 = *(_OWORD *)&time1.value;
            v15->CMTimeEpoch epoch = time1.epoch;
            *(_OWORD *)&v15->CMTimeValue value = v19;
          }
          --a3;
          if (a4) {
            break;
          }
          CMTimeEpoch v121 = a1[-1].epoch;
          v120.CMTimeEpoch epoch = a1->epoch;
          *(_OWORD *)&v120.CMTimeValue value = *(_OWORD *)&a1->value;
          *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)&a1[-1].value;
          time1.CMTimeEpoch epoch = v121;
          CMTime time2 = v120;
          if (CMTimeCompare(&time1, &time2) < 0) {
            break;
          }
          v131.CMTimeEpoch epoch = a1->epoch;
          *(_OWORD *)&v131.CMTimeValue value = *(_OWORD *)&a1->value;
          long long v42 = *(_OWORD *)&a1->value;
          time1.CMTimeEpoch epoch = v131.epoch;
          *(_OWORD *)&time1.CMTimeValue value = v42;
          long long v43 = *(_OWORD *)&v10->value;
          time2.CMTimeEpoch epoch = a2[-1].epoch;
          *(_OWORD *)&time2.CMTimeValue value = v43;
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            long long v47 = a1;
            do
            {
              int v11 = v47 + 1;
              CMTime time1 = v131;
              long long v48 = *(_OWORD *)&v47[1].value;
              time2.CMTimeEpoch epoch = v47[1].epoch;
              *(_OWORD *)&time2.CMTimeValue value = v48;
              int32_t v49 = CMTimeCompare(&time1, &time2);
              long long v47 = v11;
            }
            while ((v49 & 0x80000000) == 0);
          }
          else
          {
            CMTime v44 = a1 + 1;
            do
            {
              int v11 = v44;
              if (v44 >= v9) {
                break;
              }
              CMTime time1 = v131;
              long long v45 = *(_OWORD *)&v44->value;
              time2.CMTimeEpoch epoch = v44->epoch;
              *(_OWORD *)&time2.CMTimeValue value = v45;
              int32_t v46 = CMTimeCompare(&time1, &time2);
              CMTime v44 = v11 + 1;
            }
            while ((v46 & 0x80000000) == 0);
          }
          float v50 = v9;
          if (v11 < v9)
          {
            CVImageBufferRef v51 = v9;
            do
            {
              float v50 = v51 - 1;
              CMTime time1 = v131;
              long long v52 = *(_OWORD *)&v51[-1].value;
              time2.CMTimeEpoch epoch = v51[-1].epoch;
              *(_OWORD *)&time2.CMTimeValue value = v52;
              int32_t v53 = CMTimeCompare(&time1, &time2);
              CVImageBufferRef v51 = v50;
            }
            while (v53 < 0);
          }
          while (v11 < v50)
          {
            long long v54 = *(_OWORD *)&v11->value;
            time1.CMTimeEpoch epoch = v11->epoch;
            *(_OWORD *)&time1.CMTimeValue value = v54;
            long long v55 = *(_OWORD *)&v50->value;
            v11->CMTimeEpoch epoch = v50->epoch;
            *(_OWORD *)&v11->CMTimeValue value = v55;
            long long v56 = *(_OWORD *)&time1.value;
            v50->CMTimeEpoch epoch = time1.epoch;
            *(_OWORD *)&v50->CMTimeValue value = v56;
            do
            {
              CMTime time1 = v131;
              long long v57 = *(_OWORD *)&v11[1].value;
              CMTimeEpoch v58 = v11[1].epoch;
              ++v11;
              time2.CMTimeEpoch epoch = v58;
              *(_OWORD *)&time2.CMTimeValue value = v57;
            }
            while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
            do
            {
              long long v59 = *(_OWORD *)&v50[-1].value;
              CMTimeEpoch v60 = v50[-1].epoch;
              --v50;
              CMTime time1 = v131;
              *(_OWORD *)&time2.CMTimeValue value = v59;
              time2.CMTimeEpoch epoch = v60;
            }
            while (CMTimeCompare(&time1, &time2) < 0);
          }
          int v61 = v11 - 1;
          BOOL v4 = &v11[-1] >= a1;
          BOOL v5 = &v11[-1] == a1;
          if (&v11[-1] != a1)
          {
            long long v62 = *(_OWORD *)&v61->value;
            a1->CMTimeEpoch epoch = v11[-1].epoch;
            *(_OWORD *)&a1->CMTimeValue value = v62;
          }
          a4 = 0;
          v11[-1].CMTimeEpoch epoch = v131.epoch;
          *(_OWORD *)&v61->CMTimeValue value = *(_OWORD *)&v131.value;
        }
        uint64_t v20 = 0;
        v130.CMTimeEpoch epoch = a1->epoch;
        *(_OWORD *)&v130.CMTimeValue value = *(_OWORD *)&a1->value;
        do
        {
          long long v21 = *(_OWORD *)&a1[v20 + 1].value;
          time1.CMTimeEpoch epoch = a1[v20 + 1].epoch;
          *(_OWORD *)&time1.CMTimeValue value = v21;
          CMTime time2 = v130;
          ++v20;
        }
        while (CMTimeCompare(&time1, &time2) < 0);
        uint64_t v22 = &a1[v20];
        float v23 = v9;
        if (v20 == 1)
        {
          int v27 = a2;
          while (v22 < v27)
          {
            uint64_t v24 = v27 - 1;
            long long v28 = *(_OWORD *)&v27[-1].value;
            time1.CMTimeEpoch epoch = v27[-1].epoch;
            *(_OWORD *)&time1.CMTimeValue value = v28;
            CMTime time2 = v130;
            int32_t v29 = CMTimeCompare(&time1, &time2);
            int v27 = v24;
            if (v29 < 0) {
              goto LABEL_21;
            }
          }
          uint64_t v24 = v27;
        }
        else
        {
          do
          {
            uint64_t v24 = v23 - 1;
            long long v25 = *(_OWORD *)&v23[-1].value;
            time1.CMTimeEpoch epoch = v23[-1].epoch;
            *(_OWORD *)&time1.CMTimeValue value = v25;
            CMTime time2 = v130;
            int32_t v26 = CMTimeCompare(&time1, &time2);
            float v23 = v24;
          }
          while ((v26 & 0x80000000) == 0);
        }
LABEL_21:
        if (v22 >= v24)
        {
          long long v39 = v22 - 1;
        }
        else
        {
          int v30 = &a1[v20];
          unint64_t v31 = (unint64_t)v24;
          do
          {
            long long v32 = *(_OWORD *)&v30->value;
            time1.CMTimeEpoch epoch = v30->epoch;
            *(_OWORD *)&time1.CMTimeValue value = v32;
            long long v33 = *(_OWORD *)v31;
            v30->CMTimeEpoch epoch = *(void *)(v31 + 16);
            *(_OWORD *)&v30->CMTimeValue value = v33;
            long long v34 = *(_OWORD *)&time1.value;
            *(void *)(v31 + 16) = time1.epoch;
            *(_OWORD *)unint64_t v31 = v34;
            do
            {
              long long v35 = *(_OWORD *)&v30[1].value;
              CMTimeEpoch v36 = v30[1].epoch;
              ++v30;
              time1.CMTimeEpoch epoch = v36;
              *(_OWORD *)&time1.CMTimeValue value = v35;
              CMTime time2 = v130;
            }
            while (CMTimeCompare(&time1, &time2) < 0);
            do
            {
              long long v37 = *(_OWORD *)(v31 - 24);
              CMTimeEpoch v38 = *(void *)(v31 - 8);
              v31 -= 24;
              CMTime time2 = v130;
              *(_OWORD *)&time1.CMTimeValue value = v37;
              time1.CMTimeEpoch epoch = v38;
            }
            while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
          }
          while ((unint64_t)v30 < v31);
          long long v39 = v30 - 1;
        }
        if (v39 != a1)
        {
          long long v40 = *(_OWORD *)&v39->value;
          a1->CMTimeEpoch epoch = v39->epoch;
          *(_OWORD *)&a1->CMTimeValue value = v40;
        }
        v39->CMTimeEpoch epoch = v130.epoch;
        *(_OWORD *)&v39->CMTimeValue value = *(_OWORD *)&v130.value;
        BOOL v4 = v22 >= v24;
        uint64_t v9 = a2;
        if (v4) {
          break;
        }
LABEL_35:
        sub_1DD3D11F0(a1, v39, a3, a4 & 1);
        a4 = 0;
        int v11 = v39 + 1;
      }
      BOOL v41 = sub_1DD3D2114(a1, v39);
      int v11 = v39 + 1;
      if (sub_1DD3D2114(v39 + 1, a2)) {
        break;
      }
      if (!v41) {
        goto LABEL_35;
      }
    }
    a2 = v39;
    if (!v41) {
      continue;
    }
    break;
  }
}

__n128 sub_1DD3D1DC0(CMTime *a1, CMTime *a2, CMTime *a3, CMTime *a4, CMTime *a5)
{
  sub_1DD3D2374(a1, a2, a3, a4);
  CMTime time1 = *a5;
  CMTime time2 = *a4;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    CMTimeEpoch epoch = a4->epoch;
    long long v12 = *(_OWORD *)&a4->value;
    CMTimeEpoch v13 = a5->epoch;
    *(_OWORD *)&a4->CMTimeValue value = *(_OWORD *)&a5->value;
    a4->CMTimeEpoch epoch = v13;
    *(_OWORD *)&a5->CMTimeValue value = v12;
    a5->CMTimeEpoch epoch = epoch;
    CMTime time1 = *a4;
    CMTime time2 = *a3;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTimeEpoch v14 = a3->epoch;
      long long v15 = *(_OWORD *)&a3->value;
      CMTimeEpoch v16 = a4->epoch;
      *(_OWORD *)&a3->CMTimeValue value = *(_OWORD *)&a4->value;
      a3->CMTimeEpoch epoch = v16;
      *(_OWORD *)&a4->CMTimeValue value = v15;
      a4->CMTimeEpoch epoch = v14;
      CMTime time1 = *a3;
      CMTime time2 = *a2;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        CMTimeEpoch v17 = a2->epoch;
        long long v18 = *(_OWORD *)&a2->value;
        CMTimeEpoch v19 = a3->epoch;
        *(_OWORD *)&a2->CMTimeValue value = *(_OWORD *)&a3->value;
        a2->CMTimeEpoch epoch = v19;
        *(_OWORD *)&a3->CMTimeValue value = v18;
        a3->CMTimeEpoch epoch = v17;
        CMTime time1 = *a2;
        CMTime time2 = *a1;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          CMTimeEpoch v20 = a1->epoch;
          __n128 result = *(__n128 *)&a1->value;
          CMTimeEpoch v21 = a2->epoch;
          *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a2->value;
          a1->CMTimeEpoch epoch = v21;
          *(__n128 *)&a2->CMTimeValue value = result;
          a2->CMTimeEpoch epoch = v20;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1DD3D1F4C(CMTime *a1, CMTime *a2, CMTime *a3)
{
  CMTime time1 = *a2;
  CMTime time2 = *a1;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    CMTime time1 = *a3;
    CMTime time2 = *a2;
    uint64_t result = CMTimeCompare(&time1, &time2);
    if ((result & 0x80000000) != 0)
    {
      CMTimeEpoch epoch = a1->epoch;
      long long v17 = *(_OWORD *)&a1->value;
      CMTimeEpoch v19 = a3->epoch;
      *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a3->value;
      a1->CMTimeEpoch epoch = v19;
    }
    else
    {
      CMTimeEpoch v13 = a1->epoch;
      long long v14 = *(_OWORD *)&a1->value;
      CMTimeEpoch v15 = a2->epoch;
      *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a2->value;
      a1->CMTimeEpoch epoch = v15;
      *(_OWORD *)&a2->CMTimeValue value = v14;
      a2->CMTimeEpoch epoch = v13;
      CMTime time1 = *a3;
      CMTime time2 = *a2;
      uint64_t result = CMTimeCompare(&time1, &time2);
      if ((result & 0x80000000) == 0) {
        return result;
      }
      CMTimeEpoch epoch = a2->epoch;
      long long v17 = *(_OWORD *)&a2->value;
      CMTimeEpoch v18 = a3->epoch;
      *(_OWORD *)&a2->CMTimeValue value = *(_OWORD *)&a3->value;
      a2->CMTimeEpoch epoch = v18;
    }
    *(_OWORD *)&a3->CMTimeValue value = v17;
    a3->CMTimeEpoch epoch = epoch;
  }
  else
  {
    CMTime time1 = *a3;
    CMTime time2 = *a2;
    uint64_t result = CMTimeCompare(&time1, &time2);
    if ((result & 0x80000000) != 0)
    {
      CMTimeEpoch v7 = a2->epoch;
      long long v8 = *(_OWORD *)&a2->value;
      CMTimeEpoch v9 = a3->epoch;
      *(_OWORD *)&a2->CMTimeValue value = *(_OWORD *)&a3->value;
      a2->CMTimeEpoch epoch = v9;
      *(_OWORD *)&a3->CMTimeValue value = v8;
      a3->CMTimeEpoch epoch = v7;
      CMTime time1 = *a2;
      CMTime time2 = *a1;
      uint64_t result = CMTimeCompare(&time1, &time2);
      if ((result & 0x80000000) != 0)
      {
        CMTimeEpoch v10 = a1->epoch;
        long long v11 = *(_OWORD *)&a1->value;
        CMTimeEpoch v12 = a2->epoch;
        *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a2->value;
        a1->CMTimeEpoch epoch = v12;
        *(_OWORD *)&a2->CMTimeValue value = v11;
        a2->CMTimeEpoch epoch = v10;
      }
    }
  }
  return result;
}

BOOL sub_1DD3D2114(CMTime *a1, CMTime *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      CMTime time1 = a2[-1];
      CMTime time2 = *a1;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        uint64_t v6 = a2 - 1;
        CMTimeEpoch epoch = a1->epoch;
        long long v8 = *(_OWORD *)&a1->value;
        CMTimeEpoch v9 = a2[-1].epoch;
        *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a2[-1].value;
        a1->CMTimeEpoch epoch = v9;
        *(_OWORD *)&v6->CMTimeValue value = v8;
        v6->CMTimeEpoch epoch = epoch;
      }
      return 1;
    case 3uLL:
      sub_1DD3D1F4C(a1, a1 + 1, a2 - 1);
      return 1;
    case 4uLL:
      sub_1DD3D2374(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5uLL:
      sub_1DD3D1DC0(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      CMTimeEpoch v10 = a1 + 2;
      sub_1DD3D1F4C(a1, a1 + 1, a1 + 2);
      long long v11 = a1 + 3;
      if (&a1[3] == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    CMTimeEpoch v14 = v10->epoch;
    long long v21 = *(_OWORD *)&v10->value;
    CMTime time1 = *v11;
    *(_OWORD *)&time2.CMTimeValue value = v21;
    time2.CMTimeEpoch epoch = v14;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      *(_OWORD *)&v20.CMTimeValue value = *(_OWORD *)&v11->value;
      v20.CMTimeEpoch epoch = v11->epoch;
      uint64_t v15 = v12;
      while (1)
      {
        CMTimeEpoch v16 = (char *)a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)((char *)&a1[2].value + v15);
        *((void *)v16 + 11) = *(CMTimeEpoch *)((char *)&a1[2].epoch + v15);
        if (v15 == -48) {
          break;
        }
        long long v17 = *(_OWORD *)(v16 + 24);
        CMTimeEpoch v19 = *((void *)v16 + 5);
        CMTime time1 = v20;
        *(_OWORD *)&time2.CMTimeValue value = v17;
        time2.CMTimeEpoch epoch = v19;
        v15 -= 24;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          uint64_t v18 = (uint64_t)&a1[3] + v15;
          goto LABEL_12;
        }
      }
      uint64_t v18 = (uint64_t)a1;
LABEL_12:
      *(_OWORD *)uint64_t v18 = *(_OWORD *)&v20.value;
      *(void *)(v18 + 16) = v20.epoch;
      if (++v13 == 8) {
        return &v11[1] == a2;
      }
    }
    CMTimeEpoch v10 = v11;
    v12 += 24;
    if (++v11 == a2) {
      return 1;
    }
  }
}

__n128 sub_1DD3D2374(CMTime *a1, CMTime *a2, CMTime *a3, CMTime *a4)
{
  sub_1DD3D1F4C(a1, a2, a3);
  CMTime time1 = *a4;
  CMTime time2 = *a3;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    CMTimeEpoch epoch = a3->epoch;
    long long v10 = *(_OWORD *)&a3->value;
    CMTimeEpoch v11 = a4->epoch;
    *(_OWORD *)&a3->CMTimeValue value = *(_OWORD *)&a4->value;
    a3->CMTimeEpoch epoch = v11;
    *(_OWORD *)&a4->CMTimeValue value = v10;
    a4->CMTimeEpoch epoch = epoch;
    CMTime time1 = *a3;
    CMTime time2 = *a2;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTimeEpoch v12 = a2->epoch;
      long long v13 = *(_OWORD *)&a2->value;
      CMTimeEpoch v14 = a3->epoch;
      *(_OWORD *)&a2->CMTimeValue value = *(_OWORD *)&a3->value;
      a2->CMTimeEpoch epoch = v14;
      *(_OWORD *)&a3->CMTimeValue value = v13;
      a3->CMTimeEpoch epoch = v12;
      CMTime time1 = *a2;
      CMTime time2 = *a1;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        CMTimeEpoch v15 = a1->epoch;
        __n128 result = *(__n128 *)&a1->value;
        CMTimeEpoch v16 = a2->epoch;
        *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a2->value;
        a1->CMTimeEpoch epoch = v16;
        *(__n128 *)&a2->CMTimeValue value = result;
        a2->CMTimeEpoch epoch = v15;
      }
    }
  }
  return result;
}

uint64_t *sub_1DD3D24A4(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unsigned __int8 v6 = 0;
  sub_1DD3D2C34(__p, a3, &v6);
  sub_1DD3D2E6C(&v8, a2, (uint64_t)__p);
  sub_1DD3D309C(a1);
  *(_OWORD *)a1 = v8;
  a1[2] = v9;
  uint64_t v9 = 0;
  long long v8 = 0uLL;
  long long v10 = (void **)&v8;
  sub_1DD3B17A8(&v10);
  if (__p[0]) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_1DD3D253C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  sub_1DD3B17A8((void ***)&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D256C(void *a1)
{
  return -1431655765 * ((a1[1] - *a1) >> 3);
}

uint64_t sub_1DD3D2588(void *a1)
{
  if (a1[1] == *a1) {
    return 0;
  }
  else {
    return *(unsigned int *)(*a1 + 8);
  }
}

void sub_1DD3D25A4()
{
}

void sub_1DD3D2750()
{
}

uint64_t sub_1DD3D2900(uint64_t *a1, unsigned int a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v4 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3) <= a2 || *(void *)(v4 + 24 * a2 + 8) <= (unint64_t)a3)
  {
    uint64_t result = 0;
    *a4 = 1;
  }
  else
  {
    uint64_t result = 0;
    *a4 = 0;
    uint64_t v6 = *(void *)(v4 + 24 * a2);
    unint64_t v7 = (unint64_t)a3 >> 6;
    uint64_t v8 = *(void *)(v6 + 8 * v7);
    if ((v8 & (1 << a3)) == 0)
    {
      *(void *)(v6 + 8 * v7) = v8 | (1 << a3);
      return 1;
    }
  }
  return result;
}

void sub_1DD3D298C()
{
}

BOOL sub_1DD3D2ADC(uint64_t *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) / 24;
  if (v4 == *a1)
  {
    BOOL v8 = 0;
    LODWORD(v10) = 0;
    *a2 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    if (v5 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = (v4 - *a1) / 24;
    }
    BOOL v8 = 1;
    while (1)
    {
      uint64_t v9 = *(void *)(v3 + 24 * v6 + 8);
      if (v9) {
        break;
      }
LABEL_10:
      BOOL v8 = v5 > ++v6;
      if (v6 == v7)
      {
        *a2 = v5;
        BOOL v8 = 0;
        if (v4 == v3) {
          LODWORD(v10) = 0;
        }
        else {
          LODWORD(v10) = *(_DWORD *)(v3 + 8);
        }
        goto LABEL_15;
      }
    }
    unint64_t v10 = 0;
    while (((*(void *)(*(void *)(v3 + 24 * v6) + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    {
      if (v9 == ++v10) {
        goto LABEL_10;
      }
    }
    *a2 = v6;
  }
LABEL_15:
  *a3 = v10;
  return v8;
}

BOOL sub_1DD3D2BA4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = v1 - *a1;
  if (v1 == *a1)
  {
    return 1;
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v5 = 0;
    unint64_t v6 = v3 / 24;
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    while (1)
    {
      uint64_t v8 = *(void *)(v2 + 24 * v4 + 8);
      if (v8) {
        break;
      }
LABEL_9:
      BOOL v5 = v6 <= ++v4;
      if (v4 == v7) {
        return 1;
      }
    }
    unint64_t v9 = 0;
    while (((*(void *)(*(void *)(v2 + 24 * v4) + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
    {
      if (v8 == ++v9) {
        goto LABEL_9;
      }
    }
  }
  return v5;
}

void *sub_1DD3D2C34(void *a1, unint64_t a2, unsigned __int8 *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3D0FA4(a1, a2);
    int v6 = *a3;
    unint64_t v7 = a1[1];
    unint64_t v8 = v7 + a2;
    a1[1] = v7 + a2;
    if (v7)
    {
      unint64_t v9 = v8 - 1;
      if (((v8 - 1) ^ (v7 - 1)) < 0x40)
      {
LABEL_10:
        uint64_t v13 = *a1 + 8 * (v7 >> 6);
        int v14 = v7 & 0x3F;
        if (v6) {
          sub_1DD3D2D08(&v13, a2);
        }
        else {
          sub_1DD3D2DBC((uint64_t)&v13, a2);
        }
        return a1;
      }
    }
    else
    {
      unint64_t v9 = v8 - 1;
    }
    unint64_t v10 = v9 >> 6;
    if (v8 >= 0x41) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0;
    }
    *(void *)(*a1 + 8 * v11) = 0;
    goto LABEL_10;
  }
  return a1;
}

void *sub_1DD3D2D08(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  int v4 = *((_DWORD *)result + 2);
  BOOL v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    *uint64_t result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    uint64_t result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    unint64_t v8 = &v5[v7];
    *uint64_t v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void sub_1DD3D2DBC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  BOOL v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    unint64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void *sub_1DD3D2E6C(void *a1, unint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B197C(a1, a2);
    unint64_t v6 = (void *)a1[1];
    uint64_t v7 = 3 * a2;
    unint64_t v8 = &v6[3 * a2];
    uint64_t v9 = 8 * v7;
    do
    {
      sub_1DD3D2F18(v6, a3);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1DD3D2EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void *sub_1DD3D2F18(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    sub_1DD3D0FA4(a1, v4);
    sub_1DD3D2F74(a1, *(void **)a2, 0, (void *)(*(void *)a2 + 8 * (*(void *)(a2 + 8) >> 6)), *(void *)(a2 + 8) & 0x3F, *(void *)(a2 + 8));
  }
  return a1;
}

void sub_1DD3D2F74(void *a1, void *a2, unint64_t a3, void *a4, int a5, uint64_t a6)
{
  unint64_t v6 = a1[1];
  unint64_t v7 = v6 + a6;
  a1[1] = v6 + a6;
  if (!v6 || ((v7 - 1) ^ (v6 - 1)) >= 0x40)
  {
    if (v7 >= 0x41) {
      unint64_t v8 = (v7 - 1) >> 6;
    }
    else {
      unint64_t v8 = 0;
    }
    *(void *)(*a1 + 8 * v8) = 0;
  }
  uint64_t v9 = *a1 + 8 * (v6 >> 6);
  int v10 = v6 & 0x3F;
  sub_1DD3D2FF4(a2, a3, a4, a5, (uint64_t)&v9, (uint64_t)v11);
}

void sub_1DD3D2FF4(void *a1@<X1>, unint64_t a2@<X2>, void *a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  LODWORD(v6) = a2;
  unint64_t v7 = *(uint64_t **)a5;
  int v8 = *(_DWORD *)(a5 + 8);
  if (a1 != a3 || a2 != a4)
  {
    do
    {
      uint64_t v9 = 1 << v8;
      if ((*a1 >> a2)) {
        uint64_t v10 = *v7 | v9;
      }
      else {
        uint64_t v10 = *v7 & ~v9;
      }
      *unint64_t v7 = v10;
      BOOL v11 = v6 == 63;
      BOOL v12 = v6 == 63;
      uint64_t v6 = (a2 + 1);
      if (v11) {
        uint64_t v6 = 0;
      }
      if (v8 == 63)
      {
        int v8 = 0;
        *(void *)a5 = ++v7;
      }
      else
      {
        ++v8;
      }
      a1 += v12;
      a2 = v6 | a2 & 0xFFFFFFFF00000000;
      *(_DWORD *)(a5 + 8) = v8;
    }
    while (a1 != a3 || v6 != a4);
    a1 = a3;
  }
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = v7;
  *(_DWORD *)(a6 + 24) = v8;
}

void sub_1DD3D309C(uint64_t *a1)
{
  if (*a1)
  {
    sub_1DD3B17FC(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void *sub_1DD3D30D8(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_1DD3B2EB0(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DD3D3138(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1DD3D3154(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = *(void **)v2;
    if (*(void *)v2)
    {
      *(void *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1E01B4150](v2, 0x80C40D6874129);
    *a1 = 0;
  }
  uint64_t v4 = a1[1];
  if (v4)
  {
    BOOL v5 = *(void **)v4;
    if (*(void *)v4)
    {
      *(void *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x1E01B4150](v4, 0x80C40D6874129);
    a1[1] = 0;
  }
  uint64_t v6 = a1[2];
  if (v6)
  {
    uint64_t v7 = *(void **)v6;
    if (*(void *)v6)
    {
      *(void *)(v6 + 8) = v7;
      operator delete(v7);
    }
    MEMORY[0x1E01B4150](v6, 0x80C40D6874129);
    a1[2] = 0;
  }
  uint64_t v8 = a1[3];
  if (v8)
  {
    uint64_t v9 = *(void **)v8;
    if (*(void *)v8)
    {
      *(void *)(v8 + 8) = v9;
      operator delete(v9);
    }
    MEMORY[0x1E01B4150](v8, 0x80C40D6874129);
    a1[3] = 0;
  }
  uint64_t v10 = a1[4];
  if (v10)
  {
    BOOL v11 = *(void **)v10;
    if (*(void *)v10)
    {
      *(void *)(v10 + 8) = v11;
      operator delete(v11);
    }
    MEMORY[0x1E01B4150](v10, 0x80C40D6874129);
    a1[4] = 0;
  }
  return a1;
}

void *sub_1DD3D3280(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  result[1] = 0;
  return result;
}

uint64_t sub_1DD3D3288(uint64_t a1)
{
  if (*(void *)(a1 + 8))
  {
    uint64_t v2 = sub_1DD3B3154();
    MEMORY[0x1E01B4150](v2, 0x1030C40523CC803);
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

uint64_t sub_1DD3D32D4(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(*(void *)a1 + 8) + 24);
}

uint64_t sub_1DD3D32E4(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(*(void *)a1 + 8) + 28);
}

uint64_t sub_1DD3D32F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    sub_1DD3B2C64();
  }
  return result;
}

void sub_1DD3D3330(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a1;
  float v23 = 0;
  uint64_t v24 = 0;
  uint64_t v22 = 0;
  sub_1DD3B1900(&v22, *(const void **)(v7 + 8), *(void *)(v7 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v7 + 16) - *(void *)(v7 + 8)) >> 3));
  unsigned int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 16))(v7, a2);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 16))(v7, a3);
  uint64_t v10 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)a4 = *MEMORY[0x1E4F1FA48];
  *(void *)(a4 + 16) = *(void *)(v10 + 16);
  if (v9)
  {
    uint64_t v11 = (v9 - 1);
    if (v8 < v11)
    {
      uint64_t v12 = 24 * v8;
      uint64_t v13 = v11 - v8;
      do
      {
        CMTimeEpoch v14 = *(void *)&v22[v12 + 40];
        *(_OWORD *)&lhs.CMTimeValue value = *(_OWORD *)&v22[v12 + 24];
        lhs.CMTimeEpoch epoch = v14;
        CMTimeEpoch v15 = *(void *)&v22[v12 + 16];
        *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)&v22[v12];
        rhs.CMTimeEpoch epoch = v15;
        CMTimeSubtract(&v20, &lhs, &rhs);
        CMTime v21 = v20;
        CMTime time1 = v20;
        CMTime v16 = *(CMTime *)a4;
        if (CMTimeCompare(&time1, &v16) >= 1) {
          *(CMTime *)a4 = v21;
        }
        v12 += 24;
        --v13;
      }
      while (v13);
    }
  }
  if (v22)
  {
    float v23 = v22;
    operator delete(v22);
  }
}

void sub_1DD3D34C8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 - 56);
  if (v3)
  {
    *(void *)(v1 - 48) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1DD3D34F0@<Q0>(uint64_t **a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *a1;
  if (v3)
  {
    sub_1DD3D3330(v3, *a2, a2[1] + *a2 + a2[2], a3);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1F9F8];
    __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a3 + 16) = *(void *)(v5 + 16);
  }
  return result;
}

void sub_1DD3D352C()
{
}

void sub_1DD3D35C4(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x80C40D6874129);
  _Unwind_Resume(a1);
}

void sub_1DD3D35E8()
{
}

void sub_1DD3D3684(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x80C40D6874129);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D36A8(void *a1)
{
  if (*a1)
  {
    if (!a1[1]) {
      operator new();
    }
    operator new();
  }
  return 0;
}

void sub_1DD3D38AC(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x1030C40523CC803);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D38EC(void *a1, uint64_t *a2, int *a3, void *a4)
{
  sub_1DD3D3A34((uint64_t)a4, (a2[1] - *a2) >> 3);
  uint64_t v8 = a1[1];
  if (!v8)
  {
    if (*a1) {
      operator new();
    }
    goto LABEL_8;
  }
  sub_1DD3B3158(v8, *a3, a3[1] + *a3 + a3[2]);
  uint64_t v9 = *a2;
  if (a2[1] == *a2)
  {
LABEL_8:
    char v13 = 0;
    return v13 & 1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  char v13 = 0;
  do
  {
    sub_1DD3B3214(a1[1], *(unsigned __int8 *)(v9 + v11), *(float *)(v9 + v11 + 4));
    v13 |= v14;
    CMTimeEpoch v15 = (long long *)a1[1];
    CMTime v16 = (_OWORD *)(*a4 + v10);
    long long v17 = *v15;
    *(_OWORD *)((char *)v16 + 12) = *(long long *)((char *)v15 + 12);
    *CMTime v16 = v17;
    ++v12;
    uint64_t v9 = *a2;
    v11 += 8;
    v10 += 28;
  }
  while (v12 < (a2[1] - *a2) >> 3);
  return v13 & 1;
}

void sub_1DD3D3A10(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x1030C40523CC803);
  _Unwind_Resume(a1);
}

void sub_1DD3D3A34(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1DD3D3A78((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 28 * a2;
  }
}

void sub_1DD3D3A78(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      size_t v13 = 28 * ((28 * a2 - 28) / 0x1C) + 28;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = 0x6DB6DB6DB6DB6DB7 * ((v7 - (unsigned char *)*a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x924924924924924) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0x6DB6DB6DB6DB6DB7 * ((v5 - (unsigned char *)*a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x492492492492492) {
      unint64_t v11 = 0x924924924924924;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)sub_1DD3D3C48(v4, v11);
    }
    else {
      unint64_t v12 = 0;
    }
    char v14 = &v12[28 * v8];
    CMTimeEpoch v15 = &v12[28 * v11];
    size_t v16 = 28 * ((28 * a2 - 28) / 0x1C) + 28;
    bzero(v14, v16);
    long long v17 = &v14[v16];
    CMTimeEpoch v19 = (char *)*a1;
    uint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 28);
        *((_OWORD *)v14 - 1) = *((_OWORD *)v18 - 1);
        *(_OWORD *)(v14 - 28) = v20;
        v14 -= 28;
        v18 -= 28;
      }
      while (v18 != v19);
      uint64_t v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void *sub_1DD3D3C48(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x924924924924925) {
    sub_1DD3A9C40();
  }
  return operator new(28 * a2);
}

uint64_t sub_1DD3D3C94(uint64_t *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = (_DWORD *)sub_1DD3DB26C(a1[1], 0);
  int v9 = *v8;
  int v10 = v8[1];
  float v23 = v8;
  int v11 = v8[4];
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)*a1 + 16))(*a1, a2);
  int v24 = v10;
  if (v10)
  {
    unsigned int v13 = 0;
    int v14 = 0;
    uint64_t v15 = (v11 * v9);
    uint64_t v22 = *(void *)(a1[1] + 184) + (*(_DWORD *)(a1[1] + 192) * result);
    do
    {
      if (v15)
      {
        size_t v16 = (unsigned __int8 *)(v22 + (v23[2] * v14));
        uint64_t v17 = v15;
        unsigned int v18 = v13;
        do
        {
          unsigned int v19 = *v16++;
          uint64_t result = v19;
          if (*(_DWORD *)(a1[1] + 64) == 875704438) {
            uint64_t result = sub_1DD3D424C(result);
          }
          unsigned int v20 = *(unsigned __int8 *)(*a3 + v18);
          if (result < v20) {
            LOBYTE(v20) = result;
          }
          *(unsigned char *)(*a3 + v18) = v20;
          unsigned int v21 = *(unsigned __int8 *)(*a4 + v18);
          if (result > v21) {
            LOBYTE(v21) = result;
          }
          *(unsigned char *)(*a4 + v18++) = v21;
          --v17;
        }
        while (v17);
      }
      ++v14;
      v13 += v15;
    }
    while (v14 != v24);
  }
  return result;
}

uint64_t sub_1DD3D3DDC(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4, void *a5, void *a6)
{
  if (a2 < a4)
  {
    uint64_t v9 = a2;
    int v10 = (uint64_t *)result;
    do
    {
      uint64_t result = sub_1DD3D3C94(v10, v9, a5, a6);
      uint64_t v9 = (v9 + 1);
    }
    while (a4 != v9);
  }
  return result;
}

void sub_1DD3D3E48(uint64_t *a1, uint64_t a2, unsigned int a3, unint64_t *a4, unint64_t *a5)
{
  if (a3 >= a2)
  {
    uint64_t v44 = v5;
    uint64_t v45 = v6;
    unint64_t v12 = (_DWORD *)sub_1DD3DB26C(a1[1], 0);
    int v13 = v12[1];
    uint64_t v14 = (v12[4] * *v12);
    unint64_t v15 = (v14 * v13);
    unint64_t v16 = a4[1] - *a4;
    if (v15 <= v16)
    {
      if (v15 < v16) {
        a4[1] = *a4 + v15;
      }
    }
    else
    {
      sub_1DD3B353C(a4, v15 - v16);
    }
    unint64_t v17 = a5[1] - *a5;
    if (v15 <= v17)
    {
      if (v15 < v17) {
        a5[1] = *a5 + v15;
      }
    }
    else
    {
      sub_1DD3B353C(a5, v15 - v17);
    }
    int v18 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)*a1 + 16))(*a1, a2);
    if (v13)
    {
      unsigned int v19 = 0;
      int v20 = 0;
      uint64_t v21 = *(void *)(a1[1] + 184) + (*(_DWORD *)(a1[1] + 192) * v18);
      do
      {
        if (v14)
        {
          uint64_t v22 = (char *)(v21 + (v12[2] * v20));
          uint64_t v23 = v14;
          unsigned int v24 = v19;
          do
          {
            *(unsigned char *)(*a4 + v24) = *v22;
            char v25 = *v22++;
            *(unsigned char *)(*a5 + v24++) = v25;
            --v23;
          }
          while (v23);
        }
        ++v20;
        v19 += v14;
      }
      while (v20 != v13);
    }
    int v26 = a3 - a2;
    if (v26)
    {
      for (int i = 0; i != v26; ++i)
      {
        int v28 = (*(uint64_t (**)(uint64_t, void))(*(void *)*a1 + 16))(*a1, (i + a2));
        if (v13)
        {
          unsigned int v29 = 0;
          int v30 = 0;
          uint64_t v31 = *(void *)(a1[1] + 184) + (*(_DWORD *)(a1[1] + 192) * v28);
          do
          {
            if (v14)
            {
              long long v32 = (unsigned __int8 *)(v31 + (v12[2] * v30));
              uint64_t v33 = v14;
              unsigned int v34 = v29;
              do
              {
                unsigned int v36 = *v32++;
                unsigned int v35 = v36;
                unsigned int v37 = *(unsigned __int8 *)(*a4 + v34);
                if (v36 < v37) {
                  LOBYTE(v37) = v35;
                }
                *(unsigned char *)(*a4 + v34) = v37;
                if (v35 <= *(unsigned __int8 *)(*a5 + v34)) {
                  LOBYTE(v35) = *(unsigned char *)(*a5 + v34);
                }
                *(unsigned char *)(*a5 + v34++) = v35;
                --v33;
              }
              while (v33);
            }
            ++v30;
            v29 += v14;
          }
          while (v30 != v13);
        }
      }
    }
    if (*(_DWORD *)(a1[1] + 64) == 875704438)
    {
      int v42 = 0;
      int v43 = 1065353216;
      sub_1DD3D41A0(0, (float *)&v43, (float *)&v42);
      if (v13)
      {
        unsigned int v38 = 0;
        for (int j = 0; j != v13; ++j)
        {
          uint64_t v40 = v14;
          unsigned int v41 = v38;
          if (v14)
          {
            do
            {
              *(unsigned char *)(*a4 + v41) = sub_1DD3D424C(*(unsigned __int8 *)(*a4 + v41));
              *(unsigned char *)(*a5 + v41) = sub_1DD3D424C(*(unsigned __int8 *)(*a5 + v41));
              ++v41;
              --v40;
            }
            while (v40);
          }
          v38 += v14;
        }
      }
    }
  }
}

float sub_1DD3D4104(unsigned int a1)
{
  uint64_t v5 = 0;
  sub_1DD3DAA10(875704422, a1, (unsigned int *)&v5 + 1, (int *)&v5);
  uint64_t v4 = 0;
  int v2 = sub_1DD3DAA10(875704438, a1, (unsigned int *)&v4 + 1, (int *)&v4);
  float result = 1.0;
  if (!v2)
  {
    float result = (float)((float)v5 - (float)HIDWORD(v5))
           / (float)((float)v4 - (float)HIDWORD(v4));
    if (result < 0.0) {
      return -result;
    }
  }
  return result;
}

float sub_1DD3D41A0(unsigned int a1, float *a2, float *a3)
{
  uint64_t v13 = 0;
  sub_1DD3DAA10(875704422, a1, (unsigned int *)&v13 + 1, (int *)&v13);
  uint64_t v12 = 0;
  sub_1DD3DAA10(875704438, a1, (unsigned int *)&v12 + 1, (int *)&v12);
  float v6 = (float)HIDWORD(v12);
  float v7 = (float)v12;
  float v8 = (float)HIDWORD(v13);
  float v9 = (float)v13;
  float v10 = (float)v13 - (float)HIDWORD(v13);
  *a2 = v10 / (float)((float)v12 - (float)HIDWORD(v12));
  float result = (float)((float)(v8 * v7) - (float)(v6 * v9)) / v10;
  *a3 = result;
  return result;
}

uint64_t sub_1DD3D424C(int a1)
{
  return byte_1DD3E84F4[a1];
}

uint64_t sub_1DD3D425C(int a1)
{
  if (qword_1EBE9D700 != -1) {
    dispatch_once(&qword_1EBE9D700, &unk_1F3891FD8);
  }
  return qword_1EBE9D6F0[a1];
}

os_log_t sub_1DD3D42B0()
{
  qword_1EBE9D6F0[0] = (uint64_t)os_log_create("com.apple.AutoLoop", "unspecified");
  os_log_t result = os_log_create("com.apple.AutoLoop", "PointsOfInterest");
  qword_1EBE9D6F8 = (uint64_t)result;
  return result;
}

uint64_t sub_1DD3D4304(long long *a1, unsigned int a2, uint64_t a3)
{
  if ((*((_DWORD *)a1 + 3) & 0x1D) != 1) {
    return 0xFFFFFFFFLL;
  }
  long long v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t result = (*(uint64_t (**)(uint64_t, long long *))(*(void *)a3 + 40))(a3, &v5);
  if (result >= a2)
  {
    printf("WARNING: set_loopParamConfigOptions requested ref frame index %d for num_frames %d, setting ref frame to %d.\n", result, a2, a2 - 1);
    return a2 - 1;
  }
  return result;
}

uint64_t sub_1DD3D43A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unsigned int v11 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  long long v56 = *(_OWORD *)(a3 + 72);
  uint64_t v57 = *(void *)(a3 + 88);
  unsigned int v12 = sub_1DD3DD64C(a1, (uint64_t)&v56);
  long long v54 = *(_OWORD *)(a3 + 24);
  uint64_t v55 = *(void *)(a3 + 40);
  int v44 = sub_1DD3DD64C(a1, (uint64_t)&v54);
  long long v52 = *(_OWORD *)(a3 + 48);
  uint64_t v53 = *(void *)(a3 + 64);
  int v43 = sub_1DD3DD64C(a1, (uint64_t)&v52);
  long long v50 = *(_OWORD *)a4;
  uint64_t v51 = *(void *)(a4 + 16);
  int v13 = sub_1DD3D4304(&v50, v11, a1);
  long long v48 = *(_OWORD *)a5;
  uint64_t v49 = *(void *)(a5 + 16);
  int v14 = sub_1DD3D4304(&v48, v11, a1);
  long long v15 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)a5;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v15;
  *(_OWORD *)&range.duration.int32_t timescale = *(_OWORD *)(a5 + 32);
  CMTimeRangeGetEnd(&v47, &range);
  int v16 = sub_1DD3D4304((long long *)&v47.value, v11, a1);
  int v17 = v16;
  BOOL v18 = v13 == -1;
  if (v14 < v13 || v13 == -1) {
    int v20 = v14;
  }
  else {
    int v20 = v13;
  }
  if (v14 == -1) {
    int v21 = v13;
  }
  else {
    int v21 = v20;
  }
  if (v16 > v13) {
    BOOL v18 = 1;
  }
  if (v18) {
    int v22 = v16;
  }
  else {
    int v22 = v13;
  }
  if (v16 == -1) {
    int v23 = v13;
  }
  else {
    int v23 = v22;
  }
  unsigned int v24 = operator new(0xCuLL);
  char v25 = v24;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  *unsigned int v24 = v13;
  v24[1] = v14;
  v24[2] = v17;
  BOOL v29 = v21 == -1 || v23 == -1;
  do
  {
    int v30 = v24[v26];
    if (v30 != -1)
    {
      int v31 = v30 < v21 || v29;
      if (v30 > v23) {
        int v32 = 1;
      }
      else {
        int v32 = v31;
      }
      if (v32) {
        uint64_t v27 = 21;
      }
      else {
        uint64_t v27 = v27;
      }
    }
    ++v26;
  }
  while (v26 != 3);
  if (v21 != -1)
  {
    unsigned int v33 = v11 + ~v21;
    int v34 = 2 * v21;
    if (v12 >= v33) {
      unsigned int v35 = v11 + ~v21;
    }
    else {
      unsigned int v35 = v12;
    }
    if (v35 < 2 * v21) {
      int v34 = v35;
    }
    if (v35 > 2 * v21 || v12 > v33) {
      unsigned int v12 = v34;
    }
  }
  unsigned int v37 = v11 + ~v23;
  int v38 = 2 * v23;
  if (v12 >= v37) {
    unsigned int v39 = v11 + ~v23;
  }
  else {
    unsigned int v39 = v12;
  }
  if (v39 < 2 * v23) {
    int v38 = v39;
  }
  if (v39 > 2 * v23 || v12 > v37) {
    unsigned int v41 = v38;
  }
  else {
    unsigned int v41 = v12;
  }
  if (v23 == -1) {
    unsigned int v41 = v12;
  }
  *(_DWORD *)a2 = v11;
  *(_DWORD *)(a2 + 4) = v41;
  *(_DWORD *)(a2 + 8) = v44;
  *(_DWORD *)(a2 + 12) = v43 + 1;
  *(_DWORD *)(a2 + 16) = v21;
  *(_DWORD *)(a2 + 20) = v23;
  *(unsigned char *)(a2 + 24) = v41 < a6;
  if (!v27)
  {
    if (sub_1DD3D463C(a2)) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = 21;
    }
  }
  operator delete(v25);
  return v27;
}

BOOL sub_1DD3D463C(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 4);
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)a1;
  if (v1 + v2 > *(_DWORD *)a1 || v2 > *(_DWORD *)(a1 + 12)) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 16);
  int v5 = *(_DWORD *)(a1 + 20);
  if (v6 != -1 && v6 > v5) {
    return 0;
  }
  if (v5 != -1 && v3 <= v5) {
    return 0;
  }
  BOOL result = 0;
  BOOL v10 = (v1 | *(unsigned __int8 *)(a1 + 24)) == 0;
  if (v1 <= v2 && v2 <= v3 && !v10) {
    return (v3 < 2 || v1 <= v3 >> 1)
  }
        && (v6 == -1 || v3 - v6 > v1 && (double)v1 * 0.5 <= (double)v6)
        && (v5 == -1 || v3 - v5 > v1 && (double)v1 * 0.5 <= (double)v5);
  return result;
}

float sub_1DD3D4720(_DWORD *a1)
{
  float result = 1.0;
  if (*a1 >= a1[3]) {
    return (float)a1[2];
  }
  return result;
}

uint64_t sub_1DD3D4740(unsigned int *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v5 = a3 + a2;
  if (a1[4] >= a2)
  {
    unsigned int v7 = a1[5];
    BOOL v6 = v7 != -1 && v7 >= v5;
  }
  else
  {
    BOOL v6 = 1;
  }
  unsigned int v9 = v5 + a4;
  unsigned int v10 = *a1;
  BOOL v11 = (a5 & 1) == 0 && a1[1] != a4;
  BOOL v14 = a1[2] > a3 || a1[3] < a3 || a4 > a3;
  BOOL v15 = v9 > v10;
  int v16 = v9 > v10 || v14;
  int v17 = v16 | v6;
  if (v15) {
    LODWORD(v18) = 2;
  }
  else {
    LODWORD(v18) = 3;
  }
  if (v14) {
    LODWORD(v18) = 1;
  }
  if (v17) {
    uint64_t v18 = v18;
  }
  else {
    uint64_t v18 = 5;
  }
  if ((v17 & 1) == 0 && !v11)
  {
    if (a4) {
      int v19 = 1;
    }
    else {
      int v19 = a5;
    }
    if (a1[1]) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    if (v19) {
      unsigned int v21 = 5;
    }
    else {
      unsigned int v21 = 4;
    }
    if (*((unsigned char *)a1 + 24)) {
      int v22 = 1;
    }
    else {
      int v22 = v20;
    }
    if (v22) {
      return 0;
    }
    else {
      return v21;
    }
  }
  return v18;
}

void sub_1DD3D4808()
{
}

void sub_1DD3D49FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3D4A50()
{
}

void sub_1DD3D4BE4(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x20C40960023A9);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D4C08(unsigned int *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v5 = a3 + a2;
  if (a1[4] >= a2)
  {
    unsigned int v7 = a1[5];
    BOOL v6 = v7 != -1 && v7 >= v5;
  }
  else
  {
    BOOL v6 = 1;
  }
  unsigned int v9 = *a1;
  unsigned int v10 = v5 + (a4 >> 1);
  BOOL v11 = (a5 & 1) == 0 && a1[1] != a4;
  BOOL v14 = a1[2] > a3 || a1[3] < a3 || a4 >> 1 > a3;
  int v15 = v10 > v9 || v14;
  int v16 = v15 | v6;
  if (v10 > v9) {
    LODWORD(v17) = 2;
  }
  else {
    LODWORD(v17) = 3;
  }
  if (v14) {
    LODWORD(v17) = 1;
  }
  if (v16) {
    uint64_t v17 = v17;
  }
  else {
    uint64_t v17 = 5;
  }
  if ((v16 & 1) == 0 && !v11)
  {
    if (a4 > 1) {
      int v18 = 1;
    }
    else {
      int v18 = a5;
    }
    if (a1[1] > 1) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    if (v18) {
      unsigned int v20 = 5;
    }
    else {
      unsigned int v20 = 4;
    }
    if (*((unsigned char *)a1 + 24)) {
      int v21 = 1;
    }
    else {
      int v21 = v19;
    }
    if (v21) {
      return 0;
    }
    else {
      return v20;
    }
  }
  return v17;
}

void sub_1DD3D4CD4()
{
}

void sub_1DD3D4EE4(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x20C40960023A9);
  _Unwind_Resume(a1);
}

void sub_1DD3D4F08()
{
}

void sub_1DD3D5120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DD3D5174(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3B2EB0(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1DD3D51D0(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3D51EC(uint64_t a1)
{
  uint64_t v4 = a1 + 64;
  unsigned int v2 = *(void ***)(a1 + 64);
  unsigned int v3 = *(void ***)(v4 + 8);
  if (v3 == v2)
  {
    unsigned int v2 = v3;
    if (!v3) {
      return a1;
    }
    goto LABEL_7;
  }
  unint64_t v5 = 0;
  do
  {
    if (v2[v5])
    {
      BOOL v6 = sub_1DD3D625C(v2[v5]);
      MEMORY[0x1E01B4150](v6, 0x10A0C40CEA0335CLL);
      *(void *)(*(void *)(a1 + 64) + 8 * v5) = 0;
      unsigned int v2 = *(void ***)(a1 + 64);
      unsigned int v3 = *(void ***)(a1 + 72);
    }
    ++v5;
  }
  while (v5 < v3 - v2);
  if (v2)
  {
LABEL_7:
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }
  return a1;
}

float sub_1DD3D5284(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *a1;
  do
  {
    float result = *(float *)(a2 + v2);
    *(float *)(v3 + v2) = result;
    v2 += 4;
  }
  while (v2 != 36);
  return result;
}

uint64_t sub_1DD3D52A4(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7 = a3;
  float v8 = v7;
  *(_DWORD *)(a1 + 56) = a4;
  if (!v7)
  {
    NSLog(&cfstr_Preparenormali.isa);
LABEL_8:
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  if (!a2)
  {
    NSLog(&cfstr_Preparenormali_0.isa);
    goto LABEL_8;
  }
  [v7 cropRect];
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v11;
  *(void *)(a1 + 48) = v12;
  long long v13 = *(_OWORD *)(a2 + 60);
  *(void *)(a1 + 16) = *(void *)(a2 + 76);
  *(_OWORD *)a1 = v13;
  unsigned int v14 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2);
  sub_1DD3D54D4(a1 + 64, v14);
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 24))(a2))
  {
    objc_msgSend(v8, "getFrameInfo:frameInfo:", (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 16))(a2, 0), v17);
    operator new();
  }
  sub_1DD3D5504(a1, a2);
  uint64_t v15 = 1;
LABEL_9:

  return v15;
}

void sub_1DD3D54AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3D54D4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_1DD3D62AC((void **)a1, a2 - v2);
  }
}

void *sub_1DD3D5504(uint64_t a1, uint64_t a2)
{
  float result = (void *)(*(uint64_t (**)(uint64_t, void, void))(*(void *)a2 + 56))(a2, 0, (*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 3);
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    if (v6 != v5)
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(result[1] - *result) >> 2) <= v8) {
          sub_1DD3B37AC();
        }
        if (*(unsigned char *)(*result + v7)) {
          operator new();
        }
        ++v8;
        v7 += 12;
      }
      while (v8 < (v6 - v5) >> 3);
    }
    uint64_t v9 = (void *)*result;
    if (*v4)
    {
      v4[1] = v9;
      operator delete(v9);
    }
    JUMPOUT(0x1E01B4150);
  }
  return result;
}

id sub_1DD3D56B4(CMTime *a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  CMTime v13 = *a1;
  CFDictionaryRef v3 = CMTimeCopyAsDictionary(&v13, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v2 setObject:v3 forKeyedSubscript:@"rawTime"];

  uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:9];
  for (uint64_t i = 0; i != 36; i += 4)
  {
    LODWORD(v5) = *(_DWORD *)(a1[1].value + i);
    uint64_t v7 = [NSNumber numberWithFloat:v5];
    [v4 addObject:v7];
  }
  [v2 setObject:v4 forKeyedSubscript:@"homography"];
  CMTimeValue value = a1[2].value;
  if (value)
  {
    v14[0] = @"gapStart";
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:*(unsigned int *)(value + 4)];
    v14[1] = @"gapLength";
    v15[0] = v9;
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:*(unsigned int *)(a1[2].value + 8)];
    v15[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v2 setObject:v11 forKeyedSubscript:@"gapBridge"];
  }

  return v2;
}

void sub_1DD3D587C(_Unwind_Exception *a1)
{
  uint64_t v6 = v3;

  _Unwind_Resume(a1);
}

void sub_1DD3D58E8(void *a1)
{
  id v1 = a1;
  operator new();
}

void sub_1DD3D5A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1DD3D5A2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_1DD3B3678(&v18, 9uLL);
  double v5 = (void *)(a1 + 24);
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4)
  {
    *(void *)(a1 + 32) = v4;
    operator delete(v4);
    *double v5 = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
  }
  *(CMTime *)(a1 + 24) = v18;
  CFDictionaryRef v6 = [v3 objectForKeyedSubscript:@"rawTime"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  memset(&v18, 0, sizeof(v18));
  CMTimeMakeFromDictionary(&v18, v6);
  *(CMTime *)a1 = v18;
  unint64_t v8 = [v3 objectForKeyedSubscript:@"homography"];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  uint64_t v10 = 0;
  char v11 = ([v8 count] != 9) | v9 & isKindOfClass ^ 1;
  do
  {
    uint64_t v12 = [v8 objectAtIndexedSubscript:v10];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();
    [v12 doubleValue];
    v11 |= v13 ^ 1;
    *(float *)&double v14 = v14;
    *(_DWORD *)(*v5 + 4 * v10) = LODWORD(v14);

    ++v10;
  }
  while (v10 != 9);
  uint64_t v15 = [v3 objectForKeyedSubscript:@"gapBridge"];

  if (v15)
  {
    int v16 = [v3 objectForKeyedSubscript:@"gapBridge"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      sub_1DD3D58E8(v16);
    }
    char v11 = 1;
  }
  else
  {
    int v16 = v6;
  }

  return (v11 & 1) == 0;
}

void sub_1DD3D5C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3D5CA0(uint64_t a1)
{
  unint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v2 setObject:v3 forKeyedSubscript:@"stabilizeResult"];

  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(a1 + 24));
  [v2 setObject:DictionaryRepresentation forKeyedSubscript:@"stabCropRect"];

  CMTime v11 = *(CMTime *)a1;
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v11, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v2 setObject:v5 forKeyedSubscript:@"outputFrameDur"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72) != v7)
  {
    unint64_t v8 = 0;
    do
    {
      char v9 = sub_1DD3D56B4(*(CMTime **)(v7 + 8 * v8));
      [v6 addObject:v9];

      ++v8;
      uint64_t v7 = *(void *)(a1 + 64);
    }
    while (v8 < (*(void *)(a1 + 72) - v7) >> 3);
  }
  [v2 setObject:v6 forKeyedSubscript:@"frameInstructions"];

  return v2;
}

void sub_1DD3D5E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D5E40(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"stabilizeResult"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(_DWORD *)(a1 + 56) = [v4 intValue];
    CFDictionaryRef v5 = [v3 objectForKeyedSubscript:@"stabCropRect"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGRectMakeWithDictionaryRepresentation(v5, (CGRect *)(a1 + 24));
      CFDictionaryRef v6 = [v3 objectForKeyedSubscript:@"outputFrameDur"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CMTimeMakeFromDictionary(&v14, v6);
        *(CMTime *)a1 = v14;
        unint64_t v8 = (void *)(a1 + 64);
        uint64_t v7 = *(void **)(a1 + 64);
        if (v7)
        {
          *(void *)(a1 + 72) = v7;
          operator delete(v7);
          *unint64_t v8 = 0;
          *(void *)(a1 + 72) = 0;
          *(void *)(a1 + 80) = 0;
        }
        *unint64_t v8 = 0;
        *(void *)(a1 + 72) = 0;
        *(void *)(a1 + 80) = 0;
        char v9 = [v3 objectForKeyedSubscript:@"frameInstructions"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          memset(v13, 0, sizeof(v13));
          obint j = v9;
          if ([obj countByEnumeratingWithState:v13 objects:v15 count:16])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              operator new();
            }
            uint64_t v10 = 0;
          }
          else
          {
            uint64_t v10 = 1;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      CFDictionaryRef v5 = v6;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1DD3D61E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3D625C(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    MEMORY[0x1E01B4150](v2, 0x1000C408195852FLL);
  }
  id v3 = (void *)a1[3];
  if (v3)
  {
    a1[4] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1DD3D62AC(void **a1, unint64_t a2)
{
  CFDictionaryRef v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  CFDictionaryRef v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      sub_1DD3A9B50();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      char v13 = (char *)sub_1DD3B19D0(v4, v12);
    }
    else {
      char v13 = 0;
    }
    CMTime v14 = &v13[8 * v10];
    uint64_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    uint64_t v16 = &v14[8 * a2];
    CMTime v18 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      uint64_t v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

uint64_t sub_1DD3D63C0(uint64_t a1, uint64_t a2, uint64_t *a3, _DWORD *a4, uint64_t a5)
{
  if (*(unsigned char *)a2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(_DWORD *)(a2 + 8) == 0;
  }
  if (!v5) {
    operator new();
  }
  sub_1DD3D6568(a3, a2, a4, a5);
  return 0;
}

void sub_1DD3D6534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_1DD3D6568(uint64_t *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  BOOL v8 = sub_1DD3D2ADC(a1, a3 + 1, a3);
  int v9 = *(_DWORD *)(a2 + 8);
  a3[2] = v9;
  a3[3] = v9;
  a3[4] = -1082130432;
  if (!v8)
  {
    int v10 = *(_DWORD *)(a2 + 4) - v9;
    *a3 = 0;
    a3[1] = v10;
    printf("Warning: no-opt minimize_autoloop_energy had no valid candidates");
  }
  if (a4)
  {
    int v11 = sub_1DD3D256C(a1);
    int v12 = sub_1DD3D2588(a1);
    int v14 = -1082130432;
    sub_1DD3B9DC8(a4, (v12 * v11), &v14);
  }
  return 1;
}

uint64_t sub_1DD3D660C(float (***a1)(void), uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  unsigned int v10 = sub_1DD3D256C(a2);
  unsigned int v11 = sub_1DD3D2588(a2);
  if (a5)
  {
    int v17 = -1082130432;
    sub_1DD3B9DC8((uint64_t)a5, v11 * (unint64_t)v10, &v17);
  }
  uint64_t v12 = *(unsigned int *)(a3 + 8);
  char v16 = 0;
  uint64_t v15 = 0;
  if (sub_1DD3D2ADC(a2, (_DWORD *)&v15 + 1, &v15))
  {
    float v13 = sub_1DD3D7234(a1, v15, HIDWORD(v15), v12, a3);
    if (a5) {
      *(float *)(*a5 + 4 * (v15 + HIDWORD(v15) * (unint64_t)v11)) = v13;
    }
    sub_1DD3D25A4();
  }
  uint64_t result = 0;
  *a4 = 0;
  a4[1] = 0;
  return result;
}

uint64_t sub_1DD3D686C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)a2 && *(_DWORD *)(a2 + 8)) {
    operator new();
  }
  sub_1DD3D6A34(a3, a2, a4, a5);
  return 0;
}

void sub_1DD3D6A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_1DD3D6A34(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8 = sub_1DD3D2ADC(a1, (_DWORD *)(a3 + 4), (_DWORD *)a3);
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = -1082130432;
  if (!v8)
  {
    int v9 = *(_DWORD *)(a2 + 4);
    *(_DWORD *)a3 = 0;
    *(_DWORD *)(a3 + 4) = v9;
    printf("Warning: no-opt minimize_bounce_energy had no valid candidates");
  }
  if (a4)
  {
    int v10 = sub_1DD3D256C(a1);
    int v11 = sub_1DD3D2588(a1);
    int v13 = -1082130432;
    sub_1DD3B9DC8(a4, (v11 * v10), &v13);
  }
  return 1;
}

void *sub_1DD3D6AD0(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1E01B40E0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_1DD3D6C74(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1E01B40F0](v13);
  return a1;
}

void sub_1DD3D6C0C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x1E01B40F0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1DD3D6BECLL);
}

void sub_1DD3D6C60(_Unwind_Exception *a1)
{
}

uint64_t sub_1DD3D6C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      sub_1DD3D6DFC(__p, v12, __c);
      int v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_1DD3D6DE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1DD3D6DFC(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_1DD3D6EA8();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_1DD3D6EA8()
{
}

void sub_1DD3D6EC0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 4) = *(void *)a2;
  *(float *)(a1 + 12) = sub_1DD3D4720((_DWORD *)a2);
}

void sub_1DD3D6EFC(uint64_t a1, uint64_t a2, int a3)
{
  *(unsigned char *)a1 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 4) = *(void *)a2;
  float v5 = sub_1DD3D4720((_DWORD *)a2);
  if (!a3) {
    float v5 = -1.0;
  }
  *(float *)(a1 + 12) = v5;
}

uint64_t sub_1DD3D6F48(uint64_t result, void *a2)
{
  *(void *)uint64_t result = &unk_1F3891AB0;
  *(void *)(result + 16) = a2;
  *(_DWORD *)(result + 8) = -1431655765 * ((a2[1] - *a2) >> 3);
  return result;
}

BOOL sub_1DD3D6F88(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4 = *(_DWORD *)(a4 + 8);
  if (v4 > a3) {
    return 0;
  }
  BOOL v6 = v4 == 0;
  unsigned int v7 = a3 + a2 + v4;
  return !v6 && v7 <= *(_DWORD *)(a4 + 4);
}

BOOL sub_1DD3D6FB8(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4 = *(_DWORD *)(a4 + 8);
  if (v4 >> 1 > a3) {
    return 0;
  }
  return v4 > 1 && a3 + a2 + (v4 >> 1) <= *(_DWORD *)(a4 + 4);
}

double sub_1DD3D6FEC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v4 = MEMORY[0x1F4188790](a4);
    size_t v8 = (float *)((char *)v13 - v7);
    uint64_t v9 = 0;
    uint64_t v11 = **(void **)(v10 + 16);
    do
    {
      v8[v9] = *(float *)(*(void *)(v11 + 24 * (v6 + v9)) + 4 * (v5 + v6 + v9));
      ++v9;
    }
    while (v4 != v9);
    return sub_1DD3C4894(v4, v8);
  }
  else
  {
    puts("rawLoopEnergy warning: fadeCFIndex Length = 0 is invalid.");
    return 0.0;
  }
}

void sub_1DD3D70D0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a4 > 1)
  {
    unsigned int v4 = a4 >> 1;
    uint64_t v5 = MEMORY[0x1F4188790](a1);
    uint64_t v6 = MEMORY[0x1F4188790](v5);
    uint64_t v11 = (float *)((char *)v16 - v10);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = **(void **)(v6 + 16);
    if (v4 <= 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v4;
    }
    do
    {
      v7[v13] = *(float *)(*(void *)(v14 + 24 * (v9 + v12)) + 4 * (v9 + v13));
      v11[v13] = *(float *)(*(void *)(v14 + 24 * (v9 + v8 - 1 + v12))
                          + 4 * (v9 + v8 - 1 + v13));
      ++v13;
      --v12;
    }
    while (v15 != v13);
    sub_1DD3C4894(v4, v7);
    sub_1DD3C4894(v4, v11);
  }
  else
  {
    puts("frameBoomerangLoopEnergy warning: bufLen = 0 is invalid.");
  }
}

float sub_1DD3D7234(float (***a1)(void), uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  float v7 = (**a1)(a1);
  float v8 = 1.0;
  if (*(float *)(a5 + 12) >= 0.0) {
    float v8 = sub_1DD3C48C4(a3, *(float *)(a5 + 12));
  }
  return v7 * v8;
}

char *sub_1DD3D7C74(int a1)
{
  uint64_t v1 = 0;
  while (dword_1E6CC01B0[v1] != a1)
  {
    v1 += 4;
    if (v1 == 60)
    {
      uint64_t v2 = byte_1EAB20CC8;
      snprintf(byte_1EAB20CC8, 0x64uLL, "<Unknown> (%d)", a1);
      return v2;
    }
  }
  return *(char **)&dword_1E6CC01B0[v1 + 2];
}

char *sub_1DD3D7CEC(int a1)
{
  uint64_t v1 = 0;
  while (dword_1E6CC02A0[v1] != a1)
  {
    v1 += 4;
    if (v1 == 24)
    {
      uint64_t v2 = byte_1EAB20D2C;
      snprintf(byte_1EAB20D2C, 0x64uLL, "<Unknown> (%d)", a1);
      return v2;
    }
  }
  return *(char **)&dword_1E6CC02A0[v1 + 2];
}

uint64_t sub_1DD3D7D64(uint64_t a1, CFTypeRef cf)
{
  *(void *)(a1 + 40) = 0;
  id v3 = (unint64_t *)(a1 + 40);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)a1 = cf;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 64) = 13;
  *(unsigned char *)(a1 + 68) = 0;
  CFRetain(cf);
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = *(void *)(a1 + 48) - v4;
  if (v5 > 0xFE)
  {
    if (v5 != 255) {
      *(void *)(a1 + 48) = v4 + 255;
    }
  }
  else
  {
    sub_1DD3B353C(v3, 255 - v5);
  }
  return a1;
}

void sub_1DD3D7DF0(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3D7E10(uint64_t a1)
{
  uint64_t v2 = *(const void **)a1;
  if (v2)
  {
    CFRelease(v2);
    *(void *)a1 = 0;
  }
  id v3 = *(const void **)(a1 + 8);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 8) = 0;
  }
  uint64_t v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 16) = 0;
  }
  unint64_t v5 = *(void **)(a1 + 40);
  if (v5)
  {
    *(void *)(a1 + 48) = v5;
    operator delete(v5);
  }
  return a1;
}

uint64_t sub_1DD3D7E7C(uint64_t a1)
{
  unsigned int v2 = 6;
  id v3 = buffer;
  do
  {
    CFIndex v4 = CFReadStreamRead(*(CFReadStreamRef *)a1, v3, v2);
    if (v4 < 0) {
      return 3;
    }
    if (!v4) {
      return 1;
    }
    v3 += v4;
    v2 -= v4;
  }
  while (v2);
  BOOL v5 = *(unsigned __int16 *)buffer == 18759 && v21 == 70;
  if (v5 && (v22 == 14648 ? (BOOL v10 = v23 == 97) : (BOOL v10 = 0), v10 || (v22 == 14136 ? (v11 = v23 == 97) : (v11 = 0), v11)))
  {
    *(void *)(a1 + 8) = CFDataCreate(0, buffer, 6);
    unsigned int v12 = 7;
    uint64_t v13 = bytes;
    while (1)
    {
      CFIndex v14 = CFReadStreamRead(*(CFReadStreamRef *)a1, v13, v12);
      if (v14 < 1) {
        break;
      }
      v13 += v14;
      v12 -= v14;
      if (!v12)
      {
        *(_DWORD *)(a1 + 24) = *(_DWORD *)bytes;
        unsigned int v15 = v18;
        *(unsigned char *)(a1 + 28) = v18 >> 7;
        *(unsigned char *)(a1 + 29) = (v15 >> 4) & 7;
        *(unsigned char *)(a1 + 30) = (v15 & 8) != 0;
        *(unsigned char *)(a1 + 31) = v15 & 7;
        *(_WORD *)(a1 + 32) = v19;
        CFDataRef v16 = CFDataCreate(0, bytes, 7);
        uint64_t result = 0;
        *(void *)(a1 + 16) = v16;
        *(_DWORD *)(a1 + 64) = 0;
        return result;
      }
    }
    uint64_t v6 = (FILE *)*MEMORY[0x1E4F143C8];
    float v7 = "GIFParser::init: short Logical Screen Descriptor\n";
    size_t v8 = 49;
  }
  else
  {
    uint64_t v6 = (FILE *)*MEMORY[0x1E4F143C8];
    float v7 = "GIFParser::init: bad signature\n";
    size_t v8 = 31;
  }
  fwrite(v7, v8, 1uLL, v6);
  return 2;
}

uint64_t sub_1DD3D8010(uint64_t a1, __CFData *a2)
{
LABEL_1:
  UInt8 buffer = 0;
  unsigned int v4 = 1;
  p_UInt8 buffer = &buffer;
  do
  {
    CFIndex v6 = CFReadStreamRead(*(CFReadStreamRef *)a1, p_buffer, v4);
    if (v6 < 0)
    {
      uint64_t v10 = 3;
LABEL_13:
      BOOL v11 = (FILE *)*MEMORY[0x1E4F143C8];
      unsigned int v12 = "GIFParser::appendSubBlocks: error reading subblock length\n";
      size_t v13 = 58;
LABEL_17:
      fwrite(v12, v13, 1uLL, v11);
      return v10;
    }
    if (!v6)
    {
      uint64_t v10 = 1;
      goto LABEL_13;
    }
    p_buffer += v6;
    v4 -= v6;
  }
  while (v4);
  CFDataAppendBytes(a2, &buffer, 1);
  unsigned int v7 = buffer;
  if (buffer)
  {
    size_t v8 = *(UInt8 **)(a1 + 40);
    while (1)
    {
      CFIndex v9 = CFReadStreamRead(*(CFReadStreamRef *)a1, v8, v7);
      if (v9 < 0)
      {
        uint64_t v10 = 3;
        goto LABEL_16;
      }
      if (!v9) {
        break;
      }
      v8 += v9;
      v7 -= v9;
      if (!v7)
      {
        CFDataAppendBytes(a2, *(const UInt8 **)(a1 + 40), buffer);
        goto LABEL_1;
      }
    }
    uint64_t v10 = 1;
LABEL_16:
    BOOL v11 = (FILE *)*MEMORY[0x1E4F143C8];
    unsigned int v12 = "GIFParser::appendSubBlocks: error reading subblock data\n";
    size_t v13 = 56;
    goto LABEL_17;
  }
  return 0;
}

uint64_t sub_1DD3D8128(uint64_t a1, int *a2, __CFData **a3)
{
  strcpy((char *)bytes, "!");
  CFIndex v6 = &bytes[1];
  unsigned int v7 = 1;
  do
  {
    CFIndex v8 = CFReadStreamRead(*(CFReadStreamRef *)a1, v6, v7);
    if (v8 < 0)
    {
      uint64_t v11 = 3;
LABEL_9:
      fwrite("GIFParser::parseExtension: error reading extension label\n", 0x39uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      return v11;
    }
    if (!v8)
    {
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    v6 += v8;
    v7 -= v8;
  }
  while (v7);
  Mutable = CFDataCreateMutable(0, 0);
  CFDataAppendBytes(Mutable, bytes, 2);
  uint64_t v10 = sub_1DD3D8010(a1, Mutable);
  if (v10)
  {
    uint64_t v11 = v10;
    CFRelease(Mutable);
  }
  else
  {
    if ((bytes[1] + 7) > 8u) {
      int v13 = 8;
    }
    else {
      int v13 = dword_1DD3E861C[(char)(bytes[1] + 7)];
    }
    uint64_t v11 = 0;
    *a2 = v13;
    *a3 = Mutable;
    *(_DWORD *)(a1 + 64) = 12;
  }
  return v11;
}

uint64_t sub_1DD3D8250(uint64_t a1, _DWORD *a2, CFDataRef *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  UInt8 bytes = 44;
  CFIndex v6 = (UInt8 *)&v12;
  unsigned int v7 = 9;
  do
  {
    CFIndex v8 = CFReadStreamRead(*(CFReadStreamRef *)a1, v6, v7);
    if (v8 < 1)
    {
      fwrite("GIFParser::init: error reaching image Descriptor\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      return 2;
    }
    v6 += v8;
    v7 -= v8;
  }
  while (v7);
  int v9 = 10;
  *a3 = CFDataCreate(0, &bytes, 10);
  if (v13 < 0)
  {
    *(unsigned char *)(a1 + 68) = v13 & 7;
    int v9 = 3;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 64) = v9;
  *a2 = 9;
  return result;
}

__CFData *sub_1DD3D8358(const __CFData *a1)
{
  Mutable = CFDataCreateMutable(0, 0);
  *(_WORD *)UInt8 bytes = -479;
  CFDataAppendBytes(Mutable, bytes, 2);
  CFIndex Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  do
  {
    if (Length >= 255) {
      CFIndex v5 = 255;
    }
    else {
      CFIndex v5 = Length;
    }
    UInt8 v8 = v5;
    CFDataAppendBytes(Mutable, &v8, 1);
    CFDataAppendBytes(Mutable, BytePtr, v5);
    BytePtr += v5;
    Length -= v5;
  }
  while (Length);
  UInt8 v7 = 0;
  CFDataAppendBytes(Mutable, &v7, 1);
  return Mutable;
}

uint64_t sub_1DD3D8420(uint64_t a1, int *a2, CFDataRef *a3)
{
  *a2 = 12;
  *a3 = 0;
  if (!*(void *)a1 || (CFDataRef v4 = *(const __CFData **)(a1 + 8)) == 0 || (v5 = *(const __CFData **)(a1 + 16)) == 0)
  {
LABEL_13:
    fwrite("GIFParser::nextBlock: init was unsuccessful\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    return 4;
  }
  int v6 = *(_DWORD *)(a1 + 64);
  uint64_t v9 = 1;
  switch(v6)
  {
    case 0:
      *a2 = 0;
      *a3 = v4;
      CFRetain(v4);
      int v19 = 1;
      goto LABEL_49;
    case 1:
      *a2 = 1;
      *a3 = v5;
      CFRetain(*(CFTypeRef *)(a1 + 16));
      if (!*(unsigned char *)(a1 + 28)) {
        goto LABEL_48;
      }
      *(_DWORD *)(a1 + 64) = 2;
      *(unsigned char *)(a1 + 68) = *(unsigned char *)(a1 + 31);
      return 0;
    case 2:
    case 3:
      size_t v10 = (3 * (2 << *(unsigned char *)(a1 + 68)));
      sub_1DD3B3408(buffer, v10);
      uint64_t v11 = buffer[0];
      unsigned int v12 = v10;
      while (1)
      {
        CFIndex v13 = CFReadStreamRead(*(CFReadStreamRef *)a1, v11, v12);
        if (v13 < 0) {
          break;
        }
        if (!v13)
        {
          uint64_t v9 = 1;
          goto LABEL_35;
        }
        v11 += v13;
        v12 -= v13;
        if (!v12)
        {
          CFDataRef v14 = CFDataCreate(0, buffer[0], v10);
          uint64_t v9 = 0;
          *a3 = v14;
          int v15 = *(_DWORD *)(a1 + 64);
          *a2 = v15;
          if (v15 == 2) {
            int v16 = 12;
          }
          else {
            int v16 = 10;
          }
          *(_DWORD *)(a1 + 64) = v16;
          char v17 = 1;
LABEL_36:
          if (buffer[0])
          {
            buffer[1] = buffer[0];
            operator delete(buffer[0]);
          }
          if (v17) {
            return 0;
          }
          return v9;
        }
      }
      uint64_t v9 = 3;
LABEL_35:
      fwrite("GIFParser::nextBlock: error reading color table\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      char v17 = 0;
      goto LABEL_36;
    case 10:
      LOBYTE(buffer[0]) = 0;
      unsigned int v22 = 1;
      char v23 = buffer;
      while (1)
      {
        CFIndex v24 = CFReadStreamRead(*(CFReadStreamRef *)a1, (UInt8 *)v23, v22);
        if (v24 < 0)
        {
          uint64_t v9 = 3;
          goto LABEL_43;
        }
        if (!v24) {
          break;
        }
        char v23 = (UInt8 **)((char *)v23 + v24);
        v22 -= v24;
        if (!v22)
        {
          Mutable = CFDataCreateMutable(0, 0);
          CFDataAppendBytes(Mutable, (const UInt8 *)buffer, 1);
          uint64_t v26 = sub_1DD3D8010(a1, Mutable);
          if (v26)
          {
            uint64_t v9 = v26;
            CFRelease(Mutable);
            return v9;
          }
          *a2 = 10;
          *a3 = Mutable;
LABEL_48:
          int v19 = 12;
LABEL_49:
          *(_DWORD *)(a1 + 64) = v19;
          return 0;
        }
      }
      uint64_t v9 = 1;
LABEL_43:
      int v30 = (FILE *)*MEMORY[0x1E4F143C8];
      int v31 = "GIFParser::nextBlock: error reading LZW minimum code size\n";
      size_t v32 = 58;
      goto LABEL_46;
    case 12:
      LOBYTE(buffer[0]) = 0;
      unsigned int v27 = 1;
      int v28 = buffer;
      break;
    case 13:
      goto LABEL_13;
    case 14:
      return v9;
    default:
      unsigned int v20 = (FILE *)*MEMORY[0x1E4F143C8];
      char v21 = sub_1DD3D7C74(v6);
      fprintf(v20, "GIFParser::nextBlock: internal error (mNextBlockType = %s)\n", v21);
      return 5;
  }
  do
  {
    CFIndex v29 = CFReadStreamRead(*(CFReadStreamRef *)a1, (UInt8 *)v28, v27);
    if (v29 < 0)
    {
      uint64_t v9 = 3;
LABEL_45:
      int v30 = (FILE *)*MEMORY[0x1E4F143C8];
      int v31 = "GIFParser::nextBlock: error reading block descriptor\n";
      size_t v32 = 53;
LABEL_46:
      fwrite(v31, v32, 1uLL, v30);
      return v9;
    }
    if (!v29)
    {
      uint64_t v9 = 1;
      goto LABEL_45;
    }
    int v28 = (UInt8 **)((char *)v28 + v29);
    v27 -= v29;
  }
  while (v27);
  switch(LOBYTE(buffer[0]))
  {
    case ';':
      *a3 = CFDataCreate(0, (const UInt8 *)buffer, 1);
      *a2 = 11;
      int v19 = 14;
      goto LABEL_49;
    case ',':
      sub_1DD3D8250(a1, a2, a3);
      return 0;
    case '!':
      sub_1DD3D8128(a1, a2, a3);
      return 0;
  }
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "GIFParser::nextBlock: unknown block descriptor (0x%x)\n", LOBYTE(buffer[0]));
  return 2;
}

void sub_1DD3D87BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFData *sub_1DD3D8818(const __CFData *a1, const __CFString *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0);
  CFIndex v6 = CFDataGetLength(ExternalRepresentation);
  CFIndex v7 = Length + v6 + (v6 + 254) / 0xFFuLL + 3;
  Mutable = CFDataCreateMutable(0, v7);
  CFDataSetLength(Mutable, v7);
  BytePtr = CFDataGetBytePtr(a1);
  CFReadStreamRef v10 = CFReadStreamCreateWithBytesNoCopy(0, BytePtr, Length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  unsigned int v12 = CFWriteStreamCreateWithBuffer(0, MutableBytePtr, v7);
  LODWORD(v7) = sub_1DD3D892C(v10, ExternalRepresentation, v12);
  CFRelease(ExternalRepresentation);
  CFRelease(v10);
  CFRelease(v12);
  if (v7)
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t sub_1DD3D892C(void *a1, const __CFData *a2, __CFWriteStream *a3)
{
  if (CFReadStreamOpen((CFReadStreamRef)a1))
  {
    if (CFWriteStreamOpen(a3))
    {
      sub_1DD3D7E0C((int)v21, a1);
      int v6 = sub_1DD3D7E7C((uint64_t)v21);
      if (v6 == 2)
      {
        CFDataRef v14 = (FILE *)*MEMORY[0x1E4F143C8];
        int v15 = "***addGIFCommentStream: not a GIF file\n";
        size_t v16 = 39;
LABEL_16:
        fwrite(v15, v16, 1uLL, v14);
      }
      else
      {
        if (!v6)
        {
          while (1)
          {
            CFTypeRef cf = 0;
            int v19 = 12;
            int v7 = sub_1DD3D8420((uint64_t)v21, &v19, (CFDataRef *)&cf);
            if (v7)
            {
              char v17 = (FILE *)*MEMORY[0x1E4F143C8];
              sub_1DD3D7CEC(v7);
              fprintf(v17, "***addGIFCommentStream: nextBlock returned %s\n");
              goto LABEL_19;
            }
            if (v19 == 11)
            {
              UInt8 v8 = sub_1DD3D8358(a2);
              if (!v8)
              {
                CFDataRef v14 = (FILE *)*MEMORY[0x1E4F143C8];
                int v15 = "***addGIFCommentStream: error creating comment block\n";
                size_t v16 = 53;
                goto LABEL_16;
              }
              int v9 = sub_1DD3D8B7C(a3, v8);
              CFRelease(v8);
              if (v9) {
                break;
              }
            }
            uint64_t v10 = sub_1DD3D8B7C(a3, (CFDataRef)cf);
            if (v10)
            {
              fwrite("***addGIFCommentStream: error writing normal block\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
              goto LABEL_23;
            }
            CFRelease(cf);
            if (v19 == 11) {
              goto LABEL_23;
            }
          }
          fwrite("***addGIFCommentStream: error writing comment block\n", 0x34uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
          uint64_t v10 = 0xFFFFFFFFLL;
LABEL_23:
          CFWriteStreamClose(a3);
          CFReadStreamClose((CFReadStreamRef)a1);
          goto LABEL_24;
        }
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "***addGIFCommentStream: GIFParser.init returned %d\n");
      }
LABEL_19:
      uint64_t v10 = 0xFFFFFFFFLL;
LABEL_24:
      sub_1DD3D7E78(v21);
      return v10;
    }
    uint64_t v11 = (FILE *)*MEMORY[0x1E4F143C8];
    unsigned int v12 = "***addGIFCommentStream: open(outFile) failed\n";
    size_t v13 = 45;
  }
  else
  {
    uint64_t v11 = (FILE *)*MEMORY[0x1E4F143C8];
    unsigned int v12 = "***addGIFCommentStream: open(inFile) failed\n";
    size_t v13 = 44;
  }
  fwrite(v12, v13, 1uLL, v11);
  return 0xFFFFFFFFLL;
}

void sub_1DD3D8B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_1DD3D7E78(va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D8B7C(__CFWriteStream *a1, CFDataRef theData)
{
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  while (1)
  {
    CFIndex v6 = CFWriteStreamWrite(a1, BytePtr, Length);
    if (v6 < 0)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "CFWriteStreamWrite returned %d\n", v6);
      return 0xFFFFFFFFLL;
    }
    if (!v6) {
      break;
    }
    BytePtr += v6;
    Length -= v6;
    if (!Length) {
      return 0;
    }
  }
  fwrite("CFWriteStreamWrite returned 0\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1DD3D8C3C(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  if (!v10)
  {
    NSLog(&cfstr_Vpcreatefromfi_0.isa);
    goto LABEL_11;
  }
  int v13 = sub_1DD3DEA34(v10, 1538, 0x180u);
  int v14 = v13;
  if (v13 <= 0)
  {
    int v19 = __error();
    unsigned int v20 = strerror(*v19);
    if ((*(unsigned char *)(a4 + 4) & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (lseek(v13, 0, 0) < 0)
  {
    char v21 = __error();
    unsigned int v20 = strerror(*v21);
    if ((*(unsigned char *)(a4 + 4) & 2) != 0)
    {
LABEL_10:
      unsigned int v22 = v20;
      char v23 = [v10 path];
      NSLog(&cfstr_ErrorCreatingS.isa, v23, v22);
    }
LABEL_11:
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_34;
  }
  double v15 = sub_1DD3E01C8((uint64_t)v37, 1988465669);
  size_t v16 = (void *)MEMORY[0x1E01B4410](v15);
  __p = 0;
  unsigned int v35 = 0;
  uint64_t v36 = 0;
  uint64_t v17 = sub_1DD3E33BC(v9, v14, 0, &__p, v11, a4, (uint64_t)v37, v12);
  if (!v17)
  {
    size_t v32 = v16;
    id v33 = v9;
    if (v35 == __p)
    {
LABEL_19:
      size_t v16 = v32;
      id v9 = v33;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v24 = 0;
      unint64_t v25 = (v35 - (unsigned char *)__p) / 24;
      if (v25 <= 1) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = (v35 - (unsigned char *)__p) / 24;
      }
      BOOL v27 = 1;
      while (1)
      {
        unsigned int v28 = *(_DWORD *)((char *)__p + v17 + 8);
        unint64_t __buf = bswap64(*(void *)((char *)__p + v17));
        unsigned int v40 = bswap32(v28);
        if (write(v14, &__buf, 0xCuLL) != 12) {
          break;
        }
        BOOL v27 = ++v24 < v25;
        v17 += 24;
        if (v26 == v24) {
          goto LABEL_19;
        }
      }
      id v9 = v33;
      NSLog(&cfstr_Vpcreatefromfi_2.isa);
      size_t v16 = v32;
      if (v27)
      {
LABEL_23:
        int v18 = 0;
        uint64_t v17 = 0xFFFFFFFFLL;
        goto LABEL_27;
      }
    }
    if (!sub_1DD3E0AB0((uint64_t)v37, v14))
    {
      if (v12) {
        [v12 vpcCallback:100];
      }
      int v18 = 1;
      goto LABEL_27;
    }
    NSLog(&cfstr_Vpcreatefromfi_1.isa);
    goto LABEL_23;
  }
  int v18 = 0;
LABEL_27:
  if (__p)
  {
    unsigned int v35 = __p;
    operator delete(__p);
  }
  if (v18)
  {
    if ((*(unsigned char *)(a4 + 4) & 2) != 0)
    {
      uint64_t v29 = v38;
      int v30 = [v10 path];
      NSLog(&cfstr_WroteUFramesTo.isa, v29, v30);
    }
    uint64_t v17 = 0;
  }
  sub_1DD3E0284(v37);
LABEL_34:

  return v17;
}

void sub_1DD3D8F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, char a17)
{
  sub_1DD3E0284(&a17);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3D8FE0(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6, void *a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a7;
  size_t v16 = sub_1DD3E3310(v21, a5);
  uint64_t v17 = (void *)MEMORY[0x1E01B4410](v16);
  uint64_t v18 = sub_1DD3E33BC(v13, -1, (uint64_t)v21, a6, v14, a3, a4, v15);
  uint64_t v19 = v18;
  if (v15 && !v18) {
    [v15 vpcCallback:100];
  }
  if (!v19 && (*(unsigned char *)(a3 + 4) & 2) != 0) {
    NSLog(&cfstr_WroteUFramesTo_0.isa, *(unsigned int *)(a4 + 8));
  }

  return v19;
}

void sub_1DD3D90D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3D90F4(void *result)
{
  *uint64_t result = 1065353216;
  return result;
}

unint64_t sub_1DD3D9100(void *a1, uint64_t a2, double a3, double a4)
{
  id v7 = a1;
  UInt8 v8 = v7;
  if (v7)
  {
    int v9 = [v7 numFrames];
    unint64_t v10 = 0;
    if (a2 && v9 && a3 != 0.0 && a4 != 0.0)
    {
      unsigned int v11 = [v8 numFrames];
      double v12 = 1.5;
      if ((*(unsigned char *)(a2 + 4) & 4) == 0) {
        double v12 = 3.0;
      }
      unint64_t v10 = (unint64_t)(a3 * a4 * (double)v11 / (float)(*(float *)a2 * *(float *)a2) * v12);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

void sub_1DD3D91B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1DD3D9ABC(__int16 a1, int a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  CFDataRef v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  if ((a1 & 4) != 0 && a2)
  {
    CFDataRef v5 = [NSNumber numberWithUnsignedInt:875704422];
    v15[0] = v5;
    CFIndex v6 = [NSNumber numberWithUnsignedInt:875704438];
    v15[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

    [v4 setObject:v7 forKey:*MEMORY[0x1E4F24D70]];
  }
  else
  {
    if ((a1 & 2) != 0) {
      unsigned int v8 = 1111970369;
    }
    else {
      unsigned int v8 = 32;
    }
    if ((8 * (_BYTE)a1) & 0x20 | a1 & 0x20) {
      unsigned int v9 = 875704438;
    }
    else {
      unsigned int v9 = 875704422;
    }
    if ((8 * (_BYTE)a1) & 0x20 | a1 & 0x30) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v8;
    }
    unsigned int v11 = [NSNumber numberWithUnsignedInt:v10];
    [v4 setObject:v11 forKey:*MEMORY[0x1E4F24D70]];
  }
  double v12 = (void *)MEMORY[0x1E4F1CFD0];
  if ((a1 & 0x40) != 0)
  {
    [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F24CA8]];
    if ((a1 & 0x80) == 0)
    {
LABEL_16:
      if ((a1 & 0x100) == 0) {
        goto LABEL_17;
      }
      goto LABEL_26;
    }
  }
  else if ((a1 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  [v4 setObject:*v12 forKey:*MEMORY[0x1E4F24CA0]];
  if ((a1 & 0x100) == 0)
  {
LABEL_17:
    if ((a1 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v4 setObject:*v12 forKey:*MEMORY[0x1E4F24D50]];
  if ((a1 & 0x200) == 0)
  {
LABEL_18:
    if ((a1 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
LABEL_27:
  id v14 = [MEMORY[0x1E4F1C9E8] dictionary];
  [v4 setObject:v14 forKey:*MEMORY[0x1E4F24D20]];

  if ((a1 & 0x400) == 0)
  {
LABEL_19:
    if ((a1 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_28:
  [v4 setObject:*v12 forKey:*MEMORY[0x1E4F24D58]];
  if ((a1 & 0x800) != 0) {
LABEL_20:
  }
    [v4 setObject:*v12 forKey:*MEMORY[0x1E4F24D40]];
LABEL_21:

  return v4;
}

void sub_1DD3DA1D8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) trackOutput];
  uint64_t v3 = [v2 copyNextSampleBuffer];

  CFDataRef v4 = [*(id *)(a1 + 32) readaheadLock];
  [v4 lock];

  [*(id *)(a1 + 32) setReadaheadBuf:v3];
  [*(id *)(a1 + 32) setReadaheadState:2];
  CFDataRef v5 = [*(id *)(a1 + 32) readaheadLock];
  [v5 broadcast];

  id v6 = [*(id *)(a1 + 32) readaheadLock];
  [v6 unlock];
}

char *sub_1DD3DA8AC(unsigned int a1)
{
  if (a1 < 6) {
    return off_1E6CC0328[a1];
  }
  uint64_t v1 = byte_1EAB20D90;
  snprintf(byte_1EAB20D90, 0x64uLL, "<<<Unknown (%d)>>>", a1);
  return v1;
}

uint64_t sub_1DD3DA90C(char a1)
{
  if ((a1 & 2) != 0) {
    unsigned int v1 = 1111970369;
  }
  else {
    unsigned int v1 = 32;
  }
  if ((8 * a1) & 0x20 | a1 & 0x20) {
    unsigned int v2 = 875704438;
  }
  else {
    unsigned int v2 = 875704422;
  }
  if ((8 * a1) & 0x20 | a1 & 0x30) {
    return v2;
  }
  else {
    return v1;
  }
}

uint64_t sub_1DD3DA94C(__CVBuffer *a1)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);

  return sub_1DD3DA974(PixelFormatType);
}

uint64_t sub_1DD3DA974(uint64_t a1)
{
  if ((int)a1 > 875704437)
  {
    if (a1 != 1111970369)
    {
      if (a1 == 875704438) {
        return 32;
      }
      goto LABEL_8;
    }
    return 2;
  }
  else
  {
    if (a1 != 32)
    {
      if (a1 == 875704422) {
        return 16;
      }
LABEL_8:
      NSLog(&cfstr_WarningUnknown.isa, a1);
      return 0;
    }
    return 1;
  }
}

uint64_t sub_1DD3DAA10(int a1, unsigned int a2, unsigned int *a3, int *a4)
{
  if (a1 == 875704438)
  {
    if (a2)
    {
      if (a2 != 1) {
        return 0xFFFFFFFFLL;
      }
      int v4 = 240;
    }
    else
    {
      int v4 = 235;
    }
    a2 = 16;
    goto LABEL_11;
  }
  if (a1 != 875704422 || a2 > 1) {
    return 0xFFFFFFFFLL;
  }
  int v4 = 255;
LABEL_11:
  uint64_t result = 0;
  *a3 = a2;
  *a4 = v4;
  return result;
}

uint64_t sub_1DD3DAA78(uint64_t a1, char *a2)
{
  *(void *)a1 = &unk_1F3891B10;
  uint64_t v4 = a1 + 8;
  sub_1DD3E01C8(a1 + 8, 1988465669);
  *(void *)(a1 + 200) = 0;
  *(_DWORD *)(a1 + 120) = -1;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = &unk_1F3891A90;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  CFDataRef v5 = (char **)(a1 + 160);
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 0;
  *(void *)(a1 + 208) = 0;
  int v6 = sub_1DD3DE8B4(a2, 0, 0);
  *(_DWORD *)(a1 + 120) = v6;
  if (v6 <= 0)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "VideoParser: error opening %s\n", a2);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](exception, "File open error");
    goto LABEL_29;
  }
  if (sub_1DD3E02C0(v4, v6))
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "VideoParser: error reading header from %s\n", a2);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](exception, "VPHeader error");
LABEL_29:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  off_t v7 = lseek(*(_DWORD *)(a1 + 120), 0, 1);
  sub_1DD3DAE98((_DWORD *)a1);
  unsigned int v8 = *(_DWORD *)(a1 + 16);
  unint64_t v9 = v7 + v8 * (unint64_t)*(unsigned int *)(a1 + 192);
  size_t v10 = v9 + 12 * v8;
  *(void *)(a1 + 200) = v10;
  unsigned int v11 = (char *)mmap(0, v10, 1, 2, *(_DWORD *)(a1 + 120), 0);
  double v12 = v11;
  *(void *)(a1 + 128) = v11;
  if (!v11)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "VideoParser: mmap(%s, %llu) failed\n", a2, *(void *)(a1 + 200));
    id v33 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](v33, "mmap error");
    __cxa_throw(v33, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  *(void *)(a1 + 184) = &v11[v7];
  id v13 = *(void **)(a1 + 160);
  if (v13)
  {
    *(void *)(a1 + 168) = v13;
    operator delete(v13);
    *CFDataRef v5 = 0;
    *(void *)(a1 + 168) = 0;
    *(void *)(a1 + 176) = 0;
  }
  *CFDataRef v5 = 0;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  if (*(_DWORD *)(a1 + 16))
  {
    unsigned int v14 = 0;
    id v15 = &v12[v9];
    do
    {
      CMTimeMake(&v34, bswap64(*(void *)v15), bswap32(*((_DWORD *)v15 + 2)));
      unint64_t v17 = *(void *)(a1 + 168);
      unint64_t v16 = *(void *)(a1 + 176);
      if (v17 >= v16)
      {
        unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (void)*v5) >> 3);
        unint64_t v21 = v20 + 1;
        if (v20 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_1DD3A9B50();
        }
        unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (void)*v5) >> 3);
        if (2 * v22 > v21) {
          unint64_t v21 = 2 * v22;
        }
        if (v22 >= 0x555555555555555) {
          unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23) {
          uint64_t v24 = (char *)sub_1DD3A9BF8(a1 + 176, v23);
        }
        else {
          uint64_t v24 = 0;
        }
        unint64_t v25 = &v24[24 * v20];
        long long v26 = *(_OWORD *)&v34.value;
        *((void *)v25 + 2) = v34.epoch;
        *(_OWORD *)unint64_t v25 = v26;
        unsigned int v28 = *(char **)(a1 + 160);
        BOOL v27 = *(char **)(a1 + 168);
        uint64_t v29 = v25;
        if (v27 != v28)
        {
          do
          {
            long long v30 = *(_OWORD *)(v27 - 24);
            *((void *)v29 - 1) = *((void *)v27 - 1);
            *(_OWORD *)(v29 - 24) = v30;
            v29 -= 24;
            v27 -= 24;
          }
          while (v27 != v28);
          BOOL v27 = *v5;
        }
        uint64_t v19 = v25 + 24;
        *(void *)(a1 + 160) = v29;
        *(void *)(a1 + 168) = v25 + 24;
        *(void *)(a1 + 176) = &v24[24 * v23];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        long long v18 = *(_OWORD *)&v34.value;
        *(void *)(v17 + 16) = v34.epoch;
        *(_OWORD *)unint64_t v17 = v18;
        uint64_t v19 = (char *)(v17 + 24);
      }
      v15 += 12;
      *(void *)(a1 + 168) = v19;
      ++v14;
    }
    while (v14 < *(_DWORD *)(a1 + 16));
  }
  return a1;
}

void sub_1DD3DAE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, void *a14, uint64_t a15)
{
  __cxa_free_exception(v17);
  uint64_t v19 = *v16;
  if (*v16)
  {
    *(void *)(v15 + 168) = v19;
    operator delete(v19);
  }
  *a14 = a13;
  if (*a12) {
    free(*a12);
  }
  sub_1DD3E0284(a15);
  _Unwind_Resume(a1);
}

_DWORD *sub_1DD3DAE98(_DWORD *result)
{
  result[48] = 0;
  if (result[17])
  {
    unsigned int v1 = result;
    unsigned int v2 = 0;
    uint64_t v3 = (uint64_t)(result + 2);
    do
    {
      uint64_t result = (_DWORD *)sub_1DD3E0B2C(v3, v2);
      v1[48] += result[1] * result[2];
      ++v2;
    }
    while (v2 < v1[17]);
  }
  return result;
}

void *sub_1DD3DAF00(void *a1)
{
  *a1 = &unk_1F3891A90;
  unsigned int v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  return a1;
}

uint64_t sub_1DD3DAF50(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  *(void *)a1 = &unk_1F3891B10;
  sub_1DD3E01C8(a1 + 8, 1988465669);
  *(_OWORD *)(a1 + 160) = 0u;
  *(_DWORD *)(a1 + 120) = -1;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = &unk_1F3891A90;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  __p = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (sub_1DD3D8FE0(v9, v10, a4, a1 + 8, a1 + 136, &__p, v11))
  {
    fwrite("VideoParser: error instantiating from asset,\n", 0x2DuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](exception, "VideoParser error");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  *(void *)(a1 + 184) = *(void *)(a1 + 144);
  if ((void **)(a1 + 160) != &__p) {
    sub_1DD3B5538((char *)(a1 + 160), (char *)__p, (uint64_t)v15, 0xAAAAAAAAAAAAAAABLL * ((v15 - (unsigned char *)__p) >> 3));
  }
  sub_1DD3DAE98((_DWORD *)a1);
  if (__p)
  {
    uint64_t v15 = __p;
    operator delete(__p);
  }

  return a1;
}

void sub_1DD3DB11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11)
{
  __cxa_free_exception(a9);
  if (__p) {
    operator delete(__p);
  }
  unint64_t v21 = *v18;
  if (*v18)
  {
    *(void *)(v14 + 168) = v21;
    operator delete(v21);
  }
  *uint64_t v16 = v17;
  if (*v19) {
    free(*v19);
  }
  sub_1DD3E0284(v15);

  _Unwind_Resume(a1);
}

uint64_t sub_1DD3DB188(uint64_t a1)
{
  *(void *)a1 = &unk_1F3891B10;
  unsigned int v2 = *(void **)(a1 + 128);
  if (v2) {
    munmap(v2, *(void *)(a1 + 200));
  }
  int v3 = *(_DWORD *)(a1 + 120);
  if (v3 >= 1) {
    close(v3);
  }
  uint64_t v4 = *(void **)(a1 + 160);
  if (v4)
  {
    *(void *)(a1 + 168) = v4;
    operator delete(v4);
  }
  *(void *)(a1 + 136) = &unk_1F3891A90;
  CFDataRef v5 = *(void **)(a1 + 144);
  if (v5) {
    free(v5);
  }
  sub_1DD3E0284(a1 + 8);
  return a1;
}

void sub_1DD3DB234(uint64_t a1)
{
  sub_1DD3DB188(a1);

  JUMPOUT(0x1E01B4150);
}

uint64_t sub_1DD3DB26C(uint64_t a1, unsigned int a2)
{
  return sub_1DD3E0B2C(a1 + 8, a2);
}

void sub_1DD3DB274(void *a1)
{
  *a1 = &unk_1F3891A90;
  unsigned int v1 = (void *)a1[1];
  if (v1) {
    free(v1);
  }

  JUMPOUT(0x1E01B4150);
}

id sub_1DD3DB2E0(void *a1, uint64_t a2, int a3, long long *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10)
{
  id v19 = a1;
  unint64_t v20 = v19;
  unint64_t v21 = v19;
  if (a2)
  {
    unint64_t v21 = sub_1DD3DB3F0(v19, a2);
  }
  unint64_t v22 = sub_1DD3DB570(v21, a5, a6, a7, a8);

  unint64_t v23 = sub_1DD3DB694(v22, a3, a9, a10);

  if (a4)
  {
    uint64_t v24 = sub_1DD3DB8F0(v23, a4);

    unint64_t v23 = (void *)v24;
  }

  return v23;
}

id sub_1DD3DB3F0(void *a1, uint64_t a2)
{
  v16[9] = *(double *)MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  for (uint64_t i = 0; i != 9; ++i)
    v16[i] = *(float *)(a2 + 4 * i);
  [v3 extent];
  double v7 = v6;
  [v4 extent];
  v15[1] = v8;
  v15[2] = 1.0;
  v14[0] = v7;
  v14[1] = v8;
  void v14[2] = 1.0;
  v15[0] = 0.0;
  double v12 = v7;
  long long v13 = xmmword_1DD3E8660;
  id v9 = [MEMORY[0x1E4F1E040] filterWithName:@"CIPerspectiveTransform"];
  [v9 setValue:v4 forKey:@"inputImage"];
  sub_1DD3DBA74(v15, v16, v9, @"inputTopLeft");
  sub_1DD3DBA74(v14, v16, v9, @"inputTopRight");
  sub_1DD3DBA74(dbl_1DD3E8670, v16, v9, @"inputBottomLeft");
  sub_1DD3DBA74(&v12, v16, v9, @"inputBottomRight");
  id v10 = [v9 outputImage];

  return v10;
}

id sub_1DD3DB570(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  [v9 extent];
  v20.origin.double x = a2;
  v20.origin.double y = a3;
  v20.size.double width = a4;
  v20.size.double height = a5;
  if (CGRectEqualToRect(v19, v20) || a4 == 0.0 || a5 == 0.0)
  {
    id v13 = v9;
  }
  else
  {
    double v10 = trunc(a5);
    double v11 = trunc(a2);
    double v12 = trunc(a3);
    objc_msgSend(v9, "imageByCroppingToRect:", v11, v12, trunc(a4), v10);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != 0.0 || v12 != 0.0)
    {
      memset(&v17, 0, sizeof(v17));
      CGAffineTransformMakeTranslation(&v17, -v11, -v12);
      CGAffineTransform v16 = v17;
      uint64_t v14 = [v13 imageByApplyingTransform:&v16];

      id v13 = (id)v14;
    }
  }

  return v13;
}

id sub_1DD3DB694(void *a1, int a2, double a3, double a4)
{
  id v7 = a1;
  [v7 extent];
  BOOL v10 = a3 == v9 && a4 == v8;
  if (v10 || a3 == 0.0 || a4 == 0.0)
  {
    id v16 = v7;
LABEL_12:
    uint64_t v15 = v16;
    goto LABEL_13;
  }
  double v11 = trunc(a3);
  switch(a2)
  {
    case 2:
      double v18 = trunc(a4);
      [v7 extent];
      CGFloat v20 = v11 / v19;
      [v7 extent];
      memset(&v25, 0, sizeof(v25));
      CGAffineTransformMakeScale(&v25, v20, v18 / v21);
      CGAffineTransform v24 = v25;
      id v16 = [v7 imageByApplyingTransform:&v24 highQualityDownsample:1];
      goto LABEL_12;
    case 1:
      double v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CIBicubicScaleTransform"];
      [v12 setDefaults];
      [v12 setValue:&unk_1F3899A88 forKey:@"inputB"];
      [v12 setValue:&unk_1F3899A98 forKey:@"inputC"];
      [v12 setValue:v7 forKey:*MEMORY[0x1E4F1E480]];
      [v7 extent];
      unint64_t v23 = [NSNumber numberWithDouble:v11 / v22];
      [v12 setValue:v23 forKey:*MEMORY[0x1E4F1E4F0]];

      uint64_t v15 = [v12 outputImage];
      goto LABEL_18;
    case 0:
      double v12 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform"];
      [v12 setDefaults];
      [v12 setValue:v7 forKey:*MEMORY[0x1E4F1E480]];
      [v7 extent];
      uint64_t v14 = [NSNumber numberWithDouble:v11 / v13];
      [v12 setValue:v14 forKey:*MEMORY[0x1E4F1E4F0]];
      uint64_t v15 = [v12 outputImage];

LABEL_18:
      goto LABEL_13;
  }
  NSLog(&cfstr_Alresizetransf.isa);
  uint64_t v15 = 0;
LABEL_13:

  return v15;
}

id sub_1DD3DB8F0(void *a1, long long *a2)
{
  id v3 = a1;
  if (a2
    && (long long v4 = a2[1],
        *(_OWORD *)&v18.a = *a2,
        *(_OWORD *)&v18.c = v4,
        *(_OWORD *)&v18.tdouble x = a2[2],
        !CGAffineTransformIsIdentity(&v18)))
  {
    long long v6 = a2[1];
    long long v16 = *a2;
    long long v17 = v6;
    [v3 extent];
    float v7 = v20.size.width * 0.5;
    *(_OWORD *)&v18.a = v16;
    *(_OWORD *)&v18.c = v17;
    float v8 = v20.size.height * 0.5;
    v18.tdouble x = 0.0;
    v18.tdouble y = 0.0;
    CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
    float v9 = v21.size.width * 0.5;
    float v10 = v21.size.height * 0.5;
    CGAffineTransformMakeTranslation(&v18, (float)-v7, (float)-v8);
    CGAffineTransform v15 = v18;
    double v11 = [v3 imageByApplyingTransform:&v15];
    CGAffineTransformMakeTranslation(&v15, v9, v10);
    CGAffineTransform v18 = v15;
    *(_OWORD *)&t1.a = v16;
    *(_OWORD *)&t1.c = v17;
    t1.tdouble x = 0.0;
    t1.tdouble y = 0.0;
    CGAffineTransform v13 = v15;
    CGAffineTransformConcat(&v15, &t1, &v13);
    CGAffineTransform v18 = v15;
    id v5 = [v11 imageByApplyingTransform:&v15];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

void sub_1DD3DBA74(double *a1, double *a2, void *a3, void *a4)
{
  double v5 = a1[1];
  double v6 = a1[2];
  double v7 = a2[1] * v5 + *a2 * *a1 + a2[2] * v6;
  double v8 = v5 * a2[4] + a2[3] * *a1 + a2[5] * v6;
  double v9 = 1.0 / (v5 * a2[7] + a2[6] * *a1 + a2[8] * v6);
  double v10 = v7 * v9;
  double v11 = v8 * v9;
  double v12 = (void *)MEMORY[0x1E4F1E080];
  id v13 = a4;
  id v14 = a3;
  id v15 = [v12 vectorWithX:v10 Y:v11];
  [v14 setValue:v15 forKey:v13];
}

double sub_1DD3DBB58(uint64_t a1)
{
  *(_DWORD *)(a1 + 32) = 1065353216;
  *(void *)&double result = 1065353216;
  *(_OWORD *)a1 = xmmword_1DD3E8688;
  *(_OWORD *)(a1 + 16) = unk_1DD3E8698;
  return result;
}

void sub_1DD3DBC60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3DBCD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3DC0AC(CGImage *a1, int a2, int a3, CGColorSpace *ColorSpace, int a5, int a6, uint64_t a7, void **a8)
{
  *(void *)a7 = CGImageGetWidth(a1);
  *(void *)(a7 + 8) = CGImageGetHeight(a1);
  *(unsigned char *)(a7 + 16) = CGImageGetBitsPerComponent(a1);
  unsigned __int8 BitsPerPixel = CGImageGetBitsPerPixel(a1);
  *(unsigned char *)(a7 + 17) = BitsPerPixel;
  unsigned int v17 = *(unsigned __int8 *)(a7 + 16);
  if (v17 == 8)
  {
    size_t v32 = a8;
    unsigned int v18 = 1;
    if (ColorSpace) {
      goto LABEL_7;
    }
  }
  else
  {
    if (v17 != 16)
    {
      printf("***BIBitmapFromImage: %u bitsPerComponents not supported\n", *(unsigned __int8 *)(a7 + 16));
      return 0xFFFFFFFFLL;
    }
    size_t v32 = a8;
    unsigned int v18 = 2;
    if (ColorSpace) {
      goto LABEL_7;
    }
  }
  ColorSpace = CGImageGetColorSpace(a1);
  if (!ColorSpace)
  {
    fwrite("***BIBitmapFromImage: erro obtaining color space from image\n", 0x3CuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    return 0xFFFFFFFFLL;
  }
LABEL_7:
  unsigned int v19 = BitsPerPixel / v17;
  if (v19 != 1)
  {
    if (a6) {
      int v23 = 6;
    }
    else {
      int v23 = 5;
    }
    *(void *)(a7 + 24) = *(void *)a7 * 4 * v18;
    if (v19 == 4)
    {
      CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a1);
      if (AlphaInfo <= kCGImageAlphaNoneSkipFirst && ((1 << AlphaInfo) & 0x61) != 0)
      {
        *(unsigned char *)(a7 + 17) = 3 * *(unsigned char *)(a7 + 16);
      }
      else if (a6)
      {
        int v23 = 2;
      }
      else
      {
        int v23 = 1;
      }
    }
    if (a5) {
      int v27 = 0x4000;
    }
    else {
      int v27 = 0x2000;
    }
    uint32_t BitmapInfo = v23 | v27;
    unsigned int v18 = 4;
    if (a2) {
      goto LABEL_9;
    }
LABEL_32:
    unint64_t v22 = *(void *)(a7 + 24);
    goto LABEL_33;
  }
  *(void *)(a7 + 24) = *(void *)a7 * v18;
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a1);
  if (!a2) {
    goto LABEL_32;
  }
LABEL_9:
  if (!a3)
  {
    fwrite("***Pad size of 0 invalid\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    CGAffineTransform v25 = v32;
    goto LABEL_36;
  }
  if (a2 == 1) {
    int v21 = v18;
  }
  else {
    int v21 = 1;
  }
  unint64_t v22 = ((unint64_t)(v21 * a3) + *(void *)(a7 + 24) - 1)
      / (v21 * a3)
      * (v21 * a3);
  *(void *)(a7 + 24) = v22;
LABEL_33:
  size_t v28 = *(void *)(a7 + 8) * v22;
  uint64_t v29 = malloc_type_malloc(v28, 0x20AD519uLL);
  CGAffineTransform v25 = v32;
  *size_t v32 = v29;
  bzero(v29, v28);
  long long v30 = CGBitmapContextCreate(*v32, *(void *)a7, *(void *)(a7 + 8), *(unsigned __int8 *)(a7 + 16), *(void *)(a7 + 24), ColorSpace, BitmapInfo);
  if (v30)
  {
    int v31 = v30;
    CGContextSetInterpolationQuality(v30, kCGInterpolationHigh);
    v33.size.double width = (double)*(unint64_t *)a7;
    v33.size.double height = (double)*(unint64_t *)(a7 + 8);
    v33.origin.double x = 0.0;
    v33.origin.double y = 0.0;
    CGContextDrawImage(v31, v33, a1);
    CFRelease(v31);
    return 0;
  }
  fwrite("***BIBitmapFromImage: Error creating CGBitmapContext\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
LABEL_36:
  if (*v25)
  {
    free(*v25);
    *CGAffineTransform v25 = 0;
  }
  return 1;
}

void sub_1DD3DC9BC()
{
  __assert_rtn("+[LoopQuicktimeMetadata metadataDictionaryForAssetURL:]", "LoopQuicktimeMetadata.m", 72, "err == NULL");
}

uint64_t sub_1DD3DC9E8(uint64_t a1, uint64_t a2, long long *a3, CMTime *a4)
{
  *(void *)a1 = &unk_1F3891D00;
  *(_OWORD *)(a1 + 8) = 0u;
  double v5 = (uint64_t *)(a1 + 8);
  uint64_t v6 = a1 + 32;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 0;
  uint64_t v7 = *((void *)a3 + 2);
  *(_OWORD *)(a1 + 60) = *a3;
  *(void *)(a1 + 76) = v7;
  double v8 = (CMTime *)MEMORY[0x1E4F1FA48];
  *(_OWORD *)(a1 + 84) = *MEMORY[0x1E4F1FA48];
  *(void *)(a1 + 100) = v8->epoch;
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](exception, "FrameTimeNormalizer constructor requires valid FramPresTimeArray.");
    goto LABEL_30;
  }
  if (v5 != (uint64_t *)a2) {
    sub_1DD3B5538((char *)(a1 + 8), *(char **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
  }
  double v11 = (_OWORD *)(a1 + 60);
  double v12 = (_OWORD *)(a1 + 84);
  if ((~*(_DWORD *)(a1 + 72) & 0x11) == 0)
  {
    sub_1DD3E4B28(v5, 0, (uint64_t)&v47);
    *double v11 = v47;
    *(void *)(a1 + 76) = v48;
    goto LABEL_8;
  }
  *(_OWORD *)&time1.CMTimeValue value = *v11;
  time1.CMTimeEpoch epoch = *(void *)(a1 + 76);
  CMTime time2 = *v8;
  if (!CMTimeCompare(&time1, &time2))
  {
    fwrite("***FrameTimeNormalizer invalid zero normFrameTime\n", 0x32uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1E01B40A0](exception, "Unsupported normFrameTime");
LABEL_30:
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  long long v13 = *a3;
  *(void *)(a1 + 76) = *((void *)a3 + 2);
  *double v11 = v13;
LABEL_8:
  id v14 = *(long long **)(a1 + 8);
  unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - (void)v14) >> 3);
  uint64_t v16 = -1431655765 * ((uint64_t)(*(void *)(a1 + 16) - (void)v14) >> 3);
  if (-1431655765 * ((uint64_t)(*(void *)(a1 + 16) - (void)v14) >> 3))
  {
    long long v17 = *v14;
    *(void *)(a1 + 100) = *((void *)v14 + 2);
    *double v12 = v17;
  }
  else
  {
    *double v12 = *(_OWORD *)&v8->value;
    *(void *)(a1 + 100) = v8->epoch;
  }
  if (v15 != v16)
  {
    CGRect v33 = "mFramePresTimes.size() == numRawFrames()";
    int v34 = 53;
    goto LABEL_26;
  }
  sub_1DD3B5A68(&v46, v15);
  unsigned int v18 = *(void **)v6;
  if (*(void *)v6)
  {
    *(void *)(a1 + 40) = v18;
    operator delete(v18);
    *(void *)uint64_t v6 = 0;
    *(void *)(v6 + 8) = 0;
    *(void *)(v6 + 16) = 0;
  }
  *(CMTime *)(a1 + 32) = v46;
  unsigned int v19 = *(long long **)(a1 + 8);
  if (-1431655765 * ((*(void *)(a1 + 16) - (void)v19) >> 3) == 1)
  {
    LODWORD(v20) = 0;
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    do
    {
      int v23 = (long long *)((char *)v19 + v21);
      long long v24 = *(long long *)((char *)v23 + 24);
      lhs.CMTimeEpoch epoch = *((void *)v23 + 5);
      *(_OWORD *)&lhs.CMTimeValue value = v24;
      long long v25 = *v23;
      rhs.CMTimeEpoch epoch = *((void *)v23 + 2);
      *(_OWORD *)&rhs.CMTimeValue value = v25;
      CMTimeSubtract(&v46, &lhs, &rhs);
      ++v22;
      uint64_t v26 = *(void *)(a1 + 32) + v21;
      long long v27 = *(_OWORD *)&v46.value;
      *(void *)(v26 + 16) = v46.epoch;
      *(_OWORD *)uint64_t v26 = v27;
      unsigned int v19 = *(long long **)(a1 + 8);
      unint64_t v20 = -1 - 1431655765 * ((*(void *)(a1 + 16) - (void)v19) >> 3);
      v21 += 24;
    }
    while (v22 < v20);
  }
  if ((a4->flags & 0x1D) == 1)
  {
    memset(&v46, 0, sizeof(v46));
    long long v28 = *v19;
    v43.CMTimeEpoch epoch = *((void *)v19 + 2);
    *(_OWORD *)&v43.CMTimeValue value = v28;
    CMTime v42 = *a4;
    CMTimeAdd(&v46, &v43, &v42);
    CMTime v41 = *(CMTime *)(*(void *)(a1 + 8)
                    + 24 * (-1431655765 * ((*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3) - 1));
    CMTime v40 = v41;
    CMTime v39 = v46;
    if (CMTimeCompare(&v40, &v39) >= 1) {
      __assert_rtn("FrameTimeNormalizer", "FrameTimeNormalizer.mm", 67, "CMTIME_COMPARE_INLINE(rawLastFrameTime, <=, rawEndTime)");
    }
    memset(&v38, 0, sizeof(v38));
    CMTime v37 = v46;
    CMTime v36 = v41;
    CMTimeSubtract(&v38, &v37, &v36);
    uint64_t v29 = *(void *)(a1 + 32)
        + 24 * (-1 - 1431655765 * ((*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3));
    long long v30 = *(_OWORD *)&v38.value;
    CMTimeEpoch epoch = v38.epoch;
  }
  else
  {
    uint64_t v29 = *(void *)v6 + 24 * v20;
    long long v30 = *v11;
    CMTimeEpoch epoch = *(void *)(a1 + 76);
  }
  *(void *)(v29 + 16) = epoch;
  *(_OWORD *)uint64_t v29 = v30;
  if (*(void *)(a1 + 16) - *(void *)(a1 + 8) != *(void *)(a1 + 40) - *(void *)(a1 + 32))
  {
    CGRect v33 = "mFramePresTimes.size() == mFrameDurations.size()";
    int v34 = 75;
LABEL_26:
    __assert_rtn("FrameTimeNormalizer", "FrameTimeNormalizer.mm", v34, v33);
  }
  return a1;
}

void sub_1DD3DCE7C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v3);
  uint64_t v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 40) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(a1);
}

__n128 sub_1DD3DCED0@<Q0>(void *a1@<X0>, unsigned int a2@<W1>, CMTime *a3@<X8>)
{
  uint64_t v4 = a1[1];
  unsigned int v5 = -1431655765 * ((unint64_t)(a1[2] - v4) >> 3);
  if (v5 <= a2)
  {
    uint64_t v12 = MEMORY[0x1E4F1F9F8];
    __n128 result = *(__n128 *)MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&a3->CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    a3->CMTimeEpoch epoch = *(void *)(v12 + 16);
  }
  else
  {
    uint64_t v6 = (__n128 *)(a1[4] + 24 * a2);
    __n128 result = *v6;
    *(__n128 *)&a3->CMTimeValue value = *v6;
    a3->CMTimeEpoch epoch = v6[1].n128_i64[0];
    if (v5 - 1 > a2)
    {
      memset(&v17, 0, sizeof(v17));
      double v8 = (long long *)(v4 + 24 * (a2 + 1));
      long long v9 = *v8;
      lhs.CMTimeEpoch epoch = *((void *)v8 + 2);
      *(_OWORD *)&lhs.CMTimeValue value = v9;
      double v10 = (long long *)(v4 + 24 * a2);
      long long v11 = *v10;
      rhs.CMTimeEpoch epoch = *((void *)v10 + 2);
      *(_OWORD *)&rhs.CMTimeValue value = v11;
      CMTimeSubtract(&v17, &lhs, &rhs);
      CMTime time1 = *a3;
      CMTime v13 = v17;
      if (CMTimeCompare(&time1, &v13)) {
        sub_1DD3DE804();
      }
    }
  }
  return result;
}

uint64_t sub_1DD3DCFD4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (a2[1] - *a2 != v3 - v2) {
    return 0;
  }
  if (v3 == v2) {
    return 1;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  LOBYTE(v8) = 1;
  do
  {
    uint64_t v9 = *a2 + v6;
    CMTimeEpoch v10 = *(void *)(v9 + 16);
    *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)v9;
    time1.CMTimeEpoch epoch = v10;
    uint64_t v11 = v2 + v6;
    CMTimeEpoch v12 = *(void *)(v11 + 16);
    *(_OWORD *)&v14.CMTimeValue value = *(_OWORD *)v11;
    v14.CMTimeEpoch epoch = v12;
    uint64_t v8 = (CMTimeCompare(&time1, &v14) == 0) & v8;
    ++v7;
    uint64_t v2 = *(void *)(a1 + 8);
    v6 += 24;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 16) - v2) >> 3) > v7);
  return v8;
}

uint64_t sub_1DD3DD0BC(CMTime *a1, long long **a2)
{
  uint64_t v2 = *a2;
  if (a2[1] == *a2) {
    return 0;
  }
  long long v5 = *v2;
  time1.CMTimeEpoch epoch = *((void *)v2 + 2);
  *(_OWORD *)&time1.CMTimeValue value = v5;
  CMTime time2 = *a1;
  uint64_t v6 = -1;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    uint64_t v7 = 24;
    while (0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3) > v6 + 2)
    {
      uint64_t v8 = (uint64_t)*a2 + v7;
      long long v9 = *(_OWORD *)v8;
      time1.CMTimeEpoch epoch = *(void *)(v8 + 16);
      *(_OWORD *)&time1.CMTimeValue value = v9;
      CMTime time2 = *a1;
      ++v6;
      v7 += 24;
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
        goto LABEL_6;
      }
    }
    ++v6;
  }
  else
  {
LABEL_6:
    if (v6 == -1) {
      return 0;
    }
  }
  CMTimeEpoch v10 = *a2;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3);
  if (v6 == v11 - 1) {
    return v6;
  }
  if (v11 < 2) {
    return 0;
  }
  memset(&v24, 0, sizeof(v24));
  CMTime lhs = *a1;
  uint64_t v12 = (uint64_t)v10 + 24 * v6;
  CMTimeEpoch v13 = *(void *)(v12 + 16);
  *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)v12;
  rhs.CMTimeEpoch epoch = v13;
  CMTimeSubtract(&v24, &lhs, &rhs);
  memset(&v21, 0, sizeof(v21));
  uint64_t v14 = (uint64_t)*a2 + 24 * (v6 + 1);
  CMTimeEpoch v15 = *(void *)(v14 + 16);
  *(_OWORD *)&v20.CMTimeValue value = *(_OWORD *)v14;
  v20.CMTimeEpoch epoch = v15;
  CMTime v19 = *a1;
  CMTimeSubtract(&v21, &v20, &v19);
  CMTime v18 = v21;
  CMTime v17 = v24;
  if (CMTimeCompare(&v18, &v17) < 0) {
    ++v6;
  }
  return v6;
}

uint64_t sub_1DD3DD2A8(CMTime *a1, uint64_t *a2, int *a3)
{
  uint64_t v5 = *a2;
  int v6 = -1431655765 * ((unint64_t)(a2[1] - *a2) >> 3);
  if (a3)
  {
    int v7 = *a3;
    if (!v6) {
      return 0;
    }
  }
  else
  {
    int v7 = 0;
    if (!v6) {
      return 0;
    }
  }
  CMTime time1 = *a1;
  CMTimeEpoch v8 = *(void *)(v5 + 16);
  *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)v5;
  time2.CMTimeEpoch epoch = v8;
  if (CMTimeCompare(&time1, &time2) < 1) {
    return 0;
  }
  uint64_t v9 = (v6 - 1);
  CMTime v25 = *a1;
  uint64_t v10 = *a2 + 24 * v9;
  CMTimeEpoch v11 = *(void *)(v10 + 16);
  *(_OWORD *)&v24.CMTimeValue value = *(_OWORD *)v10;
  v24.CMTimeEpoch epoch = v11;
  if (CMTimeCompare(&v25, &v24) < 0)
  {
    uint64_t v9 = v7 - (v7 == v9);
    uint64_t v12 = (v6 - 2);
    while (1)
    {
      CMTime v23 = *(CMTime *)(*a2 + 24 * v9);
      CMTime v22 = *a1;
      CMTime v21 = v23;
      if (!CMTimeCompare(&v22, &v21)) {
        break;
      }
      CMTime v20 = *a1;
      CMTime v19 = v23;
      if (CMTimeCompare(&v20, &v19) < 1)
      {
        if (!v9) {
          return v9;
        }
        uint64_t v13 = (v9 - 1);
      }
      else
      {
        if (v9 == v12) {
          return v12;
        }
        CMTime v18 = *a1;
        uint64_t v13 = (v9 + 1);
        uint64_t v14 = *a2 + 24 * v13;
        CMTimeEpoch v15 = *(void *)(v14 + 16);
        *(_OWORD *)&v17.CMTimeValue value = *(_OWORD *)v14;
        v17.CMTimeEpoch epoch = v15;
        if (CMTimeCompare(&v18, &v17) < 0) {
          return v9;
        }
      }
      uint64_t v9 = v13;
    }
  }
  return v9;
}

uint64_t sub_1DD3DD47C(uint64_t a1, CMTime *a2)
{
  CMTime v3 = *a2;
  return sub_1DD3DD2A8(&v3, (uint64_t *)(a1 + 8), (int *)(a1 + 56));
}

uint64_t sub_1DD3DD4B8(uint64_t a1, CMTime *a2)
{
  CMTime v3 = *a2;
  return sub_1DD3DD2A8(&v3, (uint64_t *)(a1 + 8), (int *)(a1 + 56));
}

uint64_t sub_1DD3DD4F4(uint64_t a1, CMTime *a2)
{
  CMTime v3 = *a2;
  return sub_1DD3DD0BC(&v3, (long long **)(a1 + 8));
}

uint64_t sub_1DD3DD52C(uint64_t a1, CMTime *a2)
{
  CMTime v3 = *a2;
  return sub_1DD3DD2A8(&v3, (uint64_t *)(a1 + 8), (int *)(a1 + 56));
}

CMTime *sub_1DD3DD568@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  __n128 result = (CMTime *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  if (result >= a2)
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    CMTime time = *(CMTime *)(a1 + 60);
    CMTimeMultiply((CMTime *)a3, &time, a2);
    CMTime lhs = *(CMTime *)a3;
    CMTime v9 = *(CMTime *)(a1 + 84);
    __n128 result = CMTimeAdd(&v11, &lhs, &v9);
    *(_OWORD *)a3 = *(_OWORD *)&v11.value;
    CMTimeEpoch epoch = v11.epoch;
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch epoch = *(void *)(v7 + 16);
  }
  *(void *)(a3 + 16) = epoch;
  return result;
}

uint64_t sub_1DD3DD64C(uint64_t a1, uint64_t a2)
{
  return *(void *)a2 * *(int *)(a1 + 68) / (*(void *)(a1 + 60) * *(int *)(a2 + 8));
}

uint64_t sub_1DD3DD66C(void *a1, unsigned int a2)
{
  if ((*(unsigned int (**)(void *))(*a1 + 24))(a1) <= a2)
  {
    (*(void (**)(void *))(*a1 + 24))(a1);
    return -1431655765 * ((a1[2] - a1[1]) >> 3) - 1;
  }
  else
  {
    long long v7 = 0uLL;
    uint64_t v8 = 0;
    sub_1DD3DD568((uint64_t)a1, a2, (uint64_t)&v7);
    long long v5 = v7;
    uint64_t v6 = v8;
    return (*(uint64_t (**)(void *, long long *))(*a1 + 32))(a1, &v5);
  }
}

CMTimeValue sub_1DD3DD760(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  int v2 = -1431655765 * ((unint64_t)(*(void *)(a1 + 16) - v1) >> 3);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = (long long *)(v1 + 24 * (v2 - 1));
  long long v5 = *v4;
  v13.CMTimeEpoch epoch = *((void *)v4 + 2);
  *(_OWORD *)&v13.CMTimeValue value = v5;
  long long v6 = *v4;
  lhs.CMTimeEpoch epoch = *((void *)v4 + 2);
  *(_OWORD *)&lhs.CMTimeValue value = v6;
  sub_1DD3DCED0((void *)a1, v2 - 1, &rhs);
  CMTimeAdd(&v13, &lhs, &rhs);
  memset(&v10, 0, sizeof(v10));
  CMTime v9 = v13;
  CMTime v8 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v10, &v9, &v8);
  return (*(void *)(a1 + 60) * v10.timescale + v10.value * *(int *)(a1 + 68) - 1)
       / (*(void *)(a1 + 60)
        * v10.timescale);
}

uint64_t sub_1DD3DD848(uint64_t a1, CMTime *a2)
{
  CMTime time1 = *a2;
  CMTime time = *(CMTime *)(a1 + 60);
  int32_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  CMTimeMultiply(&lhs, &time, v4);
  CMTime rhs = *(CMTime *)(a1 + 84);
  CMTimeAdd(&time2, &lhs, &rhs);
  if (CMTimeCompare(&time1, &time2) > 0) {
    return 0;
  }
  long long v6 = *(_OWORD *)&a2->value;
  CMTimeEpoch epoch = a2->epoch;
  return (*(uint64_t (**)(uint64_t, long long *))(*(void *)a1 + 48))(a1, &v6);
}

uint64_t sub_1DD3DD940(uint64_t a1)
{
  long long v9 = *(_OWORD *)(a1 + 60);
  uint64_t v10 = *(void *)(a1 + 76);
  uint64_t result = sub_1DD3E50AC((uint64_t)&v9, (uint64_t)&v11);
  *(CMTime *)(a1 + 108) = v11;
  CMTime v3 = *(long long **)(a1 + 8);
  if (-1431655765 * ((*(void *)(a1 + 16) - (void)v3) >> 3))
  {
    long long v4 = *v3;
    lhs.CMTimeEpoch epoch = *((void *)v3 + 2);
    *(_OWORD *)&lhs.CMTimeValue value = v4;
    CMTime v7 = *(CMTime *)(a1 + 108);
    uint64_t result = (uint64_t)CMTimeAdd(&v11, &lhs, &v7);
    *(_OWORD *)(a1 + 84) = *(_OWORD *)&v11.value;
    CMTimeEpoch epoch = v11.epoch;
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)(a1 + 84) = *MEMORY[0x1E4F1FA48];
    CMTimeEpoch epoch = *(void *)(v6 + 16);
  }
  *(void *)(a1 + 100) = epoch;
  return result;
}

CMTimeValue sub_1DD3DDA0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  int v2 = -1431655765 * ((unint64_t)(*(void *)(a1 + 16) - v1) >> 3);
  if (!v2) {
    return 0;
  }
  long long v4 = (long long *)(v1 + 24 * (v2 - 1));
  long long v5 = *v4;
  v13.CMTimeEpoch epoch = *((void *)v4 + 2);
  *(_OWORD *)&v13.CMTimeValue value = v5;
  long long v6 = *v4;
  lhs.CMTimeEpoch epoch = *((void *)v4 + 2);
  *(_OWORD *)&lhs.CMTimeValue value = v6;
  sub_1DD3DCED0((void *)a1, v2 - 1, &rhs);
  CMTimeAdd(&v13, &lhs, &rhs);
  memset(&v10, 0, sizeof(v10));
  CMTime v9 = v13;
  CMTime v8 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v10, &v9, &v8);
  return (*(void *)(a1 + 60) * v10.timescale + v10.value * *(int *)(a1 + 68) - 1)
       / (*(void *)(a1 + 60)
        * v10.timescale);
}

uint64_t sub_1DD3DDAF4(uint64_t a1, CMTime *a2)
{
  CMTime time1 = *a2;
  CMTime time = *(CMTime *)(a1 + 60);
  int32_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
  CMTimeMultiply(&lhs, &time, v4);
  CMTime rhs = *(CMTime *)(a1 + 84);
  CMTimeAdd(&time2, &lhs, &rhs);
  if (CMTimeCompare(&time1, &time2) > 0) {
    return 0;
  }
  long long v6 = *(_OWORD *)&a2->value;
  CMTimeEpoch epoch = a2->epoch;
  return (*(uint64_t (**)(uint64_t, long long *))(*(void *)a1 + 48))(a1, &v6);
}

uint64_t sub_1DD3DDBEC(uint64_t *a1, int a2, uint64_t a3)
{
  long long v6 = (void *)(a3 + 8);
  sub_1DD3B1A08(a3, *(void **)(a3 + 8));
  *(void *)a3 = v6;
  *(void *)(a3 + 16) = 0;
  *long long v6 = 0;
  uint64_t v7 = *a1;
  unint64_t v8 = ((a1[1] - *a1) >> 2) - 1;
  if ((a1[1] - *a1) >> 2 != 1)
  {
    unint64_t v9 = 0;
    BOOL v10 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 1;
    int v13 = 1;
    do
    {
      unsigned int v14 = *(_DWORD *)(v7 + 4 * v9);
      unsigned int v15 = *(_DWORD *)(v7 + 4 * v12);
      if (v15 < v14) {
        sub_1DD3DE830();
      }
      unint64_t v9 = v12;
      BOOL v16 = v15 == v14;
      if (v15 == v14)
      {
        if (v10)
        {
          ++v13;
        }
        else
        {
          unsigned int v11 = v12 - 1;
          int v13 = 2;
        }
        if (v8 == v12)
        {
          int v18 = v11 + a2;
          CMTime v19 = (unsigned int *)&v18;
          *((_DWORD *)sub_1DD3DE630((uint64_t **)a3, &v18, (uint64_t)&unk_1DD3E8721, &v19) + 8) = v13;
        }
      }
      else
      {
        if (v10)
        {
          int v18 = v11 + a2;
          CMTime v19 = (unsigned int *)&v18;
          *((_DWORD *)sub_1DD3DE630((uint64_t **)a3, &v18, (uint64_t)&unk_1DD3E8721, &v19) + 8) = v13;
        }
        int v13 = 1;
        unsigned int v11 = v12;
      }
      uint64_t v7 = *a1;
      unint64_t v8 = ((a1[1] - *a1) >> 2) - 1;
      ++v12;
      BOOL v10 = v16;
    }
    while (v8 > v9);
  }
  return 1;
}

uint64_t sub_1DD3DDD4C(uint64_t a1, int a2, unsigned int a3)
{
  if (a3 >= 2 && a3 + a2 <= (*(unsigned int (**)(uint64_t))(*(void *)a1 + 24))(a1))
  {
    uint64_t v7 = a3;
    sub_1DD3D5174(&v16, a3);
    for (uint64_t i = 0; i != v7; ++i)
    {
      int v9 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 16))(a1, (a2 + i));
      BOOL v10 = v16;
      *((_DWORD *)v16 + i) = v9;
    }
    v15[0] = 0;
    v15[1] = 0;
    uint64_t v13 = 0;
    unsigned int v14 = v15;
    __p = 0;
    unsigned int v12 = 0;
    sub_1DD3D30D8(&__p, v10, v17, (v17 - (uint64_t)v10) >> 2);
    sub_1DD3DDBEC((uint64_t *)&__p, a2, (uint64_t)&v14);
    if (__p)
    {
      unsigned int v12 = __p;
      operator delete(__p);
    }
    operator new();
  }
  return 0;
}

void sub_1DD3DE0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, void *__p, uint64_t a19)
{
  MEMORY[0x1E01B4150](v19, 0x20C40960023A9);
  sub_1DD3B1A08((uint64_t)&a15, a16);
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1DD3DE15C(int a1)
{
  if (a1)
  {
    if (a1 != 2)
    {
      if (a1 == 1) {
        operator new();
      }
      sub_1DD3DE85C();
    }
    operator new();
  }
  operator new();
}

void sub_1DD3DE2D0(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4150](v1, 0x10A1C40DD17C45DLL);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3DE30C()
{
  return 0;
}

void sub_1DD3DE334(void *a1)
{
  sub_1DD3D0E84(a1);

  JUMPOUT(0x1E01B4150);
}

CMTimeValue sub_1DD3DE36C(uint64_t a1, CMTime *a2)
{
  CMTime lhs = *a2;
  memset(&v6, 0, sizeof(v6));
  CMTime v4 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v6, &lhs, &v4);
  return v6.value * *(int *)(a1 + 68) / (*(void *)(a1 + 60) * v6.timescale);
}

void sub_1DD3DE3EC(void *a1)
{
  sub_1DD3D0E84(a1);

  JUMPOUT(0x1E01B4150);
}

uint64_t sub_1DD3DE424(void *a1, uint64_t a2)
{
  if (sub_1DD3DD66C(a1, a2) != a2
    && (*(unsigned int (**)(void *))(*a1 + 24))(a1) > a2)
  {
    sub_1DD3DE888();
  }
  return a2;
}

uint64_t sub_1DD3DE48C(uint64_t a1)
{
  return -1431655765 * ((*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3);
}

CMTimeValue sub_1DD3DE4A8(uint64_t a1, CMTime *a2)
{
  CMTime lhs = *a2;
  memset(&v6, 0, sizeof(v6));
  CMTime v4 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v6, &lhs, &v4);
  return v6.value * *(int *)(a1 + 68) / (*(void *)(a1 + 60) * v6.timescale);
}

uint64_t sub_1DD3DE524(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  return (*(uint64_t (**)(uint64_t, long long *))(*(void *)a1 + 48))(a1, &v3);
}

void sub_1DD3DE57C(void *a1)
{
  sub_1DD3D0E84(a1);

  JUMPOUT(0x1E01B4150);
}

CMTimeValue sub_1DD3DE5B4(uint64_t a1, CMTime *a2)
{
  CMTime lhs = *a2;
  memset(&v6, 0, sizeof(v6));
  CMTime v4 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v6, &lhs, &v4);
  return v6.value * *(int *)(a1 + 68) / (*(void *)(a1 + 60) * v6.timescale);
}

uint64_t *sub_1DD3DE630(uint64_t **a1, int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t v7 = a1 + 1;
  CMTime v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        int v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        CMTime v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      CMTime v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v9 = a1 + 1;
LABEL_10:
    unsigned int v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_1DD3B1B20(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void *sub_1DD3DE6F0(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1DD3DE768(a1, a2);
    CMTime v4 = (unsigned char *)a1[1];
    long long v5 = &v4[12 * a2];
    uint64_t v6 = 12 * a2;
    do
    {
      *CMTime v4 = 0;
      v4 += 12;
      v6 -= 12;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_1DD3DE74C(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1DD3DE768(void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_1DD3A9B50();
  }
  uint64_t result = (char *)sub_1DD3DE7BC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void *sub_1DD3DE7BC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    sub_1DD3A9C40();
  }
  return operator new(12 * a2);
}

void sub_1DD3DE804()
{
  __assert_rtn("rawFrameDurationForRawIndex", "FrameTimeNormalizer.mm", 115, "CMTIME_COMPARE_INLINE(frameDuration, ==, presTimeInterval)");
}

void sub_1DD3DE830()
{
  __assert_rtn("allRunsOfRepeats", "FrameTimeNormalizer.mm", 698, "nextVal >= currVal");
}

void sub_1DD3DE85C()
{
}

void sub_1DD3DE888()
{
  __assert_rtn("rawIndexForNormIndex", "FrameTimeNormalizer.h", 394, "normIndex == FrameTimeNormalizer::rawIndexForNormIndex(normIndex) || normIndex >= numNormFrames()");
}

uint64_t sub_1DD3DE8B4(char *a1, int a2, unsigned int a3)
{
  uint64_t v6 = (void *)MEMORY[0x1E01B4410]();
  sub_1DD3DE950(a1);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = open((const char *)[v7 UTF8String], a2, a3);
  if ((int)v8 <= 0)
  {
    sub_1DD3DEAD8(a1);
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

id sub_1DD3DE950(unsigned char *a1)
{
  int v2 = (void *)MEMORY[0x1E01B4410]();
  long long v3 = [NSString stringWithUTF8String:a1];
  uint64_t v4 = v3;
  if (*a1 == 47)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    id v7 = [v6 objectAtIndex:0];
    uint64_t v8 = v7;
    if (v7)
    {
      id v5 = [v7 stringByAppendingPathComponent:v4];
    }
    else
    {
      NSLog(&cfstr_ErrorObtaining_0.isa);
      id v5 = 0;
    }
  }

  return v5;
}

uint64_t sub_1DD3DEA34(void *a1, int a2, unsigned int a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)MEMORY[0x1E01B4410]();
  id v7 = [v5 path];
  uint64_t v8 = open((const char *)[v7 UTF8String], a2, a3);

  if ((int)v8 <= 0)
  {
    sub_1DD3DEB20(v5);
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

uint64_t sub_1DD3DEAD8(const char *a1)
{
  return fprintf((FILE *)*MEMORY[0x1E4F143C8], "***Error opening %s\n", a1);
}

void sub_1DD3DEB20(void *a1)
{
  id v2 = [a1 path];
  perror((const char *)[v2 UTF8String]);

  long long v3 = (FILE *)*MEMORY[0x1E4F143C8];
  id v4 = [a1 path];
  fprintf(v3, "***Error opening %s\n", (const char *)[v4 UTF8String]);
}

void sub_1DD3DECE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3DF478(void *a1, uint64_t a2, unsigned int a3, void *a4, float a5)
{
  int v9 = a4;
  int v10 = v9;
  if (a3 && a1 && a2 && a5 != 0.0)
  {
    uint64_t v11 = v9[2](v9, 0.0);
    unsigned int v12 = (void *)MEMORY[0x1E01B4410](v11);
    uint64_t v13 = [[VideoContext alloc] initWithWriter:0 pixelFormatFlags:3588];
    if (v13)
    {
      unsigned int v14 = v13;
      unsigned int v15 = [(VideoContext *)v13 ciCtx];
      *(float *)&double v16 = a5;
      uint64_t v17 = +[GIFBuilder builderWithContext:v15 forURL:a2 maxRes:a3 fps:v16];

      context = v12;
      if (v17)
      {
        id v18 = a1;
        id v19 = [[VideoReader alloc] initFromFile:v18];
        if (v19)
        {
          CMTime v38 = v18;
          unsigned int v20 = 0;
          double v21 = a5;
          while (1)
          {
            CMTime v22 = (void *)MEMORY[0x1E01B4410]();
            v45[0] = 0;
            unsigned int v23 = [v19 getFrameAsSampleBuf:v45];
            if (v23) {
              break;
            }
            ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v45[0]);
            uint64_t v25 = sub_1DD3DFD8C(ImageBuffer, 0);
            if (!v25)
            {
              NSLog(&cfstr_ErrorConvertin.isa);
LABEL_28:
              uint64_t v32 = 0;
              int v33 = 1;
LABEL_29:
              id v18 = v38;
              goto LABEL_32;
            }
            uint64_t v26 = (void *)v25;
            memset(&v44, 0, sizeof(v44));
            [v19 preferredTransform];
            CGAffineTransformInvert(&v44, &v43);
            if (v44.a <= 0.001 && v44.a >= -0.001)
            {
              [v19 preferredTransform];
              if (v42 <= 0.0)
              {
                objc_msgSend(v26, "extent", v42);
                v44.tdouble x = v28;
                CGFloat v27 = 0.0;
              }
              else
              {
                v44.tdouble x = 0.0;
                objc_msgSend(v26, "extent", v42);
              }
              v44.tdouble y = v27;
            }
            CGAffineTransform v41 = v44;
            uint64_t v29 = [v26 imageByApplyingTransform:&v41];

            int v30 = [v17 addImage:v29];
            CFRelease(v45[0]);
            if (!v30
              || ([v19 trackLengthT],
                  float v31 = (double)v20 / v21 / CMTimeGetSeconds(&time),
                  (v10[2](v10, v31) & 1) == 0))
            {

              goto LABEL_28;
            }
            ++v20;
          }
          unsigned int v34 = v23;
          if (v23 == 1)
          {
            uint64_t v32 = [v17 finish];
            int v33 = 0;
            goto LABEL_29;
          }
          id v18 = v38;
          unsigned int v35 = [v38 path];
          CMTime v36 = sub_1DD3DA8AC(v34);
          NSLog(&cfstr_ErrorReadingFr.isa, v35, v36);

          uint64_t v32 = 0;
        }
        else
        {
          uint64_t v32 = 1;
        }
        int v33 = 1;
LABEL_32:
      }
      else
      {
        uint64_t v32 = 1;
        int v33 = 1;
      }

      if (!v33)
      {
        v10[2](v10, 1.0);
        goto LABEL_35;
      }
    }
    else
    {
      NSLog(&cfstr_Creategiffromv_2.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Creategiffromv_1.isa);
  }
  uint64_t v32 = 0;
LABEL_35:

  return v32;
}

id sub_1DD3DFD8C(__CVBuffer *a1, void *a2)
{
  CFDictionaryRef v3 = a2;
  CFDictionaryRef v4 = CVBufferCopyAttachments(a1, kCVAttachmentMode_ShouldPropagate);
  CFDictionaryRef v5 = v4;
  unint64_t v6 = 0x1E4F1C000;
  if (v3)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E4F24B70]);
    if (Value && (CFDataRef v8 = Value, CFDataGetLength(Value)))
    {
      int v9 = CFDictionaryGetValue(v3, v8);
    }
    else
    {
      uint64_t v10 = *MEMORY[0x1E4F24B28];
      long long v52 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24B28]);
      uint64_t v11 = *MEMORY[0x1E4F24A90];
      unsigned int v12 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24A90]);
      uint64_t v13 = *MEMORY[0x1E4F24BC8];
      unsigned int v14 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24BC8]);
      uint64_t v15 = *MEMORY[0x1E4F24C18];
      double v16 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24C18]);
      if (v12) {
        BOOL v17 = v14 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17)
      {
        int v9 = 0;
      }
      else
      {
        id v18 = v16;
        CFDictionaryRef theDict = v3;
        id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
        unsigned int v20 = v19;
        if (v52) {
          [v19 setObject:v52 forKeyedSubscript:v10];
        }
        [v20 setObject:v12 forKeyedSubscript:v11];
        [v20 setObject:v14 forKeyedSubscript:v13];
        if (v18) {
          [v20 setObject:v18 forKeyedSubscript:v15];
        }
        int v9 = CFDictionaryGetValue(theDict, v20);

        CFDictionaryRef v3 = theDict;
      }
      unint64_t v6 = 0x1E4F1C000uLL;
    }
  }
  else
  {
    int v9 = 0;
  }
  double v21 = (void *)[objc_alloc(*(Class *)(v6 + 2656)) initWithCapacity:1];
  CMTime v22 = v21;
  if (v9) {
    [v21 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1E390]];
  }
  unsigned int v23 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a1 options:v22];
  if (v23)
  {
    CGRect CleanRect = CVImageBufferGetCleanRect(a1);
    double x = CleanRect.origin.x;
    double y = CleanRect.origin.y;
    double width = CleanRect.size.width;
    double height = CleanRect.size.height;
    [v23 extent];
    v59.origin.double x = v28;
    v59.origin.double y = v29;
    v59.size.double width = v30;
    v59.size.double height = v31;
    v58.origin.double x = x;
    v58.origin.double y = y;
    v58.size.double width = width;
    v58.size.double height = height;
    if (!CGRectEqualToRect(v58, v59))
    {
      uint64_t v32 = objc_msgSend(v23, "imageByCroppingToRect:", x, y, width, height);
      long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v54.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v54.c = v33;
      *(_OWORD *)&v54.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(&v55, &v54, -x, -y);
      uint64_t v34 = [v32 imageByApplyingTransform:&v55];

      unsigned int v23 = (void *)v34;
    }
    if (!v9)
    {
      uint64_t v35 = [v23 colorSpace];
      if (v3)
      {
        if (v35)
        {
          uint64_t v36 = [v23 colorSpace];
          if (v5)
          {
            CMTime v37 = (const void *)v36;
            if (v36)
            {
              theDicta = v3;
              CMTime v38 = (void *)[objc_alloc(*(Class *)(v6 + 2656)) initWithCapacity:0];
              CFDataRef v39 = (const __CFData *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24B70]);
              if (v39)
              {
                CFDataRef v40 = v39;
                if (CFDataGetLength(v39)) {
                  goto LABEL_37;
                }
              }
              uint64_t v49 = *MEMORY[0x1E4F24B28];
              uint64_t v53 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24B28]);
              uint64_t v41 = *MEMORY[0x1E4F24A90];
              double v42 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24A90]);
              uint64_t v43 = *MEMORY[0x1E4F24BC8];
              CGAffineTransform v44 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24BC8]);
              uint64_t v45 = *MEMORY[0x1E4F24C18];
              CMTime v46 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F24C18]);
              if (v42)
              {
                if (v44)
                {
                  uint64_t v48 = v46;
                  [v38 setObject:v42 forKeyedSubscript:v41];
                  [v38 setObject:v44 forKeyedSubscript:v43];
                  if (v53) {
                    [v38 setObject:v53 forKeyedSubscript:v49];
                  }
                  if (v48) {
                    [v38 setObject:v48 forKeyedSubscript:v45];
                  }
                  CFDataRef v40 = (const __CFData *)v38;
                  if (v38) {
LABEL_37:
                  }
                    CFDictionaryAddValue(theDicta, v40, v37);
                }
              }

              CFDictionaryRef v3 = theDicta;
            }
          }
        }
      }
    }
  }
  else
  {
    NSLog(&cfstr_CiimageImagewi.isa);
  }
  CFRelease(v5);

  return v23;
}

double sub_1DD3E01C8(uint64_t a1, int a2)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)a1 = &unk_1F3891E90;
  *(void *)(a1 + 8) = 0;
  uint64_t v2 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)(a1 + 32) = *MEMORY[0x1E4F1FA48];
  *(void *)(a1 + 48) = *(void *)(v2 + 16);
  double result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 8;
  *(void *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 104) = a2;
  return result;
}

void *sub_1DD3E0220(void *a1)
{
  *a1 = &unk_1F3891E90;
  uint64_t v2 = (const void *)a1[12];
  if (v2)
  {
    CFRelease(v2);
    a1[12] = 0;
  }
  CFDictionaryRef v3 = (void *)a1[8];
  if (v3)
  {
    a1[9] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1DD3E0288(void *a1)
{
  sub_1DD3E0220(a1);

  JUMPOUT(0x1E01B4150);
}

uint64_t sub_1DD3E02C0(uint64_t a1, int a2)
{
  uint64_t v54 = a1;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  int v50 = a2;
  if (read(a2, v56, 0xCuLL) != 12)
  {
    uint64_t v41 = (FILE *)*MEMORY[0x1E4F143C8];
    double v42 = "***VPHeader::read: error reading preheader\n";
    size_t v43 = 43;
LABEL_37:
    fwrite(v42, v43, 1uLL, v41);
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = v56[1];
  unsigned int v3 = v56[2];
  *(_DWORD *)(v54 + 104) = bswap32(v56[0]);
  if (v2 != 150994944)
  {
    uint64_t v41 = (FILE *)*MEMORY[0x1E4F143C8];
    double v42 = "***VPHeader::read: bad version\n";
    size_t v43 = 31;
    goto LABEL_37;
  }
  v48[1] = v48;
  size_t v4 = bswap32(v3);
  MEMORY[0x1F4188790](12);
  uint64_t v49 = (int8x16_t *)((char *)v48 - ((v4 + 15) & 0x1FFFFFFF0));
  if (read(v50, v49, v4) != v4)
  {
    CGAffineTransform v44 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v45 = "***VPHeader::read: error reading header\n";
    size_t v46 = 40;
LABEL_42:
    fwrite(v45, v46, 1uLL, v44);
    return 0xFFFFFFFFLL;
  }
  CFDictionaryRef v5 = v49;
  unsigned int v6 = v49[1].u32[0];
  unsigned int v7 = v49[1].u32[1];
  unsigned int v8 = bswap32(v7);
  if (v7) {
    int v9 = v8;
  }
  else {
    int v9 = 6000;
  }
  uint64_t v10 = v54;
  *(int8x16_t *)(v54 + 8) = vrev32q_s8(*v49);
  *(_DWORD *)(v10 + 24) = bswap32(v6);
  *(_DWORD *)(v10 + 28) = v9;
  CMTimeMake(&v55, bswap64(v5[1].u64[1]), bswap32(v5[2].u32[0]));
  uint64_t v11 = v49;
  uint64_t v12 = v54;
  *(CMTime *)(v54 + 32) = v55;
  unsigned int v13 = v11[2].u32[2];
  *(_DWORD *)(v12 + 56) = bswap32(v11[2].u32[1]);
  *(_DWORD *)(v12 + 60) = bswap32(v13);
  if (!v13)
  {
    CGAffineTransform v44 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v45 = "***VPHeader::read: invalid numFrames (0)\n";
    size_t v46 = 41;
    goto LABEL_42;
  }
  unsigned int v14 = 0;
  uint64_t v15 = &v11[2].u32[3];
  double v16 = (uint64_t *)(v12 + 80);
  BOOL v17 = *(unsigned int **)(v12 + 72);
  uint64_t v51 = (uint64_t *)(v12 + 80);
  long long v52 = (void **)(v12 + 64);
  do
  {
    unsigned int v18 = bswap32(*v15);
    unsigned int v19 = bswap32(v15[1]);
    unsigned int v20 = bswap32(v15[2]);
    unsigned int v21 = bswap32(v15[3]);
    unsigned int v22 = bswap32(v15[4]);
    unsigned int v23 = bswap32(v15[5]);
    unsigned int v24 = bswap32(v15[6]);
    uint64_t v25 = *v16;
    if ((unint64_t)v17 >= *v16)
    {
      unsigned int v53 = v20;
      uint64_t v26 = (unsigned int *)*v52;
      uint64_t v27 = 0x6DB6DB6DB6DB6DB7 * (((char *)v17 - (unsigned char *)*v52) >> 2);
      unint64_t v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) > 0x924924924924924) {
        sub_1DD3A9B50();
      }
      unint64_t v29 = 0x6DB6DB6DB6DB6DB7 * ((v25 - (uint64_t)v26) >> 2);
      if (2 * v29 > v28) {
        unint64_t v28 = 2 * v29;
      }
      if (v29 >= 0x492492492492492) {
        unint64_t v30 = 0x924924924924924;
      }
      else {
        unint64_t v30 = v28;
      }
      if (v30)
      {
        CGFloat v31 = (char *)sub_1DD3D3C48((uint64_t)v16, v30);
        uint64_t v26 = *(unsigned int **)(v54 + 64);
        BOOL v17 = *(unsigned int **)(v54 + 72);
        double v16 = v51;
      }
      else
      {
        CGFloat v31 = 0;
      }
      uint64_t v32 = (unsigned int *)&v31[28 * v27];
      *uint64_t v32 = v18;
      v32[1] = v19;
      v32[2] = v53;
      v32[3] = v21;
      v32[4] = v22;
      v32[5] = v23;
      v32[6] = v24;
      long long v33 = v32;
      if (v17 == v26)
      {
        uint64_t v12 = v54;
      }
      else
      {
        uint64_t v12 = v54;
        do
        {
          long long v34 = *(_OWORD *)(v17 - 7);
          *((_OWORD *)v33 - 1) = *((_OWORD *)v17 - 1);
          *(_OWORD *)(v33 - 7) = v34;
          v33 -= 7;
          v17 -= 7;
        }
        while (v17 != v26);
        uint64_t v26 = (unsigned int *)*v52;
      }
      BOOL v17 = v32 + 7;
      *(void *)(v12 + 64) = v33;
      *(void *)(v12 + 72) = v32 + 7;
      *(void *)(v12 + 80) = &v31[28 * v30];
      if (v26)
      {
        operator delete(v26);
        double v16 = v51;
      }
    }
    else
    {
      *BOOL v17 = v18;
      v17[1] = v19;
      v17[2] = v20;
      v17[3] = v21;
      v17[4] = v22;
      v17[5] = v23;
      v17[6] = v24;
      v17 += 7;
    }
    v15 += 7;
    *(void *)(v12 + 72) = v17;
    ++v14;
  }
  while (v14 < *(_DWORD *)(v12 + 60));
  unsigned int v35 = *v15;
  *(_DWORD *)(v12 + 88) = bswap32(*v15);
  if (v35 != 117440512) {
    return 0;
  }
  if (read(v50, v49, 4uLL) != 4)
  {
    CGAffineTransform v44 = (FILE *)*MEMORY[0x1E4F143C8];
    uint64_t v45 = "***VPHeader::read: error reading ICC profile (1)\n";
    size_t v46 = 49;
    goto LABEL_42;
  }
  size_t v36 = bswap32(v49->i32[0]);
  sub_1DD3B3408(&v55, v36);
  ssize_t v37 = read(v50, (void *)v55.value, v36);
  uint64_t v38 = v54;
  if (v37 == v36)
  {
    CFDataRef v39 = CFDataCreate(0, (const UInt8 *)v55.value, v36);
    *(void *)(v38 + 96) = v39;
    if (v39)
    {
      if (v55.value)
      {
        *(void *)&v55.int32_t timescale = v55.value;
        operator delete((void *)v55.value);
      }
      return 0;
    }
    long long v47 = "***VPHeader::read: error reading ICC profile (3)\n";
  }
  else
  {
    long long v47 = "***VPHeader::read: error reading ICC profile (2)\n";
  }
  fwrite(v47, 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  if (v55.value)
  {
    *(void *)&v55.int32_t timescale = v55.value;
    operator delete((void *)v55.value);
  }
  return 0xFFFFFFFFLL;
}

void sub_1DD3E07A0(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)(v1 - 128);
  if (v3)
  {
    *(void *)(v1 - 120) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3E07C4(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 88) == 7 && !*(void *)(a1 + 96))
  {
    fwrite("***VPHeader::write: no ICC profile data\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    return 0xFFFFFFFFLL;
  }
  if (*(unsigned char *)(a1 + 24)) {
    size_t v4 = 28 * *(unsigned int *)(a1 + 60) + 112;
  }
  else {
    size_t v4 = 112;
  }
  sub_1DD3B3408(__p, v4);
  CFDictionaryRef v5 = __p[0];
  *(int8x8_t *)__p[0] = vrev32_s8(*(int8x8_t *)(a1 + 8));
  v5[2] = bswap32(*(_DWORD *)(a1 + 16));
  v5[3] = bswap32(*(_DWORD *)(a1 + 20));
  v5[4] = bswap32(*(_DWORD *)(a1 + 24));
  v5[5] = bswap32(*(_DWORD *)(a1 + 28));
  *((void *)v5 + 3) = bswap64(*(void *)(a1 + 32));
  v5[8] = bswap32(*(_DWORD *)(a1 + 40));
  v5[9] = bswap32(*(_DWORD *)(a1 + 56));
  unsigned int v6 = *(_DWORD *)(a1 + 60);
  uint64_t v7 = *(void *)(a1 + 64);
  if (v6 == -1227133513 * ((unint64_t)(*(void *)(a1 + 72) - v7) >> 2))
  {
    v5[10] = bswap32(v6);
    unsigned int v8 = (int8x8_t *)(v5 + 11);
    if (*(_DWORD *)(a1 + 60))
    {
      unint64_t v9 = 0;
      uint64_t v10 = (unsigned int *)(v7 + 24);
      do
      {
        unsigned int v11 = *v10;
        int8x8_t v12 = *(int8x8_t *)(v10 - 2);
        *(int8x16_t *)v8->i8 = vrev32q_s8(*(int8x16_t *)(v10 - 6));
        v8[2] = vrev32_s8(v12);
        v8[3].i32[0] = bswap32(v11);
        unsigned int v8 = (int8x8_t *)((char *)v8 + 28);
        ++v9;
        v10 += 7;
      }
      while (v9 < *(unsigned int *)(a1 + 60));
    }
    v8->i32[0] = bswap32(*(_DWORD *)(a1 + 88));
    unsigned int v13 = v8 - v5 + 4;
    __buf[0] = bswap32(*(_DWORD *)(a1 + 104));
    __buf[1] = 150994944;
    __buf[2] = bswap32(v13);
    if (write(a2, __buf, 0xCuLL) == 12)
    {
      if (write(a2, __p[0], v13) == v13)
      {
        if (*(_DWORD *)(a1 + 88) != 7)
        {
LABEL_15:
          uint64_t v17 = 0;
          goto LABEL_21;
        }
        unsigned int v14 = __p[0];
        unsigned int Length = CFDataGetLength(*(CFDataRef *)(a1 + 96));
        *unsigned int v14 = bswap32(Length);
        if (write(a2, __p[0], 4uLL) == 4)
        {
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 96));
          if (write(a2, BytePtr, Length) == Length) {
            goto LABEL_15;
          }
          sub_1DD3E0B88();
        }
        else
        {
          sub_1DD3E0BC8();
        }
      }
      else
      {
        sub_1DD3E0C08();
      }
    }
    else
    {
      sub_1DD3E0C48();
    }
  }
  else
  {
    fwrite("***VPHeader::write: numPlanes/planeInfo mismatch\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  uint64_t v17 = 0xFFFFFFFFLL;
LABEL_21:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v17;
}

void sub_1DD3E0A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DD3E0AB0(uint64_t a1, int a2)
{
  if (lseek(a2, 12, 0) < 0)
  {
    sub_1DD3E0C88();
    return 0xFFFFFFFFLL;
  }
  unsigned int __buf = bswap32(*(_DWORD *)(a1 + 8));
  if (write(a2, &__buf, 4uLL) != 4)
  {
    sub_1DD3E0CD4();
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t sub_1DD3E0B2C(uint64_t a1, unsigned int a2)
{
  return *(void *)(a1 + 64) + 28 * a2;
}

float sub_1DD3E0B3C(unsigned int *a1, unsigned int *a2, float a3)
{
  *a1 = vcvtps_u32_f32((float)*a1 / a3);
  float result = (float)*a2 / a3;
  *a2 = vcvtps_u32_f32(result);
  *a1 = (*a1 + 1) & 0xFFFFFFFE;
  *a2 = (*a2 + 1) & 0xFFFFFFFE;
  return result;
}

size_t sub_1DD3E0B88()
{
  return fwrite("***VPHeader::write: Error writing ICC profile (2).\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
}

size_t sub_1DD3E0BC8()
{
  return fwrite("***VPHeader::write: Error writing ICC profile (1).\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
}

size_t sub_1DD3E0C08()
{
  return fwrite("***VPHeader::write: Error writing header.\n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
}

size_t sub_1DD3E0C48()
{
  return fwrite("***VPHeader::write: Error writing preheader.\n", 0x2DuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
}

size_t sub_1DD3E0C88()
{
  perror("lseek");
  uint64_t v0 = (FILE *)*MEMORY[0x1E4F143C8];

  return fwrite("***VPHeader::finalize: Error seeking to header.\n", 0x30uLL, 1uLL, v0);
}

size_t sub_1DD3E0CD4()
{
  return fwrite("***VPHeader::finalize: Error writing numFrames.\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
}

CVPixelBufferRef sub_1DD3E0D14(CGImage *a1)
{
  uint64_t v7 = 0;
  long long v5 = 0u;
  *(_OWORD *)bytesPerRow = 0u;
  int v1 = sub_1DD3DC0AC(a1, 2, 16, 0, 1, 1, (uint64_t)&v5, &v7);
  CVPixelBufferRef result = 0;
  if (!v1)
  {
    CVPixelBufferRef v4 = 0;
    CVReturn v3 = CVPixelBufferCreateWithBytes(0, v5, *((size_t *)&v5 + 1), 0x20u, v7, bytesPerRow[1], (CVPixelBufferReleaseBytesCallback)sub_1DD3E0DC8, 0, 0, &v4);
    if (v3)
    {
      printf("***CVPixelBufferCreateWithBytes returned %d\n", v3);
      free(v7);
      return 0;
    }
    else
    {
      return v4;
    }
  }
  return result;
}

void sub_1DD3E0DC8(int a1, void *a2)
{
}

uint64_t sub_1DD3E1404(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_setInputReady);
}

void sub_1DD3E1C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3E1C6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD3E1C7C(uint64_t a1)
{
}

uint64_t sub_1DD3E1C84(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) lockWhenCondition:0];
  unsigned int v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v2 unlockWithCondition:1];
}

void sub_1DD3E1F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3E21F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3E262C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD3E2B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1DD3E2BDC(void *a1, void *a2, CMTime *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    CMTimeMake(&v10, [v5 longLongValue], objc_msgSend(v6, "intValue"));
    uint64_t v8 = 0;
    *a3 = v10;
  }
  else
  {
    NSLog(&cfstr_Stabilizeparam_11.isa);
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

void sub_1DD3E2C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3E2C98(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1DD3E2FD4((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 60 * a2;
  }
}

void sub_1DD3E2D70(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1DD3E317C((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_1DD3E2E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1DD3E2F8C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x444444444444445) {
    sub_1DD3A9C40();
  }
  return operator new(60 * a2);
}

void sub_1DD3E2FD4(void **a1, unint64_t a2)
{
  id v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  id v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (0xEEEEEEEEEEEEEEEFLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      size_t v13 = 60 * ((60 * a2 - 60) / 0x3C) + 60;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xEEEEEEEEEEEEEEEFLL * ((v7 - (unsigned char *)*a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x444444444444444) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((v5 - (unsigned char *)*a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x222222222222222) {
      unint64_t v11 = 0x444444444444444;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      int8x8_t v12 = (char *)sub_1DD3E2F8C(v4, v11);
    }
    else {
      int8x8_t v12 = 0;
    }
    unsigned int v14 = &v12[60 * v8];
    uint64_t v15 = &v12[60 * v11];
    size_t v16 = 60 * ((60 * a2 - 60) / 0x3C) + 60;
    bzero(v14, v16);
    uint64_t v17 = &v14[v16];
    unsigned int v19 = (char *)*a1;
    unsigned int v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 60);
        long long v21 = *(_OWORD *)(v18 - 44);
        long long v22 = *(_OWORD *)(v18 - 28);
        *((_OWORD *)v14 - 1) = *((_OWORD *)v18 - 1);
        *(_OWORD *)(v14 - 28) = v22;
        *(_OWORD *)(v14 - 44) = v21;
        *(_OWORD *)(v14 - 60) = v20;
        v14 -= 60;
        v18 -= 60;
      }
      while (v18 != v19);
      unsigned int v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void sub_1DD3E317C(void **a1, unint64_t a2)
{
  id v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  id v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DD3A9B50();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      int8x8_t v12 = (char *)sub_1DD3A9BF8(v4, v11);
    }
    else {
      int8x8_t v12 = 0;
    }
    unsigned int v14 = &v12[24 * v8];
    uint64_t v15 = &v12[24 * v11];
    size_t v16 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v14, v16);
    uint64_t v17 = &v14[v16];
    unsigned int v19 = (char *)*a1;
    unsigned int v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 24);
        *((void *)v14 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v20;
        v14 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      unsigned int v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void *sub_1DD3E3310(void *result, uint64_t a2)
{
  *CVPixelBufferRef result = &unk_1F3891AD0;
  result[1] = a2;
  result[2] = 0;
  return result;
}

void *sub_1DD3E3334(uint64_t a1, void *__src, size_t __len)
{
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  size_t v8 = v6 + __len;
  if (v6 + __len > *(void *)(v7 + 16))
  {
    *(void *)(v7 + 8) = malloc_type_realloc(*(void **)(v7 + 8), v6 + __len, 0x2EA67C1FuLL);
    *(void *)(v7 + 16) = v8;
    uint64_t v7 = *(void *)(a1 + 8);
    uint64_t v6 = *(void *)(a1 + 16);
  }
  CVPixelBufferRef result = memmove((void *)(*(void *)(v7 + 8) + v6), __src, __len);
  *(void *)(a1 + 16) += __len;
  return result;
}

uint64_t sub_1DD3E33BC(void *a1, int a2, uint64_t a3, void **a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v101 = a1;
  id v13 = a5;
  id v100 = a8;
  if (a2 == -1 && !a3 || a2 != -1 && a3)
  {
    unsigned int v14 = @"vpCreateFromFileCommon: multiple destinations, internal error";
LABEL_6:
    NSLog(&v14->isa);
    uint64_t v15 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  unsigned int v14 = @"vpCreateFromFile: NULL input argument";
  if (!v101 || !v13 || !a6) {
    goto LABEL_6;
  }
  int v17 = *(_DWORD *)(a6 + 4);
  int v96 = [v13 sparseFrames];
  unsigned int v18 = [[VideoReader alloc] initWithAsset:v101];
  unsigned int v19 = v18;
  if (!v18)
  {
    uint64_t v15 = 0xFFFFFFFFLL;
    goto LABEL_118;
  }
  char v91 = v17;
  unsigned int v20 = v17 & 4;
  if ((v17 & 4) != 0) {
    uint64_t v21 = 3588;
  }
  else {
    uint64_t v21 = 0;
  }
  [(VideoReader *)v18 setPixelFormatOptions:v21];
  [v13 roiStart];
  long long v132 = v134;
  uint64_t v133 = v135;
  [(VideoReader *)v19 setReadStartT:&v132];
  memset(&v131[1], 0, 64);
  v131[0] = 0u;
  DWORD1(v131[0]) = [(VideoReader *)v19 imageHeight];
  uint64_t v22 = [(VideoReader *)v19 imageWidth];
  LODWORD(v131[0]) = v22;
  LODWORD(v131[1]) = *(_DWORD *)a6;
  if ((*(unsigned char *)(a6 + 4) & 2) != 0) {
    NSLog(&cfstr_ImageSizeUwXUh.isa, v22, DWORD1(v131[0]));
  }
  [(VideoReader *)v19 preferredTransform];
  *(CGAffineTransform *)((char *)&v131[1] + 8) = v136;
  [v13 roiLength];
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2))
  {
    [v13 roiLength];
    long long v129 = *(_OWORD *)&v136.a;
    CGFloat c = v136.c;
    [v13 roiLength];
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    [(VideoReader *)v19 trackLengthT];
    [v13 roiStart];
    CMTimeSubtract((CMTime *)&v136, &lhs, &rhs);
    long long v129 = *(_OWORD *)&v136.a;
    CGFloat c = v136.c;
    [(VideoReader *)v19 trackLength];
    float v25 = v24;
    [v13 roiStart];
    double Seconds = v25 - CMTimeGetSeconds(&v124);
  }
  [v13 cropRect];
  DWORD2(v131[0]) = v26;
  [v13 cropRect];
  HIDWORD(v131[0]) = v27;
  if (!DWORD2(v131[0]) || !v27) {
    *((void *)&v131[0] + 1) = *(void *)&v131[0];
  }
  if (*(float *)a6 != 1.0) {
    sub_1DD3E0B3C((unsigned int *)v131 + 2, (unsigned int *)((unint64_t)v131 | 0xC), *(float *)a6);
  }
  uint64_t v28 = v21;
  CGAffineTransform v122 = *(CGAffineTransform *)((char *)&v131[1] + 8);
  if (CGAffineTransformIsIdentity(&v122))
  {
    BYTE8(v131[4]) = 0;
  }
  else
  {
    *(void *)&v131[4] = 0;
    *((void *)&v131[3] + 1) = 0;
    LODWORD(v30) = HIDWORD(v131[0]);
    LODWORD(v29) = DWORD2(v131[0]);
    v139.size.uint64_t width = (double)v29;
    v139.size.uint64_t height = (double)v30;
    *(_OWORD *)&v121.a = *(_OWORD *)((char *)&v131[1] + 8);
    *(_OWORD *)&v121.CGFloat c = *(_OWORD *)((char *)&v131[2] + 8);
    *(_OWORD *)&v121.tdouble x = 0u;
    v139.origin.double x = 0.0;
    v139.origin.double y = 0.0;
    CGRect v140 = CGRectApplyAffineTransform(v139, &v121);
    uint64_t width = v140.size.width;
    uint64_t height = v140.size.height;
    DWORD2(v131[0]) = v140.size.width;
    HIDWORD(v131[0]) = v140.size.height;
    CGAffineTransform v120 = *(CGAffineTransform *)((char *)&v131[1] + 8);
    CGAffineTransformInvert(&v136, &v120);
    *(CGAffineTransform *)((char *)&v131[1] + 8) = v136;
    BYTE8(v131[4]) = 1;
    if ((*(unsigned char *)(a6 + 4) & 2) != 0) {
      NSLog(&cfstr_XformSizeUwXUh.isa, width, height);
    }
  }
  *(int32x2_t *)(a7 + 16) = vrev64_s32(*(int32x2_t *)((char *)v131 + 8));
  *(_DWORD *)(a7 + 24) = v20 >> 2;
  [(VideoReader *)v19 fps];
  long long v33 = (CMTime *)MEMORY[0x1E4F1FA48];
  *(_DWORD *)(a7 + 12) = v34;
  int v35 = [(VideoReader *)v19 timeScale];
  if (v35) {
    int v36 = v35;
  }
  else {
    int v36 = 6000;
  }
  *(_DWORD *)(a7 + 28) = v36;
  *(_OWORD *)(a7 + 32) = v129;
  *(CGFloat *)(a7 + 48) = c;
  int32_t v118 = 0;
  __p = 0;
  uint64_t v119 = 0;
  ssize_t v37 = [[VideoContext alloc] initWithWriter:0 pixelFormatFlags:v28];
  long long v93 = v37;
  if (!v37)
  {
    NSLog(&cfstr_Vpcreatefromfi_5.isa);
    uint64_t v15 = 0xFFFFFFFFLL;
    goto LABEL_116;
  }
  CMTime v116 = *v33;
  [v13 roiLength];
  CMTime v114 = *v33;
  int32_t v38 = CMTimeCompare(&v115, &v114);
  if (v38)
  {
    [v13 roiStart];
    [v13 roiLength];
    CMTimeAdd((CMTime *)&v136, &v113, &v112);
    *(_OWORD *)&v116.CMTimeValue value = *(_OWORD *)&v136.a;
    v116.CMTimeEpoch epoch = *(void *)&v136.c;
    *(_OWORD *)&v111.CMTimeValue value = *(_OWORD *)&v136.a;
    v111.CMTimeEpoch epoch = *(void *)&v136.c;
    CMTimeConvertScale((CMTime *)&v136, &v111, *(_DWORD *)(a7 + 28), kCMTimeRoundingMethod_RoundTowardZero);
    *(_OWORD *)&v116.CMTimeValue value = *(_OWORD *)&v136.a;
    v116.CMTimeEpoch epoch = *(void *)&v136.c;
  }
  memset(&v110, 0, sizeof(v110));
  long long v94 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  uint64_t v98 = 0;
  CFTypeRef v109 = 0;
  double v39 = 0.0;
  do
  {
    CFTypeRef cf = 0;
    memset(&v107[1], 0, sizeof(CMTime));
    CFDataRef v40 = (void *)MEMORY[0x1E01B4410]([v13 timeForFrame:v98]);
    int v41 = [(VideoReader *)v19 getFrameAsSampleBuf:&cf];
    memset(v107, 0, 24);
    [(VideoReader *)v19 lastPresentationTime];
    if (v41)
    {
      if (v41 == 1)
      {
        id v42 = 0;
LABEL_43:
        int v43 = 2;
        goto LABEL_46;
      }
      id v42 = 0;
      NSLog(&cfstr_Vpcreatefromfi_11.isa);
      goto LABEL_45;
    }
    if (v38)
    {
      CMTime v106 = v107[0];
      CMTime v105 = v116;
      if ((CMTimeCompare(&v106, &v105) & 0x80000000) == 0)
      {
        id v42 = 0;
        CFRelease(cf);
        goto LABEL_43;
      }
    }
    if (v96)
    {
      CMTime v104 = v107[1];
      CMTime v103 = v107[0];
      int32_t v44 = CMTimeCompare(&v104, &v103);
      if (v44 < 0)
      {
        NSLog(&cfstr_Vpcreatefromfi_6.isa, v107[1].value, v107[1].timescale, v107[0].value, v107[0].timescale);
        CFRelease(cf);
        id v42 = 0;
        goto LABEL_45;
      }
      if (v44)
      {
        CFRelease(cf);
        id v42 = 0;
LABEL_52:
        if (v98 >= [v13 numFrames]) {
          goto LABEL_43;
        }
        goto LABEL_53;
      }
    }
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)cf);
    if (!ImageBuffer)
    {
      NSLog(&cfstr_Vpcreatefromfi_7.isa);
      id v42 = 0;
      CFRelease(cf);
LABEL_45:
      int v43 = 1;
      goto LABEL_46;
    }
    id v46 = v13;
    id v92 = v94;
    int64_t v95 = v46;
    CGRect CleanRect = CVImageBufferGetCleanRect(ImageBuffer);
    double v47 = CleanRect.size.width;
    double v48 = CleanRect.size.height;
    if ((objc_msgSend(v46, "passThrough", CleanRect.origin.x, CleanRect.origin.y) & 1) != 0
      && (LODWORD(v49) = DWORD2(v131[0]), double v50 = (double)v49, v47 == v50)
      && (LODWORD(v50) = HIDWORD(v131[0]), v48 == (double)*(unint64_t *)&v50))
    {
      CGAffineTransform v138 = *(CGAffineTransform *)((char *)&v131[1] + 8);
      BOOL v51 = !CGAffineTransformIsIdentity(&v138);
    }
    else
    {
      BOOL v51 = 1;
    }
    [v46 cropRect];
    if (CGRectIsEmpty(v142))
    {
      LODWORD(v53) = DWORD1(v131[0]);
      LODWORD(v52) = v131[0];
      objc_msgSend(v46, "setCropRect:", 0.0, 0.0, (double)v52, (double)v53);
    }
    else
    {
      BOOL v51 = 1;
    }
    [v46 cropRect];
    LODWORD(v136.a) = v54;
    [v46 cropRect];
    unsigned int v137 = v55;
    *(float *)&double v56 = sub_1DD3E0B3C((unsigned int *)&v136, &v137, *(float *)&v131[1]);
    LODWORD(v48) = v137;
    unsigned int a_low = LODWORD(v136.a);
    objc_msgSend(v95, "cropRect", v56);
    double v58 = (double)*(unint64_t *)&v48;
    BOOL v60 = v59 != (double)a_low;
    if (v61 != v58) {
      BOOL v60 = 1;
    }
    if (v60 || v51)
    {
      long long v62 = sub_1DD3DFD8C(ImageBuffer, v92);
      if ([v95 passThrough])
      {
        id v63 = 0;
      }
      else
      {
        id v63 = &v136;
        [v95 getFrameInfo:v98 frameInfo:&v136];
      }
      [v95 cropRect];
      uint64_t v70 = sub_1DD3DB2E0(v62, (uint64_t)v63, 2, (_OWORD *)((char *)&v131[1] + 8), v66, v67, v68, v69, (double)a_low, v58);
      long long v64 = v70;
      if (v70)
      {

        int v65 = 0;
      }
      else
      {
        NSLog(&cfstr_ErrorPeforming.isa);
        int v65 = -1;
      }
    }
    else
    {
      long long v64 = 0;
      int v65 = 0;
    }

    id v42 = v64;
    id v71 = @"vpCreateFromFile: Error tranforming pixel buffer for frame %u";
    if (v65)
    {
LABEL_85:
      ssize_t v37 = v93;
      NSLog(&v71->isa, v98);
LABEL_86:
      CFRelease(cf);
      goto LABEL_45;
    }
    ssize_t v37 = v93;
    if (!v42) {
      goto LABEL_84;
    }
    if (v109)
    {
      BOOL v72 = [(VideoContext *)v93 pixelBuffer:v109 conformsToImage:v42];
      ImageBuffer = (__CVBuffer *)v109;
      if (v72) {
        goto LABEL_82;
      }
      CFRelease(v109);
      [v42 extent];
      double v74 = v73;
      [v42 extent];
      id v76 = [(VideoContext *)v93 createPixelBuffer:(unint64_t)v74 height:(unint64_t)v75];
    }
    else
    {
      [v42 extent];
      double v78 = v77;
      [v42 extent];
      id v76 = [(VideoContext *)v93 createPixelBuffer:(unint64_t)v78 height:(unint64_t)v79];
    }
    ImageBuffer = v76;
    CFTypeRef v109 = v76;
LABEL_82:
    if (!ImageBuffer)
    {
      NSLog(&cfstr_ErrorExtractin.isa);
      goto LABEL_86;
    }
    int64_t v80 = [(VideoContext *)v93 ciCtx];
    [v80 render:v42 toCVPixelBuffer:ImageBuffer];

LABEL_84:
    int v81 = sub_1DD3E4074(ImageBuffer, a7, (unint64_t *)&__p, a2, a3);
    id v71 = @"vpCreateFromFile: Error adding pixel buffer for frame %u";
    if (v81) {
      goto LABEL_85;
    }
    ssize_t v37 = v93;
    CFRelease(cf);
    if (!v98)
    {
      int v82 = [v95 numFrames];
      if (a3)
      {
        if (v82)
        {
          long long v83 = v118;
          long long v84 = __p;
          size_t v85 = (v83 - v84) * [v95 numFrames];
          uint64_t v86 = *(void *)(a3 + 8);
          *(void *)(v86 + 8) = malloc_type_realloc(*(void **)(v86 + 8), v85, 0x2EA67C1FuLL);
          *(void *)(v86 + 16) = v85;
          ssize_t v37 = v93;
        }
      }
    }
    if ((v91 & 0x10) != 0)
    {
      [v95 timeForFrame:v98];
      *(_OWORD *)&v110.CMTimeValue value = *(_OWORD *)&v136.a;
      CGFloat v87 = v136.c;
    }
    else
    {
      *(_OWORD *)&v110.CMTimeValue value = *(_OWORD *)&v107[0].value;
      CGFloat v87 = *(double *)&v107[0].epoch;
    }
    *(CGFloat *)&v110.CMTimeEpoch epoch = v87;
    sub_1DD3E49BC(a4, (long long *)&v110.value);
    if (v100)
    {
      CMTime v102 = v110;
      double v88 = CMTimeGetSeconds(&v102);
      if (v39 == 0.0)
      {
        uint64_t v89 = 0;
        double v39 = v88;
      }
      else
      {
        unsigned int v90 = ((v88 - v39) / Seconds * 100.0);
        uint64_t v89 = v90 >= 0x64 ? 100 : v90;
      }
      if ([v100 vpcCallback:v89])
      {
        NSLog(&cfstr_Vpcreatefromfi_10.isa);
        goto LABEL_45;
      }
    }
    uint64_t v98 = (v98 + 1);
    if (v96) {
      goto LABEL_52;
    }
LABEL_53:
    int v43 = 0;
LABEL_46:
  }
  while (!v43);
  if (v43 == 2)
  {
    if (*(_DWORD *)(a7 + 8) == v98)
    {
      if (![v13 numFrames] || objc_msgSend(v13, "numFrames") == v98)
      {
        uint64_t v15 = 0;
        goto LABEL_115;
      }
      NSLog(&cfstr_Vpcreatefromfi_13.isa);
      NSLog(&cfstr_StabparamsNumf.isa, [v13 numFrames], v98);
    }
    else
    {
      NSLog(&cfstr_Vpcreatefromfi_12.isa);
    }
  }
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_115:
  sub_1DD3E4060(&v109);

LABEL_116:
  if (__p)
  {
    int32_t v118 = __p;
    operator delete(__p);
  }
LABEL_118:

LABEL_7:
  return v15;
}

void sub_1DD3E3F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,const void *a52)
{
  sub_1DD3E4060(&a52);
  double v56 = (void *)STACK[0x218];
  if (STACK[0x218])
  {
    STACK[0x220] = (unint64_t)v56;
    operator delete(v56);
  }

  _Unwind_Resume(a1);
}

void sub_1DD3E4060(const void **a1)
{
  if (a1)
  {
    int v1 = *a1;
    if (v1) {
      CFRelease(v1);
    }
  }
}

uint64_t sub_1DD3E4074(CVPixelBufferRef pixelBuffer, uint64_t a2, unint64_t *a3, int a4, uint64_t a5)
{
  uint64_t v7 = a3;
  unint64_t v9 = pixelBuffer;
  v113[1] = *MEMORY[0x1E4F143B8];
  unsigned int v10 = *(_DWORD *)(a2 + 24);
  if (a3[1] == *a3)
  {
    CGRect CleanRect = CVImageBufferGetCleanRect(pixelBuffer);
    *(_DWORD *)(a2 + 16) = CleanRect.size.height;
    *(_DWORD *)(a2 + 20) = CleanRect.size.width;
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
    *(_DWORD *)(a2 + 56) = PixelFormatType;
    if (v10)
    {
      if ((PixelFormatType | 0x10) != 0x34323076)
      {
        NSLog(&cfstr_InitheaderyuvP.isa);
        NSLog(&cfstr_Pixelformat0xX.isa, *(unsigned int *)(a2 + 56), HIBYTE(*(_DWORD *)(a2 + 56)), (unsigned __int16)HIWORD(*(_DWORD *)(a2 + 56)), *(_DWORD *)(a2 + 56) >> 8, *(unsigned int *)(a2 + 56));
        return 0xFFFFFFFFLL;
      }
      uint64_t v112 = 0x200000001;
      v113[0] = 0x200000001;
      uint64_t v111 = 0x200000001;
      if (*(_DWORD *)(a2 + 60))
      {
        NSLog(&cfstr_InitheaderyuvV.isa, *(unsigned int *)(a2 + 60));
        return 0xFFFFFFFFLL;
      }
      uint64_t v55 = *(void *)(a2 + 72) - *(void *)(a2 + 64);
      if (v55)
      {
        NSLog(&cfstr_InitheaderyuvV_0.isa, 0x6DB6DB6DB6DB6DB7 * (v55 >> 2));
        return 0xFFFFFFFFLL;
      }
      size_t PlaneCount = CVPixelBufferGetPlaneCount(v9);
      if (PlaneCount != 2)
      {
        NSLog(&cfstr_InitheaderyuvE.isa, 2, PlaneCount);
        return 0xFFFFFFFFLL;
      }
      char v103 = v10;
      int __fda = a4;
      uint64_t v107 = a5;
      CFTypeRef v109 = v7;
      CGRect v116 = CVImageBufferGetCleanRect(v9);
      double width = v116.size.width;
      double height = v116.size.height;
      unsigned int v10 = 0;
      uint64_t v65 = 0;
      CGFloat v66 = (void *)(a2 + 80);
      CGFloat v67 = *(unsigned int **)(a2 + 72);
      char v68 = 1;
      CGFloat v69 = (void **)(a2 + 64);
      do
      {
        unsigned int v70 = *((_DWORD *)v113 + v65);
        unsigned int v71 = *((_DWORD *)&v113[-1] + v65);
        unsigned int v72 = *((_DWORD *)&v111 + v65);
        char v73 = v68;
        unsigned int v74 = (width / (double)v71);
        double v75 = height / (double)v72;
        unsigned int v76 = v75;
        int v77 = v70 * v74;
        if ((unint64_t)v67 >= *v66)
        {
          double v78 = v9;
          double v79 = (unsigned int *)*v69;
          uint64_t v80 = 0x6DB6DB6DB6DB6DB7 * (((char *)v67 - (unsigned char *)*v69) >> 2);
          unint64_t v81 = v80 + 1;
          if ((unint64_t)(v80 + 1) > 0x924924924924924) {
            sub_1DD3A9B50();
          }
          char v110 = v73;
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v66 - (void)v79) >> 2) > v81) {
            unint64_t v81 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v66 - (void)v79) >> 2);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v66 - (void)v79) >> 2)) >= 0x492492492492492) {
            unint64_t v82 = 0x924924924924924;
          }
          else {
            unint64_t v82 = v81;
          }
          if (v82)
          {
            unsigned int v83 = v75;
            long long v84 = (char *)sub_1DD3D3C48((uint64_t)v66, v82);
            unsigned int v76 = v83;
            CGFloat v69 = (void **)(a2 + 64);
            size_t v85 = v84;
            double v79 = *(unsigned int **)(a2 + 64);
            CGFloat v67 = *(unsigned int **)(a2 + 72);
          }
          else
          {
            size_t v85 = 0;
          }
          uint64_t v86 = (unsigned int *)&v85[28 * v80];
          *uint64_t v86 = v74;
          v86[1] = v76;
          v86[2] = v77;
          _OWORD v86[3] = 1;
          v86[4] = v70;
          v86[5] = v71;
          v86[6] = v72;
          CGFloat v87 = v86;
          unint64_t v9 = v78;
          if (v67 != v79)
          {
            do
            {
              long long v88 = *(_OWORD *)(v67 - 7);
              *((_OWORD *)v87 - 1) = *((_OWORD *)v67 - 1);
              *(_OWORD *)(v87 - 7) = v88;
              v87 -= 7;
              v67 -= 7;
            }
            while (v67 != v79);
            double v79 = (unsigned int *)*v69;
          }
          CGFloat v67 = v86 + 7;
          *(void *)(a2 + 64) = v87;
          *(void *)(a2 + 72) = v86 + 7;
          *(void *)(a2 + 80) = &v85[28 * v82];
          if (v79)
          {
            unsigned int v89 = v76;
            operator delete(v79);
            unsigned int v76 = v89;
            CGFloat v69 = (void **)(a2 + 64);
          }
          CGFloat v66 = (void *)(a2 + 80);
          char v73 = v110;
        }
        else
        {
          unsigned int *v67 = v74;
          v67[1] = v76;
          v67[2] = v77;
          v67[3] = 1;
          v67[4] = v70;
          v67[5] = v71;
          v67[6] = v72;
          v67 += 7;
        }
        char v68 = 0;
        *(void *)(a2 + 72) = v67;
        v10 += v77 * v76;
        uint64_t v65 = 1;
      }
      while ((v73 & 1) != 0);
      *(_DWORD *)(a2 + 60) = 2;
      *(_DWORD *)(a2 + 88) = 3;
      a5 = v107;
      uint64_t v7 = v109;
      a4 = __fda;
    }
    else
    {
      if (PixelFormatType != 1111970369 && PixelFormatType != 32)
      {
        NSLog(&cfstr_InitheaderrgbP.isa);
        NSLog(&cfstr_Pixelformat0xX.isa, *(unsigned int *)(a2 + 56), HIBYTE(*(_DWORD *)(a2 + 56)), (unsigned __int16)HIWORD(*(_DWORD *)(a2 + 56)), *(_DWORD *)(a2 + 56) >> 8, *(unsigned int *)(a2 + 56));
        return 0xFFFFFFFFLL;
      }
      if (*(_DWORD *)(a2 + 60))
      {
        NSLog(&cfstr_InitheaderrgbV.isa, *(unsigned int *)(a2 + 60));
        return 0xFFFFFFFFLL;
      }
      uint64_t v53 = *(void *)(a2 + 64);
      unint64_t v52 = *(void *)(a2 + 72);
      uint64_t v54 = (uint64_t)(v52 - v53) / 28;
      if (v52 != v53)
      {
        NSLog(&cfstr_InitheaderrgbV_0.isa, (uint64_t)(v52 - v53) / 28);
        return 0xFFFFFFFFLL;
      }
      double v56 = v9;
      unint64_t v57 = *(void *)(a2 + 80);
      int v58 = *(_DWORD *)(a2 + 16);
      int v59 = *(_DWORD *)(a2 + 20);
      int v60 = 3 * v59;
      char v103 = v10;
      if (v52 >= v57)
      {
        unint64_t v90 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v57 - v53) >> 2);
        if (2 * v90 <= v54 + 1) {
          uint64_t v91 = v54 + 1;
        }
        else {
          uint64_t v91 = 2 * v90;
        }
        if (v90 >= 0x492492492492492) {
          unint64_t v92 = 0x924924924924924;
        }
        else {
          unint64_t v92 = v91;
        }
        long long v93 = (char *)sub_1DD3D3C48(a2 + 80, v92);
        long long v94 = &v93[28 * v54];
        int v96 = &v93[28 * v95];
        *(_DWORD *)long long v94 = v59;
        *((_DWORD *)v94 + 1) = v58;
        *((_DWORD *)v94 + 2) = v60;
        *(_OWORD *)(v94 + 12) = xmmword_1DD3E8760;
        double v61 = v94 + 28;
        uint64_t v98 = *(char **)(a2 + 64);
        uint64_t v97 = *(char **)(a2 + 72);
        unint64_t v9 = v56;
        if (v97 != v98)
        {
          do
          {
            long long v99 = *(_OWORD *)(v97 - 28);
            *((_OWORD *)v94 - 1) = *((_OWORD *)v97 - 1);
            *(_OWORD *)(v94 - 28) = v99;
            v94 -= 28;
            v97 -= 28;
          }
          while (v97 != v98);
          uint64_t v97 = *(char **)(a2 + 64);
        }
        *(void *)(a2 + 64) = v94;
        *(void *)(a2 + 72) = v61;
        *(void *)(a2 + 80) = v96;
        if (v97) {
          operator delete(v97);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v52 = v59;
        *(_DWORD *)(v52 + 4) = v58;
        *(_DWORD *)(v52 + 8) = v60;
        *(_OWORD *)(v52 + 12) = xmmword_1DD3E8760;
        double v61 = (char *)(v52 + 28);
        unint64_t v9 = v56;
      }
      *(void *)(a2 + 72) = v61;
      unsigned int v10 = v60 * v58;
      *(_DWORD *)(a2 + 60) = 1;
      *(_DWORD *)(a2 + 88) = 1;
    }
    uint64_t v100 = v10;
    unint64_t v101 = v7[1] - *v7;
    BOOL v102 = v10 >= v101;
    if (v10 <= v101)
    {
      LOBYTE(v10) = v103;
      if (!v102) {
        v7[1] = *v7 + v100;
      }
    }
    else
    {
      sub_1DD3B353C(v7, v10 - v101);
      LOBYTE(v10) = v103;
    }
    if (a5 || !sub_1DD3E07C4(a2, a4)) {
      goto LABEL_2;
    }
    NSLog(&cfstr_Vpappendframep.isa);
    return 0xFFFFFFFFLL;
  }
LABEL_2:
  unint64_t v11 = (unsigned char *)*v7;
  if (CVPixelBufferLockBaseAddress(v9, 1uLL))
  {
    NSLog(&cfstr_Vpappendframep_0.isa);
    return 0xFFFFFFFFLL;
  }
  CGRect v115 = CVImageBufferGetCleanRect(v9);
  double x = v115.origin.x;
  double y = v115.origin.y;
  double v15 = v115.size.width;
  double v16 = v115.size.height;
  uint64_t v106 = a5;
  long long v108 = v7;
  int __fd = a4;
  if (v10)
  {
    CGSize EncodedSize = CVImageBufferGetEncodedSize(v9);
    if (*(_DWORD *)(a2 + 60))
    {
      unint64_t v33 = 0;
      do
      {
        int v34 = (_DWORD *)sub_1DD3E0B2C(a2, v33);
        BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v9, v33);
        int v36 = v9;
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v9, v33);
        if (v34[1])
        {
          size_t v38 = BytesPerRowOfPlane;
          unsigned int v39 = 0;
          uint64_t v40 = v34[4];
          unint64_t v41 = v34[5];
          uint64_t v43 = v34[2];
          uint64_t v42 = v34[3];
          size_t v44 = (unint64_t)(v15
                                 * (double)v40
                                 * (double)v42
                                 / (double)v41);
          uint64_t v45 = &BaseAddressOfPlane[BytesPerRowOfPlane
                                  * (unint64_t)(EncodedSize.height - (y + v16))
                                  / v34[6]
                                  + v40 * (unint64_t)x * v42 / v41];
          do
          {
            memmove(v11, v45, v44);
            v11 += v43;
            v45 += v38;
            ++v39;
          }
          while (v39 < v34[1]);
        }
        ++v33;
        unint64_t v9 = v36;
      }
      while (v33 < *(unsigned int *)(a2 + 60));
    }
  }
  else
  {
    unint64_t v17 = (unint64_t)v115.origin.x;
    unint64_t v18 = (unint64_t)(CVImageBufferGetEncodedSize(v9).height - (v115.origin.y + v115.size.height));
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v9);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v9);
    uint64_t v21 = sub_1DD3E0B2C(a2, 0);
    uint64_t v22 = &BaseAddress[4 * (unint64_t)x + BytesPerRow * v18];
    if (*(_DWORD *)(v21 + 16) == 3)
    {
      if (*(_DWORD *)(a2 + 16))
      {
        unsigned int v23 = 0;
        uint64_t v24 = (uint64_t)&BaseAddress[4 * v17 + 3 + BytesPerRow * v18];
        do
        {
          int v25 = *(_DWORD *)(a2 + 56);
          if (v25 == 1111970369)
          {
            if (*(_DWORD *)(a2 + 20))
            {
              uint64_t v30 = 0;
              unsigned int v31 = 0;
              do
              {
                *unint64_t v11 = v22[v30];
                v11[1] = v22[v30 + 1];
                unint64_t v29 = v11 + 3;
                id v11[2] = v22[v30 + 2];
                ++v31;
                v30 += 4;
                v11 += 3;
              }
              while (v31 < *(_DWORD *)(a2 + 20));
              goto LABEL_24;
            }
          }
          else
          {
            if (v25 != 32)
            {
              NSLog(&cfstr_InternalErrorI_1.isa);
              return 0xFFFFFFFFLL;
            }
            if (*(_DWORD *)(a2 + 20))
            {
              unsigned int v26 = 0;
              double v27 = (char *)v24;
              do
              {
                *unint64_t v11 = *(v27 - 2);
                v11[1] = *(v27 - 1);
                char v28 = *v27;
                v27 += 4;
                unint64_t v29 = v11 + 3;
                id v11[2] = v28;
                ++v26;
                v11 += 3;
              }
              while (v26 < *(_DWORD *)(a2 + 20));
              goto LABEL_24;
            }
          }
          unint64_t v29 = v11;
LABEL_24:
          v22 += BytesPerRow;
          ++v23;
          v24 += BytesPerRow;
          unint64_t v11 = v29;
        }
        while (v23 < *(_DWORD *)(a2 + 16));
      }
    }
    else if (*(_DWORD *)(a2 + 16))
    {
      unint64_t v46 = 0;
      uint64_t v47 = *(unsigned int *)(v21 + 8);
      size_t v48 = vcvtd_n_u64_f64(v15, 2uLL);
      do
      {
        memmove(v11, v22, v48);
        v11 += v47;
        v22 += BytesPerRow;
        ++v46;
      }
      while (v46 < *(unsigned int *)(a2 + 16));
    }
  }
  if (CVPixelBufferUnlockBaseAddress(v9, 1uLL))
  {
    NSLog(&cfstr_Vpappendframep_1.isa);
    return 0xFFFFFFFFLL;
  }
  double v50 = (void *)*v108;
  size_t v51 = v108[1] - *v108;
  if (v106)
  {
    sub_1DD3E3334(v106, v50, v51);
  }
  else if (write(__fd, v50, v51) != v108[1] - *v108)
  {
    sub_1DD3E4AFC();
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  ++*(_DWORD *)(a2 + 8);
  return result;
}

void sub_1DD3E4970(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    NSLog(&cfstr_ErrorAllocatin.isa);
    __cxa_end_catch();
    JUMPOUT(0x1DD3E44ACLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD3E49BC(void **a1, long long *a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  id v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= (unint64_t)v6)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_1DD3A9B50();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      unsigned int v14 = (char *)sub_1DD3A9BF8(v4, v13);
    }
    else {
      unsigned int v14 = 0;
    }
    double v15 = &v14[24 * v10];
    double v16 = &v14[24 * v13];
    long long v17 = *a2;
    *((void *)v15 + 2) = *((void *)a2 + 2);
    *(_OWORD *)double v15 = v17;
    unint64_t v9 = v15 + 24;
    unsigned int v19 = (char *)*a1;
    unint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 24);
        *((void *)v15 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v15 - 24) = v20;
        v15 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      unint64_t v18 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v9;
    a1[2] = v16;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    unint64_t v9 = (char *)(v7 + 24);
  }
  a1[1] = v9;
}

void sub_1DD3E4AE8()
{
}

void sub_1DD3E4AFC()
{
}

void sub_1DD3E4B28(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 0x1F) != 0)
  {
    sub_1DD3E4FF0(a2, a3);
    return;
  }
  if (!a1 || (v5 = *a1, (uint64_t v6 = a1[1] - *a1) == 0) || (v7 = -1431655765 * (v6 >> 3), v7 <= 2))
  {
LABEL_8:
    *(void *)(a3 + 16) = 0;
    *(_OWORD *)a3 = xmmword_1DD3E87C8;
    return;
  }
  memset(&v48, 0, sizeof(v48));
  CMTime lhs = *(CMTime *)(v5 + 24);
  CMTimeEpoch v8 = *(void *)(v5 + 16);
  *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)v5;
  rhs.CMTimeEpoch epoch = v8;
  CMTimeSubtract(&v48, &lhs, &rhs);
  uint64_t v9 = 0;
  uint64_t v10 = v7 - 2;
  do
  {
    memset(&v45, 0, sizeof(v45));
    uint64_t v11 = *a1 + v9;
    CMTimeEpoch v12 = *(void *)(v11 + 64);
    *(_OWORD *)&v44.CMTimeValue value = *(_OWORD *)(v11 + 48);
    v44.CMTimeEpoch epoch = v12;
    CMTimeEpoch v13 = *(void *)(v11 + 40);
    *(_OWORD *)&v43.CMTimeValue value = *(_OWORD *)(v11 + 24);
    v43.CMTimeEpoch epoch = v13;
    CMTimeSubtract(&v45, &v44, &v43);
    CMTime time1 = v45;
    CMTime time2 = v48;
    if (CMTimeCompare(&time1, &time2))
    {
      uint64_t v14 = MEMORY[0x1E4F1F9F0];
      sub_1DD3B5360(&v45, v7 - 1, MEMORY[0x1E4F1F9F0]);
      double v15 = *(CMTime **)&v45.timescale;
      if (*(void *)&v45.timescale == v45.value)
      {
        unint64_t v27 = 0;
        CMTimeValue value = *(CMTime **)&v45.timescale;
      }
      else
      {
        unint64_t v16 = 0;
        unsigned int v17 = 1;
        do
        {
          memset(&v38, 0, sizeof(v38));
          uint64_t v18 = *a1;
          uint64_t v19 = *a1 + 24 * v17;
          CMTimeEpoch v20 = *(void *)(v19 + 16);
          *(_OWORD *)&v37.CMTimeValue value = *(_OWORD *)v19;
          v37.CMTimeEpoch epoch = v20;
          uint64_t v21 = v18 + 24 * v16;
          CMTimeEpoch v22 = *(void *)(v21 + 16);
          *(_OWORD *)&v36.CMTimeValue value = *(_OWORD *)v21;
          v36.CMTimeEpoch epoch = v22;
          CMTimeSubtract(&v38, &v37, &v36);
          CMTimeValue v23 = v45.value + 24 * v16;
          unint64_t v24 = v17;
          long long v25 = *(_OWORD *)&v38.value;
          *(void *)(v23 + 16) = v38.epoch;
          *(_OWORD *)CMTimeValue v23 = v25;
          CMTimeValue value = (CMTime *)v45.value;
          double v15 = *(CMTime **)&v45.timescale;
          unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)&v45.timescale - v45.value) >> 3);
          ++v17;
          unint64_t v16 = v24;
        }
        while (v27 > v24);
      }
      unint64_t v28 = 126 - 2 * __clz(v27);
      if (v15 == value) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = v28;
      }
      sub_1DD3E50D8(value, v15, v29, 1);
      unint64_t v30 = v45.value + 24 * ((0xAAAAAAAAAAAAAAABLL * ((*(void *)&v45.timescale - v45.value) >> 3)) >> 1);
      CMTimeEpoch v31 = *(void *)(v30 + 16);
      *(_OWORD *)&v35.CMTimeValue value = *(_OWORD *)v30;
      v35.CMTimeEpoch epoch = v31;
      double v32 = 1.0 / CMTimeGetSeconds(&v35);
      *(_OWORD *)a3 = *(_OWORD *)v14;
      *(void *)(a3 + 16) = *(void *)(v14 + 16);
      if (v32 >= 20.0)
      {
        if (v32 < 23.5 || v32 > 24.5)
        {
          if (v32 <= 24.5 || v32 > 25.5)
          {
            if (v32 >= 29.5 && v32 < 30.0)
            {
              *(void *)(a3 + 16) = 0;
              unint64_t v33 = &xmmword_1DD3E87C8;
            }
            else if (v32 < 30.0 || v32 >= 30.2)
            {
              if (v32 < 119.0 || v32 >= 121.0)
              {
                if (v32 < 238.0 || v32 >= 242.0)
                {
                  if ((~*(_DWORD *)(a3 + 12) & 0x11) == 0)
                  {
                    CMTimeMakeWithSeconds(&v38, 1.0 / v32, 2400);
                    *(CMTime *)a3 = v38;
                  }
                  goto LABEL_42;
                }
                *(void *)(a3 + 16) = 0;
                unint64_t v33 = &xmmword_1DD3E8870;
              }
              else
              {
                *(void *)(a3 + 16) = 0;
                unint64_t v33 = &xmmword_1DD3E8858;
              }
            }
            else
            {
              *(void *)(a3 + 16) = 0;
              unint64_t v33 = &xmmword_1DD3E8840;
            }
          }
          else
          {
            *(void *)(a3 + 16) = 0;
            unint64_t v33 = &xmmword_1DD3E8828;
          }
        }
        else
        {
          *(void *)(a3 + 16) = 0;
          unint64_t v33 = &xmmword_1DD3E8810;
        }
      }
      else
      {
        *(void *)(a3 + 16) = 0;
        unint64_t v33 = &xmmword_1DD3E87F8;
      }
      *(_OWORD *)a3 = *v33;
LABEL_42:
      if (v45.value)
      {
        *(void *)&v45.int32_t timescale = v45.value;
        operator delete((void *)v45.value);
      }
      return;
    }
    v9 += 24;
    --v10;
  }
  while (v10);
  CMTime v40 = v48;
  v39.CMTimeEpoch epoch = 0;
  *(_OWORD *)&v39.CMTimeValue value = xmmword_1DD3E87E0;
  if (!CMTimeCompare(&v40, &v39)) {
    goto LABEL_8;
  }
  if (!v48.value) {
    fwrite("***nftInferNormFrameTime: constant zero duration\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  *(CMTime *)a3 = v48;
}

void sub_1DD3E4FC8(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)(v1 - 168);
  if (v3)
  {
    *(void *)(v1 - 160) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1DD3E4FF0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((a1 & 4) != 0)
  {
    *(void *)(a2 + 16) = 0;
    uint64_t v5 = &xmmword_1DD3E87C8;
  }
  else if ((a1 & 2) != 0)
  {
    *(void *)(a2 + 16) = 0;
    uint64_t v5 = &xmmword_1DD3E8840;
  }
  else if (a1)
  {
    *(void *)(a2 + 16) = 0;
    uint64_t v5 = &xmmword_1DD3E87F8;
  }
  else if ((a1 & 8) != 0)
  {
    *(void *)(a2 + 16) = 0;
    uint64_t v5 = &xmmword_1DD3E8828;
  }
  else
  {
    if ((a1 & 0x10) == 0)
    {
      NSLog(&cfstr_Nftframetimefr.isa, a1);
      uint64_t v3 = MEMORY[0x1E4F1FA48];
      __n128 result = *(__n128 *)MEMORY[0x1E4F1FA48];
      *(_OWORD *)a2 = *MEMORY[0x1E4F1FA48];
      *(void *)(a2 + 16) = *(void *)(v3 + 16);
      return result;
    }
    *(void *)(a2 + 16) = 0;
    uint64_t v5 = &xmmword_1DD3E8810;
  }
  __n128 result = (__n128)*v5;
  *(_OWORD *)a2 = *v5;
  return result;
}

uint64_t sub_1DD3E50AC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = *(_OWORD *)result;
  *(void *)(a2 + 16) = *(void *)(result + 16);
  *(uint64_t *)a2 /= 4;
  return result;
}

void sub_1DD3E50D8(CMTime *a1, CMTime *a2, uint64_t a3, char a4)
{
  while (2)
  {
    uint64_t v9 = a2;
    uint64_t v10 = a2 - 1;
    uint64_t v11 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v11;
          uint64_t v12 = (char *)v9 - (char *)v11;
          uint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)v11) >> 3);
          if (v5 || !v4)
          {
            switch(v13)
            {
              case 0:
              case 1:
                return;
              case 2:
                CMTimeEpoch epoch = a2[-1].epoch;
                v122.CMTimeEpoch epoch = a1->epoch;
                *(_OWORD *)&v122.CMTimeValue value = *(_OWORD *)&a1->value;
                *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)&a2[-1].value;
                time1.CMTimeEpoch epoch = epoch;
                CMTime time2 = v122;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  long long v64 = *(_OWORD *)&a1->value;
                  time1.CMTimeEpoch epoch = a1->epoch;
                  *(_OWORD *)&time1.CMTimeValue value = v64;
                  long long v65 = *(_OWORD *)&v10->value;
                  a1->CMTimeEpoch epoch = a2[-1].epoch;
                  *(_OWORD *)&a1->CMTimeValue value = v65;
                  long long v66 = *(_OWORD *)&time1.value;
                  a2[-1].CMTimeEpoch epoch = time1.epoch;
                  *(_OWORD *)&v10->CMTimeValue value = v66;
                }
                break;
              case 3:
                sub_1DD3D1F4C(a1, a1 + 1, v10);
                break;
              case 4:
                sub_1DD3D2374(a1, a1 + 1, a1 + 2, v10);
                break;
              case 5:
                sub_1DD3D1DC0(a1, a1 + 1, a1 + 2, a1 + 3, v10);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v12 <= 575)
          {
            CGFloat v67 = a1 + 1;
            BOOL v69 = a1 == v9 || v67 == v9;
            if (a4)
            {
              if (!v69)
              {
                uint64_t v70 = 0;
                unsigned int v71 = a1;
                do
                {
                  long long v72 = *(_OWORD *)&v71->value;
                  CMTimeEpoch v73 = v71->epoch;
                  unsigned int v71 = v67;
                  long long v74 = *(_OWORD *)&v67->value;
                  time1.CMTimeEpoch epoch = v67->epoch;
                  *(_OWORD *)&time1.CMTimeValue value = v74;
                  *(_OWORD *)&time2.CMTimeValue value = v72;
                  time2.CMTimeEpoch epoch = v73;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    v127.CMTimeEpoch epoch = v71->epoch;
                    *(_OWORD *)&v127.CMTimeValue value = *(_OWORD *)&v71->value;
                    uint64_t v75 = v70;
                    while (1)
                    {
                      unsigned int v76 = (char *)a1 + v75;
                      *(_OWORD *)(v76 + 24) = *(_OWORD *)((char *)&a1->value + v75);
                      *((void *)v76 + 5) = *(CMTimeEpoch *)((char *)&a1->epoch + v75);
                      if (!v75) {
                        break;
                      }
                      v123.CMTimeEpoch epoch = *((void *)v76 - 1);
                      *(_OWORD *)&v123.CMTimeValue value = *(_OWORD *)(v76 - 24);
                      CMTime time1 = v127;
                      CMTime time2 = v123;
                      v75 -= 24;
                      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                      {
                        uint64_t v77 = (uint64_t)&a1[1] + v75;
                        goto LABEL_77;
                      }
                    }
                    uint64_t v77 = (uint64_t)a1;
LABEL_77:
                    *(void *)(v77 + 16) = v127.epoch;
                    *(_OWORD *)uint64_t v77 = *(_OWORD *)&v127.value;
                  }
                  CGFloat v67 = v71 + 1;
                  v70 += 24;
                }
                while (&v71[1] != v9);
              }
            }
            else if (!v69)
            {
              do
              {
                long long v113 = *(_OWORD *)&a1->value;
                CMTimeEpoch v114 = a1->epoch;
                a1 = v67;
                long long v115 = *(_OWORD *)&v67->value;
                time1.CMTimeEpoch epoch = v67->epoch;
                *(_OWORD *)&time1.CMTimeValue value = v115;
                *(_OWORD *)&time2.CMTimeValue value = v113;
                time2.CMTimeEpoch epoch = v114;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  v129.CMTimeEpoch epoch = a1->epoch;
                  *(_OWORD *)&v129.CMTimeValue value = *(_OWORD *)&a1->value;
                  CGRect v116 = a1;
                  do
                  {
                    CGAffineTransform v117 = v116 - 1;
                    v116->CMTimeEpoch epoch = v116[-1].epoch;
                    *(_OWORD *)&v116->CMTimeValue value = *(_OWORD *)&v116[-1].value;
                    v125.CMTimeEpoch epoch = v116[-2].epoch;
                    *(_OWORD *)&v125.CMTimeValue value = *(_OWORD *)&v116[-2].value;
                    CMTime time1 = v129;
                    CMTime time2 = v125;
                    int32_t v118 = CMTimeCompare(&time1, &time2);
                    CGRect v116 = v117;
                  }
                  while (v118 < 0);
                  v117->CMTimeEpoch epoch = v129.epoch;
                  *(_OWORD *)&v117->CMTimeValue value = *(_OWORD *)&v129.value;
                }
                CGFloat v67 = a1 + 1;
              }
              while (&a1[1] != v9);
            }
            return;
          }
          if (!a3)
          {
            if (a1 != v9)
            {
              int64_t v78 = (unint64_t)(v13 - 2) >> 1;
              int64_t v79 = v78;
              do
              {
                int64_t v80 = v79;
                if (v78 >= v79)
                {
                  uint64_t v81 = (2 * v79) | 1;
                  unint64_t v82 = &a1[v81];
                  if (2 * v79 + 2 < v13)
                  {
                    long long v83 = *(_OWORD *)&v82->value;
                    time1.CMTimeEpoch epoch = v82->epoch;
                    *(_OWORD *)&time1.CMTimeValue value = v83;
                    long long v84 = *(_OWORD *)&v82[1].value;
                    time2.CMTimeEpoch epoch = v82[1].epoch;
                    *(_OWORD *)&time2.CMTimeValue value = v84;
                    if (CMTimeCompare(&time1, &time2) < 0)
                    {
                      ++v82;
                      uint64_t v81 = 2 * v80 + 2;
                    }
                  }
                  size_t v85 = &a1[v80];
                  long long v86 = *(_OWORD *)&v82->value;
                  time1.CMTimeEpoch epoch = v82->epoch;
                  *(_OWORD *)&time1.CMTimeValue value = v86;
                  long long v87 = *(_OWORD *)&v85->value;
                  time2.CMTimeEpoch epoch = v85->epoch;
                  *(_OWORD *)&time2.CMTimeValue value = v87;
                  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                  {
                    v132.CMTimeEpoch epoch = v85->epoch;
                    *(_OWORD *)&v132.CMTimeValue value = *(_OWORD *)&v85->value;
                    do
                    {
                      long long v88 = v82;
                      long long v89 = *(_OWORD *)&v82->value;
                      v85->CMTimeEpoch epoch = v82->epoch;
                      *(_OWORD *)&v85->CMTimeValue value = v89;
                      if (v78 < v81) {
                        break;
                      }
                      uint64_t v90 = (2 * v81) | 1;
                      unint64_t v82 = &a1[v90];
                      uint64_t v91 = 2 * v81 + 2;
                      if (v91 < v13)
                      {
                        long long v92 = *(_OWORD *)&v82->value;
                        time1.CMTimeEpoch epoch = v82->epoch;
                        *(_OWORD *)&time1.CMTimeValue value = v92;
                        long long v93 = *(_OWORD *)&v82[1].value;
                        time2.CMTimeEpoch epoch = v82[1].epoch;
                        *(_OWORD *)&time2.CMTimeValue value = v93;
                        if (CMTimeCompare(&time1, &time2) < 0)
                        {
                          ++v82;
                          uint64_t v90 = v91;
                        }
                      }
                      long long v94 = *(_OWORD *)&v82->value;
                      time1.CMTimeEpoch epoch = v82->epoch;
                      *(_OWORD *)&time1.CMTimeValue value = v94;
                      CMTime time2 = v132;
                      size_t v85 = v88;
                      uint64_t v81 = v90;
                    }
                    while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
                    v88->CMTimeEpoch epoch = v132.epoch;
                    *(_OWORD *)&v88->CMTimeValue value = *(_OWORD *)&v132.value;
                  }
                }
                int64_t v79 = v80 - 1;
              }
              while (v80);
              int64_t v95 = v12 / 0x18uLL;
              do
              {
                uint64_t v96 = 0;
                CMTimeEpoch v126 = a1->epoch;
                long long v124 = *(_OWORD *)&a1->value;
                uint64_t v97 = (uint64_t)a1;
                do
                {
                  uint64_t v98 = v97 + 24 * v96 + 24;
                  uint64_t v99 = (2 * v96) | 1;
                  uint64_t v100 = 2 * v96 + 2;
                  if (v100 < v95)
                  {
                    CMTimeEpoch v134 = *(void *)(v97 + 24 * v96 + 40);
                    v128.CMTimeEpoch epoch = *(void *)(v97 + 24 * v96 + 64);
                    *(_OWORD *)&v128.CMTimeValue value = *(_OWORD *)(v97 + 24 * v96 + 48);
                    *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)v98;
                    time1.CMTimeEpoch epoch = v134;
                    CMTime time2 = v128;
                    if (CMTimeCompare(&time1, &time2) < 0)
                    {
                      v98 += 24;
                      uint64_t v99 = v100;
                    }
                  }
                  long long v101 = *(_OWORD *)v98;
                  *(void *)(v97 + 16) = *(void *)(v98 + 16);
                  *(_OWORD *)uint64_t v97 = v101;
                  uint64_t v97 = v98;
                  uint64_t v96 = v99;
                }
                while (v99 <= (uint64_t)((unint64_t)(v95 - 2) >> 1));
                BOOL v102 = a2 - 1;
                BOOL v5 = v98 == (void)--a2;
                if (v5)
                {
                  *(void *)(v98 + 16) = v126;
                  *(_OWORD *)uint64_t v98 = v124;
                }
                else
                {
                  long long v103 = *(_OWORD *)&v102->value;
                  *(void *)(v98 + 16) = v102->epoch;
                  *(_OWORD *)uint64_t v98 = v103;
                  v102->CMTimeEpoch epoch = v126;
                  *(_OWORD *)&v102->CMTimeValue value = v124;
                  uint64_t v104 = v98 - (void)a1 + 24;
                  if (v104 >= 25)
                  {
                    unint64_t v105 = (v104 / 0x18uLL - 2) >> 1;
                    uint64_t v106 = &a1[v105];
                    long long v107 = *(_OWORD *)&v106->value;
                    time1.CMTimeEpoch epoch = v106->epoch;
                    *(_OWORD *)&time1.CMTimeValue value = v107;
                    long long v108 = *(_OWORD *)v98;
                    time2.CMTimeEpoch epoch = *(void *)(v98 + 16);
                    *(_OWORD *)&time2.CMTimeValue value = v108;
                    if (CMTimeCompare(&time1, &time2) < 0)
                    {
                      v133.CMTimeEpoch epoch = *(void *)(v98 + 16);
                      *(_OWORD *)&v133.CMTimeValue value = *(_OWORD *)v98;
                      do
                      {
                        uint64_t v109 = (uint64_t)v106;
                        long long v110 = *(_OWORD *)&v106->value;
                        *(void *)(v98 + 16) = v106->epoch;
                        *(_OWORD *)uint64_t v98 = v110;
                        if (!v105) {
                          break;
                        }
                        unint64_t v105 = (v105 - 1) >> 1;
                        uint64_t v106 = &a1[v105];
                        long long v111 = *(_OWORD *)&v106->value;
                        time1.CMTimeEpoch epoch = v106->epoch;
                        *(_OWORD *)&time1.CMTimeValue value = v111;
                        CMTime time2 = v133;
                        uint64_t v98 = v109;
                      }
                      while (CMTimeCompare(&time1, &time2) < 0);
                      *(void *)(v109 + 16) = v133.epoch;
                      *(_OWORD *)uint64_t v109 = *(_OWORD *)&v133.value;
                    }
                  }
                }
              }
              while (v95-- > 2);
            }
            return;
          }
          unint64_t v14 = (unint64_t)v13 >> 1;
          double v15 = &a1[(unint64_t)v13 >> 1];
          if ((unint64_t)v12 < 0xC01)
          {
            sub_1DD3D1F4C(v15, a1, v10);
          }
          else
          {
            sub_1DD3D1F4C(a1, v15, v10);
            uint64_t v16 = v14;
            sub_1DD3D1F4C(a1 + 1, &a1[v16 - 1], a2 - 2);
            sub_1DD3D1F4C(a1 + 2, &a1[v16 + 1], a2 - 3);
            sub_1DD3D1F4C(&a1[v16 - 1], v15, &a1[v16 + 1]);
            long long v17 = *(_OWORD *)&a1->value;
            time1.CMTimeEpoch epoch = a1->epoch;
            *(_OWORD *)&time1.CMTimeValue value = v17;
            CMTimeEpoch v18 = v15->epoch;
            *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&v15->value;
            a1->CMTimeEpoch epoch = v18;
            long long v19 = *(_OWORD *)&time1.value;
            v15->CMTimeEpoch epoch = time1.epoch;
            *(_OWORD *)&v15->CMTimeValue value = v19;
          }
          --a3;
          if (a4) {
            break;
          }
          CMTimeEpoch v121 = a1[-1].epoch;
          v120.CMTimeEpoch epoch = a1->epoch;
          *(_OWORD *)&v120.CMTimeValue value = *(_OWORD *)&a1->value;
          *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)&a1[-1].value;
          time1.CMTimeEpoch epoch = v121;
          CMTime time2 = v120;
          if (CMTimeCompare(&time1, &time2) < 0) {
            break;
          }
          v131.CMTimeEpoch epoch = a1->epoch;
          *(_OWORD *)&v131.CMTimeValue value = *(_OWORD *)&a1->value;
          long long v42 = *(_OWORD *)&a1->value;
          time1.CMTimeEpoch epoch = v131.epoch;
          *(_OWORD *)&time1.CMTimeValue value = v42;
          long long v43 = *(_OWORD *)&v10->value;
          time2.CMTimeEpoch epoch = a2[-1].epoch;
          *(_OWORD *)&time2.CMTimeValue value = v43;
          if (CMTimeCompare(&time1, &time2) < 0)
          {
            uint64_t v47 = a1;
            do
            {
              uint64_t v11 = v47 + 1;
              CMTime time1 = v131;
              long long v48 = *(_OWORD *)&v47[1].value;
              time2.CMTimeEpoch epoch = v47[1].epoch;
              *(_OWORD *)&time2.CMTimeValue value = v48;
              int32_t v49 = CMTimeCompare(&time1, &time2);
              uint64_t v47 = v11;
            }
            while ((v49 & 0x80000000) == 0);
          }
          else
          {
            CMTime v44 = a1 + 1;
            do
            {
              uint64_t v11 = v44;
              if (v44 >= v9) {
                break;
              }
              CMTime time1 = v131;
              long long v45 = *(_OWORD *)&v44->value;
              time2.CMTimeEpoch epoch = v44->epoch;
              *(_OWORD *)&time2.CMTimeValue value = v45;
              int32_t v46 = CMTimeCompare(&time1, &time2);
              CMTime v44 = v11 + 1;
            }
            while ((v46 & 0x80000000) == 0);
          }
          double v50 = v9;
          if (v11 < v9)
          {
            size_t v51 = v9;
            do
            {
              double v50 = v51 - 1;
              CMTime time1 = v131;
              long long v52 = *(_OWORD *)&v51[-1].value;
              time2.CMTimeEpoch epoch = v51[-1].epoch;
              *(_OWORD *)&time2.CMTimeValue value = v52;
              int32_t v53 = CMTimeCompare(&time1, &time2);
              size_t v51 = v50;
            }
            while (v53 < 0);
          }
          while (v11 < v50)
          {
            long long v54 = *(_OWORD *)&v11->value;
            time1.CMTimeEpoch epoch = v11->epoch;
            *(_OWORD *)&time1.CMTimeValue value = v54;
            long long v55 = *(_OWORD *)&v50->value;
            v11->CMTimeEpoch epoch = v50->epoch;
            *(_OWORD *)&v11->CMTimeValue value = v55;
            long long v56 = *(_OWORD *)&time1.value;
            v50->CMTimeEpoch epoch = time1.epoch;
            *(_OWORD *)&v50->CMTimeValue value = v56;
            do
            {
              CMTime time1 = v131;
              long long v57 = *(_OWORD *)&v11[1].value;
              CMTimeEpoch v58 = v11[1].epoch;
              ++v11;
              time2.CMTimeEpoch epoch = v58;
              *(_OWORD *)&time2.CMTimeValue value = v57;
            }
            while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
            do
            {
              long long v59 = *(_OWORD *)&v50[-1].value;
              CMTimeEpoch v60 = v50[-1].epoch;
              --v50;
              CMTime time1 = v131;
              *(_OWORD *)&time2.CMTimeValue value = v59;
              time2.CMTimeEpoch epoch = v60;
            }
            while (CMTimeCompare(&time1, &time2) < 0);
          }
          double v61 = v11 - 1;
          BOOL v4 = &v11[-1] >= a1;
          BOOL v5 = &v11[-1] == a1;
          if (&v11[-1] != a1)
          {
            long long v62 = *(_OWORD *)&v61->value;
            a1->CMTimeEpoch epoch = v11[-1].epoch;
            *(_OWORD *)&a1->CMTimeValue value = v62;
          }
          a4 = 0;
          v11[-1].CMTimeEpoch epoch = v131.epoch;
          *(_OWORD *)&v61->CMTimeValue value = *(_OWORD *)&v131.value;
        }
        uint64_t v20 = 0;
        v130.CMTimeEpoch epoch = a1->epoch;
        *(_OWORD *)&v130.CMTimeValue value = *(_OWORD *)&a1->value;
        do
        {
          long long v21 = *(_OWORD *)&a1[v20 + 1].value;
          time1.CMTimeEpoch epoch = a1[v20 + 1].epoch;
          *(_OWORD *)&time1.CMTimeValue value = v21;
          CMTime time2 = v130;
          ++v20;
        }
        while (CMTimeCompare(&time1, &time2) < 0);
        CMTimeEpoch v22 = &a1[v20];
        CMTimeValue v23 = v9;
        if (v20 == 1)
        {
          unint64_t v27 = a2;
          while (v22 < v27)
          {
            unint64_t v24 = v27 - 1;
            long long v28 = *(_OWORD *)&v27[-1].value;
            time1.CMTimeEpoch epoch = v27[-1].epoch;
            *(_OWORD *)&time1.CMTimeValue value = v28;
            CMTime time2 = v130;
            int32_t v29 = CMTimeCompare(&time1, &time2);
            unint64_t v27 = v24;
            if (v29 < 0) {
              goto LABEL_21;
            }
          }
          unint64_t v24 = v27;
        }
        else
        {
          do
          {
            unint64_t v24 = v23 - 1;
            long long v25 = *(_OWORD *)&v23[-1].value;
            time1.CMTimeEpoch epoch = v23[-1].epoch;
            *(_OWORD *)&time1.CMTimeValue value = v25;
            CMTime time2 = v130;
            int32_t v26 = CMTimeCompare(&time1, &time2);
            CMTimeValue v23 = v24;
          }
          while ((v26 & 0x80000000) == 0);
        }
LABEL_21:
        if (v22 >= v24)
        {
          CMTime v39 = v22 - 1;
        }
        else
        {
          unint64_t v30 = &a1[v20];
          unint64_t v31 = (unint64_t)v24;
          do
          {
            long long v32 = *(_OWORD *)&v30->value;
            time1.CMTimeEpoch epoch = v30->epoch;
            *(_OWORD *)&time1.CMTimeValue value = v32;
            long long v33 = *(_OWORD *)v31;
            v30->CMTimeEpoch epoch = *(void *)(v31 + 16);
            *(_OWORD *)&v30->CMTimeValue value = v33;
            long long v34 = *(_OWORD *)&time1.value;
            *(void *)(v31 + 16) = time1.epoch;
            *(_OWORD *)unint64_t v31 = v34;
            do
            {
              long long v35 = *(_OWORD *)&v30[1].value;
              CMTimeEpoch v36 = v30[1].epoch;
              ++v30;
              time1.CMTimeEpoch epoch = v36;
              *(_OWORD *)&time1.CMTimeValue value = v35;
              CMTime time2 = v130;
            }
            while (CMTimeCompare(&time1, &time2) < 0);
            do
            {
              long long v37 = *(_OWORD *)(v31 - 24);
              CMTimeEpoch v38 = *(void *)(v31 - 8);
              v31 -= 24;
              CMTime time2 = v130;
              *(_OWORD *)&time1.CMTimeValue value = v37;
              time1.CMTimeEpoch epoch = v38;
            }
            while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
          }
          while ((unint64_t)v30 < v31);
          CMTime v39 = v30 - 1;
        }
        if (v39 != a1)
        {
          long long v40 = *(_OWORD *)&v39->value;
          a1->CMTimeEpoch epoch = v39->epoch;
          *(_OWORD *)&a1->CMTimeValue value = v40;
        }
        v39->CMTimeEpoch epoch = v130.epoch;
        *(_OWORD *)&v39->CMTimeValue value = *(_OWORD *)&v130.value;
        BOOL v4 = v22 >= v24;
        uint64_t v9 = a2;
        if (v4) {
          break;
        }
LABEL_35:
        sub_1DD3E50D8(a1, v39, a3, a4 & 1);
        a4 = 0;
        uint64_t v11 = v39 + 1;
      }
      BOOL v41 = sub_1DD3E5CA8(a1, v39);
      uint64_t v11 = v39 + 1;
      if (sub_1DD3E5CA8(v39 + 1, a2)) {
        break;
      }
      if (!v41) {
        goto LABEL_35;
      }
    }
    a2 = v39;
    if (!v41) {
      continue;
    }
    break;
  }
}

BOOL sub_1DD3E5CA8(CMTime *a1, CMTime *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      CMTime time1 = a2[-1];
      CMTime time2 = *a1;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        uint64_t v6 = a2 - 1;
        CMTimeEpoch epoch = a1->epoch;
        long long v8 = *(_OWORD *)&a1->value;
        CMTimeEpoch v9 = a2[-1].epoch;
        *(_OWORD *)&a1->CMTimeValue value = *(_OWORD *)&a2[-1].value;
        a1->CMTimeEpoch epoch = v9;
        *(_OWORD *)&v6->CMTimeValue value = v8;
        v6->CMTimeEpoch epoch = epoch;
      }
      return 1;
    case 3uLL:
      sub_1DD3D1F4C(a1, a1 + 1, a2 - 1);
      return 1;
    case 4uLL:
      sub_1DD3D2374(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5uLL:
      sub_1DD3D1DC0(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      sub_1DD3D1F4C(a1, a1 + 1, a1 + 2);
      uint64_t v11 = a1 + 3;
      if (&a1[3] == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    CMTimeEpoch v14 = v10->epoch;
    long long v21 = *(_OWORD *)&v10->value;
    CMTime time1 = *v11;
    *(_OWORD *)&time2.CMTimeValue value = v21;
    time2.CMTimeEpoch epoch = v14;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      *(_OWORD *)&v20.CMTimeValue value = *(_OWORD *)&v11->value;
      v20.CMTimeEpoch epoch = v11->epoch;
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = (char *)a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)((char *)&a1[2].value + v15);
        *((void *)v16 + 11) = *(CMTimeEpoch *)((char *)&a1[2].epoch + v15);
        if (v15 == -48) {
          break;
        }
        long long v17 = *(_OWORD *)(v16 + 24);
        CMTimeEpoch v19 = *((void *)v16 + 5);
        CMTime time1 = v20;
        *(_OWORD *)&time2.CMTimeValue value = v17;
        time2.CMTimeEpoch epoch = v19;
        v15 -= 24;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          uint64_t v18 = (uint64_t)&a1[3] + v15;
          goto LABEL_12;
        }
      }
      uint64_t v18 = (uint64_t)a1;
LABEL_12:
      *(_OWORD *)uint64_t v18 = *(_OWORD *)&v20.value;
      *(void *)(v18 + 16) = v20.epoch;
      if (++v13 == 8) {
        return &v11[1] == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 24;
    if (++v11 == a2) {
      return 1;
    }
  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FB0](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8000](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithBuffer(CFAllocatorRef alloc, UInt8 *buffer, CFIndex bufferCapacity)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA8](alloc, buffer, bufferCapacity);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8B08](stream, buffer, bufferLength);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1F40DBBB8](desc, extensionKey);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDecodeTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDD8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDE8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC178](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  MEMORY[0x1F40DC330](videoDesc, originIsAtTopLeft);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  MEMORY[0x1F40DC360](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.double height = v4;
  result.double width = v3;
  return result;
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

CGRect CVImageBufferGetCleanRect(CVImageBufferRef imageBuffer)
{
  MEMORY[0x1F40DFC20](imageBuffer);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGSize CVImageBufferGetEncodedSize(CVImageBufferRef imageBuffer)
{
  MEMORY[0x1F40DFC38](imageBuffer);
  result.double height = v2;
  result.double width = v1;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD00](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

uint64_t ICAnalyzeInputMotion()
{
  return MEMORY[0x1F4124CC0]();
}

uint64_t ICCalcCanDoTripod()
{
  return MEMORY[0x1F4124CC8]();
}

uint64_t ICCalcCinematicL1Corrections()
{
  return MEMORY[0x1F4124CD0]();
}

uint64_t ICCalcPassThruCorrections()
{
  return MEMORY[0x1F4124CD8]();
}

uint64_t ICCalcSmoothingCorrections()
{
  return MEMORY[0x1F4124CE0]();
}

uint64_t ICCalcTripodCorrections()
{
  return MEMORY[0x1F4124CE8]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1F4124CF8]();
}

uint64_t ICGetCoordinateShiftedHomographies()
{
  return MEMORY[0x1F4124D10]();
}

uint64_t ICGetCorrectionResultCropData()
{
  return MEMORY[0x1F4124D18]();
}

uint64_t ICGetIdentityHomographies()
{
  return MEMORY[0x1F4124D20]();
}

uint64_t ICGetResultConfidence()
{
  return MEMORY[0x1F4124D28]();
}

uint64_t ICGetResultFramePresentationTimes()
{
  return MEMORY[0x1F4124D30]();
}

uint64_t ICGetResultOptionalData()
{
  return MEMORY[0x1F4124D40]();
}

uint64_t ICGetResultStats()
{
  return MEMORY[0x1F4124D48]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

float tanhf(float a1)
{
  MEMORY[0x1F40CE438](a1);
  return result;
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

vImage_Error vImageDilate_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1F40D2888](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageErode_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1F40D28C8](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(void *)&flags);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}