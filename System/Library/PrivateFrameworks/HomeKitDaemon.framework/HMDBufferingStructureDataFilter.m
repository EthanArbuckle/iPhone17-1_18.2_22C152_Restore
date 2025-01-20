@interface HMDBufferingStructureDataFilter
- (HMDBufferingStructureDataFilter)initWithUnderlyingWriter:(id)a3 block:(id)a4;
- (id)error;
- (void)emitRootValue:(id)a3;
- (void)failWithError:(id)a3;
@end

@implementation HMDBufferingStructureDataFilter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_writer, 0);
}

- (void)emitRootValue:(id)a3
{
  v4 = (*((void (**)(void))self->_block + 2))();
  id v5 = 0;
  v6 = v5;
  writer = self->_writer;
  if (v4)
  {
    [(HMDStructuredWriter *)writer writeLogicalValue:v4];
  }
  else if (v5)
  {
    [(HMDStructuredWriter *)writer failWithError:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F087E8] hmfUnspecifiedError];
    [(HMDStructuredWriter *)writer failWithError:v8];
  }
}

- (void)failWithError:(id)a3
{
}

- (id)error
{
  return [(HMDStructuredWriter *)self->_writer error];
}

- (HMDBufferingStructureDataFilter)initWithUnderlyingWriter:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    uint64_t v15 = _HMFPreconditionFailure();
    return (HMDBufferingStructureDataFilter *)__HMDResidentSyncAdapter_1_1_block_invoke(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)HMDBufferingStructureDataFilter;
  v10 = [(HMDStructuredDataFoundationWriter *)&v16 initWithMutableContainers:1];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_writer, a3);
    v12 = _Block_copy(v9);
    id block = v11->_block;
    v11->_id block = v12;
  }
  return v11;
}

@end