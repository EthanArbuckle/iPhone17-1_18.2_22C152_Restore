@interface BWNoiseReductionAndSharpeningParameters
- (BWNoiseReductionAndSharpeningParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4;
- (id)description;
- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4;
- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4 qSub:(BOOL)a5;
- (id)portType;
- (uint64_t)_noiseReductionAndSharpeningParametersForType:(int)a3 qSub:;
- (void)dealloc;
@end

@implementation BWNoiseReductionAndSharpeningParameters

- (BWNoiseReductionAndSharpeningParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4
{
  if (a3
    && a4
    && (uint64_t v6 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"NoiseReductionAndSharpeningParameters"), "objectForKeyedSubscript:", @"StillImage")) != 0)
  {
    v7 = (void *)v6;
    v10.receiver = self;
    v10.super_class = (Class)BWNoiseReductionAndSharpeningParameters;
    v8 = [(BWNoiseReductionAndSharpeningParameters *)&v10 init];
    if (v8)
    {
      v8->_portType = (NSString *)a3;
      v8->_noiseReductionAndSharpeningConfiguration = (NSDictionary *)v7;
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNoiseReductionAndSharpeningParameters;
  [(BWNoiseReductionAndSharpeningParameters *)&v3 dealloc];
}

- (id)portType
{
  return self->_portType;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@: %@", v4, self, BWPortTypeToDisplayString(self->_portType, v5), self->_noiseReductionAndSharpeningConfiguration];
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4 qSub:(BOOL)a5
{
  v32[5] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)-[BWNoiseReductionAndSharpeningParameters _noiseReductionAndSharpeningParametersForType:qSub:]((uint64_t)self, a3, a5);
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    return 0;
  }
  v7 = v6;
  v8 = (void *)[v6 objectForKeyedSubscript:@"ISPMultiBandNoiseReductionParameters"];
  int v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"MultiBandEnabled"), "BOOLValue");
  uint64_t v10 = *MEMORY[0x1E4F543B8];
  if (v9)
  {
    v32[0] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = *MEMORY[0x1E4F543C8];
    v31[0] = v10;
    v31[1] = v11;
    v32[1] = [v8 objectForKeyedSubscript:@"MultiBandEnabled"];
    v31[2] = *MEMORY[0x1E4F543A8];
    v32[2] = [v8 objectForKeyedSubscript:@"ChromaProcessingEnabled"];
    v31[3] = *MEMORY[0x1E4F543C0];
    v32[3] = nrasp_interpolateArrayOfValuesForGain((void *)[v8 objectForKeyedSubscript:@"LumaProcessingStrength"], a4);
    v31[4] = *MEMORY[0x1E4F543B0];
    v32[4] = nrasp_interpolateArrayOfValuesForGain((void *)[v8 objectForKeyedSubscript:@"ChromaProcessingStrength"], a4);
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = v32;
    v14 = v31;
    uint64_t v15 = 5;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F543C8];
    v29[0] = *MEMORY[0x1E4F543B8];
    v29[1] = v16;
    v30[0] = MEMORY[0x1E4F1CC38];
    v30[1] = MEMORY[0x1E4F1CC28];
    v29[2] = *MEMORY[0x1E4F543C0];
    v30[2] = nrasp_interpolateArrayOfValuesForGain((void *)[v8 objectForKeyedSubscript:@"LumaProcessingStrength"], a4);
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = v30;
    v14 = v29;
    uint64_t v15 = 3;
  }
  uint64_t v17 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
  if (!v17)
  {
    fig_log_get_emitter();
    goto LABEL_12;
  }
  if ([v7 objectForKeyedSubscript:@"LocalContrastEnhancementStrength"])
  {
    v27[0] = *MEMORY[0x1E4F543E0];
    v28[0] = nrasp_interpolateValueForGain((void *)[v7 objectForKeyedSubscript:@"RawNoiseFilterStrength"], a4);
    v27[1] = *MEMORY[0x1E4F543E8];
    v28[1] = nrasp_interpolateValueForGain((void *)[v7 objectForKeyedSubscript:@"SharpeningControl"], a4);
    v27[2] = *MEMORY[0x1E4F543D0];
    uint64_t v18 = nrasp_interpolateValueForGain((void *)[v7 objectForKeyedSubscript:@"LocalContrastEnhancementStrength"], a4);
    v27[3] = *MEMORY[0x1E4F543D8];
    v28[2] = v18;
    v28[3] = v17;
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = v28;
    v21 = v27;
    uint64_t v22 = 4;
  }
  else
  {
    v25[0] = *MEMORY[0x1E4F543E0];
    v26[0] = nrasp_interpolateValueForGain((void *)[v7 objectForKeyedSubscript:@"RawNoiseFilterStrength"], a4);
    v25[1] = *MEMORY[0x1E4F543E8];
    uint64_t v23 = nrasp_interpolateValueForGain((void *)[v7 objectForKeyedSubscript:@"SharpeningControl"], a4);
    v25[2] = *MEMORY[0x1E4F543D8];
    v26[1] = v23;
    v26[2] = v17;
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    v20 = v26;
    v21 = v25;
    uint64_t v22 = 3;
  }
  return (id)[v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
}

