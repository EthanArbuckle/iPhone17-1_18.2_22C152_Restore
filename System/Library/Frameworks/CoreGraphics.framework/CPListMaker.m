@interface CPListMaker
+ (void)makeListsInChunk:(id)a3;
+ (void)makeListsInLayoutArea:(id)a3;
+ (void)makeListsInPage:(id)a3;
- (BOOL)makeListFrom:(CPListInfo *)a3;
- (CPListMaker)initWithLayoutArea:(id)a3;
- (void)dealloc;
- (void)dispose;
- (void)fetchTextLine:(id)a3;
- (void)fetchTextLinesInColumn:(id)a3;
- (void)finalize;
- (void)makeListItemFrom:(CPListInfo *)a3 stopAt:(unsigned int)a4;
- (void)makeLists;
- (void)makeListsInColumn:(id)a3;
@end

@implementation CPListMaker

- (void)makeLists
{
  if (self->spacers)
  {
    unsigned int v3 = [(CPObject *)self->area count];
    if (v3)
    {
      unsigned int v4 = v3;
      uint64_t v5 = 0;
      do
      {
        [(CPListMaker *)self makeListsInColumn:[(CPObject *)self->area childAtIndex:v5]];
        uint64_t v5 = (v5 + 1);
      }
      while (v4 != v5);
    }
  }
}

- (void)makeListsInColumn:(id)a3
{
  [(CPListMaker *)self fetchTextLinesInColumn:a3];
  uint64_t v4 = 0;
  CGRect v5 = CGRectNull;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  CFTypeRef cf_8 = 0;
  [(CPListMaker *)self makeListFrom:&v4];
  if (cf_8) {
    CFRelease(cf_8);
  }
}

