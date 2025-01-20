@interface HMIFeedbackClipMetadataGenerator
+ (id)metadataForCameraProfile:(id)a3;
+ (id)metadataForClip:(id)a3;
+ (id)metadataForClip:(id)a3 withCameraProfile:(id)a4 inHome:(id)a5;
+ (id)metadataForHome:(id)a3;
@end

@implementation HMIFeedbackClipMetadataGenerator

+ (id)metadataForCameraProfile:(id)a3
{
  v64[13] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 settingsControl];
  v5 = [v4 nightVision];
  v6 = [v4 currentHorizontalTilt];
  v7 = [v4 currentVerticalTilt];
  v8 = [v4 opticalZoom];
  v9 = [v4 digitalZoom];
  v10 = [v4 imageRotation];
  v55 = v4;
  v11 = [v4 imageMirroring];
  v12 = [v3 accessory];

  if (v12)
  {
    v57 = [v12 name];
    v59 = [v12 uniqueIdentifier];
    v62 = [v12 model];
    v61 = [v12 manufacturer];
    v58 = [v12 firmwareVersion];
    v13 = [v12 room];
    v14 = v13;
    if (v13)
    {
      v60 = [v13 name];
    }
    else
    {
      v60 = 0;
    }

    v63[0] = @"cameraName";
    if (v57)
    {
      int v48 = 0;
      uint64_t v15 = (uint64_t)v57;
      goto LABEL_9;
    }
  }
  else
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    v61 = 0;
    v62 = 0;
    v63[0] = @"cameraName";
  }
  uint64_t v15 = [MEMORY[0x263EFF9D0] null];
  v57 = 0;
  int v48 = 1;
LABEL_9:
  v43 = (void *)v15;
  v64[0] = v15;
  v63[1] = @"cameraUUID";
  uint64_t v16 = [v59 UUIDString];
  v47 = (void *)v16;
  if (!v16)
  {
    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
  }
  v42 = (void *)v16;
  v64[1] = v16;
  v63[2] = @"roomName";
  uint64_t v17 = (uint64_t)v60;
  if (!v60)
  {
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
  }
  v41 = (void *)v17;
  v64[2] = v17;
  v63[3] = @"nightVision";
  uint64_t v18 = [v5 value];
  v56 = (void *)v18;
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x263EFF9D0] null];
  }
  v49 = v12;
  v40 = (void *)v18;
  v64[3] = v18;
  v63[4] = @"currentHorizontalTilt";
  uint64_t v19 = [v6 value];
  v46 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  }
  v54 = v6;
  v39 = (void *)v19;
  v64[4] = v19;
  v63[5] = @"currentVerticalTilt";
  uint64_t v20 = [v7 value];
  v21 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
  }
  v38 = (void *)v20;
  v64[5] = v20;
  v63[6] = @"opticalZoom";
  v52 = v8;
  uint64_t v22 = [v8 value];
  v23 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x263EFF9D0] null];
  }
  v53 = v7;
  v37 = (void *)v22;
  v64[6] = v22;
  v63[7] = @"digitalZoom";
  uint64_t v24 = [v9 value];
  v25 = (void *)v24;
  if (!v24)
  {
    uint64_t v24 = [MEMORY[0x263EFF9D0] null];
  }
  v45 = v21;
  v36 = (void *)v24;
  v64[7] = v24;
  v63[8] = @"imageRotation";
  uint64_t v26 = [v10 value];
  v27 = (void *)v26;
  if (!v26)
  {
    uint64_t v26 = [MEMORY[0x263EFF9D0] null];
  }
  v35 = (void *)v26;
  v64[8] = v26;
  v63[9] = @"imageMirroring";
  v50 = v11;
  v28 = [v11 value];
  v29 = v28;
  if (!v28)
  {
    v29 = [MEMORY[0x263EFF9D0] null];
  }
  v51 = v5;
  v64[9] = v29;
  v63[10] = @"model";
  v30 = v62;
  if (!v62)
  {
    v30 = [MEMORY[0x263EFF9D0] null];
  }
  v64[10] = v30;
  v63[11] = @"manufacturer";
  v31 = v61;
  if (!v61)
  {
    v31 = [MEMORY[0x263EFF9D0] null];
  }
  v64[11] = v31;
  v63[12] = @"firmwareVersion";
  v32 = v58;
  if (!v58)
  {
    v32 = [MEMORY[0x263EFF9D0] null];
  }
  v64[12] = v32;
  id v44 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:13];
  if (!v58) {

  }
  if (!v61) {
  if (!v62)
  }

  if (!v28) {
  if (!v27)
  }

  if (!v25) {
  if (!v23)
  }

  if (!v45) {
  if (!v46)
  }

  v33 = v56;
  if (!v56)
  {

    v33 = 0;
  }

  if (v60)
  {
    if (v47) {
      goto LABEL_55;
    }
  }
  else
  {

    if (v47) {
      goto LABEL_55;
    }
  }

LABEL_55:
  if (v48) {

  }
  return v44;
}

+ (id)metadataForClip:(id)a3
{
  v18[5] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 significantEvents];
  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_16);

  v17[0] = @"clipUUID";
  v6 = [v3 uniqueIdentifier];
  v7 = [v6 UUIDString];
  v18[0] = v7;
  v17[1] = @"startDate";
  v8 = [v3 startDate];
  v9 = HMIConvertNSDateToIsoDateString(v8);
  v18[1] = v9;
  v17[2] = @"duration";
  v10 = NSNumber;
  [v3 duration];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v12 = HMIJSONDecimalNumberForNumber(v11, 2);
  v18[2] = v12;
  v17[3] = @"quality";
  [v3 quality];

  v13 = HMStringFromCameraClipQuality();
  v18[3] = v13;
  v17[4] = @"significantEvents";
  v14 = [v5 allObjects];
  v18[4] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  return v15;
}

id __52__HMIFeedbackClipMetadataGenerator_metadataForClip___block_invoke(uint64_t a1, void *a2)
{
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"timeOffsetWithinClip";
  v2 = NSNumber;
  id v3 = a2;
  [v3 timeOffsetWithinClip];
  v4 = objc_msgSend(v2, "numberWithDouble:");
  v5 = HMIJSONDecimalNumberForNumber(v4, 2);
  v13[0] = v5;
  v12[1] = @"dateOfOccurrence";
  v6 = [v3 dateOfOccurrence];
  v7 = HMIConvertNSDateToIsoDateString(v6);
  v13[1] = v7;
  v12[2] = @"confidenceLevel";
  [v3 confidenceLevel];
  v8 = HMStringFromCameraSignificantEventConfidenceLevel();
  v13[2] = v8;
  v12[3] = @"reason";
  [v3 reason];

  v9 = HMStringFromCameraSignificantEventReason();
  v13[3] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

+ (id)metadataForHome:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v7 = @"homeUUID";
  id v3 = [a3 uniqueIdentifier];
  v4 = [v3 UUIDString];
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)metadataForClip:(id)a3 withCameraProfile:(id)a4 inHome:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = +[HMIFeedbackClipMetadataGenerator metadataForClip:a3];
  v10 = +[HMIFeedbackClipMetadataGenerator metadataForCameraProfile:v8];

  v11 = +[HMIFeedbackClipMetadataGenerator metadataForHome:v7];

  v12 = [[HMIFeedbackClipMetadata alloc] initWithClipMetadata:v9 cameraMetadata:v10 homeMetadata:v11];
  return v12;
}

@end