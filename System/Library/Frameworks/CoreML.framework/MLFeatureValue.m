@interface MLFeatureValue
+ (BOOL)supportsSecureCoding;
+ (CGRect)cropRectFromOptions:(id)a3;
+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithDictionary:(NSDictionary *)value error:(NSError *)error;
+ (MLFeatureValue)featureValueWithDouble:(double)value;
+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url orientation:(CGImagePropertyOrientation)orientation constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url orientation:(CGImagePropertyOrientation)orientation pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error;
+ (MLFeatureValue)featureValueWithInt64:(int64_t)value;
+ (MLFeatureValue)featureValueWithInt64KeyDictionary:(id)a3;
+ (MLFeatureValue)featureValueWithMultiArray:(MLMultiArray *)value;
+ (MLFeatureValue)featureValueWithPixelBuffer:(CVPixelBufferRef)value;
+ (MLFeatureValue)featureValueWithSequence:(MLSequence *)sequence;
+ (MLFeatureValue)featureValueWithState:(id)a3;
+ (MLFeatureValue)featureValueWithString:(NSString *)value;
+ (MLFeatureValue)featureValueWithStringKeyDictionary:(id)a3;
+ (MLFeatureValue)undefinedFeatureValueWithType:(MLFeatureType)type;
+ (id)featureValueOfType:(int64_t)a3 fromObject:(id)a4 error:(id *)a5;
+ (id)internalFeatureValueWithState:(id)a3;
+ (unint64_t)visionCropAndScaleOptionFromOptions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFeatureValue:(MLFeatureValue *)value;
- (BOOL)isUndefined;
- (CVPixelBufferRef)imageBufferValue;
- (MLFeatureType)type;
- (MLFeatureValue)initWithCoder:(id)a3;
- (MLFeatureValue)initWithUndefinedValueAndType:(int64_t)a3;
- (MLFeatureValue)initWithValue:(id)a3 type:(int64_t)a4;
- (MLMultiArray)multiArrayValue;
- (MLSequence)sequenceValue;
- (NSDictionary)dictionaryValue;
- (NSObject)objectValue;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getFeatureSize:(id *)a3;
- (id)getFeatureSize:(id *)a3 ndArrayMode:(BOOL)a4;
- (id)internalStateValue;
- (id)stateValue;
- (id)value;
- (int64_t)int64Value;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setObjectValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MLFeatureValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectValue, 0);

  objc_storeStrong(&self->_value, 0);
}

+ (MLFeatureValue)featureValueWithMultiArray:(MLMultiArray *)value
{
  v4 = value;
  v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:5];

  return (MLFeatureValue *)v5;
}

- (MLFeatureValue)initWithValue:(id)a3 type:(int64_t)a4
{
  v7 = (__CVBuffer *)a3;
  v18.receiver = self;
  v18.super_class = (Class)MLFeatureValue;
  v8 = [(MLFeatureValue *)&v18 init];
  if (v8)
  {
    if (v7 && a4 == 4)
    {
      CVPixelBufferRetain(v7);
    }
    else if (a4 == 8)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v10 = (void *)MEMORY[0x1E4F1C3C8];
      if ((isKindOfClass & 1) == 0)
      {
        v11 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
        }
      }
      v12 = v7;
      v13 = [(__CVBuffer *)v12 backings];
      uint64_t v14 = [v13 count];

      if (v14 != 1)
      {
        v15 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v17 = 0;
          _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "MLState must have one and only one state buffer when it is stored in MLFeatureValue.", v17, 2u);
        }

        [MEMORY[0x1E4F1CA00] raise:*v10 format:@"MLState must have one and only one state buffer when it is stored in MLFeatureValue."];
      }
    }
    objc_storeStrong(&v8->_value, a3);
    v8->_type = a4;
    v8->_undefined = v7 == 0;
  }

  return v8;
}

- (MLFeatureType)type
{
  return self->_type;
}

