@interface Font
@end

@implementation Font

uint64_t ___Font_block_invoke()
{
  _Font_font = [MEMORY[0x263F81708] systemFontOfSize:15.0 weight:*MEMORY[0x263F81828]];
  return MEMORY[0x270F9A758]();
}

@end