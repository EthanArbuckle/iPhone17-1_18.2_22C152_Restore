@interface DYMTLCommandQueueInfo
+ (BOOL)isLabelAppleInternal:(const char *)a3;
+ (BOOL)supportsSecureCoding;
+ (id)capturableObjectType;
- (BOOL)canBeCaptured;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalQueue;
- (BOOL)isOpenGLQueue;
- (DYMTLCommandQueueInfo)initWithCoder:(id)a3;
- (DYMTLCommandQueueInfo)initWithCommandQueue:(id)a3;
- (NSString)capturableObjectType;
- (NSString)description;
- (NSString)displayName;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)deviceAddress;
- (unint64_t)deviceStreamRef;
- (unint64_t)queueAddress;
- (unint64_t)streamRef;
- (unint64_t)toolsQueueAddress;
- (void)encodeWithCoder:(id)a3;
- (void)setCanBeCaptured:(BOOL)a3;
- (void)setIsInternalQueue:(BOOL)a3;
- (void)setIsOpenGLQueue:(BOOL)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation DYMTLCommandQueueInfo

- (DYMTLCommandQueueInfo)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DYMTLCommandQueueInfo;
  v5 = [(DYMTLCommandQueueInfo *)&v16 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 originalObject];
    }
    else
    {
      id v7 = v6;
    }
    v8 = v7;

    v9 = [v8 device];
    v5->_deviceAddress = (unint64_t)v9;

    v10 = [v8 device];
    v5->_deviceStreamRef = [v10 streamReference];

    v5->_queueAddress = (unint64_t)v8;
    v5->_toolsQueueAddress = (unint64_t)v6;
    uint64_t v11 = [v8 label];
    label = v5->_label;
    v5->_label = (NSString *)v11;

    displayName = v5->_displayName;
    v5->_displayName = 0;

    *(_WORD *)&v5->_canBeCaptured = 1;
    v5->_isInternalQueue = +[DYMTLCommandQueueInfo isLabelAppleInternal:[(NSString *)v5->_label UTF8String]];
    v14 = v5;
  }
  return v5;
}