- (void)dealloc
{
  if (self->_type == 4 && !self->_undefined)
  {
    id value = self->_value;
    if (value) {
      CFRelease(value);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)MLFeatureValue;
  [(MLFeatureValue *)&v4 dealloc];
}

- (MLMultiArray)multiArrayValue
{
  if (self->_type == 5 && !self->_undefined) {
    id v2 = self->_value;
  }
  else {
    id v2 = 0;
  }

  return (MLMultiArray *)v2;
}

- (BOOL)isUndefined
{
  return self->_undefined;
}

- (void)setObjectValue:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (id)stateValue
{
  if (self->_type == 8 && !self->_undefined) {
    id v2 = self->_value;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (MLFeatureValue)initWithCoder:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (int)[v4 decodeIntForKey:@"type"];
  if ([v4 decodeBoolForKey:@"undefined"])
  {
    v6 = [(MLFeatureValue *)self initWithValue:0 type:v5];
  }
  else
  {
    if (v5 == 4)
    {
      size_t v7 = (int)[v4 decodeIntForKey:@"width"];
      size_t v8 = (int)[v4 decodeIntForKey:@"height"];
      OSType v9 = [v4 decodeIntForKey:@"format"];
      size_t v10 = (int)[v4 decodeIntForKey:@"rowBytes"];
      size_t size = 0;
      id v11 = v4;
      v12 = (const void *)[v11 decodeBytesForKey:@"dataPointer" returnedLength:&size];
      v13 = malloc_type_malloc(size, 0x849AF64BuLL);
      memcpy(v13, v12, size);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v25[2] = objc_opt_class();
      v25[3] = objc_opt_class();
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [v14 addObjectsFromArray:v15];

      v16 = [v11 allowedClasses];
      [v14 unionSet:v16];

      CFDictionaryRef pixelBufferAttributes = [v11 decodeObjectOfClasses:v14 forKey:@"attributes"];
      CVPixelBufferRef texture = 0;
      if (CVPixelBufferCreateWithBytes(0, v7, v8, v9, v13, v10, (CVPixelBufferReleaseBytesCallback)deallocator, 0, pixelBufferAttributes, &texture))
      {
        v6 = [(MLFeatureValue *)self initWithValue:0 type:4];
      }
      else
      {
        v6 = [(MLFeatureValue *)self initWithValue:texture type:4];
        CVPixelBufferRelease(texture);
      }
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v24[2] = objc_opt_class();
      v24[3] = objc_opt_class();
      v24[4] = objc_opt_class();
      objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
      [v14 addObjectsFromArray:v18];

      v19 = [v4 allowedClasses];
      [v14 unionSet:v19];

      v20 = [v4 decodeObjectOfClasses:v14 forKey:@"value"];
      v6 = [(MLFeatureValue *)self initWithValue:v20 type:v5];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt:forKey:", -[MLFeatureValue type](self, "type"), @"type");
  objc_msgSend(v6, "encodeBool:forKey:", -[MLFeatureValue isUndefined](self, "isUndefined"), @"undefined");
  if ([(MLFeatureValue *)self type] == MLFeatureTypeImage)
  {
    if ([(MLFeatureValue *)self imageBufferValue])
    {
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetWidth(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), @"width");
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetHeight(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), @"height");
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetPixelFormatType(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), @"format");
      objc_msgSend(v6, "encodeInt:forKey:", CVPixelBufferGetBytesPerRow(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), @"rowBytes");
      if (CVPixelBufferLockBaseAddress([(MLFeatureValue *)self imageBufferValue], 1uLL)) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to lock CVPixelBuffer's base address for serialization."];
      }
      BaseAddress = CVPixelBufferGetBaseAddress([(MLFeatureValue *)self imageBufferValue]);
      objc_msgSend(v6, "encodeBytes:length:forKey:", BaseAddress, CVPixelBufferGetDataSize(-[MLFeatureValue imageBufferValue](self, "imageBufferValue")), @"dataPointer");
      CVPixelBufferUnlockBaseAddress([(MLFeatureValue *)self imageBufferValue], 1uLL);
      [(MLFeatureValue *)self imageBufferValue];
      [v6 encodeObject:CVPixelBufferGetAttributes() forKey:@"attributes"];
    }
  }
  else
  {
    uint64_t v5 = [(MLFeatureValue *)self value];
    [v6 encodeObject:v5 forKey:@"value"];
  }
}

