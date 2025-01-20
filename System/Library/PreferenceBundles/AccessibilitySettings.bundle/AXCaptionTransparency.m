@interface AXCaptionTransparency
@end

@implementation AXCaptionTransparency

void __AXCaptionTransparency_block_invoke(id a1)
{
  v45[0] = @"name";
  v24 = AXFormatFloatWithPercentage();
  v46[0] = v24;
  v46[1] = &off_22A440;
  v45[1] = @"alpha";
  v45[2] = @"rgb";
  v46[2] = &off_22C170;
  v22 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  v47[0] = v22;
  v43[0] = @"name";
  v21 = AXFormatFloatWithPercentage();
  v44[0] = v21;
  v44[1] = &off_22C470;
  v43[1] = @"alpha";
  v43[2] = @"rgb";
  v44[2] = &off_22C188;
  v1 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
  v47[1] = v1;
  v41[0] = @"name";
  v2 = AXFormatFloatWithPercentage();
  v42[0] = v2;
  v42[1] = &off_22C480;
  v41[1] = @"alpha";
  v41[2] = @"rgb";
  v42[2] = &off_22C1A0;
  v3 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:3];
  v47[2] = v3;
  v39[0] = @"name";
  v4 = AXFormatFloatWithPercentage();
  v40[0] = v4;
  v40[1] = &off_22C490;
  v39[1] = @"alpha";
  v39[2] = @"rgb";
  v40[2] = &off_22C1B8;
  v5 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
  v47[3] = v5;
  v37[0] = @"name";
  v6 = AXFormatFloatWithPercentage();
  v38[0] = v6;
  v38[1] = &off_22A428;
  v37[1] = @"alpha";
  v37[2] = @"rgb";
  v38[2] = &off_22C1D0;
  v7 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
  v47[4] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v47 count:5];
  v9 = (void *)AXCaptionTransparency_BackgroundTransparency;
  AXCaptionTransparency_BackgroundTransparency = v8;

  v10 = (void *)AXCaptionTransparency_ForegroundTransparency;
  AXCaptionTransparency_ForegroundTransparency = (uint64_t)&off_22C230;

  v34[0] = @"name";
  v25 = AXFormatFloatWithPercentage();
  v35[0] = v25;
  v35[1] = &off_22C480;
  v34[1] = @"alpha";
  v34[2] = @"rgb";
  v35[2] = &off_22C248;
  v23 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  v36[0] = v23;
  v32[0] = @"name";
  v11 = AXFormatFloatWithPercentage();
  v33[0] = v11;
  v33[1] = &off_22A428;
  v32[1] = @"alpha";
  v32[2] = @"rgb";
  v33[2] = &off_22C260;
  v12 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  v36[1] = v12;
  v30[0] = @"name";
  v13 = AXFormatFloatWithPercentage();
  v31[0] = v13;
  v31[1] = &off_22C490;
  v30[1] = @"alpha";
  v30[2] = @"rgb";
  v31[2] = &off_22C278;
  v14 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  v36[2] = v14;
  v28[0] = @"name";
  v15 = AXFormatFloatWithPercentage();
  v29[0] = v15;
  v29[1] = &off_22C470;
  v28[1] = @"alpha";
  v28[2] = @"rgb";
  v29[2] = &off_22C290;
  v16 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  v36[3] = v16;
  v26[0] = @"name";
  v17 = AXFormatFloatWithPercentage();
  v27[0] = v17;
  v27[1] = &off_22A440;
  v26[1] = @"alpha";
  v26[2] = @"rgb";
  v27[2] = &off_22C2A8;
  v18 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  v36[4] = v18;
  uint64_t v19 = +[NSArray arrayWithObjects:v36 count:5];
  v20 = (void *)AXCaptionTransparency_WindowTransparency;
  AXCaptionTransparency_WindowTransparency = v19;
}

@end