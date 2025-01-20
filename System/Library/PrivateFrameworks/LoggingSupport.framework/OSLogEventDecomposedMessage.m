@interface OSLogEventDecomposedMessage
- (OSLogEventDecomposedMessage)initWithEventProxy:(id)a3;
- (OSLogEventProxy)proxy;
- (id)argumentAtIndex:(unint64_t)a3;
- (id)literalPrefixAtIndex:(unint64_t)a3;
- (id)placeholderAtIndex:(unint64_t)a3;
- (os_log_fmt_raw_placeholder)_rawPlaceholderForIndex:(unsigned __int16)a3;
- (unint64_t)placeholderCount;
- (unint64_t)sizeOfLong;
- (unint64_t)state;
- (void)_initializePlaceholders;
- (void)_populateFields;
- (void)_unmake;
- (void)dealloc;
@end

@implementation OSLogEventDecomposedMessage

- (id)placeholderAtIndex:(unint64_t)a3
{
  if ([(OSLogEventDecomposedMessage *)self placeholderCount] <= a3 || !self->_rawPlaceholders) {
    return 0;
  }
  v5 = [[OSLogMessagePlaceholder alloc] initWithPlaceholderStruct:(char *)&self->_rawPlaceholders->var1 + 104 * a3];
  return v5;
}

- (id)argumentAtIndex:(unint64_t)a3
{
  if ([(OSLogEventDecomposedMessage *)self placeholderCount] <= a3) {
    return 0;
  }
  v5 = [[OSLogEventMessageArgument alloc] initWithProxy:self index:a3];
  return v5;
}

- (unint64_t)sizeOfLong
{
  return self->_sizeof_long;
}

- (os_log_fmt_raw_placeholder)_rawPlaceholderForIndex:(unsigned __int16)a3
{
  uint64_t v5 = a3;
  if ([(OSLogEventDecomposedMessage *)self placeholderCount] <= a3) {
    return 0;
  }
  else {
    return (os_log_fmt_raw_placeholder *)((char *)self->_rawPlaceholders + 104 * v5);
  }
}

- (id)literalPrefixAtIndex:(unint64_t)a3
{
  if (self->_messageState || !self->_fmt) {
    return 0;
  }
  if ([(OSLogEventDecomposedMessage *)self placeholderCount] | a3)
  {
    if ([(OSLogEventDecomposedMessage *)self placeholderCount] < a3 || !self->_rawPlaceholders) {
      return 0;
    }
    if ([(OSLogEventDecomposedMessage *)self placeholderCount] <= a3)
    {
      if (a3)
      {
        v8 = (const char *)(*((void *)&self->_rawPlaceholders[-1] + 13 * a3 - 2)
                          + *((unsigned __int16 *)&self->_rawPlaceholders[-1] + 52 * a3 - 2));
        int64_t v9 = strlen(v8);
LABEL_15:
        if (v9 >= 1)
        {
          id v12 = [NSString alloc];
          fmt = v8;
LABEL_21:
          v14 = (void *)[v12 initWithBytes:fmt length:v9 encoding:4];
          return v14;
        }
        return 0;
      }
      int64_t v9 = strlen(self->_fmt);
    }
    else
    {
      rawPlaceholders = self->_rawPlaceholders;
      v7 = &rawPlaceholders->var1.var0 + 13 * a3;
      if (a3)
      {
        v8 = (const char *)(*((void *)&rawPlaceholders[-1] + 13 * a3 - 2)
                          + *((unsigned __int16 *)&rawPlaceholders[-1] + 52 * a3 - 2));
        int64_t v9 = *v7 - v8;
        goto LABEL_15;
      }
      int64_t v9 = *v7 - self->_fmt;
    }
    if (v9 >= 1)
    {
      id v12 = [NSString alloc];
      fmt = self->_fmt;
      goto LABEL_21;
    }
    return 0;
  }
  v10 = NSString;
  v11 = self->_fmt;
  return (id)[v10 stringWithCString:v11 encoding:4];
}

- (unint64_t)placeholderCount
{
  if (self->_messageState) {
    return 0;
  }
  else {
    return self->_placeholderCount;
  }
}

- (unint64_t)state
{
  return self->_messageState;
}

- (void)_unmake
{
  self->_hasPopulatedFields = 0;
}

