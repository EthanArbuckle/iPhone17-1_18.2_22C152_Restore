@interface BRCTermDumper
+ (void)execPagerOnFileFd:(int)a3;
+ (void)setupPagerForFd:(int)a3;
- (BOOL)isatty;
- (BOOL)supportsEscapeSequences;
- (BOOL)useColor;
- (BRCTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4;
- (BRCTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4 darkMode:(BOOL)a5;
- (BRCTermDumper)initWithFile:(__sFILE *)a3 forceColor:(BOOL)a4;
- (BRCTermDumper)initWithFile:(__sFILE *)a3 forceColor:(BOOL)a4 darkMode:(BOOL)a5 closeOnDeinit:(BOOL)a6;
- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (id)stringForReset;
- (int)_transformToDarkMode:(int)a3;
- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)curAttrs;
- (unint64_t)remainingSpace;
- (void)_putsAndCrop:(const char *)a3 len:(unint64_t)a4;
- (void)cursorDown:(unsigned int)a3;
- (void)cursorGotoLineStart;
- (void)cursorLeft:(unsigned int)a3;
- (void)cursorRestore;
- (void)cursorRight:(unsigned int)a3;
- (void)cursorSave;
- (void)cursorUp:(unsigned int)a3;
- (void)dealloc;
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
- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5;
- (void)startNewLine;
- (void)startPager;
- (void)write:(const char *)a3;
@end

@implementation BRCTermDumper

- (BRCTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4
{
  return [(BRCTermDumper *)self initWithFd:*(void *)&a3 forceColor:a4 darkMode:0];
}

- (BRCTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4 darkMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v9 = fdopen(a3, "w");
  if (!v9) {
    -[BRCTermDumper initWithFd:forceColor:darkMode:]();
  }

  return [(BRCTermDumper *)self initWithFile:v9 forceColor:v6 darkMode:v5 closeOnDeinit:a3 > 2];
}

- (BRCTermDumper)initWithFile:(__sFILE *)a3 forceColor:(BOOL)a4
{
  return [(BRCTermDumper *)self initWithFile:a3 forceColor:a4 darkMode:0 closeOnDeinit:0];
}

- (BRCTermDumper)initWithFile:(__sFILE *)a3 forceColor:(BOOL)a4 darkMode:(BOOL)a5 closeOnDeinit:(BOOL)a6
{
  v18.receiver = self;
  v18.super_class = (Class)BRCTermDumper;
  v10 = [(BRCTermDumper *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_file = a3;
    v10->_fileNeedsClosing = a6;
    setvbuf(a3, 0, 2, 0x400uLL);
    int v12 = fileno(a3);
    BOOL v13 = isatty(v12) != 0;
    v11->_isatty = v13;
    v14 = getenv("TERM");
    if (v14) {
      BOOL v15 = v13;
    }
    else {
      BOOL v15 = 0;
    }
    v11->_supportsEscapeSequences = v15;
    if (!a4 && v15)
    {
      v16 = v14;
      if (strcasestr(v14, "ansi")) {
        a4 = 1;
      }
      else {
        a4 = strstr(v16, "color") != 0;
      }
    }
    v11->_useColor = a4;
    v11->_curBg = 9;
    v11->_curFg = 9;
    v11->_darkMode = a5;
  }
  return v11;
}

- (void)dealloc
{
  if (self->_fileNeedsClosing)
  {
    file = self->_file;
    if (file)
    {
      fclose(file);
      self->_file = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCTermDumper;
  [(BRCTermDumper *)&v4 dealloc];
}

- (int)_transformToDarkMode:(int)a3
{
  if (a3) {
    int v3 = a3;
  }
  else {
    int v3 = 7;
  }
  if (self->_darkMode) {
    return v3;
  }
  else {
    return a3;
  }
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

void __27__BRCTermDumper_startPager__block_invoke(uint64_t a1)
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

- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)curAttrs
{
  uint64_t v7 = *(void *)&a5;
  int curFg = [(BRCTermDumper *)self _transformToDarkMode:*(void *)&a4];
  int curBg = [(BRCTermDumper *)self _transformToDarkMode:v7];
  if (curBg == -1) {
    int curBg = self->_curBg;
  }
  if (curFg == -1) {
    int curFg = self->_curFg;
  }
  if (curAttrs == -1) {
    curAttrs = self->_curAttrs;
  }
  *(_WORD *)a3 = 23323;
  if (curAttrs == self->_curAttrs)
  {
    unint64_t v12 = 2;
  }
  else
  {
    *((_WORD *)a3 + 1) = 15152;
    unint64_t v12 = 4;
    for (unint64_t i = 1; i != 32; ++i)
    {
      if ((curAttrs >> i))
      {
        if (i >= 0xA) {
          -[BRCTermDumper _startInCString:fgColor:bgColor:attr:]();
        }
        v14 = &a3[v12];
        char *v14 = i + 48;
        v12 += 2;
        v14[1] = 59;
      }
    }
    self->_curAttrs = curAttrs;
    self->_int curFg = 9;
    self->_int curBg = 9;
  }
  if (curFg != self->_curFg)
  {
    BOOL v15 = &a3[v12];
    *BOOL v15 = 51;
    v15[1] = curFg + 48;
    v12 += 3;
    v15[2] = 59;
    self->_int curFg = curFg;
  }
  if (curBg != self->_curBg)
  {
    v16 = &a3[v12];
    char *v16 = 52;
    v16[1] = curBg + 48;
    v12 += 3;
    v16[2] = 59;
    self->_int curBg = curBg;
  }
  a3[v12] = 0;
  if (v12 < 3) {
    return 0;
  }
  a3[v12 - 1] = 109;
  return v12;
}

- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(BRCTermDumper *)self _startInCString:v8 fgColor:*(void *)&a3 bgColor:*(void *)&a4 attr:*(void *)&a5];
  BOOL v6 = (void *)[[NSString alloc] initWithBytes:v8 length:v5 encoding:4];

  return v6;
}

- (id)stringForReset
{
  return [(BRCTermDumper *)self startStringForFgColor:9 bgColor:9 attr:0];
}

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_useColor)
  {
    size_t v6 = [(BRCTermDumper *)self _startInCString:__ptr fgColor:*(void *)&a3 bgColor:*(void *)&a4 attr:*(void *)&a5];
    if (v6) {
      fwrite(__ptr, 1uLL, v6, self->_file);
    }
  }
}

- (void)reset
{
}

- (void)eraseEndOfLine
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1BK", self->_file);
  }
}

