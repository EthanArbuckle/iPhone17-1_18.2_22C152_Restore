@interface HMDVideoAttributes
+ (BOOL)supportsSecureCoding;
+ (BOOL)translateImageResolution:(id)a3 imageWidth:(id *)a4 imageHeight:(id *)a5;
- (BOOL)_parseFromTLVData;
- (HMDVideoAttributes)initWithCoder:(id)a3;
- (HMDVideoAttributes)initWithResolution:(id)a3 framerate:(id)a4;
- (HMDVideoResolution)videoResolution;
- (NSData)tlvData;
- (NSNumber)framerate;
- (NSNumber)imageHeight;
- (NSNumber)imageWidth;
- (id)translateImageWidth:(id)a3 imageHeight:(id)a4;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDVideoAttributes

+ (BOOL)translateImageResolution:(id)a3 imageWidth:(id *)a4 imageHeight:(id *)a5
{
  unint64_t v7 = [a3 resolutionType] - 1;
  if (v7 <= 0x1C)
  {
    v8 = (void *)qword_1E6A06008[v7];
    *a4 = (id)qword_1E6A05F20[v7];
    *a5 = v8;
  }
  return v7 < 0x1D;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framerate, 0);
  objc_storeStrong((id *)&self->_videoResolution, 0);
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_imageWidth, 0);
}

- (NSNumber)framerate
{
  return self->_framerate;
}

- (HMDVideoResolution)videoResolution
{
  return self->_videoResolution;
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
  v5 = [(HMDVideoAttributes *)self imageWidth];
  [v4 encodeObject:v5 forKey:@"kVideoAttributes__ImageWidth"];

  v6 = [(HMDVideoAttributes *)self imageHeight];
  [v4 encodeObject:v6 forKey:@"kVideoAttributes__ImageHeight"];

  id v7 = [(HMDVideoAttributes *)self framerate];
  [v4 encodeObject:v7 forKey:@"kVideoAttributes__FrameRate"];
}

- (HMDVideoAttributes)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDVideoAttributes;
  v5 = [(HMDVideoAttributes *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoAttributes__ImageWidth"];
    imageWidth = v5->_imageWidth;
    v5->_imageWidth = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoAttributes__ImageHeight"];
    imageHeight = v5->_imageHeight;
    v5->_imageHeight = (NSNumber *)v14;

    uint64_t v16 = [(HMDVideoAttributes *)v5 translateImageWidth:v5->_imageWidth imageHeight:v5->_imageHeight];
    videoResolution = v5->_videoResolution;
    v5->_videoResolution = (HMDVideoResolution *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v20 = [v18 setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"kVideoAttributes__FrameRate"];
    framerate = v5->_framerate;
    v5->_framerate = (NSNumber *)v21;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDVideoAttributes *)self imageWidth];
  [v7 appendFormat:@"\n %@ imageWidth = %@ ", v6, v9];

  v10 = [(HMDVideoAttributes *)self imageHeight];
  [v7 appendFormat:@"\n %@ imageHeight = %@ ", v6, v10];

  v11 = [(HMDVideoAttributes *)self videoResolution];
  v12 = [v11 descriptionWithIndent:v6];
  [v7 appendFormat:@"\n %@ resolution = %@ ", v6, v12];

  id v13 = [(HMDVideoAttributes *)self framerate];
  [v7 appendFormat:@"\n %@ framerate = %@ ", v6, v13];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDVideoAttributes *)self imageWidth];
  [v3 addTLV:1 length:2 number:v4];

  v5 = [(HMDVideoAttributes *)self imageHeight];
  [v3 addTLV:2 length:2 number:v5];

  id v6 = [(HMDVideoAttributes *)self framerate];
  [v3 addTLV:3 number:v6];

  id v7 = [v3 serialize];

  return (NSData *)v7;
}

- (BOOL)_parseFromTLVData
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kVideoAttributes__ImageWidth"];
  id v4 = [MEMORY[0x1E4F5BDE8] wrappertlv:2 name:@"kVideoAttributes__ImageHeight"];
  v5 = [MEMORY[0x1E4F5BDE8] wrappertlv:3 name:@"kVideoAttributes__FrameRate"];
  v17[0] = v3;
  v17[1] = v4;
  v17[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    v8 = [v3 field];
    imageWidth = self->_imageWidth;
    self->_imageWidth = v8;

    v10 = [v4 field];
    imageHeight = self->_imageHeight;
    self->_imageHeight = v10;

    v12 = [(HMDVideoAttributes *)self translateImageWidth:self->_imageWidth imageHeight:self->_imageHeight];
    videoResolution = self->_videoResolution;
    self->_videoResolution = v12;

    uint64_t v14 = [v5 field];
    framerate = self->_framerate;
    self->_framerate = v14;
  }
  return v7;
}

