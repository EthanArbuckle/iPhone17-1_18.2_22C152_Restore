@interface NTKExtragalacticDigitLoader
- (NTKExtragalacticDigitLoader)initWithDevice:(id)a3;
- (id)_drawInfoKeyForNumber:(id)a3 style:(unint64_t)a4;
- (id)_numberFromString:(id)a3;
- (id)digitDrawInfoForNumber:(id)a3 style:(unint64_t)a4;
- (unint64_t)_glyphColorFromString:(id)a3;
- (unint64_t)_styleFromString:(id)a3;
- (void)_loadDigits;
@end

@implementation NTKExtragalacticDigitLoader

- (NTKExtragalacticDigitLoader)initWithDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKExtragalacticDigitLoader;
  v5 = [(NTKExtragalacticDigitLoader *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
    digits = v5->_digits;
    v5->_digits = (NSMutableDictionary *)v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    drawInfoCache = v5->_drawInfoCache;
    v5->_drawInfoCache = v8;

    v10 = [[NTKExtragalacticDigitRenderer alloc] initWithDevice:v4];
    digitRenderer = v5->_digitRenderer;
    v5->_digitRenderer = v10;

    [(NTKExtragalacticDigitLoader *)v5 _loadDigits];
  }

  return v5;
}

- (void)_loadDigits
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [&unk_26FB0C2A8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    unint64_t v6 = 0x263F08000uLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(&unk_26FB0C2A8);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v9 = [v8 componentsSeparatedByString:@"."];
        if ((unint64_t)[v9 count] >= 3 && (unint64_t)objc_msgSend(v9, "count") < 5)
        {
          uint64_t v11 = [v9 count];
          v12 = [v9 objectAtIndexedSubscript:0];
          v10 = [(NTKExtragalacticDigitLoader *)self _numberFromString:v12];

          if (v11 == 3)
          {
            unint64_t v13 = 0;
            uint64_t v14 = 2;
          }
          else
          {
            v15 = [v9 objectAtIndexedSubscript:1];
            unint64_t v13 = [(NTKExtragalacticDigitLoader *)self _styleFromString:v15];

            uint64_t v14 = 3;
          }
          v16 = [v9 objectAtIndexedSubscript:v14];
          unint64_t v17 = [(NTKExtragalacticDigitLoader *)self _glyphColorFromString:v16];

          v18 = [(NSMutableDictionary *)self->_digits objectForKeyedSubscript:v10];
          if (!v18) {
            v18 = objc_alloc_init(NTKExtragalacticDigitDescription);
          }
          v19 = [[NTKExtragalacticGlyphDescription alloc] initWithName:v8 color:v17 style:v13];
          [(NTKExtragalacticDigitDescription *)v18 addGlyph:v19 ofStyle:v13];
          [(NSMutableDictionary *)self->_digits setObject:v18 forKeyedSubscript:v10];

          unint64_t v6 = 0x263F08000;
        }
        else
        {
          v10 = [*(id *)(v6 + 2880) stringWithFormat:@"Oops, only expecting 3 or 4 components but got %lu", objc_msgSend(v9, "count")];
        }
      }
      uint64_t v4 = [&unk_26FB0C2A8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
}

- (id)digitDrawInfoForNumber:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_digits objectForKeyedSubscript:v6];
  if (v7)
  {
    v8 = [(NTKExtragalacticDigitLoader *)self _drawInfoKeyForNumber:v6 style:a4];
    v9 = [(NSCache *)self->_drawInfoCache objectForKey:v8];
    if (!v9)
    {
      v9 = [(NTKExtragalacticDigitRenderer *)self->_digitRenderer loadDrawInfoForDigit:v7 inStyle:a4];
      [(NSCache *)self->_drawInfoCache setObject:v9 forKey:v8];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_drawInfoKeyForNumber:(id)a3 style:(unint64_t)a4
{
  return (id)[NSString stringWithFormat:@"%@-%lu", a3, a4];
}

- (id)_numberFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = &unk_26FB0C0B8;
  if (([v3 isEqualToString:@"zero"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"one"])
    {
      uint64_t v4 = &unk_26FB0C0D0;
    }
    else if ([v3 isEqualToString:@"two"])
    {
      uint64_t v4 = &unk_26FB0C0E8;
    }
    else if ([v3 isEqualToString:@"three"])
    {
      uint64_t v4 = &unk_26FB0C100;
    }
    else if ([v3 isEqualToString:@"four"])
    {
      uint64_t v4 = &unk_26FB0C118;
    }
    else if ([v3 isEqualToString:@"five"])
    {
      uint64_t v4 = &unk_26FB0C130;
    }
    else if ([v3 isEqualToString:@"six"])
    {
      uint64_t v4 = &unk_26FB0C148;
    }
    else if ([v3 isEqualToString:@"seven"])
    {
      uint64_t v4 = &unk_26FB0C160;
    }
    else if ([v3 isEqualToString:@"eight"])
    {
      uint64_t v4 = &unk_26FB0C178;
    }
    else if ([v3 isEqualToString:@"nine"])
    {
      uint64_t v4 = &unk_26FB0C190;
    }
  }

  return v4;
}

- (unint64_t)_styleFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"A"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"B"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"C"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"D"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_glyphColorFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"0"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"1"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"2"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawInfoCache, 0);
  objc_storeStrong((id *)&self->_digits, 0);

  objc_storeStrong((id *)&self->_digitRenderer, 0);
}

@end