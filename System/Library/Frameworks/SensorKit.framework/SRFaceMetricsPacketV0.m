@interface SRFaceMetricsPacketV0
+ (id)packetWithHAFacialMetricsPacket:(id *)a3;
- (NSArray)gaze;
- (NSArray)geometryLeftEye;
- (NSArray)geometryRightEye;
- (NSArray)partialFaceExpressions;
- (NSArray)rotation;
- (NSArray)translation;
- (NSArray)wholeFaceExpressions;
- (NSData)blendshapes;
- (NSDictionary)trackingData;
- (NSString)sessionIdentifier;
- (NSString)version;
- (NSUUID)faceIdentifier;
- (float)leftEyePitch;
- (float)leftEyeYaw;
- (float)rightEyePitch;
- (float)rightEyeYaw;
- (unint64_t)context;
- (void)dealloc;
@end

@implementation SRFaceMetricsPacketV0

+ (id)packetWithHAFacialMetricsPacket:(id *)a3
{
  if (a3->var0)
  {
    v3 = _MergedGlobals_4;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_4, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid input data for V0";
    v11 = buf;
LABEL_18:
    _os_log_fault_impl(&dword_21FCA3000, v3, OS_LOG_TYPE_FAULT, v10, v11, 2u);
    return 0;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08C38], "sr_UUIDWithUint32_t:", a3->var1);
  if (!v6)
  {
    v3 = _MergedGlobals_4;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_4, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    __int16 v14 = 0;
    v10 = "Failed to generate V0 face metrics, because of empty face indentifier";
    v11 = (uint8_t *)&v14;
    goto LABEL_18;
  }
  v7 = (void *)v6;
  if (qword_26AB1A0D8 != -1) {
    dispatch_once(&qword_26AB1A0D8, &__block_literal_global_4);
  }
  if (!qword_26AB1A0E0)
  {
    v12 = _MergedGlobals_4;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_ERROR, "Failed to generate V0 face metrics, because of empty neutral face geometry", v13, 2u);
    }
    return 0;
  }
  v8 = objc_alloc_init(SRFaceMetricsPacketV0);
  v9 = v8;
  if (v8)
  {
    v8->_packet = a3;
    v8->_faceIdentifier = (NSUUID *)v7;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRFaceMetricsPacketV0;
  [(SRFaceMetricsPacketV0 *)&v3 dealloc];
}

- (NSString)version
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%i.0", self->_packet->var0);
}

- (unint64_t)context
{
  return 0;
}

- (NSString)sessionIdentifier
{
  return (NSString *)@"00000000-0000-0000-0000-000000000000";
}

- (NSArray)wholeFaceExpressions
{
  v4[7] = *MEMORY[0x263EF8340];
  v4[1] = +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:value:](SRFaceMetricsExpression, "wholeFaceMetricsExpressionWithIdentifier:value:", @"1F26EABE-8350-48C5-97F0-06EFD6FEC6C4", self->_packet->var6.var0.var1, +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:@"E24480FE-8ECF-412C-8A02-3E924971A840" value:self->_packet->var6.var0.var0]);
  v4[2] = +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:@"726DA5E5-E63A-43CC-B7F3-FDD42A5583FA" value:self->_packet->var6.var0.var2];
  v4[3] = +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:@"6AEC22CC-2311-45F1-AF8E-F372A3C979B2" value:self->_packet->var6.var0.var5];
  v4[4] = +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:@"FECC0DAC-9B31-4504-896E-6C2898F16B69" value:self->_packet->var6.var0.var6];
  v4[5] = +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:@"A1E9B99B-C90B-4DB4-8ED3-4E0382ABC8B5" value:self->_packet->var6.var0.var8];
  v4[6] = +[SRFaceMetricsExpression wholeFaceMetricsExpressionWithIdentifier:@"C57C8CCA-0194-4327-8CBA-987FAF744096" value:self->_packet->var6.var0.var9];
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:7];
}

- (NSArray)partialFaceExpressions
{
  void v4[8] = *MEMORY[0x263EF8340];
  v4[0] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"85E97F41-0CF7-481E-B9ED-8E5A90B4A547" value:self->_packet->var6.var1.var0];
  v4[1] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"5A3CBD39-B24F-463A-990C-18C5372D6F1B" value:self->_packet->var6.var1.var1];
  v4[2] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"D0859030-4703-45F6-A902-7634984A2074" value:self->_packet->var6.var1.var2];
  v4[3] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"A29952D5-F6EA-4562-9A12-43284B1DB634" value:self->_packet->var6.var1.var3];
  v4[4] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"A8B47A8D-A86F-4159-8472-33C67D6250B5" value:self->_packet->var6.var1.var4];
  v4[5] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"60A8B7A9-8C8F-401A-A8C4-C996B1397CC9" value:self->_packet->var6.var1.var5];
  v4[6] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"E5A9652C-9CF9-4F38-BC7A-1D622DC69B41" value:self->_packet->var6.var1.var6];
  v4[7] = +[SRFaceMetricsExpression partialFaceMetricsExpressionWithIdentifier:@"A1D4672B-2E01-435A-BD0D-ABAEB1F4CB6E" value:self->_packet->var6.var1.var7];
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
}

- (NSUUID)faceIdentifier
{
  return self->_faceIdentifier;
}

