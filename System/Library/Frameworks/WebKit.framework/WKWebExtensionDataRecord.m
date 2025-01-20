@interface WKWebExtensionDataRecord
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSArray)errors;
- (NSSet)containedDataTypes;
- (NSString)displayName;
- (NSString)uniqueIdentifier;
- (Object)_apiObject;
- (unint64_t)sizeInBytesOfTypes:(id)a3;
- (unint64_t)totalSizeInBytes;
- (void)_objc_initiateDealloc;
- (void)_webExtensionDataRecord;
- (void)dealloc;
@end

@implementation WKWebExtensionDataRecord

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F41813B0](a1);
  }
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    v3 = MEMORY[0x1E4F14428];
    v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  (**(void (***)(void))self->_webExtensionDataRecord.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionDataRecord;
  [(WKWebExtensionDataRecord *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WKWebExtensionDataRecord *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = WTF::dynamic_objc_cast<WKWebExtensionDataRecord>(v4);
    if (v6) {
      char v7 = WebKit::WebExtensionDataRecord::operator==((uint64_t)&self->_webExtensionDataRecord, (uint64_t)v6 + 8, v5);
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (NSString)displayName
{
  if (*(void *)&self->_webExtensionDataRecord.data.__lx[16]) {
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v2 = &stru_1EEA10550;
  }
  objc_super v3 = v2;

  return (NSString *)v3;
}

- (NSString)uniqueIdentifier
{
  if (*(void *)&self->_webExtensionDataRecord.data.__lx[24]) {
    v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v2 = &stru_1EEA10550;
  }
  objc_super v3 = v2;

  return (NSString *)v3;
}

- (NSSet)containedDataTypes
{
  char v2 = WebKit::WebExtensionDataRecord::types((WebKit::WebExtensionDataRecord *)&self->_webExtensionDataRecord);

  return (NSSet *)WebKit::toAPI(v2);
}

- (unint64_t)totalSizeInBytes
{
  return WebKit::WebExtensionDataRecord::totalSize((WebKit::WebExtensionDataRecord *)&self->_webExtensionDataRecord);
}

- (unint64_t)sizeInBytesOfTypes:(id)a3
{
  v4 = (WebKit *)a3;
  unsigned __int8 v6 = WebKit::toWebExtensionDataTypes(v4, v5);
  unint64_t v7 = WebKit::WebExtensionDataRecord::sizeOfTypes((uint64_t)&self->_webExtensionDataRecord, v6);

  return v7;
}

- (NSArray)errors
{
  return (NSArray *)WebKit::WebExtensionDataRecord::errors((id *)&self->_webExtensionDataRecord);
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionDataRecord;
}

- (void)_webExtensionDataRecord
{
  return &self->_webExtensionDataRecord;
}

@end