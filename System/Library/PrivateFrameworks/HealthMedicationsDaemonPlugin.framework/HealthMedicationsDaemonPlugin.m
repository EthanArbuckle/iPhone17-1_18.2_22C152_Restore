id HDMedicationSchedulePredicateForDeleted(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v3 = (void *)MEMORY[0x1E4F65D00];
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a1];
  v5 = [v3 predicateWithProperty:@"deleted" value:v4 comparisonType:a2];

  return v5;
}

uint64_t HDDismissedPregnancyLactationInteractionPredicateForInteractionTypes(uint64_t a1)
{
  return [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"interaction_type" values:a1];
}

id HDMedicationsScheduleEntityAllProperties()
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v5[0] = @"uuid";
  v5[1] = @"medication_uuid";
  v5[2] = @"medication_identifier";
  v5[3] = @"start_date_time";
  v5[4] = @"end_date_time";
  v5[5] = @"created_time_zone";
  v5[6] = @"frequency_type";
  v5[7] = @"cycle_start_date_components";
  v5[8] = @"note";
  v5[9] = @"creation_date";
  v5[10] = @"deleted";
  v5[11] = @"sync_identity";
  v5[12] = @"minimum_compatibility_version";
  v5[13] = @"origin_compatibility_version";
  v5[14] = @"schedule_type";
  v5[15] = @"display_options";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:16];
  v4 = @"sync_provenance";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:1];
  v2 = [v0 arrayByAddingObjectsFromArray:v1];

  return v2;
}

uint64_t HDMedicationSchedulePredicateForMedicationIdentifier(uint64_t a1)
{
  return [MEMORY[0x1E4F65D00] predicateWithProperty:@"medication_identifier" equalToValue:a1];
}

void sub_1BD54DD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD54FA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD54FDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
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

void sub_1BD550764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BD551764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_1BD552B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_1BD5548F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1BD55A4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1BD55B488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HDCodableMedicationScheduleReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 120;
        goto LABEL_46;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 88;
        goto LABEL_46;
      case 3u:
        *(unsigned char *)(a1 + 132) |= 0x20u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v62 = 48;
        goto LABEL_106;
      case 4u:
        *(unsigned char *)(a1 + 132) |= 4u;
        uint64_t v31 = *v3;
        unint64_t v32 = *(void *)(a2 + v31);
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
          *(void *)(a2 + v31) = v32 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v62 = 24;
        goto LABEL_106;
      case 5u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 64;
        goto LABEL_46;
      case 6u:
        *(unsigned char *)(a1 + 132) |= 8u;
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v34);
          *(void *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v62 = 32;
        goto LABEL_106;
      case 7u:
        v35 = (HDCodableMedicationScheduleCompatibilityVersionRange *)objc_alloc_init(MEMORY[0x1E4F65AC0]);
        objc_storeStrong((id *)(a1 + 72), v35);
        if (!PBReaderPlaceMark() || (HDCodableDateComponentsReadFrom() & 1) == 0) {
          goto LABEL_109;
        }
        goto LABEL_79;
      case 8u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 104;
        goto LABEL_46;
      case 9u:
        uint64_t v18 = PBReaderReadData();
        uint64_t v19 = 96;
LABEL_46:
        v36 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_107;
      case 0xAu:
        *(unsigned char *)(a1 + 132) |= 1u;
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v38);
          *(void *)(a2 + v37) = v38 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v62 = 8;
