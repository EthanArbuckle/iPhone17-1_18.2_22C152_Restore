@interface NSAttributedString
@end

@implementation NSAttributedString

void __90__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle_supportingANSIEscapeCodes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v24 = a2;
  v7 = [v24 objectForKeyedSubscript:@"_CSVOutputType"];
  v8 = v7;
  if (v7 && [v7 isEqual:&unk_1EFE43A70])
  {
    fputs("\x1B[1m", *(FILE **)(a1 + 40));
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }

  v10 = [v24 objectForKeyedSubscript:@"_CSVFGColor"];
  v12 = v10;
  if (v10)
  {
    int v13 = CSStore2::ansiColorCodeFromNSNumber(v10, v11);
    fprintf(*(FILE **)(a1 + 40), "\x1B[38;5;%um", v13);
    int v9 = 1;
  }

  v14 = [v24 objectForKeyedSubscript:@"_CSVBGColor"];
  v16 = v14;
  if (v14)
  {
    int v17 = CSStore2::ansiColorCodeFromNSNumber(v14, v15);
    fprintf(*(FILE **)(a1 + 40), "\x1B[48;5;%um", v17);
    int v9 = 1;
  }

  v18 = [v24 objectForKeyedSubscript:@"_CSVLink"];
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !+[_CSVisualizer getUnit:0 inTable:0 fromURL:v18])
    {
      fputs("\x1B[4;38;5;27m", *(FILE **)(a1 + 40));
      int v9 = 1;
    }
  }

  v19 = [v24 objectForKeyedSubscript:@"_CSVFWeight"];
  if (v19)
  {
    if (_NSIsNSNumber())
    {
      [v19 doubleValue];
      if (v20 > 0.0)
      {
        fputs("\x1B[1m", *(FILE **)(a1 + 40));
        int v9 = 1;
      }
    }
  }

  v21 = (void *)MEMORY[0x1AD0DB160]();
  v22 = [*(id *)(a1 + 32) string];
  objc_msgSend(v22, "substringWithRange:", a3, a4);
  id v23 = objc_claimAutoreleasedReturnValue();
  fputs((const char *)[v23 UTF8String], *(FILE **)(a1 + 40));

  if (v9) {
    fputs("\x1B[0m", *(FILE **)(a1 + 40));
  }
}

char *__64__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle___block_invoke()
{
  result = getenv("TERM");
  -[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::TERM = result != 0;
  return result;
}

@end