@interface HMIHTMLReport
+ (id)boxForRegionOfInterest:(CGRect)a3;
+ (id)boxesForEvent:(id)a3 isTruth:(BOOL)a4;
- (HMIHTMLReport)initWithTitle:(id)a3 outputPath:(id)a4;
- (NSOutputStream)stream;
- (NSString)outputPath;
- (id)_loadResource:(id)a3 withExtension:(id)a4;
- (void)appendFaceCrop:(id)a3 imageBorder:(int)a4 imageColor:(id)a5 outlineBorder:(int)a6 outlineColor:(id)a7;
- (void)appendFragmentResult:(id)a3;
- (void)appendFragmentResult:(id)a3 assetPath:(id)a4;
- (void)appendFrame:(id)a3 text:(id)a4;
- (void)appendFrame:(id)a3 text:(id)a4 boxes:(id)a5 imageBorder:(int)a6 imageColor:(id)a7 outlineBorder:(int)a8 outlineColor:(id)a9;
- (void)appendFrameResult:(id)a3 frameTruth:(id)a4 description:(id)a5;
- (void)appendHeaderWithTitle:(id)a3 textColor:(id)a4 backgroundColor:(id)a5;
- (void)appendJPEG:(id)a3 imageBorder:(int)a4 imageColor:(id)a5 outlineBorder:(int)a6 outlineColor:(id)a7;
- (void)appendString:(id)a3;
- (void)appendText:(id)a3;
- (void)dealloc;
- (void)flush;
@end

@implementation HMIHTMLReport

- (HMIHTMLReport)initWithTitle:(id)a3 outputPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIHTMLReport;
  v8 = [(HMIHTMLReport *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputPath, a4);
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF9E0]) initToFileAtPath:v7 append:0];
    stream = v9->_stream;
    v9->_stream = (NSOutputStream *)v10;

    v12 = [(HMIHTMLReport *)v9 stream];
    [v12 open];

    [(HMIHTMLReport *)v9 appendHeaderWithTitle:v6 textColor:@"#ffffff" backgroundColor:@"#000000"];
  }

  return v9;
}

- (void)dealloc
{
  [(HMIHTMLReport *)self appendString:@"</body>\n</html>"];
  v3 = [(HMIHTMLReport *)self stream];
  [v3 close];

  v4 = [(HMIHTMLReport *)self outputPath];
  NSLog(&cfstr_VisualizerSave.isa, v4);

  v5.receiver = self;
  v5.super_class = (Class)HMIHTMLReport;
  [(HMIHTMLReport *)&v5 dealloc];
}

- (id)_loadResource:(id)a3 withExtension:(id)a4
{
  objc_super v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 URLForResource:v7 withExtension:v6];

  uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
  v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];

  return v11;
}

- (void)appendHeaderWithTitle:(id)a3 textColor:(id)a4 backgroundColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [(HMIHTMLReport *)self _loadResource:@"HMIHTMLReport" withExtension:@"css"];
  v11 = [(HMIHTMLReport *)self _loadResource:@"HMIHTMLReport" withExtension:@"js"];
  v12 = [NSString stringWithFormat:@"<html>\n<head><title>%@</title></head>\n<style>\n%@\n</style>\n<body text='%@' bgcolor='%@'>\n<script>\n%@\n</script>\n", v10, v13, v9, v8, v11];

  [(HMIHTMLReport *)self appendString:v12];
}

- (void)appendString:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  objc_super v5 = [(HMIHTMLReport *)self stream];
  id v6 = v4;
  objc_msgSend(v5, "write:maxLength:", objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
}

- (void)appendText:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@<br>\n", a3];
  [(HMIHTMLReport *)self appendString:v4];
}

- (void)appendFrame:(id)a3 text:(id)a4
{
}