LABEL_106:
        *(void *)(a1 + v62) = v30;
        goto LABEL_107;
      case 0xBu:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v41 = 0;
        *(unsigned char *)(a1 + 132) |= 0x40u;
        while (2)
        {
          uint64_t v42 = *v3;
          uint64_t v43 = *(void *)(a2 + v42);
          unint64_t v44 = v43 + 1;
          if (v43 == -1 || v44 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v43);
            *(void *)(a2 + v42) = v44;
            v41 |= (unint64_t)(v45 & 0x7F) << v39;
            if (v45 < 0)
            {
              v39 += 7;
              BOOL v15 = v40++ >= 9;
              if (v15)
              {
                uint64_t v41 = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v41 = 0;
        }
LABEL_83:
        BOOL v59 = v41 != 0;
        uint64_t v60 = 128;
        goto LABEL_97;
      case 0xCu:
        v35 = (HDCodableMedicationScheduleCompatibilityVersionRange *)objc_alloc_init(MEMORY[0x1E4F65AD8]);
        objc_storeStrong((id *)(a1 + 112), v35);
        if (!PBReaderPlaceMark() || (HDCodableSyncIdentityReadFrom() & 1) == 0) {
          goto LABEL_109;
        }
        goto LABEL_79;
      case 0xDu:
        v35 = objc_alloc_init(HDCodableMedicationScheduleCompatibilityVersionRange);
        objc_storeStrong((id *)(a1 + 56), v35);
        if (!PBReaderPlaceMark()
          || !HDCodableMedicationScheduleCompatibilityVersionRangeReadFrom((uint64_t)v35, a2))
        {
          goto LABEL_109;
        }
        goto LABEL_79;
      case 0xEu:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v48 = 0;
        *(unsigned char *)(a1 + 132) |= 0x10u;
        while (2)
        {
          uint64_t v49 = *v3;
          uint64_t v50 = *(void *)(a2 + v49);
          unint64_t v51 = v50 + 1;
          if (v50 == -1 || v51 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v52 = *(unsigned char *)(*(void *)(a2 + *v7) + v50);
            *(void *)(a2 + v49) = v51;
            v48 |= (unint64_t)(v52 & 0x7F) << v46;
            if (v52 < 0)
            {
              v46 += 7;
              BOOL v15 = v47++ >= 9;
              if (v15)
              {
                uint64_t v48 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v48 = 0;
        }
LABEL_87:
        uint64_t v61 = 40;
        goto LABEL_92;
      case 0xFu:
        char v53 = 0;
        unsigned int v54 = 0;
        uint64_t v48 = 0;
        *(unsigned char *)(a1 + 132) |= 2u;
        while (2)
        {
          uint64_t v55 = *v3;
          uint64_t v56 = *(void *)(a2 + v55);
          unint64_t v57 = v56 + 1;
          if (v56 == -1 || v57 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
            *(void *)(a2 + v55) = v57;
            v48 |= (unint64_t)(v58 & 0x7F) << v53;
            if (v58 < 0)
            {
              v53 += 7;
              BOOL v15 = v54++ >= 9;
              if (v15)
              {
                uint64_t v48 = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v48 = 0;
        }
LABEL_91:
        uint64_t v61 = 16;
LABEL_92:
        *(void *)(a1 + v61) = v48;
        goto LABEL_107;
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
        goto LABEL_28;
      case 0x14u:
        v35 = objc_alloc_init(HDCodableMedicationScheduleIntervalData);
        [(id)a1 addIntervalData:v35];
        if (PBReaderPlaceMark()
          && (HDCodableMedicationScheduleIntervalDataReadFrom((uint64_t)v35, a2) & 1) != 0)
        {
LABEL_79:
          PBReaderRecallMark();

LABEL_107:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_109:

        return 0;
      default:
        if ((v10 >> 3) == 100)
        {
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 132) |= 0x80u;
          while (1)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_94;
            }
            v20 += 7;
            BOOL v15 = v21++ >= 9;
            if (v15)
            {
              uint64_t v22 = 0;
              goto LABEL_96;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_94:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_96:
          BOOL v59 = v22 != 0;
          uint64_t v60 = 129;
LABEL_97:
          *(unsigned char *)(a1 + v60) = v59;
        }
        else
        {
LABEL_28:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
        }
        goto LABEL_107;
    }
  }
}

void sub_1BD55FB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD55FEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1BD561F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

id HDMedicationDailyAnalyticsBucketForCount(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    unint64_t v3 = [v1 integerValue];
    if ((uint64_t)v3 > 5)
    {
      v5 = &unk_1F17FC1E0;
      v6 = &unk_1F17FC1F8;
      v7 = &unk_1F17FC210;
      char v8 = &unk_1F17FC240;
      if (v3 < 0x33) {
        char v8 = &unk_1F17FC228;
      }
      if (v3 >= 0x29) {
        v7 = v8;
      }
      if (v3 >= 0x1F) {
        v6 = v7;
      }
      if (v3 >= 0x15) {
        v5 = v6;
      }
      if (v3 >= 0xB) {
        id v4 = v5;
      }
      else {
        id v4 = &unk_1F17FC1C8;
      }
    }
    else
    {
      id v4 = v2;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1BD566374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1BD566900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD566C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD56707C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD5677A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD5680B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD56860C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD568B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD568FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD56ABB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_1BD56B8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD571060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t HDCodableMedicationScheduleCollectionReadFrom(void *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HDCodableMedicationScheduleData);
        [a1 addSchedules:v17];
        if (!PBReaderPlaceMark() || (HDCodableMedicationScheduleDataReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1BD575854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t HDCodableMedicationScheduleIntervalDataReadFrom(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          id v18 = objc_alloc_init(MEMORY[0x1E4F65AC0]);
          objc_storeStrong((id *)(a1 + 40), v18);
          if PBReaderPlaceMark() && (HDCodableDateComponentsReadFrom())
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          while (1)
          {
            uint64_t v23 = *v3;
            uint64_t v24 = *(void *)(a2 + v23);
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_49;
            }
            v20 += 7;
            BOOL v15 = v21++ >= 9;
            if (v15)
            {
              uint64_t v22 = 0;
              goto LABEL_51;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_51:
          uint64_t v42 = 24;
          goto LABEL_60;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v15 = v28++ >= 9;
                if (v15)
                {
                  uint64_t v22 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v22 = 0;
          }
LABEL_55:
          uint64_t v42 = 8;
          goto LABEL_60;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          break;
        case 5u:
          *(unsigned char *)(a1 + 48) |= 8u;
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v41 = *(void *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v41 = 0;
          }
          *(void *)(a1 + 32) = v41;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v3;
        uint64_t v36 = *(void *)(a2 + v35);
        unint64_t v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)(a2 + *v4)) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v37;
        v22 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0) {
          goto LABEL_57;
        }
        v33 += 7;
        BOOL v15 = v34++ >= 9;
        if (v15)
        {
          uint64_t v22 = 0;
          goto LABEL_59;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_59:
      uint64_t v42 = 16;
LABEL_60:
      *(void *)(a1 + v42) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1BD577388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HDCodableMedicationMonthHighlightReadFrom(void *a1, uint64_t a2)
{
  unint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HDCodableHighlightDay);
        [a1 addDays:v17];
        if (!PBReaderPlaceMark() || (HDCodableHighlightDayReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HDDismissedRemoteScheduleUnavailableRecordsForMedicationSemanticIdentifiers(uint64_t a1)
{
  return [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"medication_identifier" values:a1];
}

void sub_1BD57A2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

uint64_t HDMedicationScheduleItemPredicateForNotificationSent(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  return [MEMORY[0x1E4F65D00] predicateWithProperty:@"notification_sent" value:a1 comparisonType:v2];
}

id HDMedicationScheduleItemPredicateForScheduledDateTime(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F65D00];
  unint64_t v3 = _HDSQLiteValueForDate();
  id v4 = [v2 predicateWithProperty:@"scheduled_date_time" value:v3 comparisonType:a1];

  return v4;
}

uint64_t HDMedicationScheduleItemPredicateForIdentifier(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  return [MEMORY[0x1E4F65D00] predicateWithProperty:@"identifier" value:a1 comparisonType:v2];
}

id HDDismissedDrugInteractionResultPredicateForDrugClassAncestorIdentifier(void *a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  id v3 = a1;
  id v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "rawIdentifier"));
  uint64_t v5 = [v1 predicateWithProperty:@"first_drug_class_ancestor_identifier" equalToValue:v4];

  v6 = (void *)MEMORY[0x1E4F65D00];
  v7 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v8 = [v3 rawIdentifier];

  unsigned int v9 = [v7 numberWithLongLong:v8];
  unint64_t v10 = [v6 predicateWithProperty:@"second_drug_class_ancestor_identifier" equalToValue:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F65D08];
  v15[0] = v5;
  v15[1] = v10;
  unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  char v13 = [v11 predicateMatchingAnyPredicates:v12];

  return v13;
}

void sub_1BD57C228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t HDCodableMedicationScheduleDataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((int)(v10 >> 3) > 2)
      {
        if (v18 != 3)
        {
          if (v18 != 100)
          {
LABEL_32:
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          uint64_t v22 = PBReaderReadData();
          uint64_t v23 = 24;
          goto LABEL_28;
        }
        unint64_t v25 = objc_alloc_init(HDCodableMedicationScheduleCompatibilityVersionRange);
        objc_storeStrong((id *)(a1 + 16), v25);
        if (!PBReaderPlaceMark()
          || !HDCodableMedicationScheduleCompatibilityVersionRangeReadFrom((uint64_t)v25, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        if (v18 == 1)
        {
          uint64_t v22 = PBReaderReadData();
          uint64_t v23 = 32;
LABEL_28:
          uint64_t v24 = *(void **)(a1 + v23);
          *(void *)(a1 + v23) = v22;

          continue;
        }
        if (v18 != 2) {
          goto LABEL_32;
        }
        *(unsigned char *)(a1 + 40) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        *(void *)(a1 + 8) = v21;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1BD57E7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1BD57EA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD57ECA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD57F058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1BD58041C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BD580644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD580FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BoolValueFromIdentifierForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 componentsSeparatedByString:@","];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __KeyValuePairFromIdentifierForKey_block_invoke;
  v11[3] = &unk_1E6337E90;
  id v12 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "hk_firstObjectPassingTest:", v11);

  v7 = [v6 componentsSeparatedByString:@":"];
  char v8 = [v7 lastObject];

  uint64_t v9 = [v8 BOOLValue];
  return v9;
}

uint64_t __KeyValuePairFromIdentifierForKey_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 componentsSeparatedByString:@":"];
  id v4 = [v3 firstObject];

  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  return v5;
}

id HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiersAndInteractionTypes(void *a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(a1, "hk_map:", &__block_literal_global_12);
  uint64_t v5 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"medication_identifier" values:v4];
  if ([v3 count])
  {
    v6 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"interaction_type" values:v3];
    v7 = (void *)MEMORY[0x1E4F65D08];
    v11[0] = v5;
    v11[1] = v6;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v9 = [v7 predicateMatchingAllPredicates:v8];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

uint64_t __HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiersAndInteractionTypes_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [a2 rawIdentifier];
  return [v2 numberWithLongLong:v3];
}

id HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiers(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "hk_map:", &__block_literal_global_339);
  uint64_t v2 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"medication_identifier" values:v1];

  return v2;
}

uint64_t __HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v3 = [a2 rawIdentifier];
  return [v2 numberWithLongLong:v3];
}

void sub_1BD58654C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD58737C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1BD587BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
}

void sub_1BD589648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_1BD58A8A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BD58B4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BD58C6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _HDCalculateMedicationScheduleSyncAnchorOffset(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = _HDGetMaximumSyncAnchor(v3, 1, a2);
  uint64_t v5 = _HDGetMaximumSyncAnchor(v3, 2, a2);
  uint64_t v6 = -1;
  if (v4 != -1 && v5 != -1)
  {
    if (v4 <= v5) {
      uint64_t v4 = v5;
    }
    uint64_t v13 = 0;
    char v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v7 = [v3 protectedDatabase];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___HDCalculateMedicationScheduleSyncAnchorOffset_block_invoke;
    v12[3] = &unk_1E63380A8;
    v12[4] = &v13;
    char v8 = [v7 executeUncachedSQL:@"SELECT MIN(ROWID) from medication_schedules" error:a2 bindingHandler:0 enumerationHandler:v12];

    if (v8)
    {
      uint64_t v9 = v14[3];
      if (v9) {
        uint64_t v10 = v4 - v9 + 1;
      }
      else {
        uint64_t v10 = 0;
      }
      if (v9 <= v4) {
        uint64_t v6 = v10;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = -1;
    }
    _Block_object_dispose(&v13, 8);
  }

  return v6;
}

void sub_1BD58D034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _HDGetMaximumSyncAnchor(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"SELECT MAX(next) from sync_anchors WHERE schema=\"medication\" AND type=%d", a2);
  v7 = [v5 unprotectedDatabase];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___HDGetMaximumSyncAnchor_block_invoke;
  v10[3] = &unk_1E63380A8;
  v10[4] = &v11;
  LOBYTE(a3) = [v7 executeUncachedSQL:v6 error:a3 bindingHandler:0 enumerationHandler:v10];

  if (a3) {
    uint64_t v8 = v12[3];
  }
  else {
    uint64_t v8 = -1;
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_1BD58D4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD591AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_1BD591D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD591F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HDCodableMedicationScheduleCompatibilityVersionRangeReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4))
          {
            uint64_t v24 = &OBJC_IVAR___HDCodableMedicationScheduleCompatibilityVersionRange__minimum;
            goto LABEL_38;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            break;
          }
          v17 += 7;
          BOOL v23 = v18++ > 8;
          if (v23)
          {
            uint64_t v19 = 0;
            uint64_t v24 = &OBJC_IVAR___HDCodableMedicationScheduleCompatibilityVersionRange__minimum;
            goto LABEL_41;
          }
        }
        uint64_t v24 = &OBJC_IVAR___HDCodableMedicationScheduleCompatibilityVersionRange__minimum;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_41:
        *(void *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v25 = 0;
    unsigned int v26 = 0;
    uint64_t v19 = 0;
    *(unsigned char *)(a1 + 24) |= 2u;
    while (1)
    {
      uint64_t v27 = *v3;
      unint64_t v28 = *(void *)(a2 + v27);
      if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
      *(void *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        uint64_t v24 = &OBJC_IVAR___HDCodableMedicationScheduleCompatibilityVersionRange__origin;
        goto LABEL_39;
      }
      v25 += 7;
      BOOL v23 = v26++ > 8;
      if (v23)
      {
        uint64_t v19 = 0;
        uint64_t v24 = &OBJC_IVAR___HDCodableMedicationScheduleCompatibilityVersionRange__origin;
        goto LABEL_41;
      }
    }
    uint64_t v24 = &OBJC_IVAR___HDCodableMedicationScheduleCompatibilityVersionRange__origin;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HDCodableHighlightDayReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 20) |= 2u;
        while (1)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0) {
            goto LABEL_41;
          }
          v22 += 7;
          BOOL v15 = v23++ >= 9;
          if (v15)
          {
            uint64_t v24 = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v24 = 0;
        }