- (id)getFeatureSize:(id *)a3 ndArrayMode:(BOOL)a4
{
  BOOL v4 = a4;
  v52[1] = *MEMORY[0x1E4F143B8];
  size_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  size_t v8 = v7;
  int64_t type = self->_type;
  if (type == 4)
  {
    [v7 setObject:&unk_1EF11A1A8 atIndexedSubscript:0];
    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:1];
    v13 = [(MLFeatureValue *)self imageBufferValue];
    if (CVPixelBufferGetPixelFormatType(v13) == 1278226488) {
      id v14 = &unk_1EF11A1A8;
    }
    else {
      id v14 = &unk_1EF11A1C0;
    }
    [v8 setObject:v14 atIndexedSubscript:2];
    v15 = [NSNumber numberWithUnsignedInteger:CVPixelBufferGetHeight(v13)];
    [v8 setObject:v15 atIndexedSubscript:3];

    v16 = [NSNumber numberWithUnsignedInteger:CVPixelBufferGetWidth(v13)];
    [v8 setObject:v16 atIndexedSubscript:4];
    goto LABEL_10;
  }
  if (type == 8)
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = 0;
      _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "Attempting to getFeatureSize: for an MLState MLFeatureValue.", (uint8_t *)&v46, 2u);
    }

    if (!a3) {
      goto LABEL_21;
    }
    objc_super v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"Attempting to getFeatureSize: for an MLState MLFeatureValue."];
    v50 = v19;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = &v50;
    v22 = &v49;
    goto LABEL_20;
  }
  if (type != 5)
  {
    v23 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = 0;
      _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Attempting to hash an MLFeatureValue that is not an image or multi array.", (uint8_t *)&v46, 2u);
    }

    if (!a3) {
      goto LABEL_21;
    }
    objc_super v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"Attempting to hash an MLFeatureValue that is not an image or multi array."];
    v48 = v19;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = &v48;
    v22 = &v47;
    goto LABEL_20;
  }
  size_t v10 = [(MLFeatureValue *)self multiArrayValue];
  id v11 = [v10 shape];
  id v12 = v11;
  if (v4)
  {

    goto LABEL_22;
  }
  uint64_t v26 = [v11 count];

  if (v26 == 1)
  {
    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:0];
    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:1];
    v27 = [(MLFeatureValue *)self multiArrayValue];
    v28 = [v27 shape];
    v29 = [v28 objectAtIndexedSubscript:0];
    [v8 setObject:v29 atIndexedSubscript:2];

    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:3];
    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:4];
    goto LABEL_11;
  }
  v30 = [(MLFeatureValue *)self multiArrayValue];
  v31 = [v30 shape];
  uint64_t v32 = [v31 count];

  if (v32 == 3)
  {
    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:0];
    [v8 setObject:&unk_1EF11A1A8 atIndexedSubscript:1];
    v33 = [(MLFeatureValue *)self multiArrayValue];
    v34 = [v33 shape];
    v35 = [v34 objectAtIndexedSubscript:0];
    [v8 setObject:v35 atIndexedSubscript:2];

    v36 = [(MLFeatureValue *)self multiArrayValue];
    v37 = [v36 shape];
    v38 = [v37 objectAtIndexedSubscript:1];
    [v8 setObject:v38 atIndexedSubscript:3];

    v16 = [(MLFeatureValue *)self multiArrayValue];
    v39 = [v16 shape];
    v40 = [v39 objectAtIndexedSubscript:2];
    [v8 setObject:v40 atIndexedSubscript:4];

LABEL_10:
LABEL_11:
    id v12 = v8;
    goto LABEL_22;
  }
  v41 = [(MLFeatureValue *)self multiArrayValue];
  v42 = [v41 shape];
  uint64_t v43 = [v42 count];

  if (v43 != 5)
  {
    v45 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      __int16 v46 = 0;
      _os_log_error_impl(&dword_19E58B000, v45, OS_LOG_TYPE_ERROR, "Attempting to hash an MLFeatureValue that is not an image or multi array.", (uint8_t *)&v46, 2u);
    }

    if (!a3) {
      goto LABEL_21;
    }
    objc_super v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v19 = [NSString stringWithFormat:@"Attempting to hash an MLFeatureValue that is not an image or multi array."];
    v52[0] = v19;
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = (void **)v52;
    v22 = &v51;