- (BOOL)makeListFrom:(CPListInfo *)a3
{
  LOBYTE(v5) = 0;
  unsigned int var0 = a3->var0;
  unsigned int v74 = var0;
  unsigned int v75 = 0;
  CGRect v76 = CGRectNull;
  CFTypeRef cf = 0;
  memset(v78, 0, 24);
  *(_DWORD *)((char *)&v78[1] + 7) = 0;
  v78[3] = a3->var11;
  if (var0 >= self->textLineCount) {
    goto LABEL_111;
  }
  BOOL v5 = 0;
  v7 = (unsigned int *)&v78[1] + 1;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    id v9 = self->textLines[var0];
    int v10 = objc_msgSend(v9, "isListItem", v63);
    LOBYTE(v78[2]) = v10;
    if (!v10) {
      goto LABEL_32;
    }
    unsigned int v75 = [v9 listSpacerIndex];
    CGRect v76 = CGRectNull;
    objc_msgSend(-[NSArray objectAtIndex:](self->spacers, "objectAtIndex:", v75), "getValue:", &v76);
    BOOL v11 = v76.origin.x != INFINITY;
    if (v76.origin.y == INFINITY) {
      BOOL v11 = 0;
    }
    LOBYTE(v78[2]) = v11;
    if (!v11) {
      goto LABEL_32;
    }
    v12 = (unsigned int *)objc_msgSend(v9, "firstWord", *(_OWORD *)&v76.origin);
    uint64_t v13 = [v9 charSequence];
    BOOL v14 = !v12 || v13 == 0;
    BOOL v15 = !v14;
    LOBYTE(v78[2]) = v15;
    if (v14
      || (v16 = (void *)v13, CFMutableStringRef Mutable = CFStringCreateMutable(v8, v12[1]), LOBYTE(v78[2]) = Mutable != 0, !Mutable))
    {
LABEL_32:
      if (!a3->var4) {
        goto LABEL_78;
      }
      [v9 bounds];
      if (v27 != INFINITY && v28 != INFINITY && a3->var2.origin.x <= v27)
      {
        double y = a3->var2.origin.y;
        if (y <= v28 + v29 && y + a3->var2.size.height >= v28) {
          goto LABEL_78;
        }
      }
      goto LABEL_99;
    }
    v18 = Mutable;
    uint64_t v19 = *v12;
    unsigned int v20 = v12[1];
    if (v19 < v20 + v19)
    {
      do
      {
        chars[0] = 0;
        chars[0] = *(_WORD *)([v16 charAtIndex:v19] + 72);
        CFStringAppendCharacters(v18, chars, 1);
        uint64_t v19 = (v19 + 1);
        --v20;
      }
      while (v20);
    }
    if (cf) {
      CFRelease(cf);
    }
    CFTypeRef cf = v18;
    CFRetain(v18);
    CFRelease(v18);
    if (v75 == a3->var1)
    {
      if (a3->var8)
      {
        CFIndex Length = CFStringGetLength((CFStringRef)cf);
        v22.length = a3->var5;
        unsigned int var6 = a3->var6;
        CFIndex v24 = var6 + LODWORD(v22.length);
        if (LODWORD(v22.length) && Length > v24)
        {
          v22.location = 0;
          CFStringRef v25 = CFStringCreateWithSubstring(v8, a3->var3, v22);
          int HasPrefix = CFStringHasPrefix((CFStringRef)cf, v25);
          CFRelease(v25);
          if (!HasPrefix) {
            goto LABEL_99;
          }
          unsigned int var6 = a3->var6;
        }
        else if (Length <= v24)
        {
          goto LABEL_99;
        }
        if (!var6
          || (int v46 = CFStringGetLength(a3->var3),
              v79.length = a3->var6,
              v79.location = (v46 - LODWORD(v79.length)),
              CFStringRef v47 = CFStringCreateWithSubstring(v8, a3->var3, v79),
              int HasSuffix = CFStringHasSuffix((CFStringRef)cf, v47),
              CFRelease(v47),
              HasSuffix))
        {
          CFIndex var5 = a3->var5;
          if (*(void *)&a3->var5)
          {
            v80.length = CFStringGetLength(a3->var3) - (a3->var5 + (unint64_t)a3->var6);
            v80.location = var5;
            CFStringRef v50 = CFStringCreateWithSubstring(v8, a3->var3, v80);
            v81.length = CFStringGetLength((CFStringRef)cf) - (a3->var5 + (unint64_t)a3->var6);
            v81.location = var5;
            CFStringRef v51 = CFStringCreateWithSubstring(v8, (CFStringRef)cf, v81);
          }
          else
          {
            CFStringRef v50 = (const __CFString *)CFRetain(a3->var3);
            CFStringRef v51 = (const __CFString *)CFRetain(cf);
          }
          CFStringRef v52 = v51;
          int var4 = a3->var4;
          if (!var4)
          {
            BOOL v54 = CFEqual(v50, v51);
LABEL_81:
            int v57 = v54;
            goto LABEL_84;
          }
          if (CPOrdinalLexerTypedStringToInt(v51, var4, v7))
          {
            BOOL v54 = HIDWORD(v78[1]) == a3->var7 + 1;
            goto LABEL_81;
          }
          int v58 = a3->var4;
          if (v58 == 4) {
            int v59 = 6;
          }
          else {
            int v59 = 0;
          }
          if (v58 == 3) {
            int v60 = 5;
          }
          else {
            int v60 = v59;
          }
          if (v60)
          {
            *(_DWORD *)chars = 0;
            int v57 = 0;
            if (CPOrdinalLexerTypedStringToInt(v52, v60, v7))
            {
              if (CPOrdinalLexerTypedStringToInt(v50, v60, (unsigned int *)chars)
                && (int v61 = *(_DWORD *)chars, HIDWORD(v78[1]) == *(_DWORD *)chars + 1))
              {
                a3->int var4 = v60;
                a3->var7 = v61;
                int v57 = 1;
              }
              else
              {
                int v57 = 0;
              }
            }
LABEL_84:
            CFRelease(v52);
            CFRelease(v50);
            if (v57)
            {
              [(CPListMaker *)self makeListItemFrom:a3 stopAt:v74];
              v78[0] = *(void *)&a3->var4;
              LODWORD(v78[1]) = a3->var6;
              CPListInfoCopy((long long *)&v74, (uint64_t)a3);
              BOOL v5 = 1;
              a3->var9 = 1;
              goto LABEL_78;
            }
            goto LABEL_99;
          }
          CFRelease(v52);
          CFRelease(v50);
        }
LABEL_99:
        a3->var10 = 1;
        goto LABEL_100;
      }
    }
    else if (a3->var8)
    {
      if (v76.origin.x + v76.size.width > a3->var2.origin.x + a3->var2.size.width)
      {
        CFAllocatorRef v32 = v8;
        list = self->list;
        self->list = 0;
        *(_DWORD *)chars = v74;
        int v68 = 0;
        CGRect v69 = CGRectNull;
        uint64_t v71 = 0;
        long long v72 = 0uLL;
        CFTypeRef v70 = 0;
        v73 = a3;
        *(_DWORD *)((char *)&v72 + 7) = 0;
        BOOL v34 = [(CPListMaker *)self makeListFrom:chars];

        self->list = list;
        if (!v34) {
          a3->var10 = 1;
        }
        unsigned int v74 = *(_DWORD *)chars;
        if (v70) {
          CFRelease(v70);
        }
        CFAllocatorRef v8 = v32;
        goto LABEL_78;
      }
      goto LABEL_99;
    }
    v65 = v7;
    BOOL v66 = v5;
    CFStringRef v35 = (const __CFString *)cf;
    CFIndex v36 = CFStringGetLength((CFStringRef)cf);
    do
    {
      CFIndex v37 = v36;
      if (v36-- < 1)
      {
        v78[0] = 0;
        v78[1] = 0;
        BOOL v5 = v66;
        v7 = v65;
        goto LABEL_77;
      }
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v35, v36);
      unsigned int CharacterType = CPOrdinalLexerGetCharacterType(CharacterAtIndex);
    }
    while (!CharacterType);
    if (CharacterType == 2) {
      unsigned int v41 = 1;
    }
    else {
      unsigned int v41 = CharacterType;
    }
    if (!v36)
    {
LABEL_70:
      CFIndex v45 = 0;
      BOOL v5 = v66;
      if (v41 == 1)
      {
LABEL_71:
        if (CharacterAtIndex == 48) {
          unsigned int v41 = 2;
        }
        else {
          unsigned int v41 = 1;
        }
      }
      goto LABEL_74;
    }
    CFAllocatorRef v63 = v8;
    CFIndex v42 = v37 - 2;
    CFIndex v43 = v36;
    while (1)
    {
      unsigned int v64 = v41;
      uint64_t v44 = v41;
      CFIndex v45 = v43;
      while (1)
      {
        CFIndex v43 = v42;
        int CharacterAtIndex = CFStringGetCharacterAtIndex(v35, v42);
        if ((CPOrdinalLexerTestCharacterType[v44]() & 1) == 0) {
          break;
        }
        CFIndex v42 = v43 - 1;
        CFIndex v45 = v43;
        if (!v43)
        {
          CFAllocatorRef v8 = v63;
          unsigned int v41 = v64;
          goto LABEL_70;
        }
      }
      unsigned int v41 = v64;
      if (v64 != 4) {
        break;
      }
      CFAllocatorRef v8 = v63;
      if ((CharacterAtIndex - 65) >= 0x1A)
      {
LABEL_107:
        CFIndex v37 = v36 - v43;
        goto LABEL_110;
      }
      unsigned int v41 = 6;
LABEL_59:
      CFIndex v42 = v43 - 1;
      if (!v43)
      {
        CFIndex v45 = 0;
        CFIndex v37 = v36 - v42;
        BOOL v5 = v66;
        CFAllocatorRef v8 = v63;
        goto LABEL_74;
      }
    }
    CFAllocatorRef v8 = v63;
    if (v64 == 3)
    {
      if ((CharacterAtIndex - 97) > 0x19) {
        goto LABEL_107;
      }
      unsigned int v41 = 5;
      goto LABEL_59;
    }
    CFIndex v37 = v36 - v43;
    if (v64 == 1)
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v35, v45);
      BOOL v5 = v66;
      goto LABEL_71;
    }
