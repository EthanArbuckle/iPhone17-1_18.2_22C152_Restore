@interface OSLogTermDumper
- (BOOL)isBold;
- (BOOL)isFancy;
- (BOOL)isOblique;
- (BOOL)isUnderlined;
- (OSLogTermDumper)init;
- (OSLogTermDumper)initWithFd:(int)a3 colorMode:(unsigned __int8)a4;
- (unsigned)bgColor;
- (unsigned)colorMode;
- (unsigned)fgColor;
- (unsigned)format:(const char *)a3;
- (unsigned)style;
- (unsigned)vformat:(const char *)a3 args:(char *)a4;
- (void)_flushAttrs;
- (void)_resetAttrsForNewline;
- (void)beginEditing;
- (void)close;
- (void)dealloc;
- (void)endEditing;
- (void)flush:(BOOL)a3;
- (void)hexdump:(const void *)a3 length:(unint64_t)a4;
- (void)pad:(int)a3 count:(unint64_t)a4;
- (void)putUUID:(unsigned __int8)a3[16];
- (void)putc:(int)a3;
- (void)puts:(const char *)a3;
- (void)resetStyle;
- (void)setBgColor:(unsigned __int8)a3;
- (void)setBold:(BOOL)a3;
- (void)setFgColor:(unsigned __int8)a3;
- (void)setOblique:(BOOL)a3;
- (void)setStyle:(unsigned __int16)a3;
- (void)setUnderline:(BOOL)a3;
- (void)startPager;
- (void)write:(const void *)a3 size:(unint64_t)a4;
- (void)writeln;
@end

@implementation OSLogTermDumper

- (void)setStyle:(unsigned __int16)a3
{
  self->_cur_attrs = a3;
}

- (unsigned)style
{
  return self->_cur_attrs;
}

- (BOOL)isFancy
{
  return self->_fancy;
}

- (unsigned)colorMode
{
  return self->_colorMode;
}

- (void)putUUID:(unsigned __int8)a3[16]
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  uuid_unparse_upper(a3, v4);
  [(OSLogTermDumper *)self write:v4 size:36];
}

- (void)puts:(const char *)a3
{
  size_t v5 = strlen(a3);
  [(OSLogTermDumper *)self write:a3 size:v5];
}

- (unsigned)format:(const char *)a3
{
  return [(OSLogTermDumper *)self vformat:a3 args:&v4];
}

- (void)pad:(int)a3 count:(unint64_t)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = (char *)v7 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v6, a3, a4);
  [(OSLogTermDumper *)self write:v6 size:a4];
}

- (void)writeln
{
}

