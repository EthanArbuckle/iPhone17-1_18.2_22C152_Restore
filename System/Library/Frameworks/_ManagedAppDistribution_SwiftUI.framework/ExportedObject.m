@interface ExportedObject
- (void)setWithManagedAppViewData:(id)a3 reply:(id)a4;
@end

@implementation ExportedObject

- (void)setWithManagedAppViewData:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  id v6 = a3;
  swift_retain();
  uint64_t v7 = sub_24659CE88();
  unint64_t v9 = v8;

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v5;
  ExportedObject.set(managedAppViewData:reply:)(v7, v9, (uint64_t)sub_246558110, v10);
  swift_release();
  sub_2465552F8(v7, v9);

  swift_release();
}

@end