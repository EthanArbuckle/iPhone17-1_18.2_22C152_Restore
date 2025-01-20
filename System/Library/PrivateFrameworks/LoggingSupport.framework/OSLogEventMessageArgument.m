@interface OSLogEventMessageArgument
- (NSObject)objectRepresentation;
- (OSLogEventMessageArgument)initWithProxy:(id)a3 index:(unint64_t)a4;
- (const)rawBytes;
- (double)doubleValue;
- (double)longDoubleValue;
- (int64_t)int64Value;
- (unint64_t)availability;
- (unint64_t)category;
- (unint64_t)privacy;
- (unint64_t)scalarCategory;
- (unint64_t)scalarType;
- (unint64_t)unsignedInt64Value;
- (unsigned)rawBytesLength;
@end

@implementation OSLogEventMessageArgument

- (unint64_t)privacy
{
  return (unint64_t)self->_rawArg[1].var1.var0;
}

- (OSLogEventMessageArgument)initWithProxy:(id)a3 index:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)OSLogEventMessageArgument;
  v6 = [(OSLogEventMessageArgument *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_decomposedMessage = (OSLogEventDecomposedMessage *)a3;
    v6->_rawArg = (os_log_fmt_raw_placeholder *)[a3 _rawPlaceholderForIndex:a4];
    v7->_sizeofLong = [a3 sizeOfLong];
  }
  return v7;
}

- (NSObject)objectRepresentation
{
  rawArg = self->_rawArg;
  if (LOBYTE(rawArg[1].var0)) {
    return 0;
  }
  uint64_t p_var1 = (uint64_t)&rawArg->var1;
  if ((rawArg->var1.var1 & 0x10) != 0)
  {
    uint64_t scalar = os_log_fmt_read_scalar(p_var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0));
    switch([(OSLogEventMessageArgument *)self scalarCategory])
    {
      case 1uLL:
        objc_super v9 = (void *)MEMORY[0x1E4F28ED0];
        result = [v9 numberWithUnsignedLongLong:scalar];
        break;
      case 2uLL:
        v10 = (void *)MEMORY[0x1E4F28ED0];
        result = [v10 numberWithLongLong:scalar];
        break;
      case 3uLL:
      case 4uLL:
        v8 = (void *)MEMORY[0x1E4F28ED0];
        result = [v8 numberWithDouble:*(double *)&scalar];
        break;
      default:
        return 0;
    }
  }
  else
  {
    id v6 = os_log_fmt_object_for_data(p_var1, BYTE1(rawArg[1].var0), (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0), self->_sizeofLong);
    return v6;
  }
  return result;
}

- (unint64_t)scalarCategory
{
  unint64_t result = [(OSLogEventMessageArgument *)self category];
  if (result)
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0 && (unsigned int v5 = rawArg->var1.var2 - 1, v5 <= 0xE)) {
      return qword_1A118AEA0[v5];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unint64_t)category
{
  rawArg = self->_rawArg;
  if ((rawArg->var1.var1 & 0x10) != 0) {
    return 1;
  }
  if ((rawArg->var1.var2 & 0xFC) != 0x10) {
    return 0;
  }
  if (BYTE1(rawArg[1].var0) == 3) {
    return 3;
  }
  return 2;
}

- (double)longDoubleValue
{
  double v2 = 0.0;
  if (![a1 availability])
  {
    uint64_t v3 = a1[2];
    if ((*(_WORD *)(v3 + 16) & 0x10) != 0)
    {
      uint64_t scalar = os_log_fmt_read_scalar(v3 + 8, *(unsigned __int8 **)v3, *(unsigned __int16 *)(v3 + 82));
      switch([a1 scalarCategory])
      {
        case 1:
          double v2 = (double)(unint64_t)scalar;
          break;
        case 2:
          double v2 = (double)scalar;
          break;
        case 3:
        case 4:
          double v2 = *(double *)&scalar;
          break;
        default:
          return v2;
      }
    }
  }
  return v2;
}

- (double)doubleValue
{
  double v3 = 0.0;
  if (![(OSLogEventMessageArgument *)self availability])
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      uint64_t scalar = os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0));
      switch([(OSLogEventMessageArgument *)self scalarCategory])
      {
        case 1uLL:
          double v3 = (double)(unint64_t)scalar;
          break;
        case 2uLL:
          double v3 = (double)scalar;
          break;
        case 3uLL:
        case 4uLL:
          double v3 = *(double *)&scalar;
          break;
        default:
          return v3;
      }
    }
  }
  return v3;
}

- (int64_t)int64Value
{
  if (![(OSLogEventMessageArgument *)self availability])
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      double v4 = COERCE_DOUBLE(os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0)));
      unint64_t v6 = [(OSLogEventMessageArgument *)self scalarCategory];
      if (v6 - 1 < 2) {
        return *(void *)&v4;
      }
      if (v6 == 4 || v6 == 3)
      {
        *(void *)&double v4 = (uint64_t)v4;
        return *(void *)&v4;
      }
    }
  }
  double v4 = 0.0;
  return *(void *)&v4;
}

- (unint64_t)unsignedInt64Value
{
  if (![(OSLogEventMessageArgument *)self availability])
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0)
    {
      double v4 = COERCE_DOUBLE(os_log_fmt_read_scalar((uint64_t)&rawArg->var1, (unsigned __int8 *)rawArg->var0, WORD1(rawArg[1].var0)));
      unint64_t v6 = [(OSLogEventMessageArgument *)self scalarCategory];
      if (v6 - 1 < 2) {
        return *(void *)&v4;
      }
      if (v6 == 4 || v6 == 3)
      {
        *(void *)&double v4 = (unint64_t)v4;
        return *(void *)&v4;
      }
    }
  }
  double v4 = 0.0;
  return *(void *)&v4;
}

- (unint64_t)scalarType
{
  unint64_t result = [(OSLogEventMessageArgument *)self category];
  if (result)
  {
    rawArg = self->_rawArg;
    if ((rawArg->var1.var1 & 0x10) != 0 && (unsigned int v5 = rawArg->var1.var2 - 1, v5 <= 0xE)) {
      return qword_1A118AF18[v5];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unsigned)rawBytesLength
{
  return WORD1(self->_rawArg[1].var0);
}

- (const)rawBytes
{
  return self->_rawArg->var0;
}

- (unint64_t)availability
{
  rawArg = self->_rawArg;
  unint64_t result = 2;
  switch(LOBYTE(rawArg[1].var0))
  {
    case 0:
      if (LOBYTE(rawArg[1].var1.var1)) {
        unint64_t result = 3;
      }
      else {
        unint64_t result = 0;
      }
      break;
    case 1:
    case 5:
    case 6:
    case 7:
      return result;
    case 2:
      unint64_t result = 1;
      break;
    default:
      unint64_t result = 4;
      break;
  }
  return result;
}

@end