@interface ACHAwardsWorkoutClient
- (ACHAwardsWorkoutClient)initWithHealthStore:(id)a3;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSUUID)identifier;
- (id)bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 error:(id *)a5;
- (id)bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 error:(id *)a5;
- (id)exportedInterface;
- (id)mindfulMinutesForForDateInterval:(id)a3 error:(id *)a4;
- (id)workoutsInDateInterval:(id)a3 error:(id *)a4;
- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 error:(id *)a5;
- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6 error:(id *)a7;
- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 endingOnOrBeforeDate:(id)a5 error:(id *)a6;
- (unint64_t)numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 error:(id *)a5;
- (void)setIdentifier:(id)a3;
- (void)setProxyProvider:(id)a3;
@end

@implementation ACHAwardsWorkoutClient

void __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_2;
  v5[3] = &unk_2645126F8;
  long long v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfFirstPartyWorkoutsWithDuration:containedInInterval:completion:", v3, v5, v2);
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  v9 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke;
  v16[3] = &unk_2645126A8;
  double v20 = a3;
  id v10 = v8;
  id v17 = v10;
  v18 = &v27;
  v19 = &v21;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_3;
  v15[3] = &unk_264512470;
  v15[4] = &v21;
  [v9 getSynchronousProxyWithHandler:v16 errorHandler:v15];

  id v11 = (id)v22[5];
  v12 = v11;
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  unint64_t v13 = v28[3];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v13;
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (ACHAwardsWorkoutClient)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHAwardsWorkoutClient;
  v5 = [(ACHAwardsWorkoutClient *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08C38] UUID];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F0A818]) initWithHealthStore:v4 taskIdentifier:@"ActivityAchievementsWorkoutTaskServer" exportedObject:v5 taskUUID:v5->_identifier];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v8;
  }
  return v5;
}

- (id)workoutsInDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = (id)MEMORY[0x263EFFA68];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  v7 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  v16 = &v24;
  id v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  id v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_2;
  v4[3] = &unk_2645126D0;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_workoutsInDateInterval:completion:", v2, v4);
}

void __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __55__ACHAwardsWorkoutClient_workoutsInDateInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (unint64_t)numberOfWorkoutsWithDuration:(double)a3 containedInInterval:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  uint64_t v9 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke;
  v16[3] = &unk_2645126A8;
  double v20 = a3;
  id v10 = v8;
  id v17 = v10;
  uint64_t v18 = &v27;
  v19 = &v21;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_3;
  v15[3] = &unk_264512470;
  v15[4] = &v21;
  [v9 getSynchronousProxyWithHandler:v16 errorHandler:v15];

  id v11 = (id)v22[5];
  v12 = v11;
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  unint64_t v13 = v28[3];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v13;
}

uint64_t __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_2;
  v5[3] = &unk_2645126F8;
  long long v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfWorkoutsWithDuration:containedInInterval:completion:", v3, v5, v2);
}

void __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __81__ACHAwardsWorkoutClient_numberOfWorkoutsWithDuration_containedInInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 endingOnOrBeforeDate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  id v11 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke;
  v18[3] = &unk_264512720;
  double v22 = a3;
  unint64_t v23 = a4;
  id v12 = v10;
  id v19 = v12;
  double v20 = &v30;
  uint64_t v21 = &v24;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_3;
  v17[3] = &unk_264512470;
  v17[4] = &v24;
  [v11 getSynchronousProxyWithHandler:v18 errorHandler:v17];

  id v13 = (id)v25[5];
  v14 = v13;
  if (v13)
  {
    if (a6) {
      *a6 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  unint64_t v15 = v31[3];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v15;
}

uint64_t __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_2;
  v6[3] = &unk_2645126F8;
  long long v7 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfFirstPartyWorkoutsWithDuration:type:endingOnOrBeforeDate:completion:", v3, v4, v6, v2);
}

void __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __101__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_endingOnOrBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
}

void __91__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_containedInInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (unint64_t)numberOfFirstPartyWorkoutsWithDuration:(double)a3 withType:(unint64_t)a4 andLocation:(unint64_t)a5 containedInInterval:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  id v13 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke;
  v20[3] = &unk_264512748;
  double v24 = a3;
  unint64_t v25 = a4;
  unint64_t v26 = a5;
  id v14 = v12;
  id v21 = v14;
  double v22 = &v33;
  unint64_t v23 = &v27;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_3;
  v19[3] = &unk_264512470;
  v19[4] = &v27;
  [v13 getSynchronousProxyWithHandler:v20 errorHandler:v19];

  id v15 = (id)v28[5];
  v16 = v15;
  if (v15)
  {
    if (a7) {
      *a7 = v15;
    }
    else {
      _HKLogDroppedError();
    }
  }

  unint64_t v17 = v34[3];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

uint64_t __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_2;
  v7[3] = &unk_2645126F8;
  long long v8 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_numberOfFirstPartyWorkoutsWithDuration:type:andLocation:containedInInterval:completion:", v3, v4, v5, v7, v2);
}

void __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __112__ACHAwardsWorkoutClient_numberOfFirstPartyWorkoutsWithDuration_withType_andLocation_containedInInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)bestEnergyBurnedForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__1;
  unint64_t v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  uint64_t v9 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke;
  v16[3] = &unk_2645126A8;
  unint64_t v20 = a3;
  id v10 = v8;
  id v17 = v10;
  uint64_t v18 = &v27;
  id v19 = &v21;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3;
  v15[3] = &unk_264512470;
  v15[4] = &v21;
  [v9 getSynchronousProxyWithHandler:v16 errorHandler:v15];

  id v11 = (id)v22[5];
  id v12 = v11;
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v13 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2;
  v5[3] = &unk_264512770;
  long long v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_bestEnergyBurnedForFirstPartyWorkoutsWithType:endingBeforeDate:completion:", v2, v3, v5);
}

void __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __95__ACHAwardsWorkoutClient_bestEnergyBurnedForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)bestDistanceForFirstPartyWorkoutsWithType:(unint64_t)a3 endingBeforeDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__1;
  unint64_t v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  uint64_t v9 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke;
  v16[3] = &unk_2645126A8;
  unint64_t v20 = a3;
  id v10 = v8;
  id v17 = v10;
  uint64_t v18 = &v27;
  id v19 = &v21;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3;
  v15[3] = &unk_264512470;
  v15[4] = &v21;
  [v9 getSynchronousProxyWithHandler:v16 errorHandler:v15];

  id v11 = (id)v22[5];
  id v12 = v11;
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v13 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v13;
}

uint64_t __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2;
  v5[3] = &unk_264512770;
  long long v6 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_bestDistanceForFirstPartyWorkoutsWithType:endingBeforeDate:completion:", v2, v3, v5);
}

void __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __91__ACHAwardsWorkoutClient_bestDistanceForFirstPartyWorkoutsWithType_endingBeforeDate_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)mindfulMinutesForForDateInterval:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  double v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v7 = [(ACHAwardsWorkoutClient *)self proxyProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke;
  v14[3] = &unk_264512510;
  id v8 = v6;
  id v15 = v8;
  v16 = &v24;
  id v17 = &v18;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_3;
  v13[3] = &unk_264512470;
  v13[4] = &v18;
  [v7 getSynchronousProxyWithHandler:v14 errorHandler:v13];

  id v9 = (id)v19[5];
  id v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v11 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v11;
}

uint64_t __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_2;
  v4[3] = &unk_264512770;
  long long v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_mindfulMinutesForForDateInterval:completion:", v2, v4);
}

void __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __65__ACHAwardsWorkoutClient_mindfulMinutesForForDateInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1067B0];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setProxyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end