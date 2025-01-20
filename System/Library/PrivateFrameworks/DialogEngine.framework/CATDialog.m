@interface CATDialog
+ (id)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9;
+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 completion:(id)a8;
+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9;
+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 completion:(id)a7;
+ (void)execute:(id)a3 paramsXML:(id)a4 localeXML:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10;
+ (void)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10;
+ (void)preload;
@end

@implementation CATDialog

+ (id)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9
{
  v9 = CATExecutor(a3, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, 0);
  return v9;
}

+ (void)execute:(id)a3 templateDir:(id)a4 catId:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  id v10 = CATExecutor(0, (uint64_t)a4, a5, 0, 0, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10);
}

+ (void)execute:(id)a3 paramsXML:(id)a4 localeXML:(id)a5 parameters:(id)a6 globals:(id)a7 callback:(id)a8 options:(int)a9 completion:(id)a10
{
  id v10 = CATExecutor(a3, 0, 0, a4, a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, a9, a10);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 completion:(id)a7
{
  id v7 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, 0, 0, a7);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 completion:(id)a8
{
  id v8 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 0, a8);
}

+ (void)execute:(id)a3 catId:(id)a4 parameters:(id)a5 globals:(id)a6 callback:(id)a7 options:(int)a8 completion:(id)a9
{
  id v9 = CATExecutor(a3, 0, a4, 0, 0, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, a9);
}

+ (void)preload
{
}

@end