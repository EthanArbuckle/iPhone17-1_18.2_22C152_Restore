@interface IMDHandleRecord
+ (IMDHandleRecord)allocWithZone:(_NSZone *)a3;
+ (id)keyPathsToColumns;
- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3;
- (IMDHandleRecord)init;
- (NSString)canonicalizedURIString;
- (NSString)uncanonicalizedURIString;
- (_IMDHandleRecordStruct)cfHandleRecord;
- (__CFArray)_localCache;
- (int)_propertyIDForProperty:(int64_t)a3;
- (int64_t)rowID;
- (void)_fetchUpdatedRecord;
@end

@implementation IMDHandleRecord

+ (IMDHandleRecord)allocWithZone:(_NSZone *)a3
{
  IMDHandleRecordGetTypeID();
  return (IMDHandleRecord *)_CFRuntimeCreateInstance();
}

- (_IMDHandleRecordStruct)cfHandleRecord
{
  CFTypeID v3 = CFGetTypeID(self);
  if (v3 == IMDHandleRecordGetTypeID()) {
    return (_IMDHandleRecordStruct *)self;
  }
  else {
    return 0;
  }
}

- (void)_fetchUpdatedRecord
{
  uint64_t v2 = [(IMDHandleRecord *)self rowID];
  return (void *)IMDHandleRecordCopyHandleRecordUnlocked(v2);
}

- (__CFArray)_localCache
{
  return (__CFArray *)[(IMDHandleRecord *)self cfHandleRecord][24];
}

- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3
{
  v4 = &(&off_1E5F907C0)[5 * a4];
  long long v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1AFB9C2F0(a3);
}

- (int64_t)rowID
{
  return (uint64_t)[(IMDHandleRecord *)self cfHandleRecord][16];
}

- (NSString)canonicalizedURIString
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 0);
  return (NSString *)v2;
}

- (NSString)uncanonicalizedURIString
{
  return (NSString *)MEMORY[0x1F4181798](self, sel_uncanonicalizedID);
}

- (IMDHandleRecord)init
{
  return 0;
}

+ (id)keyPathsToColumns
{
  if (qword_1EB5ABA38 != -1) {
    dispatch_once(&qword_1EB5ABA38, &unk_1F084CC80);
  }
  uint64_t v2 = (void *)qword_1EB5ABA18;
  return v2;
}

@end