@interface DYGLFunctionTracer
- (BOOL)_skipFirstArgumentForFunction:(const Function *)a3;
- (DYGLFunctionTracer)init;
- (id).cxx_construct;
- (id)_stringForScalar1DArrayArgument:(const Argument *)a3 usingBlock:(id)a4;
- (id)_stringWithNumber:(id)a3 argument:(const Argument *)a4;
- (id)typeStringForArgument:(const Argument *)a3;
- (id)variableForGLSyncID:(unint64_t)a3;
- (id)variableForGLSyncIDNumber:(id)a3;
- (id)variableForPBufferID:(unint64_t)a3;
- (id)variableForPBufferIDNumber:(id)a3;
- (id)variableForPixelFormatID:(unint64_t)a3;
- (id)variableForPixelFormatIDNumber:(id)a3;
- (id)variableForReceiverID:(unint64_t)a3;
- (id)variableForReceiverIDNumber:(id)a3;
- (unsigned)_objectNameFromVariable:(const char *)a3;
- (void)_appendTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:;
- (void)_emitErrors:(id)a3 function:(const Function *)a4;
- (void)_prependReceiver:(id)a3 function:(const Function *)a4;
- (void)_setCurrentReceiver:(const Function *)a3;
@end

@implementation DYGLFunctionTracer

- (DYGLFunctionTracer)init
{
  v3.receiver = self;
  v3.super_class = (Class)DYGLFunctionTracer;
  result = [(DYFunctionTracer *)&v3 init];
  if (result) {
    *(Class *)((char *)&result->super.super.isa + (int)*MEMORY[0x263F3FA08]) = (Class)@"NULL";
  }
  return result;
}

- (id)_stringWithNumber:(id)a3 argument:(const Argument *)a4
{
  switch(a4->var2)
  {
    case 0xFu:
      uint64_t v16 = [a3 unsignedLongLongValue];
      if (!v16) {
        goto LABEL_49;
      }
      return [(DYFunctionTracer *)self rewriteReceiver:v16];
    case 0x11u:
      int v17 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
      int v18 = [a3 unsignedIntValue];
      if (v17)
      {
        v19 = @"True";
        v20 = @"False";
      }
      else
      {
        v19 = @"GL_TRUE";
        v20 = @"GL_FALSE";
      }
      if (v18) {
        return v19;
      }
      else {
        return v20;
      }
    case 0x12u:
    case 0x1Fu:
      uint64_t v7 = [a3 unsignedIntValue];
      goto LABEL_3;
    case 0x14u:
      unsigned int v9 = [a3 unsignedIntValue];
      v10 = dy_string_from_attachment_mask(v9, *((unsigned char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]), 0, 0);
      goto LABEL_23;
    case 0x15u:
      unsigned int v21 = [a3 unsignedIntValue];
      v10 = dy_string_from_attrib_mask(v21, *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]), 0, 0);
      goto LABEL_23;
    case 0x16u:
      unsigned int v22 = [a3 unsignedIntValue];
      v10 = dy_string_from_client_attrib_mask(v22, *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]), 0, 0);
      goto LABEL_23;
    case 0x17u:
      unsigned int v23 = [a3 unsignedIntValue];
      v10 = dy_string_from_map_buffer_range_access(v23, *((unsigned char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]), 0, 0);
      goto LABEL_23;
    case 0x18u:
      unsigned int v24 = [a3 unsignedIntValue];
      v10 = dy_string_from_pipeline_stages(v24, *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]), 0, 0);
      goto LABEL_23;
    case 0x19u:
      unsigned int v25 = [a3 unsignedIntValue];
      v10 = dy_string_from_sync_flags(v25, *((unsigned char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]), 0, 0);
LABEL_23:
      v26 = (void *)[[NSString alloc] initWithBytesNoCopy:v10 length:strlen(v10) encoding:1 freeWhenDone:1];
      return v26;
    case 0x1Au:
      if ([a3 unsignedLongLongValue] == -1)
      {
        int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
        v14 = @"TimeoutIgnored";
        v15 = @"GL_TIMEOUT_IGNORED";
        goto LABEL_66;
      }
      uint64_t var1 = a4->var1;
      return [(DYFunctionTracer *)self _stringWithIntegerNumber:a3 coreType:var1];
    case 0x1Bu:
      uint64_t v7 = [a3 unsignedIntValue];
      if (v7 == 1)
      {
        int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
        v14 = @"Lines";
        v15 = @"GL_LINES";
      }
      else
      {
        if (v7) {
          goto LABEL_3;
        }
        int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
        v14 = @"Points";
        v15 = @"GL_POINTS";
      }
      goto LABEL_66;
    case 0x1Cu:
      uint64_t v7 = [a3 unsignedIntValue];
      if (v7 == 1)
      {
        int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
        v14 = @"One";
        v15 = @"GL_ONE";
      }
      else
      {
        if (v7)
        {
LABEL_3:
          int v8 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
          goto LABEL_34;
        }
        int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
        v14 = @"Zero";
        v15 = @"GL_ZERO";
      }
      goto LABEL_66;
    case 0x1Du:
      uint64_t v7 = [a3 unsignedIntValue];
      int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
      if (v7) {
        goto LABEL_33;
      }
      v14 = @"None";
      v15 = @"GL_NONE";
      goto LABEL_66;
    case 0x1Eu:
      uint64_t v7 = [a3 unsignedIntValue];
      int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
      if (!v7)
      {
        v14 = @"NoError";
        v15 = @"GL_NO_ERROR";
        goto LABEL_66;
      }
