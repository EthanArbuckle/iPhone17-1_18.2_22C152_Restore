@interface HMDSelectedStreamConfigurationWrite
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSelectedAudioParameters)audioParameters;
- (HMDSelectedStreamConfigurationWrite)initWithCoder:(id)a3;
- (HMDSelectedStreamConfigurationWrite)initWithSessionControl:(id)a3;
- (HMDSelectedStreamConfigurationWrite)initWithSessionControl:(id)a3 videoParameters:(id)a4 audioParameters:(id)a5;
- (HMDSelectedVideoParameters)videoParameters;
- (HMDSessionControl)sessionControl;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSelectedStreamConfigurationWrite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioParameters, 0);
  objc_storeStrong((id *)&self->_videoParameters, 0);
  objc_storeStrong((id *)&self->_sessionControl, 0);
}

- (HMDSelectedAudioParameters)audioParameters
{
  return self->_audioParameters;
}

- (HMDSelectedVideoParameters)videoParameters
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
  v5 = [(HMDSelectedStreamConfigurationWrite *)self sessionControl];
  [v4 encodeObject:v5 forKey:@"kSelectedStreamConfigurationWrite__SessionControl"];

  v6 = [(HMDSelectedStreamConfigurationWrite *)self videoParameters];
  [v4 encodeObject:v6 forKey:@"kSelectedStreamConfigurationWrite__SelectedVideoParameters"];

  id v7 = [(HMDSelectedStreamConfigurationWrite *)self audioParameters];
  [v4 encodeObject:v7 forKey:@"kSelectedStreamConfigurationWrite__SelectedAudioParameters"];
}

- (HMDSelectedStreamConfigurationWrite)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDSelectedStreamConfigurationWrite;
  v5 = [(HMDSelectedStreamConfigurationWrite *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSelectedStreamConfigurationWrite__SessionControl"];
    sessionControl = v5->_sessionControl;
    v5->_sessionControl = (HMDSessionControl *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kSelectedStreamConfigurationWrite__SelectedVideoParameters"];
    videoParameters = v5->_videoParameters;
    v5->_videoParameters = (HMDSelectedVideoParameters *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kSelectedStreamConfigurationWrite__SelectedAudioParameters"];
    audioParameters = v5->_audioParameters;
    v5->_audioParameters = (HMDSelectedAudioParameters *)v19;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDSelectedStreamConfigurationWrite *)self sessionControl];
  uint64_t v9 = [v8 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ sessionControl = %@ ", v6, v9];

  v10 = [(HMDSelectedStreamConfigurationWrite *)self videoParameters];
  v11 = [v10 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ videoParameters = %@ ", v6, v11];

  id v13 = [(HMDSelectedStreamConfigurationWrite *)self audioParameters];
  v12 = [v13 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ audioParameters = %@ ", v6, v12];
}

- (BOOL)_parseFromTLVData
{
  v39[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35990] wrappertlv:1 name:@"kSelectedStreamConfigurationWrite__SessionControl"];
  id v4 = [MEMORY[0x263F35990] wrappertlv:2 name:@"kSelectedStreamConfigurationWrite__SelectedVideoParameters"];
  v5 = [MEMORY[0x263F35990] wrappertlv:3 name:@"kSelectedStreamConfigurationWrite__SelectedAudioParameters"];
  v39[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
  v38[0] = v4;
  v38[1] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
  BOOL v8 = [(HAPTLVBase *)self _parseMandatory:v6 optional:v7];

  if (v8)
  {
    uint64_t v9 = [HMDSessionControl alloc];
    v10 = [v3 field];
    v11 = [(HAPTLVBase *)v9 initWithTLVData:v10];
    sessionControl = self->_sessionControl;
    self->_sessionControl = v11;

    BOOL v20 = checkForParseResult(1, v13, v14, v15, v16, v17, v18, v19, (uint64_t)self->_sessionControl, v37);
    if ([(HMDSessionControl *)self->_sessionControl controlCommand] == 1)
    {
      v21 = [HMDSelectedVideoParameters alloc];
      objc_super v22 = [v4 field];
      uint64_t v23 = [(HAPTLVBase *)v21 initWithTLVData:v22];
      videoParameters = self->_videoParameters;
      self->_videoParameters = v23;

      v25 = [HMDSelectedAudioParameters alloc];
      v26 = [v5 field];
      v27 = [(HAPTLVBase *)v25 initWithTLVData:v26];
      audioParameters = self->_audioParameters;
      self->_audioParameters = v27;

      if (v20) {
        LOBYTE(v20) = checkForParseResult(2, v29, v30, v31, v32, v33, v34, v35, (uint64_t)self->_videoParameters, (uint64_t)self->_audioParameters);
      }
    }
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = [(HMDSelectedStreamConfigurationWrite *)self sessionControl];
  v5 = [v4 tlvData];

  [v3 addTLV:1 data:v5];
  id v6 = [(HMDSelectedStreamConfigurationWrite *)self videoParameters];
  id v7 = [v6 tlvData];

  [v3 addTLV:2 data:v7];
  BOOL v8 = [(HMDSelectedStreamConfigurationWrite *)self audioParameters];
  uint64_t v9 = [v8 tlvData];

  [v3 addTLV:3 data:v9];
  v10 = [v3 serialize];

  return (NSData *)v10;
}

- (HMDSelectedStreamConfigurationWrite)initWithSessionControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSelectedStreamConfigurationWrite;
  id v6 = [(HMDSelectedStreamConfigurationWrite *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionControl, a3);
  }

  return v7;
}

- (HMDSelectedStreamConfigurationWrite)initWithSessionControl:(id)a3 videoParameters:(id)a4 audioParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSelectedStreamConfigurationWrite;
  v12 = [(HMDSelectedStreamConfigurationWrite *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionControl, a3);
    objc_storeStrong((id *)&v13->_videoParameters, a4);
    objc_storeStrong((id *)&v13->_audioParameters, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end