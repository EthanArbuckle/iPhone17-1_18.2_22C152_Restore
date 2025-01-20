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
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDVideoAttributes;
  v5 = [(HMDVideoAttributes *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v27[0] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoAttributes__ImageWidth"];
    imageWidth = v5->_imageWidth;
    v5->_imageWidth = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoAttributes__ImageHeight"];
    imageHeight = v5->_imageHeight;
    v5->_imageHeight = (NSNumber *)v14;

    uint64_t v16 = [(HMDVideoAttributes *)v5 translateImageWidth:v5->_imageWidth imageHeight:v5->_imageHeight];
    videoResolution = v5->_videoResolution;
    v5->_videoResolution = (HMDVideoResolution *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
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
  v3 = [MEMORY[0x263F35AD8] creator];
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
  v17[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35A58] wrappertlv:1 name:@"kVideoAttributes__ImageWidth"];
  id v4 = [MEMORY[0x263F35A58] wrappertlv:2 name:@"kVideoAttributes__ImageHeight"];
  v5 = [MEMORY[0x263F35A58] wrappertlv:3 name:@"kVideoAttributes__FrameRate"];
  v17[0] = v3;
  v17[1] = v4;
  v17[2] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
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
  if ([v5 isEqualToNumber:&unk_26E470510]
    && ([v6 isEqualToNumber:&unk_26E470528] & 1) != 0)
  {
    uint64_t v7 = 1;
LABEL_88:
    v8 = [[HMDVideoResolution alloc] initWithResolution:v7];
    goto LABEL_89;
  }
  if ([v5 isEqualToNumber:&unk_26E470540]
    && ([v6 isEqualToNumber:&unk_26E470558] & 1) != 0)
  {
    uint64_t v7 = 2;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470570]
    && ([v6 isEqualToNumber:&unk_26E470540] & 1) != 0)
  {
    uint64_t v7 = 3;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470588]
    && ([v6 isEqualToNumber:&unk_26E4705A0] & 1) != 0)
  {
    uint64_t v7 = 4;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4705B8]
    && ([v6 isEqualToNumber:&unk_26E4705D0] & 1) != 0)
  {
    uint64_t v7 = 5;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470510]
    && ([v6 isEqualToNumber:&unk_26E4705E8] & 1) != 0)
  {
    uint64_t v7 = 6;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470540]
    && ([v6 isEqualToNumber:&unk_26E470600] & 1) != 0)
  {
    uint64_t v7 = 7;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470570]
    && ([v6 isEqualToNumber:&unk_26E470558] & 1) != 0)
  {
    uint64_t v7 = 8;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4705B8]
    && ([v6 isEqualToNumber:&unk_26E470618] & 1) != 0)
  {
    uint64_t v7 = 9;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470630]
    && ([v6 isEqualToNumber:&unk_26E470648] & 1) != 0)
  {
    uint64_t v7 = 10;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470600]
    && ([v6 isEqualToNumber:&unk_26E470540] & 1) != 0)
  {
    uint64_t v7 = 11;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470558]
    && ([v6 isEqualToNumber:&unk_26E470570] & 1) != 0)
  {
    uint64_t v7 = 12;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470618]
    && ([v6 isEqualToNumber:&unk_26E4705B8] & 1) != 0)
  {
    uint64_t v7 = 13;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470648]
    && ([v6 isEqualToNumber:&unk_26E470630] & 1) != 0)
  {
    uint64_t v7 = 14;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470660]
    && ([v6 isEqualToNumber:&unk_26E470678] & 1) != 0)
  {
    uint64_t v7 = 15;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470690]
    && ([v6 isEqualToNumber:&unk_26E470648] & 1) != 0)
  {
    uint64_t v7 = 16;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470678]
    && ([v6 isEqualToNumber:&unk_26E470660] & 1) != 0)
  {
    uint64_t v7 = 17;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470648]
    && ([v6 isEqualToNumber:&unk_26E470690] & 1) != 0)
  {
    uint64_t v7 = 18;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4705D0]
    && ([v6 isEqualToNumber:&unk_26E4705B8] & 1) != 0)
  {
    uint64_t v7 = 19;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4705A0]
    && ([v6 isEqualToNumber:&unk_26E470588] & 1) != 0)
  {
    uint64_t v7 = 20;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470540]
    && ([v6 isEqualToNumber:&unk_26E470570] & 1) != 0)
  {
    uint64_t v7 = 21;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470558]
    && ([v6 isEqualToNumber:&unk_26E470540] & 1) != 0)
  {
    uint64_t v7 = 22;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470528]
    && ([v6 isEqualToNumber:&unk_26E470510] & 1) != 0)
  {
    uint64_t v7 = 23;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4706A8]
    && ([v6 isEqualToNumber:&unk_26E4706A8] & 1) != 0)
  {
    uint64_t v7 = 24;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470648]
    && ([v6 isEqualToNumber:&unk_26E470648] & 1) != 0)
  {
    uint64_t v7 = 25;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470618]
    && ([v6 isEqualToNumber:&unk_26E470618] & 1) != 0)
  {
    uint64_t v7 = 26;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E470510]
    && ([v6 isEqualToNumber:&unk_26E470510] & 1) != 0)
  {
    uint64_t v7 = 27;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4706C0]
    && ([v6 isEqualToNumber:&unk_26E4706D8] & 1) != 0)
  {
    uint64_t v7 = 28;
    goto LABEL_88;
  }
  if ([v5 isEqualToNumber:&unk_26E4706D8]
    && [v6 isEqualToNumber:&unk_26E4706C0])
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

+ (BOOL)translateImageResolution:(id)a3 imageWidth:(id *)a4 imageHeight:(id *)a5
{
  unint64_t v7 = [a3 resolutionType] - 1;
  if (v7 <= 0x1C)
  {
    id v8 = (void *)qword_264A15588[v7];
    *a4 = (id)qword_264A154A0[v7];
    *a5 = v8;
  }
  return v7 < 0x1D;
}

@end