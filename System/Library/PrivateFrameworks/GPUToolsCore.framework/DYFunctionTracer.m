@interface DYFunctionTracer
+ (void)initialize;
- (BOOL)_skipFirstArgumentForFunction:(const Function *)a3;
- (BOOL)compact;
- (BOOL)compactFloats;
- (BOOL)compilable;
- (BOOL)emitAssociatedFunctions;
- (BOOL)emitDataIndices;
- (BOOL)emitErrors;
- (BOOL)emitFunctionComments;
- (BOOL)emitHiddenReceiverArgument;
- (BOOL)emitTypeSuffixes;
- (BOOL)emitVariables;
- (BOOL)prependReceiverArgument;
- (BOOL)useHexadecimalFloatFormat;
- (DYFunctionTracer)init;
- (DYFunctionTracerDelegate)delegate;
- (NSMutableDictionary)urlIndices;
- (NSString)nilString;
- (id)_newNumberForScalarArgument:(const Argument *)a3;
- (id)_stringForScalar1DArrayArgument:(const Argument *)a3 usingBlock:(id)a4;
- (id)_stringForScalarArgument:(const Argument *)a3;
- (id)_stringWithIntegerNumber:(id)a3 coreType:(unsigned int)a4;
- (id)_stringWithNumber:(id)a3 argument:(const Argument *)a4;
- (id)createArgument:(const Argument *)a3 forFunction:(const Function *)a4 withValue:(id)a5;
- (id)getCastForArgument:(const Argument *)a3 inFunction:(const Function *)a4;
- (id)getIndexFromURL:(id)a3;
- (id)loadStringForURL:(id)a3 variableName:(id)a4 bufferType:(id)a5;
- (id)nextArrayVariable;
- (id)rewriteArgument:(const Argument *)a3;
- (id)rewriteReceiver:(unint64_t)a3;
- (id)rewriteURL:(const char *)a3;
- (id)rewriteVariable:(const char *)a3;
- (id)traceFunction:(const Function *)a3 error:(id *)a4;
- (id)traceFunction:(const Function *)a3 returnVariable:(id)a4 error:(id *)a5;
- (id)traceFunctionAsLines:(const Function *)a3 returnVariable:(id)a4 error:(id *)a5;
- (id)typeStringForArgument:(const Argument *)a3;
- (id)unloadStringForURL:(id)a3;
- (id)valueForArgument:(const Argument *)a3;
- (id)valueStringForArgument:(const Argument *)a3;
- (id)variableForReceiverID:(unint64_t)a3;
- (id)variableForReceiverIDNumber:(id)a3;
- (unsigned)_objectNameFromVariable:(const char *)a3;
- (void)_appendReturnValueToTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:;
- (void)_appendTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:;
- (void)_enumerateScalar1DArrayArgumentValues:(const Argument *)a3 usingBlock:(id)a4;
- (void)dealloc;
- (void)setCompact:(BOOL)a3;
- (void)setCompactFloats:(BOOL)a3;
- (void)setCompilable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEmitAssociatedFunctions:(BOOL)a3;
- (void)setEmitDataIndices:(BOOL)a3;
- (void)setEmitErrors:(BOOL)a3;
- (void)setEmitFunctionComments:(BOOL)a3;
- (void)setEmitHiddenReceiverArgument:(BOOL)a3;
- (void)setEmitTypeSuffixes:(BOOL)a3;
- (void)setEmitVariables:(BOOL)a3;
- (void)setPrependReceiverArgument:(BOOL)a3;
- (void)setUseHexadecimalFloatFormat:(BOOL)a3;
@end

@implementation DYFunctionTracer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _floatFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08A30]);
    [(id)_floatFormatter setNumberStyle:1];
    [(id)_floatFormatter setMinimumFractionDigits:0];
    [(id)_floatFormatter setMaximumFractionDigits:4];
    v2 = (void *)_floatFormatter;
    [v2 setUsesGroupingSeparator:0];
  }
}

- (DYFunctionTracer)init
{
  v5.receiver = self;
  v5.super_class = (Class)DYFunctionTracer;
  v2 = [(DYFunctionTracer *)&v5 init];
  v3 = (DYFunctionTracer *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 28) = 0;
    *((_WORD *)v2 + 16) = 0;
    v2[34] = 1;
    *(_DWORD *)(v2 + 35) = 0;
    v2[39] = 1;
    *(_WORD *)(v2 + 41) = 0;
    v2[43] = 0;
    *((void *)v2 + 1) = objc_opt_new();
    v3->_nilString = (NSString *)@"nil";
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYFunctionTracer;
  [(DYFunctionTracer *)&v3 dealloc];
}

- (void)setCompilable:(BOOL)a3
{
  self->_compilable = a3;
  if (a3)
  {
    BOOL compact = 0;
    BOOL prependReceiverArgument = 0;
  }
  else
  {
    BOOL compact = self->_compact;
    BOOL prependReceiverArgument = self->_prependReceiverArgument;
  }
  self->_compactEffective = compact;
  self->_prependReceiverEffective = prependReceiverArgument;
}

- (void)setCompact:(BOOL)a3
{
  self->_BOOL compact = a3;
  BOOL v3 = !self->_compilable && a3;
  self->_compactEffective = v3;
}

- (void)setPrependReceiverArgument:(BOOL)a3
{
  self->_BOOL prependReceiverArgument = a3;
  BOOL v3 = !self->_compilable && a3;
  self->_prependReceiverEffective = v3;
}

- (id)_stringWithIntegerNumber:(id)a3 coreType:(unsigned int)a4
{
  id result = (id)[a3 stringValue];
  if (self->_emitTypeSuffixes)
  {
    if (a4 <= 0xC && ((1 << a4) & 0x1154) != 0) {
      id result = (id)[result stringByAppendingString:@"u"];
    }
    unsigned int v7 = a4 - 7;
    if (a4 - 7 <= 5 && ((0x33u >> v7) & 1) != 0)
    {
      v8 = off_265336628[v7];
      return (id)[result stringByAppendingString:v8];
    }
  }
  return result;
}

