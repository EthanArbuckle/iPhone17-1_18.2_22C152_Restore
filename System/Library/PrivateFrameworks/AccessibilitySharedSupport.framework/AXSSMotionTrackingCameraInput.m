@interface AXSSMotionTrackingCameraInput
+ (BOOL)supportsSecureCoding;
+ (id)captureDeviceForMotionTrackingInput:(id)a3;
+ (id)motionTrackingCameraInputWithAVCaptureDevice:(id)a3;
- (AXSSMotionTrackingCameraInput)initWithCaptureDeviceUniqueID:(id)a3 name:(id)a4 isBuiltIn:(BOOL)a5 trackingType:(unint64_t)a6;
- (AXSSMotionTrackingCameraInput)initWithCoder:(id)a3;
- (AXSSMotionTrackingCameraInput)initWithPlistDictionary:(id)a3;
- (BOOL)isBuiltIn;
- (BOOL)isCamera;
- (BOOL)supportsExpressions;
- (NSString)captureDeviceUniqueID;
- (NSString)name;
- (id)description;
- (id)plistDictionary;
- (unint64_t)trackingType;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureDeviceUniqueID:(id)a3;
- (void)setIsBuiltIn:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setTrackingType:(unint64_t)a3;
@end

@implementation AXSSMotionTrackingCameraInput

+ (id)captureDeviceForMotionTrackingInput:(id)a3
{
  id v3 = a3;
  v4 = [v3 captureDeviceUniqueID];
  if ([v4 length])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v5 = (void *)getAVCaptureDeviceClass_softClass;
    uint64_t v13 = getAVCaptureDeviceClass_softClass;
    if (!getAVCaptureDeviceClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getAVCaptureDeviceClass_block_invoke;
      v9[3] = &unk_1E606CF80;
      v9[4] = &v10;
      __getAVCaptureDeviceClass_block_invoke((uint64_t)v9);
      v5 = (void *)v11[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v10, 8);
    v7 = [v6 deviceWithUniqueID:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)motionTrackingCameraInputWithAVCaptureDevice:(id)a3
{
  id v3 = a3;
  v4 = [v3 uniqueID];
  v5 = [v3 localizedName];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v6 = (void *)getAVMediaTypeVideoSymbolLoc_ptr;
  uint64_t v19 = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    v7 = (void *)AVFoundationLibrary();
    v17[3] = (uint64_t)dlsym(v7, "AVMediaTypeVideo");
    getAVMediaTypeVideoSymbolLoc_ptr = v17[3];
    id v6 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v6)
  {
    v15 = (_Unwind_Exception *)+[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:]();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  if ([v3 hasMediaType:*v6]
    && (getAVMediaTypeMetadataObject(),
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v3 hasMediaType:v8],
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = 3;
  }
  else
  {
    v11 = getAVMediaTypeMetadataObject();
    unsigned int v12 = [v3 hasMediaType:v11];

    uint64_t v10 = v12;
  }
  if ([v4 length]) {
    uint64_t v13 = [[AXSSMotionTrackingCameraInput alloc] initWithCaptureDeviceUniqueID:v4 name:v5 isBuiltIn:1 trackingType:v10];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

- (AXSSMotionTrackingCameraInput)initWithCaptureDeviceUniqueID:(id)a3 name:(id)a4 isBuiltIn:(BOOL)a5 trackingType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 length])
  {
    v19.receiver = self;
    v19.super_class = (Class)AXSSMotionTrackingCameraInput;
    unsigned int v12 = [(AXSSMotionTrackingInput *)&v19 init];
    if (v12)
    {
      uint64_t v13 = [v10 copy];
      captureDeviceUniqueID = v12->_captureDeviceUniqueID;
      v12->_captureDeviceUniqueID = (NSString *)v13;

      uint64_t v15 = [v11 copy];
      name = v12->_name;
      v12->_name = (NSString *)v15;

      v12->_isBuiltIn = a5;
      v12->_trackingType = a6;
    }
    self = v12;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(AXSSMotionTrackingCameraInput *)self captureDeviceUniqueID];

  if (v4)
  {
    v5 = [(AXSSMotionTrackingCameraInput *)self captureDeviceUniqueID];
    id v6 = NSStringFromSelector(sel_captureDeviceUniqueID);
    [v14 encodeObject:v5 forKey:v6];
  }
  v7 = [(AXSSMotionTrackingCameraInput *)self name];

  if (v7)
  {
    v8 = [(AXSSMotionTrackingCameraInput *)self name];
    char v9 = NSStringFromSelector(sel_name);
    [v14 encodeObject:v8 forKey:v9];
  }
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingCameraInput isBuiltIn](self, "isBuiltIn"));
  id v11 = NSStringFromSelector(sel_isBuiltIn);
  [v14 encodeObject:v10 forKey:v11];

  unsigned int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSSMotionTrackingCameraInput trackingType](self, "trackingType"));
  uint64_t v13 = NSStringFromSelector(sel_trackingType);
  [v14 encodeObject:v12 forKey:v13];
}