- (void)hexdump:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v7 = 0;
    p_ob = &self->_ob;
    do
    {
      uint64_t v8 = v7 & 0xF;
      if ((v7 & 0xF) == 0)
      {
        __sprintf_chk(__src, 0, 0x4AuLL, "%08x:", v7);
        *(void *)&long long v9 = 0x2020202020202020;
        *((void *)&v9 + 1) = 0x2020202020202020;
        *(_OWORD *)&__src[9] = v9;
        *(_OWORD *)&__src[25] = v9;
        *(_OWORD *)&__src[41] = v9;
        *(_OWORD *)&__src[57] = v9;
        __src[73] = 32;
      }
      int v10 = *((char *)a3 + v7);
      v11 = &__src[3 * v8 + 10];
      unsigned char *v11 = a0123456789abcd[*((unsigned char *)a3 + v7) >> 4];
      v11[1] = a0123456789abcd[v10 & 0xF];
      if (v10 < 0 || v10 != 32 && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v10 + 60) & 0x200) != 0) {
        LOBYTE(v10) = 46;
      }
      __src[v8 + 58] = v10;
      if (v8 == 15)
      {
        if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
          [(OSLogTermDumper *)self _flushAttrs];
        }
        if ((self->_ob.ob_flags & 2) == 0)
        {
          uint64_t ob_len = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 0x49)
          {
            os_trace_blob_add_slow((uint64_t)p_ob, __src, 0x4AuLL);
          }
          else
          {
            v13 = &self->_ob.var0.ob_b[ob_len];
            *(_OWORD *)v13 = *(_OWORD *)__src;
            long long v14 = *(_OWORD *)&__src[16];
            long long v15 = *(_OWORD *)&__src[32];
            long long v16 = *(_OWORD *)&__src[48];
            *(_OWORD *)(v13 + 58) = *(_OWORD *)&__src[58];
            *((_OWORD *)v13 + 2) = v15;
            *((_OWORD *)v13 + 3) = v16;
            *((_OWORD *)v13 + 1) = v14;
            unsigned int v17 = self->_ob.ob_len + 74;
            self->_ob.uint64_t ob_len = v17;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v17] = 0;
            }
          }
        }
        if (self->_fancy && self->_last_attrs) {
          [(OSLogTermDumper *)self _resetAttrsForNewline];
        }
        char v27 = 10;
        if ((self->_ob.ob_flags & 2) == 0)
        {
          uint64_t v18 = self->_ob.ob_len;
          if (self->_ob.ob_binary + self->_ob.ob_size - 1 == v18)
          {
            os_trace_blob_add_slow((uint64_t)p_ob, &v27, 1uLL);
          }
          else
          {
            self->_ob.var0.ob_b[v18] = 10;
            unsigned int v19 = self->_ob.ob_len + 1;
            self->_ob.uint64_t ob_len = v19;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v19] = 0;
            }
          }
        }
      }
      if (self->_ob.ob_len >= 0x2000) {
        [(OSLogTermDumper *)self flush:0];
      }
      ++v7;
    }
    while (a4 != v7);
    if ((a4 & 0xF) != 0 && (self->_ob.ob_flags & 2) == 0)
    {
      uint64_t v20 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v20 - 1) <= 0x49)
      {
        os_trace_blob_add_slow((uint64_t)p_ob, __src, 0x4AuLL);
      }
      else
      {
        v21 = &self->_ob.var0.ob_b[v20];
        *(_OWORD *)v21 = *(_OWORD *)__src;
        long long v22 = *(_OWORD *)&__src[16];
        long long v23 = *(_OWORD *)&__src[32];
        long long v24 = *(_OWORD *)&__src[48];
        *(_OWORD *)(v21 + 58) = *(_OWORD *)&__src[58];
        *((_OWORD *)v21 + 2) = v23;
        *((_OWORD *)v21 + 3) = v24;
        *((_OWORD *)v21 + 1) = v22;
        unsigned int v25 = self->_ob.ob_len + 74;
        self->_ob.uint64_t ob_len = v25;
        if (!self->_ob.ob_binary) {
          p_ob->var0.ob_b[v25] = 0;
        }
      }
    }
  }
  if (self->_ob.ob_len >= 0x2000) {
    [(OSLogTermDumper *)self flush:0];
  }
}

- (unsigned)vformat:(const char *)a3 args:(char *)a4
{
  uint64_t v8 = 0;
  unsigned int v5 = vasprintf(&v8, a3, a4);
  if (!v8) {
    return 0;
  }
  unsigned int v6 = v5;
  [(OSLogTermDumper *)self write:v8 size:v5];
  free(v8);
  return v6;
}

- (void)putc:(int)a3
{
  if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
    [(OSLogTermDumper *)self _flushAttrs];
  }
  if (a3 == 10 && self->_fancy && self->_last_attrs) {
    [(OSLogTermDumper *)self _resetAttrsForNewline];
  }
  char __src = a3;
  if ((self->_ob.ob_flags & 2) == 0)
  {
    p_ob = &self->_ob;
    uint64_t ob_len = self->_ob.ob_len;
    if (self->_ob.ob_binary + self->_ob.ob_size - 1 == ob_len)
    {
      os_trace_blob_add_slow((uint64_t)p_ob, &__src, 1uLL);
    }
    else
    {
      self->_ob.var0.ob_b[ob_len] = a3;
      unsigned int v7 = self->_ob.ob_len + 1;
      self->_ob.uint64_t ob_len = v7;
      if (!self->_ob.ob_binary) {
        p_ob->var0.ob_b[v7] = 0;
      }
    }
  }
  if (self->_ob.ob_len >= 0x2000)
  {
    [(OSLogTermDumper *)self flush:0];
  }
}

