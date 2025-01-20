@interface CNRecentCallCountAndName
+ (id)instanceWithName:(id)a3 callCount:(unint64_t)a4;
- (NSString)speakableName;
- (unint64_t)callCount;
@end

@implementation CNRecentCallCountAndName

- (void).cxx_destruct
{
}

- (unint64_t)callCount
{
  return self->_callCount;
}

- (NSString)speakableName
{
  return self->_speakableName;
}

+ (id)instanceWithName:(id)a3 callCount:(unint64_t)a4
{
  v5 = (__CFString *)a3;
  v6 = objc_alloc_init(CNRecentCallCountAndName);
  v7 = v6;
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = &stru_1ED8AC728;
  }
  objc_storeStrong((id *)&v6->_speakableName, v8);

  v7->_callCount = a4;

  return v7;
}

@end