LABEL_43:
        BOOL v37 = v24 != 0;
        uint64_t v38 = 16;
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            *(unsigned char *)(a1 + 20) |= 1u;
            uint64_t v19 = *v3;
            unint64_t v20 = *(void *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
            {
              uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
              *(void *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(unsigned char *)(a2 + *v5) = 1;
              uint64_t v21 = 0;
            }
            *(void *)(a1 + 8) = v21;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(unsigned char *)(a1 + 20) |= 4u;
        while (1)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4)) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0) {
            goto LABEL_45;
          }
          v29 += 7;
          BOOL v15 = v30++ >= 9;
          if (v15)
          {
            uint64_t v31 = 0;
            goto LABEL_47;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v31 = 0;
        }
LABEL_47:
        BOOL v37 = v31 != 0;
        uint64_t v38 = 17;
      }
      *(unsigned char *)(a1 + v38) = v37;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL HDCodableMedicationChartSeriesReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HDCodableMedicationShareableModelReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 80;
        goto LABEL_90;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_90;
      case 5u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 48;
        goto LABEL_90;
      case 6u:
        PBReaderReadString();
        unint64_t v20 = (HDCodableMedicationSchedule *)objc_claimAutoreleasedReturnValue();
        if (v20) {
          [(id)a1 addIngredientComponentStrings:v20];
        }
        goto LABEL_80;
      case 7u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 176;
        goto LABEL_90;
      case 8u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 168;
        goto LABEL_90;
      case 9u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 88;
        goto LABEL_90;
      case 0xAu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 208;
        goto LABEL_90;
      case 0xCu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 144;
        goto LABEL_90;
      case 0xDu:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 220) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 == -1 || v25 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              BOOL v14 = v22++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_110;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_110:
        uint64_t v61 = 8;
        goto LABEL_127;
      case 0xEu:
        unint64_t v20 = objc_alloc_init(HDCodableMedicationSchedule);
        objc_storeStrong((id *)(a1 + 200), v20);
        if (!PBReaderPlaceMark() || (HDCodableMedicationScheduleReadFrom((uint64_t)v20, a2) & 1) == 0) {
          goto LABEL_138;
        }
        goto LABEL_79;
      case 0xFu:
        unint64_t v20 = (HDCodableMedicationSchedule *)objc_alloc_init(MEMORY[0x1E4F65AC8]);
        objc_storeStrong((id *)(a1 + 160), v20);
        if (!PBReaderPlaceMark() || (HDCodableMedicationDoseEventReadFrom() & 1) == 0) {
          goto LABEL_138;
        }
        goto LABEL_79;
      case 0x10u:
        unint64_t v20 = objc_alloc_init(HDCodableMedicationMonthHighlight);
        [(id)a1 addMonthHighlights:v20];
        if (!PBReaderPlaceMark() || (HDCodableMedicationMonthHighlightReadFrom(v20, a2) & 1) == 0) {
          goto LABEL_138;
        }
        goto LABEL_79;
      case 0x11u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 220) |= 0x10u;
        while (2)
        {
          uint64_t v30 = *v3;
          unint64_t v31 = *(void *)(a2 + v30);
          if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
            *(void *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v14 = v28++ >= 9;
              if (v14)
              {
                uint64_t v29 = 0;
                goto LABEL_114;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v29 = 0;
        }
LABEL_114:
        BOOL v62 = v29 != 0;
        uint64_t v63 = 216;
        goto LABEL_136;
      case 0x12u:
        char v33 = 0;
        unsigned int v34 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 220) |= 4u;
        while (2)
        {
          uint64_t v35 = *v3;
          unint64_t v36 = *(void *)(a2 + v35);
          if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v36 + 1;
            v23 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_118:
        uint64_t v61 = 24;
        goto LABEL_127;
      case 0x13u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 220) |= 8u;
        while (2)
        {
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 1;
            v23 |= (unint64_t)(v42 & 0x7F) << v38;
            if (v42 < 0)
            {
              v38 += 7;
              BOOL v14 = v39++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_122;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_122:
        uint64_t v61 = 32;
        goto LABEL_127;
      case 0x14u:
        unint64_t v20 = objc_alloc_init(HDCodableMedicationChartSeries);
        objc_storeStrong((id *)(a1 + 72), v20);
        if (!PBReaderPlaceMark() || !HDCodableMedicationChartSeriesReadFrom((uint64_t)v20, a2)) {
          goto LABEL_138;
        }
        goto LABEL_79;
      case 0x15u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 184;
        goto LABEL_90;
      case 0x16u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 64;
        goto LABEL_90;
      case 0x17u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 112;
        goto LABEL_90;
      case 0x18u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 136;
        goto LABEL_90;
      case 0x19u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 56;
        goto LABEL_90;
      case 0x1Au:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 96;
        goto LABEL_90;
      case 0x1Bu:
        unint64_t v20 = (HDCodableMedicationSchedule *)objc_alloc_init(MEMORY[0x1E4F65AD0]);
        objc_storeStrong((id *)(a1 + 104), v20);
        if PBReaderPlaceMark() && (HDCodableQuantityReadFrom())
        {
LABEL_79:
          PBReaderRecallMark();
LABEL_80:

LABEL_91:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_138:

        return 0;
      case 0x1Cu:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 220) |= 2u;
        while (2)
        {
          uint64_t v45 = *v3;
          unint64_t v46 = *(void *)(a2 + v45);
          if (v46 == -1 || v46 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v46 + 1;
            v23 |= (unint64_t)(v47 & 0x7F) << v43;
            if (v47 < 0)
            {
              v43 += 7;
              BOOL v14 = v44++ >= 9;
              if (v14)
              {
                uint64_t v23 = 0;
                goto LABEL_126;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_126:
        uint64_t v61 = 16;
LABEL_127:
        *(void *)(a1 + v61) = v23;
        goto LABEL_91;
      case 0x1Du:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 192;
        goto LABEL_90;
      case 0x1Eu:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 128;
LABEL_90:
        uint64_t v48 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_91;
      case 0x1Fu:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v51 = 0;
        *(unsigned char *)(a1 + 220) |= 0x40u;
        while (2)
        {
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 == -1 || v53 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v53 + 1;
            v51 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v14 = v50++ >= 9;
              if (v14)
              {
                uint64_t v51 = 0;
                goto LABEL_131;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v51 = 0;
        }
LABEL_131:
        BOOL v62 = v51 != 0;
        uint64_t v63 = 218;
        goto LABEL_136;
      case 0x20u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v57 = 0;
        *(unsigned char *)(a1 + 220) |= 0x20u;
        while (2)
        {
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 == -1 || v59 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v58) = v59 + 1;
            v57 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v14 = v56++ >= 9;
              if (v14)
              {
                uint64_t v57 = 0;
                goto LABEL_135;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v57 = 0;
        }
LABEL_135:
        BOOL v62 = v57 != 0;
        uint64_t v63 = 217;
LABEL_136:
        *(unsigned char *)(a1 + v63) = v62;
        goto LABEL_91;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_91;
    }
  }
}

id HDMedicationSchedulePredicateForActiveMedications()
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v0 setEntityClass:objc_opt_class()];
  uint64_t v1 = HDListUserDomainConceptEntityPredicateForListType();
  [v0 setPredicate:v1];

  [v0 setLimitCount:1];
  uint64_t v2 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65A40] entityClass:objc_opt_class() ascending:0];
  v36[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v0 setOrderingTerms:v3];

  uint64_t v4 = (void *)MEMORY[0x1E4F65D00];
  v37[0] = *MEMORY[0x1E4F65A60];
  uint64_t v5 = v37[0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v7 = [v4 predicateWithProperty:v5 comparisonType:7 subqueryDescriptor:v0 subqueryProperties:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v8 setEntityClass:objc_opt_class()];
  [v8 setPredicate:v7];

  unsigned int v9 = (void *)MEMORY[0x1E4F65D00];
  v36[0] = *MEMORY[0x1E4F65A18];
  uint64_t v10 = v36[0];
  uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
  id v12 = v8;
  char v13 = [v11 arrayWithObjects:v36 count:1];
  BOOL v14 = [v9 predicateWithProperty:@"medication_uuid" comparisonType:7 subqueryDescriptor:v12 subqueryProperties:v13];

  int v15 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v16 = *MEMORY[0x1E4F65A58];
  v38[0] = v10;
  uint64_t v17 = (void *)MEMORY[0x1E4F1C978];
  id v18 = v12;
  uint64_t v19 = [v17 arrayWithObjects:v38 count:1];
  unint64_t v20 = [v15 predicateWithProperty:v16 comparisonType:7 subqueryDescriptor:v18 subqueryProperties:v19];

  uint64_t v21 = *MEMORY[0x1E4F65A38];
  uint64_t v22 = *MEMORY[0x1E4F65A30];
  uint64_t v23 = [NSString stringWithFormat:@"'medication' || ? || '0' || ? || %@ || ? || %@", *MEMORY[0x1E4F65A38], *MEMORY[0x1E4F65A30]];
  uint64_t v24 = (void *)MEMORY[0x1E4F65D78];
  v37[0] = v21;
  v37[1] = v22;
  unint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v36[0] = *MEMORY[0x1E4F2AA70];
  v36[1] = v36[0];
  v36[2] = v36[0];
  char v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  char v27 = [v24 predicateWithSQL:@"(1=1)" overProperties:v25 values:v26];

  id v28 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v28 setEntityClass:objc_opt_class()];
  uint64_t v29 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v27 otherPredicate:v20];
  [v28 setPredicate:v29];

  [v28 setReturnsDistinctEntities:1];
  uint64_t v30 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v35 = v23;
  unint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  char v32 = [v30 predicateWithProperty:@"medication_identifier" comparisonType:7 subqueryDescriptor:v28 subqueryProperties:v31];

  char v33 = [MEMORY[0x1E4F65D58] disjunctionWithPredicate:v14 otherPredicate:v32];

  return v33;
}

