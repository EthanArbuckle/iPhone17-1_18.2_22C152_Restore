@interface IMDLiteMessageCompressor
+ (IMDLiteMessageCompressor)sharedCompressor;
- (BlastDoorLiteMessageCompressor)compressor;
- (IMDLiteMessageCompressor)init;
- (id)compressData:(id)a3 codecID:(int64_t *)a4;
- (void)setCompressor:(id)a3;
@end

@implementation IMDLiteMessageCompressor

+ (IMDLiteMessageCompressor)sharedCompressor
{
  if (qword_1EA8CA6C8[0] != -1) {
    dispatch_once(qword_1EA8CA6C8, &unk_1F3392580);
  }
  v2 = (void *)qword_1EA8CA6C0;

  return (IMDLiteMessageCompressor *)v2;
}

- (IMDLiteMessageCompressor)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDLiteMessageCompressor;
  v2 = [(IMDLiteMessageCompressor *)&v6 init];
  if (v2)
  {
    v3 = (BlastDoorLiteMessageCompressor *)objc_alloc_init(MEMORY[0x1E4F77E58]);
    compressor = v2->_compressor;
    v2->_compressor = v3;
  }
  return v2;
}

- (id)compressData:(id)a3 codecID:(int64_t *)a4
{
  return (id)MEMORY[0x1F4181798](self->_compressor, sel_compressData_codecID_);
}

- (BlastDoorLiteMessageCompressor)compressor
{
  return self->_compressor;
}

- (void)setCompressor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end