- (void)appendFrame:(id)a3 text:(id)a4 boxes:(id)a5 imageBorder:(int)a6 imageColor:(id)a7 outlineBorder:(int)a8 outlineColor:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v11 = *(void *)&a6;
  id v43 = a4;
  id v15 = a7;
  id v16 = a9;
  id v17 = a5;
  id v18 = a3;
  [v18 size];
  double v20 = v19;
  [v18 size];
  if (v20 >= v21) {
    double v22 = v20;
  }
  else {
    double v22 = v21;
  }
  double v23 = 480.0 / v22;
  if (v23 > 1.0) {
    double v23 = 1.0;
  }
  float v24 = fmax(v23, 0.0);
  double v25 = v24;
  [v18 size];
  double v27 = v26 * v25;
  [v18 size];
  double v29 = v28 * v25;
  id v47 = 0;
  v30 = [v18 compressedFrameWithScale:&v47 quality:v25 error:1.0];

  id v42 = v47;
  v31 = [MEMORY[0x263EFF980] array];
  if ((int)v11 >= 1)
  {
    if ([v15 length])
    {
      if (![v15 length]) {
        goto LABEL_12;
      }
      [NSString stringWithFormat:@"border:%dpx solid %@;", v11, v15];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"border:%dpx;", v11, v41);
    v32 = };
    [v31 addObject:v32];
  }
LABEL_12:
  float v33 = v27;
  if ((int)v9 < 1) {
    goto LABEL_18;
  }
  if ([v16 length])
  {
    if (![v16 length]) {
      goto LABEL_18;
    }
    [NSString stringWithFormat:@"outline:%dpx solid %@;", v9, v16];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"outline:%dpx;", v9, v41);
  v35 = };
  [v31 addObject:v35];

LABEL_18:
  v36 = NSString;
  v37 = [v30 base64Encoded];
  v38 = [v31 componentsJoinedByString:@" "];
  float v34 = v29;
  objc_msgSend(v36, "stringWithFormat:", @"<div class='image'>\n<img width='%d' height='%d' src='data:image/jpeg;base64,%@' style='%@'/>\n",
    (int)v33,
    (int)v34,
    v37,
  v39 = v38);
  [(HMIHTMLReport *)self appendString:v39];

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __90__HMIHTMLReport_appendFrame_text_boxes_imageBorder_imageColor_outlineBorder_outlineColor___block_invoke;
  v44[3] = &unk_26477B658;
  v44[4] = self;
  float v45 = v29;
  float v46 = v33;
  [v17 enumerateObjectsUsingBlock:v44];

  if ([v43 length])
  {
    v40 = [NSString stringWithFormat:@"<div class=\"text\">%@</div>\n", v43];
    [(HMIHTMLReport *)self appendString:v40];
  }
  [(HMIHTMLReport *)self appendString:@"</div>\n"];
}

void __90__HMIHTMLReport_appendFrame_text_boxes_imageBorder_imageColor_outlineBorder_outlineColor___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = NSString;
  id v5 = a2;
  [v5 boundingBox];
  uint64_t v7 = (int)(v6 * *(float *)(a1 + 40));
  [v5 boundingBox];
  uint64_t v9 = (int)(v8 * *(float *)(a1 + 44));
  [v5 boundingBox];
  uint64_t v11 = (int)(v10 * *(float *)(a1 + 44));
  [v5 boundingBox];
  uint64_t v13 = (int)(v12 * *(float *)(a1 + 40));
  id v20 = [v5 color];
  [v5 opacity];
  double v15 = v14;
  [v5 value];
  double v17 = v16;
  id v18 = [v5 text];

  objc_msgSend(v4, "stringWithFormat:", @"<div class='rect' style='top:%dpx; left:%dpx; width:%dpx; height:%dpx; border-color:%@; opacity:%.1f' threshold='%.3f'>%@</div>\n",
    v7,
    v9,
    v11,
    v13,
    v20,
    *(void *)&v15,
    *(void *)&v17,
  double v19 = v18);
  [v3 appendString:v19];
}

- (void)appendFaceCrop:(id)a3 imageBorder:(int)a4 imageColor:(id)a5 outlineBorder:(int)a6 outlineColor:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  id v13 = a5;
  id v14 = [a3 dataRepresentation];
  [(HMIHTMLReport *)self appendJPEG:v14 imageBorder:v9 imageColor:v13 outlineBorder:v7 outlineColor:v12];
}