- (id)translateImageWidth:(id)a3 imageHeight:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToNumber:&unk_1F2DC71C8]
    && ([v6 isEqualToNumber:&unk_1F2DC71E0] & 1) != 0)
  {
    uint64_t v7 = 1;
LABEL_88:
    v8 = [[HMDVideoResolution alloc] initWithResolution:v7];
    goto LABEL_89;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC71F8]
    && ([v6 isEqualToNumber:&unk_1F2DC7210] & 1) != 0)
  {
    uint64_t v7 = 2;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7228]
    && ([v6 isEqualToNumber:&unk_1F2DC71F8] & 1) != 0)
  {
    uint64_t v7 = 3;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7240]
    && ([v6 isEqualToNumber:&unk_1F2DC7258] & 1) != 0)
  {
    uint64_t v7 = 4;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7270]
    && ([v6 isEqualToNumber:&unk_1F2DC7288] & 1) != 0)
  {
    uint64_t v7 = 5;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC71C8]
    && ([v6 isEqualToNumber:&unk_1F2DC72A0] & 1) != 0)
  {
    uint64_t v7 = 6;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC71F8]
    && ([v6 isEqualToNumber:&unk_1F2DC72B8] & 1) != 0)
  {
    uint64_t v7 = 7;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7228]
    && ([v6 isEqualToNumber:&unk_1F2DC7210] & 1) != 0)
  {
    uint64_t v7 = 8;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7270]
    && ([v6 isEqualToNumber:&unk_1F2DC72D0] & 1) != 0)
  {
    uint64_t v7 = 9;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC72E8]
    && ([v6 isEqualToNumber:&unk_1F2DC7300] & 1) != 0)
  {
    uint64_t v7 = 10;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC72B8]
    && ([v6 isEqualToNumber:&unk_1F2DC71F8] & 1) != 0)
  {
    uint64_t v7 = 11;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7210]
    && ([v6 isEqualToNumber:&unk_1F2DC7228] & 1) != 0)
  {
    uint64_t v7 = 12;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC72D0]
    && ([v6 isEqualToNumber:&unk_1F2DC7270] & 1) != 0)
  {
    uint64_t v7 = 13;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7300]
    && ([v6 isEqualToNumber:&unk_1F2DC72E8] & 1) != 0)
  {
    uint64_t v7 = 14;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7318]
    && ([v6 isEqualToNumber:&unk_1F2DC7330] & 1) != 0)
  {
    uint64_t v7 = 15;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7348]
    && ([v6 isEqualToNumber:&unk_1F2DC7300] & 1) != 0)
  {
    uint64_t v7 = 16;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7330]
    && ([v6 isEqualToNumber:&unk_1F2DC7318] & 1) != 0)
  {
    uint64_t v7 = 17;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7300]
    && ([v6 isEqualToNumber:&unk_1F2DC7348] & 1) != 0)
  {
    uint64_t v7 = 18;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7288]
    && ([v6 isEqualToNumber:&unk_1F2DC7270] & 1) != 0)
  {
    uint64_t v7 = 19;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7258]
    && ([v6 isEqualToNumber:&unk_1F2DC7240] & 1) != 0)
  {
    uint64_t v7 = 20;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC71F8]
    && ([v6 isEqualToNumber:&unk_1F2DC7228] & 1) != 0)
  {
    uint64_t v7 = 21;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7210]
    && ([v6 isEqualToNumber:&unk_1F2DC71F8] & 1) != 0)
  {
    uint64_t v7 = 22;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC71E0]
    && ([v6 isEqualToNumber:&unk_1F2DC71C8] & 1) != 0)
  {
    uint64_t v7 = 23;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7360]
    && ([v6 isEqualToNumber:&unk_1F2DC7360] & 1) != 0)
  {
    uint64_t v7 = 24;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7300]
    && ([v6 isEqualToNumber:&unk_1F2DC7300] & 1) != 0)
  {
    uint64_t v7 = 25;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC72D0]
    && ([v6 isEqualToNumber:&unk_1F2DC72D0] & 1) != 0)
  {
    uint64_t v7 = 26;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC71C8]
    && ([v6 isEqualToNumber:&unk_1F2DC71C8] & 1) != 0)
  {
    uint64_t v7 = 27;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7378]
    && ([v6 isEqualToNumber:&unk_1F2DC7390] & 1) != 0)
  {
    uint64_t v7 = 28;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_1F2DC7390]
    && [v6 isEqualToNumber:&unk_1F2DC7378])
  {
    uint64_t v7 = 29;
    goto LABEL_88;
  }
  v8 = 0;
LABEL_89:

  return v8;
}

- (HMDVideoAttributes)initWithResolution:(id)a3 framerate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDVideoAttributes;
  uint64_t v9 = [(HMDVideoAttributes *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoResolution, a3);
    id v21 = 0;
    id v22 = 0;
    BOOL v11 = +[HMDVideoAttributes translateImageResolution:v7 imageWidth:&v22 imageHeight:&v21];
    v12 = (NSNumber *)v22;
    id v13 = (NSNumber *)v21;
    uint64_t v14 = v13;
    if (!v11)
    {

      v19 = 0;
      goto LABEL_6;
    }
    imageWidth = v10->_imageWidth;
    v10->_imageWidth = v12;
    uint64_t v16 = v12;

    imageHeight = v10->_imageHeight;
    v10->_imageHeight = v14;
    v18 = v14;

    objc_storeStrong((id *)&v10->_framerate, a4);
  }
  v19 = v10;
LABEL_6:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end