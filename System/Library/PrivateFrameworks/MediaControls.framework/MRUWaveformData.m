@interface MRUWaveformData
+ (id)zero;
+ (int)amplitudeCount;
- (MRUWaveformData)initWithAmplitudes:(id)a3;
- (MRUWaveformData)initWithFFTSamples:(float *)a3 count:(int)a4 sampleRate:(float)a5 settings:(id)a6;
- (NSArray)amplitudes;
- (float)maxAbsoluteDifferenceFrom:(id)a3;
- (void)setAmplitudes:(id)a3;
@end

@implementation MRUWaveformData

+ (id)zero
{
  if (zero_onceToken != -1) {
    dispatch_once(&zero_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)__MRUWaveformDataZero;

  return v2;
}

void __23__MRUWaveformData_zero__block_invoke()
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (+[MRUWaveformData amplitudeCount] >= 1)
  {
    int v0 = 0;
    do
    {
      [v3 addObject:&unk_1F069F158];
      ++v0;
    }
    while (v0 < +[MRUWaveformData amplitudeCount]);
  }
  v1 = [[MRUWaveformData alloc] initWithAmplitudes:v3];
  v2 = (void *)__MRUWaveformDataZero;
  __MRUWaveformDataZero = (uint64_t)v1;
}

+ (int)amplitudeCount
{
  return 6;
}

- (MRUWaveformData)initWithAmplitudes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRUWaveformData;
  v5 = [(MRUWaveformData *)&v8 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];
    [(MRUWaveformData *)v5 setAmplitudes:v6];
  }
  return v5;
}

- (float)maxAbsoluteDifferenceFrom:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (+[MRUWaveformData amplitudeCount] < 1)
    {
      float v6 = 0.0;
    }
    else
    {
      uint64_t v5 = 0;
      float v6 = 0.0;
      do
      {
        v7 = [(MRUWaveformData *)self amplitudes];
        objc_super v8 = [v7 objectAtIndexedSubscript:v5];
        [v8 floatValue];
        float v10 = v9;
        v11 = [v4 amplitudes];
        v12 = [v11 objectAtIndexedSubscript:v5];
        [v12 floatValue];
        float v14 = vabds_f32(v10, v13);

        if (v6 < v14) {
          float v6 = v14;
        }
        ++v5;
      }
      while (v5 < +[MRUWaveformData amplitudeCount]);
    }
  }
  else
  {
    float v6 = 1.0;
  }

  return v6;
}

- (MRUWaveformData)initWithFFTSamples:(float *)a3 count:(int)a4 sampleRate:(float)a5 settings:(id)a6
{
  id v9 = a6;
  int v10 = +[MRUWaveformData amplitudeCount];
  v11 = [v9 stops];
  int v60 = v10;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  float v13 = (float *)malloc_type_calloc(+[MRUWaveformData amplitudeCount], 4uLL, 0x100004052888210uLL);
  v61 = v12;
  if (a4 >= 1)
  {
    uint64_t v14 = 0;
    int v15 = 0;
    float v16 = a5 / (float)(2 * a4);
    uint64_t v17 = a4;
    do
    {
      if ([v11 count] - 1 == v15) {
        break;
      }
      unint64_t v18 = v15;
      float v19 = v16 * (float)(int)v14;
      v20 = [v11 objectAtIndexedSubscript:v15];
      [v20 floatValue];
      float v22 = v21;

      v23 = [v11 objectAtIndexedSubscript:v15 + 1];
      [v23 floatValue];
      float v25 = v24;

      if (v19 < v22 || v19 > v25)
      {
        if ([v11 count] - 2 > (unint64_t)v15 && v19 >= v25)
        {
          do
          {
            unint64_t v27 = v18++;
            int v15 = v18;
            v28 = [v11 objectAtIndexedSubscript:v18];
            [v28 floatValue];

            v29 = [v11 objectAtIndexedSubscript:v27 + 2];
            [v29 floatValue];
            float v31 = v30;
          }
          while ([v11 count] - 2 > v18 && v19 >= v31);
        }
        if ([v11 count] <= v18) {
          goto LABEL_16;
        }
        float v32 = v13[v18] + (float)((float)(1.0 / (float)(v25 - v22)) * a3[v14]);
      }
      else
      {
        float v32 = a3[v14] + v13[v15];
      }
      v13[v18] = v32;
LABEL_16:
      v12 = v61;
      ++v14;
    }
    while (v14 != v17);
  }
  if (v60 >= 1)
  {
    for (uint64_t i = 0; i != v60; ++i)
    {
      float v34 = v13[i];
      [v9 amplitudeGain];
      long double v36 = (float)(v34 * v35);
      [v9 exponentialGain];
      float v38 = pow(v36, v37);
      v13[i] = v38;
      [v9 frequencyExponent];
      *(float *)&long double v36 = (float)((float)((float)(int)i * v39) + 1.0) * v13[i];
      v40 = [v9 adjustmentCoefficients];
      v41 = [v40 objectAtIndexedSubscript:0];
      [v41 floatValue];
      double v43 = v42;
      v44 = [v40 objectAtIndexedSubscript:1];
      [v44 floatValue];
      long double v46 = *(float *)&v36;
      long double v47 = v43 + v45 * v46;
      v48 = [v40 objectAtIndexedSubscript:2];
      [v48 floatValue];
      long double v50 = v47 + v49 * (v46 * v46);
      v51 = [v40 objectAtIndexedSubscript:3];
      [v51 floatValue];
      long double v53 = v50 + v52 * pow(v46, 3.0);
      v54 = [v40 objectAtIndexedSubscript:4];
      [v54 floatValue];
      *(float *)&long double v46 = v53 + v55 * pow(v46, 4.0);

      v12 = v61;
      v13[i] = fmaxf(fminf(v13[i] * *(float *)&v46, 1.0), 0.0);
      v56 = objc_msgSend(NSNumber, "numberWithFloat:");
      [v61 setObject:v56 atIndexedSubscript:i];
    }
  }
  free(v13);
  v57 = (void *)[v12 copy];
  [(MRUWaveformData *)self setAmplitudes:v57];

  return self;
}

- (NSArray)amplitudes
{
  return self->_amplitudes;
}

- (void)setAmplitudes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end