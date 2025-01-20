@interface DEDialogState
- (DEDialogState)initWithCatId:(id)a3;
- (DialogStateFamily)getFamily;
- (DialogStateUseCase)getUseCase;
- (NSString)catId;
- (void)setCatId:(id)a3;
@end

@implementation DEDialogState

- (void).cxx_destruct
{
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (DialogStateFamily)getFamily
{
  catId = self->_catId;
  if (!catId)
  {
    uint64_t v9 = 0;
    double v11 = 0.0;
    goto LABEL_13;
  }
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)[(NSString *)catId UTF8String]);
  siri::dialogengine::GetFamilyIdFromCatId((unsigned __int8 *)v16, (uint64_t)__p);
  unint64_t v3 = v15;
  if ((v15 & 0x80u) != 0) {
    unint64_t v3 = (unint64_t)__p[1];
  }
  if (v3)
  {
    v4 = +[DEBundle frameworkUserSettings];
    if ((v15 & 0x80u) == 0) {
      v5 = __p;
    }
    else {
      v5 = (void **)__p[0];
    }
    v6 = [NSString stringWithUTF8String:v5];
    v7 = [v4 dictionaryForKey:v6];
    uint64_t v9 = siri::dialogengine::DialogStateFamilyFromNSDictionary(v7, v8);
    double v11 = v10;

    if ((v15 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  double v11 = 0.0;
  if ((v15 & 0x80) != 0) {
LABEL_9:
  }
    operator delete(__p[0]);
LABEL_10:
  if (v17 < 0) {
    operator delete(v16[0]);
  }
LABEL_13:
  unint64_t v12 = v9;
  double v13 = v11;
  result.var0.var1 = v13;
  result.var0.var0 = v12;
  return result;
}

- (DialogStateUseCase)getUseCase
{
  if (*(void *)&self->var0.var1)
  {
    v4 = self;
    id v6 = +[DEBundle frameworkUserSettings];
    v5 = [v6 dictionaryForKey:*(void *)&v4->var0.var1];
    siri::dialogengine::DialogStateUseCaseFromNSDictionary(v5, retstr);
  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var0.var1 = 0.0;
    retstr->var1.var0.var1.var0.var0 = 0;
    retstr->var1.var0.var0 = &retstr->var1.var0.var1;
    retstr->var2.var0.var1.var0.var0 = 0;
    retstr->var1.var0.var2.var0 = 0;
    retstr->var2.var0.var0 = &retstr->var2.var0.var1;
    retstr->var3.var0.var2.var0 = 0;
    retstr->var3.var0.var1.var0.var0 = 0;
    retstr->var2.var0.var2.var0 = 0;
    retstr->var3.var0.var0 = &retstr->var3.var0.var1;
  }
  return self;
}

- (DEDialogState)initWithCatId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDialogState;
  v5 = [(DEDialogState *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(DEDialogState *)v5 setCatId:v4];
  }

  return v6;
}

@end