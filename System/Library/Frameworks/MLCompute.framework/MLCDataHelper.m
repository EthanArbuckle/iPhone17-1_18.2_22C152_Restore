@interface MLCDataHelper
+ (BOOL)convertFp16toFp32:(id)a1 fp16Values:(SEL)a2 fp32Values:(unint64_t)a3;
+ (BOOL)convertFp32toFp16:(unint64_t)a3 fp32Values:(const float *)a4 fp16Values:;
+ (BOOL)convertOIHWtoIOHW:(id)a3 sourceOIHW:(const void *)a4 resultIOHW:(void *)a5 inputFeatureChannelCount:(unint64_t)a6 outputFeatureChannelCount:(unint64_t)a7;
+ (BOOL)convertSourceHWIO:(const void *)a3 toResultOIHW:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9;
+ (BOOL)convertSourceHWOI:(const void *)a3 toResultOIHW:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9;
+ (BOOL)convertSourceOIHW:(const void *)a3 toResultHWIO:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9;
+ (BOOL)convertSourceOIHW:(const void *)a3 toResultHWOI:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9;
+ (id)createDataWithFloatValue:(float)a3 count:(unint64_t)a4;
+ (void)copySource:(const void *)a3 toTarget:(void *)a4 sourceOffset:(unint64_t)a5 targetOffset:(unint64_t)a6 sizeToCopy:(unint64_t)a7;
+ (void)fillData:(id)a3 withFloatValue:(float)a4;
@end

@implementation MLCDataHelper

+ (id)createDataWithFloatValue:(float)a3 count:(unint64_t)a4
{
  unint64_t v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x36545FCuLL);
  if (a4)
  {
    unint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      v7[v8] = a3;
      unint64_t v8 = v9++;
    }
    while (v8 < a4);
  }

  return +[MLCTensorData dataWithBytesNoCopy:v7 length:v6 freeWhenDone:1];
}

+ (void)fillData:(id)a3 withFloatValue:(float)a4
{
  id v8 = a3;
  v5 = (float *)[v8 bytes];
  unint64_t v6 = [v8 length];
  if (v6 >= 4)
  {
    unint64_t v7 = v6 >> 2;
    do
    {
      *v5++ = a4;
      --v7;
    }
    while (v7);
  }
}

+ (BOOL)convertFp16toFp32:(id)a1 fp16Values:(SEL)a2 fp32Values:(unint64_t)a3
{
  src.data = v3;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 2 * a3;
  v6.data = v4;
  v6.height = 1;
  v6.width = a3;
  v6.rowBytes = 4 * a3;
  return vImageConvert_Planar16FtoPlanarF(&src, &v6, 0) == 0;
}

+ (BOOL)convertFp32toFp16:(unint64_t)a3 fp32Values:(const float *)a4 fp16Values:
{
  src.data = (void *)a4;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 4 * a3;
  v6.data = v4;
  v6.height = 1;
  v6.width = a3;
  v6.rowBytes = 2 * a3;
  return vImageConvert_PlanarFtoPlanar16F(&src, &v6, 0) == 0;
}

+ (void)copySource:(const void *)a3 toTarget:(void *)a4 sourceOffset:(unint64_t)a5 targetOffset:(unint64_t)a6 sizeToCopy:(unint64_t)a7
{
}