- (NSArray)rotation
{
  v16[3] = *MEMORY[0x263EF8340];
  *(float *)&double v2 = self->_packet->var3.var0[0][0];
  v15[0] = [NSNumber numberWithFloat:v2];
  *(float *)&double v4 = self->_packet->var3.var0[0][1];
  v15[1] = [NSNumber numberWithFloat:v4];
  *(float *)&double v5 = self->_packet->var3.var0[0][2];
  v15[2] = [NSNumber numberWithFloat:v5];
  v16[0] = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  *(float *)&double v6 = self->_packet->var3.var0[1][0];
  v14[0] = [NSNumber numberWithFloat:v6];
  *(float *)&double v7 = self->_packet->var3.var0[1][1];
  v14[1] = [NSNumber numberWithFloat:v7];
  *(float *)&double v8 = self->_packet->var3.var0[1][2];
  v14[2] = [NSNumber numberWithFloat:v8];
  v16[1] = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  *(float *)&double v9 = self->_packet->var3.var0[2][0];
  v13[0] = [NSNumber numberWithFloat:v9];
  *(float *)&double v10 = self->_packet->var3.var0[2][1];
  v13[1] = [NSNumber numberWithFloat:v10];
  *(float *)&double v11 = self->_packet->var3.var0[2][2];
  v13[2] = [NSNumber numberWithFloat:v11];
  v16[2] = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
}

- (NSArray)translation
{
  v7[3] = *MEMORY[0x263EF8340];
  *(float *)&double v2 = self->_packet->var3.var1[0];
  v7[0] = [NSNumber numberWithFloat:v2];
  *(float *)&double v4 = self->_packet->var3.var1[1];
  v7[1] = objc_msgSend(NSNumber, "numberWithFloat:", v4, v7[0]);
  *(float *)&double v5 = self->_packet->var3.var1[2];
  v7[2] = [NSNumber numberWithFloat:v5];
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
}

- (NSArray)gaze
{
  v7[3] = *MEMORY[0x263EF8340];
  *(float *)&double v2 = self->_packet->var4[0];
  v7[0] = [NSNumber numberWithFloat:v2];
  *(float *)&double v4 = self->_packet->var4[1];
  v7[1] = objc_msgSend(NSNumber, "numberWithFloat:", v4, v7[0]);
  *(float *)&double v5 = self->_packet->var4[2];
  v7[2] = [NSNumber numberWithFloat:v5];
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
}

- (NSData)blendshapes
{
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:&self->_packet->var5 length:204];
}

- (NSArray)geometryLeftEye
{
  return (NSArray *)&unk_26D173FF0;
}

- (NSArray)geometryRightEye
{
  return (NSArray *)&unk_26D174008;
}

- (float)leftEyePitch
{
  return 0.0;
}

- (float)rightEyePitch
{
  return 0.0;
}

- (float)leftEyeYaw
{
  return 0.0;
}

- (float)rightEyeYaw
{
  return 0.0;
}

- (NSDictionary)trackingData
{
  v29[2] = *MEMORY[0x263EF8340];
  v28[0] = @"rotation";
  v28[1] = @"translation";
  v29[0] = [(SRFaceMetricsPacketV0 *)self rotation];
  v29[1] = [(SRFaceMetricsPacketV0 *)self translation];
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v26[0] = @"blendshapes";
  v27[0] = [(SRFaceMetricsPacketV0 *)self blendshapes];
  v26[1] = @"gaze";
  v27[1] = [(SRFaceMetricsPacketV0 *)self gaze];
  v26[2] = @"left_eye_pitch";
  double v4 = NSNumber;
  [(SRFaceMetricsPacketV0 *)self leftEyePitch];
  v27[2] = objc_msgSend(v4, "numberWithFloat:");
  v26[3] = @"right_eye_pitch";
  double v5 = NSNumber;
  [(SRFaceMetricsPacketV0 *)self rightEyePitch];
  v27[3] = objc_msgSend(v5, "numberWithFloat:");
  v26[4] = @"left_eye_yaw";
  double v6 = NSNumber;
  [(SRFaceMetricsPacketV0 *)self leftEyeYaw];
  v27[4] = objc_msgSend(v6, "numberWithFloat:");
  v26[5] = @"right_eye_yaw";
  double v7 = NSNumber;
  [(SRFaceMetricsPacketV0 *)self rightEyeYaw];
  v27[5] = objc_msgSend(v7, "numberWithFloat:");
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];
  v24[0] = @"left_eye";
  v25[0] = [(SRFaceMetricsPacketV0 *)self geometryLeftEye];
  v24[1] = @"right_eye";
  v25[1] = [(SRFaceMetricsPacketV0 *)self geometryRightEye];
  v24[2] = @"vertices";
  if (qword_26AB1A0D8 != -1) {
    dispatch_once(&qword_26AB1A0D8, &__block_literal_global_4);
  }
  v25[2] = qword_26AB1A0E0;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  v22[0] = @"rotation";
  v22[1] = @"translation";
  v23[0] = &unk_26D174068;
  v23[1] = &unk_26D174080;
  v20[0] = @"extrinsics";
  v20[1] = @"intrinsics";
  v21[0] = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  v21[1] = &unk_26D1740E0;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18[0] = @"pose";
  v18[1] = @"animation";
  v19[0] = v3;
  v19[1] = v8;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v16[0] = @"geometry";
  v16[1] = @"pose";
  v17[0] = v9;
  v17[1] = v3;
  v16[2] = @"animation";
  v17[2] = v8;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  v14[0] = @"face_id";
  v15[0] = [(NSUUID *)[(SRFaceMetricsPacketV0 *)self faceIdentifier] UUIDString];
  v15[1] = &unk_26D1745D0;
  v14[1] = @"confidence";
  v14[2] = @"rgb_camera";
  v15[2] = v10;
  void v15[3] = v11;
  void v14[3] = @"raw_data";
  v14[4] = @"smooth_data";
  v15[4] = v12;
  return (NSDictionary *)[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
}

@end