LABEL_20:
    v24 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    *a3 = [v18 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v24];

LABEL_21:
    id v12 = 0;
    goto LABEL_22;
  }
  v44 = [(MLFeatureValue *)self multiArrayValue];
  id v12 = [v44 shape];

LABEL_22:

  return v12;
}

- (id)getFeatureSize:(id *)a3
{
  return [(MLFeatureValue *)self getFeatureSize:a3 ndArrayMode:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [(MLFeatureValue *)self isUndefined];
  id v6 = +[MLFeatureValue allocWithZone:a3];
  if (v5)
  {
    MLFeatureType v7 = [(MLFeatureValue *)self type];
    return [(MLFeatureValue *)v6 initWithUndefinedValueAndType:v7];
  }
  else
  {
    OSType v9 = [(MLFeatureValue *)self value];
    size_t v10 = [(MLFeatureValue *)v6 initWithValue:v9 type:[(MLFeatureValue *)self type]];

    return v10;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(MLFeatureValue *)self isEqualToFeatureValue:v4];

  return v5;
}

- (unint64_t)hash
{
  if (self->_undefined) {
    return 0;
  }
  int64_t type = self->_type;
  uint64_t v4 = [self->_value hash];
  if ((unint64_t)(type - 1) <= 1) {
    return v4 ^ 3;
  }
  else {
    return v4 ^ type;
  }
}

- (BOOL)isEqualToFeatureValue:(MLFeatureValue *)value
{
  uint64_t v4 = value;
  if ([(MLFeatureValue *)v4 isUndefined] && self->_undefined)
  {
    char v5 = 1;
    goto LABEL_16;
  }
  if ([(MLFeatureValue *)v4 type] == self->_type)
  {
    if (self->_undefined == [(MLFeatureValue *)v4 isUndefined])
    {
      switch([(MLFeatureValue *)v4 type])
      {
        case 1:
        case 2:
          goto LABEL_12;
        case 3:
          id v6 = [(MLFeatureValue *)v4 value];
          char v7 = [v6 isEqualToString:self->_value];
          goto LABEL_13;
        case 4:
          OSType v9 = [(MLFeatureValue *)self imageBufferValue];
          char v5 = v9 == [(MLFeatureValue *)v4 imageBufferValue];
          break;
        case 5:
          id v6 = [(MLFeatureValue *)v4 value];
          char v7 = [v6 isEqualToMultiArray:self->_value];
          goto LABEL_13;
        case 6:
          id v6 = [(MLFeatureValue *)v4 value];
          char v7 = [v6 isEqualToDictionary:self->_value];
          goto LABEL_13;
        case 7:
          id v6 = [(MLFeatureValue *)v4 value];
          size_t v10 = [v6 values];
          id v11 = [self->_value values];
          char v5 = [v10 isEqualToArray:v11];

          goto LABEL_14;
        case 8:
          id v12 = [(MLFeatureValue *)v4 value];
          char v5 = v12 == self->_value;

          break;
        default:
          goto LABEL_15;
      }
      goto LABEL_16;
    }
LABEL_15:
    char v5 = 0;
    goto LABEL_16;
  }
  if (([(MLFeatureValue *)v4 type] != MLFeatureTypeInt64 || self->_type != 2)
    && ([(MLFeatureValue *)v4 type] != MLFeatureTypeDouble || self->_type != 1))
  {
    goto LABEL_15;
  }
LABEL_12:
  id v6 = [(MLFeatureValue *)v4 value];
  char v7 = [v6 isEqualToNumber:self->_value];
LABEL_13:
  char v5 = v7;
LABEL_14:

LABEL_16:
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = +[MLFeatureTypeUtils descriptionForType:self->_type];
  char v5 = [v3 stringWithFormat:@"%@ : %@", v4, self->_value];

  return v5;
}

- (NSObject)objectValue
{
  return self->_value;
}

- (id)internalStateValue
{
  if (self->_type == 8 && !self->_undefined) {
    id v2 = self->_value;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (MLSequence)sequenceValue
{
  if (self->_type == 7 && !self->_undefined) {
    id v2 = self->_value;
  }
  else {
    id v2 = 0;
  }

  return (MLSequence *)v2;
}

- (CVPixelBufferRef)imageBufferValue
{
  if (self->_type == 4 && !self->_undefined) {
    return (CVPixelBufferRef)self->_value;
  }
  else {
    return 0;
  }
}

- (NSDictionary)dictionaryValue
{
  if (self->_type == 6 && !self->_undefined) {
    id v2 = self->_value;
  }
  else {
    id v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (NSString)stringValue
{
  if (self->_type == 3 && !self->_undefined) {
    id v2 = self->_value;
  }
  else {
    id v2 = 0;
  }

  return (NSString *)v2;
}

- (double)doubleValue
{
  if (self->_type != 2 || self->_undefined) {
    return 0.0;
  }
  [self->_value doubleValue];
  return result;
}

- (int64_t)int64Value
{
  if (self->_type == 1 && !self->_undefined) {
    return [self->_value longLongValue];
  }
  else {
    return 0;
  }
}

- (MLFeatureValue)initWithUndefinedValueAndType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MLFeatureValue;
  uint64_t v4 = [(MLFeatureValue *)&v8 init];
  char v5 = v4;
  if (v4)
  {
    id value = v4->_value;
    v4->_id value = 0;

    v5->_int64_t type = a3;
    v5->_undefined = 1;
  }
  return v5;
}

+ (MLFeatureValue)featureValueWithState:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:8];

  return (MLFeatureValue *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)featureValueOfType:(int64_t)a3 fromObject:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [a1 undefinedFeatureValueWithType:a3];
LABEL_4:
    size_t v10 = v9;
    goto LABEL_5;
  }
  int64_t v12 = +[MLFeatureTypeUtils featureTypeForObject:v8];
  int64_t v13 = v12;
  if (v12 == a3 || a3 == 2 && v12 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      goto LABEL_4;
    }
    if (v13 != 7)
    {
      if (v13 == 6)
      {
        id v9 = +[MLFeatureValue featureValueWithDictionary:v8 error:a5];
      }
      else
      {
        id v9 = (id)[objc_alloc((Class)a1) initWithValue:v8 type:a3];
      }
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [[MLSequence alloc] initWithArray:v8 type:+[MLFeatureTypeUtils featureTypeForValuesInArray:v8 error:a5]];
      size_t v10 = +[MLFeatureValue featureValueWithSequence:v14];
    }
    else
    {
      v15 = [v8 values];
      int64_t v16 = +[MLFeatureTypeUtils featureTypeForValuesInArray:v15 error:a5];

      v17 = [MLSequence alloc];
      objc_super v18 = [v8 values];
      v19 = [(MLSequence *)v17 initWithArray:v18 type:v16];
      size_t v10 = +[MLFeatureValue featureValueWithSequence:v19];
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils featureTypeErrorWithFormat:@"Object not consistent with type supplied"];
    size_t v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    size_t v10 = 0;
  }
LABEL_5:

  return v10;
}