void sub_1BD5987A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HDMedicationSchedulePredicateForScheduleUUID(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" value:a1 comparisonType:a2];
}

id HDMedicationSchedulePredicateForCreationDate(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F65D00];
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  uint64_t v4 = [v2 predicateWithProperty:@"creation_date" value:v3 comparisonType:a1];

  return v4;
}

uint64_t HDMedicationSchedulePredicateForSchedulesWithMinimumCompatibilityVersionComparedToOrigin(uint64_t a1)
{
  return [MEMORY[0x1E4F65D00] predicateWithProperty:@"minimum_compatibility_version" comparisonType:a1 otherProperty:@"origin_compatibility_version"];
}

uint64_t HDMedicationSchedulePredicateForNilEndDateTime()
{
  return [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"end_date_time"];
}

id HDMedicationSchedulePredicateForStartDateTime(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F65D00];
  id v3 = _HDSQLiteValueForDate();
  uint64_t v4 = [v2 predicateWithProperty:@"start_date_time" value:v3 comparisonType:a1];

  return v4;
}

id HDMedicationSchedulePredicateForEndDateTime(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F65D00];
  id v3 = _HDSQLiteValueForDate();
  uint64_t v4 = [v2 predicateWithProperty:@"end_date_time" value:v3 comparisonType:a1];

  return v4;
}

