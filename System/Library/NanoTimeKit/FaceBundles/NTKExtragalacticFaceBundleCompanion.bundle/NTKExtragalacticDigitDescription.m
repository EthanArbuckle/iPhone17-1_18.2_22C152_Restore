@interface NTKExtragalacticDigitDescription
- (NTKExtragalacticDigitDescription)init;
- (id)glyphsForStyle:(unint64_t)a3;
- (void)addGlyph:(id)a3 ofStyle:(unint64_t)a4;
@end

@implementation NTKExtragalacticDigitDescription

- (NTKExtragalacticDigitDescription)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKExtragalacticDigitDescription;
  v2 = [(NTKExtragalacticDigitDescription *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    allGlyphs = v2->_allGlyphs;
    v2->_allGlyphs = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addGlyph:(id)a3 ofStyle:(unint64_t)a4
{
  id v11 = a3;
  allGlyphs = self->_allGlyphs;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  v8 = [(NSMutableDictionary *)allGlyphs objectForKeyedSubscript:v7];

  if (!v8)
  {
    v8 = [MEMORY[0x263EFF980] array];
  }
  [v8 addObject:v11];
  v9 = self->_allGlyphs;
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
}

- (id)glyphsForStyle:(unint64_t)a3
{
  allGlyphs = self->_allGlyphs;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)allGlyphs objectForKeyedSubscript:v4];

  if (v5) {
    objc_super v6 = (void *)[v5 copy];
  }
  else {
    objc_super v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end