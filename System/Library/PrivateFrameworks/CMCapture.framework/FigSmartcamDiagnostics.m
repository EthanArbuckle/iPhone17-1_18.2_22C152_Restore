@interface FigSmartcamDiagnostics
- (BOOL)addClassifierVersionMajor:(unsigned __int16)a3 minor:(unsigned __int16)a4 patch:(unsigned __int16)a5;
- (BOOL)addMotionStats:(id *)a3;
- (FigSmartcamDiagnostics)init;
- (id)metadata;
- (void)addPAMDecisionPreliminary:(id)a3;
- (void)addSceneConfidences:(id)a3;
@end

@implementation FigSmartcamDiagnostics

- (FigSmartcamDiagnostics)init
{
  v6.receiver = self;
  v6.super_class = (Class)FigSmartcamDiagnostics;
  v2 = [(FigSmartcamDiagnostics *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    metadata = v2->_metadata;
    v2->_metadata = v3;
  }
  return v2;
}

- (void)addSceneConfidences:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"SceneConfidencesForFirmware"];
}

- (void)addPAMDecisionPreliminary:(id)a3
{
  id v4 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_metadata setObject:v4 forKeyedSubscript:@"PeopleAndMotionDecisionPreliminary"];
}

- (BOOL)addClassifierVersionMajor:(unsigned __int16)a3 minor:(unsigned __int16)a4 patch:(unsigned __int16)a5
{
  objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d", a3, a4, a5);
  [(NSMutableDictionary *)self->_metadata setObject:v6 forKeyedSubscript:@"ClassifierVersion"];

  return 1;
}

- (BOOL)addMotionStats:(id *)a3
{
  v28[7] = *MEMORY[0x1E4F143B8];
  v27[0] = @"crossCorrelationMaximum";
  *(float *)&double v3 = a3->var0[0];
  v23 = [NSNumber numberWithFloat:v3];
  v26[0] = v23;
  *(float *)&double v5 = a3->var0[1];
  v22 = [NSNumber numberWithFloat:v5];
  v26[1] = v22;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v28[0] = v21;
  v27[1] = @"maxCorrelationShift";
  v20 = [NSNumber numberWithInt:a3->var1[0]];
  v25[0] = v20;
  v19 = [NSNumber numberWithInt:a3->var1[1]];
  v25[1] = v19;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v28[1] = v18;
  v27[2] = @"frameRingBufferCount";
  objc_super v6 = [NSNumber numberWithInt:a3->var2];
  v28[2] = v6;
  v27[3] = @"frameRingBufferDistance";
  v7 = [NSNumber numberWithInt:a3->var3];
  v28[3] = v7;
  v27[4] = @"isMotionDetected";
  v8 = [NSNumber numberWithBool:a3->var5];
  v28[4] = v8;
  v27[5] = @"normalizedROI";
  v9 = [NSNumber numberWithDouble:a3->var4.origin.x];
  v24[0] = v9;
  v10 = [NSNumber numberWithDouble:a3->var4.origin.y];
  v24[1] = v10;
  v11 = [NSNumber numberWithDouble:a3->var4.size.width];
  v24[2] = v11;
  v12 = [NSNumber numberWithDouble:a3->var4.size.height];
  v24[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  v28[5] = v13;
  v27[6] = @"valid";
  v14 = [NSNumber numberWithBool:a3->var6];
  v28[6] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:7];

  if (v15) {
    [(NSMutableDictionary *)self->_metadata setObject:v15 forKeyedSubscript:@"MotionStats"];
  }
  else {
    FigDebugAssert3();
  }

  return v15 != 0;
}

- (id)metadata
{
  v2 = (void *)[(NSMutableDictionary *)self->_metadata copy];
  return v2;
}

- (void).cxx_destruct
{
}

@end