- (void)appendJPEG:(id)a3 imageBorder:(int)a4 imageColor:(id)a5 outlineBorder:(int)a6 outlineColor:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v31 = 0;
  id v14 = a3;
  double v15 = +[HMIVisionUtilities createPixelBufferFromJPEGData:v14 error:&v31];
  double Size = HMICVPixelBufferGetSize(v15);
  double v18 = v17;
  CVPixelBufferRelease(v15);
  double v19 = [v14 base64EncodedStringWithOptions:32];

  id v20 = [MEMORY[0x263EFF980] array];
  if ((int)v9 >= 1)
  {
    if ([v12 length])
    {
      if (![v12 length]) {
        goto LABEL_7;
      }
      [NSString stringWithFormat:@"border:%dpx solid %@;", v9, v12];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"border:%dpx;", v9, v30);
    double v21 = };
    [v20 addObject:v21];
  }
LABEL_7:
  if ((int)v8 >= 1)
  {
    if (![v13 length])
    {
      objc_msgSend(NSString, "stringWithFormat:", @"outline:%dpx;", v8, v30);
      goto LABEL_12;
    }
    if ([v13 length])
    {
      [NSString stringWithFormat:@"outline:%dpx solid %@;", v8, v13];
      double v22 = LABEL_12:;
      [v20 addObject:v22];
    }
  }
  float v23 = v18;
  float v24 = Size;
  double v25 = NSString;
  uint64_t v26 = (int)v24;
  uint64_t v27 = (int)v23;
  double v28 = [v20 componentsJoinedByString:@" "];
  objc_msgSend(v25, "stringWithFormat:", @"<div class='image'>\n<img width='%d' height='%d' src='data:image/jpeg;base64,%@' style='%@'/>\n",
    v26,
    v27,
    v19,
  double v29 = v28);
  [(HMIHTMLReport *)self appendString:v29];

  [(HMIHTMLReport *)self appendString:@"</div>\n"];
}

- (void)appendFragmentResult:(id)a3
{
  id v4 = [a3 frameResults];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__HMIHTMLReport_appendFragmentResult___block_invoke;
  v5[3] = &unk_26477B680;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);
}

void __38__HMIHTMLReport_appendFragmentResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 frame];
  id v5 = v4;
  if (v4) {
    [v4 presentationTimeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  float Seconds = CMTimeGetSeconds(&time);

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%.3fs", Seconds);
  [*(id *)(a1 + 32) appendFrameResult:v3 frameTruth:0 description:v7];
}

- (void)appendFragmentResult:(id)a3 assetPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v7];
  uint64_t v9 = [[HMIVideoFragment alloc] initWithData:v8];
  double v10 = [[HMIVideoFrameGenerator alloc] initWithVideoFragment:v9];
  uint64_t v11 = [v6 frameResults];
  id v12 = objc_msgSend(v11, "na_map:", &__block_literal_global);

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  double v19 = __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_2;
  id v20 = &unk_26477B6F0;
  id v21 = v6;
  id v22 = v12;
  id v23 = v7;
  float v24 = self;
  id v13 = v7;
  id v14 = v12;
  id v15 = v6;
  float v16 = (void *)MEMORY[0x22A641EE0](&v17);
  -[HMIVideoFrameGenerator generateVideoFramesForTimes:completionHandler:](v10, "generateVideoFramesForTimes:completionHandler:", v14, v16, v17, v18, v19, v20);
}

id __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08D40];
  id v3 = [a2 frame];
  id v4 = v3;
  if (v3) {
    [v3 presentationTimeStamp];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  id v5 = [v2 valueWithCMTime:v7];

  return v5;
}

