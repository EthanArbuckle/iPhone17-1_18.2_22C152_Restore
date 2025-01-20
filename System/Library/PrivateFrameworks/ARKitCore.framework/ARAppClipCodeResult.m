@interface ARAppClipCodeResult
+ (BOOL)supportsSecureCoding;
- (ARAppClipCodeResult)initWithCoder:(id)a3;
- (BOOL)isScaleReliable;
- (CGSize)size;
- (NSURL)url;
- (__n128)codeToWorldVisionTransform;
- (__n128)setCodeToWorldVisionTransform:(__n128)a3;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)urlDecodingStateInternal;
- (unint64_t)urlEncodingVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setIsScaleReliable:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setUrl:(id)a3;
- (void)setUrlDecodingStateInternal:(int64_t)a3;
- (void)setUrlEncodingVersion:(unint64_t)a3;
@end

@implementation ARAppClipCodeResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v6 = a3;
  [v6 encodeObject:url forKey:@"url"];
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", @"codeToWorldVisionTransform", *(double *)&self[1].super.isa, *(double *)&self[1]._url, *(double *)&self[1]._urlEncodingVersion, self[1]._size.height);
  *(float *)&double v5 = self->_confidence;
  [v6 encodeFloat:@"confidence" forKey:v5];
  [v6 encodeBool:self->_isScaleReliable forKey:@"isScaleReliable"];
  objc_msgSend(v6, "encodeCGSize:forKey:", @"size", self->_size.width, self->_size.height);
  [v6 encodeInteger:self->_urlDecodingStateInternal forKey:@"urlDecodingState"];
  [v6 encodeInteger:self->_urlEncodingVersion forKey:@"urlEncodingVersion"];
}

- (ARAppClipCodeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARAppClipCodeResult;
  double v5 = [(ARAppClipCodeResult *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"codeToWorldVisionTransform");
    *(_OWORD *)&v5[1].super.isa = v8;
    *(_OWORD *)&v5[1]._url = v9;
    *(_OWORD *)&v5[1]._urlEncodingVersion = v10;
    *(_OWORD *)&v5[1]._size.height = v11;
    [v4 decodeFloatForKey:@"confidence"];
    v5->_confidence = v12;
    v5->_isScaleReliable = [v4 decodeBoolForKey:@"isScaleReliable"];
    [v4 decodeCGSizeForKey:@"size"];
    v5->_size.width = v13;
    v5->_size.height = v14;
    v5->_urlDecodingStateInternal = [v4 decodeIntegerForKey:@"urlDecodingState"];
    v5->_urlEncodingVersion = [v4 decodeIntegerForKey:@"urlEncodingVersion"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_url);
  long long v5 = *(_OWORD *)&self[1].super.isa;
  long long v6 = *(_OWORD *)&self[1]._url;
  long long v7 = *(_OWORD *)&self[1]._size.height;
  *(_OWORD *)(v4 + 96) = *(_OWORD *)&self[1]._urlEncodingVersion;
  *(_OWORD *)(v4 + 112) = v7;
  *(_OWORD *)(v4 + 64) = v5;
  *(_OWORD *)(v4 + 80) = v6;
  *(float *)(v4 + 12) = self->_confidence;
  *(unsigned char *)(v4 + 8) = self->_isScaleReliable;
  *(CGSize *)(v4 + 40) = self->_size;
  *(void *)(v4 + 24) = self->_urlDecodingStateInternal;
  *(void *)(v4 + 32) = self->_urlEncodingVersion;
  return (id)v4;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (__n128)codeToWorldVisionTransform
{
  return a1[4];
}

- (__n128)setCodeToWorldVisionTransform:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (BOOL)isScaleReliable
{
  return self->_isScaleReliable;
}

- (void)setIsScaleReliable:(BOOL)a3
{
  self->_isScaleReliable = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)urlDecodingStateInternal
{
  return self->_urlDecodingStateInternal;
}

- (void)setUrlDecodingStateInternal:(int64_t)a3
{
  self->_urlDecodingStateInternal = a3;
}

- (unint64_t)urlEncodingVersion
{
  return self->_urlEncodingVersion;
}

- (void)setUrlEncodingVersion:(unint64_t)a3
{
  self->_urlEncodingVersion = a3;
}

- (void).cxx_destruct
{
}

@end