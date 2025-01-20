@interface HMDCameraVideoParameterCombination
- (BOOL)isEqual:(id)a3;
- (HMDCameraVideoParameterCombination)initWithProfile:(id)a3 level:(id)a4 videoTier:(id)a5;
- (HMDCameraVideoTier)videoTier;
- (HMDH264Level)level;
- (HMDH264Profile)profile;
- (id)description;
@end

@implementation HMDCameraVideoParameterCombination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoTier, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

- (HMDCameraVideoTier)videoTier
{
  return self->_videoTier;
}

- (HMDH264Level)level
{
  return self->_level;
}

- (HMDH264Profile)profile
{
  return self->_profile;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDCameraVideoParameterCombination *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMDCameraVideoParameterCombination *)self profile];
      v7 = [(HMDCameraVideoParameterCombination *)v5 profile];
      if ([v6 isEqual:v7])
      {
        v8 = [(HMDCameraVideoParameterCombination *)self level];
        v9 = [(HMDCameraVideoParameterCombination *)v5 level];
        if ([v8 isEqual:v9])
        {
          v10 = [(HMDCameraVideoParameterCombination *)self videoTier];
          v11 = [(HMDCameraVideoParameterCombination *)v5 videoTier];
          char v12 = [v10 isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDCameraVideoParameterCombination *)self profile];
  v5 = [(HMDCameraVideoParameterCombination *)self level];
  v6 = [(HMDCameraVideoParameterCombination *)self videoTier];
  v7 = [v3 stringWithFormat:@"<profile = %@, level = %@, tier = %@>", v4, v5, v6];

  return v7;
}

- (HMDCameraVideoParameterCombination)initWithProfile:(id)a3 level:(id)a4 videoTier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraVideoParameterCombination;
  char v12 = [(HMDCameraVideoParameterCombination *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profile, a3);
    objc_storeStrong((id *)&v13->_level, a4);
    objc_storeStrong((id *)&v13->_videoTier, a5);
  }

  return v13;
}

@end