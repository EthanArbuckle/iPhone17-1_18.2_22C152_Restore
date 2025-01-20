@interface VNFaceAttributeCategory
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)allLabelsWithConfidences;
- (VNClassificationObservation)label;
- (VNFaceAttributeCategory)initWithCoder:(id)a3;
- (VNFaceAttributeCategory)initWithRequestRevision:(unint64_t)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (void)_computeLabel;
- (void)encodeWithCoder:(id)a3;
- (void)setAllLabelsWithConfidences:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation VNFaceAttributeCategory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLabelsWithConfidences, 0);

  objc_storeStrong((id *)&self->_mostLikelyLabel, 0);
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (NSArray)allLabelsWithConfidences
{
  return self->_allLabelsWithConfidences;
}

- (void)setLabel:(id)a3
{
}

- (VNClassificationObservation)label
{
  return self->_mostLikelyLabel;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFaceAttributeCategory *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNFaceAttributeCategory *)self requestRevision];
      if (v6 == [(VNFaceAttributeCategory *)v5 requestRevision]
        && ([(VNFaceAttributeCategory *)self label],
            v7 = objc_claimAutoreleasedReturnValue(),
            [(VNFaceAttributeCategory *)v5 label],
            v8 = objc_claimAutoreleasedReturnValue(),
            char v9 = VisionCoreEqualOrNilObjects(),
            v8,
            v7,
            (v9 & 1) != 0))
      {
        v10 = [(VNFaceAttributeCategory *)self allLabelsWithConfidences];
        v11 = [(VNFaceAttributeCategory *)v5 allLabelsWithConfidences];
        char v12 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v10.receiver = self;
  v10.super_class = (Class)VNFaceAttributeCategory;
  id v3 = [(VNFaceAttributeCategory *)&v10 hash];
  unint64_t v4 = [(VNFaceAttributeCategory *)self requestRevision];
  v5 = [(VNFaceAttributeCategory *)self label];
  uint64_t v6 = [v5 hash];

  v7 = [(VNFaceAttributeCategory *)self allLabelsWithConfidences];
  unint64_t v8 = [v7 hash] ^ __ROR8__(v6 ^ __ROR8__(v4 ^ __ROR8__(v3, 51), 51), 51);

  return v8;
}

- (id)vn_cloneObject
{
  uint64_t v3 = [objc_alloc((Class)objc_opt_class()) initWithRequestRevision:self->_requestRevision];
  unint64_t v4 = (void *)v3;
  if (v3)
  {
    objc_storeStrong((id *)(v3 + 8), self->_mostLikelyLabel);
    uint64_t v5 = [(NSArray *)self->_allLabelsWithConfidences copy];
    uint64_t v6 = (void *)v4[2];
    v4[2] = v5;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:0 forKey:@"VNFaceAttributeCategoryVersion"];
  [v4 encodeInteger:self->_requestRevision forKey:@"facrRev"];
  [v4 encodeObject:self->_mostLikelyLabel forKey:@"FAC_label"];
  [v4 encodeObject:self->_allLabelsWithConfidences forKey:@"FAC_LAC"];
}

- (VNFaceAttributeCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"VNFaceAttributeCategoryVersion"])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = -[VNFaceAttributeCategory initWithRequestRevision:](self, "initWithRequestRevision:", [v4 decodeIntegerForKey:@"facrRev"]);
    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"FAC_label"];
      mostLikelyLabel = v5->_mostLikelyLabel;
      v5->_mostLikelyLabel = (VNClassificationObservation *)v7;

      char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), v6, 0);
      objc_super v10 = [v4 decodeObjectOfClasses:v9 forKey:@"FAC_LAC"];
      uint64_t v11 = [v10 copy];
      allLabelsWithConfidences = v5->_allLabelsWithConfidences;
      v5->_allLabelsWithConfidences = (NSArray *)v11;

      self = v5;
      uint64_t v5 = self;
    }
    else
    {
      self = 0;
    }
  }

  return v5;
}

- (VNFaceAttributeCategory)initWithRequestRevision:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNFaceAttributeCategory;
  id v4 = [(VNFaceAttributeCategory *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_requestRevision = a3;
    uint64_t v6 = v4;
  }

  return v5;
}

- (void)setAllLabelsWithConfidences:(id)a3
{
  id v6 = a3;
  id v4 = (NSArray *)[v6 copy];
  allLabelsWithConfidences = self->_allLabelsWithConfidences;
  self->_allLabelsWithConfidences = v4;

  [(VNFaceAttributeCategory *)self _computeLabel];
}

- (void)_computeLabel
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = self->_allLabelsWithConfidences;
  id v4 = 0;
  uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        if (!v4
          || (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v7), "confidence", (void)v14),
              float v10 = v9,
              [(VNObservation *)v4 confidence],
              v10 > v11))
        {
          char v12 = v8;

          id v4 = v12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  mostLikelyLabel = self->_mostLikelyLabel;
  self->_mostLikelyLabel = v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end