- (AXSSMotionTrackingCameraInput)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_captureDeviceUniqueID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  char v9 = NSStringFromSelector(sel_name);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  unsigned int v12 = NSStringFromSelector(sel_isBuiltIn);
  uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
  uint64_t v14 = [v13 BOOLValue];

  uint64_t v15 = objc_opt_class();
  uint64_t v16 = NSStringFromSelector(sel_trackingType);
  v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

  uint64_t v18 = [v17 integerValue];
  objc_super v19 = [(AXSSMotionTrackingCameraInput *)self initWithCaptureDeviceUniqueID:v7 name:v10 isBuiltIn:v14 trackingType:v18];

  return v19;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AXSSMotionTrackingCameraInput;
  id v4 = [(AXSSMotionTrackingCameraInput *)&v9 description];
  uint64_t v5 = [(AXSSMotionTrackingCameraInput *)self captureDeviceUniqueID];
  id v6 = [(AXSSMotionTrackingCameraInput *)self name];
  v7 = [v3 stringWithFormat:@"%@ <%@, %@, %d>", v4, v5, v6, -[AXSSMotionTrackingCameraInput isBuiltIn](self, "isBuiltIn")];

  return v7;
}

- (id)plistDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v15.receiver = self;
  v15.super_class = (Class)AXSSMotionTrackingCameraInput;
  id v4 = [(AXSSMotionTrackingInput *)&v15 plistDictionary];
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }
  uint64_t v5 = [(AXSSMotionTrackingCameraInput *)self captureDeviceUniqueID];
  id v6 = NSStringFromSelector(sel_captureDeviceUniqueID);
  [v3 setObject:v5 forKeyedSubscript:v6];

  v7 = [(AXSSMotionTrackingCameraInput *)self name];
  uint64_t v8 = NSStringFromSelector(sel_name);
  [v3 setObject:v7 forKeyedSubscript:v8];

  objc_super v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSSMotionTrackingCameraInput isBuiltIn](self, "isBuiltIn"));
  id v10 = NSStringFromSelector(sel_isBuiltIn);
  [v3 setObject:v9 forKeyedSubscript:v10];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSSMotionTrackingCameraInput trackingType](self, "trackingType"));
  unsigned int v12 = NSStringFromSelector(sel_trackingType);
  [v3 setObject:v11 forKeyedSubscript:v12];

  uint64_t v13 = (void *)[v3 copy];

  return v13;
}

- (AXSSMotionTrackingCameraInput)initWithPlistDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_captureDeviceUniqueID);
  id v6 = [v4 objectForKeyedSubscript:v5];

  v7 = NSStringFromSelector(sel_name);
  uint64_t v8 = [v4 objectForKeyedSubscript:v7];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 length]) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = NSStringFromSelector(sel_isBuiltIn);
  uint64_t v11 = [v4 objectForKeyedSubscript:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = [v11 BOOLValue];
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = NSStringFromSelector(sel_trackingType);
  uint64_t v14 = [v4 objectForKeyedSubscript:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = [v14 unsignedIntegerValue];
  }
  else {
    uint64_t v15 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
  {
    self = [(AXSSMotionTrackingCameraInput *)self initWithCaptureDeviceUniqueID:v6 name:v9 isBuiltIn:v12 trackingType:v15];
    uint64_t v16 = self;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)supportsExpressions
{
  return 1;
}

- (BOOL)isCamera
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)trackingType
{
  return self->_trackingType;
}

- (void)setTrackingType:(unint64_t)a3
{
  self->_trackingType = a3;
}

- (NSString)captureDeviceUniqueID
{
  return self->_captureDeviceUniqueID;
}

- (void)setCaptureDeviceUniqueID:(id)a3
{
}

- (BOOL)isBuiltIn
{
  return self->_isBuiltIn;
}

- (void)setIsBuiltIn:(BOOL)a3
{
  self->_isBuiltIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureDeviceUniqueID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (uint64_t)motionTrackingCameraInputWithAVCaptureDevice:.cold.1()
{
  return __getAVCaptureDeviceClass_block_invoke_cold_1();
}

@end