void __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_3;
  v6[3] = &unk_26477B6C8;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __48__HMIHTMLReport_appendFragmentResult_assetPath___block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [HMIVideoAnalyzerFrameResult alloc];
  id v7 = [a1[4] frameResults];
  id v8 = [v7 objectAtIndexedSubscript:a3];
  id v9 = [v8 events];
  uint64_t v10 = [a1[4] frameResults];
  uint64_t v11 = [v10 objectAtIndexedSubscript:a3];
  [v11 regionOfInterest];
  id v12 = -[HMIVideoAnalyzerFrameResult initWithFrame:events:regionOfInterest:](v6, "initWithFrame:events:regionOfInterest:", v5, v9);

  id v13 = NSString;
  uint64_t v14 = [a1[5] count];
  id v15 = [a1[6] lastPathComponent];
  if (v5) {
    [v5 presentationTimeStamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  float v16 = [v13 stringWithFormat:@"[%lu/%lu] %@ (%.2fs)", a3, v14, v15, CMTimeGetSeconds(&time)];

  [a1[7] appendFrameResult:v12 frameTruth:0 description:v16];
}

- (void)appendFrameResult:(id)a3 frameTruth:(id)a4 description:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x263EFF980];
  id v11 = a5;
  id v12 = [v10 array];
  if (v9)
  {
    id v13 = [v9 events];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke;
    v24[3] = &unk_26477B718;
    id v25 = v12;
    [v13 enumerateObjectsUsingBlock:v24];
  }
  [v8 regionOfInterest];
  if (!CGRectIsEmpty(v27))
  {
    [v8 regionOfInterest];
    uint64_t v14 = +[HMIHTMLReport boxForRegionOfInterest:](HMIHTMLReport, "boxForRegionOfInterest:");
    [v12 addObject:v14];
  }
  id v15 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"confidence.value" ascending:1];
  float v16 = [v8 events];
  uint64_t v17 = [v16 allObjects];
  v26[0] = v15;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  double v19 = [v17 sortedArrayUsingDescriptors:v18];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke_2;
  v22[3] = &unk_26477B740;
  id v23 = v12;
  id v20 = v12;
  objc_msgSend(v19, "na_each:", v22);
  id v21 = [v8 frame];
  -[HMIHTMLReport appendFrame:text:boxes:imageBorder:imageColor:outlineBorder:outlineColor:](self, "appendFrame:text:boxes:imageBorder:imageColor:outlineBorder:outlineColor:", v21, v11, v20, 0, &stru_26D98B6C8);
}

void __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[HMIHTMLReport boxesForEvent:a2 isTruth:1];
  [v2 addObjectsFromArray:v3];
}

void __58__HMIHTMLReport_appendFrameResult_frameTruth_description___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[HMIHTMLReport boxesForEvent:a2 isTruth:0];
  [v2 addObjectsFromArray:v3];
}

