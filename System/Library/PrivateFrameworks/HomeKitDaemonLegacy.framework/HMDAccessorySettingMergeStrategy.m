@interface HMDAccessorySettingMergeStrategy
- (HMDAccessorySettingMergeStrategy)initWithMergeStrategy:(id)a3;
- (NSNumber)conflictValue;
- (int64_t)strategy;
@end

@implementation HMDAccessorySettingMergeStrategy

- (void).cxx_destruct
{
}

- (int64_t)strategy
{
  return self->_strategy;
}

- (NSNumber)conflictValue
{
  return self->_conflictValue;
}

- (HMDAccessorySettingMergeStrategy)initWithMergeStrategy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDAccessorySettingMergeStrategy;
  v5 = [(HMDAccessorySettingMergeStrategy *)&v15 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v7;

    if (v8)
    {
      v5->_strategy = 1;
      conflictValue = v5->_conflictValue;
      v5->_conflictValue = v8;
    }
    else
    {
      id v10 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      conflictValue = v11;

      if (HMFEqualObjects())
      {
        uint64_t v12 = 3;
      }
      else if (HMFEqualObjects())
      {
        uint64_t v12 = 4;
      }
      else
      {
        if (!HMFEqualObjects())
        {

          v13 = 0;
          goto LABEL_19;
        }
        uint64_t v12 = 2;
      }
      v5->_strategy = v12;
    }
  }
  v13 = v5;
LABEL_19:

  return v13;
}

@end