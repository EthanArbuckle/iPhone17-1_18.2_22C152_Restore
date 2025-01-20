@interface HFUserHandle
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HFUserHandle)init;
- (HFUserHandle)initWithType:(unint64_t)a3 userID:(id)a4;
- (NSString)description;
- (NSString)userID;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation HFUserHandle

- (HFUserHandle)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithType_userID_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUserHandle.m", 18, @"%s is unavailable; use %@ instead",
    "-[HFUserHandle init]",
    v5);

  return 0;
}

- (HFUserHandle)initWithType:(unint64_t)a3 userID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFUserHandle;
  v8 = [(HFUserHandle *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_userID, a4);
  }

  return v9;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFUserHandle type](self, "type"), @"type");
  v5 = [(HFUserHandle *)self userID];
  [v3 appendString:v5 withName:@"userID"];

  v6 = [v3 build];

  return (NSString *)v6;
}

+ (NAIdentity)na_identity
{
  if (qword_26AB2EDE8 != -1) {
    dispatch_once(&qword_26AB2EDE8, &__block_literal_global_33);
  }
  v2 = (void *)_MergedGlobals_225;
  return (NAIdentity *)v2;
}

void __27__HFUserHandle_na_identity__block_invoke()
{
  id v4 = [MEMORY[0x263F58198] builder];
  id v0 = (id)[v4 appendCharacteristic:&__block_literal_global_17_0];
  id v1 = (id)[v4 appendCharacteristic:&__block_literal_global_20_1];
  uint64_t v2 = [v4 build];
  v3 = (void *)_MergedGlobals_225;
  _MergedGlobals_225 = v2;
}

uint64_t __27__HFUserHandle_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 type];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __27__HFUserHandle_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 userID];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSString)userID
{
  return self->_userID;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end