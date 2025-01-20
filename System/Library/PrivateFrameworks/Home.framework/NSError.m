@interface NSError
@end

@implementation NSError

uint64_t __47__NSError_HFAdditions__hf_isHomeKitNamingError__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C0F7DE8, &unk_26C0F7E00, &unk_26C0F7E18, &unk_26C0F7E30, &unk_26C0F7E48, &unk_26C0F7E60, &unk_26C0F7E78, &unk_26C0F7E90, 0);
  uint64_t v1 = qword_26AB2FEC8;
  qword_26AB2FEC8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end