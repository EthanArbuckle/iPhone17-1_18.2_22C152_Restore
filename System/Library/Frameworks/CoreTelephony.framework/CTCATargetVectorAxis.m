@interface CTCATargetVectorAxis
+ (BOOL)supportsSecureCoding;
- (CTCATargetVectorAxis)initWithCoder:(id)a3;
- (NSNumber)offset;
- (NSNumber)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOffset:(id)a3;
- (void)setRange:(id)a3;
@end

@implementation CTCATargetVectorAxis

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCATargetVectorAxis *)self offset];
  [v3 appendFormat:@", offset=%@", v4];

  v5 = [(CTCATargetVectorAxis *)self range];
  [v3 appendFormat:@", range=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCATargetVectorAxis *)self offset];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setOffset:v7];

  v8 = [(CTCATargetVectorAxis *)self range];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setRange:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTCATargetVectorAxis *)self offset];
  [v6 encodeObject:v4 forKey:@"offset"];

  v5 = [(CTCATargetVectorAxis *)self range];
  [v6 encodeObject:v5 forKey:@"range"];
}

- (CTCATargetVectorAxis)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCATargetVectorAxis;
  v5 = [(CTCATargetVectorAxis *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offset"];
    offset = v5->_offset;
    v5->_offset = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"range"];
    range = v5->_range;
    v5->_range = (NSNumber *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
}

- (NSNumber)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);

  objc_storeStrong((id *)&self->_offset, 0);
}

@end