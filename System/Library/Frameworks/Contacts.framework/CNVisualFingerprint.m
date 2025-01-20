@interface CNVisualFingerprint
+ (BOOL)supportsSecureCoding;
+ (id)archiveWithFingerprint:(id)a3;
+ (id)fingerprintFromArchive:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNVisualFingerprint)initWithCoder:(id)a3;
- (CNVisualFingerprint)initWithHashData:(id)a3;
- (CNVisualFingerprint)initWithVNFingerprintHashes:(id)a3;
- (NSArray)hashData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNVisualFingerprint

- (CNVisualFingerprint)initWithVNFingerprintHashes:(id)a3
{
  v4 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_51_0);
  v5 = [(CNVisualFingerprint *)self initWithHashData:v4];

  return v5;
}

uint64_t __51__CNVisualFingerprint_initWithVNFingerprintHashes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hashData];
}

- (CNVisualFingerprint)initWithHashData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVisualFingerprint;
  v5 = [(CNVisualFingerprint *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hashData = v5->_hashData;
    v5->_hashData = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNVisualFingerprint *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (hashData = self->_hashData, (unint64_t)hashData | (unint64_t)v4->_hashData)
      && !-[NSArray isEqual:](hashData, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CNVisualFingerprint)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"hashData"];

  if ([v8 count] == 2)
  {
    self = [(CNVisualFingerprint *)self initWithHashData:v8];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)fingerprintFromArchive:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  [v5 setRequiresSecureCoding:1];
  BOOL v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"hashData"];
  [v5 finishDecoding];

  return v6;
}

+ (id)archiveWithFingerprint:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"hashData"];

  [v5 finishEncoding];
  BOOL v6 = [v5 encodedData];

  return v6;
}

- (NSArray)hashData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end