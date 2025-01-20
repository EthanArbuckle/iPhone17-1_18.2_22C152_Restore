@interface ARAppClipCodeAnchor
+ (BOOL)supportsSecureCoding;
- (ARAppClipCodeAnchor)initWithAnchor:(id)a3;
- (ARAppClipCodeAnchor)initWithAppClipCodeResult:(id)a3 instanceID:(id)a4;
- (ARAppClipCodeAnchor)initWithCoder:(id)a3;
- (ARAppClipCodeURLDecodingState)urlDecodingState;
- (BOOL)isScaleReliable;
- (BOOL)isTracked;
- (NSNumber)instanceID;
- (NSString)description;
- (NSURL)url;
- (float)confidence;
- (float)radius;
- (id)copyWithAppClipCodeResult:(id)a3 isTracked:(BOOL)a4;
- (id)copyWithTrackedState:(BOOL)a3;
- (int64_t)urlDecodingStateInternal;
- (unint64_t)urlEncodingVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setInstanceID:(id)a3;
- (void)setIsScaleReliable:(BOOL)a3;
- (void)setIsTracked:(BOOL)a3;
- (void)setRadius:(float)a3;
- (void)setUrl:(id)a3;
- (void)setUrlDecodingStateInternal:(int64_t)a3;
- (void)setUrlEncodingVersion:(unint64_t)a3;
@end

@implementation ARAppClipCodeAnchor

- (ARAppClipCodeAnchor)initWithAppClipCodeResult:(id)a3 instanceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARAppClipCodeAnchor;
  v8 = -[ARAnchor initWithTransform:](&v14, sel_initWithTransform_, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
  if (v8)
  {
    uint64_t v9 = [v6 url];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_instanceID, a4);
    [v6 size];
    *(float *)&double v11 = v11 * 0.5;
    v8->_radius = *(float *)&v11;
    [v6 confidence];
    v8->_confidence = v12;
    v8->_urlDecodingStateInternal = [v6 urlDecodingStateInternal];
    [(ARAppClipCodeAnchor *)v8 setIsTracked:1];
    v8->_isScaleReliable = [v6 isScaleReliable];
    v8->_urlEncodingVersion = [v6 urlEncodingVersion];
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(ARAppClipCodeAnchor *)self instanceID];
  id v7 = [(ARAppClipCodeAnchor *)self url];
  v8 = [v7 absoluteString];
  uint64_t v9 = [(ARAnchor *)self identifier];
  [(ARAnchor *)self transform];
  objc_super v14 = ARMatrix4x4Description(0, v10, v11, v12, v13);
  v15 = [v3 stringWithFormat:@"<%@: %p instanceID=%@ url=\"%@\" identifier=\"%@\" transform=%@>", v5, self, v6, v8, v9, v14];

  return (NSString *)v15;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(ARAppClipCodeAnchor *)self copy];
  v5 = v4;
  if (v4 && [v4 isTracked] != v3) {
    [v5 setIsTracked:v3];
  }
  return v5;
}

- (ARAppClipCodeAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARAppClipCodeAnchor;
  v5 = [(ARAnchor *)&v13 initWithAnchor:v4];
  if (v5)
  {
    uint64_t v6 = [v4 url];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 instanceID];
    instanceID = v5->_instanceID;
    v5->_instanceID = (NSNumber *)v8;

    [v4 radius];
    v5->_radius = v10;
    [v4 confidence];
    v5->_confidence = v11;
    v5->_urlDecodingStateInternal = [v4 urlDecodingStateInternal];
    v5->_isTracked = [v4 isTracked];
    v5->_isScaleReliable = [v4 isScaleReliable];
    v5->_urlEncodingVersion = [v4 urlEncodingVersion];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARAppClipCodeAnchor;
  id v4 = a3;
  [(ARAnchor *)&v7 encodeWithCoder:v4];
  v5 = [(ARAppClipCodeAnchor *)self url];
  [v4 encodeObject:v5 forKey:@"url"];

  uint64_t v6 = [(ARAppClipCodeAnchor *)self instanceID];
  [v4 encodeObject:v6 forKey:@"instanceID"];

  [(ARAppClipCodeAnchor *)self confidence];
  objc_msgSend(v4, "encodeFloat:forKey:", @"confidence");
  [(ARAppClipCodeAnchor *)self radius];
  objc_msgSend(v4, "encodeFloat:forKey:", @"radius");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARAppClipCodeAnchor urlDecodingStateInternal](self, "urlDecodingStateInternal"), @"urlDecodingStateInternal");
  objc_msgSend(v4, "encodeBool:forKey:", -[ARAppClipCodeAnchor isTracked](self, "isTracked"), @"isTracked");
  objc_msgSend(v4, "encodeBool:forKey:", -[ARAppClipCodeAnchor isScaleReliable](self, "isScaleReliable"), @"isScaleReliable");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARAppClipCodeAnchor urlEncodingVersion](self, "urlEncodingVersion"), @"urlEncodingVersion");
}

- (ARAppClipCodeAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARAppClipCodeAnchor;
  v5 = [(ARAnchor *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceID"];
    instanceID = v5->_instanceID;
    v5->_instanceID = (NSNumber *)v8;

    [v4 decodeFloatForKey:@"confidence"];
    v5->_confidence = v10;
    [v4 decodeFloatForKey:@"radius"];
    v5->_radius = v11;
    v5->_urlDecodingStateInternal = [v4 decodeIntegerForKey:@"urlDecodingStateInternal"];
    v5->_isTracked = [v4 decodeBoolForKey:@"isTracked"];
    v5->_isScaleReliable = [v4 decodeBoolForKey:@"isScaleReliable"];
    v5->_urlEncodingVersion = [v4 decodeIntegerForKey:@"urlEncodingVersion"];
  }

  return v5;
}

- (ARAppClipCodeURLDecodingState)urlDecodingState
{
  unint64_t urlDecodingStateInternal = self->_urlDecodingStateInternal;
  if (urlDecodingStateInternal > 9) {
    return 2;
  }
  else {
    return qword_1B8A2B578[urlDecodingStateInternal];
  }
}

- (id)copyWithAppClipCodeResult:(id)a3 isTracked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = (void *)[(ARAppClipCodeAnchor *)self copy];
  if (v7)
  {
    [v6 size];
    double v9 = v8 * 0.5;
    *(float *)&double v9 = v9;
    [v7 setRadius:v9];
    [v6 confidence];
    objc_msgSend(v7, "setConfidence:");
    float v10 = [v6 url];
    [v7 setUrl:v10];

    objc_msgSend(v7, "setUrlDecodingStateInternal:", objc_msgSend(v6, "urlDecodingStateInternal"));
    objc_msgSend(v7, "setIsScaleReliable:", objc_msgSend(v6, "isScaleReliable"));
    objc_msgSend(v7, "setUrlEncodingVersion:", objc_msgSend(v6, "urlEncodingVersion"));
    [v7 setIsTracked:v4];
  }

  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int64_t)urlDecodingStateInternal
{
  return self->_urlDecodingStateInternal;
}

- (void)setUrlDecodingStateInternal:(int64_t)a3
{
  self->_unint64_t urlDecodingStateInternal = a3;
}

- (BOOL)isScaleReliable
{
  return self->_isScaleReliable;
}

- (void)setIsScaleReliable:(BOOL)a3
{
  self->_isScaleReliable = a3;
}

- (unint64_t)urlEncodingVersion
{
  return self->_urlEncodingVersion;
}

- (void)setUrlEncodingVersion:(unint64_t)a3
{
  self->_urlEncodingVersion = a3;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end