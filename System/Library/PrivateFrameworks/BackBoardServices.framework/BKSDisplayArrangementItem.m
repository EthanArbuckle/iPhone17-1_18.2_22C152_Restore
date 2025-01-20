@interface BKSDisplayArrangementItem
+ (BOOL)supportsSecureCoding;
- (BKSDisplayArrangementItem)initWithCoder:(id)a3;
- (BKSDisplayArrangementItem)initWithDisplayUUID:(id)a3 relativeToDisplayUUID:(id)a4 alongEdge:(unsigned int)a5 atOffset:(double)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)displayUUID;
- (NSString)relativeDisplayUUID;
- (double)offset;
- (id)description;
- (unint64_t)hash;
- (unsigned)edge;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSDisplayArrangementItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDisplayUUID, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

- (double)offset
{
  return self->_offset;
}

- (unsigned)edge
{
  return self->_edge;
}

- (NSString)relativeDisplayUUID
{
  return self->_relativeDisplayUUID;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (BKSDisplayArrangementItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relativeDisplayUUID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"edge"];
  uint64_t v8 = [v7 unsignedIntValue];

  [v4 decodeDoubleForKey:@"offset"];
  double v10 = v9;

  v11 = [(BKSDisplayArrangementItem *)self initWithDisplayUUID:v5 relativeToDisplayUUID:v6 alongEdge:v8 atOffset:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  displayUUID = self->_displayUUID;
  id v6 = a3;
  [v6 encodeObject:displayUUID forKey:@"displayUUID"];
  [v6 encodeObject:self->_relativeDisplayUUID forKey:@"relativeDisplayUUID"];
  v5 = [NSNumber numberWithUnsignedInt:self->_edge];
  [v6 encodeObject:v5 forKey:@"edge"];

  [v6 encodeDouble:@"offset" forKey:self->_offset];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  [v6 appendString:self->_displayUUID withName:@"displayUUID"];
  [v6 appendString:self->_relativeDisplayUUID withName:@"relativeDisplayUUID" skipIfEmpty:1];
  id v4 = (id)[v6 appendUnsignedInteger:self->_edge withName:@"edge"];
  id v5 = (id)[v6 appendFloat:@"offset" withName:self->_offset];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  displayUUID = self->_displayUUID;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __37__BKSDisplayArrangementItem_isEqual___block_invoke;
  v28[3] = &unk_1E54411E0;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendString:displayUUID counterpart:v28];
  relativeDisplayUUID = self->_relativeDisplayUUID;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __37__BKSDisplayArrangementItem_isEqual___block_invoke_2;
  v26[3] = &unk_1E54411E0;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendString:relativeDisplayUUID counterpart:v26];
  uint64_t edge = self->_edge;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __37__BKSDisplayArrangementItem_isEqual___block_invoke_3;
  v24[3] = &unk_1E5440988;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendUnsignedInteger:edge counterpart:v24];
  double offset = self->_offset;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __37__BKSDisplayArrangementItem_isEqual___block_invoke_4;
  v22 = &unk_1E54409B0;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendCGFloat:&v19 counterpart:offset];
  LOBYTE(v13) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return (char)v13;
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayUUID];
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relativeDisplayUUID];
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) edge];
}

uint64_t __37__BKSDisplayArrangementItem_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) offset];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_displayUUID];
  id v5 = (id)[v3 appendString:self->_relativeDisplayUUID];
  id v6 = (id)[v3 appendUnsignedInteger:self->_edge];
  id v7 = (id)[v3 appendCGFloat:self->_offset];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)description
{
  return (id)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BKSDisplayArrangementItem)initWithDisplayUUID:(id)a3 relativeToDisplayUUID:(id)a4 alongEdge:(unsigned int)a5 atOffset:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BKSDisplayArrangementItem;
  v12 = [(BKSDisplayArrangementItem *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    displayUUID = v12->_displayUUID;
    v12->_displayUUID = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    relativeDisplayUUID = v12->_relativeDisplayUUID;
    v12->_relativeDisplayUUID = (NSString *)v15;

    v12->_uint64_t edge = a5;
    v12->_double offset = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end