+ (BOOL)convertOIHWtoIOHW:(id)a3 sourceOIHW:(const void *)a4 resultIOHW:(void *)a5 inputFeatureChannelCount:(unint64_t)a6 outputFeatureChannelCount:(unint64_t)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v13 = [v12 descriptor];
  v14 = [v13 shape];
  v15 = [v14 objectAtIndexedSubscript:1];
  uint64_t v16 = [v15 unsignedIntegerValue];

  unint64_t v45 = a7;
  unint64_t v40 = a7 * a6;
  uint64_t v41 = v16;
  v42 = v12;
  if (v16 == a7 * a6)
  {
    v17 = [v12 descriptor];
    v18 = [v17 shape];
    v19 = [v18 objectAtIndexedSubscript:3];
    uint64_t v20 = [v19 unsignedIntegerValue];

    v21 = [v12 descriptor];
    v22 = [v21 shape];
    v23 = [v22 objectAtIndexedSubscript:2];
    uint64_t v24 = [v23 unsignedIntegerValue];

    v25 = [v12 descriptor];
    uint64_t v26 = [v25 dataType];

    unint64_t v27 = +[MLCTensorDescriptor elementByteCount:v26];
    if (a6)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      v30 = 0;
      unint64_t v31 = v24 * v20 * v27;
      unint64_t v32 = v27 * v24 * v20;
      unint64_t v33 = v32 * a6;
      unint64_t v43 = v32 * v45;
      unint64_t v44 = a6;
      do
      {
        SEL aSelectora = v30;
        uint64_t v34 = v28;
        uint64_t v35 = v29;
        for (unint64_t i = v45; i; --i)
        {
          [a1 copySource:a4 toTarget:a5 sourceOffset:v35 targetOffset:v34 sizeToCopy:v31];
          v35 += v33;
          v34 += v31;
        }
        v30 = aSelectora + 1;
        v29 += v31;
        v28 += v43;
      }
      while (aSelectora + 1 != (SEL)v44);
    }
  }
  else
  {
    v37 = +[MLCLog framework];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v49 = v39;
      __int16 v50 = 2048;
      uint64_t v51 = v16;
      __int16 v52 = 2048;
      unint64_t v53 = a6;
      __int16 v54 = 2048;
      unint64_t v55 = a7;
      _os_log_error_impl(&dword_1DD0C9000, v37, OS_LOG_TYPE_ERROR, "%@: channel count of the weights=%lu does not match the multiplication of inputFeatureChannelCount=%lu and outputFeatureChannelCount=%lu", buf, 0x2Au);
    }
  }

  return v41 == v40;
}

+ (BOOL)convertSourceOIHW:(const void *)a3 toResultHWIO:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13 = +[MLCTensorDescriptor elementByteCount:a9];
  unint64_t v26 = a8;
  if (a8)
  {
    unint64_t v14 = v13;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v15 = 0;
    unint64_t v25 = v13 * a7 * a6 * a5;
    unint64_t v36 = v13 * a5;
    unint64_t v31 = v13 * a5 * a6;
    unint64_t v30 = v13 * a8;
    unint64_t v16 = v13 * a8 * a7;
    do
    {
      uint64_t v27 = v15;
      if (a7)
      {
        uint64_t v17 = 0;
        uint64_t v34 = v28;
        uint64_t v35 = v29;
        do
        {
          uint64_t v33 = v17;
          if (a6)
          {
            uint64_t v18 = 0;
            uint64_t v20 = v34;
            uint64_t v19 = v35;
            do
            {
              uint64_t v39 = v18;
              uint64_t v21 = v19;
              uint64_t v22 = v20;
              for (unint64_t i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v22, v21, v14, v25);
                v22 += v14;
                v21 += v16;
              }
              uint64_t v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          uint64_t v17 = v33 + 1;
          v34 += v31;
          v35 += v30;
        }
        while (v33 + 1 != a7);
      }
      uint64_t v15 = v27 + 1;
      v28 += v25;
      v29 += v14;
    }
    while (v27 + 1 != v26);
  }
  return 1;
}

+ (BOOL)convertSourceOIHW:(const void *)a3 toResultHWOI:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13 = +[MLCTensorDescriptor elementByteCount:a9];
  unint64_t v27 = a8;
  if (a8)
  {
    unint64_t v14 = v13;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v15 = 0;
    unint64_t v25 = v13 * a7 * a6 * a5;
    unint64_t v26 = v13 * a7;
    unint64_t v36 = v13 * a5;
    unint64_t v31 = v13 * a5 * a6;
    unint64_t v16 = v13 * a7 * a8;
    do
    {
      uint64_t v28 = v15;
      if (a7)
      {
        uint64_t v17 = 0;
        uint64_t v34 = v29;
        uint64_t v35 = v30;
        do
        {
          uint64_t v33 = v17;
          if (a6)
          {
            uint64_t v18 = 0;
            uint64_t v20 = v34;
            uint64_t v19 = v35;
            do
            {
              uint64_t v39 = v18;
              uint64_t v21 = v19;
              uint64_t v22 = v20;
              for (unint64_t i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v22, v21, v14, v25, v26);
                v22 += v14;
                v21 += v16;
              }
              uint64_t v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          uint64_t v17 = v33 + 1;
          v34 += v31;
          v35 += v14;
        }
        while (v33 + 1 != a7);
      }
      uint64_t v15 = v28 + 1;
      v29 += v25;
      v30 += v26;
    }
    while (v28 + 1 != v27);
  }
  return 1;
}

