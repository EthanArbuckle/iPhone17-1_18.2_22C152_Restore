@interface VNTextObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)characterBoxes;
- (NSString)text;
- (VNTextObservation)initWithCoder:(id)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCharacterBoxes:(id)a3;
- (void)setText:(id)a3;
@end

@implementation VNTextObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_characterBoxes, 0);
}

- (void)setText:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  text = self->_text;
  self->_text = v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setCharacterBoxes:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)[v6 copy];
  characterBoxes = self->_characterBoxes;
  self->_characterBoxes = v4;
}

- (NSArray)characterBoxes
{
  return self->_characterBoxes;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNTextObservation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNTextObservation;
    if ([(VNRectangleObservation *)&v10 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      id v6 = [(VNTextObservation *)self characterBoxes];
      v7 = [(VNTextObservation *)v5 characterBoxes];
      char v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNTextObservation;
  id v3 = [(VNRectangleObservation *)&v7 hash];
  v4 = [(VNTextObservation *)self characterBoxes];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (id)vn_cloneObject
{
  v7.receiver = self;
  v7.super_class = (Class)VNTextObservation;
  id v3 = [(VNRectangleObservation *)&v7 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_characterBoxes copy];
    unint64_t v5 = (void *)v3[28];
    v3[28] = v4;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNTextObservation;
  [(VNRectangleObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_text forKey:@"text"];
  [v4 encodeObject:self->_characterBoxes forKey:@"characterBoxes"];
}

- (VNTextObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNTextObservation;
  objc_super v5 = [(VNRectangleObservation *)&v17 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    uint64_t v7 = [v6 copy];
    text = v5->_text;
    v5->_text = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"characterBoxes"];
    uint64_t v13 = [v12 copy];
    characterBoxes = v5->_characterBoxes;
    v5->_characterBoxes = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end