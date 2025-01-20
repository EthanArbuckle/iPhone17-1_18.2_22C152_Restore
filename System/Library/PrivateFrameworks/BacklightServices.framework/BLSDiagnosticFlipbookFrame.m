@interface BLSDiagnosticFlipbookFrame
+ (BOOL)supportsSecureCoding;
+ (id)createWithFrame:(id)a3;
- (BLSDiagnosticFlipbookFrame)initWithCoder:(id)a3;
- (BLSDiagnosticFlipbookFrame)initWithFrame:(id)a3;
- (BLSDiagnosticFlipbookFrame)initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 apl:(float)a5 aplDimming:(float)a6 memoryUsage:(unint64_t)a7 rawSurfaceFrameRect:(CGRect)a8 inverted:(BOOL)a9 specifier:(id)a10 uuid:(id)a11;
- (BLSDiagnosticFlipbookFrame)initWithXPCDictionary:(id)a3;
- (BLSDiagnosticFlipbookFrameSurfaceProvider)surfaceProvider;
- (BLSPresentationDateSpecifying)bls_specifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInverted;
- (CGRect)rawSurfaceFrame;
- (NSUUID)uuid;
- (__IOSurface)rawSurface;
- (__IOSurface)surface;
- (float)apl;
- (float)aplDimming;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (unint64_t)frameId;
- (unint64_t)hash;
- (unint64_t)memoryUsage;
- (unint64_t)presentationTime;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setSurfaceProvider:(id)a3;
@end

@implementation BLSDiagnosticFlipbookFrame

+ (id)createWithFrame:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)[objc_alloc((Class)a1) initWithFrame:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BLSDiagnosticFlipbookFrame)initWithFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 presentationTime];
  uint64_t v6 = [v4 frameId];
  [v4 apl];
  int v8 = v7;
  [v4 aplDimming];
  int v10 = v9;
  uint64_t v11 = [v4 memoryUsage];
  [v4 rawSurfaceFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [v4 isInverted];
  v21 = objc_msgSend(v4, "bls_specifier");
  v22 = objc_msgSend(v4, "bls_uuid");

  LODWORD(v23) = v8;
  LODWORD(v24) = v10;
  v25 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](self, "initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:", v5, v6, v11, v20, v21, v22, v23, v24, v13, v15, v17, v19);

  return v25;
}

- (BLSDiagnosticFlipbookFrame)initWithPresentationTime:(unint64_t)a3 frameId:(unint64_t)a4 apl:(float)a5 aplDimming:(float)a6 memoryUsage:(unint64_t)a7 rawSurfaceFrameRect:(CGRect)a8 inverted:(BOOL)a9 specifier:(id)a10 uuid:(id)a11
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  id v23 = a10;
  id v24 = a11;
  v32.receiver = self;
  v32.super_class = (Class)BLSDiagnosticFlipbookFrame;
  v25 = [(BLSDiagnosticFlipbookFrame *)&v32 init];
  v26 = v25;
  if (v25)
  {
    v25->_presentationTime = a3;
    v25->_frameId = a4;
    v25->_apl = a5;
    v25->_aplDimming = a6;
    v25->_memoryUsage = a7;
    v25->_rawSurfaceFrame.origin.CGFloat x = x;
    v25->_rawSurfaceFrame.origin.CGFloat y = y;
    v25->_rawSurfaceFrame.size.CGFloat width = width;
    v25->_rawSurfaceFrame.size.CGFloat height = height;
    v25->_inverted = a9;
    uint64_t v27 = +[BLSDiagnosticPresentationDateSpecifier createWithSpecifier:v23];
    specifier = v26->_specifier;
    v26->_specifier = (BLSDiagnosticPresentationDateSpecifier *)v27;

    if (v24)
    {
      v29 = (NSUUID *)v24;
    }
    else
    {
      v29 = [MEMORY[0x1E4F29128] UUID];
    }
    uuid = v26->_uuid;
    v26->_uuid = v29;
  }
  return v26;
}

- (BLSPresentationDateSpecifying)bls_specifier
{
  return (BLSPresentationDateSpecifying *)self->_specifier;
}

- (__IOSurface)surface
{
  v3 = [(BLSDiagnosticFlipbookFrame *)self surfaceProvider];
  id v4 = (__IOSurface *)[v3 surfaceForFrame:self];

  return v4;
}

- (__IOSurface)rawSurface
{
  v3 = [(BLSDiagnosticFlipbookFrame *)self surfaceProvider];
  id v4 = (__IOSurface *)[v3 rawSurfaceForFrame:self];

  return v4;
}