uint64_t HDMedicationSchedulePredicateForMedicationIdentifiers(uint64_t a1)
{
  return [MEMORY[0x1E4F65D10] containsPredicateWithProperty:@"medication_identifier" values:a1];
}

uint64_t HDMedicationSchedulePredicateForMedicationUUID(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F65D00] predicateWithProperty:@"medication_uuid" value:a1 comparisonType:a2];
}

void sub_1BD59A448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BD59A644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BD59A730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromMedicationsWidgetSchedulingManagerReloadReason(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6338738[a1];
  }
  return v1;
}

Class __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  ChronoServicesLibrary();
  Class result = objc_getClass("CHSTimelineController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCHSTimelineControllerClass_block_invoke_cold_1();
  }
  getCHSTimelineControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ChronoServicesLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __ChronoServicesLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6338700;
    uint64_t v2 = 0;
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChronoServicesLibraryCore_frameworkLibrary) {
    ChronoServicesLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __ChronoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChronoServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCHSWidgetServiceClass_block_invoke(uint64_t a1)
{
  ChronoServicesLibrary();
  Class result = objc_getClass("CHSWidgetService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCHSWidgetServiceClass_block_invoke_cold_1();
  }
  getCHSWidgetServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BD59C138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __getCHSTimelineControllerClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getCHSTimelineControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HDMedicationsWidgetSchedulingManager.m", 21, @"Unable to find class %s", "CHSTimelineController");

  __break(1u);
}

void ChronoServicesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ChronoServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"HDMedicationsWidgetSchedulingManager.m", 20, @"%s", *a1);

  __break(1u);
}

