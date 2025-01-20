@interface CLSLocationMobilityInformant
+ (id)classIdentifier;
+ (id)familyIdentifier;
+ (id)informantDependenciesIdentifiers;
- (id)_locationMobilityClueForInvestigation:(id)a3;
- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4;
@end

@implementation CLSLocationMobilityInformant

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)classIdentifier
{
  return @"locationspan";
}

+ (id)familyIdentifier
{
  v2 = @"com.apple.mediaminingkit.informant.core";
  return @"com.apple.mediaminingkit.informant.core";
}

- (id)_locationMobilityClueForInvestigation:(id)a3
{
  id v3 = a3;
  v4 = [v3 clueCollection];
  v5 = [MEMORY[0x1E4F28BD0] set];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__16;
  v22[4] = __Block_byref_object_dispose__17;
  id v23 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __70__CLSLocationMobilityInformant__locationMobilityClueForInvestigation___block_invoke;
  v19 = &unk_1E690E740;
  v21 = v22;
  id v6 = v5;
  id v20 = v6;
  [v4 enumerateLocationClues:&v16];
  if (!objc_msgSend(v6, "count", v16, v17, v18, v19))
  {
    v12 = 0;
    goto LABEL_14;
  }
  unint64_t v7 = [v6 countForObject:@"Plane"];
  unint64_t v8 = [v6 countForObject:@"Car"];
  unint64_t v9 = [v6 countForObject:@"Pedestrian"];
  if (v7)
  {
    v10 = @"Plane";
    v11 = @"Plane";
  }
  else
  {
    v10 = 0;
  }
  if (v8 > v7 && v8 >= [v4 numberOfDays] + 1)
  {
    v13 = @"Car";

    v10 = @"Car";
  }
  else if (!v7)
  {
    v10 = 0;
LABEL_12:
    v14 = @"Pedestrian";

    v10 = @"Pedestrian";
    goto LABEL_13;
  }
  if (v9 > [v6 countForObject:v10]) {
    goto LABEL_12;
  }
LABEL_13:
  v12 = +[CLSMeaningClue clueWithValue:v10 forKey:@"Location Mobility"];

LABEL_14:
  _Block_object_dispose(v22, 8);

  return v12;
}

void __70__CLSLocationMobilityInformant__locationMobilityClueForInvestigation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 location];
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    [v4 distanceFromLocation:v3];
    if (v5 >= 1000.0)
    {
      id v6 = @"Plane";
      if (v5 < 500000.0) {
        id v6 = @"Car";
      }
      if (v5 >= 25000.0) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v7 = @"Pedestrian";
      }
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void (**)(void, void, double))MEMORY[0x1D2602540](a4);
  uint64_t v8 = [(CLSLocationMobilityInformant *)self _locationMobilityClueForInvestigation:v6];

  if (v7 && (char v11 = 0, ((void (**)(void, char *, double))v7)[2](v7, &v11, 0.5), v11))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = 42;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
    }
    unint64_t v9 = 0;
  }
  else if (v8)
  {
    v12 = v8;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

@end