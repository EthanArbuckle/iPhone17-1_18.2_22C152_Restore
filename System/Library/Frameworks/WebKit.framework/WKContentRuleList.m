@interface WKContentRuleList
+ (BOOL)_supportsRegularExpression:(id)a3;
+ (id)_parseRuleList:(id)a3;
- (NSString)identifier;
- (Object)_apiObject;
- (void)dealloc;
@end

@implementation WKContentRuleList

- (Object)_apiObject
{
  return (Object *)&self->_contentRuleList;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ContentRuleList::~ContentRuleList((API::ContentRuleList *)&self->_contentRuleList);
    v4.receiver = self;
    v4.super_class = (Class)WKContentRuleList;
    [(WKContentRuleList *)&v4 dealloc];
  }
}

- (NSString)identifier
{
  if (*(void *)(*(void *)&self->_contentRuleList.data.__lx[16] + 16)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

+ (BOOL)_supportsRegularExpression:(id)a3
{
  MEMORY[0x19972EAD0](&v8, a3);
  BOOL v5 = API::ContentRuleList::supportsRegularExpression((API::ContentRuleList *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  return v5;
}

+ (id)_parseRuleList:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  MEMORY[0x19972EAD0](&v12, a3);
  unint64_t v4 = API::ContentRuleList::parseRuleList((API::ContentRuleList *)&v12, v3);
  int v6 = v4;
  *(void *)&v13.__val_ = v4;
  v13.__cat_ = v5;
  v7 = (WTF::StringImpl *)v12.__r_.__value_.__r.__words[0];
  v12.__r_.__value_.__r.__words[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, (WTF::StringImpl *)v5);
      if (v6) {
        goto LABEL_5;
      }
      return 0;
    }
    *(_DWORD *)v7 -= 2;
  }
  if (!v6) {
    return 0;
  }
LABEL_5:
  uint64_t v14 = *MEMORY[0x1E4F28458];
  v8 = NSString;
  std::error_code::message(&v12, &v13);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v9 = &v12;
  }
  else {
    v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  v15[0] = objc_msgSend(v8, "stringWithFormat:", @"Rule list parsing failed: %s", v9);
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:6 userInfo:v10];
}

@end