void __getCHSWidgetServiceClass_block_invoke_cold_1()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v1 = [NSString stringWithUTF8String:"Class getCHSWidgetServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HDMedicationsWidgetSchedulingManager.m", 22, @"Unable to find class %s", "CHSWidgetService");

  __break(1u);
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1F410ACD8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t HDCodableDateComponentsReadFrom()
{
  return MEMORY[0x1F411D350]();
}

uint64_t HDCodableMedicationDoseEventReadFrom()
{
  return MEMORY[0x1F411D358]();
}

uint64_t HDCodableQuantityReadFrom()
{
  return MEMORY[0x1F411D360]();
}

uint64_t HDCodableSyncIdentityReadFrom()
{
  return MEMORY[0x1F411D368]();
}

uint64_t HDDataEntityPredicateForCreationDate()
{
  return MEMORY[0x1F411D378]();
}

uint64_t HDEntityCategoryForKeyValueCategory()
{
  return MEMORY[0x1F411D3B0]();
}

uint64_t HDIsUnitTesting()
{
  return MEMORY[0x1F411D4A0]();
}

uint64_t HDListUserDomainConceptEntityPredicateForListType()
{
  return MEMORY[0x1F411D3B8]();
}

uint64_t HDMedicalRecordEntityPredicateForSortDate()
{
  return MEMORY[0x1F411D3C0]();
}

