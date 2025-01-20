@interface NPStripQuotationMarks
@end

@implementation NPStripQuotationMarks

uint64_t ___NPStripQuotationMarks_block_invoke()
{
  _NPStripQuotationMarks_quotationMarksCharset = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\"'«»‘’‚‛“”„‟‹›「」『』〝〞〟﹁﹂﹃﹄＂＇｢｣"];
  return MEMORY[0x1F41817F8]();
}

@end