@interface HMBMirrorOutputGroup
- (HMBMirrorOutputGroup)initWithBlockRow:(unint64_t)a3 options:(id)a4;
- (HMBProcessingOptions)options;
- (id)description;
- (unint64_t)blockRow;
@end

@implementation HMBMirrorOutputGroup

- (void).cxx_destruct
{
}

- (unint64_t)blockRow
{
  return self->_blockRow;
}

- (HMBProcessingOptions)options
{
  return self->_options;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMBMirrorOutputGroup *)self blockRow];
  v5 = [(HMBMirrorOutputGroup *)self options];
  v6 = [v3 stringWithFormat:@"<HMBLocalZoneOutputRecords: %lu options: %@>", v4, v5];

  return v6;
}

- (HMBMirrorOutputGroup)initWithBlockRow:(unint64_t)a3 options:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMBMirrorOutputGroup;
  v8 = [(HMBMirrorOutputGroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_blockRow = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

@end