@interface GEOPointUtility
+ ($1AB5FA073B851C12C2339EC22442E995)pointAt:(unint64_t)a3 pointData:(id)a4 usesZilch:(BOOL)a5;
+ (id)compressedZilchDataFromPoints:(void *)a3 fromPointIndex:(unint64_t)a4 pointCount:(unint64_t)a5;
+ (id)debugDescriptionForCompressedZilchData:(id)a3;
+ (id)subdataFromPointData:(id)a3 fromPointIndex:(unint64_t)a4 usesZilch:(BOOL)a5;
+ (id)unpackBasicPoints:(id)a3;
+ (id)unpackPoints:(id)a3 usesZilch:(BOOL)a4;
+ (id)unpackZilchPoints:(id)a3;
+ (unint64_t)pointCount:(id)a3 usesZilch:(BOOL)a4;
+ (void)controlPoints:(id)a3 usesZilch:(BOOL)a4;
@end

@implementation GEOPointUtility

+ (void)controlPoints:(id)a3 usesZilch:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4) {
    v7 = (void *)[v5 bytes];
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (unint64_t)pointCount:(id)a3 usesZilch:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4) {
    unint64_t v7 = (unint64_t)[v5 length] >> 5;
  }
  else {
    unint64_t v7 = (unint64_t)[v5 length] >> 4;
  }
  unint64_t v8 = v7;

  return v8;
}

+ ($1AB5FA073B851C12C2339EC22442E995)pointAt:(unint64_t)a3 pointData:(id)a4 usesZilch:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if (+[GEOPointUtility pointCount:v7 usesZilch:v5] <= a3)
  {
    uint64_t v8 = 0x7FEFFFFFFFFFFFFFLL;
    unint64_t v9 = 0xC066800000000000;
    unint64_t v10 = 0xC066800000000000;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x4812000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = "";
    long long v22 = xmmword_18A62CC20;
    uint64_t v23 = 0x7FEFFFFFFFFFFFFFLL;
    if (v5)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke;
      v15[3] = &unk_1E53D8798;
      v15[4] = &v16;
      v15[5] = 32 * a3;
      [v7 enumerateByteRangesUsingBlock:v15];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke_2;
      v14[3] = &unk_1E53D8798;
      v14[4] = &v16;
      v14[5] = 16 * a3;
      [v7 enumerateByteRangesUsingBlock:v14];
    }
    unint64_t v9 = v17[6];
    unint64_t v10 = v17[7];
    uint64_t v8 = v17[8];
    _Block_object_dispose(&v16, 8);
  }

  double v11 = *(double *)&v9;
  double v12 = *(double *)&v10;
  double v13 = *(double *)&v8;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

void __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  unint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = v5 >= a3;
  unint64_t v6 = v5 - a3;
  BOOL v7 = !v7 || v6 >= a4;
  if (!v7)
  {
    unint64_t v10 = (zilch::ControlPoint *)(a2 + (v6 & 0xFFFFFFFFFFFFFFE0));
    double v11 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
    if (zilch::GeoCoordinates::z(v11) == 0x7FFFFFFF)
    {
      double v12 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      int v29 = zilch::GeoCoordinates::y(v12);
      double v14 = zilch::Latitude::toDegrees((zilch::Latitude *)&v29, v13);
      v15 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      int v28 = zilch::GeoCoordinates::x(v15);
      double v17 = zilch::Longitude::toDegrees((zilch::Longitude *)&v28, v16);
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
      *(double *)(v18 + 48) = v14;
      *(double *)(v18 + 56) = v17;
      *(void *)(v18 + 64) = 0;
    }
    else
    {
      v19 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      int v29 = zilch::GeoCoordinates::y(v19);
      double v21 = zilch::Latitude::toDegrees((zilch::Latitude *)&v29, v20);
      long long v22 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      int v28 = zilch::GeoCoordinates::x(v22);
      double v24 = zilch::Longitude::toDegrees((zilch::Longitude *)&v28, v23);
      v25 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v10);
      int v26 = zilch::GeoCoordinates::z(v25);
      v27 = *(double **)(*(void *)(a1 + 32) + 8);
      v27[6] = v21;
      v27[7] = v24;
      v27[8] = (double)v26 / 100.0;
    }
    *a5 = 1;
  }
}

