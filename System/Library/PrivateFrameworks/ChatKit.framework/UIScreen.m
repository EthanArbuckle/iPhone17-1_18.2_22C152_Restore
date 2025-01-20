@interface UIScreen
@end

@implementation UIScreen

void __42__UIScreen_ChatKit__ck_screenSizeCategory__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fixedCoordinateSpace];
  [v2 bounds];
  double v4 = v3;

  v5 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 5)
  {
    uint64_t v7 = 2;
LABEL_35:
    ck_screenSizeCategory_screenCategory = v7;
    return;
  }
  if (!v6 && v4 == 568.0 || (v6 == 1 ? (BOOL v8 = v4 == 1024.0) : (BOOL v8 = 0), v8))
  {
    uint64_t v7 = 1;
    goto LABEL_35;
  }
  BOOL v10 = v4 == 1112.0 && v6 == 1;
  BOOL v11 = v4 == 667.0 && v6 == 0;
  uint64_t v7 = 2;
  if (v11 || v10) {
    goto LABEL_35;
  }
  BOOL v12 = v4 == 1366.0 && v6 == 1;
  BOOL v13 = v12;
  BOOL v14 = v4 == 736.0 && v6 == 0;
  uint64_t v7 = 3;
  if (v14 || v13) {
    goto LABEL_35;
  }
  if (!v6 && v4 == 812.0)
  {
    uint64_t v7 = 4;
    goto LABEL_35;
  }
}

@end