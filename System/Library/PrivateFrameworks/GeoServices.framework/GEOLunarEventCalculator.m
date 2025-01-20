@interface GEOLunarEventCalculator
- (GEOLunarEventCalculator)initWithLocation:(id)a3;
- (id)lunarEventsFrom:(id)a3 to:(id)a4;
- (id)lunarEventsFrom:(id)a3 to:(id)a4 altitude:(double)a5;
@end

@implementation GEOLunarEventCalculator

- (id)lunarEventsFrom:(id)a3 to:(id)a4
{
  v4 = [(GEOLunarEventCalculator *)self lunarEventsFrom:a3 to:a4 altitude:0.0];

  return v4;
}

- (id)lunarEventsFrom:(id)a3 to:(id)a4 altitude:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (CAADynamicalTime *)objc_msgSend(v8, "geo_julianDay");
  double v12 = CAADynamicalTime::UTC2TT(v10, v11);
  v13 = (CAADynamicalTime *)objc_msgSend(v9, "geo_julianDay");
  double v15 = CAADynamicalTime::UTC2TT(v13, v14) + 0.007;
  if (a5 == 0.0) {
    double v16 = -0.5667;
  }
  else {
    double v16 = acos(6371008.0 / (a5 + 6371008.0)) * -57.2957795 + -0.5667;
  }
  CAARiseTransitSet2::CalculateMoon(0, (uint64_t)&v31, v12, v15, -self->_location.longitude, self->_location.latitude, v16, 0.007);
  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v18 = (CAADynamicalTime *)[v17 initWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((v32 - v31) >> 3)];
  v19 = v18;
  v20 = v31;
  v21 = v32;
  if (v31 != v32)
  {
    v29 = v18;
    while (2)
    {
      uint64_t v22 = 0;
      char v23 = v20[32];
      switch(*(_DWORD *)v20)
      {
        case 0:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 0xA:
          goto LABEL_17;
        case 2:
          uint64_t v22 = 1;
          goto LABEL_10;
        case 3:
          uint64_t v22 = 3;
          goto LABEL_10;
        case 4:
          uint64_t v22 = 2;
          goto LABEL_10;
        default:
LABEL_10:
          long long v30 = *((_OWORD *)v20 + 1);
          v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "geo_dateWithJulianDay:", CAADynamicalTime::TT2UTC(v18, *((double *)v20 + 1)));
          if ([v24 compare:v8] != -1 && objc_msgSend(v24, "compare:", v9) == -1)
          {
            v25 = [GEOLunarEvent alloc];
            id v26 = v24;
            if (v25)
            {
              v33.receiver = v25;
              v33.super_class = (Class)GEOLunarEvent;
              v27 = [(GEOLunarEventCalculator *)&v33 init];
              v25 = (GEOLunarEvent *)v27;
              if (v27)
              {
                *((void *)v27 + 2) = v22;
                *(_OWORD *)(v27 + 24) = v30;
                v27[8] = v23 & 1;
                objc_storeStrong((id *)v27 + 5, v24);
              }
            }

            v19 = v29;
            [(CAADynamicalTime *)v29 addObject:v25];
          }
LABEL_17:
          v20 += 40;
          if (v20 != v21) {
            continue;
          }
          v20 = v31;
          break;
      }
      break;
    }
  }
  if (v20)
  {
    v32 = v20;
    operator delete(v20);
  }

  return v19;
}

- (GEOLunarEventCalculator)initWithLocation:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)GEOLunarEventCalculator;
  result = [(GEOLunarEventCalculator *)&v6 init];
  if (result)
  {
    result->_location.latitude = var0;
    result->_location.longitude = var1;
  }
  return result;
}

@end