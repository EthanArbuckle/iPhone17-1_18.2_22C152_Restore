@interface LayoutConstants
@end

@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, void *a2)
{
  v44[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v4 setRoundingBehavior:3];
  v43[0] = &unk_1F2A6A428;
  v43[1] = &unk_1F2A6A440;
  v44[0] = &unk_1F2A6A7A0;
  v44[1] = &unk_1F2A6A7B0;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  [v4 scaledValue:v5 withOverrides:7.0];
  uint64_t v7 = v6;

  [v4 scaledValue:0 withOverride:5.0 forSizeClass:5.25];
  uint64_t v9 = v8;
  [v4 scaledValue:1.0];
  uint64_t v11 = v10;
  [v4 scaledValue:2.5];
  uint64_t v13 = v12;
  [v4 scaledValue:1.5];
  _LayoutConstants___constants = v14;
  *(void *)algn_1EA6A5078 = v7;
  v41[0] = &unk_1F2A6A428;
  v41[1] = &unk_1F2A6A440;
  v42[0] = &unk_1F2A6A7C0;
  v42[1] = &unk_1F2A6A7D0;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  [v4 scaledValue:v15 withOverrides:33.0];
  qword_1EA6A5080 = v16;

  qword_1EA6A5088 = v11;
  unk_1EA6A5090 = v13;
  qword_1EA6A5098 = 0x4008000000000000;
  qword_1EA6A50A0 = v9;
  unk_1EA6A50A8 = xmmword_1D31B5FA0;
  unk_1EA6A50B8 = xmmword_1D31B5FB0;
  unk_1EA6A50C8 = xmmword_1D31B5FC0;
  qword_1EA6A50D8 = v7;
  v40[0] = &unk_1F2A6A7E0;
  v40[1] = &unk_1F2A6A470;
  v39[0] = &unk_1F2A6A458;
  v39[1] = &unk_1F2A6A440;
  v39[2] = &unk_1F2A6A488;
  v40[2] = &unk_1F2A6A7F0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  [v4 scaledValue:v17 withOverrides:63.0];
  qword_1EA6A50E0 = v18;

  qword_1EA6A50E8 = v11;
  unk_1EA6A50F0 = v13;
  qword_1EA6A50F8 = 0x4008000000000000;
  qword_1EA6A5100 = v9;
  unk_1EA6A5108 = xmmword_1D31B5FA0;
  unk_1EA6A5118 = xmmword_1D31B5FB0;
  unk_1EA6A5128 = xmmword_1D31B5FC0;
  qword_1EA6A5138 = 0x3FF8000000000000;
  CLKDialDiameterForDevice();
  double v20 = v19;

  *(double *)&qword_1EA6A5140 = v20 * 0.5;
  [v4 scaledValue:0.75];
  qword_1EA6A5148 = v21;
  [v4 scaledValue:2.0];
  qword_1EA6A5150 = v22;
  v37[0] = &unk_1F2A6A458;
  v37[1] = &unk_1F2A6A440;
  v38[0] = &unk_1F2A6A800;
  v38[1] = &unk_1F2A6A4A0;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v4 scaledValue:v23 withOverrides:13.0];
  qword_1EA6A5158 = v24;

  xmmword_1EA6A5160 = xmmword_1D31B5FA0;
  unk_1EA6A5170 = xmmword_1D31B5FD0;
  xmmword_1EA6A5180 = xmmword_1D31B5FE0;
  v35[0] = &unk_1F2A6A428;
  v35[1] = &unk_1F2A6A440;
  v36[0] = &unk_1F2A6A810;
  v36[1] = &unk_1F2A6A810;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v4 scaledValue:v25 withOverrides:1.5];
  qword_1EA6A5190 = v26;

  v33[0] = &unk_1F2A6A428;
  v33[1] = &unk_1F2A6A440;
  v34[0] = &unk_1F2A6A820;
  v34[1] = &unk_1F2A6A830;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v4 scaledValue:v27 withOverrides:22.25];
  qword_1EA6A5198 = v28;

  v31[0] = &unk_1F2A6A428;
  v31[1] = &unk_1F2A6A440;
  v32[0] = &unk_1F2A6A840;
  v32[1] = &unk_1F2A6A840;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v4 scaledValue:v29 withOverrides:1.75];
  qword_1EA6A51A0 = v30;
}

void ___LayoutConstants_block_invoke_0(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_1F2A6A518;
  v5[1] = &unk_1F2A6A530;
  v6[0] = &unk_1F2A6A8D0;
  v6[1] = &unk_1F2A6A8E0;
  v5[2] = &unk_1F2A6A548;
  v5[3] = &unk_1F2A6A560;
  v6[2] = &unk_1F2A6A8F0;
  v6[3] = &unk_1F2A6A900;
  v5[4] = &unk_1F2A6A578;
  v5[5] = &unk_1F2A6A590;
  v6[4] = &unk_1F2A6A8E0;
  v6[5] = &unk_1F2A6A8F0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  [v2 scaledValue:v3 withOverrides:22.0];
  _LayoutConstants__constants_0 = v4;

  _LayoutConstants__constants_1 = 0x3FF8000000000000;
  _LayoutConstants__constants_2 = 0x4012000000000000;
}