__n128 __47__GEOPointUtility_pointAt_pointData_usesZilch___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  unint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = v5 >= a3;
  unint64_t v6 = v5 - a3;
  BOOL v7 = !v7 || v6 >= a4;
  if (!v7)
  {
    __n128 result = *(__n128 *)(a2 + (v6 & 0xFFFFFFFFFFFFFFF0));
    unint64_t v9 = *(__n128 **)(*(void *)(a1 + 32) + 8);
    v9[3] = result;
    v9[4].n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
    *a5 = 1;
  }
  return result;
}

+ (id)unpackPoints:(id)a3 usesZilch:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4) {
    +[GEOPointUtility unpackZilchPoints:v5];
  }
  else {
  unint64_t v6 = +[GEOPointUtility unpackBasicPoints:v5];
  }

  return v6;
}

+ (id)unpackZilchPoints:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    zilch::Message::Message((zilch::Message *)v5);
  }

  return 0;
}

+ (id)unpackBasicPoints:(id)a3
{
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_55;
  }
  id v4 = v3;
  uint64_t v5 = [v4 bytes];
  unint64_t v6 = 8 * [v4 length];
  if (v6 < 0x53) {
    goto LABEL_55;
  }
  LODWORD(v7) = 0;
  unint64_t v8 = 0;
  do
  {
    if (v8 + 18 > v6) {
      goto LABEL_55;
    }
    int v9 = 0;
    unint64_t v10 = 18;
    do
    {
      unint64_t v11 = 8 - (v8 & 7);
      if (v10 < v11) {
        unint64_t v11 = v10;
      }
      int v9 = (*(unsigned __int8 *)(v5 + (v8 >> 3)) >> (8 - (v8 & 7) - v11)) & ~(-1 << v11) | (v9 << v11);
      v8 += v11;
      v10 -= v11;
    }
    while (v10);
    if (v8 + 5 > v6) {
      goto LABEL_55;
    }
    int v12 = 0;
    unint64_t v13 = 5;
    do
    {
      unint64_t v14 = 8 - (v8 & 7);
      if (v13 < v14) {
        unint64_t v14 = v13;
      }
      int v12 = (*(unsigned __int8 *)(v5 + (v8 >> 3)) >> (8 - (v8 & 7) - v14)) & ~(-1 << v14) | (v12 << v14);
      v8 += v14;
      v13 -= v14;
    }
    while (v13);
    v8 += (2 * v9 * v12) + 60;
    if (v6 < v8) {
      goto LABEL_55;
    }
    uint64_t v7 = (v7 + v9 + 1);
  }
  while (v6 - v8 > 0x52);
  if (!v7)
  {
LABEL_55:
    id v41 = 0;
    goto LABEL_56;
  }
  id v15 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:16 * v7];
  double v16 = (char *)[v15 bytes];
  unint64_t v17 = 0;
  uint64_t v18 = 0;
  unsigned int v19 = 0;
  int v20 = 0;
  int v21 = 0;
  int v22 = 0;
  while (v20)
  {
    if (v19)
    {
      if (v17 + v19 > v6) {
        goto LABEL_59;
      }
      int v23 = 0;
      unint64_t v24 = v19;
      unint64_t v25 = v19;
      do
      {
        unint64_t v26 = 8 - (v17 & 7);
        if (v25 < v26) {
          unint64_t v26 = v25;
        }
        int v23 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v26)) & ~(-1 << v26) | (v23 << v26);
        v17 += v26;
        v25 -= v26;
      }
      while (v25);
      if (v17 + v19 > v6) {
        goto LABEL_59;
      }
      int v27 = 0;
      int v28 = v23 << -(char)v19 >> -(char)v19;
      do
      {
        unint64_t v29 = 8 - (v17 & 7);
        if (v24 < v29) {
          unint64_t v29 = v24;
        }
        int v27 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v29)) & ~(-1 << v29) | (v27 << v29);
        v17 += v29;
        v24 -= v29;
      }
      while (v24);
      v22 += v28;
      v21 += v27 << (32 - v19) >> (32 - v19);
    }
    --v20;