- (id)bls_loggingString
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = BLSLoggingStringForMachTime([(BLSDiagnosticFlipbookFrame *)self presentationTime]);
  [v3 appendString:v4 withName:@"presentationTime"];

  id v5 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSDiagnosticFlipbookFrame frameId](self, "frameId"), @"frameId");
  uint64_t v6 = [(BLSDiagnosticFlipbookFrame *)self bls_specifier];
  int v7 = objc_msgSend(v6, "bls_loggingString");
  id v8 = (id)[v3 appendObject:v7 withName:@"specifier"];

  int v9 = +[BLSMemoryByteCountFormatter sharedFormatter];
  int v10 = objc_msgSend(v9, "stringFromByteCount:", -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage"));
  id v11 = (id)[v3 appendObject:v10 withName:@"memoryUsage"];

  [(BLSDiagnosticFlipbookFrame *)self apl];
  id v13 = (id)[v3 appendFloat:@"apl" withName:3 decimalPrecision:v12];
  [(BLSDiagnosticFlipbookFrame *)self aplDimming];
  id v15 = (id)[v3 appendFloat:@"dimming" withName:3 decimalPrecision:v14];
  [(BLSDiagnosticFlipbookFrame *)self rawSurfaceFrame];
  id v16 = (id)objc_msgSend(v3, "appendRect:withName:", @"rawSurfaceFrame");
  id v17 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted"), @"inverted", 1);
  double v18 = [(BLSDiagnosticFlipbookFrame *)self uuid];
  double v19 = [v18 UUIDString];
  id v20 = (id)[v3 appendObject:v19 withName:@"uuid"];

  v21 = [v3 build];

  return v21;
}