LABEL_33:
      int v8 = v13 != 0;
LABEL_34:
      id result = dy_nsstring_from_enum_ex(v7, v8);
      break;
    case 0x20u:
      int v27 = [a3 unsignedIntValue];
      if (v27 == 33984)
      {
        int v13 = *((unsigned __int8 *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0]);
        v14 = @"Texture0";
        v15 = @"GL_TEXTURE0";
LABEL_66:
        if (v13) {
          id result = v14;
        }
        else {
          id result = v15;
        }
      }
      else
      {
        if (*((unsigned char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F0])) {
          v31 = @"Texture%d";
        }
        else {
          v31 = @"GL_TEXTURE0+%d";
        }
        id result = (id)objc_msgSend(NSString, "stringWithFormat:", v31, (v27 - 33984));
      }
      break;
    case 0x21u:
      uint64_t v28 = [a3 unsignedLongLongValue];
      if (!v28) {
        goto LABEL_49;
      }
      uint64_t v29 = v28;
      if (!*((unsigned char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F8])) {
        return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%016llx", v29);
      }
      return [(DYGLFunctionTracer *)self variableForGLSyncID:v28];
    case 0x2Fu:
      uint64_t v30 = [a3 unsignedLongLongValue];
      if (v30)
      {
        uint64_t v29 = v30;
        if (*((unsigned char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9F8]))
        {
          return [(DYGLFunctionTracer *)self variableForPixelFormatID:v30];
        }
        else
        {
          return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%016llx", v29);
        }
      }
      else
      {
LABEL_49:
        return [(DYFunctionTracer *)self nilString];
      }
    default:
      v32.receiver = self;
      v32.super_class = (Class)DYGLFunctionTracer;
      return [(DYFunctionTracer *)&v32 _stringWithNumber:a3 argument:a4];
  }
  return result;
}

- (id)_stringForScalar1DArrayArgument:(const Argument *)a3 usingBlock:(id)a4
{
  if (a3->var0)
  {
    if (a3->var4)
    {
      v5.receiver = self;
      v5.super_class = (Class)DYGLFunctionTracer;
      return -[DYFunctionTracer _stringForScalar1DArrayArgument:usingBlock:](&v5, sel__stringForScalar1DArrayArgument_usingBlock_);
    }
    else
    {
      return @"{}";
    }
  }
  else
  {
    return [(DYFunctionTracer *)self nilString];
  }
}

- (id)typeStringForArgument:(const Argument *)a3
{
  signed int var2 = a3->var2;
  if (var2 > 32)
  {
    if (var2 != 33)
    {
      if (var2 == 45) {
        return @"CGLPixelFormatAttribute";
      }
      goto LABEL_8;
    }
    return @"GLsync";
  }
  else
  {
    if (var2 != 17)
    {
      if (var2 == 18) {
        return @"GLenum";
      }
LABEL_8:
      v5.receiver = self;
      v5.super_class = (Class)DYGLFunctionTracer;
      return -[DYFunctionTracer typeStringForArgument:](&v5, sel_typeStringForArgument_);
    }
    return @"GLBOOLean";
  }
}

- (void)_setCurrentReceiver:(const Function *)a3
{
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3FA00]) = (Class)*((void *)a3 + 2);
}

- (void)_prependReceiver:(id)a3 function:(const Function *)a4
{
  v5[0] = (char *)a4 + 16;
  v5[1] = 0xF00000008;
  v5[2] = 0x100000008;
  objc_msgSend(a3, "appendString:", -[DYFunctionTracer valueStringForArgument:](self, "valueStringForArgument:", v5));
  [a3 appendString:@" "];
}

- (BOOL)_skipFirstArgumentForFunction:(const Function *)a3
{
  if (*(_DWORD *)a3 < 0x418u) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)DYGLFunctionTracer;
  return -[DYFunctionTracer _skipFirstArgumentForFunction:](&v4, sel__skipFirstArgumentForFunction_);
}

- (void)_appendTraceLine:(id)a3 withFunction:(const Function *)a4 iterArgument:(array_iterator<const GPUTools:(id)a6 :(id)a7 FD::Argument>)a5 argumentStrings:returnVariable:
{
  int v13 = *(_DWORD *)a4;
  if (*(_DWORD *)a4 == 888) {
    goto LABEL_4;
  }
  if (v13 != 123)
  {
    if (v13 != 116)
    {
LABEL_5:
      BOOL v14 = 0;
      goto LABEL_6;
    }
LABEL_4:
    LODWORD(v22) = GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)((char *)a4 + 24));
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t)&self->_programNames, (unsigned int *)&v22, &v22);
    goto LABEL_5;
  }
  LODWORD(v22) = GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)((char *)a4 + 72));
  v15 = std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::find<unsigned int>(&self->_programNames.__table_.__bucket_list_.__ptr_.__value_, (unsigned int *)&v22);
  BOOL v14 = v15 != 0;
  if (v15)
  {
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::erase(&self->_programNames.__table_.__bucket_list_.__ptr_.__value_, v15);
    int v13 = 834;
  }
  else
  {
    int v13 = 123;
  }