+ (BOOL)convertSourceHWIO:(const void *)a3 toResultOIHW:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13 = +[MLCTensorDescriptor elementByteCount:a9];
  unint64_t v26 = a8;
  if (a8)
  {
    unint64_t v14 = v13;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v15 = 0;
    unint64_t v25 = v13 * a7 * a6 * a5;
    unint64_t v36 = v13 * a5;
    unint64_t v31 = v13 * a5 * a6;
    unint64_t v30 = v13 * a8;
    unint64_t v16 = v13 * a8 * a7;
    do
    {
      uint64_t v27 = v15;
      if (a7)
      {
        uint64_t v17 = 0;
        uint64_t v34 = v28;
        uint64_t v35 = v29;
        do
        {
          uint64_t v33 = v17;
          if (a6)
          {
            uint64_t v18 = 0;
            uint64_t v20 = v34;
            uint64_t v19 = v35;
            do
            {
              uint64_t v39 = v18;
              uint64_t v21 = v19;
              uint64_t v22 = v20;
              for (unint64_t i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v21, v22, v14, v25);
                v22 += v14;
                v21 += v16;
              }
              uint64_t v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          uint64_t v17 = v33 + 1;
          v34 += v31;
          v35 += v30;
        }
        while (v33 + 1 != a7);
      }
      uint64_t v15 = v27 + 1;
      v28 += v25;
      v29 += v14;
    }
    while (v27 + 1 != v26);
  }
  return 1;
}

+ (BOOL)convertSourceHWOI:(const void *)a3 toResultOIHW:(void *)a4 width:(unint64_t)a5 height:(unint64_t)a6 inputFeatureChannelCount:(unint64_t)a7 outputFeatureChannelCount:(unint64_t)a8 dataType:(int)a9
{
  unint64_t v13 = +[MLCTensorDescriptor elementByteCount:a9];
  unint64_t v27 = a8;
  if (a8)
  {
    unint64_t v14 = v13;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v15 = 0;
    unint64_t v25 = v13 * a7 * a6 * a5;
    unint64_t v26 = v13 * a7;
    unint64_t v36 = v13 * a5;
    unint64_t v31 = v13 * a5 * a6;
    unint64_t v16 = v13 * a7 * a8;
    do
    {
      uint64_t v28 = v15;
      if (a7)
      {
        uint64_t v17 = 0;
        uint64_t v34 = v29;
        uint64_t v35 = v30;
        do
        {
          uint64_t v33 = v17;
          if (a6)
          {
            uint64_t v18 = 0;
            uint64_t v20 = v34;
            uint64_t v19 = v35;
            do
            {
              uint64_t v39 = v18;
              uint64_t v21 = v19;
              uint64_t v22 = v20;
              for (unint64_t i = a5; i; --i)
              {
                objc_msgSend(a1, "copySource:toTarget:sourceOffset:targetOffset:sizeToCopy:", a3, a4, v21, v22, v14, v25, v26);
                v22 += v14;
                v21 += v16;
              }
              uint64_t v18 = v39 + 1;
              v20 += v36;
              v19 += v16 * a5;
            }
            while (v39 + 1 != a6);
          }
          uint64_t v17 = v33 + 1;
          v34 += v31;
          v35 += v14;
        }
        while (v33 + 1 != a7);
      }
      uint64_t v15 = v28 + 1;
      v29 += v25;
      v30 += v26;
    }
    while (v28 + 1 != v27);
  }
  return 1;
}

@end