@interface CKThrottleTable
+ (Class)entryClass;
+ (id)dbProperties;
- (id)updateRequestCount:(id)a3;
@end

@implementation CKThrottleTable

+ (id)dbProperties
{
  return &unk_1ED846A48;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)updateRequestCount:(id)a3
{
  return (id)objc_msgSend_updateProperties_usingObject_label_(self, a2, (uint64_t)&unk_1ED845FB8, (uint64_t)a3, off_1E54649A0);
}

@end