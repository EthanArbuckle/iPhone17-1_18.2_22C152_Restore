@interface AXLTHistogramCalculator
+ (id)histogramForAudioPCMBuffer:(id)a3;
+ (id)histogramForAudioQueueBuffer:(AudioQueueBuffer *)a3 packetCount:(int64_t)a4 channelsCount:(int64_t)a5 format:(unint64_t)a6;
+ (id)histogramForFloat32MonoBuffer:(float *)a3 samplesCount:(int64_t)a4;
+ (id)histogramForInt16MonoBuffer:(signed __int16 *)a3 samplesCount:(int64_t)a4;
@end

@implementation AXLTHistogramCalculator

+ (id)histogramForAudioPCMBuffer:(id)a3
{
  id v4 = a3;
  v5 = [v4 format];
  unsigned int v6 = [v5 channelCount];

  if (v6 <= 1
    && (unsigned int v7 = [v4 frameLength],
        [v4 format],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 commonFormat],
        v8,
        v9 == 1))
  {
    v10 = objc_msgSend(a1, "histogramForFloat32MonoBuffer:samplesCount:", *(void *)(objc_msgSend(v4, "audioBufferList") + 16), v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)histogramForAudioQueueBuffer:(AudioQueueBuffer *)a3 packetCount:(int64_t)a4 channelsCount:(int64_t)a5 format:(unint64_t)a6
{
  uint64_t v9 = 0;
  if (a5 <= 1 && a6 == 3)
  {
    uint64_t v9 = objc_msgSend(a1, "histogramForInt16MonoBuffer:samplesCount:", a3->mAudioData, a5 * a4, v6);
  }
  return v9;
}

+ (id)histogramForInt16MonoBuffer:(signed __int16 *)a3 samplesCount:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = objc_opt_new();
    v33 = objc_opt_new();
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int64_t v10 = a4 / 16;
    int64_t v11 = a4 / 16;
    do
    {
      if (a4 >= v11) {
        int64_t v12 = v11;
      }
      else {
        int64_t v12 = a4;
      }
      int64_t v13 = v9 * v10;
      if (++v9 * v10 >= a4) {
        int64_t v14 = a4;
      }
      else {
        int64_t v14 = v9 * v10;
      }
      if (v13 < v14)
      {
        unint64_t v15 = 0;
        unint64_t v16 = 0;
        unint64_t v17 = v12 + v7;
        do
        {
          int v18 = a3[v13];
          if (v18 < 0) {
            int v18 = -v18;
          }
          unsigned int v19 = (unsigned __int16)v18;
          if ((unsigned __int16)v18 < 0xAu) {
            LOWORD(v18) = 0;
          }
          if (v19 < 0xA) {
            ++v16;
          }
          v15 += (unsigned __int16)v18;
          ++v13;
        }
        while (v13 < v14);
        if (v16 <= v17 >> 1)
        {
          if (v17)
          {
            double v20 = (double)(uint64_t)(v15 / v17);
            if (v20 > (double)v8) {
              uint64_t v8 = (uint64_t)v20;
            }
            v21 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v33 addObject:v21];
          }
        }
        else
        {
          [v33 addObject:&unk_26EFE6DB0];
        }
      }
      v11 += v10;
      v7 -= v10;
    }
    while (v9 != 16);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v33;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 2000;
      if (v8 > 2000) {
        uint64_t v25 = v8;
      }
      double v26 = (double)v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * i) floatValue];
          double v30 = v29 * 0.9 / v26;
          if (v30 < 0.1) {
            double v30 = 0.1;
          }
          v31 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(v30, 1.0));
          [v6 addObject:v31];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v24);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

+ (id)histogramForFloat32MonoBuffer:(float *)a3 samplesCount:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int64_t v10 = a4 / 16;
    int64_t v11 = a4 / 16;
    double v12 = 0.0;
    do
    {
      if (a4 >= v11) {
        int64_t v13 = v11;
      }
      else {
        int64_t v13 = a4;
      }
      int64_t v14 = v9 * v10;
      int64_t v15 = ++v9 * v10;
      if (v9 * v10 >= a4) {
        int64_t v15 = a4;
      }
      if (v14 < v15)
      {
        unint64_t v16 = 0;
        uint64_t v17 = v13 + v8;
        double v18 = 0.0;
        do
        {
          double v19 = fabsf(a3[v14]);
          if (v19 < 0.001)
          {
            double v19 = 0.0;
            ++v16;
          }
          double v18 = v18 + v19;
          ++v14;
        }
        while (v14 < v15);
        if (v16 <= (unint64_t)v17 >> 1)
        {
          if (v17)
          {
            double v20 = v18 / (double)v17;
            if (v20 > v12) {
              double v12 = v20;
            }
            v21 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v7 addObject:v21];
          }
        }
        else
        {
          objc_msgSend(v7, "addObject:", &unk_26EFE6DB0, v18);
        }
      }
      v11 += v10;
      v8 -= v10;
    }
    while (v9 != 16);
    if (v12 >= 0.025) {
      double v22 = v12;
    }
    else {
      double v22 = 0.025;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v7;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "floatValue", (void)v32);
          double v29 = v28 * 0.9 / v22;
          if (v29 < 0.1) {
            double v29 = 0.1;
          }
          double v30 = objc_msgSend(NSNumber, "numberWithDouble:", fmin(v29, 1.0));
          [v6 addObject:v30];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v25);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

@end