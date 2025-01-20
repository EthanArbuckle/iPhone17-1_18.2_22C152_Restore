@interface HMDCameraRecordingVideoAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDCameraRecordingVideoAttributes)initWithCoder:(id)a3;
- (HMDCameraRecordingVideoAttributes)initWithImageWidth:(id)a3 imageHeight:(id)a4 frameRate:(id)a5;
- (HMDCameraRecordingVideoAttributes)initWithResolution:(int64_t)a3 frameRate:(id)a4;
- (NSData)tlvData;
- (NSNumber)frameRate;
- (NSNumber)imageHeight;
- (NSNumber)imageWidth;
- (int64_t)resolution;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCameraRecordingVideoAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameRate, 0);
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_imageWidth, 0);
}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (NSNumber)imageHeight
{
  return self->_imageHeight;
}

- (NSNumber)imageWidth
{
  return self->_imageWidth;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraRecordingVideoAttributes *)self imageWidth];
  [v4 encodeObject:v5 forKey:@"kVideoAttributesImageWidth"];

  v6 = [(HMDCameraRecordingVideoAttributes *)self imageHeight];
  [v4 encodeObject:v6 forKey:@"kVideoAttributesImageHeight"];

  id v7 = [(HMDCameraRecordingVideoAttributes *)self frameRate];
  [v4 encodeObject:v7 forKey:@"kVideoAttributesFrameRate"];
}

- (HMDCameraRecordingVideoAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCameraRecordingVideoAttributes;
  v5 = [(HMDCameraRecordingVideoAttributes *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoAttributesImageWidth"];
    imageWidth = v5->_imageWidth;
    v5->_imageWidth = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoAttributesImageHeight"];
    imageHeight = v5->_imageHeight;
    v5->_imageHeight = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoAttributesFrameRate"];
    frameRate = v5->_frameRate;
    v5->_frameRate = (NSNumber *)v10;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n%@tlvDatablob = %@ ", v6, v8];

  v9 = [(HMDCameraRecordingVideoAttributes *)self imageWidth];
  [v7 appendFormat:@"\n%@imageWidth = %@ ", v6, v9];

  uint64_t v10 = [(HMDCameraRecordingVideoAttributes *)self imageHeight];
  [v7 appendFormat:@"\n%@imageHeight = %@", v6, v10];

  id v11 = [(HMDCameraRecordingVideoAttributes *)self frameRate];
  [v7 appendFormat:@"\n%@frameRate = %@", v6, v11];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDCameraRecordingVideoAttributes *)self imageWidth];
  [v3 addTLV:1 length:2 number:v4];

  v5 = [(HMDCameraRecordingVideoAttributes *)self imageHeight];
  [v3 addTLV:2 length:2 number:v5];

  id v6 = [(HMDCameraRecordingVideoAttributes *)self frameRate];
  [v3 addTLV:3 length:1 number:v6];

  id v7 = [v3 serialize];

  return (NSData *)v7;
}

- (BOOL)_parseFromTLVData
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kVideoAttributesImageWidth"];
  id v4 = [MEMORY[0x1E4F5BDE8] wrappertlv:2 name:@"kVideoAttributesImageHeight"];
  v5 = [MEMORY[0x1E4F5BDE8] wrappertlv:3 name:@"kVideoAttributesFrameRate"];
  v15[0] = v3;
  v15[1] = v4;
  v15[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    uint64_t v8 = [v3 field];
    imageWidth = self->_imageWidth;
    self->_imageWidth = v8;

    uint64_t v10 = [v4 field];
    imageHeight = self->_imageHeight;
    self->_imageHeight = v10;

    v12 = [v5 field];
    frameRate = self->_frameRate;
    self->_frameRate = v12;

    translateResolutionWidthHeight(self->_imageWidth, self->_imageHeight, &self->_resolution);
  }

  return v7;
}

- (HMDCameraRecordingVideoAttributes)initWithImageWidth:(id)a3 imageHeight:(id)a4 frameRate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingVideoAttributes;
  v12 = [(HMDCameraRecordingVideoAttributes *)&v16 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageWidth, a3);
    objc_storeStrong((id *)&v13->_imageHeight, a4);
    uint64_t v15 = 0;
    translateResolutionWidthHeight(v9, v10, &v15);
    v13->_resolution = v15;
    objc_storeStrong((id *)&v13->_frameRate, a5);
  }

  return v13;
}

- (HMDCameraRecordingVideoAttributes)initWithResolution:(int64_t)a3 frameRate:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingVideoAttributes;
  uint64_t v8 = [(HMDCameraRecordingVideoAttributes *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    v8->_resolution = a3;
    objc_storeStrong((id *)&v8->_frameRate, a4);
    int64_t v10 = a3 - 1;
    if ((unint64_t)(a3 - 1) > 0x10)
    {
      id v11 = 0;
      v12 = 0;
    }
    else
    {
      id v11 = (NSNumber *)qword_1E6A11C48[v10];
      v12 = (NSNumber *)qword_1E6A11CD0[v10];
    }
    imageWidth = v9->_imageWidth;
    v9->_imageWidth = v11;

    imageHeight = v9->_imageHeight;
    v9->_imageHeight = v12;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end