- (NSString)displayName
{
  if (!self->_displayName)
  {
    label = self->_label;
    if (label)
    {
      id v4 = label;
    }
    else
    {
      unint64_t toolsQueueAddress = self->_toolsQueueAddress;
      if (!toolsQueueAddress) {
        unint64_t toolsQueueAddress = self->_queueAddress;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Command Queue 0x%llx", toolsQueueAddress);
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    displayName = self->_displayName;
    self->_displayName = v4;
  }
  id v7 = self->_displayName;
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYMTLCommandQueueInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLCommandQueueInfo;
  v5 = [(DYMTLCommandQueueInfo *)&v10 init];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_deviceAddress = [v4 decodeInt64ForKey:@"deviceAddress"];
    v5->_deviceStreamRef = [v4 decodeInt64ForKey:@"deviceStreamRef"];
    v5->_queueAddress = [v4 decodeInt64ForKey:@"queueAddress"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v5->_canBeCaptured = 1;
    if ([v4 containsValueForKey:@"canBeCaptured"]) {
      v5->_canBeCaptured = [v4 decodeBoolForKey:@"canBeCaptured"];
    }
    v5->_isOpenGLQueue = 0;
    if ([v4 containsValueForKey:@"isOpenGLQueue"]) {
      v5->_isOpenGLQueue = [v4 decodeBoolForKey:@"isOpenGLQueue"];
    }
    v5->_isInternalQueue = 0;
    if ([v4 containsValueForKey:@"isInternalQueue"]) {
      v5->_isInternalQueue = [v4 decodeBoolForKey:@"isInternalQueue"];
    }
    v5->_unint64_t toolsQueueAddress = 0;
    if ([v4 containsValueForKey:@"toolsQueueAddress"]) {
      v5->_unint64_t toolsQueueAddress = [v4 decodeInt64ForKey:@"toolsQueueAddress"];
    }
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_streamRef forKey:@"streamRef"];
  [v4 encodeInt64:self->_deviceAddress forKey:@"deviceAddress"];
  [v4 encodeInt64:self->_deviceStreamRef forKey:@"deviceStreamRef"];
  [v4 encodeInt64:self->_queueAddress forKey:@"queueAddress"];
  [v4 encodeInt64:self->_toolsQueueAddress forKey:@"toolsQueueAddress"];
  [v4 encodeObject:self->_label forKey:@"label"];
  [v4 encodeBool:self->_canBeCaptured forKey:@"canBeCaptured"];
  [v4 encodeBool:self->_isOpenGLQueue forKey:@"isOpenGLQueue"];
  [v4 encodeBool:self->_isInternalQueue forKey:@"isInternalQueue"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v5 = v4;
  if (v4)
  {
    v4[3] = self->_streamRef;
    v4[4] = self->_deviceAddress;
    v4[5] = self->_deviceStreamRef;
    v4[6] = self->_queueAddress;
    v4[7] = self->_toolsQueueAddress;
    uint64_t v6 = [(NSString *)self->_label copy];
    id v7 = (void *)v5[8];
    v5[8] = v6;

    *((unsigned char *)v5 + 8) = self->_canBeCaptured;
    *((unsigned char *)v5 + 9) = self->_isOpenGLQueue;
    *((unsigned char *)v5 + 10) = self->_isInternalQueue;
    v8 = v5;
  }

  return v5;
}

- (NSString)description
{
  v2 = @"YES";
  if (self->_canBeCaptured) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (self->_isOpenGLQueue) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (!self->_isInternalQueue) {
    v2 = @"NO";
  }
  return (NSString *)[NSString stringWithFormat:@"device:0x%llx, queue:0x%llx, toolsQueue:0x%llx, label:%@, canBeCaptured:%@, isOpenGL:%@, isInternal: %@", self->_deviceAddress, self->_queueAddress, self->_toolsQueueAddress, self->_label, v3, v4, v2];
}

+ (id)capturableObjectType
{
  return (id)*MEMORY[0x263F3FA58];
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x263F3FA58];
}

+ (BOOL)isLabelAppleInternal:(const char *)a3
{
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    LOBYTE(v5) = 0;
    return v5;
  }
  +[DYMTLCommandQueueInfo isLabelAppleInternal:]::kPrefixLength = 1;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  if (+[DYMTLCommandQueueInfo isLabelAppleInternal:]::kPrefixLength) {
    size_t v4 = 9;
  }
  else {
    size_t v4 = 0;
  }
  if (strncmp("com.apple", a3, v4)) {
    goto LABEL_7;
  }
  int v5 = strcmp(a3, "com.apple.SceneKit");
  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = v6;
      if (v6 == 4) {
        break;
      }
      int v8 = strcmp(a3, +[DYMTLCommandQueueInfo isLabelAppleInternal:]::kWhitelistedLabels[v6 + 1]);
      unint64_t v6 = v7 + 1;
    }
    while (v8);
    LOBYTE(v5) = v7 > 3;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  size_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->_queueAddress == v4[6];

  return v6;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (unint64_t)queueAddress
{
  return self->_queueAddress;
}

- (unint64_t)toolsQueueAddress
{
  return self->_toolsQueueAddress;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)canBeCaptured
{
  return self->_canBeCaptured;
}

- (void)setCanBeCaptured:(BOOL)a3
{
  self->_canBeCaptured = a3;
}

- (BOOL)isOpenGLQueue
{
  return self->_isOpenGLQueue;
}

- (void)setIsOpenGLQueue:(BOOL)a3
{
  self->_isOpenGLQueue = a3;
}

- (BOOL)isInternalQueue
{
  return self->_isInternalQueue;
}

- (void)setIsInternalQueue:(BOOL)a3
{
  self->_isInternalQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end