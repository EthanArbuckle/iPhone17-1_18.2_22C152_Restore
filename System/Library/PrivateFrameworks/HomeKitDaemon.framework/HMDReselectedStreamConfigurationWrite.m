@interface HMDReselectedStreamConfigurationWrite
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDReselectedStreamConfigurationWrite)initWithCoder:(id)a3;
- (HMDReselectedStreamConfigurationWrite)initWithSessionControl:(id)a3;
- (HMDReselectedStreamConfigurationWrite)initWithSessionControl:(id)a3 videoParameters:(id)a4;
- (HMDReselectedVideoParameters)videoParameters;
- (HMDSessionControl)sessionControl;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDReselectedStreamConfigurationWrite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoParameters, 0);
  objc_storeStrong((id *)&self->_sessionControl, 0);
}

- (HMDReselectedVideoParameters)videoParameters
{
  return self->_videoParameters;
}

- (HMDSessionControl)sessionControl
{
  return self->_sessionControl;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDReselectedStreamConfigurationWrite *)self sessionControl];
  [v4 encodeObject:v5 forKey:@"kSelectedStreamConfigurationWrite__SessionControl"];

  id v6 = [(HMDReselectedStreamConfigurationWrite *)self videoParameters];
  [v4 encodeObject:v6 forKey:@"kSelectedStreamConfigurationWrite__SelectedVideoParameters"];
}

- (HMDReselectedStreamConfigurationWrite)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDReselectedStreamConfigurationWrite;
  v5 = [(HMDReselectedStreamConfigurationWrite *)&v17 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSelectedStreamConfigurationWrite__SessionControl"];
    sessionControl = v5->_sessionControl;
    v5->_sessionControl = (HMDSessionControl *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kSelectedStreamConfigurationWrite__SelectedVideoParameters"];
    videoParameters = v5->_videoParameters;
    v5->_videoParameters = (HMDReselectedVideoParameters *)v14;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDReselectedStreamConfigurationWrite *)self sessionControl];
  uint64_t v9 = [v8 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ sessionControl = %@ ", v6, v9];

  id v11 = [(HMDReselectedStreamConfigurationWrite *)self videoParameters];
  v10 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ videoParameters = %@ ", v6, v10];
}

- (BOOL)_parseFromTLVData
{
  v26[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35990] wrappertlv:1 name:@"kSelectedStreamConfigurationWrite__SessionControl"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:2 name:@"kSelectedStreamConfigurationWrite__SelectedVideoParameters"];
  v26[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  v25 = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  BOOL v7 = [(HAPTLVBase *)self _parseMandatory:v5 optional:v6];

  if (v7)
  {
    v8 = [HMDSessionControl alloc];
    uint64_t v9 = [v3 field];
    v10 = [(HAPTLVBase *)v8 initWithTLVData:v9];
    sessionControl = self->_sessionControl;
    self->_sessionControl = v10;

    v12 = [HMDReselectedVideoParameters alloc];
    v13 = [v4 field];
    uint64_t v14 = [(HAPTLVBase *)v12 initWithTLVData:v13];
    videoParameters = self->_videoParameters;
    self->_videoParameters = v14;

    BOOL v23 = checkForParseResult(2, v16, v17, v18, v19, v20, v21, v22, (uint64_t)self->_sessionControl, (uint64_t)self->_videoParameters);
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = [(HMDReselectedStreamConfigurationWrite *)self sessionControl];
  v5 = [v4 tlvData];

  [v3 addTLV:1 data:v5];
  id v6 = [(HMDReselectedStreamConfigurationWrite *)self videoParameters];
  BOOL v7 = [v6 tlvData];

  [v3 addTLV:2 data:v7];
  v8 = [v3 serialize];

  return (NSData *)v8;
}

- (HMDReselectedStreamConfigurationWrite)initWithSessionControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDReselectedStreamConfigurationWrite;
  id v6 = [(HMDReselectedStreamConfigurationWrite *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionControl, a3);
  }

  return v7;
}

- (HMDReselectedStreamConfigurationWrite)initWithSessionControl:(id)a3 videoParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDReselectedStreamConfigurationWrite;
  objc_super v9 = [(HMDReselectedStreamConfigurationWrite *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionControl, a3);
    objc_storeStrong((id *)&v10->_videoParameters, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end