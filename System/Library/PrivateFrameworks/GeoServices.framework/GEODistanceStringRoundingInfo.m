@interface GEODistanceStringRoundingInfo
+ (const)_lookupTableForMeasurementSystem:(id)a3 locale:(id)a4 formatOptions:(unint64_t)a5;
+ (const)_roundingInfoTierForDistanceMeasurement:(id)a3 lookupTable:(const void *)a4 formatOptions:(unint64_t)a5;
+ (id)roundingInfoForDistanceMeasurement:(id)a3 measurementSystem:(id)a4 locale:(id)a5 formatOptions:(unint64_t)a6;
- (NSMeasurement)roundedDistanceMeasurement;
- (double)roundingIncrement;
- (unint64_t)maxFractionDigits;
- (unint64_t)minFractionDigits;
@end

@implementation GEODistanceStringRoundingInfo

+ (id)roundingInfoForDistanceMeasurement:(id)a3 measurementSystem:(id)a4 locale:(id)a5 formatOptions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  if (v13)
  {
    uint64_t v14 = [a1 _lookupTableForMeasurementSystem:v11 locale:v12 formatOptions:a6];
    id v27 = v10;
    id v15 = v10;
    for (uint64_t i = 0; ; uint64_t i = v18)
    {
      uint64_t v17 = objc_msgSend(a1, "_roundingInfoTierForDistanceMeasurement:lookupTable:formatOptions:", v15, v14, a6, v27);
      uint64_t v18 = v17;
      double v19 = 1.0;
      if ((a6 & 0x40) == 0) {
        double v19 = *(double *)(v17 + 16);
      }
      if (v17 == i) {
        break;
      }
      v20 = [v15 measurementByConvertingToUnit:*(void *)(v17 + 8)];
      [v20 doubleValue];
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F28E28]) initWithDoubleValue:*(void *)(v18 + 8) unit:v19 * round(v21 / v19)];

      id v15 = (id)v22;
    }
    v23 = *(void **)(v13 + 8);
    *(void *)(v13 + 8) = v15;

    *(double *)(v13 + 16) = v19;
    if ((a6 & 4) != 0) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = *(void *)(i + 24);
    }
    *(void *)(v13 + 24) = v24;
    *(void *)(v13 + 32) = *(void *)(i + 32);
    id v25 = (id)v13;
    id v10 = v27;
  }

  return (id)v13;
}

+ (const)_lookupTableForMeasurementSystem:(id)a3 locale:(id)a4 formatOptions:(unint64_t)a5
{
  char v5 = a5;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isEqualToString:*MEMORY[0x1E4F1C448]])
  {
    if ((v5 & 2) != 0)
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB29F748, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EB29F748))
      {
        operator new();
      }
      v7 = (const void *)qword_1EB29F740;
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB29F738, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EB29F738))
      {
        operator new();
      }
      v7 = (const void *)_MergedGlobals_204;
    }
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F1C450]])
  {
    if ((v5 & 2) != 0)
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB29F768, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EB29F768))
      {
        operator new();
      }
      v7 = (const void *)qword_1EB29F760;
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB29F758, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EB29F758))
      {
        operator new();
      }
      v7 = (const void *)qword_1EB29F750;
    }
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F1C458]])
  {
    if ((v5 & 2) != 0)
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB29F788, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EB29F788))
      {
        operator new();
      }
      v7 = (const void *)qword_1EB29F780;
    }
    else
    {
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB29F778, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1EB29F778))
      {
        operator new();
      }
      v7 = (const void *)qword_1EB29F770;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid or unhandled measurement system '%@'", (uint8_t *)&v9, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (const)_roundingInfoTierForDistanceMeasurement:(id)a3 lookupTable:(const void *)a4 formatOptions:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  v8 = [MEMORY[0x1E4F291E0] meters];
  int v9 = [v7 measurementByConvertingToUnit:v8];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = *(double **)a4;
  if ((v5 & 0x20) != 0)
  {
    id v13 = *(id *)(*((void *)a4 + 1) - 32);
    while (([*((id *)v12 + 1) isEqual:v13] & 1) == 0)
      v12 += 5;
  }
  uint64_t v14 = (double *)*((void *)a4 + 1);
  if (v14 != v12)
  {
    unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * (v14 - v12);
    do
    {
      unint64_t v16 = v15 >> 1;
      uint64_t v17 = &v12[5 * (v15 >> 1)];
      double v19 = *v17;
      uint64_t v18 = v17 + 5;
      v15 += ~(v15 >> 1);
      if (v19 > v11) {
        id v12 = v18;
      }
      else {
        unint64_t v15 = v16;
      }
    }
    while (v15);
  }
  if (v12 == v14) {
    uint64_t v20 = -1;
  }
  else {
    uint64_t v20 = 0;
  }
  double v21 = (const _RoundingInfo *)&v12[5 * v20];

  return v21;
}

- (NSMeasurement)roundedDistanceMeasurement
{
  return self->_roundedDistanceMeasurement;
}

- (double)roundingIncrement
{
  return self->_roundingIncrement;
}

- (unint64_t)minFractionDigits
{
  return self->_minFractionDigits;
}

- (unint64_t)maxFractionDigits
{
  return self->_maxFractionDigits;
}

- (void).cxx_destruct
{
}

@end