@interface MFCreateStringFromHeaderBytes
@end

@implementation MFCreateStringFromHeaderBytes

uint64_t ___MFCreateStringFromHeaderBytes_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"\\=\\?([^?]*)\\?(q|b)\\?([^?]*)\\?\\=" options:1 error:0];
  _MFCreateStringFromHeaderBytes_mimeRegex = v0;
  return MEMORY[0x1F41817F8](v0);
}

@end