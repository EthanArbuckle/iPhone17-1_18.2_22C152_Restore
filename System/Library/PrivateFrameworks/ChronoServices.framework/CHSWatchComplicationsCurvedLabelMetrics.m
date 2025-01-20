@interface CHSWatchComplicationsCurvedLabelMetrics
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)interior;
- (BOOL)isEqual:(id)a3;
- (BSColor)textColor;
- (CGPoint)circleCenter;
- (CGSize)accessoryMaxSize;
- (CHSBezierPath)bezierPath;
- (CHSWatchComplicationsCurvedLabelMetrics)init;
- (CHSWatchComplicationsCurvedLabelMetrics)initWithBSXPCCoder:(id)a3;
- (CHSWatchComplicationsCurvedLabelMetrics)initWithCoder:(id)a3;
- (NSString)description;
- (double)accessoryPadding;
- (double)centerAngle;
- (double)circleRadius;
- (double)fontSize;
- (double)maximumAngularWidth;
- (double)tracking;
- (id)_filenameSafeStableHash;
- (id)_filenameSafeStableHashFromData:(id)a3;
- (id)_initWithInstance:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)accessoryPlacement;
- (unint64_t)hash;
- (void)_filenameSafeStableHash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWatchComplicationsCurvedLabelMetrics

- (CHSWatchComplicationsCurvedLabelMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  v2 = [(CHSWatchComplicationsCurvedLabelMetrics *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E4F1DAD8];
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 4) = 0;
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 6) = 0;

    v3[56] = 0;
    *((void *)v3 + 8) = 0;
    *((void *)v3 + 9) = 0;
    uint64_t v5 = [MEMORY[0x1E4F4F6E0] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v6 = (void *)*((void *)v3 + 10);
    *((void *)v3 + 10) = v5;

    *((void *)v3 + 11) = 0;
    *((void *)v3 + 12) = 0;
    *(_OWORD *)(v3 + 104) = *MEMORY[0x1E4F1DB30];
  }
  return (CHSWatchComplicationsCurvedLabelMetrics *)v3;
}

- (id)_initWithInstance:(id)a3
{
  v4 = (char *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  uint64_t v5 = [(CHSWatchComplicationsCurvedLabelMetrics *)&v12 init];
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((void *)v5 + 3) = *((void *)v4 + 3);
    *((void *)v5 + 4) = *((void *)v4 + 4);
    *((void *)v5 + 5) = *((void *)v4 + 5);
    uint64_t v7 = [*((id *)v4 + 6) copy];
    objc_super v8 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v7;

    v6[56] = v4[56];
    *((void *)v6 + 8) = *((void *)v4 + 8);
    *((void *)v6 + 9) = *((void *)v4 + 9);
    uint64_t v9 = [*((id *)v4 + 10) copy];
    v10 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v9;

    *((void *)v6 + 11) = *((void *)v4 + 11);
    *((void *)v6 + 12) = *((void *)v4 + 12);
    *(_OWORD *)(v6 + 104) = *(_OWORD *)(v4 + 104);
  }

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __54__CHSWatchComplicationsCurvedLabelMetrics_description__block_invoke;
  v11 = &unk_1E56C81F0;
  id v4 = v3;
  id v12 = v4;
  v13 = self;
  id v5 = (id)[v4 modifyProem:&v8];
  v6 = objc_msgSend(v4, "build", v8, v9, v10, v11);

  return (NSString *)v6;
}

