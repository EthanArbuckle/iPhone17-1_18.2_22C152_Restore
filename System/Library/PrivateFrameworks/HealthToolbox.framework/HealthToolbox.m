id WDAsUserActivityResponder(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = a1;
  if ([(id)objc_opt_class() conformsToProtocol:&unk_26D30B610])
  {
    v2 = v1;
  }
  else
  {
    v2 = +[WDEmptyUserActivityResponder emptyUserActivityResponder];
  }
  v3 = v2;

  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2210D9A84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2210DC5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void sub_2210DFE9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2210E03F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2210E1FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2210E31D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2210E52A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2210E8554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HKElectrocardiogramOverviewAvailabilityState(void *a1)
{
  id v1 = a1;
  if ([v1 isOnboardingRecordPresent])
  {
    uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F095F0]];
    char v3 = [v2 areAllRequirementsSatisfied];

    if (v3)
    {
      uint64_t v4 = 3;
    }
    else
    {
      v7 = [v1 objectForKeyedSubscript:*MEMORY[0x263F09600]];
      [v7 areAllRequirementsSatisfied];

      uint64_t v4 = 0;
    }
  }
  else
  {
    v5 = [v1 objectForKeyedSubscript:*MEMORY[0x263F095A8]];
    if (([v5 areAllRequirementsSatisfied] & 1) != 0
      || ([v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09670]] & 1) == 0)
    {

      uint64_t v4 = 1;
    }
    else
    {
      int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x263F09708]];

      if (v6) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 1;
      }
    }
  }

  return v4;
}

void sub_2210ECAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2210EF864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2210F0928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_2210F21A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
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