- (id)_stringWithNumber:(id)a3 argument:(const Argument *)a4
{
  unsigned __int16 var5 = a4->var5;
  if ((var5 & 8) != 0)
  {
    v11 = -[DYFunctionTracer rewriteURL:](self, "rewriteURL:", [a3 unsignedLongValue]);
    goto LABEL_18;
  }
  if ((var5 & 0x10) != 0)
  {
    v11 = -[DYFunctionTracer rewriteVariable:](self, "rewriteVariable:", [a3 unsignedLongValue]);
    goto LABEL_18;
  }
  unsigned int var2 = a4->var2;
  if (var2 == 14)
  {
    uint64_t v12 = [a3 unsignedLongValue];
    if (!v12)
    {
LABEL_14:
      v11 = [(DYFunctionTracer *)self nilString];
      goto LABEL_18;
    }
    v11 = (NSString *)[NSString stringWithFormat:@"\"%@\", objc_msgSend(NSString, "stringWithUTF8String:"", v12)];
LABEL_18:
    v13 = v11;
    goto LABEL_19;
  }
  if (var2 != 13) {
    goto LABEL_21;
  }
  unint64_t v9 = [a3 unsignedLongLongValue];
  if (!v9) {
    goto LABEL_14;
  }
  if (HIDWORD(v9))
  {
    if (self->_emitTypeSuffixes) {
      v10 = @"0x%llxl";
    }
    else {
      v10 = @"0x%llx";
    }
  }
  else
  {
    v10 = @"0x%08llx";
  }
  v13 = (NSString *)objc_msgSend(NSString, "stringWithFormat:", v10, v9);
  if (self->_compilable)
  {
    v11 = (NSString *)[@"(void*)" stringByAppendingString:v13];
    goto LABEL_18;
  }
LABEL_19:
  if (v13) {
    return v13;
  }
LABEL_21:
  unsigned int var1 = a4->var1;
  switch(var1)
  {
    case 0xDu:
      uint64_t v19 = [a3 unsignedLongValue];
      if (v19)
      {
        if (self->_compilable) {
          v20 = @"(void*)0x%016lx";
        }
        else {
          v20 = @"0x%016lx";
        }
        return (id)objc_msgSend(NSString, "stringWithFormat:", v20, v19, v24);
      }
      else
      {
        return [(DYFunctionTracer *)self nilString];
      }
    case 0xAu:
      [a3 doubleValue];
      if (fabs(v18) == INFINITY)
      {
        BOOL v17 = v18 < 0.0;
LABEL_28:
        if (v17) {
          return @"-INFINITY";
        }
        else {
          return @"INFINITY";
        }
      }
      if (self->_compilable && self->_useHexadecimalFloatFormat) {
        return (id)objc_msgSend(NSString, "stringWithFormat:", @"%a /* %0.16F */", *(void *)&v18, *(void *)&v18);
      }
      if (!self->_compactFloats)
      {
        if (self->_emitTypeSuffixes) {
          return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0.16Ff", *(void *)&v18, v24);
        }
        else {
          return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0.16F", *(void *)&v18, v24);
        }
      }
      v21 = (void *)_floatFormatter;
      uint64_t v22 = objc_msgSend(NSNumber, "numberWithDouble:");
      goto LABEL_50;
    case 9u:
      [a3 floatValue];
      if (fabsf(v16) == INFINITY)
      {
        BOOL v17 = v16 < 0.0;
        goto LABEL_28;
      }
      if (self->_compilable && self->_useHexadecimalFloatFormat) {
        return (id)objc_msgSend(NSString, "stringWithFormat:", @"%a /* %0.7F */", v16, v16);
      }
      if (!self->_compactFloats)
      {
        double v23 = v16;
        if (self->_emitTypeSuffixes) {
          return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0.7Ff", *(void *)&v23, v24);
        }
        else {
          return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0.7F", *(void *)&v23, v24);
        }
      }
      v21 = (void *)_floatFormatter;
      uint64_t v22 = objc_msgSend(NSNumber, "numberWithFloat:");
LABEL_50:
      return (id)[v21 stringFromNumber:v22];
    default:
      return -[DYFunctionTracer _stringWithIntegerNumber:coreType:](self, "_stringWithIntegerNumber:coreType:", a3);
  }
}

