@interface HMBLocalSQLContextRowBlock
- (HMBLocalSQLContextRowBlock)initWithBlockRow:(unint64_t)a3 type:(unint64_t)a4 options:(id)a5;
- (NSData)optionsData;
- (id)attributeDescriptions;
- (unint64_t)blockRow;
- (unint64_t)type;
@end

@implementation HMBLocalSQLContextRowBlock

- (void).cxx_destruct
{
}

- (NSData)optionsData
{
  return self->_optionsData;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)blockRow
{
  return self->_blockRow;
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowBlock blockRow](self, "blockRow"));
  v5 = (void *)[v3 initWithName:@"Row" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBLocalSQLContextRowBlock type](self, "type", v5));
  v8 = (void *)[v6 initWithName:@"Type" value:v7];
  v15[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMBLocalSQLContextRowBlock *)self optionsData];
  if (v10) {
    v11 = @"<not nil>";
  }
  else {
    v11 = @"<nil>";
  }
  v12 = (void *)[v9 initWithName:@"Options Data" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMBLocalSQLContextRowBlock)initWithBlockRow:(unint64_t)a3 type:(unint64_t)a4 options:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMBLocalSQLContextRowBlock;
  v10 = [(HMBLocalSQLContextRowBlock *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_blockRow = a3;
    v10->_type = a4;
    objc_storeStrong((id *)&v10->_optionsData, a5);
  }

  return v11;
}

@end