void sub_2210F2944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2210F2CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Block_object_dispose((const void *)(v17 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t getCategoryOfType(void *a1)
{
  unint64_t v1 = [a1 code];
  uint64_t result = 1;
  if (v1 > 0x3E) {
    goto LABEL_5;
  }
  if (((1 << v1) & 0x600000000003402DLL) != 0) {
    return 0;
  }
  if (((1 << v1) & 0xC8000) == 0)
  {
LABEL_5:
    unint64_t v3 = v1 - 71;
    if (v3 > 0x10 || ((1 << v3) & 0x10007) == 0) {
      return 2;
    }
  }
  return result;
}

__CFString *stringForCategoryValue(uint64_t a1, unint64_t a2)
{
  uint64_t result = 0;
  if (a1 > 139)
  {
    switch(a1)
    {
      case 140:
      case 147:
      case 156:
      case 189:
      case 191:
      case 192:
      case 200:
      case 237:
      case 254:
      case 262:
      case 263:
      case 264:
      case 265:
      case 276:
      case 293:
        goto LABEL_8;
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 190:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 208:
      case 209:
      case 210:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 227:
      case 228:
      case 238:
      case 239:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 251:
      case 252:
      case 253:
      case 255:
      case 256:
      case 257:
      case 258:
      case 259:
      case 260:
      case 261:
      case 266:
      case 267:
      case 268:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
        return result;
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 165:
      case 166:
      case 167:
      case 168:
      case 171:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 211:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 240:
      case 241:
      case 242:
        if (a2 >= 5) {
          goto LABEL_49;
        }
        uint64_t v4 = off_26458E378;
        goto LABEL_5;
      case 164:
      case 169:
        uint64_t v10 = @"HKCategoryValuePresencePresent";
        if (a2) {
          uint64_t v10 = 0;
        }
        if (a2 == 1) {
          return @"HKCategoryValuePresenceNotPresent";
        }
        else {
          return v10;
        }
      case 170:
        if (a2 >= 4) {
          goto LABEL_49;
        }
        uint64_t v4 = off_26458E3A0;
        goto LABEL_5;
      case 178:
        v5 = @"HKCategoryValueEnvironmentalAudioExposureEventMomentaryLimit";
        goto LABEL_39;
      case 193:
        unint64_t v8 = a2 - 1;
        if (a2 - 1 >= 7) {
          goto LABEL_49;
        }
        v9 = off_26458E430;
        goto LABEL_46;
      case 199:
        v5 = @"HKCategoryValueHeadphoneAudioExposureEventSevenDayLimit";
        goto LABEL_39;
      case 236:
        v5 = @"HKCategoryValueLowCardioFitnessEventLowFitness";
LABEL_39:
        BOOL v6 = a2 == 1;
        goto LABEL_9;
      case 243:
        unint64_t v8 = a2 - 1;
        if (a2 - 1 >= 3) {
          goto LABEL_49;
        }
        v9 = off_26458E488;
        goto LABEL_46;
      case 244:
        unint64_t v8 = a2 - 1;
        if (a2 - 1 >= 3) {
          goto LABEL_49;
        }
        v9 = off_26458E4A0;
        goto LABEL_46;
      case 250:
        unint64_t v8 = a2 - 1;
        if (a2 - 1 >= 4) {
          goto LABEL_49;
        }
        v9 = off_26458E3C0;
        goto LABEL_46;
      default:
        if ((unint64_t)(a1 - 313) < 2) {
          goto LABEL_21;
        }
        return result;
    }
  }
  switch(a1)
  {
    case '[':
      unint64_t v8 = a2 - 1;
      if (a2 - 1 >= 5) {
        goto LABEL_49;
      }
      v9 = off_26458E408;
      goto LABEL_46;
    case '\\':
      unint64_t v8 = a2 - 1;
      if (a2 - 1 >= 4) {
        goto LABEL_49;
      }
      v9 = off_26458E468;
      goto LABEL_46;
    case ']':
    case '^':
    case 'b':
      return result;
    case '_':
LABEL_21:
      unint64_t v8 = a2 - 1;
      if (a2 - 1 >= 5) {
        goto LABEL_49;
      }
      v9 = off_26458E3E0;
LABEL_46:
      uint64_t result = v9[v8];
      break;
    case 'a':
    case 'c':
LABEL_8:
      v5 = @"HKCategoryValueNotApplicable";
      BOOL v6 = a2 == 0;
LABEL_9:
      if (v6) {
        return v5;
      }
      else {
        return 0;
      }
    default:
      if (a1 == 63)
      {
        if (a2 >= 6)
        {
LABEL_49:
          uint64_t result = 0;
        }
        else
        {
          uint64_t v4 = off_26458E4B8;
LABEL_5:
          uint64_t result = v4[a2];
        }
      }
      else
      {
        v7 = @"HKCategoryValueAppleStandHourStood";
        if (a2) {
          v7 = 0;
        }
        if (a2 == 1) {
          v7 = @"HKCategoryValueAppleStandHourIdle";
        }
        if (a1 == 70) {
          uint64_t result = v7;
        }
        else {
          uint64_t result = 0;
        }
      }
      break;
  }
  return result;
}

void sub_2210F70C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2210FFB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_2_1(uint64_t a1, void *a2)
{
  return a2;
}

void sub_2211041C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221106CAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_2211071AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_22110810C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_221108274(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22110894C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22110A890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22110AE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_22110D2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id WDBundle()
{
  uint64_t v0 = (void *)WDBundle___ClassBundle;
  if (!WDBundle___ClassBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v2 = (void *)WDBundle___ClassBundle;
    WDBundle___ClassBundle = v1;

    uint64_t v0 = (void *)WDBundle___ClassBundle;
  }

  return v0;
}

uint64_t WDIndexForTab(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 1;
  }
  else {
    return qword_22113DFA0[a1 - 1];
  }
}

double WDFloorRectToViewScale(void *a1)
{
  id v1 = a1;
  UIFloorToViewScale();
  double v3 = v2;
  UIFloorToViewScale();
  UIFloorToViewScale();
  UIFloorToViewScale();

  return v3;
}

id WDPredicateMatchingPredicates(void *a1, void *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    BOOL v6 = (void *)MEMORY[0x263F08730];
    v11[0] = v3;
    v11[1] = v4;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = [v6 andPredicateWithSubpredicates:v7];
  }
  else
  {
    if (v3) {
      uint64_t v9 = v3;
    }
    else {
      uint64_t v9 = v4;
    }
    id v8 = v9;
  }

  return v8;
}

uint64_t WDIsRunningDemoMode()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v0 BOOLForKey:@"UseDemoData"]) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = [MEMORY[0x263F1C408] isRunningInStoreDemoMode];
  }

  return v1;
}

__CFString *WDGetDemoDataResourceName()
{
  return @"demodata";
}