LABEL_6:
  switch(v13)
  {
    case -8192:
      [a3 appendFormat:@"[%@ initWithAPI:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v18, v19];
      break;
    case -8191:
      [a3 appendFormat:@"[%@ initWithAPI:%@ sharegroup:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v19];
      break;
    case -8190:
      [a3 appendFormat:@"[%@ presentRenderbuffer:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v18, v19];
      break;
    case -8189:
      [a3 appendFormat:@"[%@ renderbufferStorage:%@ fromDrawable:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v19];
      break;
    case -8188:
      [a3 appendFormat:@"[%@ initWithAPI:%@ properties:%@ /* sharegroup:%@ */]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), objc_msgSend(a6, "objectAtIndex:", 3)];
      break;
    case -8185:
      [a3 appendFormat:@"[%@ dealloc]", objc_msgSend(a6, "objectAtIndex:", 0), v17, v18, v19];
      break;
    case -8184:
      [a3 appendFormat:@"[EAGLContext setCurrentContext:%@]", objc_msgSend(a6, "objectAtIndex:", 0), v17, v18, v19];
      break;
    case -8183:
      [a3 appendFormat:@"[%@ setTransform:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v18, v19];
      break;
    case -8182:
      [a3 appendFormat:@"[%@ setPosition:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v18, v19];
      break;
    case -8181:
      [a3 appendFormat:@"[%@ setAnchorPoint:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), v18, v19];
      break;
    case -8179:
      [a3 appendFormat:@"[%@ presentRenderbuffer:%@ atTime:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v19];
      break;
    case -8178:
      [a3 appendFormat:@"[%@ presentRenderbuffer:%@ afterMinimumDuration:%@]", objc_msgSend(a6, "objectAtIndex:", 0), objc_msgSend(a6, "objectAtIndex:", 1), objc_msgSend(a6, "objectAtIndex:", 2), v19];
      break;
    default:
      uint64_t v22 = 0;
      if (v14) {
        operator new();
      }
      var0 = a5.var0->var0;
      v20.receiver = self;
      v20.super_class = (Class)DYGLFunctionTracer;
      unsigned int v21 = var0;
      [(DYFunctionTracer *)&v20 _appendTraceLine:a3 withFunction:a4 iterArgument:&v21 argumentStrings:a6 returnVariable:a7];
      break;
  }
}

- (void)_emitErrors:(id)a3 function:(const Function *)a4
{
  if (*((_WORD *)a4 + 241))
  {
    uint64_t v5 = [NSString stringWithFormat:@"    ERROR: %@ (0x%04x)", objc_msgSend(NSString, "stringWithUTF8String:", dy_string_from_enum(*((unsigned __int16 *)a4 + 241))), *((unsigned __int16 *)a4 + 241)];
    [a3 addObject:v5];
  }
}

- (unsigned)_objectNameFromVariable:(const char *)a3
{
  return MEMORY[0x270F2DCF8](a3, a2);
}

- (id)variableForReceiverID:(unint64_t)a3
{
  if (a3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"ctx_%llx", a3);
  }
  return [(DYFunctionTracer *)self nilString];
}

- (id)variableForReceiverIDNumber:(id)a3
{
  uint64_t v4 = [a3 unsignedLongLongValue];
  return [(DYGLFunctionTracer *)self variableForReceiverID:v4];
}

- (id)variableForGLSyncID:(unint64_t)a3
{
  if (a3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"sync_%llx", a3);
  }
  return [(DYFunctionTracer *)self nilString];
}

- (id)variableForGLSyncIDNumber:(id)a3
{
  uint64_t v4 = [a3 unsignedLongLongValue];
  return [(DYGLFunctionTracer *)self variableForGLSyncID:v4];
}

- (id)variableForPBufferID:(unint64_t)a3
{
  if (a3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"pbuffer_%llx", a3);
  }
  return [(DYFunctionTracer *)self nilString];
}

- (id)variableForPBufferIDNumber:(id)a3
{
  uint64_t v4 = [a3 unsignedLongLongValue];
  return [(DYGLFunctionTracer *)self variableForPBufferID:v4];
}

- (id)variableForPixelFormatID:(unint64_t)a3
{
  if (a3) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"pf_%llx", a3);
  }
  return [(DYFunctionTracer *)self nilString];
}

- (id)variableForPixelFormatIDNumber:(id)a3
{
  uint64_t v4 = [a3 unsignedLongLongValue];
  return [(DYGLFunctionTracer *)self variableForPixelFormatID:v4];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end