- (void)write:(const void *)a3 size:(unint64_t)a4
{
  size_t v4 = a4;
  unsigned int v5 = (void *)a3;
  if (self->_fancy)
  {
    if (a4)
    {
      p_ob = &self->_ob;
      do
      {
        uint64_t v8 = (char *)memchr(v5, 10, v4);
        long long v9 = v8;
        int64_t v10 = v8 - (unsigned char *)v5;
        if (v8) {
          unint64_t v11 = v8 - (unsigned char *)v5;
        }
        else {
          unint64_t v11 = v4;
        }
        if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
          [(OSLogTermDumper *)self _flushAttrs];
        }
        if (self->_vis)
        {
          os_trace_blob_add_unsafe_bytes((uint64_t)&self->_ob, (char *)v5, v11);
        }
        else if ((self->_ob.ob_flags & 2) == 0)
        {
          uint64_t ob_len = self->_ob.ob_len;
          if (v11 > (self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1))
          {
            os_trace_blob_add_slow((uint64_t)&self->_ob, v5, v11);
          }
          else
          {
            memcpy(&self->_ob.var0.ob_b[ob_len], v5, v11);
            unsigned int v13 = self->_ob.ob_len + v11;
            self->_ob.uint64_t ob_len = v13;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v13] = 0;
            }
          }
        }
        size_t v14 = v4;
        if (v9)
        {
          if (self->_fancy && self->_last_attrs) {
            [(OSLogTermDumper *)self _resetAttrsForNewline];
          }
          char v15 = *v9;
          char __src = *v9;
          if ((self->_ob.ob_flags & 2) == 0)
          {
            uint64_t v16 = self->_ob.ob_len;
            if (self->_ob.ob_binary + self->_ob.ob_size - 1 == v16)
            {
              os_trace_blob_add_slow((uint64_t)&self->_ob, &__src, 1uLL);
            }
            else
            {
              self->_ob.var0.ob_b[v16] = v15;
              unsigned int v17 = self->_ob.ob_len + 1;
              self->_ob.uint64_t ob_len = v17;
              if (!self->_ob.ob_binary) {
                p_ob->var0.ob_b[v17] = 0;
              }
            }
          }
          unsigned int v5 = v9 + 1;
          size_t v14 = v10 + 1;
        }
        if (self->_ob.ob_len >= 0x2000) {
          [(OSLogTermDumper *)self flush:0];
        }
        v4 -= v14;
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v18 = &self->_ob;
    if (self->_vis)
    {
      os_trace_blob_add_unsafe_bytes((uint64_t)&self->_ob, (char *)a3, a4);
    }
    else if ((self->_ob.ob_flags & 2) == 0)
    {
      uint64_t v19 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v19 - 1) < a4)
      {
        os_trace_blob_add_slow((uint64_t)&self->_ob, (void *)a3, a4);
      }
      else
      {
        memcpy(&self->_ob.var0.ob_b[v19], a3, a4);
        unsigned int v20 = self->_ob.ob_len + v4;
        self->_ob.uint64_t ob_len = v20;
        if (!self->_ob.ob_binary) {
          v18->var0.ob_b[v20] = 0;
        }
      }
    }
    if (self->_ob.ob_len >= 0x2000)
    {
      [(OSLogTermDumper *)self flush:0];
    }
  }
}

- (void)flush:(BOOL)a3
{
  if (a3 && self->_fancy && self->_last_attrs != self->_cur_attrs) {
    [(OSLogTermDumper *)self _flushAttrs];
  }
  _os_trace_write();
  self->_ob.uint64_t ob_len = 0;
  if (!self->_ob.ob_binary) {
    *self->_ob.var0.ob_b = 0;
  }
}

- (void)endEditing
{
  if (self->_ob.ob_len >= 0x2000) {
    [(OSLogTermDumper *)self flush:0];
  }
}

- (void)beginEditing
{
  if (self->_fancy && self->_last_attrs != self->_cur_attrs) {
    [(OSLogTermDumper *)self _flushAttrs];
  }
}

