@interface HMBCloudZoneRebuilderStatus
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
+ (id)keyStatusString:(int64_t)a3;
+ (id)rebuilderStateString:(unint64_t)a3;
- (HMBCloudZoneRebuilderStatus)initWithState:(unint64_t)a3 message:(id)a4;
- (NSString)message;
- (id)attributeDescriptions;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (int64_t)keyStatus;
- (unint64_t)rebuildState;
@end

@implementation HMBCloudZoneRebuilderStatus

- (void).cxx_destruct
{
}

- (unint64_t)rebuildState
{
  return self->_rebuildState;
}

- (NSString)message
{
  return self->_message;
}

- (int64_t)keyStatus
{
  return self->_keyStatus;
}

- (id)attributeDescriptions
{
  v3 = +[HMBCloudZoneRebuilderStatus rebuilderStateString:[(HMBCloudZoneRebuilderStatus *)self rebuildState]];
  v4 = +[HMBCloudZoneRebuilderStatus keyStatusString:[(HMBCloudZoneRebuilderStatus *)self keyStatus]];
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Key Status" value:v4];
  [v5 addObject:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F653F8]) initWithName:@"Rebuild State" value:v3];
  [v5 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMBCloudZoneRebuilderStatus *)self message];
  v10 = (void *)[v8 initWithName:@"Message" value:v9];
  [v5 addObject:v10];

  return v5;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"ZCRS.m";
  v6 = [(HMBCloudZoneRebuilderStatus *)self message];
  v11[1] = @"ZCRS.se";
  v12[0] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBCloudZoneRebuilderStatus rebuildState](self, "rebuildState"));
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v9 = [v8 hmbOPACKDataFromDictionaryWithError:a4];

  return v9;
}

- (HMBCloudZoneRebuilderStatus)initWithState:(unint64_t)a3 message:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBCloudZoneRebuilderStatus;
  v7 = [(HMBCloudZoneRebuilderStatus *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    message = v7->_message;
    v7->_message = (NSString *)v8;

    if (a3 <= 7) {
      v7->_keyStatus = qword_1D47238F0[a3];
    }
    v7->_rebuildState = a3;
  }

  return v7;
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  v5 = [MEMORY[0x1E4F1C9E8] hmbDictionaryFromOPACKData:a3 error:a5];
  id v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "hmf_stringForKey:", @"ZCRS.m");
    uint64_t v8 = objc_msgSend(v6, "hmf_numberForKey:", @"ZCRS.se");
    uint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [[HMBCloudZoneRebuilderStatus alloc] initWithState:v9 message:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)keyStatusString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<UNKNOWN %lu>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E69E9AA0[a3];
  }
  return v3;
}

+ (id)rebuilderStateString:(unint64_t)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<UNKNOWN %lu>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E69E9A60[a3];
  }
  return v3;
}

@end