+ (id)boxesForEvent:(id)a3 isTruth:(BOOL)a4
{
  BOOL v7 = a4;
  id v8 = a3;
  if (v7) {
    float v9 = 0.4;
  }
  else {
    float v9 = 1.0;
  }
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  [v11 boundingBox];
  if (!CGRectIsEmpty(v98))
  {
    if (v7)
    {
      uint64_t v14 = &stru_26D98B6C8;
    }
    else
    {
      if (v13 && ([v13 sessionEntityUUID], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        float v16 = v15;
        uint64_t v17 = [v15 UUIDString];
        uint64_t v18 = [v17 substringToIndex:3];
      }
      else
      {
        uint64_t v18 = &stru_26D98B6C8;
      }
      double v19 = NSString;
      id v20 = [v11 confidence];
      [v20 value];
      uint64_t v14 = [v19 stringWithFormat:@"%.3f %@", v21, v18];
    }
    id v22 = [HMIHTMLReportBox alloc];
    [v11 boundingBox];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    uint64_t v31 = +[HMIVideoAnalyzerEvent rgbColorCodeForEventClass:objc_opt_class()];
    if (v7)
    {
      LODWORD(v33) = 1.0;
    }
    else
    {
      id v4 = [v11 confidence];
      [v4 value];
      *(float *)&double v33 = v34;
    }
    *(float *)&double v32 = v9;
    v35 = -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v22, "initWithBoundingBox:text:color:opacity:value:", v14, v31, v24, v26, v28, v30, v32, v33);
    [v10 addObject:v35];

    if (!v7) {
  }
    }
  if (v13)
  {
    uint64_t v36 = [v13 face];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [v13 face];
      [v38 boundingBox];
      BOOL IsEmpty = CGRectIsEmpty(v99);

      if (!IsEmpty)
      {
        v40 = [v13 face];
        if (v7)
        {
          uint64_t v41 = &stru_26D98B6C8;
        }
        else
        {
          id v42 = [v13 face];
          id v43 = [v42 faceRecognition];
          v44 = [v43 classifications];
          id v5 = objc_msgSend(v44, "hmf_isEmpty");

          if (v5)
          {
            float v45 = NSString;
            float v46 = [v40 confidence];
            [v46 value];
            objc_msgSend(v45, "stringWithFormat:", @"%.3f", v47);
            uint64_t v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v48 = [v13 face];
            v49 = [v48 faceRecognition];
            v50 = [v49 classifications];
            float v46 = [v50 anyObject];

            v95 = NSString;
            v96 = [v40 confidence];
            [v96 value];
            uint64_t v52 = v51;
            if ([v46 fromTorsoClassification]) {
              v53 = @"T";
            }
            else {
              v53 = @"F";
            }
            [v46 confidence];
            uint64_t v55 = v54;
            id v5 = [v46 personUUID];
            id v6 = [v5 UUIDString];
            v56 = [v6 substringToIndex:2];
            uint64_t v41 = [v95 stringWithFormat:@"%.3f %@ %.2f %@", v52, v53, v55, v56];
          }
        }
        v57 = [HMIHTMLReportBox alloc];
        [v40 boundingBox];
        double v59 = v58;
        double v61 = v60;
        double v63 = v62;
        double v65 = v64;
        v66 = +[HMIVideoAnalyzerEvent rgbColorCodeForEventClass:objc_opt_class()];
        if (v7)
        {
          LODWORD(v68) = 1.0;
        }
        else
        {
          id v5 = [v40 confidence];
          [v5 value];
          *(float *)&double v68 = v69;
        }
        *(float *)&double v67 = v9;
        v70 = -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v57, "initWithBoundingBox:text:color:opacity:value:", v41, v66, v59, v61, v63, v65, v67, v68);
        [v10 addObject:v70];

        if (!v7) {
      }
        }
    }
    uint64_t v71 = [v13 torso];
    if (v71)
    {
      v72 = (void *)v71;
      v73 = [v13 torso];
      [v73 boundingBox];
      BOOL v74 = CGRectIsEmpty(v100);

      if (!v74)
      {
        v75 = [v13 torso];
        v76 = [HMIHTMLReportBox alloc];
        [v75 boundingBox];
        double v78 = v77;
        double v80 = v79;
        double v82 = v81;
        double v84 = v83;
        if (v7)
        {
          v85 = &stru_26D98B6C8;
        }
        else
        {
          v86 = NSString;
          v73 = [v75 confidence];
          [v73 value];
          objc_msgSend(v86, "stringWithFormat:", @"%.3f", v87);
          v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v88 = +[HMIVideoAnalyzerEvent rgbColorCodeForEventClass:objc_opt_class()];
        if (v7)
        {
          LODWORD(v90) = 1.0;
        }
        else
        {
          id v6 = [v75 confidence];
          [v6 value];
          *(float *)&double v90 = v91;
        }
        *(float *)&double v89 = v9;
        v92 = -[HMIHTMLReportBox initWithBoundingBox:text:color:opacity:value:](v76, "initWithBoundingBox:text:color:opacity:value:", v85, v88, v78, v80, v82, v84, v89, v90);
        [v10 addObject:v92];

        if (v7)
        {
          v73 = v88;
        }
        else
        {
        }
      }
    }
  }
  v93 = (void *)[v10 copy];

  return v93;
}

+ (id)boxForRegionOfInterest:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v7 = [HMIHTMLReportBox alloc];
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [(HMIHTMLReportBox *)v7 initWithBoundingBox:&stru_26D98B6C8, @"#ffff00", x, y, width, height, v8, v9 text color opacity value];
  return v10;
}

- (void)flush
{
  [(HMIHTMLReport *)self appendString:@"</body>\n</html>"];
  id v3 = [(HMIHTMLReport *)self stream];
  [v3 close];

  id v4 = [(HMIHTMLReport *)self outputPath];
  NSLog(&cfstr_VisualizerSave.isa, v4);
}

- (NSOutputStream)stream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)outputPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end