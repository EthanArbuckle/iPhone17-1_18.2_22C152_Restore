@interface IMDChatRecord
+ (IMDChatRecord)allocWithZone:(_NSZone *)a3;
+ (id)keyPathsToColumns;
- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3;
- (IMDChatRecord)init;
- (IMDChatRecord)initWithRecordRef:(_IMDChatRecordStruct *)a3;
- (IMDMessageRecord)lastMessageRecord;
- (NSArray)handleRecords;
- (NSDictionary)properties;
- (NSString)cloudKitRecordID;
- (NSString)cloudRecordID;
- (NSString)cloudServerChangeToken;
- (NSString)lastAddressedSIMID;
- (_IMDChatRecordStruct)cfChatRecord;
- (__CFArray)_localCache;
- (int)_propertyIDForProperty:(int64_t)a3;
- (int64_t)cloudSyncState;
- (int64_t)rowID;
- (void)_fetchUpdatedRecord;
@end

@implementation IMDChatRecord

+ (id)keyPathsToColumns
{
  if (qword_1EB5ABA40 != -1) {
    dispatch_once(&qword_1EB5ABA40, &unk_1F084CCE0);
  }
  v2 = (void *)qword_1EB5ABA20;
  return v2;
}

- (IMDChatRecord)initWithRecordRef:(_IMDChatRecordStruct *)a3
{
  v4 = a3;

  return (IMDChatRecord *)v4;
}

+ (IMDChatRecord)allocWithZone:(_NSZone *)a3
{
  IMDChatRecordGetTypeID();
  return (IMDChatRecord *)_CFRuntimeCreateInstance();
}

- (_IMDChatRecordStruct)cfChatRecord
{
  CFTypeID v3 = CFGetTypeID(self);
  if (v3 == IMDChatRecordGetTypeID()) {
    return (_IMDChatRecordStruct *)self;
  }
  else {
    return 0;
  }
}

- (void)_fetchUpdatedRecord
{
  uint64_t v2 = [(IMDChatRecord *)self rowID];
  return (void *)IMDChatRecordCopyChatRecordUnlocked(v2);
}

- (__CFArray)_localCache
{
  return (__CFArray *)[(IMDChatRecord *)self cfChatRecord][24];
}

- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3
{
  v4 = &(&off_1E5F92318)[5 * a4];
  long long v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1AFBCDACC(a3);
}

- (int64_t)rowID
{
  return (uint64_t)[(IMDChatRecord *)self cfChatRecord][16];
}

- (NSDictionary)properties
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 4);
  if (v2)
  {
    CFTypeID v3 = JWDecodeDictionary();
  }
  else
  {
    CFTypeID v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSString)lastAddressedSIMID
{
  return (NSString *)MEMORY[0x1F4181798](self, sel_lastAddressedSimID);
}

- (int64_t)cloudSyncState
{
  return MEMORY[0x1F4181798](self, sel_ckSyncState);
}

- (NSString)cloudServerChangeToken
{
  return (NSString *)MEMORY[0x1F4181798](self, sel_serverChangeToken);
}

- (NSString)cloudKitRecordID
{
  return (NSString *)MEMORY[0x1F4181798](self, sel_cloudkitRecordID);
}

- (NSString)cloudRecordID
{
  return (NSString *)MEMORY[0x1F4181798](self, sel_cloudkitRecordID);
}

- (IMDMessageRecord)lastMessageRecord
{
  Message = (void *)IMDChatRecordCopyLastMessage((uint64_t)[(IMDChatRecord *)self cfChatRecord]);
  return (IMDMessageRecord *)Message;
}

- (NSArray)handleRecords
{
  uint64_t v2 = IMDChatRecordCopyHandles((void *)[(IMDChatRecord *)self cfChatRecord]);
  return (NSArray *)v2;
}

- (IMDChatRecord)init
{
  return 0;
}

@end