id WDGetProfileNameForHealthStore(void *a1)
{
  id v1 = a1;
  double v2 = [v1 profileIdentifier];
  uint64_t v3 = [v2 type];

  if (v3 == 3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F0A620]) initWithHealthStore:v1];
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__1;
    uint64_t v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __WDGetProfileNameForHealthStore_block_invoke;
    v10[3] = &unk_26458EA10;
    v12 = &v13;
    BOOL v6 = v5;
    v11 = v6;
    [v4 fetchDisplayName:v10];
    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v6, v7);
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_22110F0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __WDGetProfileNameForHealthStore_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  dispatch_time_t v7 = (objc_class *)MEMORY[0x263F08A68];
  id v8 = a3;
  id v9 = a2;
  id v12 = objc_alloc_init(v7);
  [v12 setGivenName:v9];

  [v12 setFamilyName:v8];
  uint64_t v10 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v12 style:2 options:0];
  v11 = v10;
  if (!a4 && [v10 length]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2211101E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_221112D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_221115428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22111650C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOSUtilitiesClass()
{
  uint64_t v4 = 0;
  dispatch_semaphore_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOSUtilitiesClass_softClass;
  uint64_t v7 = getSOSUtilitiesClass_softClass;
  if (!getSOSUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOSUtilitiesClass_block_invoke;
    v3[3] = &unk_26458EBE0;
    v3[4] = &v4;
    __getSOSUtilitiesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2211168E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOSManagerClass()
{
  uint64_t v4 = 0;
  dispatch_semaphore_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getSOSManagerClass_softClass;
  uint64_t v7 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSOSManagerClass_block_invoke;
    v3[3] = &unk_26458EBE0;
    v3[4] = &v4;
    __getSOSManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2211169C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221117104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getSOSContactsManagerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOSContactsManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOSContactsManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSOSContactsManagerClass_block_invoke_cold_1();
    SOSLibrary();
  }
}

void SOSLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!SOSLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __SOSLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26458EC00;
    uint64_t v3 = 0;
    SOSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!SOSLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __SOSLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SOSLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getSOSUtilitiesClass_block_invoke(uint64_t a1)
{
  SOSLibrary();
  Class result = objc_getClass("SOSUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOSUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getSOSUtilitiesClass_block_invoke_cold_1();
    return (Class)__getSOSManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getSOSManagerClass_block_invoke(uint64_t a1)
{
  SOSLibrary();
  Class result = objc_getClass("SOSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSOSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (WDAppleWalkingSteadinessListDataProvider *)__getSOSManagerClass_block_invoke_cold_1();
    return (Class)[(WDAppleWalkingSteadinessListDataProvider *)v3 textForObject:v5];
  }
  return result;
}

void sub_221118B34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22111973C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22111A0E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_22111A740(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_22111B16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22111BA28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_22111D5BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_221120000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22112141C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return objc_opt_class();
}

void sub_221125134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2211279F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_221127B60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_221128F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22112B3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22112B580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22112B990(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_22112C8A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_221130014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_221130348(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22113059C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22113106C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

uint64_t __getSOSContactsManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOSUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getSOSUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSOSManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSOSManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __47__WDDataListViewController__fetchMedicalIDData__block_invoke_cold_1(v0);
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x270F0ECE8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t FIUIStaticWorkoutIconImage()
{
  return MEMORY[0x270F2CCA8]();
}

uint64_t HKAFibBurdenClampedLowerBoundLocalizedString()
{
  return MEMORY[0x270F381A0]();
}

uint64_t HKAuthorizationStatusAllowsReading()
{
  return MEMORY[0x270EF3610]();
}

uint64_t HKAuthorizationStatusAllowsSharing()
{
  return MEMORY[0x270EF3618]();
}

uint64_t HKBluetoothIcon()
{
  return MEMORY[0x270F381B0]();
}

uint64_t HKCalendarDateTransformNone()
{
  return MEMORY[0x270EF3620]();
}

uint64_t HKConditionallyRedactedHeartRhythmString()
{
  return MEMORY[0x270EF3648]();
}

uint64_t HKConnectedGymSourceName()
{
  return MEMORY[0x270EF3650]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x270EF3668]();
}

uint64_t HKDateFormatterFromTemplate()
{
  return MEMORY[0x270F381B8]();
}

uint64_t HKDeviceImage()
{
  return MEMORY[0x270F381C8]();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return MEMORY[0x270EF36C0]();
}

uint64_t HKDisplayTypeIdentifierToString()
{
  return MEMORY[0x270F381D8]();
}

uint64_t HKErrorTableViewCell()
{
  return MEMORY[0x270F381F0]();
}

uint64_t HKFormattedStringForDate()
{
  return MEMORY[0x270F38210]();
}

uint64_t HKFormattedStringFromValue()
{
  return MEMORY[0x270F38218]();
}

uint64_t HKFormattedStringFromValueForContext()
{
  return MEMORY[0x270F38220]();
}

uint64_t HKFormatterIncludesUnitForDisplayTypeInContext()
{
  return MEMORY[0x270F38228]();
}

uint64_t HKHealthKeyColor()
{
  return MEMORY[0x270F38230]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x270EF36F0]();
}

uint64_t HKHealthRecordsAPILocalizedStringWithSource()
{
  return MEMORY[0x270F38238]();
}

uint64_t HKHealthTintColor()
{
  return MEMORY[0x270F38240]();
}

uint64_t HKHealthUIBuddyDirectionalEdgeInsets()
{
  return MEMORY[0x270F38248]();
}

uint64_t HKHealthUIFrameworkBundle()
{
  return MEMORY[0x270F38250]();
}

uint64_t HKIntegerFormatter()
{
  return MEMORY[0x270F38258]();
}

uint64_t HKInternalAuthorizationStatusMake()
{
  return MEMORY[0x270EF3718]();
}

uint64_t HKLocalizedNoDataString()
{
  return MEMORY[0x270F38260]();
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return MEMORY[0x270F38268]();
}

uint64_t HKLocalizedStringForNumberWithTemplate()
{
  return MEMORY[0x270F38278]();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return MEMORY[0x270EF37D0]();
}

uint64_t HKPriorYearsDateFormatterNoTime()
{
  return MEMORY[0x270F38290]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x270EF3800]();
}

uint64_t HKSleepStartDateForDate()
{
  return MEMORY[0x270F38298]();
}

uint64_t HKTimeFormatter()
{
  return MEMORY[0x270F382B8]();
}

uint64_t HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory()
{
  return MEMORY[0x270F382D8]();
}

uint64_t HKUIApplicationIsUsingAccessibilityContentSizeCategory()
{
  return MEMORY[0x270F382E0]();
}

uint64_t HKUIBloodPressureSystolicDiastolicSeparatorString()
{
  return MEMORY[0x270F382E8]();
}

uint64_t HKUIJoinAttributedStringsForLocale()
{
  return MEMORY[0x270F38320]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x270F38330]();
}

uint64_t HKUIJoinStringsForLocale()
{
  return MEMORY[0x270F38338]();
}

uint64_t HKUIObjectIsLarger()
{
  return MEMORY[0x270F38380]();
}

uint64_t HKUIObjectIsLargerOrEqual()
{
  return MEMORY[0x270F38388]();
}

uint64_t HKUIObjectIsSmaller()
{
  return MEMORY[0x270F38390]();
}

uint64_t HKUIOnePixel()
{
  return MEMORY[0x270F38398]();
}

uint64_t HKUIPredicateMatchingPredicates()
{
  return MEMORY[0x270F383A0]();
}

uint64_t HKUnitPreferenceControllerAvailableUnitsForDisplayType()
{
  return MEMORY[0x270F383B0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x270EF38C8]();
}

uint64_t NSStringFromHKFeatureAvailabilityRescindedStatus()
{
  return MEMORY[0x270EF38D0]();
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x270F06008]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKMetadataKeyIsPrivate()
{
  return MEMORY[0x270EF3990]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x270EF39E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
}

xmlTextWriterPtr xmlNewTextWriterFilename(const char *uri, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x270F9BEE8](uri, *(void *)&compression);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C230](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C238](writer);
}

int xmlTextWriterEndPI(xmlTextWriterPtr writer)
{
  return MEMORY[0x270F9C240](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x270F9C258](writer, *(void *)&indent);
}

int xmlTextWriterSetIndentString(xmlTextWriterPtr writer, const xmlChar *str)
{
  return MEMORY[0x270F9C260](writer, str);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x270F9C280](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x270F9C288](writer, name);
}

int xmlTextWriterStartPI(xmlTextWriterPtr writer, const xmlChar *target)
{
  return MEMORY[0x270F9C298](writer, target);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x270F9C2A0](writer, name, content);
}

int xmlTextWriterWriteAttributeNS(xmlTextWriterPtr writer, const xmlChar *prefix, const xmlChar *name, const xmlChar *namespaceURI, const xmlChar *content)
{
  return MEMORY[0x270F9C2A8](writer, prefix, name, namespaceURI, content);
}

int xmlTextWriterWriteDTD(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *pubid, const xmlChar *sysid, const xmlChar *subset)
{
  return MEMORY[0x270F9C2C8](writer, name, pubid, sysid, subset);
}

int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x270F9C2E0](writer, content);
}