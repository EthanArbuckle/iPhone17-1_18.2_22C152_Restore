@interface ARCollaborationData
+ (BOOL)supportsSecureCoding;
- (ARCollaborationData)initWithCoder:(id)a3;
- (ARCollaborationData)initWithVIOData:(id)a3 type:(int64_t)a4 sessionID:(unint64_t)a5;
- (ARCollaborationDataPriority)priority;
- (NSData)vioData;
- (NSSet)anchors;
- (NSUUID)anchorIdentifier;
- (double)timestamp;
- (int64_t)version;
- (int64_t)vioDataType;
- (unint64_t)vioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorIdentifier:(id)a3;
- (void)setAnchors:(id)a3;
@end

@implementation ARCollaborationData

- (ARCollaborationData)initWithVIOData:(id)a3 type:(int64_t)a4 sessionID:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARCollaborationData;
  v10 = [(ARCollaborationData *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_priority = a4 == 7;
    v10->_version = 3;
    v10->_timestamp = CACurrentMediaTime();
    objc_storeStrong((id *)&v11->_vioData, a3);
    v11->_vioDataType = a4;
    v11->_vioSessionID = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_priority forKey:@"priority"];
  [v6 encodeInteger:self->_version forKey:@"version"];
  [v6 encodeDouble:@"timestamp" forKey:self->_timestamp];
  vioData = self->_vioData;
  if (vioData) {
    [v6 encodeObject:vioData forKey:@"vioData"];
  }
  [v6 encodeInteger:self->_vioDataType forKey:@"vioDataType"];
  [v6 encodeInt64:self->_vioSessionID forKey:@"vioSessionID"];
  anchors = self->_anchors;
  if (anchors) {
    [v6 encodeObject:anchors forKey:@"anchors"];
  }
}

- (ARCollaborationData)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  if (v5 == 3)
  {
    v23.receiver = self;
    v23.super_class = (Class)ARCollaborationData;
    id v6 = [(ARCollaborationData *)&v23 init];
    if (v6)
    {
      v6->_priority = [v4 decodeIntegerForKey:@"priority"];
      v6->_version = 3;
      [v4 decodeDoubleForKey:@"timestamp"];
      v6->_timestamp = v7;
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vioData"];
      vioData = v6->_vioData;
      v6->_vioData = (NSData *)v8;

      v6->_vioDataType = [v4 decodeIntegerForKey:@"vioDataType"];
      v6->_vioSessionID = [v4 decodeInt64ForKey:@"vioSessionID"];
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
      uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"anchors"];
      anchors = v6->_anchors;
      v6->_anchors = (NSSet *)v13;
    }
    self = v6;
    v15 = self;
  }
  else
  {
    uint64_t v16 = v5;
    v17 = ARErrorWithCodeAndUserInfo(304, 0);
    [v4 failWithError:v17];

    if (_ARLogGeneral_onceToken_50 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_50, &__block_literal_global_116);
    }
    v18 = (void *)_ARLogGeneral_logObj_50;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_50, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544130;
      v25 = v21;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2048;
      uint64_t v29 = v16;
      __int16 v30 = 1024;
      int v31 = 3;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error decoding collaboration data, unsupported version (%ti), current version %i", buf, 0x26u);
    }
    v15 = 0;
  }

  return v15;
}

- (ARCollaborationDataPriority)priority
{
  return self->_priority;
}

- (int64_t)version
{
  return self->_version;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSData)vioData
{
  return self->_vioData;
}

- (int64_t)vioDataType
{
  return self->_vioDataType;
}

- (unint64_t)vioSessionID
{
  return self->_vioSessionID;
}

- (NSUUID)anchorIdentifier
{
  return self->_anchorIdentifier;
}

- (void)setAnchorIdentifier:(id)a3
{
}

- (NSSet)anchors
{
  return self->_anchors;
}

- (void)setAnchors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_storeStrong((id *)&self->_vioData, 0);
}

@end