- (OSLogEventDecomposedMessage)initWithEventProxy:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OSLogEventDecomposedMessage;
  v4 = [(OSLogEventDecomposedMessage *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_proxy = (OSLogEventProxy *)a3;
    [(OSLogEventDecomposedMessage *)v4 _populateFields];
  }
  return v5;
}

- (void)_populateFields
{
  if (self->_hasPopulatedFields) {
    return;
  }
  self->_hasPopulatedFields = 1;
  proxy = self->_proxy;
  if ((proxy->_efv & 3) == 1)
  {
    _resolve_uuid_slow((uint64_t)self->_proxy);
    proxy = self->_proxy;
  }
  if (!proxy->_eint.var0.activity_create.creator_aid && !proxy->_eint.common.message)
  {
LABEL_35:
    unint64_t v5 = 2;
    goto LABEL_9;
  }
  self->_messageState = 0;
  unint64_t unique_pid = proxy->_eint.var0.activity_create.unique_pid;
  if (unique_pid >> 16 || proxy->_eint.var0.log_message.privdata_sz >= 0x10000) {
    goto LABEL_8;
  }
  if (proxy->_eint.type == 768)
  {
    if (unique_pid - 1733 >= 0xFFFFFFFFFFFFF93CLL)
    {
      buffer = proxy->_eint.var0.log_message.buffer;
      uint64_t v7 = buffer[unique_pid - 1];
      if ((_WORD)unique_pid + ~(_WORD)v7 + 2 * (_WORD)v7 != 0xFFFE)
      {
        hdr_buffer = (os_log_fmt_hdr_s *)self->_hdr_buffer;
        if (!hdr_buffer)
        {
          hdr_buffer = (os_log_fmt_hdr_s *)malloc_type_malloc(0x6C4uLL, 0x85872847uLL);
          self->_hdr_buffer = hdr_buffer;
          buffer = proxy->_eint.var0.log_message.buffer;
          unint64_t unique_pid = proxy->_eint.var0.activity_create.unique_pid;
          uint64_t v7 = buffer[unique_pid - 1];
        }
        hdr_buffer->var0 = 0;
        hdr_buffer->var1 = v7;
        if (v7)
        {
          uint64_t v9 = -v7;
          v10 = &buffer[unique_pid + ~v7];
          var2 = hdr_buffer->var2;
          uint64_t v12 = (uint64_t)&buffer[unique_pid - 1];
          while (1)
          {
            char v13 = *(unsigned char *)(v12 + v9);
            uint64_t v14 = v13 & 0x3F;
            v15 = &buffer[v14];
            if (&buffer[v14] > v10) {
              break;
            }
            unsigned __int8 *var2 = 0;
            var2[1] = v14;
            v16 = var2 + 2;
            memcpy(var2 + 2, buffer, v13 & 0x3F);
            var2 = &v16[v14];
            buffer = v15;
            if (__CFADD__(v9++, 1)) {
              goto LABEL_21;
            }
          }
          self->_hdr = 0;
          goto LABEL_8;
        }
LABEL_21:
        self->_hdr = hdr_buffer;
        goto LABEL_25;
      }
    }
LABEL_8:
    unint64_t v5 = 1;
LABEL_9:
    self->_messageState = v5;
    return;
  }
  hdr = proxy->_eint.var0.log_message.hdr;
  if (hdr)
  {
    self->_hdr = hdr;
    self->_pubdata = proxy->_eint.var0.log_message.pubdata;
    self->_pubsize = proxy->_eint.var0.log_message.pubdata_sz;
    goto LABEL_25;
  }
  pubdata = (const os_log_fmt_hdr_s *)os_log_fmt_extract_pubdata(proxy->_eint.var0.log_message.buffer, (unsigned __int16)proxy->_eint.var0.activity_create.unique_pid, &proxy->_eint.var0.timesync.continuous_time, &proxy->_eint.var0.log_message.pubdata_sz);
  proxy->_eint.var0.timesync.flags = (unint64_t)pubdata;
  self->_hdr = pubdata;
  self->_pubdata = proxy->_eint.var0.log_message.pubdata;
  self->_pubsize = proxy->_eint.var0.log_message.pubdata_sz;
  if (!pubdata) {
    goto LABEL_8;
  }
LABEL_25:
  message = proxy->_eint.common.message;
  if (!message)
  {
    message = _os_log_resolve_format((__n128 *)proxy->_eint.common.image_uuid, proxy->_eint.common.trace_id, proxy->_eint.common.format_offset, 0);
    proxy->_eint.common.message = (char *)message;
  }
  self->_fmt = message;
  self->_privdata = proxy->_eint.var0.log_message.privdata;
  self->_privsize = proxy->_eint.var0.log_message.privdata_sz;
  unint64_t v21 = 1;
  if (proxy->_eint.type != 768) {
    unint64_t v21 = 2;
  }
  self->_variant = v21;
  self->_placeholderCount = 0;
  if (!message) {
    goto LABEL_35;
  }
  unint64_t v22 = 4;
  if ((proxy->_eint.common.opaque_flags & 1) == 0) {
    unint64_t v22 = 8;
  }
  self->_sizeof_long = v22;
  [(OSLogEventDecomposedMessage *)self _initializePlaceholders];
}