- (void)_enumerateScalar1DArrayArgumentValues:(const Argument *)a3 usingBlock:(id)a4
{
  var0 = a3->var0;
  if (a3->var0)
  {
    if (a3->var2 == 14 || (a3->var5 & 0x18) != 0)
    {
      uint64_t v7 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)a3);
      if (a3->var4)
      {
        uint64_t v8 = v7;
        unint64_t v9 = 0;
        do
        {
          id v10 = objc_alloc(NSNumber);
          uint64_t v11 = *(void *)v8;
          if ((*(_WORD *)(v8 + 22) & 0x40) != 0) {
            uint64_t v12 = *(unsigned int *)(v11 + 4 * v9) + v11;
          }
          else {
            uint64_t v12 = *(void *)(v11 + 8 * v9);
          }
          v13 = (void *)[v10 initWithUnsignedLong:v12];
          (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v13, v9 == a3->var4 - 1);

          ++v9;
        }
        while (v9 < a3->var4);
      }
    }
    else
    {
      switch(a3->var1)
      {
        case 1u:
          if (a3->var4)
          {
            unint64_t v16 = 0;
            do
            {
              BOOL v17 = (void *)[objc_alloc(NSNumber) initWithChar:*((char *)var0 + v16)];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v17, v16 == a3->var4 - 1);

              ++v16;
            }
            while (v16 < a3->var4);
          }
          break;
        case 2u:
          if (a3->var4)
          {
            unint64_t v18 = 0;
            do
            {
              uint64_t v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:*((unsigned __int8 *)var0 + v18)];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v19, v18 == a3->var4 - 1);

              ++v18;
            }
            while (v18 < a3->var4);
          }
          break;
        case 3u:
          if (a3->var4)
          {
            unint64_t v20 = 0;
            do
            {
              v21 = (void *)[objc_alloc(NSNumber) initWithShort:*((__int16 *)var0 + v20)];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v21, v20 == a3->var4 - 1);

              ++v20;
            }
            while (v20 < a3->var4);
          }
          break;
        case 4u:
          if (a3->var4)
          {
            unint64_t v22 = 0;
            do
            {
              double v23 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:*((unsigned __int16 *)var0 + v22)];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v23, v22 == a3->var4 - 1);

              ++v22;
            }
            while (v22 < a3->var4);
          }
          break;
        case 5u:
          if (a3->var4)
          {
            unint64_t v24 = 0;
            do
            {
              v25 = (void *)[objc_alloc(NSNumber) initWithInt:*((unsigned int *)var0 + v24)];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v25, v24 == a3->var4 - 1);

              ++v24;
            }
            while (v24 < a3->var4);
          }
          break;
        case 6u:
          if (a3->var4)
          {
            unint64_t v26 = 0;
            do
            {
              v27 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)var0 + v26)];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v27, v26 == a3->var4 - 1);

              ++v26;
            }
            while (v26 < a3->var4);
          }
          break;
        case 7u:
          if (a3->var4)
          {
            unint64_t v28 = 0;
            do
            {
              v29 = (void *)[objc_alloc(NSNumber) initWithLongLong:var0[v28]];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v29, v28 == a3->var4 - 1);

              ++v28;
            }
            while (v28 < a3->var4);
          }
          break;
        case 8u:
          if (a3->var4)
          {
            unint64_t v30 = 0;
            do
            {
              v31 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:var0[v30]];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v31, v30 == a3->var4 - 1);

              ++v30;
            }
            while (v30 < a3->var4);
          }
          break;
        case 9u:
          if (a3->var4)
          {
            unint64_t v32 = 0;
            do
            {
              id v33 = objc_alloc(NSNumber);
              LODWORD(v34) = *((_DWORD *)var0 + v32);
              v35 = (void *)[v33 initWithFloat:v34];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v35, v32 == a3->var4 - 1);

              ++v32;
            }
            while (v32 < a3->var4);
          }
          break;
        case 0xAu:
          if (a3->var4)
          {
            unint64_t v36 = 0;
            do
            {
              v37 = (void *)[objc_alloc(NSNumber) initWithDouble:*(double *)&var0[v36]];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v37, v36 == a3->var4 - 1);

              ++v36;
            }
            while (v36 < a3->var4);
          }
          break;
        case 0xBu:
          if (a3->var4)
          {
            unint64_t v38 = 0;
            do
            {
              v39 = (void *)[objc_alloc(NSNumber) initWithLong:var0[v38]];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v39, v38 == a3->var4 - 1);

              ++v38;
            }
            while (v38 < a3->var4);
          }
          break;
        case 0xCu:
        case 0xDu:
          if (a3->var4)
          {
            unint64_t v14 = 0;
            do
            {
              v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:var0[v14]];
              (*((void (**)(id, void *, BOOL))a4 + 2))(a4, v15, v14 == a3->var4 - 1);

              ++v14;
            }
            while (v14 < a3->var4);
          }
          break;
        default:
          dy_abort("invalid core type: %u", a3->var1);
      }
    }
  }
}

- (id)_stringForScalar1DArrayArgument:(const Argument *)a3 usingBlock:(id)a4
{
  uint64_t v7 = [MEMORY[0x263F089D8] stringWithString:@"{"];
  uint64_t v8 = (void *)v7;
  if (!a4)
  {
    a4 = v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __63__DYFunctionTracer__stringForScalar1DArrayArgument_usingBlock___block_invoke;
    v10[3] = &unk_265336590;
    v10[4] = v7;
    v10[5] = self;
    v10[6] = a3;
  }
  [(DYFunctionTracer *)self _enumerateScalar1DArrayArgumentValues:a3 usingBlock:a4];
  [v8 appendString:@"}"];
  return v8;
}

uint64_t __63__DYFunctionTracer__stringForScalar1DArrayArgument_usingBlock___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(*(id *)(a1 + 40), "_stringWithNumber:argument:", a2, *(void *)(a1 + 48)));
  if ((a3 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    return [v6 appendString:@", "];
  }
  return result;
}