+ (MLFeatureValue)featureValueWithInt64KeyDictionary:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:6];

  return (MLFeatureValue *)v5;
}

+ (MLFeatureValue)featureValueWithStringKeyDictionary:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:6];

  return (MLFeatureValue *)v5;
}

+ (MLFeatureValue)featureValueWithDictionary:(NSDictionary *)value error:(NSError *)error
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = value;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v7 = [(NSDictionary *)v6 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (error)
            {
              *error = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Dictionary keys must be NSStrings or NSNumbers."];
            }

            int64_t v12 = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int64_t v12 = (void *)[objc_alloc((Class)a1) initWithValue:v6 type:6];
LABEL_14:

  return (MLFeatureValue *)v12;
}

+ (id)internalFeatureValueWithState:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:8];

  return v5;
}

+ (MLFeatureValue)featureValueWithSequence:(MLSequence *)sequence
{
  id v4 = sequence;
  char v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:7];

  return (MLFeatureValue *)v5;
}

+ (MLFeatureValue)featureValueWithPixelBuffer:(CVPixelBufferRef)value
{
  v3 = (void *)[objc_alloc((Class)a1) initWithValue:value type:4];

  return (MLFeatureValue *)v3;
}

+ (MLFeatureValue)featureValueWithString:(NSString *)value
{
  id v4 = value;
  char v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 type:3];

  return (MLFeatureValue *)v5;
}

