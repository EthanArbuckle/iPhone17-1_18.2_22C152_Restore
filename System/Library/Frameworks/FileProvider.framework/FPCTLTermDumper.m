@interface FPCTLTermDumper
+ (BOOL)supportsSecureCoding;
+ (void)execPagerOnFileFd:(int)a3;
+ (void)setupPagerForFd:(int)a3;
- (BOOL)isatty;
- (BOOL)supportsEscapeSequences;
- (BOOL)useColor;
- (FPCTLTermDumper)initWithCoder:(id)a3;
- (FPCTLTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4;
- (id)annotateString:(id)a3 markedIdentifiers:(id)a4;
- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (id)stringForReset;
- (int)fd;
- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)a6;
- (unint64_t)remainingSpace;
- (void)_putsAndCrop:(const char *)a3 len:(unint64_t)a4;
- (void)changeAttributes:(int)a3;
- (void)changeBgColor:(int)a3;
- (void)changeFgColor:(int)a3;
- (void)cursorDown:(unsigned int)a3;
- (void)cursorGotoLineStart;
- (void)cursorLeft:(unsigned int)a3;
- (void)cursorRestore;
- (void)cursorRight:(unsigned int)a3;
- (void)cursorSave;
- (void)cursorUp:(unsigned int)a3;
- (void)dumpImage:(id)a3 characterWidth:(unint64_t)a4 characterHeight:(unint64_t)a5;
- (void)dumpImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (void)dumpProgress:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endLine;
- (void)eraseEndOfLine;
- (void)eraseLine;
- (void)eraseScreenDown;
- (void)eraseScreenUp;
- (void)eraseStartOfLine;
- (void)forgetRemainingSpace;
- (void)put:(id)a3;
- (void)puts:(const char *)a3;
- (void)puts:(const char *)a3 len:(unint64_t)a4;
- (void)reset;
- (void)startAttributes:(int)a3;
- (void)startBgColor:(int)a3;
- (void)startBgColor:(int)a3 attr:(int)a4;
- (void)startFgColor:(int)a3;
- (void)startFgColor:(int)a3 attr:(int)a4;
- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (void)startNewLine;
- (void)startPager;
- (void)write:(id)a3;
@end

@implementation FPCTLTermDumper

- (FPCTLTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4
{
  BOOL v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPCTLTermDumper;
  v6 = [(FPCTLTermDumper *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_fd = a3;
    BOOL v8 = isatty(a3) != 0;
    v7->_isatty = v8;
    v9 = getenv("TERM");
    v10 = v9;
    if (v9) {
      BOOL v11 = v8;
    }
    else {
      BOOL v11 = 0;
    }
    v7->_supportsEscapeSequences = v11;
    if (!v4 && v11)
    {
      if (strcasestr(v9, "ansi")) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = strstr(v10, "color") != 0;
      }
    }
    BOOL v12 = 0;
    v7->_useColor = v4;
    if (v10 && v4) {
      BOOL v12 = strstr(v10, "256color") != 0;
    }
    v7->_eightBitColor = v12;
    *(void *)&v7->_curFg = 0x900000009;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F28CB0];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithFileDescriptor:self->_fd];
  [v5 encodeObject:v6 forKey:@"FileHandleKey"];
}

- (FPCTLTermDumper)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FileHandleKey"];

  id v6 = -[FPCTLTermDumper initWithFd:forceColor:](self, "initWithFd:forceColor:", [v5 fileDescriptor], 1);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_decodedFileHandle, v5);
  }

  return v7;
}

+ (void)setupPagerForFd:(int)a3
{
  uint64_t v3 = 0;
  ioctl(a3, 0x40087468uLL, &v3);
  if (!getenv("LESS")) {
    putenv("LESS=FRSX");
  }
  if (!getenv("LESSCHARSET")) {
    putenv("LESSCHARSET=utf-8");
  }
}

+ (void)execPagerOnFileFd:(int)a3
{
  if (execlp("less", "less", "-", 0) < 0)
  {
    perror("execvp");
    exit(1);
  }
  __break(1u);
}

- (void)startPager
{
}

void __29__FPCTLTermDumper_startPager__block_invoke(uint64_t a1)
{
  int v2 = 0;
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
  fflush((FILE *)*MEMORY[0x1E4F143C8]);
  close(1);
  close(2);
  if (waitpid(*(_DWORD *)(a1 + 32), &v2, 0) < 0) {
    perror("waitpid");
  }
}

- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)a6
{
  unsigned int curAttrs = a6;
  int curBg = a5;
  int curFg = a4;
  if (a5 == -1) {
    int curBg = self->_curBg;
  }
  if (a4 == -1) {
    int curFg = self->_curFg;
  }
  if (a6 == -1) {
    unsigned int curAttrs = self->_curAttrs;
  }
  strcpy(a3, "\x1B[");
  if (curAttrs == self->_curAttrs)
  {
    int v11 = self->_curFg;
    unint64_t v12 = 2;
  }
  else
  {
    strcpy(a3 + 2, "0;");
    unint64_t v12 = 4;
    for (uint64_t i = 1; i != 32; ++i)
    {
      if ((curAttrs >> i)) {
        v12 += snprintf(&a3[v12], 256 - v12, "%zd;", i);
      }
    }
    self->_unsigned int curAttrs = curAttrs;
    *(void *)&self->_int curFg = 0x900000009;
    int v11 = 9;
  }
  if (curFg != v11)
  {
    v12 += snprintf(&a3[v12], 256 - v12, "%d;", curFg + 30);
    self->_int curFg = curFg;
  }
  if (curBg != self->_curBg)
  {
    v12 += snprintf(&a3[v12], 256 - v12, "%d;", curBg + 40);
    self->_int curBg = curBg;
  }
  if (v12 < 3) {
    return 0;
  }
  a3[v12 - 1] = 109;
  return v12;
}

- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  unint64_t v5 = [(FPCTLTermDumper *)self _startInCString:v8 fgColor:*(void *)&a3 bgColor:*(void *)&a4 attr:*(void *)&a5];
  id v6 = (void *)[[NSString alloc] initWithBytes:v8 length:v5 encoding:4];

  return v6;
}

- (id)stringForReset
{
  return [(FPCTLTermDumper *)self startStringForFgColor:9 bgColor:9 attr:0];
}

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_useColor)
  {
    memset(v7, 0, sizeof(v7));
    size_t v6 = [(FPCTLTermDumper *)self _startInCString:v7 fgColor:*(void *)&a3 bgColor:*(void *)&a4 attr:*(void *)&a5];
    if (v6) {
      write(self->_fd, v7, v6);
    }
  }
}

- (void)reset
{
}

- (void)eraseEndOfLine
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1BK", 2uLL);
  }
}

- (void)eraseStartOfLine
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1B[1K", 4uLL);
  }
}

- (void)eraseLine
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1B[2K", 4uLL);
  }
}

- (void)eraseScreenDown
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1B[J", 3uLL);
  }
}

- (void)eraseScreenUp
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1B[1J", 4uLL);
  }
}

- (void)cursorSave
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1B[s", 3uLL);
  }
}

- (void)cursorRestore
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\x1B[u", 3uLL);
  }
}

- (void)cursorUp:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    dprintf(self->_fd, "\x1B[%d%c", a3, 65);
  }
}

- (void)cursorDown:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    dprintf(self->_fd, "\x1B[%d%c", a3, 66);
  }
}

- (void)cursorRight:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    dprintf(self->_fd, "\x1B[%d%c", a3, 67);
  }
}

- (void)cursorLeft:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    dprintf(self->_fd, "\x1B[%d%c", a3, 68);
  }
}

- (void)cursorGotoLineStart
{
  if (self->_supportsEscapeSequences) {
    write(self->_fd, "\r", 1uLL);
  }
}

- (void)startNewLine
{
  if (!self->_termWidth)
  {
    uint64_t v3 = 0;
    ioctl(1, 0x40087468uLL, &v3);
    self->_termWidth = WORD1(v3);
  }
  [(FPCTLTermDumper *)self cursorGotoLineStart];
  self->_usedTermWidth = 0;
}

- (void)endLine
{
  self->_usedTermWidth = 0;
  [(FPCTLTermDumper *)self forgetRemainingSpace];

  [(FPCTLTermDumper *)self puts:"\n" len:1];
}

- (unint64_t)remainingSpace
{
  uint64_t v5 = 0;
  ioctl(1, 0x40087468uLL, &v5);
  uint64_t v3 = WORD1(v5);
  self->_termWidth = WORD1(v5);
  return v3 - self->_usedTermWidth;
}

- (void)forgetRemainingSpace
{
  self->_termWidth = 0;
}

- (void)startFgColor:(int)a3 attr:(int)a4
{
}

- (void)startBgColor:(int)a3 attr:(int)a4
{
}

- (void)startFgColor:(int)a3
{
}

- (void)startBgColor:(int)a3
{
}

- (void)startAttributes:(int)a3
{
}

- (void)changeFgColor:(int)a3
{
}

- (void)changeBgColor:(int)a3
{
}

- (void)changeAttributes:(int)a3
{
}

- (void)dumpImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  id v8 = [a3 base64EncodedStringWithOptions:0];
  -[FPCTLTermDumper write:](self, "write:", @"\x1B]1337;File=inline=1;width=%lupx;height=%lupx:%s\a\n",
    a4,
    a5,
    [v8 UTF8String]);
}