- (id)_newNumberForScalarArgument:(const Argument *)a3
{
  switch(a3->var1)
  {
    case 1u:
      id v4 = objc_alloc(NSNumber);
      uint64_t v5 = *(char *)a3->var0;
      return (id)[v4 initWithChar:v5];
    case 2u:
      id v7 = objc_alloc(NSNumber);
      uint64_t v8 = *(unsigned __int8 *)a3->var0;
      return (id)[v7 initWithUnsignedChar:v8];
    case 3u:
      id v9 = objc_alloc(NSNumber);
      uint64_t v10 = *(__int16 *)a3->var0;
      return (id)[v9 initWithShort:v10];
    case 4u:
      id v11 = objc_alloc(NSNumber);
      uint64_t v12 = *(unsigned __int16 *)a3->var0;
      return (id)[v11 initWithUnsignedShort:v12];
    case 5u:
      id v13 = objc_alloc(NSNumber);
      uint64_t v14 = *(unsigned int *)a3->var0;
      return (id)[v13 initWithInt:v14];
    case 6u:
      id v15 = objc_alloc(NSNumber);
      uint64_t v16 = *(unsigned int *)a3->var0;
      return (id)[v15 initWithUnsignedInt:v16];
    case 7u:
      id v17 = objc_alloc(NSNumber);
      uint64_t v18 = *(void *)a3->var0;
      return (id)[v17 initWithLongLong:v18];
    case 8u:
      id v19 = objc_alloc(NSNumber);
      uint64_t v20 = *(void *)a3->var0;
      return (id)[v19 initWithUnsignedLongLong:v20];
    case 9u:
      id v21 = objc_alloc(NSNumber);
      LODWORD(v22) = *(_DWORD *)a3->var0;
      return (id)[v21 initWithFloat:v22];
    case 0xAu:
      id v23 = objc_alloc(NSNumber);
      double v24 = *(double *)a3->var0;
      return (id)[v23 initWithDouble:v24];
    case 0xBu:
      id v25 = objc_alloc(NSNumber);
      uint64_t v26 = *(void *)a3->var0;
      return (id)[v25 initWithLong:v26];
    case 0xCu:
      id v27 = objc_alloc(NSNumber);
      var0 = *(void **)a3->var0;
      goto LABEL_37;
    case 0xDu:
      id v27 = objc_alloc(NSNumber);
      var0 = a3->var0;
LABEL_37:
      return (id)[v27 initWithUnsignedLong:var0];
    default:
      dy_abort("invalid core type: %u", a3->var1);
  }
}

- (id)_stringForScalarArgument:(const Argument *)a3
{
  id v5 = -[DYFunctionTracer _newNumberForScalarArgument:](self, "_newNumberForScalarArgument:");
  id v6 = [(DYFunctionTracer *)self _stringWithNumber:v5 argument:a3];

  return v6;
}

- (id)typeStringForArgument:(const Argument *)a3
{
  if ((a3->var5 & 0x18) != 0) {
    p_unsigned int var2 = &a3->var2;
  }
  else {
    p_unsigned int var2 = &a3->var1;
  }
  uint64_t v5 = *p_var2;
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v7 = (__CFString *)[(DYFunctionTracerDelegate *)delegate typeStringForArgumentType:v5]) == 0)
  {
    if (v5 >= 0xE) {
      dy_abort("invalid core type: %u", v5);
    }
    id v7 = off_265336658[(int)v5];
  }
  unsigned int var2 = a3->var2;
  if (var2 == 14)
  {
    id v9 = @"char*";
  }
  else if (var2 == 13)
  {
    id v9 = @"void*";
  }
  else
  {
    id v9 = v7;
  }
  if ((a3->var5 & 4) == 0) {
    return v9;
  }

  return (id)[@"const " stringByAppendingString:v9];
}

- (id)valueStringForArgument:(const Argument *)a3
{
  if (a3->var2 == 16)
  {
    var0 = a3->var0;
    return (id)[var0 description];
  }
  else
  {
    unsigned __int16 var5 = a3->var5;
    if ((var5 & 8) != 0)
    {
      if (var5)
      {
        id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __43__DYFunctionTracer_valueStringForArgument___block_invoke;
        v11[3] = &unk_2653365B8;
        v11[4] = self;
        v11[5] = v9;
        [(DYFunctionTracer *)self _enumerateScalar1DArrayArgumentValues:a3 usingBlock:v11];
        uint64_t v10 = (void *)[NSString stringWithFormat:@"{%@}", objc_msgSend(v9, "componentsJoinedByString:", @", ")];

        return v10;
      }
      else
      {
        uint64_t v8 = a3->var0;
        return [(DYFunctionTracer *)self rewriteURL:v8];
      }
    }
    else if (var5)
    {
      return -[DYFunctionTracer _stringForScalar1DArrayArgument:usingBlock:](self, "_stringForScalar1DArrayArgument:usingBlock:");
    }
    else
    {
      if ((var5 & 2) != 0) {
        dy_abort("FIXME: 2D array of scalars are not implemented in the tracer", a2);
      }
      return -[DYFunctionTracer _stringForScalarArgument:](self, "_stringForScalarArgument:");
    }
  }
}

uint64_t __43__DYFunctionTracer_valueStringForArgument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "rewriteURL:", objc_msgSend(a2, "unsignedLongValue"));
  id v4 = *(void **)(a1 + 40);

  return [v4 addObject:v3];
}

- (id)valueForArgument:(const Argument *)a3
{
  unsigned int var5 = a3->var5;
  unsigned int var1 = a3->var1;
  if (a3->var5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = var1 == 13;
  }
  if (!v7)
  {
    id v13 = [(DYFunctionTracer *)self _newNumberForScalarArgument:a3];
    return v13;
  }
  if (var5)
  {
    if (a3->var0)
    {
      uint64_t v14 = [MEMORY[0x263EFF980] array];
      id v15 = (void *)v14;
      if (a3->var2 == 14 || (a3->var5 & 0x18) != 0)
      {
        uint64_t v23 = MEMORY[0x263EF8330];
        uint64_t v24 = 3221225472;
        id v25 = __37__DYFunctionTracer_valueForArgument___block_invoke;
        uint64_t v26 = &unk_2653365E0;
        uint64_t v27 = v14;
        uint64_t v16 = &v23;
      }
      else
      {
        uint64_t v18 = MEMORY[0x263EF8330];
        uint64_t v19 = 3221225472;
        uint64_t v20 = __37__DYFunctionTracer_valueForArgument___block_invoke_2;
        id v21 = &unk_2653365E0;
        uint64_t v22 = v14;
        uint64_t v16 = &v18;
      }
      -[DYFunctionTracer _enumerateScalar1DArrayArgumentValues:usingBlock:](self, "_enumerateScalar1DArrayArgumentValues:usingBlock:", a3, v16, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
      return v15;
    }
  }
  else
  {
    BOOL v7 = var1 == 13;
    int v8 = (var5 >> 1) & 1;
    if (v7) {
      int v8 = 1;
    }
    if (v8 != 1 || a3->var0 != 0)
    {
      if (a3->var5 || a3->var2 != 14)
      {
        return -[DYFunctionTracer valueStringForArgument:](self, "valueStringForArgument:");
      }
      else
      {
        uint64_t v10 = objc_msgSend(-[DYFunctionTracer _newNumberForScalarArgument:](self, "_newNumberForScalarArgument:", a3), "unsignedLongValue");
        id v11 = NSString;
        return (id)[v11 stringWithUTF8String:v10];
      }
    }
  }
  id v17 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v17 null];
}