- (void)_resetAttrsForNewline
{
  if (self->_last_attrs)
  {
    if ((self->_cur_attrs & 0x1F) != 0x10 && (self->_ob.ob_flags & 2) == 0)
    {
      p_ob = &self->_ob;
      uint64_t ob_len = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 2)
      {
        os_trace_blob_add_slow((uint64_t)p_ob, "\x1B[K", 3uLL);
      }
      else
      {
        unsigned int v5 = &self->_ob.var0.ob_b[ob_len];
        v5[2] = 75;
        *(_WORD *)unsigned int v5 = 23323;
        unsigned int v6 = self->_ob.ob_len + 3;
        self->_ob.uint64_t ob_len = v6;
        if (!self->_ob.ob_binary) {
          p_ob->var0.ob_b[v6] = 0;
        }
      }
    }
    unsigned __int16 cur_attrs = self->_cur_attrs;
    self->_unsigned __int16 cur_attrs = 4112;
    [(OSLogTermDumper *)self _flushAttrs];
    self->_unsigned __int16 cur_attrs = cur_attrs;
  }
}

- (void)_flushAttrs
{
  int cur_attrs = self->_cur_attrs;
  __int16 v9 = cur_attrs ^ self->_last_attrs;
  if (v9)
  {
    p_ob = &self->_ob;
    unsigned __int16 ob_flags = self->_ob.ob_flags;
    if (cur_attrs == 4112)
    {
      if ((ob_flags & 2) == 0)
      {
        uint64_t ob_len = self->_ob.ob_len;
        if ((self->_ob.ob_binary + self->_ob.ob_size - ob_len - 1) <= 3)
        {
          os_trace_blob_add_slow((uint64_t)&self->_ob, "\x1B[0m", 4uLL);
        }
        else
        {
          *(_DWORD *)&self->_ob.var0.ob_b[ob_len] = 1831885595;
          unsigned int v14 = self->_ob.ob_len + 4;
          self->_ob.uint64_t ob_len = v14;
          if (!self->_ob.ob_binary) {
            p_ob->var0.ob_b[v14] = 0;
          }
        }
      }
LABEL_56:
      self->_last_attrs = self->_cur_attrs;
      return;
    }
    if ((ob_flags & 2) == 0)
    {
      uint64_t v15 = self->_ob.ob_len;
      if ((self->_ob.ob_binary + self->_ob.ob_size - v15 - 1) <= 1)
      {
        os_trace_blob_add_slow((uint64_t)&self->_ob, "\x1B[", 2uLL);
        if ((v9 & 0x20) == 0) {
          goto LABEL_21;
        }
LABEL_12:
        unsigned __int16 v17 = self->_ob.ob_flags;
        if ((self->_cur_attrs & 0x20) != 0)
        {
          if ((v17 & 2) != 0) {
            goto LABEL_21;
          }
          uint64_t v21 = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - v21 - 1) > 1)
          {
            *(_WORD *)&self->_ob.var0.ob_b[v21] = 15153;
            unsigned int v20 = self->_ob.ob_len + 2;
LABEL_19:
            self->_ob.uint64_t ob_len = v20;
            if (!self->_ob.ob_binary) {
              p_ob->var0.ob_b[v20] = 0;
            }
LABEL_21:
            if ((v9 & 0x40) == 0) {
              goto LABEL_31;
            }
            unsigned __int16 v22 = self->_ob.ob_flags;
            if ((self->_cur_attrs & 0x40) != 0)
            {
              if ((v22 & 2) != 0) {
                goto LABEL_31;
              }
              uint64_t v26 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v26 - 1) > 1)
              {
                *(_WORD *)&self->_ob.var0.ob_b[v26] = 15155;
                unsigned int v25 = self->_ob.ob_len + 2;
LABEL_29:
                self->_ob.uint64_t ob_len = v25;
                if (!self->_ob.ob_binary) {
                  p_ob->var0.ob_b[v25] = 0;
                }
LABEL_31:
                if ((v9 & 0x80) == 0) {
                  goto LABEL_41;
                }
                goto LABEL_32;
              }
              v41 = "3;";
              uint64_t v42 = (uint64_t)p_ob;
              size_t v43 = 2;
            }
            else
            {
              if ((v22 & 2) != 0) {
                goto LABEL_31;
              }
              uint64_t v23 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v23 - 1) > 2)
              {
                long long v24 = &self->_ob.var0.ob_b[v23];
                v24[2] = 59;
                *(_WORD *)long long v24 = 13362;
                unsigned int v25 = self->_ob.ob_len + 3;
                goto LABEL_29;
              }
              v41 = "24;";
              uint64_t v42 = (uint64_t)p_ob;
              size_t v43 = 3;
            }
            os_trace_blob_add_slow(v42, v41, v43);
            if ((v9 & 0x80) == 0) {
              goto LABEL_41;
            }