- (id)bls_shortLoggingString
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", -[BLSDiagnosticFlipbookFrame frameId](self, "frameId"), @"frameId");
  id v5 = [(BLSDiagnosticFlipbookFrame *)self bls_specifier];
  if (v5)
  {
    uint64_t v6 = [(BLSDiagnosticFlipbookFrame *)self bls_specifier];
    int v7 = objc_msgSend(v6, "bls_shortLoggingString");
    [v3 appendString:v7 withName:&stru_1F0E40740];
  }
  else
  {
    uint64_t v6 = BLSShortLoggingStringForMachTime([(BLSDiagnosticFlipbookFrame *)self presentationTime]);
    [v3 appendString:v6 withName:&stru_1F0E40740];
  }

  id v8 = +[BLSMemoryByteCountFormatter sharedFormatter];
  int v9 = objc_msgSend(v8, "stringFromByteCount:", -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage"));
  id v10 = (id)[v3 appendObject:v9 withName:@"memoryUsage"];

  [(BLSDiagnosticFlipbookFrame *)self apl];
  id v12 = (id)[v3 appendFloat:@"apl" withName:3 decimalPrecision:v11];
  [(BLSDiagnosticFlipbookFrame *)self aplDimming];
  id v14 = (id)[v3 appendFloat:@"dimming" withName:3 decimalPrecision:v13];
  [(BLSDiagnosticFlipbookFrame *)self rawSurfaceFrame];
  id v15 = (id)objc_msgSend(v3, "appendRect:withName:", @"rawSurfaceFrame");
  id v16 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted"), @"inverted", 1);
  id v17 = [(BLSDiagnosticFlipbookFrame *)self uuid];
  double v18 = [v17 UUIDString];
  id v19 = (id)[v3 appendObject:v18 withName:@"uuid"];

  id v20 = [v3 build];

  return v20;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendInt64:", -[BLSDiagnosticFlipbookFrame presentationTime](self, "presentationTime"));
  id v5 = (id)objc_msgSend(v3, "appendInt64:", -[BLSDiagnosticFlipbookFrame frameId](self, "frameId"));
  uint64_t v6 = [(BLSDiagnosticFlipbookFrame *)self bls_specifier];
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", objc_msgSend(v6, "hash"));

  id v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[BLSDiagnosticFlipbookFrame memoryUsage](self, "memoryUsage"));
  [(BLSDiagnosticFlipbookFrame *)self rawSurfaceFrame];
  id v9 = (id)objc_msgSend(v3, "appendCGRect:");
  [(BLSDiagnosticFlipbookFrame *)self apl];
  id v10 = (id)objc_msgSend(v3, "appendFloat:");
  [(BLSDiagnosticFlipbookFrame *)self aplDimming];
  id v11 = (id)objc_msgSend(v3, "appendFloat:");
  id v12 = (id)objc_msgSend(v3, "appendBool:", -[BLSDiagnosticFlipbookFrame isInverted](self, "isInverted"));
  unint64_t v13 = [v3 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(BLSDiagnosticFlipbookFrame *)self presentationTime];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke;
  v57[3] = &unk_1E6107400;
  id v7 = v4;
  id v58 = v7;
  id v8 = (id)[v5 appendInt64:v6 counterpart:v57];
  unint64_t v9 = [(BLSDiagnosticFlipbookFrame *)self frameId];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_2;
  v55[3] = &unk_1E6107400;
  id v10 = v7;
  id v56 = v10;
  id v11 = (id)[v5 appendInt64:v9 counterpart:v55];
  id v12 = [(BLSDiagnosticFlipbookFrame *)self bls_specifier];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_3;
  v53[3] = &unk_1E61078A8;
  id v13 = v10;
  id v54 = v13;
  id v14 = (id)[v5 appendObject:v12 counterpart:v53];

  unint64_t v15 = [(BLSDiagnosticFlipbookFrame *)self memoryUsage];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_4;
  v51[3] = &unk_1E61078D0;
  id v16 = v13;
  id v52 = v16;
  id v17 = (id)[v5 appendUnsignedInteger:v15 counterpart:v51];
  [(BLSDiagnosticFlipbookFrame *)self rawSurfaceFrame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_5;
  v49[3] = &unk_1E61078F8;
  id v26 = v16;
  id v50 = v26;
  id v27 = (id)objc_msgSend(v5, "appendCGRect:counterpart:", v49, v19, v21, v23, v25);
  [(BLSDiagnosticFlipbookFrame *)self apl];
  LODWORD(v19) = v28;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_6;
  v47[3] = &unk_1E6107920;
  id v29 = v26;
  id v48 = v29;
  LODWORD(v30) = LODWORD(v19);
  id v31 = (id)[v5 appendFloat:v47 counterpart:v30];
  [(BLSDiagnosticFlipbookFrame *)self aplDimming];
  LODWORD(v19) = v32;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_7;
  v45[3] = &unk_1E6107920;
  id v33 = v29;
  id v46 = v33;
  LODWORD(v34) = LODWORD(v19);
  id v35 = (id)[v5 appendFloat:v45 counterpart:v34];
  BOOL v36 = [(BLSDiagnosticFlipbookFrame *)self isInverted];
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_8;
  v43 = &unk_1E6107880;
  id v44 = v33;
  id v37 = v33;
  id v38 = (id)[v5 appendBool:v36 counterpart:&v40];
  LOBYTE(v33) = objc_msgSend(v5, "isEqual", v40, v41, v42, v43);

  return (char)v33;
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentationTime];
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) frameId];
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bls_specifier");
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) memoryUsage];
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) rawSurfaceFrame];
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) apl];
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) aplDimming];
}

uint64_t __38__BLSDiagnosticFlipbookFrame_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) isInverted];
}

