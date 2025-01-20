@interface CKVDonatorFactory
- (id)donatorWithCascadeItemType:(unsigned __int16)a3 originAppId:(id)a4 error:(id *)a5;
@end

@implementation CKVDonatorFactory

- (id)donatorWithCascadeItemType:(unsigned __int16)a3 originAppId:(id)a4 error:(id *)a5
{
  return (id)[MEMORY[0x1E4F71FD8] donatorWithServiceProvider:0 cascadeItemType:a3 originAppId:a4 userId:0 error:a5];
}

- (void).cxx_destruct
{
}

@end