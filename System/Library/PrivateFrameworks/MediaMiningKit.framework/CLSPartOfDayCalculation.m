@interface CLSPartOfDayCalculation
+ (id)_possibleTimesOfDay;
+ (id)partOfDayForItem:(id)a3;
+ (id)partsOfDayForFeeder:(id)a3;
@end

@implementation CLSPartOfDayCalculation

+ (id)_possibleTimesOfDay
{
  if (_possibleTimesOfDay_onceToken != -1) {
    dispatch_once(&_possibleTimesOfDay_onceToken, &__block_literal_global_3010);
  }
  v2 = (void *)_possibleTimesOfDay_possibleTimesOfDay;
  return v2;
}

void __46__CLSPartOfDayCalculation__possibleTimesOfDay__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Night";
  v2[1] = @"Morning";
  v2[2] = @"Noon";
  v2[3] = @"Afternoon";
  v2[4] = @"Evening";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)_possibleTimesOfDay_possibleTimesOfDay;
  _possibleTimesOfDay_possibleTimesOfDay = v0;
}

+ (id)partsOfDayForFeeder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberOfItems];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = malloc_type_calloc(7uLL, 8uLL, 0x100004000313F17uLL);
    _OWORD *v7 = xmmword_1D21C51A0;
    v7[1] = xmmword_1D21C51B0;
    v7[2] = xmmword_1D21C51C0;
    *((void *)v7 + 6) = 0x40F97D0000000000;
    v8 = [a1 _possibleTimesOfDay];
    size_t v9 = [v8 count];
    v10 = (unint64_t *)malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0xBFF0000000000000;
    v11 = [v4 localStartDate];
    v12 = [v4 universalStartDate];
    [v11 timeIntervalSinceDate:v12];
    uint64_t v14 = v13;

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __47__CLSPartOfDayCalculation_partsOfDayForFeeder___block_invoke;
    v26[3] = &unk_1E690F9C8;
    v26[7] = v14;
    v26[4] = v27;
    v26[5] = &v28;
    v26[6] = v6;
    v26[8] = v7;
    v26[9] = v10;
    [v4 enumerateItemsUsingBlock:v26];
    uint64_t v15 = 0;
    if (v9)
    {
      v16 = v10;
      size_t v17 = v9;
      do
      {
        unint64_t v18 = *v16;
        if (*v16 && (double)v18 / (double)(unint64_t)v29[3] < 0.03)
        {
          unint64_t *v16 = 0;
          v15 += v18;
        }
        ++v16;
        --v17;
      }
      while (v17);
    }
    v29[3] -= v15;
    v19 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        unint64_t v21 = v10[i];
        if (v21)
        {
          unint64_t v22 = v29[3];
          v23 = [v8 objectAtIndexedSubscript:i];
          if (v23)
          {
            v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v21 / (double)v22];
            [v19 setObject:v24 forKeyedSubscript:v23];
          }
        }
      }
    }
    free(v10);
    free(v7);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v19;
}

void __47__CLSPartOfDayCalculation_partsOfDayForFeeder___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  double v7 = (double)a3 / (double)*(unint64_t *)(a1 + 48);
  if (v7 <= 0.33)
  {
    uint64_t v8 = 1;
  }
  else if (v7 >= 0.66)
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 0;
  }
  size_t v9 = [v5 clsLocation];

  if (v9)
  {
    v10 = objc_msgSend(v6, "cls_localDateComponents");
    if (a3) {
      goto LABEL_8;
    }
LABEL_14:
    id v18 = v10;
    v19 = v18;
    if (!v18)
    {
      double v21 = 0.0;
      goto LABEL_34;
    }
    double v20 = (double)[v18 hour] * 3600.0;
    if (v8 == 2)
    {
      if ([v19 minute] <= 4)
      {
        double v24 = -1.0;
LABEL_33:
        double v21 = v20 + v24;
        goto LABEL_34;
      }
    }
    else if (v8 == 1 && [v19 minute] >= 56)
    {
      double v21 = v20 + 3600.0;
LABEL_34:

      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v21;
      goto LABEL_35;
    }
    double v25 = (double)[v19 minute];
    double v24 = (double)[v19 second] + v25 * 60.0;
    goto LABEL_33;
  }
  v16 = objc_msgSend(v6, "cls_universalDate");
  size_t v17 = [v16 dateByAddingTimeInterval:*(double *)(a1 + 56)];
  v10 = +[CLSCalendar dateComponentsWithLocalDate:v17];

  if (!a3) {
    goto LABEL_14;
  }