uint64_t __37__DYFunctionTracer_valueForArgument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedLongValue];
  id v4 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v5 = [NSString stringWithCString:v3 encoding:1];
  }
  else {
    uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  }

  return [v4 addObject:v5];
}

uint64_t __37__DYFunctionTracer_valueForArgument___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)traceFunction:(const Function *)a3 error:(id *)a4
{
  return [(DYFunctionTracer *)self traceFunction:a3 returnVariable:0 error:a4];
}

- (id)traceFunction:(const Function *)a3 returnVariable:(id)a4 error:(id *)a5
{
  id v5 = [(DYFunctionTracer *)self traceFunctionAsLines:a3 returnVariable:a4 error:a5];

  return (id)[v5 componentsJoinedByString:@"\n"];
}

- (id)traceFunctionAsLines:(const Function *)a3 returnVariable:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v51 = *(_DWORD *)a3;
  [(DYFunctionTracer *)self _setCurrentReceiver:a3];
  if ((self->_compilable || !self->_emitHiddenReceiverArgument)
    && [(DYFunctionTracer *)self _skipFirstArgumentForFunction:a3])
  {
    id v10 = [(DYFunctionTracer *)self rewriteArgument:(char *)a3 + 48];
    if (v10) {
      [v9 addObject:v10];
    }
    id v11 = (char *)a3 + 72;
  }
  else
  {
    id v11 = (char *)a3 + 48;
  }
  v53 = (char *)a3 + 24 * *((unsigned __int16 *)a3 + 5) + 48;
  v54 = a3;
  if (v11 != v53)
  {
    v49 = (int **)((char *)a3 + 72);
    while (1)
    {
      id v12 = [(DYFunctionTracer *)self rewriteArgument:v11];
      id v13 = [(DYFunctionTracer *)self getCastForArgument:v11 inFunction:a3];
      if (v12) {
        goto LABEL_11;
      }
      if (*((_DWORD *)v11 + 3) == 16)
      {
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)v11, "description"));
      }
      else
      {
        if (v51 == -12272 && v11 == (char *)v49)
        {
          DYInternalDataTypeAsString(**v49, &__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          objc_msgSend(v9, "addObject:", objc_msgSend(NSString, "stringWithCString:encoding:", p_p, 1));
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          goto LABEL_14;
        }
        __int16 v14 = *((_WORD *)v11 + 11);
        if ((v14 & 8) == 0)
        {
          if (v14)
          {
            if (self->_compilable)
            {
              id v20 = [(DYFunctionTracer *)self nextArrayVariable];
              delegate = self->_delegate;
              if ((objc_opt_respondsToSelector() & 1) != 0
                && (uint64_t v22 = [(DYFunctionTracerDelegate *)delegate generateArrayVariable:v20 ForArgument:v11]) != 0)
              {
                [v8 addObject:v22];
              }
              else
              {
                objc_msgSend(v8, "addObject:", objc_msgSend(NSString, "stringWithFormat:", @"%@ %@[%u] = %@;",
                    [(DYFunctionTracer *)self typeStringForArgument:v11],
                    v20,
                    *((unsigned __int16 *)v11 + 10),
                    [(DYFunctionTracer *)self _stringForScalar1DArrayArgument:v11 usingBlock:0]));
              }
            }
            else
            {
              id v20 = [(DYFunctionTracer *)self _stringForScalar1DArrayArgument:v11 usingBlock:0];
            }
            [v9 addObject:v20];
          }
          else
          {
            if ((v14 & 2) != 0)
            {

              dy_abort("FIXME: 2D array of scalars are not implemented in the tracer");
            }
            objc_msgSend(v9, "addObject:", -[DYFunctionTracer _stringForScalarArgument:](self, "_stringForScalarArgument:", v11));
          }
          goto LABEL_14;
        }
        id v15 = [(DYFunctionTracer *)self typeStringForArgument:v11];
        if (*((_WORD *)v11 + 11))
        {
          uint64_t v23 = objc_opt_new();
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __62__DYFunctionTracer_traceFunctionAsLines_returnVariable_error___block_invoke;
          v64[3] = &unk_265336608;
          v64[4] = self;
          v64[5] = v8;
          v64[6] = v15;
          v64[7] = v50;
          v64[8] = v23;
          [(DYFunctionTracer *)self _enumerateScalar1DArrayArgumentValues:v11 usingBlock:v64];
          if (self->_compilable)
          {
            id v24 = [(DYFunctionTracer *)self nextArrayVariable];
            objc_msgSend(v8, "addObject:", objc_msgSend(NSString, "stringWithFormat:", @"%@* %@[%u] = {%@};",
                v15,
                v24,
                *((unsigned __int16 *)v11 + 10),
                [v23 componentsJoinedByString:@", "]));
          }
          else
          {
            id v24 = (id)[NSString stringWithFormat:@"{%@}", objc_msgSend(v23, "componentsJoinedByString:", @", ")];
          }
          [v9 addObject:v24];

          goto LABEL_14;
        }
        id v16 = [(DYFunctionTracer *)self rewriteURL:*(void *)v11];
        if (v16 != [(DYFunctionTracer *)self nilString])
        {
          if (self->_compilable)
          {
            id v17 = NSString;
            uint64_t buffer_counter = self->buffer_counter;
            self->uint64_t buffer_counter = buffer_counter + 1;
            id v12 = (id)objc_msgSend(v17, "stringWithFormat:", @"buffer%u", buffer_counter);
            if (self->_emitDataIndices)
            {
              id v19 = [(DYFunctionTracer *)self getIndexFromURL:v16];
              objc_msgSend(v8, "addObject:", objc_msgSend(NSString, "stringWithFormat:", @"%@* %@ = (%@*)DyGen::get_preloaded_data(%@);//d",
                  v15,
                  v12,
                  v15,
                  v19));
            }
            else
            {
              objc_msgSend(v8, "addObject:", -[DYFunctionTracer loadStringForURL:variableName:bufferType:](self, "loadStringForURL:variableName:bufferType:", v16, v12, v15));
              objc_msgSend(v50, "addObject:", -[DYFunctionTracer unloadStringForURL:](self, "unloadStringForURL:", v16));
            }
          }
          else
          {
            id v12 = v16;
          }
LABEL_11:
          [v9 addObject:v12];
          goto LABEL_14;
        }
        objc_msgSend(v9, "addObject:", -[DYFunctionTracer nilString](self, "nilString"));
      }
LABEL_14:
      if (v13
        && (objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1), "isEqualToString:", -[DYFunctionTracer nilString](self, "nilString")) & 1) == 0)
      {
        objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend(v13, "stringByAppendingString:", objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1)), objc_msgSend(v9, "count") - 1);
      }
      objc_msgSend(v9, "setObject:atIndexedSubscript:", -[DYFunctionTracer createArgument:forFunction:withValue:](self, "createArgument:forFunction:withValue:", v11, a3, objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1)), objc_msgSend(v9, "count") - 1);
      v11 += 24;
      if (v11 == v53)
      {
        id v11 = v53;
        break;
      }
    }
  }
  uint64_t v26 = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v27 = (id)[(DYFunctionTracerDelegate *)v26 constructTraceLinesWithFunction:a3 arguments:v9]) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (id v28 = (id)-[DYFunctionTracerDelegate constructTraceLineWithFunction:arguments:](v26, "constructTraceLineWithFunction:arguments:", a3, v9)) == 0|| (v27 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1], objc_msgSend(v27, "addObject:", v28), v28, !v27))
    {
      v29 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:200];
      if (self->_prependReceiverEffective) {
        [(DYFunctionTracer *)self _prependReceiver:v29 function:a3];
      }
      v63 = v11;
      [(DYFunctionTracer *)self _appendTraceLine:v29 withFunction:a3 iterArgument:&v63 argumentStrings:v9 returnVariable:a4];
      if (self->_compilable) {
        [v29 appendString:@";"];
      }
      id v27 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      [v27 addObject:v29];
    }
  }
  if (self->_emitFunctionComments)
  {
    int v30 = *((_DWORD *)a3 + 1);
    if ((v30 & 0x40) != 0)
    {
      v31 = @" /* internal to GPUTools */";
    }
    else
    {
      if ((v30 & 4) == 0)
      {
        if ((v30 & 0x200) == 0)
        {
          if ((v30 & 0x80000) == 0)
          {
            if ((v30 & 0x40000) == 0) {
              goto LABEL_86;
            }
            goto LABEL_81;
          }
          goto LABEL_76;
        }
        goto LABEL_71;
      }
      v31 = @" /* inserted by GPUTools */";
    }
    unint64_t v32 = (void *)[MEMORY[0x263F089D8] stringWithFormat:v31];
    id v33 = v32;
    double v34 = a3;
    if ((*((unsigned char *)a3 + 5) & 2) == 0) {
      goto LABEL_73;
    }
    if (v32)
    {
      [v32 appendString:@" /* state mirror skip */"];
LABEL_72:
      double v34 = a3;
LABEL_73:
      if ((*((unsigned char *)v34 + 6) & 8) == 0)
      {
LABEL_78:
        if ((*((unsigned char *)v34 + 6) & 4) == 0) {
          goto LABEL_82;
        }
        if (v33)
        {
          [v33 appendString:@" /* frame boundary */"];
LABEL_83:
          if ([v27 count])
          {
            unint64_t v35 = 0;
            unsigned int v36 = 1;
            do
            {
              objc_msgSend(v27, "replaceObjectAtIndex:withObject:", v35, objc_msgSend((id)objc_msgSend(v27, "objectAtIndex:", v35), "stringByAppendingString:", v33));
              unint64_t v35 = v36++;
            }
            while ([v27 count] > v35);
          }
          goto LABEL_86;
        }
LABEL_81:
        id v33 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@" /* frame boundary */"];
LABEL_82:
        if (!v33) {
          goto LABEL_86;
        }
        goto LABEL_83;
      }
      if (v33)
      {
        [v33 appendString:@" /* apple internal resource */"];
LABEL_77:
        double v34 = a3;
        goto LABEL_78;
      }
LABEL_76:
      id v33 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@" /* apple internal resource */"];
      goto LABEL_77;
    }
