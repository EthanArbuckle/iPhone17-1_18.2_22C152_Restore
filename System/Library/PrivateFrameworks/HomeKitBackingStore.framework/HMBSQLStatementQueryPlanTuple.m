@interface HMBSQLStatementQueryPlanTuple
- (HMBSQLStatementQueryPlanTuple)initWithRow:(id)a3;
- (NSString)detail;
- (id)attributeDescriptions;
- (int)parent;
- (int)row;
@end

@implementation HMBSQLStatementQueryPlanTuple

- (void).cxx_destruct
{
}

- (NSString)detail
{
  return self->_detail;
}

- (int)parent
{
  return self->_parent;
}

- (int)row
{
  return self->_row;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[HMBSQLStatementQueryPlanTuple row](self, "row"));
  v5 = (void *)[v3 initWithName:@"Row" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[HMBSQLStatementQueryPlanTuple parent](self, "parent", v5));
  v8 = (void *)[v6 initWithName:@"Parent" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMBSQLStatementQueryPlanTuple *)self detail];
  v11 = (void *)[v9 initWithName:@"Detail" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (HMBSQLStatementQueryPlanTuple)initWithRow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBSQLStatementQueryPlanTuple;
  v5 = [(HMBSQLStatementQueryPlanTuple *)&v11 init];
  if (v5)
  {
    id v6 = [v4 objectAtIndex:0];
    v5->_row = [v6 intValue];

    v7 = [v4 objectAtIndex:1];
    v5->_parent = [v7 intValue];

    uint64_t v8 = [v4 objectAtIndex:3];
    detail = v5->_detail;
    v5->_detail = (NSString *)v8;
  }
  return v5;
}

@end