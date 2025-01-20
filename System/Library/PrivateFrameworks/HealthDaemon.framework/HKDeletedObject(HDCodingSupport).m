@interface HKDeletedObject(HDCodingSupport)
+ (uint64_t)createWithCodable:()HDCodingSupport;
- (uint64_t)codableRepresentationForSync;
@end

@implementation HKDeletedObject(HDCodingSupport)

+ (uint64_t)createWithCodable:()HDCodingSupport
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HKObject+HDCodingSupport.m", 1391, @"HKDeletedObjects don't use HDCodingSupport, deleted objects from codable is handled in HDDatatSyncEntity's _insertObjectsFromCodableObjectCollection:syncStore:profile:error:" object file lineNumber description];

  return 0;
}

- (uint64_t)codableRepresentationForSync
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];

  return 0;
}

@end