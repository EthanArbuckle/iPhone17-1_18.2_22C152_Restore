@interface NSAttributedString(CSVisualizerMethods)
- (id)cs_rangesMatchingPredicate:()CSVisualizerMethods;
- (uint64_t)cs_writeToFileHandle:()CSVisualizerMethods;
- (void)cs_writeToFileHandle:()CSVisualizerMethods supportingANSIEscapeCodes:;
@end

@implementation NSAttributedString(CSVisualizerMethods)

- (id)cs_rangesMatchingPredicate:()CSVisualizerMethods
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1AD0DB160]();
  v6 = [MEMORY[0x1E4F1CA48] array];
  __p = 0;
  v13 = 0;
  uint64_t v14 = 0;
  +[_CSVisualizerPredicate getRanges:&__p matchingPredicate:v4 inDescription:a1];
  v7 = __p;
  v8 = v13;
  if (__p != v13)
  {
    do
    {
      v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *v7, v7[1]);
      [v6 addObject:v9];

      v7 += 2;
    }
    while (v7 != v8);
  }
  v10 = (void *)[v6 copy];
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }

  return v10;
}

- (void)cs_writeToFileHandle:()CSVisualizerMethods supportingANSIEscapeCodes:
{
  if (a4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__NSAttributedString_CSVisualizerMethods__cs_writeToFileHandle_supportingANSIEscapeCodes___block_invoke;
    v10[3] = &unk_1E5D2AB58;
    v10[4] = a1;
    v10[5] = a3;
    v6 = (void *)MEMORY[0x1AD0DB340](v10);
    v7 = (void *)MEMORY[0x1AD0DB160]();
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(a1, "length"), 0, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1AD0DB160]();
    id v9 = [a1 string];
    fputs((const char *)[v9 UTF8String], a3);
  }
}

- (uint64_t)cs_writeToFileHandle:()CSVisualizerMethods
{
  int v5 = fileno(a3);
  if (v5 < 0 || !isatty(v5))
  {
    BOOL v6 = 0;
  }
  else
  {
    if (-[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::once != -1) {
      dispatch_once(&-[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::once, &__block_literal_global_708);
    }
    BOOL v6 = -[NSAttributedString(CSVisualizerMethods) cs_writeToFileHandle:]::TERM != 0;
  }

  return objc_msgSend(a1, "cs_writeToFileHandle:supportingANSIEscapeCodes:", a3, v6);
}

@end