uint64_t HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifier()
{
  return MEMORY[0x1F411D3C8]();
}

uint64_t HDMedicationDoseEventEntityPredicateForLogOrigin()
{
  return MEMORY[0x1F411D3D0]();
}

uint64_t HDMedicationDoseEventEntityPredicateForMedicationIdentifiers()
{
  return MEMORY[0x1F411D3D8]();
}

uint64_t HDMedicationDoseEventEntityPredicateForMedicationUUID()
{
  return MEMORY[0x1F411D3E0]();
}

uint64_t HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier()
{
  return MEMORY[0x1F411D3E8]();
}

uint64_t HDMedicationDoseEventEntityPredicateForScheduleItemIdentifiers()
{
  return MEMORY[0x1F411D3F0]();
}

uint64_t HDMedicationDoseEventEntityPredicateForScheduledDate()
{
  return MEMORY[0x1F411D3F8]();
}

uint64_t HDMedicationDoseEventEntityPredicateForStatus()
{
  return MEMORY[0x1F411D400]();
}

uint64_t HDMedicationDoseEventEntityPredicateForStatuses()
{
  return MEMORY[0x1F411D408]();
}

uint64_t HDOntologyFeatureDefaultMinimumTimeToLive()
{
  return MEMORY[0x1F411D410]();
}

uint64_t HDOntologyShardRegistryPredicateForCurrentSchemaEntry()
{
  return MEMORY[0x1F411D418]();
}

