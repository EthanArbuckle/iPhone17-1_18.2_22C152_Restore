@interface LoggingSupport_OSLogCoder
- (void)_initBlob;
- (void)appendBytes:(const void *)a3 length:(unint64_t)a4;
- (void)setPublic;
- (void)setTruncated;
@end

@implementation LoggingSupport_OSLogCoder

- (void)appendBytes:(const void *)a3 length:(unint64_t)a4
{
  fmt_cmd = self->_fmt_cmd;
  if ((*(unsigned char *)fmt_cmd & 7) == 0) {
    *(unsigned char *)fmt_cmd |= 1u;
  }
  if (!self->_initialized) {
    [(LoggingSupport_OSLogCoder *)self _initBlob];
  }
  ob = self->_ob;
  if (ob)
  {
    uint64_t written = self->_written;
    unint64_t maxsz = self->_maxsz;
    unint64_t v11 = written + a4;
    if (__CFADD__(written, a4) || (!(v11 >> 16) ? (BOOL v12 = v11 >= maxsz) : (BOOL v12 = 1), v12))
    {
      self->_truncated = 1;
      LOWORD(v11) = maxsz;
    }
    if ((ob->ob_flags & 2) == 0)
    {
      size_t v13 = (unsigned __int16)v11 - written;
      uint64_t ob_len = ob->ob_len;
      if (v13 > (ob->ob_binary + ob->ob_size - ob_len - 1))
      {
        os_trace_blob_add_slow((uint64_t)ob, (void *)a3, v13);
      }
      else
      {
        memcpy(&ob->var0.ob_b[ob_len], a3, v13);
        unsigned int v15 = ob->ob_len + v13;
        ob->uint64_t ob_len = v15;
        if (!ob->ob_binary) {
          ob->var0.ob_b[v15] = 0;
        }
      }
    }
    self->_uint64_t written = v11;
  }
}

- (void)setTruncated
{
  self->_truncated = 1;
}

- (void)setPublic
{
  fmt_cmd = self->_fmt_cmd;
  if (*(unsigned char *)fmt_cmd)
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Cannot force Public over Private";
    __break(1u);
  }
  else
  {
    *(unsigned char *)fmt_cmd |= 2u;
  }
}

- (void)_initBlob
{
  if ((*(unsigned char *)self->_fmt_cmd & 7) != 0)
  {
    if (privacy_flags2opt[*(unsigned char *)self->_fmt_cmd & 7] <= self->_privacy_level)
    {
      if (*(unsigned char *)self->_fmt_cmd) {
        ob_priv = self->_ob_priv;
      }
      else {
        ob_priv = self->_ob_pub;
      }
      self->_ob = ob_priv;
      if (!ob_priv) {
        goto LABEL_10;
      }
    }
    else if (self->_mask)
    {
      self->_ob_mask.var0.ob_b = self->_maskbuf;
      ob_priv = &self->_ob_mask;
      *(void *)&self->_ob_mask.uint64_t ob_len = 0x8000000000;
      self->_ob_mask.ob_maxsize = 0;
      self->_ob_mask.ob_flags = 0;
      self->_ob_mask.ob_binary = 1;
      self->_ob = &self->_ob_mask;
      self->_unint64_t maxsz = 0x10000;
    }
    else
    {
      ob_priv = self->_ob;
      if (!ob_priv) {
        goto LABEL_10;
      }
    }
    self->_offset = ob_priv->ob_len;
LABEL_10:
    self->_initialized = 1;
    return;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

@end