@interface HFAccessoryProfileFilter
+ (BOOL)_shouldIncludeObject:(id)a3 passingNullableFilterSet:(id)a4;
+ (BOOL)_shouldIncludeObjectPassingFilter:(BOOL)a3 shouldApplyFilter:(BOOL)a4;
+ (id)filterProfiles:(id)a3 options:(id)a4;
@end

@implementation HFAccessoryProfileFilter

+ (id)filterProfiles:(id)a3 options:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke;
  v10[3] = &unk_264097AE0;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  v8 = objc_msgSend(a3, "na_filter:", v10);

  return v8;
}

uint64_t __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = [v3 accessory];
  id v6 = [*(id *)(a1 + 32) byAccessories];
  if ([v4 _shouldIncludeObject:v5 passingNullableFilterSet:v6])
  {
    id v7 = *(void **)(a1 + 40);
    v8 = [v3 accessory];
    v9 = [v8 category];
    v10 = [v9 categoryType];
    id v11 = [*(id *)(a1 + 32) byCategoryTypes];
    if ([v7 _shouldIncludeObject:v10 passingNullableFilterSet:v11])
    {
      v48 = v8;
      id v12 = *(void **)(a1 + 40);
      v13 = [*(id *)(a1 + 32) byClasses];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke_2;
      v49[3] = &unk_264093938;
      id v14 = v3;
      id v50 = v14;
      v47 = v13;
      uint64_t v15 = objc_msgSend(v13, "na_any:", v49);
      uint64_t v46 = [*(id *)(a1 + 32) byClasses];
      if ([v12 _shouldIncludeObjectPassingFilter:v15 shouldApplyFilter:v46 != 0])
      {
        v16 = *(void **)(a1 + 40);
        v45 = [v14 accessory];
        if (objc_msgSend(v16, "_shouldIncludeObjectPassingFilter:shouldApplyFilter:", objc_msgSend(v45, "hf_effectiveIsFavorite"), objc_msgSend(*(id *)(a1 + 32), "byFavorites")))
        {
          v42 = *(void **)(a1 + 40);
          v17 = [v14 accessory];
          uint64_t v18 = [v17 manufacturer];
          uint64_t v19 = [*(id *)(a1 + 32) byManufacturers];
          v20 = v42;
          v41 = (void *)v19;
          v43 = (void *)v18;
          v44 = v17;
          if (objc_msgSend(v20, "_shouldIncludeObject:passingNullableFilterSet:", v18))
          {
            v38 = *(void **)(a1 + 40);
            v21 = [v14 accessory];
            uint64_t v22 = [v21 model];
            uint64_t v23 = [*(id *)(a1 + 32) byModels];
            v24 = v38;
            v37 = (void *)v23;
            v39 = (void *)v22;
            v40 = v21;
            if (objc_msgSend(v24, "_shouldIncludeObject:passingNullableFilterSet:", v22))
            {
              v25 = *(void **)(a1 + 40);
              v36 = [v14 accessory];
              uint64_t v26 = [v36 room];
              v34 = [*(id *)(a1 + 32) byRooms];
              v35 = (void *)v26;
              if (objc_msgSend(v25, "_shouldIncludeObject:passingNullableFilterSet:", v26))
              {
                v27 = [*(id *)(a1 + 32) byFilter];
                if (v27)
                {
                  v28 = v27;
                  v29 = [*(id *)(a1 + 32) byFilter];
                  uint64_t v30 = ((uint64_t (**)(void, id))v29)[2](v29, v14);

                  v27 = v28;
                }
                else
                {
                  uint64_t v30 = 1;
                }
                v31 = v47;
                v8 = v48;
                v32 = (void *)v46;
              }
              else
              {
                uint64_t v30 = 0;
                v31 = v47;
                v8 = v48;
                v32 = (void *)v46;
              }
            }
            else
            {
              uint64_t v30 = 0;
              v31 = v47;
              v8 = v48;
              v32 = (void *)v46;
            }
          }
          else
          {
            uint64_t v30 = 0;
            v31 = v47;
            v8 = v48;
            v32 = (void *)v46;
          }
        }
        else
        {
          uint64_t v30 = 0;
          v31 = v47;
          v8 = v48;
          v32 = (void *)v46;
        }
      }
      else
      {
        uint64_t v30 = 0;
        v31 = v47;
        v8 = v48;
        v32 = (void *)v46;
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

uint64_t __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (BOOL)_shouldIncludeObjectPassingFilter:(BOOL)a3 shouldApplyFilter:(BOOL)a4
{
  return !a4 || a3;
}

+ (BOOL)_shouldIncludeObject:(id)a3 passingNullableFilterSet:(id)a4
{
  if (a3) {
    a3 = (id)objc_msgSend(a4, "containsObject:");
  }
  return [a1 _shouldIncludeObjectPassingFilter:a3 shouldApplyFilter:a4 != 0];
}

@end