LABEL_32:
            unsigned __int16 v27 = self->_ob.ob_flags;
            if ((self->_cur_attrs & 0x80) != 0)
            {
              if ((v27 & 2) == 0)
              {
                uint64_t v31 = self->_ob.ob_len;
                if ((self->_ob.ob_binary + self->_ob.ob_size - v31 - 1) > 1)
                {
                  *(_WORD *)&self->_ob.var0.ob_b[v31] = 15156;
                  unsigned int v30 = self->_ob.ob_len + 2;
LABEL_39:
                  self->_ob.uint64_t ob_len = v30;
                  if (!self->_ob.ob_binary) {
                    p_ob->var0.ob_b[v30] = 0;
                  }
                  goto LABEL_41;
                }
                v44 = "4;";
                uint64_t v45 = (uint64_t)p_ob;
                size_t v46 = 2;
                goto LABEL_72;
              }
            }
            else if ((v27 & 2) == 0)
            {
              uint64_t v28 = self->_ob.ob_len;
              if ((self->_ob.ob_binary + self->_ob.ob_size - v28 - 1) > 2)
              {
                uint64_t v29 = &self->_ob.var0.ob_b[v28];
                v29[2] = 59;
                *(_WORD *)uint64_t v29 = 13362;
                unsigned int v30 = self->_ob.ob_len + 3;
                goto LABEL_39;
              }
              v44 = "24;";
              uint64_t v45 = (uint64_t)p_ob;
              size_t v46 = 3;
LABEL_72:
              os_trace_blob_add_slow(v45, v44, v46);
            }
LABEL_41:
            if ((v9 & 0x1F) != 0)
            {
              if ((self->_cur_attrs & 0x1F) == 0x10)
              {
                if ((self->_ob.ob_flags & 2) == 0)
                {
                  uint64_t v32 = self->_ob.ob_len;
                  if ((self->_ob.ob_binary + self->_ob.ob_size - v32 - 1) <= 2)
                  {
                    os_trace_blob_add_slow((uint64_t)p_ob, "49;", 3uLL);
                  }
                  else
                  {
                    v33 = &self->_ob.var0.ob_b[v32];
                    v33[2] = 59;
                    *(_WORD *)v33 = 14644;
                    unsigned int v34 = self->_ob.ob_len + 3;
                    self->_ob.uint64_t ob_len = v34;
                    if (!self->_ob.ob_binary) {
                      p_ob->var0.ob_b[v34] = 0;
                    }
                  }
                }
              }
              else
              {
                os_trace_blob_addf((uint64_t)p_ob, "48;5;%d;", v2, v3, v4, v5, v6, v7, self->_cur_attrs & 0x1F);
              }
            }
            if ((v9 & 0x1F00) != 0)
            {
              if ((HIBYTE(self->_cur_attrs) & 0x1F) == 0x10)
              {
                if ((self->_ob.ob_flags & 2) == 0)
                {
                  uint64_t v35 = self->_ob.ob_len;
                  if ((self->_ob.ob_binary + self->_ob.ob_size - v35 - 1) <= 2)
                  {
                    os_trace_blob_add_slow((uint64_t)p_ob, "39;", 3uLL);
                  }
                  else
                  {
                    v36 = &self->_ob.var0.ob_b[v35];
                    v36[2] = 59;
                    *(_WORD *)v36 = 14643;
                    unsigned int v37 = self->_ob.ob_len + 3;
                    self->_ob.uint64_t ob_len = v37;
                    if (!self->_ob.ob_binary) {
                      p_ob->var0.ob_b[v37] = 0;
                    }
                  }
                }
              }
              else
              {
                os_trace_blob_addf((uint64_t)p_ob, "38;5;%d;", v2, v3, v4, v5, v6, v7, HIBYTE(self->_cur_attrs) & 0x1F);
              }
            }
            self->_ob.var0.ob_b[self->_ob.ob_len - 1] = 109;
            goto LABEL_56;
          }
          v38 = "1;";
          uint64_t v39 = (uint64_t)p_ob;
          size_t v40 = 2;
        }
        else
        {
          if ((v17 & 2) != 0) {
            goto LABEL_21;
          }
          uint64_t v18 = self->_ob.ob_len;
          if ((self->_ob.ob_binary + self->_ob.ob_size - v18 - 1) > 2)
          {
            uint64_t v19 = &self->_ob.var0.ob_b[v18];
            v19[2] = 59;
            *(_WORD *)uint64_t v19 = 12850;
            unsigned int v20 = self->_ob.ob_len + 3;
            goto LABEL_19;
          }
          v38 = "22;";
          uint64_t v39 = (uint64_t)p_ob;
          size_t v40 = 3;
        }
        os_trace_blob_add_slow(v39, v38, v40);
        goto LABEL_21;
      }
      *(_WORD *)&self->_ob.var0.ob_b[v15] = 23323;
      unsigned int v16 = self->_ob.ob_len + 2;
      self->_ob.uint64_t ob_len = v16;
      if (!self->_ob.ob_binary) {
        p_ob->var0.ob_b[v16] = 0;
      }
    }
    if ((v9 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }
}