uint64_t HDSQLiteBindBooleanToProperty()
{
  return MEMORY[0x1F411D4B0]();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return MEMORY[0x1F411D4C0]();
}

uint64_t HDSQLiteBindDoubleToProperty()
{
  return MEMORY[0x1F411D4C8]();
}

uint64_t HDSQLiteBindFoundationValueToStatement()
{
  return MEMORY[0x1F411D4D0]();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return MEMORY[0x1F411D4E0]();
}

uint64_t HDSQLiteBindNullToProperty()
{
  return MEMORY[0x1F411D4E8]();
}

uint64_t HDSQLiteBindNumberToProperty()
{
  return MEMORY[0x1F411D4F0]();
}

uint64_t HDSQLiteBindSecureCodingObjectToProperty()
{
  return MEMORY[0x1F411D4F8]();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return MEMORY[0x1F411D500]();
}

uint64_t HDSQLiteBindStringToStatement()
{
  return MEMORY[0x1F411D508]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x1F411D548]();
}

uint64_t HDSQLiteColumnWithNameAsArrayOfClass()
{
  return MEMORY[0x1F411D590]();
}

uint64_t HDSQLiteColumnWithNameAsBoolean()
{
  return MEMORY[0x1F411D598]();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return MEMORY[0x1F411D5A8]();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return MEMORY[0x1F411D5B0]();
}

uint64_t HDSQLiteColumnWithNameAsInt64()
{
  return MEMORY[0x1F411D5B8]();
}

uint64_t HDSQLiteColumnWithNameAsInteger()
{
  return MEMORY[0x1F411D5C0]();
}

uint64_t HDSQLiteColumnWithNameAsNumber()
{
  return MEMORY[0x1F411D5D8]();
}

uint64_t HDSQLiteColumnWithNameAsObject()
{
  return MEMORY[0x1F411D5E0]();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return MEMORY[0x1F411D5F0]();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return MEMORY[0x1F411D600]();
}

uint64_t HDSampleEntityPredicateForDataTypes()
{
  return MEMORY[0x1F411D438]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x1F411D440]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x1F411D448]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x1F411D450]();
}

uint64_t HDSyncVersionRangeToString()
{
  return MEMORY[0x1F411D458]();
}

uint64_t HDUserDomainConceptEntityPredicateForConceptUUID()
{
  return MEMORY[0x1F411D460]();
}

uint64_t HDUserDomainConceptEntityPredicateForConceptUUIDs()
{
  return MEMORY[0x1F411D468]();
}

uint64_t HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier()
{
  return MEMORY[0x1F411D470]();
}

uint64_t HDUserDomainConceptEntityPredicateForMedicalCoding()
{
  return MEMORY[0x1F411D478]();
}

uint64_t HDUserDomainConceptEntityPredicateForMedicalCodingSystem()
{
  return MEMORY[0x1F411D480]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x1F40E7A70]();
}

uint64_t HKConceptIdentifierForDrugInteractionLifestyleFactor()
{
  return MEMORY[0x1F411F368]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1F40E7BA0]();
}

uint64_t HKCurrentSchemaVersionForShardIdentifier()
{
  return MEMORY[0x1F40E7BC0]();
}

uint64_t HKDiagnosticStringFromDate()
{
  return MEMORY[0x1F40E7C58]();
}

uint64_t HKDiagnosticStringFromDuration()
{
  return MEMORY[0x1F40E7C60]();
}

uint64_t HKIsUnitTesting()
{
  return MEMORY[0x1F40E7D88]();
}

uint64_t HKLogConceptIndex()
{
  return MEMORY[0x1F40E7DC0]();
}

uint64_t HKLogHealthOntology()
{
  return MEMORY[0x1F40E7DC8]();
}

uint64_t HKLogMedication()
{
  return MEMORY[0x1F40E7DD8]();
}

uint64_t HKMedicationAnalyticsWeeksBetweenDates()
{
  return MEMORY[0x1F411F378]();
}

uint64_t HKMedicationsBucketedDecadeForAge()
{
  return MEMORY[0x1F411F380]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x1F40E7E28]();
}

uint64_t HKNSOperatingSystemVersionString()
{
  return MEMORY[0x1F40E7E38]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1F40E7F00]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x1F40E7FD0]();
}

uint64_t HKStringFromDrugInteractionLifestyleFactor()
{
  return MEMORY[0x1F411F388]();
}

uint64_t HKStringFromOptionalBooleanResult()
{
  return MEMORY[0x1F40E8018]();
}

uint64_t HKStringFromProfileType()
{
  return MEMORY[0x1F40E8020]();
}

uint64_t HKStringFromStateSyncMergeResult()
{
  return MEMORY[0x1F411D488]();
}

uint64_t HKWithAutoreleasePool()
{
  return MEMORY[0x1F40E8080]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
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

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HDSQLiteValueForDate()
{
  return MEMORY[0x1F411D658]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1F40E81B8]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1F40E81C0]();
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
  return MEMORY[0x1F415B160]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
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

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}