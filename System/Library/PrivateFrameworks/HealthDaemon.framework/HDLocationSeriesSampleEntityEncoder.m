@interface HDLocationSeriesSampleEntityEncoder
@end

@implementation HDLocationSeriesSampleEntityEncoder

uint64_t __87___HDLocationSeriesSampleEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __130___HDLocationSeriesSampleEntityEncoder_generateCodableRepresentationsForPersistentID_row_maxBytesPerRepresentation_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 124 > *(void *)(a1 + 72))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v4 + 40);
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_storeStrong((id *)(v4 + 40), obj);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (v5 == 1)
    {
LABEL_6:
      uint64_t v11 = 0;
      goto LABEL_10;
    }
    if (v5 == 2)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Message send for codable representation reported error status without specifying an error.");
        uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;
      }
      goto LABEL_6;
    }
  }
  v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v12)
  {
    v13 = objc_alloc_init(HDCodableLocationSeries);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSample:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFrozen:*(unsigned __int8 *)(a1 + 88)];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 80);
    v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  [v12 addLocationData:v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += 124;
  uint64_t v11 = 1;
LABEL_10:

  return v11;
}

uint64_t __90___HDLocationSeriesSampleEntityEncoder__enumerateCodableSeries_transaction_error_handler___block_invoke(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v9 = objc_alloc_init(HDCodableLocationDatum);
  if (v8)
  {
    [v8 clientLocation];
    double v10 = *(double *)((char *)&v23[4] + 12);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v10 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setTimestamp:](v9, "setTimestamp:", v10, *(void *)&v23[0]);
  if (v8)
  {
    [v8 clientLocation];
    double v11 = *(double *)((char *)v23 + 4);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v11 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setLatitude:](v9, "setLatitude:", v11, v23[0]);
  if (v8)
  {
    [v8 clientLocation];
    double v12 = *(double *)((char *)v23 + 12);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v12 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setLongitude:](v9, "setLongitude:", v12, v23[0], *(void *)&v23[1]);
  if (v8)
  {
    [v8 clientLocation];
    double v13 = *(double *)((char *)&v23[1] + 12);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v13 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setAltitude:](v9, "setAltitude:", v13, v23[0], *(void *)&v23[1]);
  if (v8)
  {
    [v8 clientLocation];
    double v14 = *(double *)((char *)&v23[2] + 12);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v14 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setSpeed:](v9, "setSpeed:", v14, v23[0], *(void *)&v23[1]);
  if (v8)
  {
    [v8 clientLocation];
    double v15 = *(double *)((char *)&v23[3] + 12);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v15 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setCourse:](v9, "setCourse:", v15, v23[0], *(void *)&v23[1]);
  if (v8)
  {
    [v8 clientLocation];
    double v16 = *(double *)((char *)&v23[1] + 4);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v16 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setHorizontalAccuracy:](v9, "setHorizontalAccuracy:", v16, v23[0], v23[1], *(void *)&v23[2]);
  if (v8)
  {
    [v8 clientLocation];
    double v17 = *(double *)((char *)&v23[2] + 4);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v17 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setVerticalAccuracy:](v9, "setVerticalAccuracy:", v17, v23[0], v23[1], v23[2], *(void *)&v23[3]);
  if (v8)
  {
    [v8 clientLocation];
    double v18 = *(double *)((char *)&v23[3] + 4);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v18 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setSpeedAccuracy:](v9, "setSpeedAccuracy:", v18, v23[0], v23[1], v23[2], v23[3], *(void *)&v23[4]);
  if (v8)
  {
    [v8 clientLocation];
    double v19 = *(double *)((char *)&v23[4] + 4);
  }
  else
  {
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    double v19 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setCourseAccuracy:](v9, "setCourseAccuracy:", v19, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5], v24, v25, v26[0], v26[1]);
  if (v8)
  {
    [v8 clientLocation];
    uint64_t v20 = HIDWORD(v26[0]);
  }
  else
  {
    uint64_t v20 = 0;
    long long v25 = 0u;
    memset(v26, 0, 28);
    long long v24 = 0u;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setSignalEnvironmentType:](v9, "setSignalEnvironmentType:", v20, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5], v24, v25, v26[0], v26[1]);

  uint64_t v21 = (*(uint64_t (**)(uint64_t, HDCodableLocationDatum *, double))(v7 + 16))(v7, v9, a2);
  return v21;
}

@end