LABEL_71:
    id v33 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@" /* state mirror skip */"];
    goto LABEL_72;
  }
LABEL_86:
  [v8 addObjectsFromArray:v27];

  [v8 addObjectsFromArray:v50];
  v37 = v54;
  if ((*((unsigned char *)v54 + 4) & 2) != 0 && self->_emitFunctionComments)
  {
    unint64_t v38 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v39 = [v8 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v60 != v40) {
            objc_enumerationMutation(v8);
          }
          [v38 addObject:objc_msgSend(@"//", "stringByAppendingString:", *(void *)(*((void *)&v59 + 1) + 8 * i))];
        }
        uint64_t v39 = [v8 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v39);
    }

    v37 = v54;
  }
  else
  {
    unint64_t v38 = v8;
  }
  if (self->_emitErrors)
  {
    [(DYFunctionTracer *)self _emitErrors:v38 function:v37];
    v37 = v54;
  }
  if (self->_emitAssociatedFunctions && *((void *)v37 + 65))
  {
    self->_emitAssociatedFunctions = 0;
    [v38 addObject:@"{"];
    uint64_t v42 = *((void *)v54 + 65);
    if (v42)
    {
      while (1)
      {
        id v43 = [(DYFunctionTracer *)self traceFunctionAsLines:v42 returnVariable:0 error:a5];
        v44 = v43;
        if (!v43) {
          break;
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v45 = [v43 countByEnumeratingWithState:&v55 objects:v66 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v56 != v46) {
                objc_enumerationMutation(v44);
              }
              [v38 addObject:objc_msgSend(@"    ", "stringByAppendingString:", *(void *)(*((void *)&v55 + 1) + 8 * j))];
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v55 objects:v66 count:16];
          }
          while (v45);
        }
        uint64_t v42 = *(void *)(v42 + 520);
        if (!v42) {
          goto LABEL_113;
        }
      }

      unint64_t v38 = 0;
    }
