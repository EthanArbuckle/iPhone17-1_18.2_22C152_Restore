@interface _HDSyncAnchorRangeBox
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_HDSyncAnchorRangeBox)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDSyncAnchorRangeBox

- (void)encodeWithCoder:(id)a3
{
  int64_t start = self->_anchorRange.start;
  id v5 = a3;
  [v5 encodeInt64:start forKey:@"start"];
  [v5 encodeInt64:self->_anchorRange.end forKey:@"end"];
}

- (_HDSyncAnchorRangeBox)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HDSyncAnchorRangeBox;
  id v5 = [(_HDSyncAnchorRangeBox *)&v7 init];
  if (v5)
  {
    v5->_anchorRange.int64_t start = [v4 decodeInt64ForKey:@"start"];
    v5->_anchorRange.end = [v4 decodeInt64ForKey:@"end"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_anchorRange.start == v4[1] && self->_anchorRange.end == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return self->_anchorRange.end ^ self->_anchorRange.start;
}

@end