- (BLSDiagnosticFlipbookFrame)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, (const char *)[@"presentationTime" UTF8String]);
  uint64_t v6 = xpc_dictionary_get_uint64(v4, (const char *)[@"frameId" UTF8String]);
  double v7 = xpc_dictionary_get_double(v4, (const char *)[@"apl" UTF8String]);
  double v8 = xpc_dictionary_get_double(v4, (const char *)[@"dimming" UTF8String]);
  uint64_t v9 = xpc_dictionary_get_uint64(v4, (const char *)[@"memoryUsage" UTF8String]);
  [@"rawSurfaceFrame" UTF8String];
  BSDeserializeCGRectFromXPCDictionaryWithKey();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  BOOL v18 = xpc_dictionary_get_BOOL(v4, (const char *)[@"inverted" UTF8String]);
  double v19 = xpc_dictionary_get_dictionary(v4, (const char *)[@"specifier" UTF8String]);
  if (v19)
  {
    double v20 = [[BLSDiagnosticPresentationDateSpecifier alloc] initWithXPCDictionary:v19];
  }
  else
  {
    double v21 = bls_diagnostics_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BLSDiagnosticFlipbookFrame initWithXPCDictionary:]();
    }

    double v20 = 0;
  }
  double v22 = xpc_dictionary_get_value(v4, (const char *)[@"uuid" UTF8String]);
  if (v22)
  {
    double v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v22)];
  }
  else
  {
    id v26 = bls_diagnostics_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[BLSDiagnosticFlipbookFrame initWithXPCDictionary:]();
    }

    double v23 = 0;
  }
  *(float *)&double v25 = v8;
  *(float *)&double v24 = v7;
  id v27 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](self, "initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:", uint64, v6, v9, v18, v20, v23, v24, v25, v11, v13, v15, v17);

  return v27;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_dictionary_set_uint64(v4, (const char *)[@"presentationTime" UTF8String], self->_presentationTime);
  xpc_dictionary_set_uint64(v4, (const char *)[@"frameId" UTF8String], self->_frameId);
  xpc_dictionary_set_double(v4, (const char *)[@"apl" UTF8String], self->_apl);
  xpc_dictionary_set_double(v4, (const char *)[@"dimming" UTF8String], self->_aplDimming);
  xpc_dictionary_set_uint64(v4, (const char *)[@"memoryUsage" UTF8String], self->_memoryUsage);
  [@"rawSurfaceFrame" UTF8String];
  BSSerializeCGRectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(v4, (const char *)[@"inverted" UTF8String], self->_inverted);
  id v5 = (const char *)[@"specifier" UTF8String];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  [(BLSDiagnosticPresentationDateSpecifier *)self->_specifier encodeWithXPCDictionary:v6];
  xpc_dictionary_set_value(v4, v5, v6);
  double v7 = (const char *)[@"uuid" UTF8String];
  *(void *)uuid = 0;
  uint64_t v10 = 0;
  [(NSUUID *)self->_uuid getUUIDBytes:uuid];
  xpc_object_t v8 = xpc_uuid_create(uuid);
  xpc_dictionary_set_value(v4, v7, v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSDiagnosticFlipbookFrame)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"presentationTime"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"frameId"];
  [v4 decodeFloatForKey:@"apl"];
  int v8 = v7;
  [v4 decodeFloatForKey:@"dimming"];
  int v10 = v9;
  uint64_t v11 = [v4 decodeIntegerForKey:@"memoryUsage"];
  double v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawSurfaceFrame"];
  objc_msgSend(v12, "bs_CGRectValue");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v4 decodeBoolForKey:@"inverted"];
  double v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifier"];
  double v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];

  LODWORD(v24) = v8;
  LODWORD(v25) = v10;
  id v26 = -[BLSDiagnosticFlipbookFrame initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:](self, "initWithPresentationTime:frameId:apl:aplDimming:memoryUsage:rawSurfaceFrameRect:inverted:specifier:uuid:", v5, v6, v11, v21, v22, v23, v24, v25, v14, v16, v18, v20);

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t presentationTime = self->_presentationTime;
  id v8 = a3;
  [v8 encodeInt64:presentationTime forKey:@"presentationTime"];
  [v8 encodeInt64:self->_frameId forKey:@"frameId"];
  *(float *)&double v5 = self->_apl;
  [v8 encodeFloat:@"apl" forKey:v5];
  *(float *)&double v6 = self->_aplDimming;
  [v8 encodeFloat:@"dimming" forKey:v6];
  [v8 encodeInteger:self->_memoryUsage forKey:@"memoryUsage"];
  int v7 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", self->_rawSurfaceFrame.origin.x, self->_rawSurfaceFrame.origin.y, self->_rawSurfaceFrame.size.width, self->_rawSurfaceFrame.size.height);
  [v8 encodeObject:v7 forKey:@"rawSurfaceFrame"];

  [v8 encodeBool:self->_inverted forKey:@"inverted"];
  [v8 encodeObject:self->_specifier forKey:@"specifier"];
  [v8 encodeObject:self->_uuid forKey:@"uuid"];
}

- (unint64_t)presentationTime
{
  return self->_presentationTime;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (float)apl
{
  return self->_apl;
}

- (float)aplDimming
{
  return self->_aplDimming;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (CGRect)rawSurfaceFrame
{
  double x = self->_rawSurfaceFrame.origin.x;
  double y = self->_rawSurfaceFrame.origin.y;
  double width = self->_rawSurfaceFrame.size.width;
  double height = self->_rawSurfaceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BLSDiagnosticFlipbookFrameSurfaceProvider)surfaceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_surfaceProvider);

  return (BLSDiagnosticFlipbookFrameSurfaceProvider *)WeakRetained;
}

- (void)setSurfaceProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_surfaceProvider);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

- (void)initWithXPCDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1B55DE000, v0, v1, "uuid missing from encoding: %@", v2, v3, v4, v5, v6);
}

- (void)initWithXPCDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1B55DE000, v0, v1, "specifier missing from encoding: %@", v2, v3, v4, v5, v6);
}

@end