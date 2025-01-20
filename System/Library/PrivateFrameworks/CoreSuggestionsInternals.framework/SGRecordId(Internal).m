@interface SGRecordId(Internal)
+ (uint64_t)recordIdForContactDetailWithRowId:()Internal;
+ (uint64_t)recordIdForContactWithRowId:()Internal;
+ (uint64_t)recordIdForEmailWithRowId:()Internal;
+ (uint64_t)recordIdForEventWithRowId:()Internal;
+ (uint64_t)recordIdWithTableId:()Internal rowId:;
- (uint64_t)rowId;
- (unint64_t)tableId;
@end

@implementation SGRecordId(Internal)

- (uint64_t)rowId
{
  return [a1 internalEntityId] & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)tableId
{
  return (unint64_t)[a1 internalEntityId] >> 56;
}

+ (uint64_t)recordIdForEventWithRowId:()Internal
{
  return [MEMORY[0x1E4F5DB20] recordIdWithTableId:0 rowId:a3];
}

+ (uint64_t)recordIdForContactDetailWithRowId:()Internal
{
  return [MEMORY[0x1E4F5DB20] recordIdWithTableId:0 rowId:a3];
}

+ (uint64_t)recordIdForContactWithRowId:()Internal
{
  return [MEMORY[0x1E4F5DB20] recordIdWithTableId:0 rowId:a3];
}

+ (uint64_t)recordIdForEmailWithRowId:()Internal
{
  return [MEMORY[0x1E4F5DB20] recordIdWithTableId:1 rowId:a3];
}

+ (uint64_t)recordIdWithTableId:()Internal rowId:
{
  v6 = (void *)MEMORY[0x1E4F5DB20];
  if (HIBYTE(a4))
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "int64_t makeInternalEntityId(SGTableId, int64_t)");
    [v8 handleFailureInFunction:v9 file:@"SGRecordId+Internal.m" lineNumber:22 description:@"rowId out of range"];
  }
  return [v6 recordIdWithInternalEntityId:a4 | (a3 << 56)];
}

@end