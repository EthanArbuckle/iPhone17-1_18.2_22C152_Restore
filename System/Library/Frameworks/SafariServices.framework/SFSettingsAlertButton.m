@interface SFSettingsAlertButton
@end

@implementation SFSettingsAlertButton

void __43___SFSettingsAlertButton_updateConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v37 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = [v37 topAnchor];
  v7 = [*(id *)(a1 + 40) topAnchor];
  v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7];
  [v5 addObject:v8];

  v9 = *(void **)(a1 + 32);
  v10 = [v37 bottomAnchor];
  v11 = [*(id *)(a1 + 40) bottomAnchor];
  v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
  [v9 addObject:v12];

  v13 = *(void **)(a1 + 32);
  v14 = [v37 leadingAnchor];
  v15 = [*(id *)(a1 + 40) leadingAnchor];
  v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15];
  [v13 addObject:v16];

  v17 = *(void **)(a1 + 32);
  v18 = [v37 trailingAnchor];
  v19 = [*(id *)(a1 + 40) trailingAnchor];
  v20 = [v18 constraintLessThanOrEqualToAnchor:v19];
  [v17 addObject:v20];

  if (a3)
  {
    v21 = *(void **)(a1 + 32);
    v22 = [v37 leadingAnchor];
    v23 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3 - 1];
    v24 = [v23 trailingAnchor];
    v25 = [v22 constraintGreaterThanOrEqualToAnchor:v24 constant:16.0];
    [v21 addObject:v25];
  }
  v26 = *(void **)(a1 + 56);
  v27 = v37;
  if ((id)v26[77] == v37 || (id)v26[64] == v37) {
    v27 = (void *)v26[65];
  }
  v28 = [v27 centerYAnchor];
  v29 = [*(id *)(a1 + 56) centerYAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];

  *(float *)&double v31 = (float)(unint64_t)(*(void *)(a1 + 64) - a3) + 50.0;
  [v30 setPriority:v31];
  [*(id *)(a1 + 32) addObject:v30];
  if (*(void *)(a1 + 64) == 1)
  {
    v32 = [v37 centerXAnchor];
    uint64_t v33 = [*(id *)(a1 + 56) centerXAnchor];
  }
  else
  {
    if (a3)
    {
      v32 = [v37 trailingAnchor];
      [*(id *)(a1 + 40) trailingAnchor];
    }
    else
    {
      v32 = [v37 leadingAnchor];
      [*(id *)(a1 + 40) leadingAnchor];
    uint64_t v33 = };
  }
  v34 = (void *)v33;
  v35 = [v32 constraintEqualToAnchor:v33];

  LODWORD(v36) = 1112276992;
  [v35 setPriority:v36];
  [*(id *)(a1 + 32) addObject:v35];
}

void *__43___SFSettingsAlertButton__arrangedSubviews__block_invoke(void *a1, uint64_t a2)
{
  v2 = a1;
  switch(a2)
  {
    case 0:
      uint64_t v3 = 616;
      v4 = [*(id *)(a1[4] + 616) superview];
      if (!v4) {
        uint64_t v3 = 512;
      }
      v2 = *(id *)(v2[4] + v3);

      break;
    case 1:
      uint64_t v5 = a1[4];
      uint64_t v6 = 592;
      goto LABEL_8;
    case 2:
      uint64_t v5 = a1[4];
      uint64_t v6 = 600;
      goto LABEL_8;
    case 3:
      uint64_t v5 = a1[4];
      uint64_t v6 = 608;
LABEL_8:
      v2 = *(id *)(v5 + v6);
      break;
    default:
      break;
  }

  return v2;
}

id __43___SFSettingsAlertButton__arrangedSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 integerValue]);
  uint64_t v3 = [v2 superview];
  if (v3) {
    v4 = v2;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end