- (void)eraseStartOfLine
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1B[1K", self->_file);
  }
}

- (void)eraseLine
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1B[2K", self->_file);
  }
}

- (void)eraseScreenDown
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1B[J", self->_file);
  }
}

- (void)eraseScreenUp
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1B[1J", self->_file);
  }
}

- (void)cursorSave
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1B[s", self->_file);
  }
}

- (void)cursorRestore
{
  if (self->_supportsEscapeSequences) {
    fputs("\x1B[u", self->_file);
  }
}

- (void)cursorUp:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    fprintf(self->_file, "\x1B[%d%c", a3, 65);
  }
}

- (void)cursorDown:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    fprintf(self->_file, "\x1B[%d%c", a3, 66);
  }
}

- (void)cursorRight:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    fprintf(self->_file, "\x1B[%d%c", a3, 67);
  }
}

- (void)cursorLeft:(unsigned int)a3
{
  if (self->_supportsEscapeSequences) {
    fprintf(self->_file, "\x1B[%d%c", a3, 68);
  }
}

- (void)cursorGotoLineStart
{
  if (self->_supportsEscapeSequences) {
    fputs("\r", self->_file);
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
  [(BRCTermDumper *)self cursorGotoLineStart];
  self->_usedTermWidth = 0;
}

- (void)endLine
{
  self->_usedTermWidth = 0;
  [(BRCTermDumper *)self forgetRemainingSpace];

  [(BRCTermDumper *)self puts:"\n" len:1];
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
  fwrite(a3, 1uLL, v6, self->_file);
}

- (void)puts:(const char *)a3 len:(unint64_t)a4
{
  if (self->_termWidth) {
    [(BRCTermDumper *)self _putsAndCrop:a3 len:a4];
  }
  else {
    fwrite(a3, 1uLL, a4, self->_file);
  }
}

- (void)puts:(const char *)a3
{
  size_t v5 = strlen(a3);

  [(BRCTermDumper *)self puts:a3 len:v5];
}

- (void)put:(id)a3
{
  uint64_t v4 = [a3 UTF8String];

  [(BRCTermDumper *)self puts:v4];
}

- (void)write:(const char *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_termWidth)
  {
    unsigned int v4 = vsnprintf(__str, 0x800uLL, a3, &v8);
    if (v4 >= 0x800) {
      uint64_t v5 = 2048;
    }
    else {
      uint64_t v5 = v4;
    }
    -[BRCTermDumper _putsAndCrop:len:](self, "_putsAndCrop:len:", __str, v5, &v8);
  }
  else
  {
    *(void *)__str = &v8;
    vfprintf(self->_file, a3, &v8);
  }
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

- (void)initWithFd:forceColor:darkMode:.cold.1()
{
}

- (void)_startInCString:fgColor:bgColor:attr:.cold.1()
{
}

@end