id __54__CHSWatchComplicationsCurvedLabelMetrics_description__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", @"circleCenter", *(double *)(*(void *)(a1 + 40) + 8), *(double *)(*(void *)(a1 + 40) + 16));
  id v3 = (id)[*(id *)(a1 + 32) appendFloat:@"circleRadius" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 24)];
  id v4 = (id)[*(id *)(a1 + 32) appendFloat:@"maximumAngularWidth" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 32)];
  id v5 = (id)[*(id *)(a1 + 32) appendFloat:@"centerAngle" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 40)];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"bezierPath" skipIfNil:1];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 56) withName:@"interior"];
  id v8 = (id)[*(id *)(a1 + 32) appendFloat:@"tracking" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 64)];
  id v9 = (id)[*(id *)(a1 + 32) appendFloat:@"fontSize" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 72)];
  id v10 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 80) withName:@"textColor"];
  id v11 = (id)[*(id *)(a1 + 32) appendFloat:@"accessoryPlacement" withName:2 decimalPrecision:(double)*(unint64_t *)(*(void *)(a1 + 40) + 88)];
  id v12 = (id)[*(id *)(a1 + 32) appendFloat:@"accessoryPadding" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 96)];
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", @"accessoryMaxSize", *(double *)(*(void *)(a1 + 40) + 104), *(double *)(*(void *)(a1 + 40) + 112));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke;
  v71[3] = &unk_1E56C8418;
  id v10 = v9;
  id v72 = v10;
  id v11 = (id)objc_msgSend(v5, "appendCGPoint:counterpart:", v71, self->_circleCenter.x, self->_circleCenter.y);
  double circleRadius = self->_circleRadius;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_2;
  v69[3] = &unk_1E56C8440;
  id v13 = v10;
  id v70 = v13;
  id v14 = (id)[v5 appendCGFloat:v69 counterpart:circleRadius];
  double maximumAngularWidth = self->_maximumAngularWidth;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_3;
  v67[3] = &unk_1E56C8440;
  id v16 = v13;
  id v68 = v16;
  id v17 = (id)[v5 appendCGFloat:v67 counterpart:maximumAngularWidth];
  double centerAngle = self->_centerAngle;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_4;
  v65[3] = &unk_1E56C8440;
  id v19 = v16;
  id v66 = v19;
  id v20 = (id)[v5 appendCGFloat:v65 counterpart:centerAngle];
  bezierPath = self->_bezierPath;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_5;
  v63[3] = &unk_1E56C81C8;
  id v22 = v19;
  id v64 = v22;
  id v23 = (id)[v5 appendObject:bezierPath counterpart:v63];
  BOOL interior = self->_interior;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_6;
  v61[3] = &unk_1E56C8468;
  id v25 = v22;
  id v62 = v25;
  id v26 = (id)[v5 appendBool:interior counterpart:v61];
  double tracking = self->_tracking;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_7;
  v59[3] = &unk_1E56C8440;
  id v28 = v25;
  id v60 = v28;
  id v29 = (id)[v5 appendCGFloat:v59 counterpart:tracking];
  double fontSize = self->_fontSize;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_8;
  v57[3] = &unk_1E56C8440;
  id v31 = v28;
  id v58 = v31;
  id v32 = (id)[v5 appendCGFloat:v57 counterpart:fontSize];
  textColor = self->_textColor;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_9;
  v55[3] = &unk_1E56C8490;
  id v34 = v31;
  id v56 = v34;
  id v35 = (id)[v5 appendObject:textColor counterpart:v55];
  unint64_t accessoryPlacement = self->_accessoryPlacement;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_10;
  v53[3] = &unk_1E56C84B8;
  id v37 = v34;
  id v54 = v37;
  id v38 = (id)[v5 appendUnsignedInteger:accessoryPlacement counterpart:v53];
  double accessoryPadding = self->_accessoryPadding;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_11;
  v51[3] = &unk_1E56C8440;
  id v40 = v37;
  id v52 = v40;
  id v41 = (id)[v5 appendCGFloat:v51 counterpart:accessoryPadding];
  uint64_t v46 = MEMORY[0x1E4F143A8];
  uint64_t v47 = 3221225472;
  v48 = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_12;
  v49 = &unk_1E56C84E0;
  id v42 = v40;
  id v50 = v42;
  id v43 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", &v46, self->_accessoryMaxSize.width, self->_accessoryMaxSize.height);
  char v44 = objc_msgSend(v5, "isEqual", v46, v47, v48, v49);

  return v44;
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) circleCenter];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) circleRadius];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) maximumAngularWidth];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) centerAngle];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) bezierPath];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) interior];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) tracking];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) fontSize];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) textColor];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryPlacement];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryPadding];
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessoryMaxSize];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendCGPoint:", self->_circleCenter.x, self->_circleCenter.y);
  id v5 = (id)[v3 appendCGFloat:self->_circleRadius];
  id v6 = (id)[v3 appendCGFloat:self->_maximumAngularWidth];
  id v7 = (id)[v3 appendCGFloat:self->_centerAngle];
  id v8 = (id)[v3 appendObject:self->_bezierPath];
  id v9 = (id)[v3 appendBool:self->_interior];
  id v10 = (id)[v3 appendCGFloat:self->_tracking];
  id v11 = (id)[v3 appendCGFloat:self->_fontSize];
  id v12 = (id)[v3 appendObject:self->_textColor];
  id v13 = (id)[v3 appendUnsignedInteger:self->_accessoryPlacement];
  id v14 = (id)[v3 appendCGFloat:self->_accessoryPadding];
  id v15 = (id)objc_msgSend(v3, "appendCGSize:", self->_accessoryMaxSize.width, self->_accessoryMaxSize.height);
  unint64_t v16 = [v3 hash];

  return v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHSMutableWatchComplicationsCurvedLabelMetrics alloc];
  return [(CHSWatchComplicationsCurvedLabelMetrics *)v4 _initWithInstance:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = BSValueWithPoint();
  [v7 encodeObject:v4 forKey:@"circleCenter"];

  [v7 encodeDouble:@"circleRadius" forKey:self->_circleRadius];
  [v7 encodeDouble:@"maximumAngularWidth" forKey:self->_maximumAngularWidth];
  [v7 encodeDouble:@"centerAngle" forKey:self->_centerAngle];
  [v7 encodeObject:self->_bezierPath forKey:@"bezierPath"];
  [v7 encodeBool:self->_interior forKey:@"interior"];
  [v7 encodeDouble:@"tracking" forKey:self->_tracking];
  [v7 encodeDouble:@"fontSize" forKey:self->_fontSize];
  [v7 encodeObject:self->_textColor forKey:@"textColor"];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_accessoryPlacement];
  [v7 encodeObject:v5 forKey:@"accessoryPlacement"];

  [v7 encodeDouble:@"accessoryPadding" forKey:self->_accessoryPadding];
  id v6 = BSValueWithSize();
  [v7 encodeObject:v6 forKey:@"accessoryMaxSize"];
}

- (CHSWatchComplicationsCurvedLabelMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  id v5 = [(CHSWatchComplicationsCurvedLabelMetrics *)&v22 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"circleCenter"];
    v5->_circleCenter.x = MEMORY[0x192FD6A20]();
    v5->_circleCenter.y = v7;

    [v4 decodeDoubleForKey:@"circleRadius"];
    v5->_double circleRadius = v8;
    [v4 decodeDoubleForKey:@"maximumAngularWidth"];
    v5->_double maximumAngularWidth = v9;
    [v4 decodeDoubleForKey:@"centerAngle"];
    v5->_double centerAngle = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bezierPath"];
    bezierPath = v5->_bezierPath;
    v5->_bezierPath = (CHSBezierPath *)v11;

    v5->_BOOL interior = [v4 decodeBoolForKey:@"interior"];
    [v4 decodeDoubleForKey:@"tracking"];
    v5->_double tracking = v13;
    [v4 decodeDoubleForKey:@"fontSize"];
    v5->_double fontSize = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
    textColor = v5->_textColor;
    v5->_textColor = (BSColor *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryPlacement"];
    v5->_unint64_t accessoryPlacement = [v17 unsignedIntegerValue];

    [v4 decodeDoubleForKey:@"accessoryPadding"];
    v5->_double accessoryPadding = v18;
    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryMaxSize"];
    v5->_accessoryMaxSize.width = MEMORY[0x192FD6A90]();
    v5->_accessoryMaxSize.height = v20;
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"circleCenter", self->_circleCenter.x, self->_circleCenter.y);
  [v4 encodeDouble:@"circleRadius" forKey:self->_circleRadius];
  [v4 encodeDouble:@"maximumAngularWidth" forKey:self->_maximumAngularWidth];
  [v4 encodeDouble:@"centerAngle" forKey:self->_centerAngle];
  [v4 encodeObject:self->_bezierPath forKey:@"bezierPath"];
  [v4 encodeBool:self->_interior forKey:@"interior"];
  [v4 encodeDouble:@"tracking" forKey:self->_tracking];
  [v4 encodeDouble:@"fontSize" forKey:self->_fontSize];
  [v4 encodeObject:self->_textColor forKey:@"textColor"];
  [v4 encodeUInt64:self->_accessoryPlacement forKey:@"accessoryPlacement"];
  [v4 encodeDouble:@"accessoryPadding" forKey:self->_accessoryPadding];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"accessoryMaxSize", self->_accessoryMaxSize.width, self->_accessoryMaxSize.height);
}