LABEL_8:
  double v11 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v12 = v10;
  uint64_t v13 = v12;
  if (v12)
  {
    double v14 = 3600.0;
    double v15 = (double)[v12 hour] * 3600.0;
    if (v8 == 2)
    {
      double v14 = -1.0;
      if ([v13 minute] < 5) {
        goto LABEL_23;
      }
    }
    else if (v8 == 1 && [v13 minute] > 55)
    {
LABEL_23:
      if (v15 + v14 >= v11 || v11 == -1.0) {
        double v21 = v15 + v14;
      }
      else {
        double v21 = v15 + v14 + 86400.0;
      }
      goto LABEL_29;
    }
    double v22 = (double)[v13 minute];
    double v14 = (double)[v13 second] + v22 * 60.0;
    goto LABEL_23;
  }
  double v21 = 0.0;
LABEL_29:

LABEL_35:
  uint64_t v26 = *(void *)(a1 + 64);
  double v27 = *(double *)(v26 + 48);
  double v28 = v21;
  if (v27 <= v21) {
    double v28 = (double)((unint64_t)v21 % 0x15180);
  }
  uint64_t v29 = 0;
  while (v28 >= *(double *)(v26 + 8 * v29 + 8) || v28 < *(double *)(v26 + 8 * v29))
  {
    if (++v29 == 6)
    {
      if (!a3)
      {
LABEL_47:
        *(double *)(v26 + 8) = *(double *)(v26 + 8) + 7200.0;
        double v30 = v27 + 7200.0;
        *(double *)(v26 + 48) = v30;
        BOOL v31 = v30 > v21;
        double v32 = v21;
        if (!v31) {
          double v32 = (double)((unint64_t)v21 % 0x15180);
        }
        uint64_t v29 = 0;
        while (v32 >= *(double *)(v26 + 8 * v29 + 8) || v32 < *(double *)(v26 + 8 * v29))
        {
          if (++v29 == 6) {
            goto LABEL_55;
          }
        }
        if (v29 == 5) {
          uint64_t v29 = 0;
        }
        goto LABEL_60;
      }
      goto LABEL_55;
    }
  }
  if (v29 == 5) {
    uint64_t v29 = 0;
  }
  if (!a3 && v29 != 1) {
    goto LABEL_47;
  }
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_60:
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    ++*(void *)(*(void *)(a1 + 72) + 8 * v29);
    goto LABEL_61;
  }
LABEL_55:
  v33 = +[CLSLogging sharedLogging];
  v34 = [v33 loggingConnection];

  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    int v35 = 134217984;
    double v36 = v21;
    _os_log_error_impl(&dword_1D2150000, v34, OS_LOG_TYPE_ERROR, "Cannot find time of day for time interval %f", (uint8_t *)&v35, 0xCu);
  }

LABEL_61:
}

+ (id)partOfDayForItem:(id)a3
{
  id v4 = objc_msgSend(a3, "cls_localDateComponents");
  id v5 = v4;
  if (v4)
  {
    double v6 = (double)[v4 hour] * 3600.0;
    double v7 = (double)[v5 minute];
    double v8 = v6 + (double)[v5 second] + v7 * 60.0;
  }
  else
  {
    double v8 = 0.0;
  }

  size_t v9 = malloc_type_calloc(7uLL, 8uLL, 0x100004000313F17uLL);
  v10 = v9;
  *size_t v9 = xmmword_1D21C51A0;
  v9[1] = xmmword_1D21C51B0;
  v9[2] = xmmword_1D21C51C0;
  *((void *)v9 + 6) = 0x40F97D0000000000;
  if (v8 >= 104400.0) {
    double v8 = (double)((unint64_t)v8 % 0x15180);
  }
  uint64_t v11 = 0;
  while (v8 >= *((double *)v9 + v11 + 1) || v8 < *((double *)v9 + v11))
  {
    if (++v11 == 6)
    {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
  }
  if (v11 == 5) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }
LABEL_14:
  uint64_t v13 = [a1 _possibleTimesOfDay];
  double v14 = [v13 objectAtIndexedSubscript:v12];
  free(v10);

  return v14;
}

@end