LABEL_110:
    BOOL v5 = v66;
LABEL_74:
    v78[0] = __PAIR64__(v45, v41);
    LODWORD(v78[1]) = CFStringGetLength((CFStringRef)cf) - (v45 + v37);
    if (*(void *)((char *)v78 + 4))
    {
      v82.location = v45;
      v82.length = v37;
      CFStringRef v55 = CFStringCreateWithSubstring(v8, (CFStringRef)cf, v82);
      v7 = v65;
      LODWORD(v78[0]) = CPOrdinalLexerStringToInt(v55, v65);
      CFRelease(v55);
    }
    else
    {
      v7 = v65;
      LODWORD(v78[0]) = CPOrdinalLexerStringToInt((const __CFString *)cf, v65);
    }
LABEL_77:
    CPListInfoCopy((long long *)&v74, (uint64_t)a3);
LABEL_78:
    if (!a3->var10)
    {
      int v56 = v74;
      goto LABEL_104;
    }
LABEL_100:
    if (a3->var9)
    {
      [(CPListMaker *)self makeListItemFrom:a3 stopAt:v74];
      a3->var9 = 0;
    }
    if (a3->var11) {
      break;
    }
    a3->int var4 = 0;
    int v56 = (__PAIR64__(v74, a3->var0) - v74) >> 32;
    a3->var8 = 0;
    a3->var10 = 0;
LABEL_104:
    unsigned int var0 = v56 + 1;
    unsigned int v74 = var0;
  }
  while (var0 < self->textLineCount);