- (CHSWatchComplicationsCurvedLabelMetrics)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  id v5 = [(CHSWatchComplicationsCurvedLabelMetrics *)&v21 init];
  if (v5)
  {
    [v4 decodeCGPointForKey:@"circleCenter"];
    v5->_circleCenter.x = v6;
    v5->_circleCenter.y = v7;
    [v4 decodeDoubleForKey:@"circleRadius"];
    v5->_double circleRadius = v8;
    [v4 decodeDoubleForKey:@"maximumAngularWidth"];
    v5->_double maximumAngularWidth = v9;
    [v4 decodeDoubleForKey:@"centerAngle"];
    v5->_double centerAngle = v10;
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bezierPath"];
    bezierPath = v5->_bezierPath;
    v5->_bezierPath = (CHSBezierPath *)v11;

    v5->_BOOL interior = [v4 decodeBoolForKey:@"interior"];
    [v4 decodeDoubleForKey:@"tracking"];
    v5->_double tracking = v13;
    [v4 decodeDoubleForKey:@"fontSize"];
    v5->_double fontSize = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textColor"];
    textColor = v5->_textColor;
    v5->_textColor = (BSColor *)v15;

    v5->_unint64_t accessoryPlacement = [v4 decodeUInt64ForKey:@"accessoryPlacement"];
    [v4 decodeDoubleForKey:@"accessoryPadding"];
    v5->_double accessoryPadding = v17;
    [v4 decodeCGSizeForKey:@"accessoryMaxSize"];
    v5->_accessoryMaxSize.width = v18;
    v5->_accessoryMaxSize.height = v19;
  }

  return v5;
}

- (id)_filenameSafeStableHash
{
  id v8 = 0;
  id v3 = [MEMORY[0x1E4F960F8] encodeObject:self error:&v8];
  id v4 = v8;
  if (v4)
  {
    id v5 = CHSLogChronoServices();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CHSWatchComplicationsCurvedLabelMetrics *)(uint64_t)v4 _filenameSafeStableHash];
    }
  }
  CGFloat v6 = [(CHSWatchComplicationsCurvedLabelMetrics *)self _filenameSafeStableHashFromData:v3];

  return v6;
}

- (id)_filenameSafeStableHashFromData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x192FD70A0]();
    id v5 = v3;
    if (CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), md))
    {
      CGFloat v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
      CGFloat v7 = [v6 base64EncodedStringWithOptions:0];
      uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@"#"];

      double v9 = (void *)v8;
    }
    else
    {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (CGPoint)circleCenter
{
  double x = self->_circleCenter.x;
  double y = self->_circleCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (double)maximumAngularWidth
{
  return self->_maximumAngularWidth;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (CHSBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (BOOL)interior
{
  return self->_interior;
}

- (double)tracking
{
  return self->_tracking;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BSColor)textColor
{
  return self->_textColor;
}

- (unint64_t)accessoryPlacement
{
  return self->_accessoryPlacement;
}

- (double)accessoryPadding
{
  return self->_accessoryPadding;
}

- (CGSize)accessoryMaxSize
{
  double width = self->_accessoryMaxSize.width;
  double height = self->_accessoryMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);
}

- (void)_filenameSafeStableHash
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190C6F000, a2, OS_LOG_TYPE_ERROR, "Error encoding object: %@", (uint8_t *)&v2, 0xCu);
}

@end