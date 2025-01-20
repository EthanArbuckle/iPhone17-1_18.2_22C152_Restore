@interface _NSCallStackArray
+ (id)arrayWithFrames:(void *)a3 count:(unint64_t)a4 symbols:(BOOL)a5;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)_descriptionWithBuffer:(char *)a3 size:(int64_t)a4;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation _NSCallStackArray

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  v5 = +[NSString string];
  if (self->_wantSyms)
  {
    v6 = CFSTR("(\n");
    if (!self->_pcstrs)
    {
      self->_pcstrs = backtrace_symbols(&self->_frames[self->_ignore], self->_cnt);
      if (!self->_wantSyms) {
        v6 = CFSTR("(");
      }
    }
  }
  else
  {
    v6 = CFSTR("(");
  }
  [(NSString *)v5 appendString:v6];
  unint64_t cnt = self->_cnt;
  if (cnt)
  {
    unint64_t v8 = 0;
    do
    {
      if (self->_wantSyms && (pcstrs = self->_pcstrs) != 0)
      {
        [(NSString *)v5 appendFormat:@"\t%s\n", pcstrs[v8++]];
      }
      else
      {
        unint64_t v10 = self->_ignore + v8++;
        if (v8 >= cnt) {
          v11 = "";
        }
        else {
          v11 = " ";
        }
        [(NSString *)v5 appendFormat:@"%p%s", self->_frames[v10], v11];
      }
      unint64_t cnt = self->_cnt;
    }
    while (v8 < cnt);
  }
  [(NSString *)v5 appendString:@""]);
  return v5;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  free(self->_frames);
  pcstrs = self->_pcstrs;
  if (pcstrs) {
    free(pcstrs);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSCallStackArray;
  [(_NSCallStackArray *)&v4 dealloc];
}

+ (id)arrayWithFrames:(void *)a3 count:(unint64_t)a4 symbols:(BOOL)a5
{
  uint64_t v8 = objc_opt_new();
  *(void *)(v8 + 24) = 2;
  *(void *)(v8 + 8) = a3;
  unint64_t v9 = a4 - 2;
  if (a4 < 2) {
    unint64_t v9 = 0;
  }
  *(void *)(v8 + 16) = v9;
  *(void *)(v8 + 32) = 0;
  *(unsigned char *)(v8 + 40) = a5;

  return (id)v8;
}

- (unint64_t)count
{
  return self->_cnt;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t cnt = self->_cnt;
  if (cnt <= a3)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%ld) beyond bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), a3, self->_cnt), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (self->_wantSyms
    && ((pcstrs = self->_pcstrs) != 0
     || ((pcstrs = backtrace_symbols(&self->_frames[self->_ignore], cnt), self->_pcstrs = pcstrs, self->_wantSyms)
       ? (BOOL v8 = pcstrs == 0)
       : (BOOL v8 = 1),
         !v8)))
  {
    unint64_t v9 = pcstrs[a3];
    return +[NSString stringWithUTF8String:v9];
  }
  else
  {
    uint64_t v11 = *((void *)&self->_frames[self->_ignore] + a3);
    return +[NSNumber numberWithUnsignedInteger:v11];
  }
}

- (unint64_t)_descriptionWithBuffer:(char *)a3 size:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4 <= 0) {
    __break(1u);
  }
  *a3 = 0;
  if (self->_wantSyms
    && (self->_pcstrs || (self->_pcstrs = backtrace_symbols(&self->_frames[self->_ignore], self->_cnt), self->_wantSyms)))
  {
    v7 = "(\n";
  }
  else
  {
    v7 = "(";
  }
  strlcat(a3, v7, a4);
  unint64_t cnt = self->_cnt;
  if (cnt)
  {
    unint64_t v9 = 0;
    do
    {
      if (self->_wantSyms && (pcstrs = self->_pcstrs) != 0)
      {
        snprintf(__str, 0x100uLL, "\t%s\n", pcstrs[v9]);
        strlcat(a3, __str, a4);
        ++v9;
      }
      else
      {
        unint64_t v11 = self->_ignore + v9++;
        if (v9 >= cnt) {
          v12 = "";
        }
        else {
          v12 = " ";
        }
        snprintf(__str, 0x100uLL, "%p%s", self->_frames[v11], v12);
        strlcat(a3, __str, a4);
      }
      unint64_t cnt = self->_cnt;
    }
    while (v9 < cnt);
  }
  strlcat(a3, ")", a4);
  return strlen(a3);
}

@end