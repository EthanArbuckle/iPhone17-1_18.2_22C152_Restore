@interface HWHandwritingItem
+ (BOOL)supportsSecureCoding;
- (DKDrawing)drawing;
- (HWHandwritingItem)init;
- (HWHandwritingItem)initWithCoder:(id)a3;
- (HWHandwritingItem)initWithDrawing:(id)a3;
- (NSDate)creationDate;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDrawing:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation HWHandwritingItem

- (HWHandwritingItem)initWithDrawing:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HWHandwritingItem;
  v5 = [(HWHandwritingItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08C38] UUID];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [MEMORY[0x263EFF910] date];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    uint64_t v10 = [v4 copy];
    drawing = v5->_drawing;
    v5->_drawing = (DKDrawing *)v10;
  }
  return v5;
}

- (HWHandwritingItem)init
{
  return [(HWHandwritingItem *)self initWithDrawing:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(HWHandwritingItem);
  if (v5)
  {
    uint64_t v6 = [(NSUUID *)self->_uuid copyWithZone:a3];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [(NSDate *)self->_creationDate copyWithZone:a3];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    uint64_t v10 = [(DKDrawing *)self->_drawing copyWithZone:a3];
    drawing = v5->_drawing;
    v5->_drawing = v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HWHandwritingItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HWHandwritingItem *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cd1"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dw1"];
    drawing = v5->_drawing;
    v5->_drawing = (DKDrawing *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_creationDate forKey:@"cd1"];
  [v5 encodeObject:self->_drawing forKey:@"dw1"];
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCreationDate:(id)a3
{
}

- (DKDrawing)drawing
{
  return (DKDrawing *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end