LABEL_113:
    [v38 addObject:@"}"];
    self->_emitAssociatedFunctions = 1;
  }

  return v38;
}

uint64_t __62__DYFunctionTracer_traceFunctionAsLines_returnVariable_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "rewriteURL:", objc_msgSend(a2, "unsignedLongValue"));
  if (v3 == [*(id *)(a1 + 32) nilString])
  {
    id v13 = *(void **)(a1 + 64);
    uint64_t v14 = [*(id *)(a1 + 32) nilString];
    id v15 = v13;
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 56))
    {
      id v5 = NSString;
      uint64_t v6 = *(unsigned int *)(v4 + 28);
      *(_DWORD *)(v4 + 28) = v6 + 1;
      uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"buffer%u", v6);
      id v8 = *(unsigned char **)(a1 + 32);
      if (v8[38])
      {
        uint64_t v9 = [v8 getIndexFromURL:v3];
        id v10 = *(void **)(a1 + 40);
        uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%@* %@ = (%@*)DyGen::get_preloaded_data(%@);//c",
                *(void *)(a1 + 48),
                v7,
                *(void *)(a1 + 48),
                v9);
        id v12 = v10;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(v8, "loadStringForURL:variableName:bufferType:", v3, v7, *(void *)(a1 + 48)));
        id v16 = *(void **)(a1 + 56);
        uint64_t v11 = [*(id *)(a1 + 32) unloadStringForURL:v3];
        id v12 = v16;
      }
      [v12 addObject:v11];
    }
    else
    {
      uint64_t v7 = v3;
    }
    id v15 = *(void **)(a1 + 64);
    uint64_t v14 = v7;
  }

  return [v15 addObject:v14];
}

- (id)loadStringForURL:(id)a3 variableName:(id)a4 bufferType:(id)a5
{
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%@* %@ = (%@*)DyGen::load_url(\"%@\");",
  }
                 a5,
                 a4,
                 a5,
                 a3);

  return (id)[(DYFunctionTracerDelegate *)delegate loadStringForURL:a3 variableName:a4 bufferType:a5];
}

- (id)unloadStringForURL:(id)a3
{
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return (id)[NSString stringWithFormat:@"DyGen::unload_url(\"%@\"", a3];
  }

  return (id)[(DYFunctionTracerDelegate *)delegate unloadStringForURL:a3];
}

- (id)rewriteVariable:(const char *)a3
{
  delegate = self->_delegate;
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = (void *)[(DYFunctionTracerDelegate *)delegate rewriteVariable:a3 receiver:self->_currentReceiverID];
  }
  else {
    uint64_t v6 = 0;
  }
  if ([v6 length]) {
    return v6;
  }
  if (self->_emitVariables || self->_compilable)
  {
    id v8 = NSString;
    return (id)[v8 stringWithUTF8String:a3];
  }
  else
  {
    uint64_t v9 = [(DYFunctionTracer *)self _objectNameFromVariable:a3];
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", v9);
  }
}

- (id)rewriteURL:(const char *)a3
{
  if (a3 && *a3)
  {
    delegate = self->_delegate;
    if (objc_opt_respondsToSelector())
    {
      id result = (id)[(DYFunctionTracerDelegate *)delegate rewriteURL:a3];
      if (result) {
        return result;
      }
    }
  }
  else
  {
    id result = [(DYFunctionTracer *)self nilString];
    if (result) {
      return result;
    }
  }
  uint64_t v6 = NSString;

  return (id)[v6 stringWithCString:a3 encoding:1];
}

- (id)rewriteReceiver:(unint64_t)a3
{
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id result = (id)[(DYFunctionTracerDelegate *)delegate rewriteReceiver:a3]) == 0)
  {
    if (self->_compilable)
    {
      return [(DYFunctionTracer *)self variableForReceiverID:a3];
    }
    else
    {
      return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%llx", a3);
    }
  }
  return result;
}

- (id)createArgument:(const Argument *)a3 forFunction:(const Function *)a4 withValue:(id)a5
{
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a5;
  }

  return (id)[(DYFunctionTracerDelegate *)delegate createArgument:a3 forFunction:a4 withValue:a5];
}

- (id)getCastForArgument:(const Argument *)a3 inFunction:(const Function *)a4
{
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (id)[(DYFunctionTracerDelegate *)delegate getCastForArgument:a3 inFunction:a4];
}

- (id)rewriteArgument:(const Argument *)a3
{
  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (id)[(DYFunctionTracerDelegate *)delegate rewriteArgument:a3];
}