+ (MLFeatureValue)featureValueWithDouble:(double)value
{
  id v4 = objc_alloc((Class)a1);
  char v5 = [NSNumber numberWithDouble:value];
  id v6 = (void *)[v4 initWithValue:v5 type:2];

  return (MLFeatureValue *)v6;
}

+ (MLFeatureValue)featureValueWithInt64:(int64_t)value
{
  id v4 = objc_alloc((Class)a1);
  char v5 = [NSNumber numberWithLongLong:value];
  id v6 = (void *)[v4 initWithValue:v5 type:1];

  return (MLFeatureValue *)v6;
}

+ (MLFeatureValue)undefinedFeatureValueWithType:(MLFeatureType)type
{
  v3 = (void *)[objc_alloc((Class)a1) initWithUndefinedValueAndType:type];

  return (MLFeatureValue *)v3;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = *(void *)&orientation;
  int64_t v12 = constraint;
  int64_t v13 = +[_MLVNFrameworkHandle addOrientation:v9 toOptions:options];
  long long v14 = [a1 featureValueWithCGImage:cgImage constraint:v12 options:v13 error:error];

  return (MLFeatureValue *)v14;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage orientation:(CGImagePropertyOrientation)orientation pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = *(void *)&pixelFormatType;
  long long v14 = +[_MLVNFrameworkHandle addOrientation:*(void *)&orientation toOptions:options];
  long long v15 = [a1 featureValueWithCGImage:cgImage pixelsWide:pixelsWide pixelsHigh:pixelsHigh pixelFormatType:v9 options:v14 error:error];

  return (MLFeatureValue *)v15;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url orientation:(CGImagePropertyOrientation)orientation constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = *(void *)&orientation;
  int64_t v12 = constraint;
  int64_t v13 = url;
  long long v14 = +[_MLVNFrameworkHandle addOrientation:v9 toOptions:options];
  long long v15 = [a1 featureValueWithImageAtURL:v13 constraint:v12 options:v14 error:error];

  return (MLFeatureValue *)v15;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url orientation:(CGImagePropertyOrientation)orientation pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v10 = *(void *)&pixelFormatType;
  uint64_t v13 = *(void *)&orientation;
  long long v15 = url;
  long long v16 = +[_MLVNFrameworkHandle addOrientation:v13 toOptions:options];
  long long v17 = [a1 featureValueWithImageAtURL:v15 pixelsWide:pixelsWide pixelsHigh:pixelsHigh pixelFormatType:v10 options:v16 error:error];

  return (MLFeatureValue *)v17;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v10 = constraint;
  id v11 = options;
  int64_t v12 = +[_MLVNFrameworkHandle sharedHandle];
  if (v12)
  {
    [a1 cropRectFromOptions:v11];
    uint64_t v17 = objc_msgSend(v12, "createPixelBufferFromCGImage:constraint:cropRect:cropAndScaleOption:options:error:", cgImage, v10, objc_msgSend(a1, "visionCropAndScaleOptionFromOptions:", v11), v11, error, v13, v14, v15, v16);
    if (v17)
    {
      objc_super v18 = (__CVBuffer *)v17;
      uint64_t v19 = +[MLFeatureValue featureValueWithPixelBuffer:v17];
      CVPixelBufferRelease(v18);
      goto LABEL_7;
    }
  }
  else if (error)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Functionality unavailable"];
    uint64_t v19 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v19 = 0;
LABEL_7:

  return (MLFeatureValue *)v19;
}

