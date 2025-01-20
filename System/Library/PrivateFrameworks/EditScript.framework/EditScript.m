uint64_t IsCharacterAtIndexMemberOfCharacterSet(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a1;
  v6 = a3;
  v7 = [v5 characterAtIndex:*a2];
  if (v7 >> 11 == 27 && (v8 = *a2 + 1, v8 < [v5 length]))
  {
    ++*a2;
    v9 = objc_msgSend(v6, "longCharacterIsMember:", objc_msgSend(v5, "characterAtIndex:") + (v7 << 10) - 56613888);
  }
  else
  {
    v9 = [v6 characterIsMember:v7];
  }
  v10 = v9;

  return v10;
}

uint64_t TestEditScriptRanged(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  v13 = +[ESEditScriptRanged editScriptFromString:v11 toString:v12 chunkSize:a3 orderAtomsAscending:a4 operationPrecedence:a5 options:a6];
  v14 = [v13 applyToString:v11];
  if (([v14 isEqualToString:v12] & 1) == 0
    && ([v14 length] || objc_msgSend(v12, "length")))
  {
    if (v11) {
      NSPrintLine(v11, v16, v17, v18, v19, v20, v21, v22, v52);
    }
    if (v12) {
      NSPrintLine(v12, v16, v17, v18, v19, v20, v21, v22, v52);
    }
    NSPrintLine(@"OPTIONS: %d, CHUNK-SIZE: %@   ATOM-ORDER: %@", v16, v17, v18, v19, v20, v21, v22, a6);
    NSPrint(@"%@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v13);
    NSPrintLine(@"%@", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v14);
    NSPrintLine(@"FAILED", v37, v38, v39, v40, v41, v42, v43, v53);
    NSPrintLine(&stru_26EC8A8E0, v44, v45, v46, v47, v48, v49, v50, v54);
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

void NSPrintLine(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  NSPrint(@"%@\n", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);
}

void NSPrint(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  uint64_t v12 = (FILE *)*MEMORY[0x263EF8358];
  id v13 = v11;
  fputs((const char *)[v13 UTF8String], v12);
}

uint64_t TestEditScriptSmallestSingleEditRanged(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = +[ESEditScriptRanged editScriptForSmallestSingleEditFromString:v3 toString:v4];
  v6 = [v5 applyToString:v3];
  if (([v6 isEqualToString:v4] & 1) == 0 && (objc_msgSend(v6, "length") || objc_msgSend(v4, "length"))
    || ([v5 script],
        v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v8 >= 2))
  {
    if (v3) {
      NSPrintLine(v3, v9, v10, v11, v12, v13, v14, v15, v39);
    }
    if (v4) {
      NSPrintLine(v4, v9, v10, v11, v12, v13, v14, v15, v39);
    }
    NSPrint(@"%@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
    NSPrintLine(@"%@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v6);
    NSPrintLine(@"FAILED", v24, v25, v26, v27, v28, v29, v30, v40);
    NSPrintLine(&stru_26EC8A8E0, v31, v32, v33, v34, v35, v36, v37, v41);
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

BOOL TestEditScriptIndexed(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  int v59 = a3;
  uint64_t v9 = +[ESEditScriptIndexed editScriptFromArray:v7 toArray:v8 orderAtomsAscending:a3 operationPrecedence:a4];
  uint64_t v10 = [v9 applyToArray:v7];
  v60 = v10;
  BOOL v63 = ([v10 isEqual:v8] & 1) != 0 || !objc_msgSend(v10, "count") && !objc_msgSend(v8, "count");
  v61 = v9;
  v62 = v7;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v11 = [v9 script];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        if ([v16 indexInArrayB] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v17 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v16, "indexInArrayB"));
          uint64_t v18 = [v16 replacementText];
          char v19 = [v17 isEqualToString:v18];

          if ((v19 & 1) == 0)
          {
            NSLog(&cfstr_IndexinarraybF.isa, [v16 indexInArrayB]);
            BOOL v63 = 0;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v13);
  }

  if (!v63)
  {
    if (v62) {
      NSPrintLine(@"%@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v62);
    }
    if (v8) {
      NSPrintLine(@"%@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v8);
    }
    uint64_t v27 = @"DESCENDING";
    if (v59) {
      uint64_t v27 = @"ASCENDING";
    }
    NSPrintLine(@"ATOM-ORDER: %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v27);
    NSPrint(@"%@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v61);
    NSPrintLine(@"%@", v35, v36, v37, v38, v39, v40, v41, (uint64_t)v60);
    NSPrintLine(@"FAILED", v42, v43, v44, v45, v46, v47, v48, v57);
    NSPrintLine(&stru_26EC8A8E0, v49, v50, v51, v52, v53, v54, v55, v58);
  }

  return v63;
}

uint64_t TestEditScript(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  LODWORD(v5) = TestEditScriptSmallestSingleEditRanged(v3, v4);
  char v6 = 1;
  do
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6 & 1;
    do
    {
      int v9 = TestEditScriptRanged(v3, v4, 0, 0, v7, v8);
      int v10 = v9 & TestEditScriptRanged(v3, v4, 1, 0, v7, v8);
      int v11 = TestEditScriptRanged(v3, v4, 0, 1, v7, v8);
      int v12 = v10 & v11 & TestEditScriptRanged(v3, v4, 1, 1, v7, v8);
      uint64_t v13 = [v3 componentsSeparatedByString:@" "];
      uint64_t v14 = [v4 componentsSeparatedByString:@" "];
      int v15 = v12 & TestEditScriptIndexed(v13, v14, 0, v7);
      uint64_t v5 = v5 & TestEditScriptIndexed(v13, v14, 1, v7) & v15;

      ++v7;
    }
    while (v7 != 6);
    char v6 = 0;
  }
  while ((v8 & 1) != 0);

  return v5;
}

uint64_t TestSmallestEditThinkLikeAHuman(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = +[ESEditScriptRanged editScriptForSmallestSingleEditFromString:v5 toString:v6];
  int v9 = [v8 applyToString:v5];
  char v10 = [v9 isEqualToString:v6];
  int v11 = [v8 script];
  unint64_t v12 = [v11 count];

  if (v12 < 2) {
    char v13 = v10;
  }
  else {
    char v13 = 0;
  }
  uint64_t v14 = [v8 script];
  uint64_t v15 = [v14 firstObject];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = [v8 script];
    uint64_t v18 = [v17 firstObject];
    id v57 = v6;
    id v19 = v5;
    uint64_t v20 = v9;
    id v21 = v7;
    char v22 = [v18 isEqual:v7];

    char v30 = v22 & v13;
    id v7 = v21;
    int v9 = v20;
    id v5 = v19;
    id v6 = v57;
    if (v30)
    {
LABEL_6:
      uint64_t v31 = 1;
      goto LABEL_13;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_6;
    }
  }
  if (v5) {
    NSPrintLine(v5, v23, v24, v25, v26, v27, v28, v29, v54);
  }
  if (v6) {
    NSPrintLine(v6, v23, v24, v25, v26, v27, v28, v29, v54);
  }
  NSPrint(@"%@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v8);
  NSPrintLine(@"%@", v32, v33, v34, v35, v36, v37, v38, (uint64_t)v9);
  NSPrintLine(@"FAILED", v39, v40, v41, v42, v43, v44, v45, v55);
  NSPrintLine(&stru_26EC8A8E0, v46, v47, v48, v49, v50, v51, v52, v56);
  uint64_t v31 = 0;
LABEL_13:

  return v31;
}

uint64_t TestEditScriptDataArray(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[ESEditScriptDataArray EditScriptDataWithString:a1 chunkSize:a2];
  id v7 = [v6 data];
  uint64_t v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    int v9 = [v6 data];
    NSPrint(@"actual: %@, expected: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  }
  return v8;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = (void *)MEMORY[0x23EC9C3F0](*(void *)&argc, argv, envp);
  id v4 = (void *)MEMORY[0x263EFFA68];
  int v5 = TestEditScriptDataArray((uint64_t)&stru_26EC8A8E0, 1, MEMORY[0x263EFFA68]);
  int v6 = v5 & TestEditScriptDataArray(0, 1, v4);
  int v7 = TestEditScriptDataArray((uint64_t)&stru_26EC8A8E0, 0, v4);
  int v8 = v6 & v7 & TestEditScriptDataArray(0, 0, v4);
  LODWORD(v4) = TestEditScriptDataArray(@"Test. Test2?", 1, &unk_26EC8C0F8);
  int v9 = v4 & TestEditScriptDataArray(@"Emoji 🇩🇪?", 0, &unk_26EC8C110);
  int v10 = v9 & TestSmallestEditThinkLikeAHuman(@"A nation", @"A nation", 0);
  uint64_t v11 = +[ESAtomRanged atomWithEditRange:1, 0, @" new" replacementText];
  int v12 = v8 & v10 & TestSmallestEditThinkLikeAHuman(@"A nation", @"A new nation", v11);

  uint64_t v13 = +[ESAtomRanged atomWithEditRange:replacementText:](ESAtomRanged, "atomWithEditRange:replacementText:", 1, 4, &stru_26EC8A8E0);
  int v14 = TestSmallestEditThinkLikeAHuman(@"A new nation", @"A nation", v13);

  uint64_t v15 = +[ESAtomRanged atomWithEditRange:18, 0, @"in Spain " replacementText];
  int v16 = v14 & TestSmallestEditThinkLikeAHuman(@"The rain in Spain falls mainly on the plane", @"The rain in Spain in Spain falls mainly on the plane", v15);

  uint64_t v17 = +[ESAtomRanged atomWithEditRange:1, 0, @" nat w" replacementText];
  int v18 = v12 & v16 & TestSmallestEditThinkLikeAHuman(@"A nation", @"A nat w nation", v17);

  uint64_t v19 = +[ESAtomRanged atomWithEditRange:1, 0, @" nations" replacementText];
  LODWORD(v4) = TestSmallestEditThinkLikeAHuman(@"A nation", @"A nations nation", (void *)v19);

  LODWORD(v4) = v4 & TestEditScript(@"alpha beta charlie delta", @"alpha charlie delta");
  LODWORD(v4) = v4 & TestEditScript(@"The rain in spain falls", @"The reign of spain falls");
  LODWORD(v19) = v18 & v4 & TestEditScript(@"aa", @"aaa");
  LODWORD(v4) = TestEditScript(@"Are", @"You sure it works?");
  LODWORD(v4) = v4 & TestEditScript(@"😀 test", @"😁 test");
  LODWORD(v4) = v4 & TestEditScript(@"🕦", @"🕒");
  LODWORD(v4) = v4 & TestEditScript(@"◐", @"◓");
  LODWORD(v4) = v4 & TestEditScript(@"Behold there🍳 are many are call but you were chosen", @"Behold there are many called😃 but few are chosen");
  LODWORD(v4) = v4 & TestEditScript(@"Four score and seven years ago our fore fathers brought forth liberty for you", @"Four score cortis and seven years ago our forefathers brought faith liberty.");
  LODWORD(v4) = v4 & TestEditScript(@"Saturday", @"Sunday");
  LODWORD(v4) = v4 & TestEditScript(@"abe", @"abcde");
  int v20 = v19 & v4 & TestEditScript(@"Equal", @"Equal");
  LODWORD(v19) = TestEditScript(&stru_26EC8A8E0, @"Testing");
  LODWORD(v4) = v19 & TestEditScript(@"Testing", &stru_26EC8A8E0);
  int v21 = v4 & TestEditScript(&stru_26EC8A8E0, &stru_26EC8A8E0);
  int v22 = v21 & TestEditScript(@"Many are cold but few are frozen", @"Hence many are called but few are chosen");
  int v23 = v22 & TestEditScript(@"Fools mock but they shall mourn", @"Hence mock but they");
  int v24 = v23 & TestEditScript(@" This is a fast", @" This is a blast");
  int v25 = v24 & TestEditScript(@"The invitations", @"Documentation");
  LODWORD(v4) = v25 & TestEditScript(0, 0);
  LODWORD(v4) = v4 & TestEditScript(0, @"Test");
  int v26 = v20 & v4 & TestEditScript(@"Test", 0);
  if ((v26 & TestEditScript(@"Directions to san francisco", @"Directions to San Francisco")) != 0) {
    uint64_t v34 = @"Passed all tests!";
  }
  else {
    uint64_t v34 = @"Failed at least 1 test.";
  }
  NSPrintLine(v34, v27, v28, v29, v30, v31, v32, v33, v36);
  return 0;
}

void NSLog(NSString *format, ...)
{
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}