- (id)nextArrayVariable
{
  v2 = NSString;
  uint64_t array_counter = self->array_counter;
  self->uint64_t array_counter = array_counter + 1;
  return (id)objc_msgSend(v2, "stringWithFormat:", @"array%u", array_counter);
}

- (id)getIndexFromURL:(id)a3
{
  id v5 = (void *)-[NSMutableDictionary objectForKey:](self->urlIndices, "objectForKey:");
  if (!v5)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[NSMutableDictionary count](self->urlIndices, "count"));
    [(NSMutableDictionary *)self->urlIndices setObject:v5 forKey:a3];
  }
  return v5;
}

- (BOOL)_skipFirstArgumentForFunction:(const Function *)a3
{
  return *(_DWORD *)a3 == -12272;
}

- (void)_appendReturnValueToTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:
{
  if (*((_DWORD *)a4 + 8))
  {
    id v12 = (char *)a4 + 24;
    delegate = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (id v14 = (id)[(DYFunctionTracerDelegate *)delegate rewriteArgument:v12]) == 0)
    {
      id v14 = a7;
      if (!a7)
      {
        if (*((_DWORD *)a4 + 9) == 16)
        {
          id v15 = (id)objc_msgSend(*(id *)a5.var0->var0, "description", 0);
        }
        else
        {
          if (self->_compilable && (*((_WORD *)a4 + 23) & 0x10) == 0) {
            return;
          }
          id v15 = [(DYFunctionTracer *)self valueStringForArgument:v12];
        }
        id v14 = v15;
        if (!v15) {
          return;
        }
      }
    }
    [a3 appendString:v14];
    if (self->_compact) {
      id v16 = @"=";
    }
    else {
      id v16 = @" = ";
    }
    [a3 appendString:v16];
  }
}

- (void)_appendTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  var0 = a5.var0->var0;
  [(DYFunctionTracer *)self _appendReturnValueToTraceLine:a3 withFunction:a4 iterArgument:&var0 argumentStrings:a6 returnVariable:a7];
  uint64_t v11 = (char *)dy_fenum_to_function_name_nsstring(*(_DWORD *)a4, *((_DWORD *)a4 + 1), self->_compactEffective);
  if ([v11 containsString:@"%@"]
    && [v11 containsString:@":"]
    && [v11 containsString:@" "])
  {
    uint64_t v12 = [v11 length];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v13 = [a6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      uint64_t v22 = *(void *)v24;
LABEL_6:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v22) {
          objc_enumerationMutation(a6);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
        uint64_t v18 = [v11 rangeOfString:@"%@", 2, v15, v12 options range];
        if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v20 = v18;
        uint64_t v21 = v19;
        objc_msgSend(a3, "appendString:", objc_msgSend(v11, "substringWithRange:", v15, v18 - v15));
        [a3 appendString:v17];
        uint64_t v15 = v20 + v21;
        uint64_t v12 = [v11 length] - (v20 + v21);
        if (v14 == ++v16)
        {
          uint64_t v14 = [a6 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v14) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    objc_msgSend(a3, "appendString:", objc_msgSend(v11, "substringWithRange:", v15, v12));
  }
  else
  {
    [a3 appendFormat:@"%@(%@)", v11, objc_msgSend(a6, "componentsJoinedByString:", @", ")];
  }
}

- (unsigned)_objectNameFromVariable:(const char *)a3
{
  return 0;
}

- (id)variableForReceiverID:(unint64_t)a3
{
  return 0;
}

- (id)variableForReceiverIDNumber:(id)a3
{
  return 0;
}

- (BOOL)compilable
{
  return self->_compilable;
}

- (BOOL)emitFunctionComments
{
  return self->_emitFunctionComments;
}

- (void)setEmitFunctionComments:(BOOL)a3
{
  self->_emitFunctionComments = a3;
}

- (BOOL)emitHiddenReceiverArgument
{
  return self->_emitHiddenReceiverArgument;
}

- (void)setEmitHiddenReceiverArgument:(BOOL)a3
{
  self->_emitHiddenReceiverArgument = a3;
}

- (BOOL)prependReceiverArgument
{
  return self->_prependReceiverArgument;
}

- (BOOL)useHexadecimalFloatFormat
{
  return self->_useHexadecimalFloatFormat;
}

- (void)setUseHexadecimalFloatFormat:(BOOL)a3
{
  self->_useHexadecimalFloatFormat = a3;
}

- (BOOL)compactFloats
{
  return self->_compactFloats;
}

- (void)setCompactFloats:(BOOL)a3
{
  self->_compactFloats = a3;
}

- (BOOL)compact
{
  return self->_compact;
}

- (BOOL)emitDataIndices
{
  return self->_emitDataIndices;
}

- (void)setEmitDataIndices:(BOOL)a3
{
  self->_emitDataIndices = a3;
}

- (BOOL)emitTypeSuffixes
{
  return self->_emitTypeSuffixes;
}

- (void)setEmitTypeSuffixes:(BOOL)a3
{
  self->_emitTypeSuffixes = a3;
}

- (BOOL)emitAssociatedFunctions
{
  return self->_emitAssociatedFunctions;
}

- (void)setEmitAssociatedFunctions:(BOOL)a3
{
  self->_emitAssociatedFunctions = a3;
}

- (BOOL)emitVariables
{
  return self->_emitVariables;
}

- (void)setEmitVariables:(BOOL)a3
{
  self->_emitVariables = a3;
}

- (BOOL)emitErrors
{
  return self->_emitErrors;
}

- (void)setEmitErrors:(BOOL)a3
{
  self->_emitErrors = a3;
}

- (DYFunctionTracerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (DYFunctionTracerDelegate *)a3;
}

- (NSString)nilString
{
  return self->_nilString;
}

- (NSMutableDictionary)urlIndices
{
  return self->urlIndices;
}

@end