+ (MLFeatureValue)featureValueWithCGImage:(CGImageRef)cgImage pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = *(void *)&pixelFormatType;
  double v14 = options;
  double v15 = +[MLImageConstraint constraintWithPixelsWide:pixelsHigh:pixelType:](MLImageConstraint, "constraintWithPixelsWide:pixelsHigh:pixelType:", pixelsWide, pixelsHigh, +[MLImageConstraint imagePixelTypeFromOSType:v9]);
  double v16 = [a1 featureValueWithCGImage:cgImage constraint:v15 options:v14 error:error];

  return (MLFeatureValue *)v16;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url constraint:(MLImageConstraint *)constraint options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v10 = url;
  id v11 = constraint;
  int64_t v12 = options;
  double v13 = +[_MLVNFrameworkHandle sharedHandle];
  if (v13)
  {
    if ([(MLImageConstraint *)v11 pixelsHigh] && [(MLImageConstraint *)v11 pixelsWide])
    {
      [a1 cropRectFromOptions:v12];
      uint64_t v18 = objc_msgSend(v13, "createPixelBufferFromImageAtURL:constraint:cropRect:cropAndScaleOption:options:error:", v10, v11, objc_msgSend(a1, "visionCropAndScaleOptionFromOptions:", v12), v12, error, v14, v15, v16, v17);
      if (v18)
      {
        uint64_t v19 = (__CVBuffer *)v18;
        v20 = +[MLFeatureValue featureValueWithPixelBuffer:v18];
        CVPixelBufferRelease(v19);
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if (error)
    {
      v21 = @"Operation failed due to missing or zero crop parameters in image constraint.";
      goto LABEL_10;
    }
  }
  else if (error)
  {
    v21 = @"Functionality unavailable";
LABEL_10:
    +[MLModelErrorUtils genericErrorWithFormat:v21];
    v20 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_11:
  v20 = 0;
LABEL_12:

  return (MLFeatureValue *)v20;
}

+ (MLFeatureValue)featureValueWithImageAtURL:(NSURL *)url pixelsWide:(NSInteger)pixelsWide pixelsHigh:(NSInteger)pixelsHigh pixelFormatType:(OSType)pixelFormatType options:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v9 = *(void *)&pixelFormatType;
  double v14 = options;
  double v15 = url;
  double v16 = +[MLImageConstraint constraintWithPixelsWide:pixelsHigh:pixelType:](MLImageConstraint, "constraintWithPixelsWide:pixelsHigh:pixelType:", pixelsWide, pixelsHigh, +[MLImageConstraint imagePixelTypeFromOSType:v9]);
  double v17 = [a1 featureValueWithImageAtURL:v15 constraint:v16 options:v14 error:error];

  return (MLFeatureValue *)v17;
}

+ (CGRect)cropRectFromOptions:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"MLFeatureValueImageOptionCropRect"];
  id v4 = v3;
  if (v3
    && (id v5 = v3,
        !strncmp((const char *)[v5 objCType], "{CGRect={CGPoint=dd}{CGSize=dd}}", 0xAuLL)))
  {
    double v16 = 0.0;
    double v17 = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    long long v18 = _Q0;
    [v5 getValue:&v16 size:32];
  }
  else
  {
    double v16 = 0.0;
    double v17 = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    long long v18 = _Q0;
  }

  double v12 = v16;
  double v13 = v17;
  double v15 = *((double *)&v18 + 1);
  double v14 = *(double *)&v18;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (unint64_t)visionCropAndScaleOptionFromOptions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [a3 objectForKeyedSubscript:@"MLFeatureValueImageOptionCropAndScale"];
  if (!v3)
  {
LABEL_7:
    unint64_t v4 = 2;
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v5 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = @"MLFeatureValueImageOptionCropAndScale";
      _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "Value for %@ must respond to 'unsignedIntegerValue' selector. Will default to VNImageCropAndScaleOptionScaleFill = 2", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_7;
  }
  unint64_t v4 = [v3 unsignedIntegerValue];
LABEL_8:

  return v4;
}

@end