- (void)startPager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_fancy) {
    return;
  }
  uint64_t v12 = 0;
  ioctl(self->_fd, 0x40087468uLL, &v12);
  if (!getenv("LESS")) {
    putenv("LESS=FnRSX");
  }
  if (!getenv("LESSCHARSET")) {
    putenv("LESSCHARSET=utf-8");
  }
  if (pipe(v13) < 0) {
    return;
  }
  pid_t v2 = fork();
  if (v2 < 0) {
    return;
  }
  pid_t v3 = v2;
  if (v2)
  {
    dup2(v13[1], 1);
    if (close(v13[1]) == -1)
    {
      int v4 = *__error();
      uint64_t v5 = *__error();
      if (v4 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v5;
        __break(1u);
LABEL_25:
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = v5;
        __break(1u);
LABEL_26:
        perror("execvp");
        exit(1);
      }
      _os_assumes_log();
    }
    if (close(v13[0]) != -1)
    {
LABEL_11:
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __29__OSLogTermDumper_startPager__block_invoke;
      v10[3] = &__block_descriptor_36_e5_v8__0l;
      pid_t v11 = v3;
      atexit_b(v10);
      return;
    }
    int v6 = *__error();
    uint64_t v5 = *__error();
    if (v6 != 9)
    {
      _os_assumes_log();
      goto LABEL_11;
    }
    goto LABEL_25;
  }
  dup2(v13[0], 0);
  if (close(v13[0]) == -1)
  {
    int v7 = *__error();
    uint64_t v8 = *__error();
    if (v7 == 9)
    {
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = v8;
      __break(1u);
      goto LABEL_28;
    }
    _os_assumes_log();
  }
  if (close(v13[1]) != -1) {
    goto LABEL_14;
  }
  int v9 = *__error();
  uint64_t v8 = *__error();
  if (v9 == 9)
  {
LABEL_28:
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v8;
    __break(1u);
    return;
  }
  _os_assumes_log();
LABEL_14:
  if (execlp("less", "less", "-", 0) < 0) {
    goto LABEL_26;
  }
}

void __29__OSLogTermDumper_startPager__block_invoke(uint64_t a1)
{
  int v5 = 0;
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
  fflush((FILE *)*MEMORY[0x1E4F143C8]);
  if (close(1) == -1)
  {
    int v2 = *__error();
    uint64_t v3 = *__error();
    if (v2 == 9)
    {
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = v3;
      __break(1u);
      goto LABEL_11;
    }
    _os_assumes_log();
  }
  if (close(2) != -1) {
    goto LABEL_3;
  }
  int v4 = *__error();
  uint64_t v3 = *__error();
  if (v4 == 9)
  {
LABEL_11:
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v3;
    __break(1u);
    return;
  }
  _os_assumes_log();
LABEL_3:
  if (waitpid(*(_DWORD *)(a1 + 32), &v5, 0) < 0) {
    perror("waitpid");
  }
}

