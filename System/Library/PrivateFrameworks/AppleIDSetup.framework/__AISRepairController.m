@interface __AISRepairController
- (__AISRepairController)init;
- (__AISRepairController)initWithQueue:(id)a3;
- (void)generateSymptomReportWithContext:(id)a3 completionHandler:(id)a4;
- (void)repairWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation __AISRepairController

- (__AISRepairController)initWithQueue:(id)a3
{
  return (__AISRepairController *)__RepairController.init(queue:)(a3);
}

- (void)repairWithContext:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_2480D2634;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_2480CE1BC(v8, (uint64_t)v6, v7);
  sub_247F98D68((uint64_t)v6);
}

- (void)generateSymptomReportWithContext:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_2480D49A0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_2480CF628(v8, (uint64_t)v6, v7);
  sub_247F98D68((uint64_t)v6);
}

- (__AISRepairController)init
{
  result = (__AISRepairController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end