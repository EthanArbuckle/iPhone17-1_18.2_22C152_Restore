@interface CTCellIdInfo
+ (BOOL)supportsSecureCoding;
+ (id)cellIdInfoFromCellId:(unint64_t)a3 baseId:(int)a4;
- (CTCellIdInfo)initWithCoder:(id)a3;
- (NSNumber)baseId;
- (NSNumber)cellId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTCellIdInfo

+ (id)cellIdInfoFromCellId:(unint64_t)a3 baseId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = objc_alloc_init(CTCellIdInfo);
  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
    cellId = v6->_cellId;
    v6->_cellId = (NSNumber *)v7;

    uint64_t v9 = [NSNumber numberWithInt:v4];
    baseId = v6->_baseId;
    v6->_baseId = (NSNumber *)v9;
  }

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(CTCellIdInfo *)self cellId];
  [v3 appendFormat:@", cellId=%@", v4];

  v5 = [(CTCellIdInfo *)self baseId];
  [v3 appendFormat:@", baseId=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(CTCellIdInfo *)self cellId];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(CTCellIdInfo *)self baseId];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CTCellIdInfo *)self cellId];
  [v4 encodeObject:v5 forKey:@"cellId"];

  id v6 = [(CTCellIdInfo *)self baseId];
  [v4 encodeObject:v6 forKey:@"baseId"];
}

- (CTCellIdInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCellIdInfo;
  uint64_t v5 = [(CTCellIdInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellId"];
    cellId = v5->_cellId;
    v5->_cellId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseId"];
    baseId = v5->_baseId;
    v5->_baseId = (NSNumber *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)cellId
{
  return self->_cellId;
}

- (NSNumber)baseId
{
  return self->_baseId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseId, 0);

  objc_storeStrong((id *)&self->_cellId, 0);
}

@end