LABEL_53:
    v40 = (double *)&v16[16 * v18];
    double *v40 = (double)v22 / 1000000.0;
    v40[1] = (double)v21 / 1000000.0;
    if (++v18 == v7)
    {
      id v41 = v15;
      goto LABEL_62;
    }
  }
  if (v17 + 18 <= v6)
  {
    int v20 = 0;
    unint64_t v30 = 18;
    do
    {
      unint64_t v31 = 8 - (v17 & 7);
      if (v30 < v31) {
        unint64_t v31 = v30;
      }
      int v20 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v31)) & ~(-1 << v31) | (v20 << v31);
      v17 += v31;
      v30 -= v31;
    }
    while (v30);
    if (v17 + 5 <= v6)
    {
      unsigned int v19 = 0;
      unint64_t v32 = 5;
      do
      {
        unint64_t v33 = 8 - (v17 & 7);
        if (v32 < v33) {
          unint64_t v33 = v32;
        }
        unsigned int v19 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v33)) & ~(-1 << v33) | (v19 << v33);
        v17 += v33;
        v32 -= v33;
      }
      while (v32);
      if (v17 + 30 <= v6)
      {
        int v34 = 0;
        unint64_t v35 = 30;
        do
        {
          unint64_t v36 = 8 - (v17 & 7);
          if (v35 < v36) {
            unint64_t v36 = v35;
          }
          int v34 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v36)) & ~(-1 << v36) | (v34 << v36);
          v17 += v36;
          v35 -= v36;
        }
        while (v35);
        if (v17 + 30 <= v6)
        {
          int v37 = 0;
          int v22 = (4 * v34) >> 2;
          unint64_t v38 = 30;
          do
          {
            unint64_t v39 = 8 - (v17 & 7);
            if (v38 < v39) {
              unint64_t v39 = v38;
            }
            int v37 = (*(unsigned __int8 *)(v5 + (v17 >> 3)) >> (8 - (v17 & 7) - v39)) & ~(-1 << v39) | (v37 << v39);
            v17 += v39;
            v38 -= v39;
          }
          while (v38);
          int v21 = (4 * v37) >> 2;
          goto LABEL_53;
        }
      }
    }
  }
LABEL_59:
  if (v16) {
    free(v16);
  }
  id v41 = 0;
LABEL_62:

LABEL_56:

  return v41;
}

+ (id)compressedZilchDataFromPoints:(void *)a3 fromPointIndex:(unint64_t)a4 pointCount:(unint64_t)a5
{
  zilch::Message::Message((zilch::Message *)v6);
}

+ (id)subdataFromPointData:(id)a3 fromPointIndex:(unint64_t)a4 usesZilch:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  unint64_t v8 = v7;
  if (!a4)
  {
    id v11 = v7;
    goto LABEL_8;
  }
  if (v5) {
    char v9 = 5;
  }
  else {
    char v9 = 4;
  }
  unint64_t v10 = a4 << v9;
  if (v10 < [v7 length])
  {
    objc_msgSend(v8, "subdataWithRange:", v10, objc_msgSend(v8, "length") - v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    int v12 = v11;
    goto LABEL_10;
  }
  int v12 = 0;
LABEL_10:

  return v12;
}

+ (id)debugDescriptionForCompressedZilchData:(id)a3
{
  id v3 = +[GEOPointUtility unpackPoints:a3 usesZilch:1];
  unint64_t v4 = +[GEOPointUtility pointCount:v3 usesZilch:1];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Points: %d\n", v4);
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    for (uint64_t i = 0; i != v4; ++i)
    {
      +[GEOPointUtility pointAt:i pointData:v3 usesZilch:1];
      [(__CFString *)v5 appendFormat:@"%f, %f\n", v7, v8];
    }
  }
  else
  {
    BOOL v5 = @"Points: 0";
  }

  return v5;
}

@end