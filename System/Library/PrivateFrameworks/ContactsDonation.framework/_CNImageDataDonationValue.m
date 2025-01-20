@interface _CNImageDataDonationValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (_CNImageDataDonationValue)initWithCoder:(id)a3;
- (_CNImageDataDonationValue)initWithImageData:(id)a3 origin:(id)a4;
- (id)copyWithNewExpirationDate:(id)a3;
- (unint64_t)hash;
- (void)acceptDonationValueVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CNImageDataDonationValue

- (_CNImageDataDonationValue)initWithImageData:(id)a3 origin:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNImageDataDonationValue;
  v7 = [(CNDonationValue *)&v12 initWithOrigin:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    imageData = v7->_imageData;
    v7->_imageData = (NSData *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4 = a3;
  v5 = [(CNDonationValue *)self origin];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setExpirationDate:v4];
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = [(_CNImageDataDonationValue *)self imageData];
  v9 = (void *)[v7 initWithImageData:v8 origin:v6];

  return v9;
}

- (_CNImageDataDonationValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNImageDataDonationValue;
  v5 = [(CNDonationValue *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageData"];
    uint64_t v7 = [v6 copy];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CNImageDataDonationValue;
  id v4 = a3;
  [(CNDonationValue *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageData, @"_imageData", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x263F335D0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __37___CNImageDataDonationValue_isEqual___block_invoke;
  v15[3] = &unk_2641FBF68;
  v15[4] = self;
  id v16 = v4;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  objc_super v11 = __37___CNImageDataDonationValue_isEqual___block_invoke_2;
  objc_super v12 = &unk_2641FBF68;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  uint64_t v7 = (void *)MEMORY[0x21669C740](&v9);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, v9, v10, v11, v12, v13);

  return (char)self;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263F335E8];
  v6[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33___CNImageDataDonationValue_hash__block_invoke;
  v7[3] = &unk_2641FBF90;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33___CNImageDataDonationValue_hash__block_invoke_2;
  v6[3] = &unk_2641FBF90;
  v3 = (void *)MEMORY[0x21669C740](v6, a2);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNImageDataDonationValue *)self imageData];
  [v4 visitDonationValue:self imageData:v5];
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
}

@end