- (void)dealloc
{
  if (self->_ob.ob_flags)
  {
    ob_b = self->_ob.var0.ob_b;
    self->_ob.var0.ob_b = (char *)3954044928;
    self->_ob.unsigned __int16 ob_flags = 0;
    free(ob_b);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSLogTermDumper;
  [(OSLogTermDumper *)&v4 dealloc];
}

- (void)close
{
  [(OSLogTermDumper *)self resetStyle];
  [(OSLogTermDumper *)self flush:1];
  if (self->_ob.ob_flags)
  {
    ob_b = self->_ob.var0.ob_b;
    self->_ob.var0.ob_b = (char *)3954044928;
    self->_ob.unsigned __int16 ob_flags = 0;
    free(ob_b);
  }
  self->_ob.var0.ob_b = (char *)self->_ob_slop;
  *(void *)&self->_ob.uint64_t ob_len = 0x100000000;
  self->_ob.ob_maxsize = 0;
  self->_ob.unsigned __int16 ob_flags = 0;
  self->_ob.ob_binary = 0;
}

- (OSLogTermDumper)initWithFd:(int)a3 colorMode:(unsigned __int8)a4
{
  int v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)OSLogTermDumper;
  int v6 = [(OSLogTermDumper *)&v15 init];
  int v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_ob.var0.ob_b = (char *)v6->_ob_slop;
  *(void *)&v6->_ob.uint64_t ob_len = 0x100000000;
  v6->_ob.unsigned __int16 ob_flags = 0;
  v6->_ob.ob_binary = 0;
  v6->_ob.ob_maxsize = 0x100000;
  v6->_fd = a3;
  v6->_last_attrs = 4112;
  v6->_int cur_attrs = 4112;
  v6->_colorMode = v4;
  uint64_t v8 = getenv("LOG_USE_ESCAPECNTRLCHARS");
  BOOL v9 = !v8 || strcmp(v8, "0");
  v7->_vis = v9;
  int64_t v10 = getenv("TERM");
  switch(v4)
  {
    case 0:
      pid_t v11 = v10;
      int v12 = isatty(a3);
      if (!v11 || !v12 || !strcmp(v11, "dummy")) {
        return v7;
      }
      if (!strcasestr(v11, "ansi"))
      {
        BOOL v13 = strcasestr(v11, "color") != 0;
        goto LABEL_15;
      }
LABEL_14:
      BOOL v13 = 1;
LABEL_15:
      v7->_fancy = v13;
      return v7;
    case 2:
      goto LABEL_14;
    case 1:
      v7->_fancy = 0;
      break;
  }
  return v7;
}

- (OSLogTermDumper)init
{
  return [(OSLogTermDumper *)self initWithFd:1 colorMode:0];
}

- (void)resetStyle
{
  self->_int cur_attrs = 4112;
}

- (void)setFgColor:(unsigned __int8)a3
{
  self->_int cur_attrs = self->_cur_attrs & 0xE0FF | (a3 << 8);
}

- (void)setBgColor:(unsigned __int8)a3
{
  self->_int cur_attrs = self->_cur_attrs & 0xFFE0 | a3;
}

- (void)setUnderline:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  self->_int cur_attrs = self->_cur_attrs & 0xFF7F | v3;
}

- (void)setOblique:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  self->_int cur_attrs = self->_cur_attrs & 0xFFBF | v3;
}

- (void)setBold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  self->_int cur_attrs = self->_cur_attrs & 0xFFDF | v3;
}

- (unsigned)fgColor
{
  return HIBYTE(self->_cur_attrs) & 0x1F;
}

- (unsigned)bgColor
{
  return self->_cur_attrs & 0x1F;
}

- (BOOL)isUnderlined
{
  return (self->_cur_attrs >> 7) & 1;
}

- (BOOL)isOblique
{
  return (self->_cur_attrs >> 6) & 1;
}

- (BOOL)isBold
{
  return (self->_cur_attrs >> 5) & 1;
}

@end