- (void)_initializePlaceholders
{
  if (!self->_messageState)
  {
    if (!self->_rawPlaceholders) {
      self->_rawPlaceholders = (os_log_fmt_raw_placeholder *)malloc_type_calloc(0x60uLL, 0x68uLL, 0x10D004083089DD7uLL);
    }
    fmt = self->_fmt;
    hdr = self->_hdr;
    var2 = hdr->var2;
    unsigned __int16 var1 = hdr->var1;
    unsigned int v18 = (hdr->var0 >> 5) & 3;
    unint64_t v5 = 0;
    if ([(OSLogEventProxy *)self->_proxy _shouldIncludeSensitive]) {
      unsigned int v6 = 3;
    }
    else {
      unsigned int v6 = 1;
    }
    do
    {
      uint64_t v7 = (char *)&fmt[strcspn(fmt, "%")];
      if (!*v7) {
        return;
      }
      if (v7[1] != 37)
      {
        rawPlaceholders = self->_rawPlaceholders;
        uint64_t v9 = (uint64_t)&rawPlaceholders->var1 + 104 * v5;
        v10 = os_log_fmt_delimit(v7, self->_variant, v9);
        if (v10)
        {
          if (*(&rawPlaceholders->var1.var1 + 52 * v5))
          {
            self->_messageState = 3;
            return;
          }
          v11 = v10;
          ++self->_placeholderCount;
          os_log_fmt_read_aster_if_necessary(v9, &var1, &var2);
          unsigned __int16 v13 = var1;
          if (var1)
          {
            uint64_t v14 = var2;
            unsigned __int16 v13 = --var1;
            var2 += var2[1] + 2;
          }
          else
          {
            uint64_t v14 = 0;
          }
          char data = os_log_fmt_get_data(v9, v18, v6, v14, v13, self->_sizeof_long, (unint64_t *)self->_rawPlaceholders + 13 * v5, (_WORD *)&self->_rawPlaceholders[1].var0 + 52 * v5 + 1, v12, (BOOL *)&self->_rawPlaceholders[1].var1.var1 + 104 * v5, (uint64_t)self->_pubdata, self->_pubsize, (uint64_t)self->_privdata, self->_privsize);
          v16 = self->_rawPlaceholders;
          *((unsigned char *)&v16[1].var0 + 104 * v5) = data;
          if (v14)
          {
            *((unsigned char *)&v16[1].var0 + 104 * v5 + 1) = *v14 >> 4;
            if (*v14)
            {
              uint64_t v17 = 2;
LABEL_22:
              *((void *)&v16[1].var1.var0 + 13 * v5) = v17;
            }
            else if ((*v14 & 2) != 0)
            {
              uint64_t v17 = 1;
              goto LABEL_22;
            }
          }
          fmt = &v11[(void)v7];
          ++v5;
          continue;
        }
        if (!v7[1]) {
          return;
        }
      }
      fmt = v7 + 2;
    }
    while (v5 < 0x60);
  }
}

- (void)dealloc
{
  hdr_buffer = self->_hdr_buffer;
  if (hdr_buffer) {
    free(hdr_buffer);
  }
  rawPlaceholders = self->_rawPlaceholders;
  if (rawPlaceholders) {
    free(rawPlaceholders);
  }
  v5.receiver = self;
  v5.super_class = (Class)OSLogEventDecomposedMessage;
  [(OSLogEventDecomposedMessage *)&v5 dealloc];
}

- (OSLogEventProxy)proxy
{
  return self->_proxy;
}

@end