LABEL_111:
  if (a3->var9)
  {
    [(CPListMaker *)self makeListItemFrom:a3 stopAt:v74];
    a3->var9 = 0;
  }
  if (v5 && v74 > a3->var0) {
    a3->unsigned int var0 = v74 - 1;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

- (void)makeListItemFrom:(CPListInfo *)a3 stopAt:(unsigned int)a4
{
  uint64_t var0 = a3->var0;
  if (var0 < a4)
  {
    id v8 = self->textLines[var0];
    id v9 = (void *)[v8 parent];
    if (v9)
    {
      int v10 = v9;
      if (v8 != (id)[v9 firstChild]) {
        int v10 = splitParagraphAtTextLine(v10, (uint64_t)v8, 0);
      }
      v18 = objc_alloc_init(CPParagraphListItem);
      [(CPParagraphListItem *)v18 setNumber:a3->var7];
      if (!a3->var9)
      {

        BOOL v11 = objc_alloc_init(CPList);
        self->list = v11;
        -[CPList setSpacer:](v11, "setSpacer:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, a3->var2.size.height);
        [(CPList *)self->list setType:a3->var4];
        [(CPList *)self->list setOrdinalPrefixLength:a3->var5];
        [(CPList *)self->list setOrdinalSuffixLength:a3->var6];
      }
      if (![(CPList *)self->list containsParagraph:v10]) {
        [(CPParagraphListItem *)v18 addParagraph:v10];
      }
      unsigned int v12 = a3->var0 + 1;
      if (v12 < a4)
      {
        unsigned int v13 = ~a3->var0 + a4;
        uint64_t v14 = v12;
        do
        {
          id v8 = self->textLines[v14];
          uint64_t v15 = [v8 parent];
          if ((void *)v15 != v10 && v15 != 0)
          {
            v17 = (void *)v15;
            if (![(CPList *)self->list containsParagraph:v15]) {
              [(CPParagraphListItem *)v18 addParagraph:v17];
            }
            int v10 = v17;
          }
          ++v14;
          --v13;
        }
        while (v13);
      }
      if ([(CPParagraphListItem *)v18 paragraphCount]) {
        [(CPList *)self->list addItem:v18];
      }
      if (v8 != (id)[v10 lastChild]) {
        splitParagraphAtTextLine(v10, (uint64_t)v8, 1u);
      }
    }
  }
}

- (void)fetchTextLinesInColumn:(id)a3
{
  textLines = self->textLines;
  if (textLines) {
    free(textLines);
  }
  self->textLineCount = 0;
  unsigned int v6 = [a3 countOfFirstDescendantsOfClass:objc_opt_class()];
  if (v6)
  {
    v7 = (id *)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
    self->textLines = v7;
    if (v7)
    {
      [a3 map:sel_fetchTextLine_ target:self];
    }
  }
  else
  {
    self->textLines = 0;
  }
}

- (void)fetchTextLine:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    textLines = self->textLines;
    uint64_t textLineCount = self->textLineCount;
    self->uint64_t textLineCount = textLineCount + 1;
    textLines[textLineCount] = a3;
  }
  else
  {
    [a3 map:sel_fetchTextLine_ target:self];
  }
}

- (void)dealloc
{
  [(CPListMaker *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPListMaker;
  [(CPListMaker *)&v3 dealloc];
}

- (void)finalize
{
  [(CPListMaker *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPListMaker;
  [(CPListMaker *)&v3 finalize];
}

- (void)dispose
{
  textLines = self->textLines;
  if (textLines)
  {
    free(textLines);
    self->textLines = 0;
  }
}

- (CPListMaker)initWithLayoutArea:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPListMaker;
  uint64_t v4 = [(CPListMaker *)&v6 init];
  if (v4)
  {
    v4->area = (CPLayoutArea *)a3;
    v4->spacers = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "ancestorOfClass:", objc_opt_class()), "spacers");
  }
  return v4;
}

+ (void)makeListsInPage:(id)a3
{
  uint64_t v4 = objc_opt_class();

  [a3 map:sel_makeListsInChunk_ target:v4];
}

+ (void)makeListsInChunk:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[CPListMaker makeListsInLayoutArea:a3];
  }
  else
  {
    uint64_t v4 = objc_opt_class();
    [a3 map:sel_makeListsInChunk_ target:v4];
  }
}

+ (void)makeListsInLayoutArea:(id)a3
{
  objc_super v3 = [[CPListMaker alloc] initWithLayoutArea:a3];
  [(CPListMaker *)v3 makeLists];
}

@end