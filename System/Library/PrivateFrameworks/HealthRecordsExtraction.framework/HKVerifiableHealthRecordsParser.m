@interface HKVerifiableHealthRecordsParser
- (id)parseDataSource:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation HKVerifiableHealthRecordsParser

- (id)parseDataSource:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataHandler);
  id v36 = 0;
  v9 = [(HDHRSignedClinicalDataHandler *)v8 preprocessDataInSource:v7 options:5 error:&v36];
  id v10 = v36;
  v11 = v10;
  if (v9)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    id v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__2;
    v28[4] = __Block_byref_object_dispose__2;
    id v29 = 0;
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __65__HKVerifiableHealthRecordsParser_parseDataSource_options_error___block_invoke;
    v24 = &unk_264BD9A48;
    v26 = &v30;
    v27 = v28;
    v13 = v12;
    v25 = v13;
    [(HDHRSignedClinicalDataHandler *)v8 processContextCollection:v9 completion:&v21];
    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    v14 = (void *)v31[5];
    if (v14)
    {
      v15 = objc_msgSend(v14, "items", v21, v22, v23, v24);
      v16 = objc_msgSend(v15, "hk_map:", &__block_literal_global_2);

      v17 = (void *)[objc_alloc(MEMORY[0x263F45D40]) initWithOptions:a4 localizedTypeDisplayNames:v16];
    }
    else
    {
      objc_msgSend(v11, "mappedError", v21, v22, v23, v24);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v19;
      if (v19)
      {
        if (a5) {
          *a5 = v19;
        }
        else {
          _HKLogDroppedError();
        }
      }

      v17 = 0;
    }

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    id v18 = [v10 mappedError];
    if (v18)
    {
      if (a5) {
        *a5 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

void __65__HKVerifiableHealthRecordsParser_parseDataSource_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id __65__HKVerifiableHealthRecordsParser_parseDataSource_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 mainRecord];
  v3 = [v2 recordTypeDisplayName];

  return v3;
}

@end