- (uint64_t)_noiseReductionAndSharpeningParametersForType:(int)a3 qSub:
{
  if (result)
  {
    uint64_t v3 = result;
    switch(a2)
    {
      case 0:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"SingleImageSingleBand";
        goto LABEL_27;
      case 1:
        uint64_t v4 = *(void **)(result + 16);
        if (!a3) {
          goto LABEL_26;
        }
        result = [v4 objectForKeyedSubscript:@"SingleImageMultiBandQSub"];
        if (result) {
          return result;
        }
        uint64_t v4 = *(void **)(v3 + 16);
LABEL_26:
        v5 = @"SingleImageMultiBand";
LABEL_27:
        result = [v4 objectForKeyedSubscript:v5];
        break;
      case 2:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"HDRParameters";
        goto LABEL_27;
      case 3:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"OISParameters";
        goto LABEL_27;
      case 4:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"SISParameters";
        goto LABEL_27;
      case 10:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"EVZeroOnlyUBParameters";
        goto LABEL_27;
      case 11:
        uint64_t v6 = *(void **)(result + 16);
        v7 = @"UBParameters";
        goto LABEL_19;
      case 12:
        v8 = *(void **)(result + 16);
        int v9 = @"UBParameters";
        goto LABEL_21;
      case 13:
        uint64_t v10 = *(void **)(result + 16);
        uint64_t v11 = @"UBParameters";
        goto LABEL_23;
      case 14:
        uint64_t v6 = *(void **)(result + 16);
        v7 = @"ToneMappedUBParameters";
        goto LABEL_19;
      case 15:
        v8 = *(void **)(result + 16);
        int v9 = @"ToneMappedUBParameters";
        goto LABEL_21;
      case 16:
        uint64_t v10 = *(void **)(result + 16);
        uint64_t v11 = @"ToneMappedUBParameters";
        goto LABEL_23;
      case 17:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"LowLightUBParameters";
        goto LABEL_27;
      case 20:
        uint64_t v6 = *(void **)(result + 16);
        v7 = @"DeepFusionParameters";
LABEL_19:
        uint64_t v4 = (void *)[v6 objectForKeyedSubscript:v7];
        v5 = @"EVZero";
        goto LABEL_27;
      case 21:
        v8 = *(void **)(result + 16);
        int v9 = @"DeepFusionParameters";
LABEL_21:
        uint64_t v4 = (void *)[v8 objectForKeyedSubscript:v9];
        v5 = @"EVMinus";
        goto LABEL_27;
      case 22:
        uint64_t v10 = *(void **)(result + 16);
        uint64_t v11 = @"DeepFusionParameters";
LABEL_23:
        uint64_t v4 = (void *)[v10 objectForKeyedSubscript:v11];
        v5 = @"Long";
        goto LABEL_27;
      case 30:
        uint64_t v4 = *(void **)(result + 16);
        v5 = @"LearnedNRParameters";
        goto LABEL_27;
      default:
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unknown noise reduction and sharpening type" userInfo:0]);
    }
  }
  return result;
}

- (id)noiseReductionAndSharpeningConfigurationForType:(int)a3 gain:(float)a4
{
  return -[BWNoiseReductionAndSharpeningParameters noiseReductionAndSharpeningConfigurationForType:gain:qSub:](self, "noiseReductionAndSharpeningConfigurationForType:gain:qSub:", *(void *)&a3, 0);
}

@end