- (void)dumpImage:(id)a3 characterWidth:(unint64_t)a4 characterHeight:(unint64_t)a5
{
  id v8 = [a3 base64EncodedStringWithOptions:0];
  -[FPCTLTermDumper write:](self, "write:", @"\x1B]1337;File=inline=1;width=%lu;height=%lu:%s\a",
    a4,
    a5,
    [v8 UTF8String]);
}

- (void)dumpProgress:(id)a3
{
  id v4 = a3;
  if ([(FPCTLTermDumper *)self supportsEscapeSequences])
  {
    [(FPCTLTermDumper *)self cursorGotoLineStart];
    uint64_t v14 = 0;
    ioctl(1, 0x40087468uLL, &v14);
    unint64_t v5 = WORD1(v14);
    self->_termWidth = WORD1(v14);
    self->_usedTermWidth = 0;
    unint64_t v6 = v5 >> 1;
    if (v6 >= 0x1E) {
      unint64_t v7 = 30;
    }
    else {
      unint64_t v7 = v6;
    }
    [v4 fractionCompleted];
    unint64_t v9 = (unint64_t)(v8 * (double)v7);
    v10 = [MEMORY[0x1E4F28E78] string];
    if (v9)
    {
      unint64_t v11 = v9;
      do
      {
        [v10 appendString:@"█"];
        --v11;
      }
      while (v11);
    }
    if (v7 != v9)
    {
      unint64_t v12 = v7 - v9;
      do
      {
        [v10 appendString:@" "];
        --v12;
      }
      while (v12);
    }
    [v4 fractionCompleted];
    objc_msgSend(v10, "appendFormat:", @"| %lu%%", (unint64_t)(v13 * 100.0));
    [(FPCTLTermDumper *)self write:@"%@", v10];
  }
}

- (void)_putsAndCrop:(const char *)a3 len:(unint64_t)a4
{
  unint64_t usedTermWidth = self->_usedTermWidth;
  if (self->_termWidth - usedTermWidth >= a4) {
    size_t v6 = a4;
  }
  else {
    size_t v6 = self->_termWidth - usedTermWidth;
  }
  self->_unint64_t usedTermWidth = v6 + usedTermWidth;
  write(self->_fd, a3, v6);
}

- (void)puts:(const char *)a3 len:(unint64_t)a4
{
  if (self->_termWidth) {
    [(FPCTLTermDumper *)self _putsAndCrop:a3 len:a4];
  }
  else {
    write(self->_fd, a3, a4);
  }
}

- (void)puts:(const char *)a3
{
  size_t v5 = strlen(a3);

  [(FPCTLTermDumper *)self puts:a3 len:v5];
}

- (void)put:(id)a3
{
  uint64_t v4 = [a3 UTF8String];

  [(FPCTLTermDumper *)self puts:v4];
}

- (void)write:(id)a3
{
  uint64_t v4 = (objc_class *)NSString;
  id v5 = a3;
  size_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  if (self->_termWidth)
  {
    id v7 = v6;
    -[FPCTLTermDumper _putsAndCrop:len:](self, "_putsAndCrop:len:", [v7 UTF8String], objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4));
  }
  else
  {
    [(FPCTLTermDumper *)self put:v6];
  }
}

- (id)annotateString:(id)a3 markedIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_useColor)
  {
    id v8 = a4;
    unint64_t v9 = (void *)[v7 mutableCopy];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__FPCTLTermDumper_annotateString_markedIdentifiers___block_invoke;
    v14[3] = &unk_1E5AF63F8;
    v14[4] = self;
    id v10 = v9;
    id v15 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];

    unint64_t v11 = v15;
    id v12 = v10;
  }
  else
  {
    id v12 = v6;
  }

  return v12;
}

void __52__FPCTLTermDumper_annotateString_markedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 44);
  unint64_t v6 = [a3 unsignedIntegerValue] % 7uLL;
  if (v5) {
    [NSString stringWithFormat:@"\x1B[38:5:%dm%@\x1B[39m", dword_1A34E4AC8[v6], v8];
  }
  else {
  id v7 = [NSString stringWithFormat:@"\x1B[%dm%@\x1B[39m", (dword_1A34E4AE4[v6] + 30), v8];
  }
  objc_msgSend(*(id *)(a1 + 40), "replaceOccurrencesOfString:withString:options:range:", v8, v7, 2, 0, objc_msgSend(*(id *)(a1 + 40), "length"));
}

- (int)fd
{
  return self->_fd;
}

- (BOOL)isatty
{
  return self->_isatty;
}

- (BOOL)useColor
{
  return self->_useColor;
}

- (BOOL)supportsEscapeSequences
{
  return self->_supportsEscapeSequences;
}

- (void).cxx_destruct
{
}

@end