void ___LayoutConstants_block_invoke_1(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  uint64_t v6 = &unk_1F2A6A5A8;
  v7[0] = &unk_1F2A6A910;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 scaledValue:v3 withOverrides:30.0];
  _LayoutConstants_constants_0 = v4;

  [v2 setRoundingBehavior:1];
  [v2 scaledValue:1.0];
  _LayoutConstants_constants_1 = v5;
}

void ___LayoutConstants_block_invoke_2(uint64_t a1, void *a2)
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  v9[0] = &unk_1F2A6A5C0;
  v9[1] = &unk_1F2A6A5D8;
  v10[0] = &unk_1F2A6A920;
  v10[1] = &unk_1F2A6A930;
  v9[2] = &unk_1F2A6A5F0;
  v9[3] = &unk_1F2A6A608;
  v10[2] = &unk_1F2A6A940;
  v10[3] = &unk_1F2A6A950;
  v9[4] = &unk_1F2A6A620;
  v9[5] = &unk_1F2A6A638;
  v10[4] = &unk_1F2A6A960;
  v10[5] = &unk_1F2A6A970;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  [v4 scaledValue:v5 withOverrides:76.0];
  *(void *)&_LayoutConstants__constants = v6;

  CLKRoundForDevice();
  uint64_t v8 = v7;

  *((void *)&_LayoutConstants__constants + 1) = v8;
  xmmword_1EA6A5418 = xmmword_1D31B68E0;
  qword_1EA6A5428 = 0;
}

void ___LayoutConstants_block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v12 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:4.0 luxoRegular:5.0 aloeCompact:4.0 aloeRegular:5.0 agave:5.0 avoniaCompact:4.0 avoniaRegular:0x4014000000000000];
  *(void *)&_LayoutConstants__constants_0 = v2;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:1.5 luxoRegular:2.0 aloeCompact:1.5 aloeRegular:2.0 agave:2.0 avoniaCompact:1.5 avoniaRegular:0x4000000000000000];
  *((void *)&_LayoutConstants__constants_0 + 1) = v3;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:3.5 luxoRegular:4.0 aloeCompact:4.0 aloeRegular:4.5 agave:4.5 avoniaCompact:4.5 avoniaRegular:0x4014000000000000];
  qword_1EA6A5470 = v4;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:1.0 luxoRegular:1.5 aloeCompact:1.0 aloeRegular:1.5 agave:1.5 avoniaCompact:1.0 avoniaRegular:0x3FF8000000000000];
  qword_1EA6A5478 = v5;
  *(void *)&xmmword_1EA6A5480 = 0x3FF8000000000000;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:16.0 luxoRegular:18.0 aloeCompact:17.5 aloeRegular:19.5 agave:20.0 avoniaCompact:18.5 avoniaRegular:0x4033000000000000];
  *((void *)&xmmword_1EA6A5480 + 1) = v6;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:30.5 luxoRegular:34.5 aloeCompact:33.0 aloeRegular:37.5 agave:38.5 avoniaCompact:35.0 avoniaRegular:0x4043000000000000];
  qword_1EA6A5490 = v7;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:34.5 luxoRegular:39.5 aloeCompact:38.0 aloeRegular:43.0 agave:44.0 avoniaCompact:40.0 avoniaRegular:0x4046000000000000];
  qword_1EA6A5498 = v8;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:6.0 luxoRegular:6.5 aloeCompact:6.5 aloeRegular:7.0 agave:7.5 avoniaCompact:6.5 avoniaRegular:0x401C000000000000];
  *(void *)&xmmword_1EA6A54A0 = v9;
  *((void *)&xmmword_1EA6A54A0 + 1) = 0x3FF0000000000000;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:3.0 luxoRegular:4.0 aloeCompact:3.0 aloeRegular:4.0 agave:4.0 avoniaCompact:3.0 avoniaRegular:0x4010000000000000];
  qword_1EA6A54B0 = v10;
  [v12 valueCompact:0.0 regular:0.0 luxoCompact:1.0 luxoRegular:1.5 aloeCompact:1.0 aloeRegular:1.5 agave:1.5 avoniaCompact:1.0 avoniaRegular:0x3FF8000000000000];
  qword_1EA6A54B8 = v11;
  xmmword_1EA6A54C0 = xmmword_1D31B69F0;
  qword_1EA6A54D0 = 0x3FF8000000000000;
}

double ___LayoutConstants_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 sizeClass];
  [v2 screenScale];
  double v5 = v4;

  double v6 = 7.5;
  if (!v3) {
    double v6 = 6.5;
  }
  double result = v6 / v5;
  _LayoutConstants___constants_0 = *(void *)&result;
  _LayoutConstants___constants_1 = 0x4000000000000000;
  return result;
}

@end