@interface CSUDistanceUtils
+ (void)computeCosineDistanceFromBuffer:(id)a3 FromArray:(id)a4 distanceComputed:(float *)a5 error:(id *)a6;
+ (void)computeL1DistanceFromBuffer:(id)a3 FromArray:(id)a4 distanceComputed:(float *)a5 error:(id *)a6 withDistanceType:(int64_t)a7;
@end

@implementation CSUDistanceUtils

+ (void)computeCosineDistanceFromBuffer:(id)a3 FromArray:(id)a4 distanceComputed:(float *)a5 error:(id *)a6
{
  id v9 = a4;
  uint64_t v29 = 0;
  v30 = (float *)&v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v25 = 0;
  v26 = (float *)&v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v21 = 0;
  v22 = (float *)&v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_24C674B28;
  v14[3] = &unk_2652E7CC8;
  v19 = a6;
  v20 = a5;
  id v10 = v9;
  id v15 = v10;
  v16 = &v29;
  v17 = &v25;
  v18 = &v21;
  objc_msgSend_accessDataUsingBlock_(a3, v11, (uint64_t)v14, v12, v13);
  if (!a6 || !*a6) {
    *a5 = 1.0 - (float)(v30[6] / (float)(sqrtf(v26[6]) * sqrtf(v22[6])));
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

+ (void)computeL1DistanceFromBuffer:(id)a3 FromArray:(id)a4 distanceComputed:(float *)a5 error:(id *)a6 withDistanceType:(int64_t)a7
{
  id v11 = a4;
  uint64_t v33 = 0;
  v34 = (float *)&v33;
  uint64_t v35 = 0x2020000000;
  int v36 = -971227136;
  uint64_t v29 = 0;
  v30 = (float *)&v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_24C674E50;
  v17[3] = &unk_2652E7CF0;
  v19 = &v25;
  v22 = a6;
  uint64_t v23 = a5;
  id v12 = v11;
  id v18 = v12;
  v20 = &v29;
  uint64_t v21 = &v33;
  int64_t v24 = a7;
  objc_msgSend_accessDataUsingBlock_(a3, v13, (uint64_t)v17, v14, v15);
  if (!a6 || !*a6)
  {
    if (a7 == 1) {
      float v16 = v30[6] / ((double)(unint64_t)v26[3] + 0.0001);
    }
    else {
      float v16 = v34[6];
    }
    *a5 = v16;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

@end