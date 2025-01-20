void jet_render_mode::jet_render_mode(jet_render_mode *this)
{
  *(void *)this = &unk_26D152588;
}

BOOL xglCompileShader(GLuint *a1, uint64_t type, GLchar *a3, uint64_t a4)
{
  string[2] = *(GLchar **)MEMORY[0x263EF8340];
  if (a3)
  {
    GLint size_4 = 0;
    GLuint Shader = glCreateShader(type);
    *a1 = Shader;
    string[0] = "    #extension GL_OES_standard_derivatives : enable\n"
                "    precision highp float;\n"
                "    precision highp int;\n"
                "    precision lowp sampler2D;\n"
                "    precision lowp samplerCube;\n"
                "    #line 0\n";
    string[1] = a3;
    glShaderSource(Shader, 2, (const GLchar *const *)string, 0);
    glCompileShader(*a1);
    GLint size = 0;
    glGetShaderiv(*a1, 0x8B84u, &size);
    if (size >= 1)
    {
      v8 = (GLchar *)malloc_type_malloc(size, 0x17E45BE7uLL);
      glGetShaderInfoLog(*a1, size, &size, v8);
      if (a4) {
        operator new();
      }
      free(v8);
    }
    glGetShaderiv(*a1, 0x8B81u, &size_4);
    BOOL v9 = size_4 != 0;
    if (!size_4) {
      glDeleteShader(*a1);
    }
  }
  else
  {
    jet_log(&cfstr_ShaderSourceIs.isa, type);
    return 0;
  }
  return v9;
}

void sub_21FAD2D40(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x1012C40EC159624);
  _Unwind_Resume(a1);
}

BOOL xglLinkProgram(GLuint a1)
{
  GLint params = 0;
  glLinkProgram(a1);
  glGetProgramiv(a1, 0x8B82u, &params);
  return params != 0;
}

BOOL xglValidateProgram(GLuint a1)
{
  *(void *)GLint params = 0;
  glValidateProgram(a1);
  glGetProgramiv(a1, 0x8B84u, &params[1]);
  if (params[1] >= 1)
  {
    v2 = (GLchar *)malloc_type_malloc(params[1], 0x7EE5FD8BuLL);
    glGetProgramInfoLog(a1, params[1], &params[1], v2);
    jet_log(&cfstr_ProgramValidat.isa, v2);
    free(v2);
  }
  glGetProgramiv(a1, 0x8B83u, params);
  return params[0] != 0;
}

void xglPrintFramebufferStatus(void)
{
  uint64_t v0 = glCheckFramebufferStatus(0x8D40u);
  switch((int)v0)
  {
    case 36053:
      jet_log(&cfstr_GlFramebufferC.isa);
      return;
    case 36054:
      jet_log(&cfstr_GlFramebufferI.isa);
      goto LABEL_10;
    case 36055:
      jet_log(&cfstr_GlFramebufferI_0.isa);
      goto LABEL_10;
    case 36057:
      jet_log(&cfstr_GlFramebufferI_1.isa);
      goto LABEL_10;
    case 36061:
      jet_log(&cfstr_GlFramebufferU.isa);
      goto LABEL_10;
    default:
      jet_log(&cfstr_GlFramebufferS.isa, v0);
LABEL_10:
      xglPrintFramebuffer();
      return;
  }
}

void xglPrintFramebuffer(void)
{
  GLint params = 0;
  glGetIntegerv(0x8CA6u, &params);
  jet_log(&cfstr_GlFramebufferB.isa, params);
  if (params)
  {
    jet_log(&stru_26D153B10.isa);
    *(void *)v10 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD1u, &v10[1]);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD0u, v10);
    if (v10[0] == 5890)
    {
      jet_log(&cfstr_GlColorAttachm_0.isa, v10[1]);
    }
    else if (v10[0] == 36161)
    {
      GLint v9 = 0;
      glGetIntegerv(0x8CA7u, &v9);
      glBindRenderbuffer(0x8D41u, v10[1]);
      GLint v8 = 0;
      GLint v7 = 0;
      glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v8);
      glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v7);
      glBindRenderbuffer(0x8D41u, v9);
      jet_log(&cfstr_GlColorAttachm.isa, v10[1], v8, v7);
    }
    else
    {
      jet_log(&cfstr_GlColorAttachm_1.isa, v0);
    }
    *(void *)v10 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD1u, &v10[1]);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD0u, v10);
    if (v10[0] == 5890)
    {
      jet_log(&cfstr_GlDepthAttachm_0.isa, v10[1], v3, v5);
    }
    else if (v10[0] == 36161)
    {
      GLint v9 = 0;
      glGetIntegerv(0x8CA7u, &v9);
      glBindRenderbuffer(0x8D41u, v10[1]);
      GLint v8 = 0;
      GLint v7 = 0;
      glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v8);
      glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v7);
      glBindRenderbuffer(0x8D41u, v9);
      jet_log(&cfstr_GlDepthAttachm.isa, v10[1], v8, v7);
    }
    else
    {
      jet_log(&cfstr_GlDepthAttachm_1.isa, v1, v3, v5);
    }
    *(void *)v10 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD1u, &v10[1]);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD0u, v10);
    if (v10[0] == 5890)
    {
      jet_log(&cfstr_GlStencilAttac_0.isa, v10[1], v4, v6);
    }
    else if (v10[0] == 36161)
    {
      GLint v9 = 0;
      glGetIntegerv(0x8CA7u, &v9);
      glBindRenderbuffer(0x8D41u, v10[1]);
      GLint v8 = 0;
      GLint v7 = 0;
      glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v8);
      glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v7);
      glBindRenderbuffer(0x8D41u, v9);
      jet_log(&cfstr_GlStencilAttac.isa, v10[1], v8, v7);
    }
    else
    {
      jet_log(&cfstr_GlStencilAttac_1.isa, v2, v4, v6);
    }
    jet_log(&stru_26D153AB0.isa);
  }
}

void xglPrintInteger(const char *a1, GLenum pname)
{
  GLint params = 0;
  glGetIntegerv(pname, &params);
  jet_log(&cfstr_SD.isa, a1, params);
}

void xglPrintFloat(const char *a1, GLenum pname)
{
  GLfloat params = 0.0;
  glGetFloatv(pname, &params);
  jet_log(&cfstr_SF.isa, a1, params);
}

void xglPrintBoolean(const char *a1, GLenum pname)
{
  GLBOOLean params = 0;
  glGetBooleanv(pname, &params);
  jet_log(&cfstr_SD.isa, a1, params);
}

void xglPrintVertexAttribInteger(const char *a1, GLuint index, GLenum pname)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  glGetVertexAttribiv(index, pname, params);
  if (pname != 34342)
  {
    if (pname == 34341)
    {
      if ((params[0] - 5120) > 0xC) {
        uint64_t v5 = "GL_TYPE_UNKNOWN";
      }
      else {
        uint64_t v5 = off_264528188[params[0] - 5120];
      }
      jet_log(&cfstr_SS.isa, a1, v5);
    }
    else
    {
      jet_log(&cfstr_SD.isa, a1, params[0]);
    }
  }
}

void xglPrintVertexAttrib(uint64_t a1)
{
  GLuint v1 = a1;
  uint64_t v3 = *MEMORY[0x263EF8340];
  jet_log(&cfstr_Xglprintvertex.isa, a1);
  glGetVertexAttribiv(v1, 0x889Fu, params);
  jet_log(&cfstr_SD.isa, "\t GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING: ", params[0]);
  glGetVertexAttribiv(v1, 0x8622u, params);
  jet_log(&cfstr_SD.isa, "\t GL_VERTEX_ATTRIB_ARRAY_ENABLED: ", params[0]);
  glGetVertexAttribiv(v1, 0x8623u, params);
  jet_log(&cfstr_SD.isa, "\t GL_VERTEX_ATTRIB_ARRAY_SIZE: ", params[0]);
  glGetVertexAttribiv(v1, 0x8624u, params);
  jet_log(&cfstr_SD.isa, "\t GL_VERTEX_ATTRIB_ARRAY_STRIDE: ", params[0]);
  xglPrintVertexAttribInteger("\t GL_VERTEX_ATTRIB_ARRAY_TYPE: ", v1, 0x8625u);
  glGetVertexAttribiv(v1, 0x886Au, params);
  jet_log(&cfstr_SD.isa, "\t GL_VERTEX_ATTRIB_ARRAY_NORMALIZED: ", params[0]);
  jet_log(&stru_26D153AB0.isa);
}

void xglPrintState(void)
{
  jet_log(&cfstr_Xglprintstate.isa);
  GLint params = 0;
  glGetIntegerv(0x8B8Du, &params);
  jet_log(&cfstr_SD.isa, "\t GL_CURRENT_PROGRAM: ", params);
  GLint v1 = 0;
  glGetIntegerv(0x8894u, &v1);
  jet_log(&cfstr_SD.isa, "\t GL_ARRAY_BUFFER_BINDING: ", v1);
  GLint v2 = 0;
  glGetIntegerv(0x8895u, &v2);
  jet_log(&cfstr_SD.isa, "\t GL_ELEMENT_ARRAY_BUFFER_BINDING: ", v2);
  jet_log(&stru_26D153AB0.isa);
}

void xglPrintError(void)
{
  uint64_t Error = glGetError();
  switch((int)Error)
  {
    case 1280:
      GLint v1 = @"GL_INVALID_ENUM\n";
      goto LABEL_8;
    case 1281:
      GLint v1 = @"GL_INVALID_VALUE\n";
      goto LABEL_8;
    case 1282:
    case 1285:
    case 1286:
      GLint v1 = @"GL_INVALID_OPERATION\n";
      goto LABEL_8;
    case 1283:
    case 1284:
      goto LABEL_5;
    default:
      if (Error)
      {
LABEL_5:
        jet_log(&cfstr_GlErrorUnknown.isa, Error);
      }
      else
      {
        GLint v1 = @"GL_NO_ERROR\n";
LABEL_8:
        jet_log(&v1->isa);
      }
      return;
  }
}

void xglCheckError(void)
{
  uint64_t Error = glGetError();
  switch((int)Error)
  {
    case 1280:
      GLint v1 = @"GL_INVALID_ENUM\n";
      goto LABEL_8;
    case 1281:
      GLint v1 = @"GL_INVALID_VALUE\n";
      goto LABEL_8;
    case 1282:
    case 1285:
    case 1286:
      GLint v1 = @"GL_INVALID_OPERATION\n";
LABEL_8:
      jet_log(&v1->isa);
      return;
    case 1283:
    case 1284:
      goto LABEL_4;
    default:
      if (Error) {
LABEL_4:
      }
        jet_log(&cfstr_GlErrorUnknown.isa, Error);
      return;
  }
}

uint64_t xglAssertNoError(void)
{
  uint64_t result = glGetError();
  if (result)
  {
    switch((int)result)
    {
      case 1280:
        jet_log(&cfstr_GlInvalidEnum.isa);
        break;
      case 1281:
        jet_log(&cfstr_GlInvalidValue.isa);
        break;
      case 1282:
        jet_log(&cfstr_GlInvalidOpera.isa);
        break;
      case 1285:
        jet_log(&cfstr_GlOutOfMemory.isa);
        break;
      case 1286:
        xglAssertNoError();
        xglAssertNoError();
      default:
        jet_log(&cfstr_GlErrorUnknown_0.isa, result);
        break;
    }
    xglAssertNoError();
  }
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264528150, MEMORY[0x263F8C060]);
}

void sub_21FAD3950(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void jet_context::jet_context(jet_context *this)
{
  *(void *)this = &unk_26D1525F8;
  *((void *)this + 1) = 0;
  *(_OWORD *)((char *)this + 24) = xmmword_21FAE8BD0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_DWORD *)this + 22) = 1065353216;
  *((void *)this + 12) = 0;
}

void jet_context::~jet_context(jet_context *this)
{
  *(void *)this = &unk_26D1525F8;
  GLint v2 = (char *)this + 56;
  for (i = (void *)*((void *)this + 9); i; i = (void *)*i)
  {
    size_t v4 = (void *)(i[2] + 56);
    uint64_t v6 = v2;
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>(v4, &v6);
  }

  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::~__hash_table((uint64_t)v2);
  size_t v5 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void __clang_call_terminate(void *a1)
{
}

void jet_context::create_command_buffer(jet_context *this)
{
}

void sub_21FAD3AD8(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0xA1C4030951706);
  _Unwind_Resume(a1);
}

double jet_context::end_render_pass(jet_context *this)
{
  GLint v2 = (std::__shared_weak_count *)*((void *)this + 6);
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)&double result = 3;
  *((void *)this + 3) = 3;
  *((_DWORD *)this + 8) = 0;
  return result;
}

void jet_context::submit_commands(jet_context *a1, void *a2)
{
  uint64_t v3 = a2;
  if (v3)
  {
    jet_command_buffer::jet_command_buffer((jet_command_buffer *)&v4, 0x64uLL);
    v3[2](v3, &v4);
    jet_context::execute_command_buffer(a1, (jet_command_buffer *)&v4);
    size_t v4 = &unk_26D152780;
    uint64_t v6 = (void **)&v5;
    std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](&v6);
  }
}

void sub_21FAD3BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_context::execute_command_buffer(jet_context *this, jet_command_buffer *a2)
{
  v19[4] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *((void *)a2 + 2) - *((void *)a2 + 1);
    if (v3)
    {
      unint64_t v5 = v3 / 192;
      if (v5 <= 1) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = 112;
      do
      {
        uint64_t v8 = *((void *)a2 + 1);
        switch(*(_DWORD *)(v8 + v7 - 104))
        {
          case 1:
            (*(void (**)(jet_context *, void))(*(void *)this + 200))(this, *(void *)(v8 + v7));
            break;
          case 2:
            (*(void (**)(jet_context *, void))(*(void *)this + 192))(this, *(void *)(v8 + v7));
            break;
          case 3:
            (*(void (**)(jet_context *, void, void, void))(*(void *)this + 232))(this, *(unsigned int *)(v8 + v7 + 16), *(unsigned int *)(v8 + v7 + 20), *(unsigned int *)(v8 + v7 + 24));
            break;
          case 4:
            (*(void (**)(jet_context *, void, void, void, void))(*(void *)this + 240))(this, *(unsigned int *)(v8 + v7 + 16), *(void *)(v8 + v7), *(unsigned int *)(v8 + v7 + 20), *(unsigned int *)(v8 + v7 + 24));
            break;
          case 5:
            jet_context::set_vertex_buffer((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 6:
            jet_context::set_vertex_texture((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 7:
            jet_context::set_vertex_constant((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 8:
            jet_context::set_fragment_texture((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 9:
            jet_context::set_fragment_constant((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 0xA:
            (*(void (**)(jet_context *, void))(*(void *)this + 216))(this, *(unsigned int *)(v8 + v7 + 16));
            break;
          case 0xB:
            (*(void (**)(jet_context *, void, void, void, void))(*(void *)this + 208))(this, *(unsigned int *)(v8 + v7 + 16), *(unsigned int *)(v8 + v7 + 20), *(unsigned int *)(v8 + v7 + 24), *(unsigned int *)(v8 + v7 + 28));
            break;
          case 0xC:
            (*(void (**)(jet_context *, void, void, void, void))(*(void *)this + 224))(this, *(unsigned int *)(v8 + v7 + 16), *(unsigned int *)(v8 + v7 + 20), *(unsigned int *)(v8 + v7 + 24), *(unsigned int *)(v8 + v7 + 28));
            break;
          case 0xD:
            std::function<void ()(jet_context *)>::operator()(v8 + v7 - 72, (uint64_t)this);
            break;
          case 0xE:
            (**(void (***)(uint64_t *__return_ptr, jet_context *, void))this)(&v17, this, *(void *)(v8 + v7));
            GLint v9 = v18;
            if (v18) {
              goto LABEL_52;
            }
            break;
          case 0xF:
            jet_context::set_vertex_constant_value((void **)this, *(float *)(v8 + v7 + 16));
            break;
          case 0x10:
            jet_context::set_vertex_constant_value((void **)this, *(double *)(v8 + v7 + 16));
            break;
          case 0x11:
            jet_context::set_vertex_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x12:
            jet_context::set_vertex_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x13:
            jet_context::set_vertex_constant_value((void **)this, *(double *)(v8 + v7 + 16), *(double *)(v8 + v7 + 24));
            break;
          case 0x14:
            jet_context::set_vertex_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16), *(__n128 *)(v8 + v7 + 32), *(__n128 *)(v8 + v7 + 48));
            break;
          case 0x15:
            jet_context::set_vertex_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16), *(__n128 *)(v8 + v7 + 32), *(__n128 *)(v8 + v7 + 48), *(__n128 *)(v8 + v7 + 64));
            break;
          case 0x16:
            jet_context::set_fragment_constant_value((void **)this, *(float *)(v8 + v7 + 16));
            break;
          case 0x17:
            jet_context::set_fragment_constant_value((void **)this, *(double *)(v8 + v7 + 16));
            break;
          case 0x18:
            jet_context::set_fragment_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x19:
            jet_context::set_fragment_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x1A:
            jet_context::set_fragment_constant_value((void **)this, *(double *)(v8 + v7 + 16), *(double *)(v8 + v7 + 24));
            break;
          case 0x1B:
            jet_context::set_fragment_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16), *(__n128 *)(v8 + v7 + 32), *(__n128 *)(v8 + v7 + 48));
            break;
          case 0x1C:
            jet_context::set_fragment_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16), *(__n128 *)(v8 + v7 + 32), *(__n128 *)(v8 + v7 + 48), *(__n128 *)(v8 + v7 + 64));
            break;
          case 0x1D:
            jet_context::set_vertex_sampler((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 0x1E:
            jet_context::set_fragment_sampler((void **)this, v8 + v7 - 96, *(void *)(v8 + v7));
            break;
          case 0x1F:
            uint64_t v10 = v8 + v7;
            int v11 = *(_DWORD *)(v10 + 32);
            unsigned int v12 = *(_DWORD *)(v10 + 36);
            jet_context::change_render_mode((uint64_t)this, v12 & 1, *(void *)v10, (v12 >> 1) & 1, *(unsigned int *)(v10 + 16), (v12 & 4) != 0, *(unsigned int *)(v10 + 20), (v12 & 8) != 0, *(_DWORD *)(v10 + 24), (v12 & 0x10) != 0, *(_DWORD *)(v10 + 28), (v12 & 0x20) != 0, v11 & 1, (v11 & 2) != 0, (v11 & 4) != 0, (v11 & 8) != 0);
            break;
          case 0x20:
            (*(void (**)(jet_context *, void))(*(void *)this + 184))(this, *(void *)(v8 + v7));
            break;
          case 0x21:
            (*(void (**)(uint64_t *__return_ptr, jet_context *, void, double))(*(void *)this + 168))(&v15, this, *(void *)(v8 + v7), *(double *)(v8 + v7 + 16));
            GLint v9 = v16;
            if (v16) {
              goto LABEL_52;
            }
            break;
          case 0x22:
            jet_context::set_vertex_constant_value((void **)this, v8 + v7 - 96, *(_DWORD *)(v8 + v7 + 16));
            break;
          case 0x23:
            jet_context::set_vertex_constant_value((void **)this, *(double *)(v8 + v7 + 16));
            break;
          case 0x24:
            jet_context::set_vertex_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x25:
            jet_context::set_vertex_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x26:
            jet_context::set_fragment_constant_value((void **)this, v8 + v7 - 96, *(_DWORD *)(v8 + v7 + 16));
            break;
          case 0x27:
            jet_context::set_fragment_constant_value((void **)this, *(double *)(v8 + v7 + 16));
            break;
          case 0x28:
            jet_context::set_fragment_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x29:
            jet_context::set_fragment_constant_value((void **)this, *(__n128 *)(v8 + v7 + 16));
            break;
          case 0x2A:
            (*(void (**)(uint64_t *__return_ptr, jet_context *, void, void, __n128))(*(void *)this
                                                                                                 + 160))(&v13, this, *(void *)(v8 + v7), *(void *)(v8 + v7 + 8), *(__n128 *)(v8 + v7 + 16));
            GLint v9 = v14;
            if (v14) {
LABEL_52:
            }
              std::__shared_weak_count::__release_shared[abi:ne180100](v9);
            break;
          case 0x2B:
            std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v19, v8 + v7 - 40);
            (*(void (**)(jet_context *, void *))(*(void *)this + 344))(this, v19);
            std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v19);
            break;
          default:
            break;
        }
        v7 += 192;
        --v6;
      }
      while (v6);
    }
  }
}

void sub_21FAD42E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void jet_command_buffer::~jet_command_buffer(jet_command_buffer *this)
{
  *(void *)this = &unk_26D152780;
  uint64_t v1 = (void **)((char *)this + 8);
  std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v2;

  *(void *)this = &unk_26D152780;
  GLint v2 = (void **)((char *)this + 8);
  std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](&v2);
  MEMORY[0x223C592E0](this, 0xA1C4030951706);
}

double jet_context::submit_command_buffer_impl@<D0>(std::__shared_weak_count **this@<X0>, jet_command_buffer *a2@<X1>, std::__shared_weak_count **a3@<X8>)
{
  ((void (*)(std::__shared_weak_count **))(*this)[14].__shared_weak_owners_)(this);
  jet_context::execute_command_buffer((jet_context *)this, a2);
  uint64_t v7 = this + 5;
  uint64_t v6 = this[5];
  if (!v6)
  {
    ((void (*)(long long *__return_ptr, std::__shared_weak_count **))(*this)[7].__shared_owners_)(&v13, this);
    long long v8 = v13;
    long long v13 = 0uLL;
    GLint v9 = this[6];
    *(_OWORD *)(this + 5) = v8;
    if (v9)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      if (*((void *)&v13 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v13 + 1));
      }
    }
    uint64_t v6 = *v7;
  }
  uint64_t v10 = this[6];
  *a3 = v6;
  a3[1] = v10;
  if (v10)
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    int v11 = this[6];
    *uint64_t v7 = 0;
    this[6] = 0;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  else
  {
    *uint64_t v7 = 0;
    this[6] = 0;
  }
  this[1] = 0;
  this[2] = 0;
  *(void *)&double result = 3;
  this[3] = (std::__shared_weak_count *)3;
  *((_DWORD *)this + 8) = 0;
  return result;
}

uint64_t jet_context::set_vertex_buffer(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 16))(a1[1]);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v6 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[32];
    return v6(a1, a3, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_texture(void **a1, uint64_t a2, uint64_t a3)
{
  if (a3 && (*(unsigned int (**)(uint64_t))(*(void *)a3 + 88))(a3)) {
    jet_context::set_vertex_texture();
  }
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 32))(a1[1], a2);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v7 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[35];
    return v7(a1, a3, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v6 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[33];
    return v6(a1, a3, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_texture(void **a1, uint64_t a2, uint64_t a3)
{
  if (a3 && (*(unsigned int (**)(uint64_t))(*(void *)a3 + 88))(a3)) {
    jet_context::set_fragment_texture();
  }
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(*a1[1] + 56))(a1[1], a2);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v7 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[39];
    return v7(a1, a3, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v6 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[37];
    return v6(a1, a3, result);
  }
  return result;
}

uint64_t std::function<void ()(jet_context *)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t jet_context::set_vertex_constant_value(void **a1, float a2)
{
  float v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, float *, uint64_t))(*a1)[34])(a1, 0, 1, 1, &v4, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant_value(void **a1, double a2)
{
  double v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, double *, uint64_t))(*a1)[34])(a1, 0, 2, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  double v4;

  double v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, double *, uint64_t))(*a1)[34])(a1, 5, 2, 1, &v4, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant_value(void **a1, __n128 a2)
{
  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 0, 3, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  __n128 v4;

  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 0, 4, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  __n128 v4;

  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 5, 3, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  __n128 v4;

  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[34])(a1, 5, 4, 1, &v4, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant_value(void **a1, double a2, double a3)
{
  *(double *)unint64_t v5 = a2;
  *(double *)&v5[1] = a3;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, void *, uint64_t))(*a1)[34])(a1, 6, 1, 1, v5, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant_value(void **a1, __n128 a2, __n128 a3, __n128 a4)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[34])(a1, 7, 1, 1, v6, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant_value(void **a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[34])(a1, 8, 1, 1, v7, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_constant_value(void **a1, uint64_t a2, int a3)
{
  int v5 = a3;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 24))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, int *, uint64_t))(*a1)[34])(a1, 5, 1, 1, &v5, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, float a2)
{
  float v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, float *, uint64_t))(*a1)[38])(a1, 0, 1, 1, &v4, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, double a2)
{
  double v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, double *, uint64_t))(*a1)[38])(a1, 0, 2, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  double v4;

  double v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, double *, uint64_t))(*a1)[38])(a1, 5, 2, 1, &v4, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, __n128 a2)
{
  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 0, 3, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  __n128 v4;

  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, void, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 0, 4, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  __n128 v4;

  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 5, 3, 1, &v4, result);
  }
  return result;
}

{
  uint64_t result;
  __n128 v4;

  __n128 v4 = a2;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, __n128 *, uint64_t))(*a1)[38])(a1, 5, 4, 1, &v4, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, double a2, double a3)
{
  *(double *)int v5 = a2;
  *(double *)&v5[1] = a3;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, void *, uint64_t))(*a1)[38])(a1, 6, 1, 1, v5, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, __n128 a2, __n128 a3, __n128 a4)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[38])(a1, 7, 1, 1, v6, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  v7[3] = a5;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))(*a1)[38])(a1, 8, 1, 1, v7, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_constant_value(void **a1, uint64_t a2, int a3)
{
  int v5 = a3;
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 48))(a1[1]);
  if ((result & 0x80000000) == 0) {
    return ((uint64_t (*)(void **, uint64_t, uint64_t, uint64_t, int *, uint64_t))(*a1)[38])(a1, 5, 1, 1, &v5, result);
  }
  return result;
}

uint64_t jet_context::set_vertex_sampler(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 40))(a1[1]);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v6 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[36];
    return v6(a1, a3, result);
  }
  return result;
}

uint64_t jet_context::set_fragment_sampler(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void *))(*a1[1] + 64))(a1[1]);
  if ((result & 0x80000000) == 0)
  {
    uint64_t v6 = (uint64_t (*)(void **, uint64_t, uint64_t))(*a1)[40];
    return v6(a1, a3, result);
  }
  return result;
}

uint64_t jet_context::change_render_mode(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, char a6, uint64_t a7, char a8, unsigned int a9, char a10, unsigned int a11, char a12, unsigned __int8 a13, unsigned __int8 a14, BOOL a15, BOOL a16)
{
  unsigned int v23 = a14;
  uint64_t v24 = a13;
  uint64_t v25 = a11;
  uint64_t v26 = a9;
  uint64_t v27 = *(void *)(a1 + 8);
  if (v27)
  {
    if (a2)
    {
      if (a4) {
        goto LABEL_4;
      }
    }
    else
    {
      a3 = *(void *)(v27 + 8);
      if (a4)
      {
LABEL_4:
        if (a6) {
          goto LABEL_5;
        }
        goto LABEL_25;
      }
    }
    a5 = *(unsigned int *)(v27 + 16);
    if (a6)
    {
LABEL_5:
      if (a8) {
        goto LABEL_6;
      }
      goto LABEL_26;
    }
LABEL_25:
    a7 = *(unsigned int *)(a1 + 24);
    if (a8)
    {
LABEL_6:
      if (a10) {
        goto LABEL_7;
      }
      goto LABEL_27;
    }
LABEL_26:
    uint64_t v26 = *(unsigned int *)(a1 + 28);
    if (a10)
    {
LABEL_7:
      if (a12) {
        goto LABEL_29;
      }
LABEL_28:
      uint64_t v24 = *(unsigned char *)(v27 + 32) != 0;
      unsigned int v23 = *(unsigned char *)(v27 + 33) != 0;
      a15 = *(unsigned char *)(v27 + 34) != 0;
      a16 = *(unsigned char *)(v27 + 35) != 0;
      goto LABEL_29;
    }
LABEL_27:
    uint64_t v25 = *(unsigned int *)(a1 + 32);
    if (a12) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (!a2) {
    a3 = 0;
  }
  if (a4) {
    a5 = a5;
  }
  else {
    a5 = 0;
  }
  if (a6)
  {
    if (a8) {
      goto LABEL_16;
    }
  }
  else
  {
    a7 = *(unsigned int *)(a1 + 24);
    if (a8)
    {
LABEL_16:
      if (a10) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  uint64_t v26 = *(unsigned int *)(a1 + 28);
  if ((a10 & 1) == 0) {
LABEL_17:
  }
    uint64_t v25 = *(unsigned int *)(a1 + 32);
LABEL_18:
  if (a12) {
    uint64_t v24 = a13;
  }
  else {
    uint64_t v24 = 1;
  }
  if ((a12 & 1) == 0)
  {
    unsigned int v23 = 1;
    a15 = 1;
    a16 = 1;
  }
LABEL_29:
  HIBYTE(v31) = a16;
  LOBYTE(v31) = a15;
  uint64_t v28 = jet_context::lookup_render_mode(a1, a3, a5, a7, v26, v25, v24, v23, v31, *(_DWORD *)(a1 + 36));
  v29 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 200);

  return v29(a1, v28);
}

uint64_t jet_context::create_texture_2d(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int, uint64_t))(*(void *)a1 + 248))(a1, 0, a4, a2, a3, 1, a6, 1, a7, a5);
}

uint64_t jet_context::create_texture_cube(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, _DWORD, void))(*(void *)a1 + 248))(a1, 2, a4, a2, a3, 1, a11, 1, 0, 0);
  (*(void (**)(uint64_t, uint64_t, void, void, void))(*(void *)v15 + 56))(v15, a5, 0, 0, 0);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v15 + 56))(v15, a6, 0, 1, 0);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v15 + 56))(v15, a7, 0, 2, 0);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v15 + 56))(v15, a8, 0, 3, 0);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v15 + 56))(v15, a9, 0, 4, 0);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, void))(*(void *)v15 + 56))(v15, a10, 0, 5, 0);
  return v15;
}

void jet_context::create_framebuffer(jet_context *this)
{
}

uint64_t jet_context::lookup_render_mode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, __int16 a9, int a10)
{
  if (!a2) {
    return 0;
  }
  int v17 = a7 | 2;
  v23[0] = a3;
  if (!a8) {
    int v17 = a7;
  }
  if ((_BYTE)a9) {
    v17 |= 4u;
  }
  if (HIBYTE(a9)) {
    v17 |= 8u;
  }
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = v17;
  v23[5] = a10;
  v21 = (uint64_t **)(a2 + 8);
  uint64_t v18 = std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::find<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(a2 + 8, v23);
  if (a2 + 16 == v18)
  {
    uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, __int16))(*(void *)a1 + 88))(a1, a2, a3, a4, a5, a6, a7, a8, a9);
    v19 = &v24;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__emplace_unique_key_args<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>&,jet_render_mode *&>(v21, v23, (uint64_t)v23, &v24);
  }
  else
  {
    v19 = (uint64_t *)(v18 + 56);
  }
  return *v19;
}

uint64_t jet_context::change_blend_mode(uint64_t a1, uint64_t a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 1, a2, 0, 0, 0, 0, 0, 0, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_color_mask(jet_context *this, unsigned __int8 a2, unsigned __int8 a3, BOOL a4, BOOL a5)
{
  return jet_context::change_render_mode((uint64_t)this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, a2, a3, a4, a5);
}

uint64_t jet_context::change_dest_color_format(uint64_t a1, uint64_t a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 0, 0, 1, a2, 0, 0, 0, 0, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_dest_depth_format(uint64_t a1, unsigned int a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 0, 0, 0, 0, 1, a2, 0, 0, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_dest_stencil_format(uint64_t a1, unsigned int a2)
{
  return jet_context::change_render_mode(a1, 0, 0, 0, 0, 0, 0, 0, 0, 1, a2, 0, 1u, 1u, 1, 1);
}

uint64_t jet_context::change_program(jet_context *this, jet_program *a2)
{
  return jet_context::change_render_mode((uint64_t)this, 1, (uint64_t)a2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1u, 1u, 1, 1);
}

void *jet_context::add_fenced_buffer(jet_context *this, jet_buffer *a2)
{
  int v5 = a2;
  *((unsigned char *)a2 + 8) = 1;
  uint64_t v2 = (char *)this + 56;
  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__emplace_unique_key_args<jet_buffer *,jet_buffer * const&>((uint64_t)this + 56, &v5, &v5);
  __n128 v4 = v2;
  return std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__emplace_unique_key_args<std::unordered_set<jet_buffer *> *,std::unordered_set<jet_buffer *> *>((uint64_t)v5 + 56, &v4, &v4);
}

void *jet_context::clear_fenced_buffers(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = (void *)(a1 + 56);
  for (i = *(void **)(a1 + 72); i; i = (void *)*i)
  {
    uint64_t v5 = i[2];
    uint64_t v10 = v2;
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>((void *)(v5 + 56), &v10);
    uint64_t v7 = *a2;
    uint64_t v6 = a2[1];
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    long long v8 = *(std::__shared_weak_count **)(v5 + 32);
    *(void *)(v5 + 24) = v7;
    *(void *)(v5 + 32) = v6;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    *(unsigned char *)(v5 + 8) = 0;
    if (*(void *)(v5 + 16))
    {
      while (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v5 + 16)))
        ;
    }
  }
  return std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::clear(v2);
}

void jet_command_buffer::jet_command_buffer(jet_command_buffer *this, unint64_t a2)
{
  *(void *)this = &unk_26D152780;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  std::vector<jet_render_op>::reserve((uint64_t *)this + 1, a2);
}

void sub_21FAD6138(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<jet_render_op>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 6) < a2)
  {
    if (a2 >= 0x155555555555556) {
      std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    _OWORD v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<jet_render_op>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 192 * v6;
    std::vector<jet_render_op>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<jet_render_op>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_21FAD61F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<jet_render_op>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<jet_render_op>::__throw_length_error[abi:ne180100]()
{
}

uint64_t std::vector<jet_render_op>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<jet_render_op>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<jet_render_op>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x155555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(192 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<jet_render_op>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  for (uint64_t i = 0;
        a3 + i != a5;
        std::allocator<jet_render_op>::construct[abi:ne180100]<jet_render_op,jet_render_op const&>(a1, i + a7, i + a3))
  {
    i -= 192;
  }
  return a6;
}

__n128 std::allocator<jet_render_op>::construct[abi:ne180100]<jet_render_op,jet_render_op const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a2 = &unk_26D1527B0;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a3 + 8);
  uint64_t v5 = (std::string *)(a2 + 16);
  if (*(char *)(a3 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a3 + 16), *(void *)(a3 + 24));
  }
  else
  {
    long long v6 = *(_OWORD *)(a3 + 16);
    *(void *)(a2 + 32) = *(void *)(a3 + 32);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100](a2 + 40, a3 + 40);
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a2 + 72, a3 + 72);
  *(_OWORD *)(a2 + 112) = *(_OWORD *)(a3 + 112);
  __n128 result = *(__n128 *)(a3 + 128);
  long long v8 = *(_OWORD *)(a3 + 144);
  long long v9 = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a3 + 160);
  *(_OWORD *)(a2 + 176) = v9;
  *(__n128 *)(a2 + 128) = result;
  *(_OWORD *)(a2 + 144) = v8;
  return result;
}

void sub_21FAD64C4(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(jet_context *)>::~__value_func[abi:ne180100](v3);
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(a1);
}

void jet_render_op::~jet_render_op(jet_render_op *this)
{
  jet_render_op::~jet_render_op(this);

  JUMPOUT(0x223C592E0);
}

{
  *(void *)this = &unk_26D1527B0;
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 9);
  std::__function::__value_func<void ()(jet_context *)>::~__value_func[abi:ne180100]((void *)this + 5);
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    long long v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::__function::__value_func<void ()(jet_context *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(jet_context *)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__split_buffer<jet_render_op>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(void (***)(void))(i - 192);
    *(void *)(a1 + 16) = i - 192;
    (*v4)();
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<jet_render_op>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      std::string::size_type v6 = v4 - 192;
      std::string::size_type v7 = v4 - 192;
      long long v8 = v4 - 192;
      do
      {
        long long v9 = *(void (***)(char *))v8;
        v8 -= 192;
        (*v9)(v7);
        v6 -= 192;
        BOOL v10 = v7 == v2;
        std::string::size_type v7 = v8;
      }
      while (!v10);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>(void *a1, void *a2)
{
  __n128 result = std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::find<std::unordered_set<jet_buffer *> *>(a1, a2);
  if (result)
  {
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::find<std::unordered_set<jet_buffer *> *>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  long long v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  __n128 result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      __n128 result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint8x8_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint8x8_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *unint64_t v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x223C592E0);
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::find<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 8;
  do
  {
    BOOL v6 = std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v9, (_DWORD *)(v3 + 32), a2);
    unint64_t v7 = (uint64_t *)(v3 + 8);
    if (!v6)
    {
      unint64_t v7 = (uint64_t *)v3;
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v5 == v2
    || std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v10, a2, (_DWORD *)(v5 + 32)))
  {
    return v2;
  }
  return v5;
}

BOOL std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 < *a3) {
    return 1;
  }
  if (*a3 < *a2) {
    return 0;
  }
  unsigned int v3 = a2[1];
  unsigned int v4 = a3[1];
  if (v3 < v4) {
    return 1;
  }
  return v4 >= v3
      && std::__tuple_less<4ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v6, a2, a3);
}

BOOL std::__tuple_less<4ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = a2[2];
  unsigned int v4 = a3[2];
  if (v3 < v4) {
    return 1;
  }
  if (v4 < v3) {
    return 0;
  }
  unsigned int v5 = a2[3];
  unsigned int v6 = a3[3];
  if (v5 < v6) {
    return 1;
  }
  if (v6 < v5) {
    return 0;
  }
  unsigned int v7 = a2[4];
  unsigned int v8 = a3[4];
  if (v7 < v8) {
    return 1;
  }
  return v8 >= v7 && a2[5] < a3[5];
}

_OWORD *std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__emplace_unique_key_args<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>&,jet_render_mode *&>(uint64_t **a1, _DWORD *a2, uint64_t a3, uint64_t *a4)
{
  unsigned int v7 = (void **)std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__find_equal<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)a1, &v12, a2);
  unsigned int v8 = *v7;
  if (!*v7)
  {
    char v9 = (uint64_t **)v7;
    unsigned int v8 = operator new(0x40uLL);
    v8[2] = *(_OWORD *)a3;
    uint64_t v10 = *a4;
    *((void *)v8 + 6) = *(void *)(a3 + 16);
    *((void *)v8 + 7) = v10;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, v12, v9, (uint64_t *)v8);
  }
  return v8;
}

void *std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__find_equal<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>(uint64_t a1, void *a2, _DWORD *a3)
{
  unsigned int v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        unsigned int v7 = (void *)v4;
        unsigned int v8 = (_DWORD *)(v4 + 32);
        if (!std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v10, a3, (_DWORD *)(v4 + 32)))break; {
        uint64_t v4 = *v7;
        }
        unsigned int v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (!std::__tuple_less<6ul>::operator()[abi:ne180100]<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>((uint64_t)&v11, v8, a3))break; {
      unsigned int v5 = v7 + 1;
      }
      uint64_t v4 = v7[1];
    }
    while (v4);
  }
  else
  {
    unsigned int v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unsigned int v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unsigned int v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unsigned int v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            char v9 = (uint64_t **)a2[2];
          }
          else
          {
            char v9 = (uint64_t **)v2[1];
            char v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              GLint v10[2] = (uint64_t)v2;
              unsigned int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *char v9 = v2;
            v2[2] = (uint64_t)v9;
            unsigned int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unsigned int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), unsigned int v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unsigned int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unsigned int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *unsigned int v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__emplace_unique_key_args<jet_buffer *,jet_buffer * const&>(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v8;
  i[2] = *a3;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v20 = *(void *)a1;
  v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    void *v21 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21FAD743C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__emplace_unique_key_args<std::unordered_set<jet_buffer *> *,std::unordered_set<jet_buffer *> *>(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v8;
  i[2] = *a3;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v20 = *(void *)a1;
  v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    void *v21 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_21FAD78DC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::clear(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    __n128 result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        __n128 result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void jet_context_OpenGL::jet_context_OpenGL(jet_context_OpenGL *this, EAGLContext *a2)
{
  uint64_t v3 = a2;
  jet_context::jet_context(this);
  *(void *)this = &unk_26D152820;
  int8x8_t v4 = v3;
  *((void *)this + 18) = 0;
  *((void *)this + 17) = (char *)this + 144;
  *((void *)this + 15) = 0;
  *((void *)this + 13) = v4;
  *((void *)this + 14) = (char *)this + 120;
  *((void *)this + 16) = 0;
  *((void *)this + 19) = 0;
  *((_DWORD *)this + 40) = 0;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 23) = 0x100000000;
  unint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v6 = jet_createGLContext(0);
    unint64_t v7 = (void *)*((void *)this + 13);
    *((void *)this + 13) = v6;

    unint64_t v5 = (EAGLContext *)*((void *)this + 13);
  }
  glContextUse::glContextUse((glContextUse *)v9, v5);
  glGenFramebuffers(1, (GLuint *)this + 45);
  GLuint v8 = *((_DWORD *)this + 45);
  *((_DWORD *)this + 46) = v8;
  glBindFramebuffer(0x8D40u, v8);
  glEnable(0xC11u);
  glDisable(0xB71u);
  glDepthFunc(0x207u);
  glDepthMask(0);
  glDisable(0xB90u);
  glContextUse::~glContextUse((glContextUse *)v9);
}

void sub_21FAD7A7C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v4, *(void **)(v1 + 144));
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(v3, *(void **)(v1 + 120));

  jet_context::~jet_context((jet_context *)v1);
  _Unwind_Resume(a1);
}

id jet_createGLContext(EAGLContext *a1)
{
  uint64_t v1 = a1;
  id v2 = objc_alloc(MEMORY[0x263F146E8]);
  uint64_t v3 = [(EAGLContext *)v1 sharegroup];
  uint64_t v4 = (void *)[v2 initWithAPI:2 sharegroup:v3];

  return v4;
}

void sub_21FAD7B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::~jet_context_OpenGL(GLuint *framebuffers)
{
  *(void *)framebuffers = &unk_26D152820;
  id v2 = framebuffers + 45;
  if (framebuffers[45])
  {
    glDeleteFramebuffers(1, v2);
    const GLuint *v2 = 0;
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)(framebuffers + 34), *((void **)framebuffers + 18));
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)(framebuffers + 28), *((void **)framebuffers + 15));

  jet_context::~jet_context((jet_context *)framebuffers);
}

void jet_context_OpenGL::~jet_context_OpenGL(GLuint *this)
{
  jet_context_OpenGL::~jet_context_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

uint64_t jet_context_OpenGL::get_context_type(jet_context_OpenGL *this)
{
  return 0;
}

uint64_t jet_context_OpenGL::get_max_texture_size(uint64_t a1, int a2)
{
  glContextUse::glContextUse((glContextUse *)v6, *(EAGLContext **)(a1 + 104));
  GLint params = 0;
  if (a2 == 2) {
    glGetIntegerv(0x851Cu, &params);
  }
  else {
    glGetIntegerv(0xD33u, &params);
  }
  uint64_t v3 = params;
  glContextUse::~glContextUse((glContextUse *)v6);
  return v3;
}

void sub_21FAD7CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::indexForTetxure(jet_context_OpenGL *this, unsigned int a2)
{
  unsigned int v9 = a2;
  uint64_t v2 = *((void *)this + 15);
  if (!v2) {
    goto LABEL_12;
  }
  uint64_t v3 = (_DWORD *)((char *)this + 120);
  do
  {
    unsigned int v4 = *(_DWORD *)(v2 + 28);
    BOOL v5 = v4 >= a2;
    if (v4 >= a2) {
      uint64_t v6 = (uint64_t *)v2;
    }
    else {
      uint64_t v6 = (uint64_t *)(v2 + 8);
    }
    if (v5) {
      uint64_t v3 = (_DWORD *)v2;
    }
    uint64_t v2 = *v6;
  }
  while (*v6);
  if (v3 != (_DWORD *)((char *)this + 120) && v3[7] <= a2) {
    return v3[8];
  }
LABEL_12:
  uint64_t v7 = *((unsigned int *)this + 40);
  *((_DWORD *)this + 40) = v7 + 1;
  uint8x8_t v10 = &v9;
  *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)this + 14, &v9, (uint64_t)&std::piecewise_construct, &v10)+ 8) = v7;
  return v7;
}

void jet_context_OpenGL::create_buffer()
{
}

void sub_21FAD7DEC(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C402150694FLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_buffer_pool()
{
}

void sub_21FAD7E80(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C40EB43BACFLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_constant()
{
}

void sub_21FAD7F98(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x1081C40C006A395);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_texture(uint64_t a1, unsigned int a2, int a3, GLsizei a4, GLsizei a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a6 == 1)
  {
    if (a8 == 1)
    {
      glContextUse::glContextUse((glContextUse *)v21, *(EAGLContext **)(a1 + 104));
      unsigned int v15 = a3 - 10;
      if ((a3 - 10) <= 3)
      {
        if (a7)
        {
          unint64_t v18 = "mip_mapped == false";
          int v19 = 393;
        }
        else if (a10)
        {
          unint64_t v18 = "data == nullptr";
          int v19 = 394;
        }
        else
        {
          if (a2 < 2)
          {
            GLuint renderbuffers = 0;
            glGenRenderbuffers(1, &renderbuffers);
            glBindRenderbuffer(0x8D41u, renderbuffers);
            if (v15 > 3) {
              GLenum v16 = 0;
            }
            else {
              GLenum v16 = dword_21FAE8C60[v15];
            }
            glRenderbufferStorage(0x8D41u, v16, a4, a5);
            operator new();
          }
          unint64_t v18 = "type == jet_texture_type_2D || type == jet_texture_type_Rect";
          int v19 = 396;
        }
        __assert_rtn("create_texture", "jet_context_OpenGL.mm", v19, v18);
      }
      GLuint renderbuffers = 0;
      glGenTextures(1, &renderbuffers);
      if (a2 == 2) {
        GLenum v17 = 34067;
      }
      else {
        GLenum v17 = 3553;
      }
      glBindTexture(v17, renderbuffers);
      glTexParameteri(v17, 0x2801u, 9729);
      glTexParameteri(v17, 0x2800u, 9729);
      glTexParameteri(v17, 0x2802u, 33071);
      glTexParameteri(v17, 0x2803u, 33071);
      if (a2 != 2 || a4 == a5) {
        operator new();
      }
      __assert_rtn("create_texture", "jet_context_OpenGL.mm", 452, "width == height");
    }
    jet_context_OpenGL::create_texture();
  }
  jet_context_OpenGL::create_texture();
}

void sub_21FAD827C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x223C592E0](v3, 0x1081C4088E5EABBLL);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

unsigned int *jet_context_OpenGL::get_OpenGL_Tetxure(int a1, void *lpsrc)
{
  if (!lpsrc) {
    return 0;
  }
  if (result) {
    return (unsigned int *)result[4];
  }
  return result;
}

unsigned int *jet_context_OpenGL::get_OpenGL_Renderbuffer(int a1, void *lpsrc)
{
  if (!lpsrc) {
    return 0;
  }
  if (result) {
    return (unsigned int *)result[5];
  }
  return result;
}

void jet_context_OpenGL::create_texture_from_OpenGL_Texture()
{
}

void sub_21FAD8450(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x1081C4088E5EABBLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_texture_from_OpenGL_Renderbuffer()
{
}

void sub_21FAD8508(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x1081C4088E5EABBLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_texture_from_IOSurface(uint64_t a1, IOSurfaceID a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6)
{
  glContextUse::glContextUse((glContextUse *)v24, *(EAGLContext **)(a1 + 104));
  GLuint textures = 0;
  glGenTextures(1, &textures);
  glBindTexture(0xDE1u, textures);
  glTexParameteri(0xDE1u, 0x2801u, 9729);
  glTexParameteri(0xDE1u, 0x2800u, 9729);
  glTexParameteri(0xDE1u, 0x2802u, 33071);
  glTexParameteri(0xDE1u, 0x2803u, 33071);
  IOSurfaceRef v11 = IOSurfaceLookup(a2);
  if ((IOSurfaceGetBytesPerRowOfPlane(v11, a6) & 0xF) == 0)
  {
    int v12 = 35056;
    int v13 = 36168;
    int v14 = 33189;
    unsigned int v15 = 6403;
    int v16 = 6408;
    int v17 = 34842;
    uint64_t v18 = 6403;
    switch(a5)
    {
      case 1:
        break;
      case 2:
        uint64_t v18 = 33319;
        unsigned int v15 = 33319;
        break;
      case 3:
      case 5:
        goto LABEL_4;
      case 4:
        goto LABEL_13;
      case 6:
        int v16 = 32993;
LABEL_13:
        uint64_t v18 = 32993;
        unsigned int v15 = v16;
        break;
      case 10:
LABEL_5:
        uint64_t v18 = 6408;
        unsigned int v15 = v17;
        break;
      case 11:
LABEL_8:
        uint64_t v18 = 35056;
        unsigned int v15 = v12;
        break;
      case 12:
LABEL_7:
        uint64_t v18 = 36168;
        unsigned int v15 = v13;
        break;
      case 13:
LABEL_9:
        uint64_t v18 = 33189;
LABEL_10:
        unsigned int v15 = v14;
        break;
      default:
        int v16 = 0;
LABEL_4:
        uint64_t v18 = 0;
        int v14 = v16;
        int v13 = v16;
        int v12 = v16;
        int v17 = v16;
        unsigned int v15 = v16;
        switch(a5)
        {
          case 3:
          case 5:
          case 10:
            goto LABEL_5;
          case 4:
          case 6:
            goto LABEL_13;
          case 7:
          case 8:
          case 9:
            goto LABEL_14;
          case 11:
            goto LABEL_8;
          case 12:
            goto LABEL_7;
          case 13:
            goto LABEL_9;
          default:
            goto LABEL_10;
        }
    }
LABEL_14:
    int v19 = [MEMORY[0x263F146E8] currentContext];
    uint64_t v20 = 5121;
    if (a5 == 10) {
      uint64_t v20 = 5126;
    }
    uint64_t v21 = 33639;
    if ((a5 - 3) >= 2) {
      uint64_t v21 = v20;
    }
    BYTE4(v22) = 0;
    LODWORD(v22) = a6;
    if (objc_msgSend(v19, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", v11, 3553, v15, a3, a4, v18, v21, v22))
    {
      CFRelease(v11);
      operator new();
    }
    __assert_rtn("create_texture_from_IOSurface", "jet_context_OpenGL.mm", 595, "result");
  }
  jet_log(&cfstr_IosurfaceBytes.isa, 16);
  __assert_rtn("create_texture_from_IOSurface", "jet_context_OpenGL.mm", 584, "bytesPerRow % JET_IO_SURFACE_MIN_READ_ALIGNMENT == 0");
}

void sub_21FAD8810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  MEMORY[0x223C592E0](v5, 0x1081C4088E5EABBLL);

  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_sampler()
{
}

void sub_21FAD89C8(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x1081C408C76C282);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_function(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8x8_t v10 = [MEMORY[0x263F086E0] mainBundle];
  IOSurfaceRef v11 = [NSString stringWithUTF8String:a2];
  int v12 = [v10 pathForResource:v11 ofType:0];

  objc_msgSend(NSString, "stringWithContentsOfFile:encoding:error:", v12, objc_msgSend(NSString, "defaultCStringEncoding"), 0);
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 72))(a1, [v13 UTF8String], a3, a4, a5);

  return v14;
}

void sub_21FAD8AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_function_from_source(uint64_t a1, GLchar *a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v6 = *(EAGLContext **)(a1 + 104);
  if (v6)
  {
    glContextUse::glContextUse((glContextUse *)v12, v6);
    GLuint v11 = 0;
    if (a4 == 2) {
      uint64_t v9 = 35632;
    }
    else {
      uint64_t v9 = 35633;
    }
    if (xglCompileShader(&v11, v9, a2, a5)) {
      operator new();
    }
    glContextUse::~glContextUse((glContextUse *)v12);
  }
  return 0;
}

void sub_21FAD8C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_program(uint64_t a1, const void *a2, const void *a3)
{
  glContextUse::glContextUse((glContextUse *)&v5, *(EAGLContext **)(a1 + 104));
  operator new();
}

void sub_21FAD8D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MEMORY[0x223C592E0](v9, 0x10A1C40FE1D3F04);
  glContextUse::~glContextUse((glContextUse *)&a9);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_render_mode()
{
}

void sub_21FAD8E88(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C408F04D72DLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::begin_render_pass(jet_context_OpenGL *this, GLfloat *lpsrc)
{
  if (!lpsrc) {
    return;
  }
  *((void *)this + 2) = lpsrc;
  if (v4)
  {
    GLuint v5 = v4[66];
    if ((v5 & 0x80000000) == 0)
    {
      if (*((_DWORD *)this + 46) != v5)
      {
        (*(void (**)(uint64_t *__return_ptr, jet_context_OpenGL *))(*(void *)this + 176))(&v30, this);
        if (v31) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v31);
        }
        glBindFramebuffer(0x8D40u, v5);
        *((_DWORD *)this + 46) = v5;
      }
      if (*((_DWORD *)lpsrc + 12) == 1)
      {
        glClearColor(lpsrc[8], lpsrc[9], lpsrc[10], lpsrc[11]);
        int v6 = 0x4000;
      }
      else
      {
        int v6 = 0;
      }
      if (*((_DWORD *)lpsrc + 55) == 1) {
        GLbitfield v16 = v6 | 0x100;
      }
      else {
        GLbitfield v16 = v6;
      }
      if (v16)
      {
        flag[0] = 1;
        if (v16 >= 0x4000)
        {
          glGetBooleanv(0xC23u, &params);
          glColorMask(1u, 1u, 1u, 1u);
        }
        if ((v16 & 0x100) != 0)
        {
          glGetBooleanv(0xB72u, flag);
          glDepthMask(1u);
        }
        glClear(v16);
        if (v16 >= 0x4000) {
          glColorMask(params, green, blue, alpha);
        }
        if ((v16 & 0x100) != 0) {
          glDepthMask(flag[0]);
        }
      }
      return;
    }
  }
  unint64_t v7 = *((void *)lpsrc + 2);
  GLuint v8 = (_DWORD *)*((void *)lpsrc + 29);
  unint64_t v9 = *((void *)lpsrc + 26);
  if (v7 && ((*(uint64_t (**)(void))(*(void *)v7 + 96))(*((void *)lpsrc + 2)) & 1) == 0) {
    jet_context_OpenGL::begin_render_pass();
  }
  if (v9 && ((*(uint64_t (**)(unint64_t))(*(void *)v9 + 104))(v9) & 1) == 0) {
    jet_context_OpenGL::begin_render_pass();
  }
  if (v8)
  {
    if (((*(uint64_t (**)(_DWORD *))(*(void *)v8 + 112))(v8) & 1) == 0) {
      jet_context_OpenGL::begin_render_pass();
    }
  }
  else if (!(v7 | v9))
  {
    GLuint v10 = 0;
    char v11 = 1;
    goto LABEL_20;
  }
  char v11 = 0;
  GLuint v10 = *((_DWORD *)this + 45);
LABEL_20:
  if (*((_DWORD *)this + 46) != v10)
  {
    glBindFramebuffer(0x8D40u, v10);
    *((_DWORD *)this + 46) = v10;
  }
  if (v7)
  {
    *((_DWORD *)this + 6) = (*(uint64_t (**)(unint64_t))(*(void *)v7 + 32))(v7);
    GLuint v12 = *(_DWORD *)(v7 + 16);
    GLuint v13 = *(_DWORD *)(v7 + 20);
    int v14 = (*(uint64_t (**)(unint64_t))(*(void *)v7 + 24))(v7);
    if (v12)
    {
      if (v14 == 2) {
        GLenum v15 = 34067;
      }
      else {
        GLenum v15 = 3553;
      }
      glBindTexture(v15, v12);
      glFramebufferTexture2D(0x8D40u, 0x8CE0u, v15, v12, 0);
    }
    else if (v13)
    {
      glBindRenderbuffer(0x8D41u, v13);
      glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, v13);
    }
    GLsizei v17 = (**(uint64_t (***)(unint64_t))v7)(v7);
    GLsizei v18 = (*(uint64_t (**)(unint64_t))(*(void *)v7 + 8))(v7);
    glViewport(0, 0, v17, v18);
    glScissor(0, 0, v17, v18);
  }
  else
  {
    *((_DWORD *)this + 6) = 3;
  }
  if (*((_DWORD *)lpsrc + 12) == 1 && ((v11 & 1) != 0 || *((void *)lpsrc + 2)))
  {
    glClearColor(lpsrc[8], lpsrc[9], lpsrc[10], lpsrc[11]);
    GLbitfield v19 = 0x4000;
    if (!v10) {
      goto LABEL_54;
    }
  }
  else
  {
    GLbitfield v19 = 0;
    if (!v10) {
      goto LABEL_54;
    }
  }
  if (v8) {
    LODWORD(v8) = v8[5];
  }
  glBindRenderbuffer(0x8D41u, (GLuint)v8);
  glFramebufferRenderbuffer(0x8D40u, 0x8D20u, 0x8D41u, (GLuint)v8);
LABEL_54:
  if (*((_DWORD *)lpsrc + 61) == 1 && ((v11 & 1) != 0 || *((void *)lpsrc + 29)))
  {
    glClearStencil(*((unsigned __int8 *)lpsrc + 240));
    v19 |= 0x400u;
  }
  if (v10)
  {
    if (v9) {
      LODWORD(v9) = *(_DWORD *)(v9 + 20);
    }
    glBindRenderbuffer(0x8D41u, v9);
    glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, v9);
  }
  if (*((_DWORD *)lpsrc + 55) == 1 && ((v11 & 1) != 0 || *((void *)lpsrc + 26))) {
    v19 |= 0x100u;
  }
  if (v7)
  {
    uint64_t v20 = (**(uint64_t (***)(unint64_t))v7)(v7);
    uint64_t v21 = (*(uint64_t (**)(unint64_t))(*(void *)v7 + 8))(v7);
    (*(void (**)(jet_context_OpenGL *, void, void, uint64_t, uint64_t))(*(void *)this + 208))(this, 0, 0, v20, v21);
    uint64_t v22 = (**(uint64_t (***)(unint64_t))v7)(v7);
    uint64_t v23 = (*(uint64_t (**)(unint64_t))(*(void *)v7 + 8))(v7);
    (*(void (**)(jet_context_OpenGL *, void, void, uint64_t, uint64_t))(*(void *)this + 224))(this, 0, 0, v22, v23);
  }
  if (v19)
  {
    GLBOOLean v25 = 1;
    *(_DWORD *)flag = -1;
    if ((v19 & 0x4000) != 0)
    {
      glGetBooleanv(0xC23u, &params);
      glColorMask(1u, 1u, 1u, 1u);
      if ((v19 & 0x100) == 0)
      {
LABEL_71:
        if ((v19 & 0x400) == 0) {
          goto LABEL_73;
        }
        goto LABEL_72;
      }
    }
    else if ((v19 & 0x100) == 0)
    {
      goto LABEL_71;
    }
    glGetBooleanv(0xB72u, &v25);
    glDepthMask(1u);
    if ((v19 & 0x400) == 0)
    {
LABEL_73:
      glClear(v19);
      if ((v19 & 0x4000) != 0)
      {
        glColorMask(params, green, blue, alpha);
        if ((v19 & 0x100) == 0)
        {
LABEL_75:
          if ((v19 & 0x400) == 0) {
            return;
          }
          goto LABEL_76;
        }
      }
      else if ((v19 & 0x100) == 0)
      {
        goto LABEL_75;
      }
      glDepthMask(v25);
      if ((v19 & 0x400) == 0) {
        return;
      }
LABEL_76:
      glStencilMask(*(GLuint *)flag);
      return;
    }
LABEL_72:
    glGetIntegerv(0xB98u, (GLint *)flag);
    glStencilMask(0xFFFFFFFF);
    goto LABEL_73;
  }
}

void jet_context_OpenGL::create_stencil_mode()
{
}

void sub_21FAD95CC(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x1081C40ABB4582ELL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::create_depth_stencil_mode()
{
}

void sub_21FAD9720(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C401F6D444CLL);
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::set_stencil_reference_value(jet_context_OpenGL *this, unsigned __int8 a2)
{
  GLint v2 = a2;
  *((_DWORD *)this + 44) = a2;
  uint64_t v3 = *((void *)this + 21);
  if (v3)
  {
    uint64_t v5 = *(void *)(v3 + 16);
    uint64_t v6 = *(void *)(v3 + 24);
    uint64_t v7 = *(int *)(v5 + 8);
    if (v7 > 7) {
      GLenum v8 = 519;
    }
    else {
      GLenum v8 = dword_21FAE8EA8[v7];
    }
    uint64_t v9 = *(int *)(v6 + 8);
    if (v9 > 7) {
      GLenum v10 = 519;
    }
    else {
      GLenum v10 = dword_21FAE8EA8[v9];
    }
    glStencilFuncSeparate(0x404u, v8, v2, *(_DWORD *)(v5 + 24));
    GLint v11 = *((_DWORD *)this + 44);
    GLuint v12 = *(_DWORD *)(v6 + 24);
    glStencilFuncSeparate(0x405u, v10, v11, v12);
  }
}

void jet_context_OpenGL::set_scissor_rect(jet_context_OpenGL *this, GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void jet_context_OpenGL::use_depth_stencil_mode(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 168) = a2;
  if (a2)
  {
    uint64_t v5 = *(void *)(a2 + 16);
    uint64_t v4 = *(void *)(a2 + 24);
    uint64_t v6 = *(int *)(v5 + 8);
    if (v6 > 7) {
      GLenum v7 = 519;
    }
    else {
      GLenum v7 = dword_21FAE8EA8[v6];
    }
    uint64_t v8 = *(int *)(v4 + 8);
    if (v8 > 7) {
      GLenum v9 = 519;
    }
    else {
      GLenum v9 = dword_21FAE8EA8[v8];
    }
    glEnable(0xB71u);
    uint64_t v10 = *(int *)(a2 + 12);
    if (v10 > 7) {
      GLenum v11 = 519;
    }
    else {
      GLenum v11 = dword_21FAE8EA8[v10];
    }
    glDepthFunc(v11);
    glDepthMask(*(unsigned char *)(a2 + 8));
    glEnable(0xB90u);
    uint64_t v12 = *(int *)(v5 + 12);
    if (v12 > 4) {
      GLenum v13 = 7680;
    }
    else {
      GLenum v13 = dword_21FAE8EC8[v12];
    }
    uint64_t v14 = *(int *)(v5 + 16);
    if (v14 > 4) {
      GLenum v15 = 7680;
    }
    else {
      GLenum v15 = dword_21FAE8EC8[v14];
    }
    uint64_t v16 = *(int *)(v5 + 20);
    if (v16 > 4) {
      GLenum v17 = 7680;
    }
    else {
      GLenum v17 = dword_21FAE8EC8[v16];
    }
    glStencilOpSeparate(0x404u, v13, v15, v17);
    uint64_t v18 = *(int *)(v4 + 12);
    if (v18 > 4) {
      GLenum v19 = 7680;
    }
    else {
      GLenum v19 = dword_21FAE8EC8[v18];
    }
    uint64_t v20 = *(int *)(v4 + 16);
    if (v20 > 4) {
      GLenum v21 = 7680;
    }
    else {
      GLenum v21 = dword_21FAE8EC8[v20];
    }
    uint64_t v22 = *(int *)(v4 + 20);
    if (v22 > 4) {
      GLenum v23 = 7680;
    }
    else {
      GLenum v23 = dword_21FAE8EC8[v22];
    }
    glStencilOpSeparate(0x405u, v19, v21, v23);
    glStencilFuncSeparate(0x404u, v7, *(unsigned __int8 *)(a1 + 176), *(unsigned __int8 *)(v5 + 24));
    GLint v24 = *(unsigned __int8 *)(a1 + 176);
    GLuint v25 = *(unsigned __int8 *)(v4 + 24);
    glStencilFuncSeparate(0x405u, v9, v24, v25);
  }
  else
  {
    glDisable(0xB71u);
    glDepthFunc(0x207u);
    glDepthMask(0);
    glDisable(0xB90u);
  }
}

void jet_context_OpenGL::set_viewport(jet_context_OpenGL *this, GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void jet_context_OpenGL::set_blend_mode(uint64_t a1, int a2, char a3)
{
  switch(a2)
  {
    case 1:
      if (*(_DWORD *)(a1 + 188) == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      glDisable(0xBE2u);
      break;
    case 2:
      int v8 = *(_DWORD *)(a1 + 188);
      if (v8 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        int v8 = *(_DWORD *)(a1 + 188);
      }
      if (v8 == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      GLenum v7 = 1;
      goto LABEL_45;
    case 3:
      if (*(_DWORD *)(a1 + 188) == 1 || (a3 & 1) == 0) {
        glEnable(0xBE2u);
      }
      glBlendEquation(0x800Bu);
      GLenum v9 = 770;
      GLenum v10 = 1;
      GLenum v11 = 0;
      GLenum v12 = 32771;
      goto LABEL_54;
    case 4:
      int v13 = *(_DWORD *)(a1 + 188);
      if (v13 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        int v13 = *(_DWORD *)(a1 + 188);
      }
      if (v13 == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      GLenum v9 = 774;
      GLenum v10 = 0;
      goto LABEL_53;
    case 5:
      int v14 = *(_DWORD *)(a1 + 188);
      if (v14 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        int v14 = *(_DWORD *)(a1 + 188);
      }
      if (v14 == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      GLenum v9 = 774;
      GLenum v10 = 768;
      goto LABEL_53;
    case 6:
      int v15 = *(_DWORD *)(a1 + 188);
      if (v15 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        int v15 = *(_DWORD *)(a1 + 188);
      }
      if (v15 == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      GLenum v7 = 769;
      goto LABEL_45;
    case 7:
      int v16 = *(_DWORD *)(a1 + 188);
      if (v16 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        int v16 = *(_DWORD *)(a1 + 188);
      }
      if (v16 == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      GLenum v9 = 774;
      GLenum v10 = 771;
LABEL_53:
      GLenum v11 = 32771;
      GLenum v12 = 0;
LABEL_54:
      glBlendFuncSeparate(v9, v10, v11, v12);
      break;
    default:
      int v6 = *(_DWORD *)(a1 + 188);
      if (v6 == 1 || (a3 & 1) == 0)
      {
        glEnable(0xBE2u);
        int v6 = *(_DWORD *)(a1 + 188);
      }
      if (v6 == 3 || (a3 & 1) == 0) {
        glBlendEquation(0x8006u);
      }
      GLenum v7 = 771;
LABEL_45:
      glBlendFunc(1u, v7);
      break;
  }
  *(_DWORD *)(a1 + 188) = a2;
}

void jet_context_OpenGL::use_render_mode(jet_context_OpenGL *this, jet_render_mode *a2)
{
  uint64_t v4 = (char *)this + 112;
  uint64_t v5 = (char *)*((void *)this + 14);
  *((void *)this + 1) = a2;
  int v6 = (char *)this + 120;
  if (v5 != (char *)this + 120)
  {
    do
    {
      glActiveTexture(*((_DWORD *)v5 + 8) + 33984);
      glBindTexture(0xDE1u, 0);
      GLenum v7 = (char *)*((void *)v5 + 1);
      if (v7)
      {
        do
        {
          int v8 = v7;
          GLenum v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (char *)*((void *)v5 + 2);
          BOOL v9 = *(void *)v8 == (void)v5;
          uint64_t v5 = v8;
        }
        while (!v9);
      }
      uint64_t v5 = v8;
    }
    while (v8 != v6);
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)v4, *((void **)this + 15));
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 14) = v6;
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)this + 136, *((void **)this + 18));
  *((void *)this + 17) = (char *)this + 144;
  *((void *)this + 19) = 0;
  *((void *)this + 18) = 0;
  *((_DWORD *)this + 40) = 0;
  glUseProgram(*(_DWORD *)(*(void *)(*((void *)a2 + 1) + 40) + 16));
  jet_context_OpenGL::set_blend_mode((uint64_t)this, *((_DWORD *)a2 + 4), 1);
  GLBOOLean v10 = *((unsigned char *)a2 + 32);
  GLBOOLean v11 = *((unsigned char *)a2 + 33);
  GLBOOLean v12 = *((unsigned char *)a2 + 34);
  GLBOOLean v13 = *((unsigned char *)a2 + 35);

  glColorMask(v10, v11, v12, v13);
}

void jet_context_OpenGL::set_vertex_buffer(jet_context_OpenGL *this, jet_buffer *a2, GLuint a3)
{
  jet_context::add_fenced_buffer(this, a2);
  if (!*((unsigned char *)a2 + 112)) {
    (*(void (**)(jet_buffer *, void, void))(*(void *)a2 + 24))(a2, 0, 0);
  }
  if ((a3 & 0x80000000) != 0) {
    jet_context_OpenGL::set_vertex_buffer();
  }
  GLuint v5 = *((_DWORD *)a2 + 26);
  GLint v6 = *((_DWORD *)a2 + 11);
  int v7 = *((_DWORD *)a2 + 10) - 1;
  if (v7 > 7) {
    GLenum v8 = 5126;
  }
  else {
    GLenum v8 = dword_21FAE8EF0[v7];
  }
  glBindBuffer(0x8892u, v5);
  glEnableVertexAttribArray(a3);

  glVertexAttribPointer(a3, v6, v8, 1u, 0, 0);
}

void jet_context_OpenGL::set_vertex_constant(jet_context_OpenGL *this, jet_constant *a2, GLint a3)
{
  if (a3 < 0) {
    jet_context_OpenGL::set_vertex_constant();
  }
  int v5 = (*(uint64_t (**)(jet_constant *))(*(void *)a2 + 8))(a2);
  int v6 = (*(uint64_t (**)(jet_constant *))(*(void *)a2 + 16))(a2);
  GLsizei v7 = (*(uint64_t (**)(jet_constant *))(*(void *)a2 + 24))(a2);
  switch(v5)
  {
    case 0:
      GLenum v8 = (const GLfloat *)*((void *)a2 + 3);
      switch(v6)
      {
        case 1:
          glUniform1fv(a3, v7, v8);
          break;
        case 2:
          glUniform2fv(a3, v7, v8);
          break;
        case 3:
          glUniform3fv(a3, v7, v8);
          break;
        case 4:
          glUniform4fv(a3, v7, v8);
          break;
        default:
          return;
      }
      break;
    case 5:
      BOOL v9 = (const GLint *)*((void *)a2 + 3);
      switch(v6)
      {
        case 1:
          glUniform1iv(a3, v7, v9);
          break;
        case 2:
          glUniform2iv(a3, v7, v9);
          break;
        case 3:
          glUniform3iv(a3, v7, v9);
          break;
        case 4:
          glUniform4iv(a3, v7, v9);
          break;
        default:
          return;
      }
      break;
    case 6:
      GLBOOLean v10 = (const GLfloat *)*((void *)a2 + 3);
      glUniformMatrix2fv(a3, v7, 0, v10);
      break;
    case 7:
      GLBOOLean v11 = (const GLfloat *)*((void *)a2 + 3);
      glUniformMatrix3fv(a3, v7, 0, v11);
      break;
    case 8:
      GLBOOLean v12 = (const GLfloat *)*((void *)a2 + 3);
      glUniformMatrix4fv(a3, v7, 0, v12);
      break;
    default:
      return;
  }
}

void jet_context_OpenGL::set_vertex_constant(uint64_t a1, int a2, int a3, int a4, const void *a5, uint64_t a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ((a6 & 0x80000000) != 0) {
    jet_context_OpenGL::set_vertex_constant();
  }
  if (!a5) {
    jet_context_OpenGL::set_vertex_constant();
  }
  if ((a2 - 1) > 7) {
    int v12 = 4;
  }
  else {
    int v12 = dword_21FAE8F10[a2 - 1];
  }
  jet_constant::jet_constant((jet_constant *)&v15);
  int v15 = &unk_26D152AF8;
  int v16 = a2;
  int v17 = a3;
  int v18 = a4;
  int v19 = a4 * a3 * v12;
  MEMORY[0x270FA5388]();
  uint64_t v20 = (char *)&v14 - ((v13 + 15) & 0x1FFFFFFF0);
  memcpy(v20, a5, v13);
  (*(void (**)(uint64_t, void **, uint64_t))(*(void *)a1 + 264))(a1, &v15, a6);
  uint64_t v20 = 0;
  jet_constant_OpenGL::~jet_constant_OpenGL((jet_constant_OpenGL *)&v15);
}

void sub_21FADA2BC(_Unwind_Exception *a1)
{
  jet_constant_OpenGL::~jet_constant_OpenGL((jet_constant_OpenGL *)(v1 - 104));
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::set_vertex_texture(jet_context_OpenGL *this, jet_texture *a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    jet_context_OpenGL::set_vertex_texture();
  }
  if (a2) {
    GLuint v6 = *((_DWORD *)a2 + 4);
  }
  else {
    GLuint v6 = 0;
  }
  uint64_t v7 = jet_context_OpenGL::indexForTetxure(this, a3);
  glActiveTexture(v7 + 33984);
  if ((*(unsigned int (**)(jet_texture *))(*(void *)a2 + 24))(a2) == 2) {
    GLenum v8 = 34067;
  }
  else {
    GLenum v8 = 3553;
  }
  glBindTexture(v8, v6);
  BOOL v9 = (char *)*((void *)this + 18);
  if (!v9) {
    goto LABEL_19;
  }
  GLBOOLean v10 = (char *)this + 144;
  do
  {
    unsigned int v11 = *((_DWORD *)v9 + 8);
    BOOL v12 = v11 >= v7;
    if (v11 >= v7) {
      size_t v13 = (char **)v9;
    }
    else {
      size_t v13 = (char **)(v9 + 8);
    }
    if (v12) {
      GLBOOLean v10 = v9;
    }
    BOOL v9 = *v13;
  }
  while (*v13);
  if (v10 != (char *)this + 144 && v7 >= *((_DWORD *)v10 + 8)) {
    uint64_t v14 = *((void *)v10 + 5);
  }
  else {
LABEL_19:
  }
    uint64_t v14 = 0;
  (*(void (**)(jet_context_OpenGL *, uint64_t, uint64_t))(*(void *)this + 288))(this, v14, v7);

  glUniform1i(a3, v7);
}

void jet_context_OpenGL::set_vertex_sampler(uint64_t **this, jet_sampler *a2, unsigned int a3)
{
  if ((a3 & 0x80000000) != 0) {
    jet_context_OpenGL::set_vertex_sampler();
  }
  unsigned int v6 = jet_context_OpenGL::indexForTetxure((jet_context_OpenGL *)this, a3);
  uint64_t v7 = &v6;
  std::__tree<std::__value_type<unsigned int,jet_sampler *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,jet_sampler *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,jet_sampler *>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(this + 17, &v6, (uint64_t)&std::piecewise_construct, &v7)[5] = (uint64_t *)a2;
  glActiveTexture(v6 + 33984);
  if (a2)
  {
    glTexParameteri(0xDE1u, 0x2802u, *((_DWORD *)a2 + 7));
    glTexParameteri(0xDE1u, 0x2803u, *((_DWORD *)a2 + 8));
    glTexParameteri(0xDE1u, 0x2801u, *((_DWORD *)a2 + 9));
    GLint v5 = *((_DWORD *)a2 + 10);
  }
  else
  {
    glTexParameteri(0xDE1u, 0x2802u, 33071);
    glTexParameteri(0xDE1u, 0x2803u, 33071);
    GLint v5 = 9729;
    glTexParameteri(0xDE1u, 0x2801u, 9729);
  }
  glTexParameteri(0xDE1u, 0x2800u, v5);
}

uint64_t jet_context_OpenGL::set_fragment_constant(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 264))();
}

{
  return (*(uint64_t (**)(void))(*(void *)a1 + 272))();
}

uint64_t jet_context_OpenGL::set_fragment_texture(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 280))();
}

uint64_t jet_context_OpenGL::set_fragment_sampler(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 288))();
}

void jet_context_OpenGL::draw(int a1, unsigned int a2, GLint first, GLsizei count)
{
  if (a2 > 4) {
    GLenum v4 = 4;
  }
  else {
    GLenum v4 = dword_21FAE8EDC[a2];
  }
  glDrawArrays(v4, first, count);
}

void jet_context_OpenGL::draw_indexed(uint64_t a1, unsigned int a2, _DWORD *a3, unsigned int a4, GLsizei a5)
{
  int v5 = a3[10];
  if ((v5 - 5) <= 0xFFFFFFFD) {
    jet_context_OpenGL::draw_indexed();
  }
  int v10 = a3[11];
  glBindBuffer(0x8893u, a3[26]);
  if (a2 > 4) {
    GLenum v11 = 4;
  }
  else {
    GLenum v11 = dword_21FAE8EDC[a2];
  }
  unsigned int v12 = a3[10] - 1;
  if (v12 > 7) {
    GLenum v13 = 5126;
  }
  else {
    GLenum v13 = dword_21FAE8EF0[v12];
  }
  if (v5 == 3) {
    char v14 = 1;
  }
  else {
    char v14 = 2;
  }

  glDrawElements(v11, a5, v13, (const GLvoid *)((v10 << v14) * (unint64_t)a4));
}

void jet_context_OpenGL::submit_commands(EAGLContext **a1, void *a2)
{
  id v3 = a2;
  glContextUse::glContextUse((glContextUse *)v4, a1[13]);
  jet_context::submit_commands((jet_context *)a1, v3);
  glContextUse::~glContextUse((glContextUse *)v4);
}

void sub_21FADA70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  glContextUse::~glContextUse((glContextUse *)&a9);

  _Unwind_Resume(a1);
}

void jet_context_OpenGL::submit_command_buffer(EAGLContext **this@<X0>, jet_command_buffer *a2@<X1>, std::__shared_weak_count **a3@<X8>)
{
  glContextUse::glContextUse((glContextUse *)v6, this[13]);
  jet_context::submit_command_buffer_impl((std::__shared_weak_count **)this, a2, a3);
  glContextUse::~glContextUse((glContextUse *)v6);
}

void sub_21FADA788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_context_OpenGL::present@<X0>(jet_context_OpenGL *this@<X0>, jet_texture *a2@<X1>, double a3@<D0>, void *a4@<X8>)
{
  v13[1] = *MEMORY[0x263EF8340];
  (*(void (**)(void *__return_ptr, double))(*(void *)this + 328))(a4, a3);
  GLuint v6 = *((_DWORD *)a2 + 5);
  if (!v6) {
    __assert_rtn("present", "jet_context_OpenGL.mm", 1530, "glTex->_gl_RenderbufferId");
  }
  glBindRenderbuffer(0x8D41u, v6);
  uint64_t v7 = *((void *)this + 2);
  if (!v7) {
    return objc_msgSend(*((id *)this + 13), "presentRenderbuffer:", 36161, v13[0]);
  }
  uint64_t v8 = *(void *)(v7 + 208);
  if (v8)
  {
    if (*(_DWORD *)(v7 + 224) == 1)
    {
      char v9 = 0;
      if (*((_DWORD *)this + 46)) {
        int v10 = 36096;
      }
      else {
        int v10 = 6145;
      }
      LODWORD(v13[0]) = v10;
      LODWORD(v8) = 1;
      goto LABEL_11;
    }
    LODWORD(v8) = 0;
  }
  char v9 = 1;
LABEL_11:
  if (*(void *)(v7 + 232) && *(_DWORD *)(v7 + 248) == 1)
  {
    if (*((_DWORD *)this + 46)) {
      int v11 = 36128;
    }
    else {
      int v11 = 6146;
    }
    *((_DWORD *)v13 + v8) = v11;
    goto LABEL_18;
  }
  if ((v9 & 1) == 0) {
LABEL_18:
  }
    glDiscardFramebufferEXT();
  return objc_msgSend(*((id *)this + 13), "presentRenderbuffer:", 36161, v13[0]);
}

void sub_21FADA904(_Unwind_Exception *exception_object)
{
  id v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void jet_context_OpenGL::commit(jet_context_OpenGL *this)
{
}

void sub_21FADA970(_Unwind_Exception *exception_object)
{
  id v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void jet_context_OpenGL::create_fence(jet_context_OpenGL *this)
{
}

void sub_21FADAA7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

id jet_context_OpenGL::ensureCIContext(jet_context_OpenGL *this)
{
  GLint v2 = (void *)*((void *)this + 12);
  if (!v2)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    GLenum v4 = [MEMORY[0x263EFF9D0] null];
    [v3 setValue:v4 forKey:*MEMORY[0x263F00858]];

    int v5 = [MEMORY[0x263EFF9D0] null];
    [v3 setValue:v5 forKey:*MEMORY[0x263F00838]];

    uint64_t v6 = [objc_alloc(MEMORY[0x263F00628]) initWithEAGLContext:*((void *)this + 13) options:v3];
    uint64_t v7 = (void *)*((void *)this + 12);
    *((void *)this + 12) = v6;

    GLint v2 = (void *)*((void *)this + 12);
  }

  return v2;
}

void sub_21FADAB80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_context_OpenGL::render_CIImage_to_texture(uint64_t a1, void *a2, uint64_t a3, __n128 a4)
{
  id v6 = a2;
  uint64_t v7 = (*(void (**)(uint64_t))(*(void *)a1 + 336))(a1);
  double v8 = (double)a4.n128_u32[0];
  double v9 = (double)a4.n128_u32[1];
  double v10 = (double)a4.n128_u32[2];
  double v11 = (double)a4.n128_u32[3];
  v20.origin.x = (double)a4.n128_u32[0];
  v20.origin.y = (double)a4.n128_u32[1];
  v20.size.width = (double)a4.n128_u32[2];
  v20.size.height = (double)a4.n128_u32[3];
  if (CGRectIsEmpty(v20))
  {
    [v6 extent];
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 176))(&v18, a1);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (a3) {
    uint64_t v16 = *(unsigned int *)(a3 + 16);
  }
  else {
    uint64_t v16 = 0;
  }
  objc_msgSend(v7, "render:toTexture:bounds:colorSpace:", v6, v16, 0, v8, v9, v10, v11, *(_OWORD *)&a4);
  (*(void (**)(uint64_t))(*(void *)a1 + 176))(a1);
}

void sub_21FADAD24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_CIImage_from_texture(jet_context_OpenGL *this, jet_texture *a2)
{
  id v3 = (void *)MEMORY[0x263F00650];
  if (a2) {
    uint64_t v4 = *((unsigned int *)a2 + 4);
  }
  else {
    uint64_t v4 = 0;
  }
  double v5 = (double)(**(unsigned int (***)(jet_texture *))a2)(a2);
  double v6 = (double)(*(unsigned int (**)(jet_texture *))(*(void *)a2 + 8))(a2);

  return objc_msgSend(v3, "imageWithTexture:size:flipped:colorSpace:", v4, 0, 0, v5, v6);
}

void jet_context_OpenGL::synchronize_OpenGL_state(jet_context_OpenGL *this)
{
  glContextUse::glContextUse((glContextUse *)v2, *((EAGLContext **)this + 13));
  glGetError();
  glBindFramebuffer(0x8D40u, *((_DWORD *)this + 46));
  glEnable(0xC11u);
  jet_context_OpenGL::set_blend_mode((uint64_t)this, *((_DWORD *)this + 47), 0);
  (*(void (**)(jet_context_OpenGL *, void))(*(void *)this + 192))(this, *((void *)this + 21));
  glContextUse::~glContextUse((glContextUse *)v2);
}

void sub_21FADAE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void jet_context_OpenGL::create_framebuffer_from_OpenGL_Framebuffer(jet_context_OpenGL *this)
{
}

void sub_21FADAF0C(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C4023D4BD15);
  _Unwind_Resume(a1);
}

uint64_t jet_context_OpenGL::create_texture_from_CIImage(jet_context_OpenGL *this, CIImage *a2)
{
  id v3 = a2;
  [(CIImage *)v3 extent];
  uint64_t texture_2d = jet_context::create_texture_2d((uint64_t)this, v4, v5, 3, 0, 0, 0);
  (*(void (**)(uint64_t *__return_ptr, jet_context_OpenGL *, CIImage *, uint64_t, __n128))(*(void *)this
                                                                                                  + 160))(&v8, this, v3, texture_2d, (__n128)0);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return texture_2d;
}

void sub_21FADAFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id jet_context_OpenGL::get_OpenGL_Context(id *this)
{
  return this[13];
}

void glContextUse::glContextUse(glContextUse *this, EAGLContext *a2)
{
  id v3 = a2;
  *(void *)this = [MEMORY[0x263F146E8] currentContext];
  double v4 = v3;
  *((void *)this + 1) = v4;
  if (*(EAGLContext **)this != v4) {
    [MEMORY[0x263F146E8] setCurrentContext:v4];
  }
}

void sub_21FADB068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void glContextUse::~glContextUse(glContextUse *this)
{
  GLint v2 = *(void **)this;
  if (*(void *)this != *((void *)this + 1))
  {
    objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:");
    GLint v2 = (void *)*((void *)this + 1);
  }
}

uint64_t jet_buffer_OpenGL::jet_buffer_OpenGL(uint64_t a1, void *a2, int a3, int a4, int a5, const GLvoid *a6)
{
  id v11 = a2;
  jet_buffer::jet_buffer((jet_buffer *)a1);
  *(void *)a1 = &unk_26D152A10;
  double v12 = (EAGLContext *)v11;
  *(void *)(a1 + 96) = v12;
  *(_DWORD *)(a1 + 108) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0;
  glContextUse::glContextUse((glContextUse *)v19, v12);
  if ((a3 - 1) > 7) {
    int v13 = 4;
  }
  else {
    int v13 = dword_21FAE8F10[a3 - 1];
  }
  GLuint buffers = 0;
  glGenBuffers(1, &buffers);
  GLuint v14 = buffers;
  *(_DWORD *)(a1 + 40) = a3;
  *(_DWORD *)(a1 + 44) = a4;
  *(_DWORD *)(a1 + 48) = a5;
  GLsizeiptr v15 = (a5 * a4 * v13);
  *(_DWORD *)(a1 + 104) = v14;
  *(_DWORD *)(a1 + 108) = v15;
  if (a6)
  {
    if (a4 == 1 && (a3 - 2) <= 2)
    {
      GLenum v16 = 34963;
      glBindBuffer(0x8893u, v14);
    }
    else
    {
      GLenum v16 = 34962;
      glBindBuffer(0x8892u, v14);
    }
    glBufferData(v16, v15, a6, 0x88E0u);
    *(unsigned char *)(a1 + 112) = 1;
  }
  glContextUse::~glContextUse((glContextUse *)v19);

  return a1;
}

void sub_21FADB228(_Unwind_Exception *a1)
{
  jet_buffer::~jet_buffer((dispatch_semaphore_t *)v1);
  _Unwind_Resume(a1);
}

uint64_t jet_buffer_OpenGL::get_length(jet_buffer_OpenGL *this)
{
  return *((unsigned int *)this + 27);
}

_DWORD *jet_buffer_OpenGL::set_data(_DWORD *this, const void *a2, unsigned int a3, uint64_t a4)
{
  if (a2)
  {
    double v5 = this;
    unsigned int v6 = this[27];
    if (a3) {
      size_t v7 = a3;
    }
    else {
      size_t v7 = v6;
    }
    if ((int)v7 + (int)a4 > v6) {
      jet_buffer_OpenGL::set_data();
    }
    uint64_t v9 = (*(uint64_t (**)(_DWORD *))(*(void *)this + 16))(this);
    memcpy((void *)(v9 + a4), a2, v7);
    double v10 = *(uint64_t (**)(_DWORD *, size_t, uint64_t))(*(void *)v5 + 24);
    return (_DWORD *)v10(v5, v7, a4);
  }
  return this;
}

void *jet_buffer_OpenGL::get_data(jet_buffer_OpenGL *this)
{
  __n128 result = (void *)*((void *)this + 15);
  if (!result)
  {
    unsigned int v3 = (**(uint64_t (***)(jet_buffer_OpenGL *))this)(this);
    __n128 result = malloc_type_malloc(v3, 0xA39FA485uLL);
    *((void *)this + 15) = result;
  }
  return result;
}

void jet_buffer_OpenGL::commit_data(jet_buffer_OpenGL *this, unsigned int a2, int a3)
{
  uint64_t v6 = (*(uint64_t (**)(jet_buffer_OpenGL *))(*(void *)this + 16))(this);
  unsigned int v7 = *((_DWORD *)this + 27);
  if (a2) {
    size_t v8 = a2;
  }
  else {
    size_t v8 = v7;
  }
  if ((int)v8 + a3 > v7) {
    jet_buffer_OpenGL::commit_data();
  }
  uint64_t v9 = (char *)v6;
  glContextUse::glContextUse((glContextUse *)v13, *((EAGLContext **)this + 12));
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 2) {
    GLenum v10 = 34963;
  }
  else {
    GLenum v10 = 34962;
  }
  glBindBuffer(v10, *((_DWORD *)this + 26));
  if (!*((unsigned char *)this + 112))
  {
    *((unsigned char *)this + 112) = 1;
    GLsizeiptr v11 = *((unsigned int *)this + 27);
    if (!a3 && v8 == v11)
    {
      glBufferData(v10, v8, v9, 0x88E8u);
      goto LABEL_18;
    }
    glBufferData(v10, v11, 0, 0x88E8u);
  }
  if (a3 || v8 != *((_DWORD *)this + 27))
  {
    double v12 = (void *)glMapBufferRangeEXT();
    memcpy(v12, &v9[a3], v8);
    glUnmapBufferOES();
  }
  else
  {
    glBufferData(v10, v8, v9, 0x88E8u);
  }
  glBindBuffer(v10, 0);
LABEL_18:
  glContextUse::~glContextUse((glContextUse *)v13);
}

void sub_21FADB500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void jet_buffer_OpenGL::resize(jet_buffer_OpenGL *this, int a2)
{
  unsigned int v4 = *((_DWORD *)this + 10) - 1;
  if (v4 > 7) {
    int v5 = 4;
  }
  else {
    int v5 = dword_21FAE8F10[v4];
  }
  size_t v6 = (v5 * a2 * *((_DWORD *)this + 11));
  if (*((void *)this + 15))
  {
    unsigned int v7 = malloc_type_malloc(v6, 0x35DE276AuLL);
    size_t v8 = v7;
    unsigned int v9 = *((_DWORD *)this + 27);
    if (v6 >= v9) {
      size_t v10 = v9;
    }
    else {
      size_t v10 = v6;
    }
    memcpy(v7, *((const void **)this + 15), v10);
    free(*((void **)this + 15));
    *((void *)this + 15) = v8;
  }
  *((unsigned char *)this + 112) = 0;
  *((_DWORD *)this + 27) = v6;
  *((_DWORD *)this + 12) = a2;
}

void jet_buffer_OpenGL::~jet_buffer_OpenGL(jet_buffer_OpenGL *this)
{
  jet_buffer_OpenGL::~jet_buffer_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  EAGLContext *v2;
  void *v3;
  GLuint buffers;
  unsigned char v5[16];

  *(void *)this = &unk_26D152A10;
  GLint v2 = (EAGLContext *)*((void *)this + 12);
  if (v2 && *((_DWORD *)this + 26))
  {
    glContextUse::glContextUse((glContextUse *)v5, v2);
    GLuint buffers = *((_DWORD *)this + 26);
    glDeleteBuffers(1, &buffers);
    *((_DWORD *)this + 26) = 0;
    glContextUse::~glContextUse((glContextUse *)v5);
  }
  unsigned int v3 = (void *)*((void *)this + 15);
  if (v3) {
    free(v3);
  }

  jet_buffer::~jet_buffer((dispatch_semaphore_t *)this);
}

uint64_t jet_buffer_OpenGL::set_value(jet_buffer_OpenGL *this, float a2)
{
  float v3 = a2;
  return (*(uint64_t (**)(jet_buffer_OpenGL *, float *, uint64_t, void))(*(void *)this + 8))(this, &v3, 4, 0);
}

uint64_t jet_buffer_OpenGL::set_value(uint64_t a1, double a2)
{
  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 8, 0);
}

uint64_t jet_buffer_OpenGL::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 16, 0);
}

{
  __n128 v3;

  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 16, 0);
}

uint64_t jet_buffer_OpenGL::set_value(jet_buffer_OpenGL *this, __int16 a2)
{
  __int16 v3 = a2;
  return (*(uint64_t (**)(jet_buffer_OpenGL *, __int16 *, uint64_t, void))(*(void *)this + 8))(this, &v3, 2, 0);
}

uint64_t jet_buffer_OpenGL::set_value(uint64_t a1, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 4, 0);
}

jet_buffer_pool *jet_buffer_pool_OpenGL::jet_buffer_pool_OpenGL(jet_buffer_pool *a1, void *a2, int a3, int a4, int a5)
{
  id v9 = a2;
  jet_buffer_pool::jet_buffer_pool((uint64_t)a1, a3, a4, a5);
  *(void *)a1 = &unk_26D152AB0;
  id v10 = v9;
  *((void *)a1 + 8) = v10;
  jet_buffer_pool::initialize_first_buffer(a1);

  return a1;
}

void sub_21FADB9A4(_Unwind_Exception *a1)
{
  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)v2);
  _Unwind_Resume(a1);
}

void jet_buffer_pool_OpenGL::~jet_buffer_pool_OpenGL(id *this)
{
  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);
}

{
  uint64_t vars8;

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);

  JUMPOUT(0x223C592E0);
}

void jet_buffer_pool_OpenGL::create_buffer(jet_buffer_pool_OpenGL *this)
{
}

void sub_21FADBAAC(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C402150694FLL);
  _Unwind_Resume(a1);
}

uint64_t jet_constant_OpenGL::get_length(jet_constant_OpenGL *this)
{
  return *((unsigned int *)this + 5);
}

uint64_t jet_constant::get_type(jet_constant *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t jet_constant::get_components_per_element(jet_constant *this)
{
  return *((unsigned int *)this + 3);
}

uint64_t jet_constant::get_element_count(jet_constant *this)
{
  return *((unsigned int *)this + 4);
}

void *jet_constant_OpenGL::set_data(void **this, const void *a2, size_t __n)
{
  return memcpy(this[3], a2, __n);
}

void *jet_constant_OpenGL::copy_data(const void **this, void *__dst, size_t __n)
{
  return memcpy(__dst, this[3], __n);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, float a2)
{
  float v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, float *, uint64_t))(*(void *)this + 32))(this, &v3, 4);
}

uint64_t jet_constant_OpenGL::set_value(uint64_t a1, double a2)
{
  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 8);
}

uint64_t jet_constant_OpenGL::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 16);
}

{
  __n128 v3;

  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 16);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, simd_float2x2 a2)
{
  simd_float2x2 v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, simd_float2x2 *, uint64_t))(*(void *)this + 32))(this, &v3, 16);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, simd_float3x3 a2)
{
  simd_float3x3 v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, simd_float3x3 *, uint64_t))(*(void *)this + 32))(this, &v3, 48);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, simd_float4x4 a2)
{
  simd_float4x4 v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, simd_float4x4 *, uint64_t))(*(void *)this + 32))(this, &v3, 64);
}

void jet_constant_OpenGL::~jet_constant_OpenGL(jet_constant_OpenGL *this)
{
  jet_constant_OpenGL::~jet_constant_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26D152AF8;
  GLint v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    free(v2);
    *((void *)this + 3) = 0;
  }

  jet_constant::~jet_constant(this);
}

uint64_t jet_constant_OpenGL::set_value(jet_constant_OpenGL *this, __int16 a2)
{
  __int16 v3 = a2;
  return (*(uint64_t (**)(jet_constant_OpenGL *, __int16 *, uint64_t))(*(void *)this + 32))(this, &v3, 2);
}

uint64_t jet_constant_OpenGL::set_value(uint64_t a1, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 4);
}

void jet_texture_OpenGL::jet_texture_OpenGL(jet_texture_OpenGL *this, EAGLContext *a2)
{
  int v3 = a2;
  jet_texture::jet_texture(this);
  *(void *)this = &unk_26D152BB8;
  *((void *)this + 1) = v3;
  *(_WORD *)((char *)this + 45) = 256;
}

void sub_21FADBEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_texture_OpenGL::get_width(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 8);
}

uint64_t jet_texture_OpenGL::get_height(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 9);
}

uint64_t jet_texture_OpenGL::get_depth(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 10);
}

uint64_t jet_texture_OpenGL::get_type(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 7);
}

uint64_t jet_texture_OpenGL::get_format(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t jet_texture_OpenGL::get_mip_mapped(jet_texture_OpenGL *this)
{
  return *((unsigned __int8 *)this + 44);
}

uint64_t jet_texture_OpenGL::get_slice_count(jet_texture_OpenGL *this)
{
  return *((unsigned int *)this + 12);
}

void jet_texture_OpenGL::set_data(EAGLContext **this, const void *a2, GLint a3, unsigned int a4, GLint a5)
{
  if (((unsigned int (*)(EAGLContext **))(*this)[5]._private)(this)) {
    jet_texture_OpenGL::set_data();
  }
  glContextUse::glContextUse((glContextUse *)v20, this[1]);
  if (*((_DWORD *)this + 7) == 2) {
    GLenum v10 = 34067;
  }
  else {
    GLenum v10 = 3553;
  }
  glBindTexture(v10, *((_DWORD *)this + 4));
  if (a5) {
    glPixelStorei(0xCF2u, a5);
  }
  glPixelStorei(0xCF5u, 1);
  if (*((_DWORD *)this + 7) == 2)
  {
    if (a4 >= 6) {
      __assert_rtn("set_data", "jet_types_OpenGL.h", 381, "slice_index <= 5");
    }
    int v11 = *((_DWORD *)this + 6) - 1;
    if (v11 > 0xC) {
      GLint v12 = 0;
    }
    else {
      GLint v12 = dword_21FAE8F30[v11];
    }
    GLsizei v14 = ((uint64_t (*)(EAGLContext **))(*this)->super.isa)(this);
    GLsizei v15 = ((uint64_t (*)(EAGLContext **))(*this)->_private)(this);
    GLenum v18 = a4 + 34069;
    int v16 = *((_DWORD *)this + 6);
    GLenum v17 = 6403;
    switch(v16)
    {
      case 1:
        break;
      case 2:
        goto LABEL_22;
      case 3:
      case 5:
      case 10:
        goto LABEL_17;
      case 4:
      case 6:
        goto LABEL_19;
      case 11:
        goto LABEL_23;
      case 12:
        goto LABEL_20;
      case 13:
        goto LABEL_21;
      default:
        goto LABEL_18;
    }
  }
  else
  {
    int v13 = *((_DWORD *)this + 6) - 1;
    if (v13 > 0xC) {
      GLint v12 = 0;
    }
    else {
      GLint v12 = dword_21FAE8F30[v13];
    }
    GLsizei v14 = ((uint64_t (*)(EAGLContext **))(*this)->super.isa)(this);
    GLsizei v15 = ((uint64_t (*)(EAGLContext **))(*this)->_private)(this);
    int v16 = *((_DWORD *)this + 6);
    GLenum v17 = 6403;
    GLenum v18 = 3553;
    switch(v16)
    {
      case 1:
        break;
      case 2:
LABEL_22:
        GLenum v17 = 33319;
        break;
      case 3:
      case 5:
      case 10:
LABEL_17:
        GLenum v17 = 6408;
        break;
      case 4:
      case 6:
LABEL_19:
        GLenum v17 = 32993;
        break;
      case 7:
      case 8:
      case 9:
LABEL_18:
        GLenum v17 = 0;
        break;
      case 11:
LABEL_23:
        GLenum v17 = 35056;
        break;
      case 12:
LABEL_20:
        GLenum v17 = 36168;
        break;
      case 13:
LABEL_21:
        GLenum v17 = 33189;
        break;
      default:
        GLenum v17 = 0;
        GLenum v18 = 3553;
        break;
    }
  }
  if (v16 == 10) {
    GLenum v19 = 5126;
  }
  else {
    GLenum v19 = 5121;
  }
  glTexImage2D(v18, a3, v12, v14, v15, 0, v17, v19, a2);
  if (a5) {
    glPixelStorei(0xCF2u, 0);
  }
  glContextUse::~glContextUse((glContextUse *)v20);
}

void sub_21FADC218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

void jet_texture_OpenGL::replace_region(EAGLContext **this, const void *a2, unsigned int a3, unsigned int a4, GLint a5, GLint a6, unsigned int a7, GLsizei a8, GLsizei height, unsigned int a10, GLint param, unsigned int a12)
{
  if (((unsigned int (*)(EAGLContext **))(*this)[5]._private)(this)) {
    jet_texture_OpenGL::replace_region();
  }
  glContextUse::glContextUse((glContextUse *)v23, this[1]);
  if (*((_DWORD *)this + 7) == 2) {
    GLenum v18 = 34067;
  }
  else {
    GLenum v18 = 3553;
  }
  glBindTexture(v18, *((_DWORD *)this + 4));
  if (param) {
    glPixelStorei(0xCF2u, param);
  }
  glPixelStorei(0xCF5u, 1);
  if (*((_DWORD *)this + 7) == 2)
  {
    if (a4 >= 6) {
      __assert_rtn("replace_region", "jet_types_OpenGL.h", 431, "slice_index <= 5");
    }
    GLenum v19 = a4 + 34069;
    int v20 = *((_DWORD *)this + 6);
    GLenum v21 = 6403;
    switch(v20)
    {
      case 1:
        break;
      case 2:
        GLenum v21 = 33319;
        break;
      case 3:
      case 5:
      case 10:
        GLenum v21 = 6408;
        break;
      case 4:
      case 6:
        GLenum v21 = 32993;
        break;
      case 11:
        GLenum v21 = 35056;
        break;
      case 12:
        GLenum v21 = 36168;
        break;
      case 13:
        GLenum v21 = 33189;
        break;
      default:
        GLenum v21 = 0;
        break;
    }
  }
  else
  {
    int v20 = *((_DWORD *)this + 6);
    if ((v20 - 1) > 0xC) {
      GLenum v21 = 0;
    }
    else {
      GLenum v21 = dword_21FAE8F64[v20 - 1];
    }
    GLenum v19 = 3553;
  }
  if (v20 == 10) {
    GLenum v22 = 5126;
  }
  else {
    GLenum v22 = 5121;
  }
  glTexSubImage2D(v19, 0, a5, a6, a8, height, v21, v22, a2);
  if (param) {
    glPixelStorei(0xCF2u, 0);
  }
  glContextUse::~glContextUse((glContextUse *)v23);
}

void sub_21FADC474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

void jet_texture_OpenGL::copy_data(jet_texture_OpenGL *this, void *a2, GLint a3, unsigned int a4)
{
  glContextUse::glContextUse((glContextUse *)v15, *((EAGLContext **)this + 1));
  *(void *)GLBOOLean params = 0;
  glGetIntegerv(0x8CA6u, &params[1]);
  glGenFramebuffers(1, (GLuint *)params);
  glBindFramebuffer(0x8D40u, params[0]);
  GLuint v8 = *((_DWORD *)this + 5);
  if (v8)
  {
    glBindRenderbuffer(0x8D41u, v8);
    glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *((_DWORD *)this + 5));
  }
  else
  {
    if (*((_DWORD *)this + 7) == 2) {
      GLenum v9 = 34067;
    }
    else {
      GLenum v9 = 3553;
    }
    glBindTexture(v9, *((_DWORD *)this + 4));
    if (*((_DWORD *)this + 7) == 2)
    {
      if (a4 >= 6) {
        abort();
      }
      GLenum v10 = a4 + 34069;
    }
    else
    {
      GLenum v10 = 3553;
    }
    glFramebufferTexture2D(0x8D40u, 0x8CE0u, v10, *((_DWORD *)this + 4), a3);
  }
  glPixelStorei(0xCF5u, 1);
  int v11 = *((_DWORD *)this + 6);
  if ((v11 - 1) > 0xC) {
    GLenum v12 = 0;
  }
  else {
    GLenum v12 = dword_21FAE8F64[v11 - 1];
  }
  if (v11 == 10) {
    GLenum v13 = 5126;
  }
  else {
    GLenum v13 = 5121;
  }
  glReadPixels(0, 0, *((_DWORD *)this + 8), *((_DWORD *)this + 9), v12, v13, a2);
  glBindFramebuffer(0x8D40u, params[1]);
  glDeleteFramebuffers(1, (const GLuint *)params);
  glContextUse::~glContextUse((glContextUse *)v15);
}

void sub_21FADC624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  glContextUse::~glContextUse((glContextUse *)va);
  _Unwind_Resume(a1);
}

BOOL jet_texture_OpenGL::generate_mip_map(EAGLContext **this)
{
  unsigned int v2 = ((uint64_t (*)(EAGLContext **))(*this)->super.isa)(this);
  unsigned int v3 = ((uint64_t (*)(EAGLContext **))(*this)->_private)(this);
  BOOL isPOT = jet_util_isPOT(v2, v3);
  if (isPOT)
  {
    glContextUse::glContextUse((glContextUse *)v8, this[1]);
    if (*((_DWORD *)this + 7) == 2) {
      GLenum v5 = 34067;
    }
    else {
      GLenum v5 = 3553;
    }
    glBindTexture(v5, *((_DWORD *)this + 4));
    if (*((_DWORD *)this + 7) == 2) {
      GLenum v6 = 34067;
    }
    else {
      GLenum v6 = 3553;
    }
    glGenerateMipmap(v6);
    glContextUse::~glContextUse((glContextUse *)v8);
  }
  return isPOT;
}

void sub_21FADC710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_texture_OpenGL::is_color_attachment_compatible(jet_texture_OpenGL *this)
{
  if (*((unsigned char *)this + 45)) {
    return 0;
  }
  else {
    return jet_texture::is_color_attachment_compatible(this);
  }
}

BOOL jet_texture_OpenGL::is_depth_attachment_compatible(jet_texture_OpenGL *this)
{
  return !*((unsigned char *)this + 45) && jet_texture::is_depth_attachment_compatible(this);
}

BOOL jet_texture_OpenGL::is_stencil_attachment_compatible(jet_texture_OpenGL *this)
{
  return !*((unsigned char *)this + 45) && jet_texture::is_stencil_attachment_compatible(this);
}

void jet_texture_OpenGL::~jet_texture_OpenGL(jet_texture_OpenGL *this)
{
  jet_texture_OpenGL::~jet_texture_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  EAGLContext *v2;
  unsigned char v3[16];

  *(void *)this = &unk_26D152BB8;
  unsigned int v2 = (EAGLContext *)*((void *)this + 1);
  if (v2 && *((unsigned char *)this + 46))
  {
    glContextUse::glContextUse((glContextUse *)v3, v2);
    if (*((_DWORD *)this + 4))
    {
      glDeleteTextures(1, (const GLuint *)this + 4);
      *((_DWORD *)this + 4) = 0;
    }
    if (*((_DWORD *)this + 5))
    {
      glDeleteRenderbuffers(1, (const GLuint *)this + 5);
      *((_DWORD *)this + 5) = 0;
    }
    glContextUse::~glContextUse((glContextUse *)v3);
    unsigned int v2 = (EAGLContext *)*((void *)this + 1);
  }

  jet_texture::~jet_texture(this);
}

void jet_sampler_OpenGL::~jet_sampler_OpenGL(jet_sampler_OpenGL *this)
{
  jet_sampler::~jet_sampler(this);

  JUMPOUT(0x223C592E0);
}

void jet_function_OpenGL::~jet_function_OpenGL(jet_function_OpenGL *this)
{
  jet_function_OpenGL::~jet_function_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  EAGLContext *v2;
  unsigned char v3[16];

  *(void *)this = &unk_26D152C88;
  unsigned int v2 = (EAGLContext *)*((void *)this + 1);
  if (v2 && *((_DWORD *)this + 4))
  {
    glContextUse::glContextUse((glContextUse *)v3, v2);
    glDeleteShader(*((_DWORD *)this + 4));
    *((_DWORD *)this + 4) = 0;
    glContextUse::~glContextUse((glContextUse *)v3);
    unsigned int v2 = (EAGLContext *)*((void *)this + 1);
  }
}

void jet_program_OpenGL::jet_program_OpenGL(jet_program_OpenGL *this, EAGLContext *a2, xglProgram *a3)
{
  GLenum v5 = a2;
  jet_program::jet_program(this);
  *(void *)this = &unk_26D152CD0;
  *((void *)this + 4) = v5;
  *((void *)this + 5) = a3;
}

void sub_21FADC9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_program_OpenGL::~jet_program_OpenGL(jet_program_OpenGL *this)
{
  jet_program_OpenGL::~jet_program_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  xglProgram *v2;
  uint64_t vars8;

  *(void *)this = &unk_26D152CD0;
  unsigned int v2 = (xglProgram *)*((void *)this + 5);
  if (v2)
  {
    xglProgram::~xglProgram(v2);
    MEMORY[0x223C592E0]();
  }

  jet_program::~jet_program(this);
}

void jet_render_mode_OpenGL::~jet_render_mode_OpenGL(jet_render_mode_OpenGL *this)
{
  *(void *)this = &unk_26D152D08;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 1;

  jet_render_mode::~jet_render_mode(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26D152D08;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 1;

  jet_render_mode::~jet_render_mode(this);

  JUMPOUT(0x223C592E0);
}

uint64_t jet_render_mode_OpenGL::get_vertex_buffer_index(uint64_t a1, char *a2)
{
  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = *(char **)a2;
  }
  uint64_t AttributeIndex = xglProgram::getAttributeIndex(*(xglProgram **)(*(void *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return AttributeIndex;
}

void sub_21FADCBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_render_mode_OpenGL::get_vertex_constant_index(uint64_t a1, char *a2)
{
  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = *(char **)a2;
  }
  uint64_t UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(void *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_21FADCC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_render_mode_OpenGL::get_vertex_texture_index(uint64_t a1, char *a2)
{
  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = *(char **)a2;
  }
  uint64_t UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(void *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_21FADCC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_render_mode_OpenGL::get_vertex_sampler_index(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

uint64_t jet_render_mode_OpenGL::get_fragment_constant_index(uint64_t a1, char *a2)
{
  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = *(char **)a2;
  }
  uint64_t UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(void *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_21FADCD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_render_mode_OpenGL::get_fragment_texture_index(uint64_t a1, char *a2)
{
  glContextUse::glContextUse((glContextUse *)v7, *(EAGLContext **)(a1 + 40));
  if (a2[23] >= 0) {
    unsigned int v4 = a2;
  }
  else {
    unsigned int v4 = *(char **)a2;
  }
  uint64_t UniformLocation = xglProgram::getUniformLocation(*(xglProgram **)(*(void *)(a1 + 8) + 40), v4);
  glContextUse::~glContextUse((glContextUse *)v7);
  return UniformLocation;
}

void sub_21FADCDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t jet_render_mode_OpenGL::get_fragment_sampler_index(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 56))();
}

void jet_render_mode_OpenGL::clone(jet_render_mode_OpenGL *this)
{
}

void jet_stencil_mode_OpenGL::~jet_stencil_mode_OpenGL(jet_stencil_mode_OpenGL *this)
{
  jet_stencil_mode::~jet_stencil_mode(this);

  JUMPOUT(0x223C592E0);
}

void jet_depth_stencil_mode_OpenGL::~jet_depth_stencil_mode_OpenGL(jet_depth_stencil_mode_OpenGL *this)
{
  jet_depth_stencil_mode_OpenGL::~jet_depth_stencil_mode_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26D152DB8;
  unsigned int v2 = *((void *)this + 2);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unsigned int v3 = *((void *)this + 3);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }

  jet_depth_stencil_mode::~jet_depth_stencil_mode(this);
}

BOOL jet_fence_OpenGL::is_finished(jet_fence_OpenGL *this)
{
  if (!*((void *)this + 2)) {
    return 1;
  }
  glContextUse::glContextUse((glContextUse *)v5, *((EAGLContext **)this + 1));
  int v2 = (glClientWaitSyncAPPLE() - 37146) & 0xFFFFFFFD;
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    glDeleteSyncAPPLE();
    *((void *)this + 2) = 0;
  }
  glContextUse::~glContextUse((glContextUse *)v5);
  return v3;
}

void sub_21FADD054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL jet_fence_OpenGL::wait(jet_fence_OpenGL *this)
{
  if (!*((void *)this + 2)) {
    return 1;
  }
  glContextUse::glContextUse((glContextUse *)v5, *((EAGLContext **)this + 1));
  int v2 = (glClientWaitSyncAPPLE() - 37146) & 0xFFFFFFFD;
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    glDeleteSyncAPPLE();
    *((void *)this + 2) = 0;
  }
  glContextUse::~glContextUse((glContextUse *)v5);
  return v3;
}

void sub_21FADD0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void jet_fence_OpenGL::~jet_fence_OpenGL(jet_fence_OpenGL *this)
{
  jet_fence_OpenGL::~jet_fence_OpenGL(this);

  JUMPOUT(0x223C592E0);
}

{
  EAGLContext *v2;
  unsigned char v3[16];

  *(void *)this = &unk_26D152DF0;
  int v2 = (EAGLContext *)*((void *)this + 1);
  if (v2 && *((void *)this + 2))
  {
    glContextUse::glContextUse((glContextUse *)v3, v2);
    glDeleteSyncAPPLE();
    *((void *)this + 2) = 0;
    glContextUse::~glContextUse((glContextUse *)v3);
    int v2 = (EAGLContext *)*((void *)this + 1);
  }

  jet_fence::~jet_fence(this);
}

void jet_framebuffer_OpenGL::jet_framebuffer_OpenGL(jet_framebuffer_OpenGL *this)
{
  *((_DWORD *)this + 54) = 1065353216;
  *(void *)((char *)this + 220) = 0x100000001;
  *((void *)this + 29) = 0;
  *((void *)this + 30) = 0x100000000;
  *((_DWORD *)this + 62) = 1;
  *((void *)this + 2) = 0;
  *((_OWORD *)this + 2) = xmmword_21FAE8BE0;
  *((void *)this + 6) = 1;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((_OWORD *)this + 5) = xmmword_21FAE8BE0;
  *((_DWORD *)this + 24) = 1;
  *(void *)((char *)this + 100) = 0;
  *(void *)((char *)this + 116) = 0;
  *(void *)((char *)this + 108) = 0;
  *((_DWORD *)this + 31) = 0;
  *((_OWORD *)this + 8) = xmmword_21FAE8BE0;
  *((_DWORD *)this + 36) = 1;
  *(void *)((char *)this + 156) = 0;
  *(void *)((char *)this + 148) = 0;
  *((_DWORD *)this + 43) = 0;
  *(void *)((char *)this + 164) = 0;
  *((_OWORD *)this + 11) = xmmword_21FAE8BE0;
  *((void *)this + 24) = 1;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *(void *)this = &unk_26D152E38;
  *((void *)this + 32) = 0;
  *((_DWORD *)this + 66) = -1;
}

void jet_framebuffer_OpenGL::~jet_framebuffer_OpenGL(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x223C592E0);
}

void jet_framebuffer_OpenGL::clone(jet_framebuffer_OpenGL *this)
{
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, unsigned int **a4)
{
  unsigned int v7 = a1 + 1;
  GLenum v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        GLenum v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        GLenum v6 = *v9;
        unsigned int v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      GLenum v6 = v9[1];
      if (!v6)
      {
        unsigned int v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    GLenum v9 = a1 + 1;
LABEL_10:
    int v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t **std::__tree<std::__value_type<unsigned int,jet_sampler *>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,jet_sampler *>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,jet_sampler *>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unsigned int v7 = a1 + 1;
  GLenum v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        GLenum v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        GLenum v6 = *v9;
        unsigned int v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      GLenum v6 = v9[1];
      if (!v6)
      {
        unsigned int v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    GLenum v9 = a1 + 1;
LABEL_10:
    int v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void std::shared_ptr<jet_fence_OpenGL>::shared_ptr[abi:ne180100]<jet_fence_OpenGL,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_21FADD5D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<jet_fence_OpenGL>::shared_ptr[abi:ne180100]<jet_fence_OpenGL,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<jet_fence_OpenGL *,std::shared_ptr<jet_fence_OpenGL>::__shared_ptr_default_delete<jet_fence_OpenGL,jet_fence_OpenGL>,std::allocator<jet_fence_OpenGL>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C592E0);
}

uint64_t std::__shared_ptr_pointer<jet_fence_OpenGL *,std::shared_ptr<jet_fence_OpenGL>::__shared_ptr_default_delete<jet_fence_OpenGL,jet_fence_OpenGL>,std::allocator<jet_fence_OpenGL>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<jet_fence_OpenGL *,std::shared_ptr<jet_fence_OpenGL>::__shared_ptr_default_delete<jet_fence_OpenGL,jet_fence_OpenGL>,std::allocator<jet_fence_OpenGL>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t jet_context_Metal::jet_context_Metal(uint64_t a1, void *a2)
{
  id v3 = a2;
  jet_context::jet_context((jet_context *)a1);
  *(void *)a1 = &unk_26D152ED8;
  id v4 = v3;
  GLenum v5 = 0;
  *(void *)(a1 + 104) = v4;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 144) = 0;
  if (!v4)
  {
    uint64_t v6 = jet_choose_Metal_Device();
    unsigned int v7 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v6;

    GLenum v5 = *(void **)(a1 + 112);
  }
  *(void *)(a1 + 112) = 0;

  unsigned int v8 = *(void **)(a1 + 120);
  *(void *)(a1 + 120) = 0;

  GLenum v9 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = 0;

  unsigned int v10 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = 0;

  *(void *)(a1 + 16) = 0;
  return a1;
}

void sub_21FADD7B0(_Unwind_Exception *a1)
{
  jet_context::~jet_context((jet_context *)v1);
  _Unwind_Resume(a1);
}

void jet_context_Metal::~jet_context_Metal(id *this)
{
  jet_context::~jet_context((jet_context *)this);
}

{
  uint64_t vars8;

  jet_context_Metal::~jet_context_Metal(this);

  JUMPOUT(0x223C592E0);
}

uint64_t jet_context_Metal::get_context_type(jet_context_Metal *this)
{
  return 1;
}

void jet_context_Metal::create_buffer()
{
}

void sub_21FADD924(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C405BB150DBLL);
  _Unwind_Resume(a1);
}

void jet_context_Metal::create_buffer_pool()
{
}

void sub_21FADD9B8(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C40EB43BACFLL);
  _Unwind_Resume(a1);
}

void jet_context_Metal::create_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  if ((a2 - 1) > 7) {
    int v5 = 4;
  }
  else {
    int v5 = dword_21FAE9310[a2 - 1];
  }
  int v6 = a4 * a3;
  uint64_t v7 = (a4 * a3 * v5);
  unsigned int v8 = *(void **)(a1 + 104);
  if (a5) {
    [v8 newBufferWithBytes:a5 length:v7 options:0];
  }
  else {
    [v8 newBufferWithLength:(v6 * v5) options:0];
  }
  operator new();
}

void sub_21FADDAB0(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v2, 0x1081C40D47BEB4BLL);

  _Unwind_Resume(a1);
}

void jet_context_Metal::create_framebuffer_from_Metal_Encoder(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  operator new();
}

void sub_21FADDB60(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v3, 0x10A1C40F8985CBBLL);

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_texture(uint64_t a1, unsigned int a2, int a3, unsigned int a4, unsigned int a5, int a6, int a7, int a8, char a9, uint64_t a10)
{
  if (a6 != 1) {
    jet_context_Metal::create_texture();
  }
  if (a8 != 1) {
    jet_context_Metal::create_texture();
  }
  if (a3 == 11)
  {
    if (a7) {
      jet_context_Metal::create_texture();
    }
    if (a10) {
      jet_context_Metal::create_texture();
    }
    if (a2 >= 2) {
      jet_context_Metal::create_texture();
    }
    int v11 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:260 width:a4 height:a5 mipmapped:0];
    [v11 pixelFormat];
    [v11 setStorageMode:0];
    [v11 setUsage:a9 & 7];
    GLenum v12 = (void *)[*(id *)(a1 + 104) newTextureWithDescriptor:v11];
    if (v12) {
      operator new();
    }
  }
  else
  {
    if (a2 == 2)
    {
      if (a4 != a5) {
        __assert_rtn("create_texture", "jet_context_Metal.mm", 614, "width == height");
      }
      GLenum v13 = [MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:getMetalPixelFormat(a3) size:a4 mipmapped:a7 != 0];
    }
    else
    {
      GLenum v13 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:getMetalPixelFormat(a3) width:a4 height:a5 mipmapped:a7 != 0];
    }
    int v11 = v13;
    [v13 pixelFormat];
    [v11 setStorageMode:0];
    [v11 setUsage:a9 & 7];
    GLenum v12 = (void *)[*(id *)(a1 + 104) newTextureWithDescriptor:v11];
    if (v12) {
      operator new();
    }
  }

  return 0;
}

void sub_21FADDE80(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v3, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

uint64_t getMetalPixelFormat(int a1)
{
  if ((a1 - 1) > 0xD) {
    return 0;
  }
  else {
    return *(void *)&asc_21FAE9238[8 * a1 - 8];
  }
}

void jet_context_Metal::create_texture_from_IOSurface(uint64_t a1, IOSurfaceID csid, unsigned int a3, unsigned int a4, int a5, unsigned int a6)
{
  IOSurfaceRef v11 = IOSurfaceLookup(csid);
  uint64_t v12 = a6;
  if ((IOSurfaceGetBytesPerRowOfPlane(v11, a6) & 0xF) == 0)
  {
    GLenum v13 = objc_opt_new();
    [v13 setWidth:a3];
    [v13 setHeight:a4];
    [v13 setPixelFormat:getMetalPixelFormat(a5)];
    [v13 setUsage:0];
    [*(id *)(a1 + 104) newTextureWithDescriptor:v13 iosurface:v11 plane:v12];
    CFRelease(v11);
    operator new();
  }
  jet_context_Metal::create_texture_from_IOSurface();
}

void sub_21FADE034(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v2, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

void jet_context_Metal::override_Metal_render_state(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v14 = a2;
  id v7 = a3;
  if (v14)
  {
    id v8 = v14;
    GLenum v9 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v8;
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 104) newCommandQueue];
    IOSurfaceRef v11 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v10;

    uint64_t v12 = *(void **)(a1 + 120);
    GLenum v9 = jet_getClientLabel();
    [v12 setLabel:v9];
  }

  jet_context_Metal::ensureCommandBuffer(a1, 1);
  GLenum v13 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = v7;

  *(void *)(a1 + 16) = a4;
}

void sub_21FADE144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::ensureCommandBuffer(uint64_t this, int a2)
{
  if (*(void *)(this + 128)) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    uint64_t v3 = this;
    uint64_t v4 = [*(id *)(this + 120) commandBuffer];
    id v5 = *(void **)(v3 + 128);
    *(void *)(v3 + 128) = v4;

    int v6 = *(void **)(v3 + 128);
    return [v6 setLabel:@"SpriteKit Render"];
  }
  return this;
}

id *jet_context_Metal::get_Metal_Texture(jet_context_Metal *this, jet_texture *lpsrc)
{
  if (lpsrc)
  {
    if (v3) {
      uint64_t v3 = (id *)v3[1];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

id *jet_context_Metal::get_Metal_Drawable(jet_context_Metal *this, jet_texture *lpsrc)
{
  if (lpsrc)
  {
    if (v3) {
      uint64_t v3 = (id *)v3[3];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void jet_context_Metal::create_texture_from_Metal_Drawable(uint64_t a1, void *a2)
{
}

void sub_21FADE3CC(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v3, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

uint64_t getJetTextureFormatFromMetalPixelFormat(uint64_t a1)
{
  if (a1 > 252)
  {
    switch(a1)
    {
      case 550:
      case 551:
        return 9;
      case 552:
        return 7;
      case 553:
        return 8;
      case 554:
        return 5;
      case 555:
        return 14;
      default:
        if (a1 == 253)
        {
          uint64_t result = 12;
        }
        else
        {
          if (a1 != 260) {
            return 5;
          }
          uint64_t result = 11;
        }
        break;
    }
  }
  else if (a1 <= 79)
  {
    switch(a1)
    {
      case 10:
        return 1;
      case 30:
        return 2;
      case 70:
        return 3;
      default:
        return 5;
    }
  }
  else if (a1 > 114)
  {
    if (a1 != 115)
    {
      if (a1 == 252) {
        return 13;
      }
      return 5;
    }
    return 10;
  }
  else
  {
    if (a1 != 80)
    {
      if (a1 == 81) {
        return 6;
      }
      return 5;
    }
    return 4;
  }
  return result;
}

void jet_context_Metal::create_texture_from_Metal_Texture(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_21FADE5C8(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v2, 0x1081C40A7A185F6);

  _Unwind_Resume(a1);
}

void jet_context_Metal::create_sampler(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v12 = objc_opt_new();
  GLenum v13 = v12;
  uint64_t v14 = 3;
  if (a2 != 2) {
    uint64_t v14 = 0;
  }
  if (a2 == 1) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = v14;
  }
  [v12 setSAddressMode:v15];
  uint64_t v16 = 3;
  if (a3 != 2) {
    uint64_t v16 = 0;
  }
  if (a3 == 1) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = v16;
  }
  [v13 setTAddressMode:v17];
  [v13 setMinFilter:a4 != 0];
  [v13 setMagFilter:a5 != 0];
  if (a6 == 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 2 * (a6 == 2);
  }
  [v13 setMipFilter:v18];
  [*(id *)(a1 + 104) newSamplerStateWithDescriptor:v13];
  operator new();
}

void sub_21FADE730(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v3, 0x1081C40A4B734D1);

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_function(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = objc_msgSend(NSString, "stringWithUTF8String:");
  if (a2)
  {
    id v7 = [NSString stringWithUTF8String:a2];
    id v8 = *(void **)(a1 + 104);
    id v12 = 0;
    GLenum v9 = (void *)[v8 newLibraryWithFile:v7 error:&v12];
    id v10 = v12;

    if (v10) {
      jet_log(&stru_26D153D90.isa, v10);
    }
  }
  else
  {
    id v10 = 0;
    GLenum v9 = (void *)[*(id *)(a1 + 104) newDefaultLibrary];
  }
  if ([v9 newFunctionWithName:v6]) {
    operator new();
  }
  jet_log(&cfstr_FailedToLoadFu.isa, a2, a3);

  return 0;
}

void sub_21FADE8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_function_from_source(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = [NSString stringWithUTF8String:a2];
  GLenum v9 = [NSString stringWithUTF8String:a3];
  id v10 = *(void **)(a1 + 104);
  id v15 = 0;
  IOSurfaceRef v11 = (void *)[v10 newLibraryWithSource:v8 options:0 error:&v15];
  id v12 = v15;
  GLenum v13 = v12;
  if (v11)
  {
    if ([v11 newFunctionWithName:v9]) {
      operator new();
    }
  }
  else if (v12)
  {
    jet_log(&stru_26D153D90.isa, v12);
    if (a5) {
      operator new();
    }
  }

  return 0;
}

void sub_21FADEA78(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v5, 0x1012C40EC159624);

  _Unwind_Resume(a1);
}

void jet_context_Metal::create_program(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      id v4 = *(id *)(a2 + 8);
      if (v4)
      {

        id v5 = *(id *)(a3 + 8);
        if (v5)
        {

          operator new();
        }
        jet_context_Metal::create_program();
      }
      jet_context_Metal::create_program();
    }
    jet_context_Metal::create_program();
  }
  jet_context_Metal::create_program();
}

void sub_21FADEBA8(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C404C70C626);
  _Unwind_Resume(a1);
}

void jet_context_Metal::create_function_from_Metal_Function(uint64_t a1, void *a2)
{
  id v2 = a2;
  operator new();
}

void sub_21FADEC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::create_render_mode(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9, unsigned __int8 a10, unsigned int a11)
{
  id v16 = *(id *)(a2 + 32);
  id v125 = *(id *)(a2 + 40);
  uint64_t v17 = objc_opt_new();
  [v17 setVertexFunction:v16];
  [v17 setFragmentFunction:v125];
  uint64_t MetalPixelFormat = getMetalPixelFormat(a4);
  GLenum v19 = [v17 colorAttachments];
  int v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setPixelFormat:MetalPixelFormat];

  [v17 setSampleCount:a11];
  if (a5 == 11 || a6 == 11)
  {
    if (a6 != 11 || a5 != 11)
    {
      if (a6 == 11) {
        v120 = "destDepthFormat == jet_texture_format_DepthStencil";
      }
      else {
        v120 = "destStencilFormat == jet_texture_format_DepthStencil";
      }
      if (a6 == 11) {
        int v121 = 895;
      }
      else {
        int v121 = 894;
      }
      __assert_rtn("create_render_mode", "jet_context_Metal.mm", v121, v120);
    }
    uint64_t v21 = 260;
    [v17 setDepthAttachmentPixelFormat:260];
  }
  else
  {
    [v17 setDepthAttachmentPixelFormat:getMetalPixelFormat(a5)];
    uint64_t v21 = getMetalPixelFormat(a6);
  }
  [v17 setStencilAttachmentPixelFormat:v21];
  uint64_t v22 = 8;
  if (!a7) {
    uint64_t v22 = 0;
  }
  if (a8) {
    v22 |= 4uLL;
  }
  if (a9) {
    uint64_t v23 = v22 | 2;
  }
  else {
    uint64_t v23 = v22;
  }
  GLint v24 = [v17 colorAttachments];
  GLuint v25 = [v24 objectAtIndexedSubscript:0];
  [v25 setWriteMask:v23 | a10];

  switch(a3)
  {
    case 1:
      uint64_t v26 = [v17 colorAttachments];
      uint64_t v27 = [v26 objectAtIndexedSubscript:0];
      [v27 setBlendingEnabled:0];

      uint64_t v28 = [v17 colorAttachments];
      v29 = [v28 objectAtIndexedSubscript:0];
      [v29 setAlphaBlendOperation:0];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setRgbBlendOperation:0];
      break;
    case 2:
      v80 = [v17 colorAttachments];
      v81 = [v80 objectAtIndexedSubscript:0];
      [v81 setBlendingEnabled:1];

      v82 = [v17 colorAttachments];
      v83 = [v82 objectAtIndexedSubscript:0];
      [v83 setAlphaBlendOperation:0];

      v84 = [v17 colorAttachments];
      v85 = [v84 objectAtIndexedSubscript:0];
      [v85 setRgbBlendOperation:0];

      v86 = [v17 colorAttachments];
      v87 = [v86 objectAtIndexedSubscript:0];
      [v87 setSourceRGBBlendFactor:1];

      v88 = [v17 colorAttachments];
      v89 = [v88 objectAtIndexedSubscript:0];
      [v89 setDestinationRGBBlendFactor:1];

      v90 = [v17 colorAttachments];
      v91 = [v90 objectAtIndexedSubscript:0];
      [v91 setSourceAlphaBlendFactor:1];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:1];
      break;
    case 3:
      v44 = [v17 colorAttachments];
      v45 = [v44 objectAtIndexedSubscript:0];
      [v45 setBlendingEnabled:1];

      v46 = [v17 colorAttachments];
      v47 = [v46 objectAtIndexedSubscript:0];
      [v47 setAlphaBlendOperation:2];

      v48 = [v17 colorAttachments];
      v49 = [v48 objectAtIndexedSubscript:0];
      [v49 setRgbBlendOperation:2];

      v50 = [v17 colorAttachments];
      v51 = [v50 objectAtIndexedSubscript:0];
      [v51 setSourceRGBBlendFactor:4];

      v52 = [v17 colorAttachments];
      v53 = [v52 objectAtIndexedSubscript:0];
      [v53 setDestinationRGBBlendFactor:1];

      v54 = [v17 colorAttachments];
      v55 = [v54 objectAtIndexedSubscript:0];
      [v55 setSourceAlphaBlendFactor:0];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:10];
      break;
    case 4:
      v56 = [v17 colorAttachments];
      v57 = [v56 objectAtIndexedSubscript:0];
      [v57 setBlendingEnabled:1];

      v58 = [v17 colorAttachments];
      v59 = [v58 objectAtIndexedSubscript:0];
      [v59 setAlphaBlendOperation:0];

      v60 = [v17 colorAttachments];
      v61 = [v60 objectAtIndexedSubscript:0];
      [v61 setRgbBlendOperation:0];

      v62 = [v17 colorAttachments];
      v63 = [v62 objectAtIndexedSubscript:0];
      [v63 setSourceRGBBlendFactor:6];

      v64 = [v17 colorAttachments];
      v65 = [v64 objectAtIndexedSubscript:0];
      [v65 setDestinationRGBBlendFactor:0];

      v66 = [v17 colorAttachments];
      v67 = [v66 objectAtIndexedSubscript:0];
      [v67 setSourceAlphaBlendFactor:10];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:0];
      break;
    case 5:
      v32 = [v17 colorAttachments];
      v33 = [v32 objectAtIndexedSubscript:0];
      [v33 setBlendingEnabled:1];

      v34 = [v17 colorAttachments];
      v35 = [v34 objectAtIndexedSubscript:0];
      [v35 setAlphaBlendOperation:0];

      v36 = [v17 colorAttachments];
      v37 = [v36 objectAtIndexedSubscript:0];
      [v37 setRgbBlendOperation:0];

      v38 = [v17 colorAttachments];
      v39 = [v38 objectAtIndexedSubscript:0];
      [v39 setSourceRGBBlendFactor:6];

      v40 = [v17 colorAttachments];
      v41 = [v40 objectAtIndexedSubscript:0];
      [v41 setDestinationRGBBlendFactor:2];

      v42 = [v17 colorAttachments];
      v43 = [v42 objectAtIndexedSubscript:0];
      [v43 setSourceAlphaBlendFactor:10];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:0];
      break;
    case 6:
      v92 = [v17 colorAttachments];
      v93 = [v92 objectAtIndexedSubscript:0];
      [v93 setBlendingEnabled:1];

      v94 = [v17 colorAttachments];
      v95 = [v94 objectAtIndexedSubscript:0];
      [v95 setAlphaBlendOperation:0];

      v96 = [v17 colorAttachments];
      v97 = [v96 objectAtIndexedSubscript:0];
      [v97 setRgbBlendOperation:0];

      v98 = [v17 colorAttachments];
      v99 = [v98 objectAtIndexedSubscript:0];
      [v99 setSourceRGBBlendFactor:1];

      v100 = [v17 colorAttachments];
      v101 = [v100 objectAtIndexedSubscript:0];
      [v101 setDestinationRGBBlendFactor:3];

      v102 = [v17 colorAttachments];
      v103 = [v102 objectAtIndexedSubscript:0];
      [v103 setSourceAlphaBlendFactor:1];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:3];
      break;
    case 7:
      v104 = [v17 colorAttachments];
      v105 = [v104 objectAtIndexedSubscript:0];
      [v105 setBlendingEnabled:1];

      v106 = [v17 colorAttachments];
      v107 = [v106 objectAtIndexedSubscript:0];
      [v107 setAlphaBlendOperation:0];

      v108 = [v17 colorAttachments];
      v109 = [v108 objectAtIndexedSubscript:0];
      [v109 setRgbBlendOperation:0];

      v110 = [v17 colorAttachments];
      v111 = [v110 objectAtIndexedSubscript:0];
      [v111 setSourceRGBBlendFactor:6];

      v112 = [v17 colorAttachments];
      v113 = [v112 objectAtIndexedSubscript:0];
      [v113 setDestinationRGBBlendFactor:5];

      v114 = [v17 colorAttachments];
      v115 = [v114 objectAtIndexedSubscript:0];
      [v115 setSourceAlphaBlendFactor:10];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:5];
      break;
    default:
      v68 = [v17 colorAttachments];
      v69 = [v68 objectAtIndexedSubscript:0];
      [v69 setBlendingEnabled:1];

      v70 = [v17 colorAttachments];
      v71 = [v70 objectAtIndexedSubscript:0];
      [v71 setAlphaBlendOperation:0];

      v72 = [v17 colorAttachments];
      v73 = [v72 objectAtIndexedSubscript:0];
      [v73 setRgbBlendOperation:0];

      v74 = [v17 colorAttachments];
      v75 = [v74 objectAtIndexedSubscript:0];
      [v75 setSourceRGBBlendFactor:1];

      v76 = [v17 colorAttachments];
      v77 = [v76 objectAtIndexedSubscript:0];
      [v77 setDestinationRGBBlendFactor:5];

      v78 = [v17 colorAttachments];
      v79 = [v78 objectAtIndexedSubscript:0];
      [v79 setSourceAlphaBlendFactor:1];

      uint64_t v30 = [v17 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationAlphaBlendFactor:5];
      break;
  }

  v116 = *(void **)(a1 + 104);
  id v126 = 0;
  id v127 = 0;
  uint64_t v117 = [v116 newRenderPipelineStateWithDescriptor:v17 options:3 reflection:&v127 error:&v126];
  id v118 = v127;
  id v119 = v126;
  if (v119) {
    jet_log(&stru_26D153D90.isa, v119, a11);
  }
  if (v117) {
    operator new();
  }
  __assert_rtn("create_render_mode", "jet_context_Metal.mm", 1032, "state");
}

void sub_21FADF940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void jet_render_mode_Metal::set_Metal_Reflection(id *this, MTLRenderPipelineReflection *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v18 = a2;
  objc_storeStrong(this + 6, a2);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [this[6] vertexArguments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v9 = objc_msgSend(v8, "index", v18);
        id v10 = [v8 name];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
        v29 = __p;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(this + 7), (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v29)+ 10) = v9;
        if (v24 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  IOSurfaceRef v11 = [this[6] fragmentArguments];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        int v16 = objc_msgSend(v15, "index", v18);
        id v17 = [v15 name];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v17 UTF8String]);
        v29 = __p;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)(this + 12), (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v29)+ 10) = v16;
        if (v24 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v12);
  }
}

void sub_21FADFE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  _Unwind_Resume(a1);
}

void *jet_context_Metal::set_scheduled_handler(uint64_t a1, uint64_t a2)
{
  v5[4] = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 128);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = ___ZN17jet_context_Metal21set_scheduled_handlerENSt3__18functionIFvvEEE_block_invoke;
  v4[3] = &__block_descriptor_64_ea8_32c27_ZTSNSt3__18functionIFvvEEE_e28_v16__0___MTLCommandBuffer__8l;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v5, a2);
  [v2 addScheduledHandler:v4];
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v5);
}

void sub_21FADFF84(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN17jet_context_Metal21set_scheduled_handlerENSt3__18functionIFvvEEE_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t))(*(void *)v3 + 48))(v3);
}

void sub_21FAE0018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

void *__destroy_helper_block_ea8_32c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 32));
}

void jet_context_Metal::begin_render_pass(jet_context_Metal *this, jet_framebuffer *a2)
{
  (*(void (**)(jet_context_Metal *))(*(void *)this + 352))(this);
  if (a2)
  {
    *((void *)this + 2) = a2;
    if (v4 && (uint64_t v5 = v4, (v6 = (void *)v4[32]) != 0))
    {
      id v7 = v6;
      if (v7 != *((id *)this + 17))
      {
        (*(void (**)(uint64_t *__return_ptr, jet_context_Metal *))(*(void *)this + 176))(&v72, this);
        if (v73) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v73);
        }
        objc_storeStrong((id *)this + 17, v6);
        jet_context_Metal::ensureCommandBuffer((uint64_t)this, 1);
      }
      *((void *)this + 1) = 0;
      objc_storeStrong((id *)this + 18, (id)v5[33]);
      id v8 = (void *)*((void *)this + 18);
      if (v8)
      {
        int v9 = [v8 colorAttachments];
        id v10 = [v9 objectAtIndexedSubscript:0];
        IOSurfaceRef v11 = [v10 texture];

        if (v11)
        {
          *((_DWORD *)this + 6) = getJetTextureFormatFromMetalPixelFormat([v11 pixelFormat]);
          int v12 = [v11 sampleCount];
        }
        else
        {
          *((_DWORD *)this + 6) = 0;
          int v12 = 1;
        }
        *((_DWORD *)this + 9) = v12;
        v61 = [*((id *)this + 18) depthAttachment];
        v62 = [v61 texture];

        if (v62) {
          JetTextureFormatFromuint64_t MetalPixelFormat = getJetTextureFormatFromMetalPixelFormat([v62 pixelFormat]);
        }
        else {
          JetTextureFormatFromuint64_t MetalPixelFormat = 0;
        }
        *((_DWORD *)this + 7) = JetTextureFormatFromMetalPixelFormat;
        v64 = [*((id *)this + 18) stencilAttachment];
        v65 = [v64 texture];

        if (v65) {
          int v66 = getJetTextureFormatFromMetalPixelFormat([v65 pixelFormat]);
        }
        else {
          int v66 = 0;
        }
        *((_DWORD *)this + 8) = v66;
      }
      [*((id *)this + 17) setCullMode:0];
    }
    else
    {
      uint64_t v13 = (void *)*((void *)this + 17);
      if (v13)
      {
        [v13 endEncoding];
        uint64_t v14 = (void *)*((void *)this + 17);
        *((void *)this + 17) = 0;
      }
      id v15 = (id *)*((void *)a2 + 2);
      int v16 = (id *)*((void *)a2 + 26);
      id v17 = (id *)*((void *)a2 + 29);
      if (v15 && ((*((uint64_t (**)(void))*v15 + 12))(*((void *)a2 + 2)) & 1) == 0) {
        jet_context_Metal::begin_render_pass();
      }
      if (v16 && ((*((uint64_t (**)(id *))*v16 + 13))(v16) & 1) == 0) {
        jet_context_Metal::begin_render_pass();
      }
      if (v17 && ((*((uint64_t (**)(id *))*v17 + 14))(v17) & 1) == 0) {
        jet_context_Metal::begin_render_pass();
      }
      if (v15) {
        int v18 = (*((uint64_t (**)(id *))*v15 + 4))(v15);
      }
      else {
        int v18 = 3;
      }
      *((_DWORD *)this + 6) = v18;
      if (v16) {
        int v19 = (*((uint64_t (**)(id *))*v16 + 4))(v16);
      }
      else {
        int v19 = 0;
      }
      *((_DWORD *)this + 7) = v19;
      if (v17) {
        int v20 = (*((uint64_t (**)(id *))*v17 + 4))(v17);
      }
      else {
        int v20 = 0;
      }
      *((_DWORD *)this + 8) = v20;
      getMetalTexture(v15);
      id v71 = (id)objc_claimAutoreleasedReturnValue();
      if (v71) {
        *((_DWORD *)this + 9) = [v71 sampleCount];
      }
      if (v16 && (*((unsigned int (**)(id *))*v16 + 4))(v16) == 11)
      {
        id v21 = v16[1];
      }
      else
      {
        getMetalTexture(v16);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v22 = v21;
      if (v17 && (*((unsigned int (**)(id *))*v17 + 4))(v17) == 11)
      {
        id v23 = v17[2];
      }
      else
      {
        getMetalTexture(v16);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      char v24 = v23;
      uint64_t v25 = *((unsigned int *)a2 + 60);
      float v26 = *((float *)a2 + 54);
      long long v27 = objc_msgSend(MEMORY[0x263F129A0], "renderPassDescriptor", *((void *)a2 + 4), *((void *)a2 + 5));
      long long v28 = [v27 colorAttachments];
      v29 = [v28 objectAtIndexedSubscript:0];
      [v29 setTexture:v71];

      uint64_t v30 = [v27 colorAttachments];
      __int16 v31 = [v30 objectAtIndexedSubscript:0];
      objc_msgSend(v31, "setClearColor:", v67, v68, v69, v70);

      int v32 = *((_DWORD *)a2 + 12);
      if (v32 == 1) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = v32 == 0;
      }
      v34 = [v27 colorAttachments];
      v35 = [v34 objectAtIndexedSubscript:0];
      [v35 setLoadAction:v33];

      BOOL v36 = *((_DWORD *)a2 + 13) != 1;
      v37 = [v27 colorAttachments];
      v38 = [v37 objectAtIndexedSubscript:0];
      [v38 setStoreAction:v36];

      v39 = [v27 stencilAttachment];
      [v39 setTexture:v24];

      v40 = [v27 stencilAttachment];
      [v40 setClearStencil:v25];

      int v41 = *((_DWORD *)a2 + 61);
      v42 = [v27 stencilAttachment];
      v43 = v42;
      if (v41 == 1) {
        uint64_t v44 = 2;
      }
      else {
        uint64_t v44 = v41 == 0;
      }
      [v42 setLoadAction:v44];

      int v45 = *((_DWORD *)a2 + 62);
      v46 = [v27 stencilAttachment];
      [v46 setStoreAction:v45 != 1];

      v47 = [v27 depthAttachment];
      [v47 setTexture:v22];

      v48 = [v27 depthAttachment];
      [v48 setClearDepth:v26];

      int v49 = *((_DWORD *)a2 + 55);
      v50 = [v27 depthAttachment];
      v51 = v50;
      if (v49 == 1) {
        uint64_t v52 = 2;
      }
      else {
        uint64_t v52 = v49 == 0;
      }
      [v50 setLoadAction:v52];

      int v53 = *((_DWORD *)a2 + 56);
      v54 = [v27 depthAttachment];
      [v54 setStoreAction:v53 != 1];

      jet_context_Metal::ensureCommandQueue(this);
      jet_context_Metal::ensureCommandBuffer((uint64_t)this, 0);
      uint64_t v55 = [*((id *)this + 16) renderCommandEncoderWithDescriptor:v27];
      v56 = (void *)*((void *)this + 17);
      *((void *)this + 17) = v55;

      [*((id *)this + 17) setLabel:@"SpriteKit Render"];
      objc_storeStrong((id *)this + 18, v27);
      if (v15)
      {
        uint64_t v57 = (*(uint64_t (**)(id *))*v15)(v15);
        uint64_t v58 = (*((uint64_t (**)(id *))*v15 + 1))(v15);
        (*(void (**)(jet_context_Metal *, void, void, uint64_t, uint64_t))(*(void *)this + 208))(this, 0, 0, v57, v58);
        uint64_t v59 = (*(uint64_t (**)(id *))*v15)(v15);
        uint64_t v60 = (*((uint64_t (**)(id *))*v15 + 1))(v15);
        (*(void (**)(jet_context_Metal *, void, void, uint64_t, uint64_t))(*(void *)this + 224))(this, 0, 0, v59, v60);
      }
    }
  }
}

void sub_21FAE08A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

jet_texture *getMetalTexture(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return (jet_texture *)a1;
}

void jet_context_Metal::ensureCommandQueue(jet_context_Metal *this)
{
  if (!*((void *)this + 15))
  {
    uint64_t v2 = jet_context_Metal::getNativeCommandQueue(this);
    uint64_t v3 = (void *)*((void *)this + 15);
    *((void *)this + 15) = v2;
  }
}

void jet_context_Metal::create_stencil_mode(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = objc_opt_new();
  [v13 setReadMask:a6];
  [v13 setWriteMask:a7];
  if (a2 > 7) {
    uint64_t v14 = 7;
  }
  else {
    uint64_t v14 = qword_21FAE92D0[a2];
  }
  [v13 setStencilCompareFunction:v14];
  if (a3 > 4) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = qword_21FAE92A8[a3];
  }
  [v13 setStencilFailureOperation:v15];
  if (a4 > 4) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = qword_21FAE92A8[a4];
  }
  [v13 setDepthFailureOperation:v16];
  if (a5 > 4) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = qword_21FAE92A8[a5];
  }
  [v13 setDepthStencilPassOperation:v17];
  operator new();
}

void sub_21FAE0B68(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v2, 0x81C40803F642BLL);

  _Unwind_Resume(a1);
}

void jet_context_Metal::create_depth_stencil_mode(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    uint64_t v9 = a5;
  }
  else {
    uint64_t v9 = a4;
  }
  id v10 = objc_opt_new();
  IOSurfaceRef v11 = v10;
  if (a3 > 7) {
    uint64_t v12 = 7;
  }
  else {
    uint64_t v12 = qword_21FAE92D0[a3];
  }
  [v10 setDepthCompareFunction:v12];
  [v11 setDepthWriteEnabled:a2];
  [v11 setFrontFaceStencil:*(void *)(a4 + 8)];
  [v11 setBackFaceStencil:*(void *)(v9 + 8)];
  if ([*(id *)(a1 + 104) newDepthStencilStateWithDescriptor:v11]) {
    operator new();
  }
  __assert_rtn("create_depth_stencil_mode", "jet_context_Metal.mm", 1241, "state");
}

void sub_21FAE0CCC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  MEMORY[0x223C592E0](v4, 0x81C40D6874129);

  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::set_wireframe_mode(id *this, unsigned int a2)
{
  return [this[17] setTriangleFillMode:a2];
}

uint64_t jet_context_Metal::set_scissor_rect(jet_context_Metal *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v8 = a4;
  uint64_t v9 = *((void *)this + 2);
  uint64_t v10 = a5;
  if (v9)
  {
    uint64_t v11 = *(void *)(v9 + 16);
    if (v11)
    {
      int v13 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 8))(v11);
      int v14 = (***(uint64_t (****)(void))(*((void *)this + 2) + 16))();
      a3 = (v13 - (a5 + a3)) & ~((int)(v13 - (a5 + a3)) >> 31);
      uint64_t v10 = v13;
      uint64_t v8 = v14;
    }
  }
  uint64_t v15 = (void *)*((void *)this + 17);
  v17[0] = a2;
  v17[1] = a3;
  v17[2] = v8;
  v17[3] = v10;
  return [v15 setScissorRect:v17];
}

uint64_t jet_context_Metal::set_stencil_reference_value(id *this, uint64_t a2)
{
  return [this[17] setStencilReferenceValue:a2];
}

uint64_t jet_context_Metal::use_depth_stencil_mode(jet_context_Metal *this, jet_depth_stencil_mode *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)*((void *)this + 17);
    uint64_t v4 = *((void *)a2 + 2);
    return [v3 setDepthStencilState:v4];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN17jet_context_Metal22use_depth_stencil_modeEP22jet_depth_stencil_mode_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    if (jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::onceToken != -1) {
      dispatch_once(&jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::onceToken, block);
    }
    return [*((id *)this + 17) setDepthStencilState:jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::_defualtDepthStencilState];
  }
}

void ___ZN17jet_context_Metal22use_depth_stencil_modeEP22jet_depth_stencil_mode_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = (id)objc_opt_new();
  uint64_t v2 = objc_msgSend(*(id *)(v1 + 104), "newDepthStencilStateWithDescriptor:");
  uint64_t v3 = (void *)jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::_defualtDepthStencilState;
  jet_context_Metal::use_depth_stencil_mode(jet_depth_stencil_mode *)::_defualtDepthStencilState = v2;
}

void sub_21FAE0F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::use_render_mode(jet_context_Metal *this, jet_render_mode *a2)
{
  *((void *)this + 1) = a2;
  return [*((id *)this + 17) setRenderPipelineState:*((void *)a2 + 5)];
}

uint64_t jet_context_Metal::set_viewport(jet_context_Metal *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  uint64_t v10 = *((void *)this + 2);
  if (v10 && ((*(uint64_t (**)(void))(**(void **)(v10 + 16) + 88))(*(void *)(v10 + 16)) & 1) == 0)
  {
    a3 += a5;
    double v11 = (float)-(float)a5;
  }
  else
  {
    double v11 = (double)a5;
  }
  uint64_t v12 = (void *)*((void *)this + 17);
  v14[0] = (double)a2;
  v14[1] = (double)a3;
  v14[2] = (double)a4;
  v14[3] = v11;
  long long v15 = xmmword_21FAE8FB0;
  return [v12 setViewport:v14];
}

void jet_context_Metal::set_vertex_buffer(jet_context_Metal *this, jet_buffer *a2, int a3)
{
  jet_context::add_fenced_buffer(this, a2);
  if (a3 < 0) {
    jet_context_Metal::set_vertex_buffer();
  }
  uint64_t v6 = (void *)*((void *)this + 17);
  getMetalBuffer((id *)a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:");
}

void sub_21FAE10C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

jet_buffer *getMetalBuffer(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[12];
    uint64_t v1 = vars8;
  }
  return (jet_buffer *)a1;
}

void jet_context_Metal::set_vertex_constant(jet_context_Metal *this, id *a2, int a3)
{
  if (a3 < 0) {
    jet_context_Metal::set_vertex_constant();
  }
  uint64_t v3 = (void *)*((void *)this + 17);
  getMetalBuffer(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVertexBuffer:offset:atIndex:");
}

void sub_21FAE1174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

jet_constant *getMetalBuffer(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return (jet_constant *)a1;
}

uint64_t jet_context_Metal::set_vertex_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  if ((a6 & 0x80000000) != 0) {
    jet_context_Metal::set_vertex_constant();
  }
  if (!a5) {
    jet_context_Metal::set_vertex_constant();
  }
  if (a4 != 1) {
    jet_context_Metal::set_vertex_constant();
  }
  if ((a2 - 1) > 7) {
    int v6 = 4;
  }
  else {
    int v6 = dword_21FAE9310[a2 - 1];
  }
  id v7 = *(void **)(a1 + 136);

  return [v7 setVertexBytes:a5 length:(v6 * a3) atIndex:a6];
}

void jet_context_Metal::set_vertex_texture(jet_context_Metal *this, id *a2, int a3)
{
  if (a3 < 0) {
    jet_context_Metal::set_vertex_texture();
  }
  uint64_t v3 = (void *)*((void *)this + 17);
  getMetalTexture(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVertexTexture:atIndex:");
}

void sub_21FAE1294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::set_vertex_sampler(jet_context_Metal *this, id *a2, int a3)
{
  if (a3 < 0) {
    jet_context_Metal::set_vertex_sampler();
  }
  uint64_t v3 = (void *)*((void *)this + 17);
  getMetalSampler(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVertexSamplerState:atIndex:");
}

void sub_21FAE1310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

jet_sampler *getMetalSampler(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return (jet_sampler *)a1;
}

void jet_context_Metal::set_fragment_texture(jet_context_Metal *this, id *a2, int a3)
{
  if (a3 < 0) {
    jet_context_Metal::set_fragment_texture();
  }
  uint64_t v3 = (void *)*((void *)this + 17);
  getMetalTexture(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFragmentTexture:atIndex:");
}

void sub_21FAE13BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::set_fragment_sampler(jet_context_Metal *this, id *a2, int a3)
{
  if (a3 < 0) {
    jet_context_Metal::set_fragment_sampler();
  }
  uint64_t v3 = (void *)*((void *)this + 17);
  getMetalSampler(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFragmentSamplerState:atIndex:");
}

void sub_21FAE1438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::set_fragment_constant(jet_context_Metal *this, id *a2, int a3)
{
  if (a3 < 0) {
    jet_context_Metal::set_fragment_constant();
  }
  uint64_t v3 = (void *)*((void *)this + 17);
  getMetalBuffer(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFragmentBuffer:offset:atIndex:");
}

void sub_21FAE14B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::set_fragment_constant(uint64_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  if ((a6 & 0x80000000) != 0) {
    jet_context_Metal::set_fragment_constant();
  }
  if (!a5) {
    jet_context_Metal::set_fragment_constant();
  }
  if (a4 != 1) {
    jet_context_Metal::set_fragment_constant();
  }
  if ((a2 - 1) > 7) {
    int v6 = 4;
  }
  else {
    int v6 = dword_21FAE9310[a2 - 1];
  }
  id v7 = *(void **)(a1 + 136);

  return [v7 setFragmentBytes:a5 length:(v6 * a3) atIndex:a6];
}

uint64_t jet_context_Metal::draw(uint64_t result, unsigned int a2, unsigned int a3, unsigned int a4)
{
  if (a4)
  {
    if (a2 >= 5) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = a2;
    }
    return [*(id *)(result + 136) drawPrimitives:v4 vertexStart:a3 vertexCount:a4];
  }
  return result;
}

void jet_context_Metal::draw_indexed(uint64_t a1, unsigned int a2, jet_buffer *a3, unsigned int a4, unsigned int a5)
{
  if (a5)
  {
    if ((*((_DWORD *)a3 + 10) - 5) <= 0xFFFFFFFD) {
      jet_context_Metal::draw_indexed();
    }
    if (a2 >= 5) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = a2;
    }
    uint64_t v10 = getMetalBuffer((id *)a3);
    int v11 = *((_DWORD *)a3 + 10);
    BOOL v12 = v11 == 4;
    unsigned int v13 = v11 - 1;
    if (v13 > 7) {
      int v14 = 4;
    }
    else {
      int v14 = dword_21FAE9310[v13];
    }
    id v15 = (id)v10;
    [*(id *)(a1 + 136) drawIndexedPrimitives:v9 indexCount:a5 indexType:v12 indexBuffer:v10 indexBufferOffset:a4 * (unint64_t)(*((_DWORD *)a3 + 11) * v14)];
  }
}

void sub_21FAE1664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::present(jet_context_Metal *this, id *a2, double a3)
{
  id v10 = a2[3];
  if (!v10) {
    __assert_rtn("present", "jet_context_Metal.mm", 1438, "drawable");
  }
  int v6 = (void *)*((void *)this + 16);
  if (a3 <= 0.0) {
    [v6 presentDrawable:v10];
  }
  else {
    [v6 presentDrawable:v10 atTime:a3];
  }
  (*(void (**)(jet_context_Metal *))(*(void *)this + 176))(this);
  id v7 = a2[3];
  a2[3] = 0;

  id v8 = a2[1];
  a2[1] = 0;

  id v9 = a2[2];
  a2[2] = 0;
}

void sub_21FAE1778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::commit@<X0>(jet_context_Metal *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (const void *)*((void *)this + 2);
  if (!v4
  {
    id v9 = (void *)*((void *)this + 17);
    goto LABEL_7;
  }
  uint64_t v7 = jet_context_Metal::getNativeCommandQueue(this);
  id v8 = (void *)*((void *)this + 15);
  *((void *)this + 15) = v7;

  id v9 = (void *)*((void *)this + 17);
  if ((void *)v6[32] != v9) {
LABEL_7:
  }
    [v9 endEncoding];
  *a2 = 0;
  a2[1] = 0;
  if (*((void *)this + 17))
  {
    (*(void (**)(void *__return_ptr, jet_context_Metal *))(*(void *)this + 328))(v13, this);
    uint64_t v10 = v13[1];
    *a2 = v13[0];
    a2[1] = v10;
    int v11 = (void *)*((void *)this + 17);
    *((void *)this + 17) = 0;

    [*((id *)this + 16) commit];
  }
  jet_context_Metal::ensureCommandQueue(this);
  return jet_context_Metal::ensureCommandBuffer((uint64_t)this, 1);
}

void sub_21FAE18C8(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

id jet_context_Metal::getNativeCommandQueue(jet_context_Metal *this)
{
  uint64_t v2 = (void *)*((void *)this + 14);
  if (!v2)
  {
    uint64_t v3 = [*((id *)this + 13) newCommandQueue];
    uint64_t v4 = (void *)*((void *)this + 14);
    *((void *)this + 14) = v3;

    uint64_t v5 = (void *)*((void *)this + 14);
    int v6 = jet_getClientLabel();
    [v5 setLabel:v6];

    uint64_t v2 = (void *)*((void *)this + 14);
  }

  return v2;
}

void sub_21FAE1958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::create_fence(jet_context_Metal *this)
{
}

void sub_21FAE1A50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t jet_context_Metal::get_max_texture_size(uint64_t a1, unsigned int a2)
{
  unint64_t v3 = [*(id *)(a1 + 104) featureProfile];
  if (a2 > 2) {
    return 0;
  }
  int64x2_t v4 = vdupq_n_s64(v3);
  v5.i64[0] = 0x400000004000;
  v5.i64[1] = 0x400000004000;
  return vaddvq_s32(vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_21FAE8FD0), (int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_21FAE8FC0)), (int8x16_t)xmmword_21FAE9000), (int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_21FAE8FF0), (int32x4_t)vceqq_s64(v4, (int64x2_t)xmmword_21FAE8FE0)), v5)))+ (((v3 & 0xFFFFFFFFFFFFFFFELL) == 10) << 14);
}

id jet_context_Metal::ensureCIContext(jet_context_Metal *this)
{
  uint64_t v2 = (void *)*((void *)this + 12);
  if (!v2)
  {
    unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    int64x2_t v4 = [MEMORY[0x263EFF9D0] null];
    [v3 setObject:v4 forKey:*MEMORY[0x263F00858]];

    int8x16_t v5 = [MEMORY[0x263EFF9D0] null];
    [v3 setObject:v5 forKey:*MEMORY[0x263F00838]];

    int v6 = [NSNumber numberWithBool:1];
    [v3 setValue:v6 forKey:*MEMORY[0x263F00840]];

    uint64_t v7 = [MEMORY[0x263F00628] contextWithMTLDevice:*((void *)this + 13) options:v3];
    id v8 = (void *)*((void *)this + 12);
    *((void *)this + 12) = v7;

    uint64_t v2 = (void *)*((void *)this + 12);
  }

  return v2;
}

void sub_21FAE1C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_context_Metal::render_CIImage_to_texture(uint64_t a1, void *a2, id *a3, __n128 a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 136);
  if (v7)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 176))(&v29, a1);
    if (v30) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    }
  }
  id v8 = (*(void (**)(uint64_t))(*(void *)a1 + 336))(a1);
  double v9 = (double)a4.n128_u32[0];
  double v10 = (double)a4.n128_u32[1];
  double v11 = (double)a4.n128_u32[2];
  double v12 = (double)a4.n128_u32[3];
  v31.origin.x = (double)a4.n128_u32[0];
  v31.origin.y = (double)a4.n128_u32[1];
  v31.size.width = (double)a4.n128_u32[2];
  v31.size.height = (double)a4.n128_u32[3];
  if (CGRectIsEmpty(v31))
  {
    [v6 extent];
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
    double v12 = v16;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int v18 = getMetalTexture(a3);
  objc_msgSend(v8, "render:toMTLTexture:commandBuffer:bounds:colorSpace:", v6, v18, *(void *)(a1 + 128), DeviceRGB, v9, v10, v11, v12);

  CGColorSpaceRelease(DeviceRGB);
  int v19 = *(const void **)(a1 + 16);
  if (v19)
  {
    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v20 = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
  if (!v20)
  {
    if (*(void *)(a1 + 144))
    {
      jet_context_Metal::ensureCommandBuffer(a1, 0);
      uint64_t v21 = [*(id *)(a1 + 128) renderCommandEncoderWithDescriptor:*(void *)(a1 + 144)];
      long long v22 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v21;

      [*(id *)(a1 + 136) setLabel:@"SpriteKit Render"];
      uint64_t v23 = *(void *)(*(void *)(a1 + 16) + 16);
      if (v23)
      {
        uint64_t v24 = (**(uint64_t (***)(uint64_t))v23)(v23);
        uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 8))(v23);
        (*(void (**)(uint64_t, void, void, uint64_t, uint64_t))(*(void *)a1 + 208))(a1, 0, 0, v24, v25);
        uint64_t v26 = (**(uint64_t (***)(uint64_t))v23)(v23);
        uint64_t v27 = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 8))(v23);
        (*(void (**)(uint64_t, void, void, uint64_t, uint64_t))(*(void *)a1 + 224))(a1, 0, 0, v26, v27);
      }
    }
  }
LABEL_14:
  (*(void (**)(uint64_t))(*(void *)a1 + 328))(a1);
}

void sub_21FAE1FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id jet_context_Metal::create_CIImage_from_texture(jet_context_Metal *this, id *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F00650];
  unint64_t v3 = getMetalTexture(a2);
  int64x2_t v4 = [v2 imageWithMTLTexture:v3 options:0];

  return v4;
}

void sub_21FAE2064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_context_Metal::create_texture_from_CIImage(jet_context_Metal *this, CIImage *a2)
{
  unint64_t v3 = a2;
  [(CIImage *)v3 extent];
  uint64_t texture_2d = jet_context::create_texture_2d((uint64_t)this, v4, v5, 3, 0, 0, 0);
  (*(void (**)(uint64_t *__return_ptr, jet_context_Metal *, CIImage *, uint64_t, __n128))(*(void *)this
                                                                                                 + 160))(&v8, this, v3, texture_2d, (__n128)0);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return texture_2d;
}

void sub_21FAE2120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id jet_context_Metal::get_Metal_Device(id *this)
{
  return this[13];
}

id jet_context_Metal::get_Metal_CommandQueue(id *this)
{
  return this[15];
}

id jet_context_Metal::get_Metal_CommandBuffer(id *this)
{
  return this[16];
}

id jet_context_Metal::get_Metal_CommandEncoder(id *this)
{
  return this[17];
}

id jet_context_Metal::get_Metal_RenderPassDescriptor(id *this)
{
  return this[18];
}

uint64_t jet_buffer_Metal::jet_buffer_Metal(uint64_t a1, void *a2, int a3, int a4, int a5, uint64_t a6)
{
  id v11 = a2;
  jet_buffer::jet_buffer((jet_buffer *)a1);
  *(void *)a1 = &unk_26D153128;
  *(void *)(a1 + 96) = 0;
  if ((a3 - 1) > 7) {
    int v12 = 4;
  }
  else {
    int v12 = dword_21FAE9310[a3 - 1];
  }
  if (a6) {
    uint64_t v13 = [v11 newBufferWithBytes:a6 length:(a5 * a4 * v12) options:0];
  }
  else {
    uint64_t v13 = [v11 newBufferWithLength:(a5 * a4 * v12) options:0];
  }
  double v14 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v13;

  *(_DWORD *)(a1 + 40) = a3;
  *(_DWORD *)(a1 + 44) = a4;
  *(_DWORD *)(a1 + 48) = a5;

  return a1;
}

void sub_21FAE2238(_Unwind_Exception *a1)
{
  jet_buffer::~jet_buffer((dispatch_semaphore_t *)v2);
  _Unwind_Resume(a1);
}

uint64_t jet_buffer_Metal::get_length(id *this)
{
  return [this[12] length];
}

void *jet_buffer_Metal::set_data(id *this, const void *a2, unsigned int a3, unsigned int a4)
{
  unsigned int v5 = a3;
  if (!a3) {
    unsigned int v5 = [this[12] length];
  }
  uint64_t v8 = (void *)([this[12] contents] + a4);

  return memcpy(v8, a2, v5);
}

uint64_t jet_buffer_Metal::get_data(id *this)
{
  return [this[12] contents];
}

void jet_buffer_Metal::resize(jet_buffer_Metal *this, int a2)
{
  unsigned int v4 = *((_DWORD *)this + 10) - 1;
  if (v4 > 7) {
    int v5 = 4;
  }
  else {
    int v5 = dword_21FAE9310[v4];
  }
  size_t v6 = (v5 * a2 * *((_DWORD *)this + 11));
  uint64_t v7 = [*((id *)this + 12) device];
  uint64_t v8 = (void *)[v7 newBufferWithLength:v6 options:0];

  id v9 = v8;
  double v10 = (void *)[v9 contents];
  id v11 = (const void *)[*((id *)this + 12) contents];
  unint64_t v12 = [*((id *)this + 12) length];
  if (v12 >= v6) {
    size_t v13 = v6;
  }
  else {
    size_t v13 = v12;
  }
  memcpy(v10, v11, v13);
  double v14 = (void *)*((void *)this + 12);
  *((void *)this + 12) = v9;

  *((_DWORD *)this + 12) = a2;
}

void sub_21FAE23C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_buffer_Metal::~jet_buffer_Metal(jet_buffer_Metal *this)
{
  jet_buffer_Metal::~jet_buffer_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26D153128;
  uint64_t v2 = (void *)*((void *)this + 12);
  *((void *)this + 12) = 0;

  jet_buffer::~jet_buffer((dispatch_semaphore_t *)this);
}

void *jet_buffer_Metal::copy_data(id *this, void *a2, unsigned int a3)
{
  int v5 = (const void *)[this[12] contents];

  return memcpy(a2, v5, a3);
}

uint64_t jet_buffer_Metal::set_value(jet_buffer_Metal *this, float a2)
{
  float v3 = a2;
  return (*(uint64_t (**)(jet_buffer_Metal *, float *, uint64_t, void))(*(void *)this + 8))(this, &v3, 4, 0);
}

uint64_t jet_buffer_Metal::set_value(uint64_t a1, double a2)
{
  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 8, 0);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 8, 0);
}

uint64_t jet_buffer_Metal::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 16, 0);
}

{
  __n128 v3;

  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 16, 0);
}

uint64_t jet_buffer_Metal::set_value(jet_buffer_Metal *this, __int16 a2)
{
  __int16 v3 = a2;
  return (*(uint64_t (**)(jet_buffer_Metal *, __int16 *, uint64_t, void))(*(void *)this + 8))(this, &v3, 2, 0);
}

uint64_t jet_buffer_Metal::set_value(uint64_t a1, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t, void))(*(void *)a1 + 8))(a1, &v3, 4, 0);
}

jet_buffer_pool *jet_buffer_pool_Metal::jet_buffer_pool_Metal(jet_buffer_pool *a1, void *a2, int a3, int a4, int a5)
{
  id v9 = a2;
  jet_buffer_pool::jet_buffer_pool((uint64_t)a1, a3, a4, a5);
  *(void *)a1 = &unk_26D1531D0;
  id v10 = v9;
  *((void *)a1 + 8) = v10;
  jet_buffer_pool::initialize_first_buffer(a1);

  return a1;
}

void sub_21FAE27D4(_Unwind_Exception *a1)
{
  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)v2);
  _Unwind_Resume(a1);
}

void jet_buffer_pool_Metal::~jet_buffer_pool_Metal(id *this)
{
  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);
}

{
  uint64_t vars8;

  jet_buffer_pool::~jet_buffer_pool((jet_buffer_pool *)this);

  JUMPOUT(0x223C592E0);
}

void jet_buffer_pool_Metal::create_buffer(jet_buffer_pool_Metal *this)
{
}

void sub_21FAE28DC(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C405BB150DBLL);
  _Unwind_Resume(a1);
}

uint64_t jet_constant_Metal::get_length(id *this)
{
  return [this[3] length];
}

void *jet_constant_Metal::set_data(id *this, const void *a2, unsigned int a3)
{
  unsigned int v3 = a3;
  if (!a3) {
    unsigned int v3 = [this[3] length];
  }
  size_t v6 = (void *)[this[3] contents];

  return memcpy(v6, a2, v3);
}

void *jet_constant_Metal::copy_data(id *this, void *a2, unsigned int a3)
{
  int v5 = (const void *)[this[3] contents];

  return memcpy(a2, v5, a3);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, float a2)
{
  float v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, float *, uint64_t))(*(void *)this + 32))(this, &v3, 4);
}

uint64_t jet_constant_Metal::set_value(uint64_t a1, double a2)
{
  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 8);
}

{
  double v3;

  double v3 = a2;
  return (*(uint64_t (**)(uint64_t, double *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 8);
}

uint64_t jet_constant_Metal::set_value(uint64_t a1, __n128 a2)
{
  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 16);
}

{
  __n128 v3;

  __n128 v3 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 16);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, simd_float2x2 a2)
{
  simd_float2x2 v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, simd_float2x2 *, uint64_t))(*(void *)this + 32))(this, &v3, 16);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, simd_float3x3 a2)
{
  simd_float3x3 v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, simd_float3x3 *, uint64_t))(*(void *)this + 32))(this, &v3, 48);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, simd_float4x4 a2)
{
  simd_float4x4 v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, simd_float4x4 *, uint64_t))(*(void *)this + 32))(this, &v3, 64);
}

void jet_constant_Metal::~jet_constant_Metal(jet_constant_Metal *this)
{
  jet_constant_Metal::~jet_constant_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26D153218;
  uint64_t v2 = (void *)*((void *)this + 3);
  *((void *)this + 3) = 0;

  jet_constant::~jet_constant(this);
}

uint64_t jet_constant_Metal::set_value(jet_constant_Metal *this, __int16 a2)
{
  __int16 v3 = a2;
  return (*(uint64_t (**)(jet_constant_Metal *, __int16 *, uint64_t))(*(void *)this + 32))(this, &v3, 2);
}

uint64_t jet_constant_Metal::set_value(uint64_t a1, int a2)
{
  int v3 = a2;
  return (*(uint64_t (**)(uint64_t, int *, uint64_t))(*(void *)a1 + 32))(a1, &v3, 4);
}

void jet_framebuffer_Metal::jet_framebuffer_Metal(jet_framebuffer_Metal *this)
{
  *((_DWORD *)this + 54) = 1065353216;
  *(void *)((char *)this + 220) = 0x100000001;
  *((void *)this + 29) = 0;
  *((void *)this + 30) = 0x100000000;
  *((_DWORD *)this + 62) = 1;
  *((void *)this + 2) = 0;
  *((_OWORD *)this + 2) = xmmword_21FAE8BE0;
  *((void *)this + 6) = 1;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((_OWORD *)this + 5) = xmmword_21FAE8BE0;
  *((_DWORD *)this + 24) = 1;
  *(void *)((char *)this + 100) = 0;
  *(void *)((char *)this + 116) = 0;
  *(void *)((char *)this + 108) = 0;
  *((_DWORD *)this + 31) = 0;
  *((_OWORD *)this + 8) = xmmword_21FAE8BE0;
  *((_DWORD *)this + 36) = 1;
  *(void *)((char *)this + 156) = 0;
  *(void *)((char *)this + 148) = 0;
  *((_DWORD *)this + 43) = 0;
  *(void *)((char *)this + 164) = 0;
  *((_OWORD *)this + 11) = xmmword_21FAE8BE0;
  *((void *)this + 24) = 1;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *(void *)this = &unk_26D1532D8;
  *((void *)this + 32) = 0;
  *((void *)this + 33) = 0;
}

void jet_framebuffer_Metal::~jet_framebuffer_Metal(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x223C592E0);
}

void jet_framebuffer_Metal::clone(jet_framebuffer_Metal *this)
{
}

uint64_t jet_texture_Metal::get_width(id *this)
{
  return [this[1] width];
}

uint64_t jet_texture_Metal::get_height(id *this)
{
  return [this[1] height];
}

uint64_t jet_texture_Metal::get_depth(id *this)
{
  return [this[1] depth];
}

uint64_t jet_texture_Metal::get_type(jet_texture_Metal *this)
{
  return *((unsigned int *)this + 9);
}

uint64_t jet_texture_Metal::get_format(jet_texture_Metal *this)
{
  return *((unsigned int *)this + 8);
}

BOOL jet_texture_Metal::get_mip_mapped(id *this)
{
  return (unint64_t)[this[1] mipmapLevelCount] > 1;
}

uint64_t jet_texture_Metal::get_slice_count(jet_texture_Metal *this)
{
  return *((unsigned int *)this + 11);
}

uint64_t jet_texture_Metal::set_data(jet_texture_Metal *this, const void *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10 = (**(uint64_t (***)(jet_texture_Metal *))this)(this);
  unsigned int v11 = (*(uint64_t (**)(jet_texture_Metal *))(*(void *)this + 8))(this);
  return (*(uint64_t (**)(jet_texture_Metal *, const void *, uint64_t, uint64_t, void, void, void, uint64_t, uint64_t, void))(*(void *)this + 64))(this, a2, a3, a4, 0, 0, 0, v10, v11 | 0x100000000, a5);
}

uint64_t jet_texture_Metal::replace_region(jet_texture_Metal *this, const void *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, unsigned int a11, unsigned int a12)
{
  uint64_t result = (*(uint64_t (**)(jet_texture_Metal *))(*(void *)this + 88))(this);
  if (result) {
    jet_texture_Metal::replace_region();
  }
  if (a2)
  {
    unsigned int v21 = a11;
    unsigned int v22 = a12;
    if (!a11)
    {
      int bytes_per_element = jet_texture::get_bytes_per_element(this);
      unsigned int v21 = (**(uint64_t (***)(jet_texture_Metal *))this)(this) * bytes_per_element;
    }
    if (!a12) {
      unsigned int v22 = (*(uint64_t (**)(jet_texture_Metal *))(*(void *)this + 8))(this) * v21;
    }
    uint64_t v24 = (void *)*((void *)this + 1);
    v25[0] = a5;
    v25[1] = a6;
    v25[2] = a7;
    v25[3] = a8;
    v25[4] = a9;
    v25[5] = a10;
    return [v24 replaceRegion:v25 mipmapLevel:a3 slice:a4 withBytes:a2 bytesPerRow:v21 bytesPerImage:v22];
  }
  return result;
}

uint64_t jet_texture_Metal::copy_data(jet_texture_Metal *this, void *a2, unsigned int a3, unsigned int a4)
{
  uint64_t v8 = (**(unsigned int (***)(jet_texture_Metal *))this)(this);
  uint64_t v9 = (*(unsigned int (**)(jet_texture_Metal *))(*(void *)this + 8))(this);
  uint64_t v10 = (*(unsigned int (**)(jet_texture_Metal *))(*(void *)this + 16))(this);
  unsigned int v11 = (void *)*((void *)this + 1);
  int bytes_per_element = jet_texture::get_bytes_per_element(this);
  uint64_t v13 = (**(unsigned int (***)(jet_texture_Metal *))this)(this) * bytes_per_element;
  memset(v15, 0, 24);
  v15[3] = v8;
  v15[4] = v9;
  v15[5] = v10;
  return [v11 getBytes:a2 bytesPerRow:v13 bytesPerImage:jet_texture::get_bytes_per_image(this) fromRegion:v15 mipmapLevel:a3 slice:a4];
}

uint64_t jet_texture_Metal::generate_mip_map(jet_texture_Metal *this)
{
  if (!*((void *)this + 1)
    || ((*(uint64_t (**)(jet_texture_Metal *))(*(void *)this + 88))(this) & 1) != 0)
  {
    return 0;
  }
  int v3 = [*((id *)this + 1) device];
  unsigned int v4 = (void *)[v3 newCommandQueue];

  int v5 = jet_getClientLabel();
  [v4 setLabel:v5];

  size_t v6 = [v4 commandBuffer];
  uint64_t v7 = [v6 blitCommandEncoder];
  [v7 generateMipmapsForTexture:*((void *)this + 1)];
  [v7 endEncoding];
  [v6 commit];

  return 1;
}

void sub_21FAE3490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL jet_texture_Metal::is_framebuffer_only(id *this)
{
  return jet_texture::is_framebuffer_only((jet_texture *)this)
      || ([this[1] isFramebufferOnly] & 1) != 0
      || this[2] != 0;
}

uint64_t jet_texture_Metal::is_color_attachment_compatible(jet_texture_Metal *this)
{
  if (*((unsigned char *)this + 40)) {
    return 0;
  }
  else {
    return jet_texture::is_color_attachment_compatible(this);
  }
}

BOOL jet_texture_Metal::is_depth_attachment_compatible(jet_texture_Metal *this)
{
  return !*((unsigned char *)this + 40) && jet_texture::is_depth_attachment_compatible(this);
}

BOOL jet_texture_Metal::is_stencil_attachment_compatible(jet_texture_Metal *this)
{
  return !*((unsigned char *)this + 40) && jet_texture::is_stencil_attachment_compatible(this);
}

void jet_texture_Metal::~jet_texture_Metal(jet_texture_Metal *this)
{
  jet_texture_Metal::~jet_texture_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 1);
  *(void *)this = &unk_26D153300;
  *((void *)this + 1) = 0;

  int v3 = (void *)*((void *)this + 2);
  *((void *)this + 2) = 0;

  unsigned int v4 = (void *)*((void *)this + 3);
  *((void *)this + 3) = 0;

  jet_texture::~jet_texture(this);
}

uint64_t jet_texture::get_bytes_per_element(jet_texture *this)
{
  unsigned int v2 = (*(uint64_t (**)(jet_texture *))(*(void *)this + 32))(this) - 7;
  if (v2 > 6) {
    int v3 = 1;
  }
  else {
    int v3 = dword_21FAE9330[v2];
  }
  unsigned int v4 = (*(uint64_t (**)(jet_texture *))(*(void *)this + 32))(this) - 1;
  if (v4 > 0xC) {
    int v5 = 4;
  }
  else {
    int v5 = dword_21FAE934C[v4];
  }
  return (v5 * v3);
}

uint64_t jet_texture::get_bytes_per_image(jet_texture *this)
{
  int bytes_per_element = jet_texture::get_bytes_per_element(this);
  int v3 = (**(uint64_t (***)(jet_texture *))this)(this) * bytes_per_element;
  return v3 * (*(unsigned int (**)(jet_texture *))(*(void *)this + 8))(this);
}

void jet_sampler_Metal::~jet_sampler_Metal(id *this)
{
  jet_sampler::~jet_sampler((jet_sampler *)this);
}

{
  uint64_t vars8;

  jet_sampler::~jet_sampler((jet_sampler *)this);

  JUMPOUT(0x223C592E0);
}

void jet_function_Metal::~jet_function_Metal(jet_function_Metal *this)
{
  unsigned int v2 = (void *)*((void *)this + 1);
  *(void *)this = &unk_26D1533D0;
  *((void *)this + 1) = 0;
}

{
  void *v2;
  uint64_t vars8;

  unsigned int v2 = (void *)*((void *)this + 1);
  *(void *)this = &unk_26D1533D0;
  *((void *)this + 1) = 0;

  JUMPOUT(0x223C592E0);
}

void jet_program_Metal::~jet_program_Metal(jet_program_Metal *this)
{
  jet_program_Metal::~jet_program_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)this = &unk_26D153408;
  unsigned int v2 = (void *)*((void *)this + 4);
  *((void *)this + 4) = 0;

  int v3 = (void *)*((void *)this + 5);
  *((void *)this + 5) = 0;

  jet_program::~jet_program(this);
}

void jet_render_mode_Metal::~jet_render_mode_Metal(jet_render_mode_Metal *this)
{
  jet_render_mode_Metal::~jet_render_mode_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26D153440;
  unsigned int v2 = (void *)*((void *)this + 5);
  *((void *)this + 5) = 0;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 96);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 56);

  jet_render_mode::~jet_render_mode(this);
}

uint64_t jet_render_mode_Metal::get_vertex_buffer_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(a1 + 56), a2);
  if (v2) {
    return *((unsigned int *)v2 + 10);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t jet_render_mode_Metal::get_vertex_constant_index(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

uint64_t jet_render_mode_Metal::get_vertex_texture_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(a1 + 56), a2);
  if (v2) {
    return *((unsigned int *)v2 + 10);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t jet_render_mode_Metal::get_vertex_sampler_index(uint64_t a1, const void **a2)
{
  if (*((char *)a2 + 23) >= 0) {
    size_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v4 = (size_t)a2[1];
  }
  int v5 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v4 + 8);
  if (v11 < 0) {
    int v5 = (void **)__p[0];
  }
  if (v4)
  {
    if (*((char *)a2 + 23) >= 0) {
      size_t v6 = a2;
    }
    else {
      size_t v6 = *a2;
    }
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, "_sampler");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(a1 + 56), (unsigned __int8 *)__p);
  if (v7) {
    uint64_t v8 = *((unsigned int *)v7 + 10);
  }
  else {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  return v8;
}

void sub_21FAE3AD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t jet_render_mode_Metal::get_fragment_constant_index(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 80))();
}

uint64_t jet_render_mode_Metal::get_fragment_texture_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(a1 + 96), a2);
  if (v2) {
    return *((unsigned int *)v2 + 10);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t jet_render_mode_Metal::get_fragment_sampler_index(uint64_t a1, const void **a2)
{
  if (*((char *)a2 + 23) >= 0) {
    size_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v4 = (size_t)a2[1];
  }
  int v5 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v4 + 8);
  if (v11 < 0) {
    int v5 = (void **)__p[0];
  }
  if (v4)
  {
    if (*((char *)a2 + 23) >= 0) {
      size_t v6 = a2;
    }
    else {
      size_t v6 = *a2;
    }
    memmove(v5, v6, v4);
  }
  strcpy((char *)v5 + v4, "_sampler");
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(a1 + 96), (unsigned __int8 *)__p);
  if (v7) {
    uint64_t v8 = *((unsigned int *)v7 + 10);
  }
  else {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  return v8;
}

void sub_21FAE3C18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void jet_render_mode_Metal::clone(jet_render_mode_Metal *this)
{
}

void sub_21FAE3C7C(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C4010E6D84ALL);
  _Unwind_Resume(a1);
}

uint64_t jet_render_mode_Metal::get_fragment_buffer_index(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(a1 + 96), a2);
  if (v2) {
    return *((unsigned int *)v2 + 10);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    unsigned int v2 = __p;
    do
    {
      int v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  char v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      char v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      unsigned int v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void jet_render_mode_Metal::jet_render_mode_Metal(jet_render_mode_Metal *this, const jet_render_mode_Metal *a2)
{
  *(void *)this = &unk_26D152588;
  long long v4 = *(_OWORD *)((char *)a2 + 8);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)this + 8) = v4;
  *(void *)this = &unk_26D153440;
  *((void *)this + 5) = *((id *)a2 + 5);
  *((void *)this + 6) = *((id *)a2 + 6);
  std::unordered_map<std::string,int>::unordered_map((uint64_t)this + 56, (uint64_t)a2 + 56);
  std::unordered_map<std::string,int>::unordered_map((uint64_t)this + 96, (uint64_t)a2 + 96);
}

void sub_21FAE455C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(v2);

  jet_render_mode::~jet_render_mode((jet_render_mode *)v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<std::string,int>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned __int8 **)(a2 + 16); i; uint64_t i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_21FAE45F0(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,int> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  int v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  unsigned int v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *unsigned int v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_21FAE4864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::pair<std::string const,int> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  *((_DWORD *)v8 + 10) = *(_DWORD *)(a3 + 24);
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_21FAE4918(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  float v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v10;
  BOOL v18 = *a4;
  long long v19 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)BOOL v18 = 0;
  *((_DWORD *)i + 10) = 0;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::__rehash<true>(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v26 = *(void *)a1;
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v4);
  if (v27)
  {
    *(void *)uint64_t i = *v27;
LABEL_38:
    *uint64_t v27 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v17;
  *float v17 = i;
  *(void *)(v26 + 8 * v4) = v17;
  if (*(void *)i)
  {
    unint64_t v28 = *(void *)(*(void *)i + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v28 >= v11) {
        v28 %= v11;
      }
    }
    else
    {
      v28 &= v11 - 1;
    }
    uint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v8;
  return i;
}

void sub_21FAE4C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void jet_stencil_mode_Metal::~jet_stencil_mode_Metal(jet_stencil_mode_Metal *this)
{
  jet_stencil_mode_Metal::~jet_stencil_mode_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 1);
  *(void *)this = &unk_26D1534C0;
  *((void *)this + 1) = 0;

  jet_stencil_mode::~jet_stencil_mode(this);
}

void jet_depth_stencil_mode_Metal::~jet_depth_stencil_mode_Metal(jet_depth_stencil_mode_Metal *this)
{
  jet_depth_stencil_mode_Metal::~jet_depth_stencil_mode_Metal(this);

  JUMPOUT(0x223C592E0);
}

{
  void *v2;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 1);
  *(void *)this = &unk_26D1534F8;
  *((void *)this + 1) = 0;

  jet_depth_stencil_mode::~jet_depth_stencil_mode(this);
}

BOOL jet_fence_Metal::is_finished(jet_fence_Metal *this)
{
  if ([*((id *)this + 2) status] != 4) {
    return *((unsigned char *)this + 8) != 0;
  }
  BOOL result = 1;
  *((unsigned char *)this + 8) = 1;
  return result;
}

uint64_t jet_fence_Metal::wait(id *this)
{
  if (!*((unsigned char *)this + 8))
  {
    [this[2] waitUntilCompleted];
    *((unsigned char *)this + 8) = 1;
  }
  return 1;
}

void jet_fence_Metal::~jet_fence_Metal(id *this)
{
  jet_fence::~jet_fence((jet_fence *)this);
}

{
  uint64_t vars8;

  jet_fence::~jet_fence((jet_fence *)this);

  JUMPOUT(0x223C592E0);
}

void std::shared_ptr<jet_fence_Metal>::shared_ptr[abi:ne180100]<jet_fence_Metal,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_21FAE4ED8(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<jet_fence_OpenGL>::shared_ptr[abi:ne180100]<jet_fence_OpenGL,void>(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<jet_fence_Metal *,std::shared_ptr<jet_fence_Metal>::__shared_ptr_default_delete<jet_fence_Metal,jet_fence_Metal>,std::allocator<jet_fence_Metal>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x223C592E0);
}

uint64_t std::__shared_ptr_pointer<jet_fence_Metal *,std::shared_ptr<jet_fence_Metal>::__shared_ptr_default_delete<jet_fence_Metal,jet_fence_Metal>,std::allocator<jet_fence_Metal>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<jet_fence_Metal *,std::shared_ptr<jet_fence_Metal>::__shared_ptr_default_delete<jet_fence_Metal,jet_fence_Metal>,std::allocator<jet_fence_Metal>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void jet_stencil_mode::jet_stencil_mode(jet_stencil_mode *this)
{
  *(void *)this = &unk_26D1535F0;
}

{
  *(void *)this = &unk_26D1535F0;
}

void jet_stencil_mode::~jet_stencil_mode(jet_stencil_mode *this)
{
}

void jet_depth_stencil_mode::jet_depth_stencil_mode(jet_depth_stencil_mode *this)
{
  *(void *)this = &unk_26D153610;
}

{
  *(void *)this = &unk_26D153610;
}

void jet_depth_stencil_mode::~jet_depth_stencil_mode(jet_depth_stencil_mode *this)
{
}

uint64_t jet_isOpenGLSupported(void)
{
  return 1;
}

uint64_t jet_isMetalSupported(void)
{
  if (jet_isMetalSupported(void)::onceToken != -1) {
    dispatch_once(&jet_isMetalSupported(void)::onceToken, &__block_literal_global);
  }
  return jet_isMetalSupported(void)::_isMetalSupported;
}

void ___Z20jet_isMetalSupportedv_block_invoke()
{
  uint64_t v0 = jet_choose_Metal_Device();
  if (v0) {
    jet_isMetalSupported(void)::_isMetalSupported = 1;
  }
}

void jet_createSharedContext(jet_context *a1)
{
  if (a1)
  {
    if ((*(unsigned int (**)(jet_context *))(*(void *)a1 + 136))(a1) == 1)
    {
      operator new();
    }
    if (!(*(unsigned int (**)(jet_context *))(*(void *)a1 + 136))(a1))
    {
      (*(void (**)(void))(v2 + 360))();
      objc_claimAutoreleasedReturnValue();
      operator new();
    }
    jet_createSharedContext();
  }
  jet_createContext();
}

void sub_21FAE52F8(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  MEMORY[0x223C592E0](v1, 0x10A1C40A090A19DLL);
  _Unwind_Resume(a1);
}

void jet_createContext(void)
{
  if (jet_isMetalSupported(void)::onceToken != -1) {
    dispatch_once(&jet_isMetalSupported(void)::onceToken, &__block_literal_global);
  }
  if (jet_isMetalSupported(void)::_isMetalSupported == 1) {
    operator new();
  }
  operator new();
}

void sub_21FAE5408(_Unwind_Exception *a1)
{
  MEMORY[0x223C592E0](v1, 0x10A1C40A090A19DLL);
  _Unwind_Resume(a1);
}

void jet_ensureClientLabel(void)
{
  if (jet_ensureClientLabel(void)::onceToken != -1) {
    dispatch_once(&jet_ensureClientLabel(void)::onceToken, &__block_literal_global_4);
  }
}

void ___Z21jet_ensureClientLabelv_block_invoke()
{
  uint64_t v0 = (void *)_clientLabel;
  _clientLabel = @"com.apple.Jet";
}

void jet_setClientLabel(NSString *a1)
{
  uint64_t v1 = a1;
  if (jet_ensureClientLabel(void)::onceToken != -1) {
    dispatch_once(&jet_ensureClientLabel(void)::onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = (void *)_clientLabel;
  _clientLabel = (uint64_t)v1;
}

id jet_getClientLabel(void)
{
  if (jet_ensureClientLabel(void)::onceToken != -1) {
    dispatch_once(&jet_ensureClientLabel(void)::onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_clientLabel;

  return v0;
}

id jet_get_debug_options(void)
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 dictionaryForKey:@"JetDefaults"];
  uint64_t v2 = (void *)[v1 mutableCopy];

  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
  }
  unint64_t v4 = v3;

  return v4;
}

void sub_21FAE55D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_get_info_plist_flag_is_set(NSString *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 infoDictionary];

  unint64_t v4 = [v3 objectForKey:v1];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_21FAE5698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL jet_util_isPOT(unsigned int a1, unsigned int a2)
{
  BOOL result = 0;
  if (a1)
  {
    int32x2_t v2 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(a1, a2), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(a1, a2), (int32x2_t)-1)));
    if (v2.i8[4] & 1) != 0 && a2 && (v2.i8[0]) {
      return 1;
    }
  }
  return result;
}

BOOL jet_texture_format_is_framebuffer_only(int a1)
{
  return (a1 - 11) < 3;
}

void jet_log(NSString *a1, ...)
{
  va_start(va, a1);
  uint64_t v1 = a1;
  if (v1)
  {
    int32x2_t v2 = v1;
    id v3 = [@"Jet: " stringByAppendingString:v1];

    NSLogv(v3, va);
  }
}

void sub_21FAE5788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void jet_assert(char a1, NSString *a2)
{
  id v3 = a2;
  if (v3 && (a1 & 1) == 0) {
    jet_log(&stru_26D153D90.isa, v3);
  }
  if ((a1 & 1) == 0) {
    __assert_rtn("jet_assert", "jet_utils.mm", 75, "value");
  }
}

void sub_21FAE582C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL jet_debug_option_exists(NSString *a1)
{
  uint64_t v1 = a1;
  int32x2_t v2 = jet_get_debug_options();
  id v3 = [v2 objectForKey:v1];
  BOOL v4 = v3 != 0;

  return v4;
}

void sub_21FAE589C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_debug_option_get_BOOL(NSString *a1)
{
  uint64_t v1 = a1;
  int32x2_t v2 = jet_get_debug_options();
  id v3 = [v2 objectForKey:v1];

  if (v3) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_21FAE5928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_debug_option_get_int(NSString *a1)
{
  uint64_t v1 = a1;
  int32x2_t v2 = jet_get_debug_options();
  id v3 = [v2 objectForKey:v1];

  if (v3) {
    uint64_t v4 = [v3 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_21FAE59C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id jet_debug_option_get_string(NSString *a1)
{
  uint64_t v1 = a1;
  int32x2_t v2 = jet_get_debug_options();
  id v3 = [v2 objectForKey:v1];

  return v3;
}

void sub_21FAE5A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t jet_Metal_Device_is_supported()
{
  return 1;
}

id jet_choose_Metal_Device(void)
{
  id v0 = MTLCreateSystemDefaultDevice();

  return v0;
}

uint64_t jet_buffer_pool::jet_buffer_pool(uint64_t result, int a2, int a3, int a4)
{
  *(void *)BOOL result = &unk_26D153690;
  *(_DWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 24) = result + 24;
  *(void *)(result + 32) = result + 24;
  *(void *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(_DWORD *)(result + 56) = 3;
  return result;
}

void *jet_buffer_pool::initialize_first_buffer(jet_buffer_pool *this)
{
  uint64_t v1 = this;
  uint64_t v2 = (*(uint64_t (**)(jet_buffer_pool *))(*(void *)this + 24))(this);
  BOOL result = operator new(0x18uLL);
  uint64_t v4 = *((void *)v1 + 3);
  uint64_t v1 = (jet_buffer_pool *)((char *)v1 + 24);
  result[1] = v1;
  result[2] = v2;
  *BOOL result = v4;
  *(void *)(v4 + 8) = result;
  *(void *)uint64_t v1 = result;
  uint64_t v5 = *((void *)v1 + 1);
  ++*((void *)v1 + 2);
  *((void *)v1 + 3) = v5;
  return result;
}

uint64_t jet_buffer_pool::get_length(jet_buffer_pool *this)
{
  return (***(uint64_t (****)(void))(*((void *)this + 6) + 16))(*(void *)(*((void *)this + 6) + 16));
}

uint64_t jet_buffer_pool::get_current_buffer(jet_buffer_pool *this)
{
  return *(void *)(*((void *)this + 6) + 16);
}

uint64_t jet_buffer_pool::is_finished(jet_buffer_pool *this)
{
  return jet_buffer::is_finished(*(jet_buffer **)(*((void *)this + 6) + 16));
}

uint64_t jet_buffer_pool::wait(jet_buffer_pool *this)
{
  return jet_buffer::wait(*(dispatch_semaphore_t **)(*((void *)this + 6) + 16));
}

uint64_t jet_buffer_pool::set_data(jet_buffer_pool *this, const void *a2)
{
  return (*(uint64_t (**)(void, const void *))(**(void **)(*((void *)this + 6) + 16) + 8))(*(void *)(*((void *)this + 6) + 16), a2);
}

uint64_t jet_buffer_pool::get_data(jet_buffer_pool *this)
{
  return (*(uint64_t (**)(void))(**(void **)(*((void *)this + 6) + 16) + 16))();
}

uint64_t jet_buffer_pool::commit_data(jet_buffer_pool *this)
{
  return (*(uint64_t (**)(void))(**(void **)(*((void *)this + 6) + 16) + 24))();
}

uint64_t jet_buffer_pool::resize(uint64_t this, uint64_t a2)
{
  *(_DWORD *)(this + 16) = a2;
  uint64_t v2 = *(void *)(this + 48);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    this = jet_buffer::is_finished(*(jet_buffer **)(v2 + 16));
    if (this)
    {
      uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 32);
      return v5(v3, a2);
    }
  }
  return this;
}

uint64_t jet_buffer_pool::next_buffer(jet_buffer_pool *this, int a2)
{
  uint64_t v4 = *(void **)(*((void *)this + 6) + 8);
  *((void *)this + 6) = v4;
  if (v4 == (void *)((char *)this + 24))
  {
    uint64_t v4 = (void *)*((void *)this + 4);
    *((void *)this + 6) = v4;
  }
  uint64_t v5 = v4[2];
  if ((jet_buffer::is_finished((jet_buffer *)v5) & 1) == 0)
  {
    if (*((void *)this + 5) >= (unint64_t)*((unsigned int *)this + 14))
    {
      if (a2) {
        jet_buffer::wait((dispatch_semaphore_t *)v5);
      }
    }
    else
    {
      uint64_t v5 = (*(uint64_t (**)(jet_buffer_pool *))(*(void *)this + 24))(this);
      uint64_t v6 = (uint64_t *)*((void *)this + 6);
      uint64_t v7 = operator new(0x18uLL);
      v7[2] = v5;
      uint64_t v8 = *v6;
      *(void *)(v8 + 8) = v7;
      *uint64_t v7 = v8;
      *uint64_t v6 = (uint64_t)v7;
      v7[1] = v6;
      ++*((void *)this + 5);
      *((void *)this + 6) = v7;
    }
  }
  if (*(_DWORD *)(v5 + 48) != *((_DWORD *)this + 4)) {
    (*(void (**)(uint64_t))(*(void *)v5 + 32))(v5);
  }
  return v5;
}

uint64_t jet_buffer_pool::get_max_buffer_count(jet_buffer_pool *this)
{
  return *((unsigned int *)this + 14);
}

uint64_t jet_buffer_pool::set_max_buffer_count(uint64_t this, unsigned int a2)
{
  if (*(_DWORD *)(this + 56) > a2) {
    jet_buffer_pool::set_max_buffer_count();
  }
  *(_DWORD *)(this + 56) = a2;
  return this;
}

void jet_buffer_pool::~jet_buffer_pool(jet_buffer_pool *this)
{
  *(void *)this = &unk_26D153690;
  uint64_t v1 = (void *)((char *)this + 24);
  for (uint64_t i = (void *)*((void *)this + 4); i != v1; uint64_t i = (void *)i[1])
  {
    uint64_t v3 = i[2];
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 48))(v3);
    }
  }
  std::__list_imp<jet_buffer *>::clear(v1);
  std::__list_imp<jet_buffer *>::clear(v1);
}

void *std::__list_imp<jet_buffer *>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    BOOL result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        BOOL result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void jet_program::jet_program(jet_program *this)
{
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26D1536D0;
  *((void *)this + 1) = (char *)this + 16;
}

{
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26D1536D0;
  *((void *)this + 1) = (char *)this + 16;
}

void jet_program::~jet_program(jet_program *this)
{
  *(void *)this = &unk_26D1536D0;
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = (char *)*((void *)this + 1);
  uint64_t v4 = (char *)this + 16;
  if (v3 != (char *)this + 16)
  {
    do
    {
      uint64_t v5 = *((void *)v3 + 7);
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      uint64_t v6 = (char *)*((void *)v3 + 1);
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          uint64_t v6 = *(char **)v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          uint64_t v7 = (char *)*((void *)v3 + 2);
          BOOL v8 = *(void *)v7 == (void)v3;
          uint64_t v3 = v7;
        }
        while (!v8);
      }
      uint64_t v3 = v7;
    }
    while (v7 != v4);
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)v2, *((void **)this + 2));
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 1) = v4;
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)v2, 0);
}

{
  uint64_t vars8;

  jet_program::~jet_program(this);

  JUMPOUT(0x223C592E0);
}

void jet_framebuffer::clone(jet_framebuffer *this)
{
}

void jet_framebuffer::~jet_framebuffer(jet_framebuffer *this)
{
}

void jet_texture::jet_texture(jet_texture *this)
{
  *(void *)this = &unk_26D153738;
}

uint64_t jet_texture::is_color_attachment_compatible(jet_texture *this)
{
  unsigned int v1 = (*(uint64_t (**)(jet_texture *))(*(void *)this + 32))(this);
  return (v1 < 0xF) & (0x469Eu >> v1);
}

BOOL jet_texture::is_depth_attachment_compatible(jet_texture *this)
{
  return (((*(unsigned int (**)(jet_texture *))(*(void *)this + 32))(this) - 11) & 0xFFFFFFFD) == 0;
}

BOOL jet_texture::is_stencil_attachment_compatible(jet_texture *this)
{
  return (*(unsigned int (**)(jet_texture *))(*(void *)this + 32))(this) - 11 < 2;
}

BOOL jet_texture::is_framebuffer_only(jet_texture *this)
{
  int v1 = (*(uint64_t (**)(jet_texture *))(*(void *)this + 32))(this);

  return jet_texture_format_is_framebuffer_only(v1);
}

uint64_t floatToHalfFloat(float a1)
{
  int v1 = HIWORD(LODWORD(a1)) & 0x8000;
  unsigned int v2 = LODWORD(a1) & 0x7F800000;
  unsigned int v3 = LODWORD(a1) & 0x7FFFFF;
  if ((LODWORD(a1) >> 23) < 0x8Fu)
  {
    unsigned int v4 = v1 | (((v2 + 0x8000000) | v3) >> 13);
    v1 |= v3 >> (((939524096 - v2) >> 23) + 14);
    if (v2 > 0x38000000) {
      LOWORD(v1) = v4;
    }
  }
  else if (v3 && v2 == 2139095040)
  {
    LOWORD(v1) = HIWORD(a1) | 0x7FFF;
  }
  else
  {
    LOWORD(v1) = v1 | 0x7C00;
  }
  return (unsigned __int16)v1;
}

void jet_convert_pixel_data_rgba_fp32_to_rgb32_101010_a8(char *a1, int *a2, unsigned char *a3, int a4, int a5)
{
  if (a4)
  {
    if (a1)
    {
      uint64_t v5 = a2;
      if (a2)
      {
        uint64_t v6 = a3;
        if (a3)
        {
          if (a5)
          {
            int v7 = a5 * a4;
            if (a5 * a4)
            {
              BOOL v8 = (float *)(a1 + 12);
              do
              {
                float v9 = *(v8 - 1);
                double v10 = v9;
                if (v9 < 0.0) {
                  double v10 = -v9;
                }
                if (v10 <= 0.003131) {
                  double v11 = v10 * 12.92;
                }
                else {
                  double v11 = pow(v10, 0.416666667) * 1.055 + -0.055;
                }
                double v12 = -v11;
                if (v9 >= 0.0) {
                  double v12 = v11;
                }
                double v13 = -0.752941;
                if (v12 >= -0.752941)
                {
                  double v13 = v12;
                  if (v12 > 1.252941) {
                    double v13 = 1.252941;
                  }
                }
                *v5++ = ((unsigned __int16)llround(v13 * 510.0) + 384) & 0x3FF;
                float v14 = *v8;
                v8 += 4;
                *v6++ = (int)(float)(v14 * 255.0);
                --v7;
              }
              while (v7);
            }
          }
        }
      }
    }
  }
}

uint64_t jet_convert_pixel_data_rgba_fp32_to_rgba_fp16(uint64_t result, _WORD *a2, int a3, int a4)
{
  if (result)
  {
    unsigned int v4 = a2;
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          int v5 = a4 * a3;
          if (a4 * a3)
          {
            uint64_t v6 = result;
            do
            {
              float v7 = -0.75294;
              if (*(float *)v6 >= -0.75294)
              {
                float v7 = *(float *)v6;
                if (*(float *)v6 > 1.2529) {
                  float v7 = 1.2529;
                }
              }
              *unsigned int v4 = floatToHalfFloat(v7);
              float v8 = *(float *)(v6 + 4);
              float v9 = -0.75294;
              if (v8 >= -0.75294)
              {
                float v9 = *(float *)(v6 + 4);
                if (v8 > 1.2529) {
                  float v9 = 1.2529;
                }
              }
              v4[1] = floatToHalfFloat(v9);
              float v10 = *(float *)(v6 + 8);
              float v11 = -0.75294;
              if (v10 >= -0.75294)
              {
                float v11 = *(float *)(v6 + 8);
                if (v10 > 1.2529) {
                  float v11 = 1.2529;
                }
              }
              v4[2] = floatToHalfFloat(v11);
              float v12 = *(float *)(v6 + 12);
              float v13 = -0.75294;
              if (v12 >= -0.75294)
              {
                float v13 = *(float *)(v6 + 12);
                if (v12 > 1.2529) {
                  float v13 = 1.2529;
                }
              }
              BOOL result = floatToHalfFloat(v13);
              v4[3] = result;
              v6 += 16;
              v4 += 4;
              --v5;
            }
            while (v5);
          }
        }
      }
    }
  }
  return result;
}

float *jet_convert_pixel_data_rgba_fp32_to_argb64_xr10_srgb(float *result, unint64_t *a2, int a3, int a4)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (int i = a4 * a3; i; --i)
          {
            double v5 = *result;
            double v6 = -0.752941;
            if (v5 >= -0.752941)
            {
              double v6 = *result;
              if (v5 > 1.252941) {
                double v6 = 1.252941;
              }
            }
            double v7 = result[1];
            double v8 = -0.752941;
            if (v7 >= -0.752941)
            {
              double v8 = result[1];
              if (v7 > 1.252941) {
                double v8 = 1.252941;
              }
            }
            double v9 = result[2];
            double v10 = -0.752941;
            if (v9 >= -0.752941)
            {
              double v10 = result[2];
              if (v9 > 1.252941) {
                double v10 = 1.252941;
              }
            }
            double v11 = result[3];
            double v12 = -0.752941;
            if (v11 >= -0.752941)
            {
              double v12 = result[3];
              if (v11 > 1.252941) {
                double v12 = 1.252941;
              }
            }
            *a2++ = (unsigned __int16)(((unsigned __int16)llround(v10 * 510.0) << 6) + 24576) & 0xFFC0 | ((unint64_t)(((unsigned __int16)llround(v6 * 510.0) + 384) & 0x3FF) << 38) | ((llround(v8 * 510.0) << 22) + 1610612736) | ((unint64_t)(llround(v12 * 510.0) + 384) << 54);
            result += 4;
          }
        }
      }
    }
  }
  return result;
}

char *jet_convert_pixel_data_rgba_5551_to_rgba_8888(char *result, char *a2, int a3, int a4)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (int i = a4 * a3; i; --i)
          {
            *a2 = (2156535 * (*(unsigned __int16 *)result >> 11)) >> 18;
            a2[1] = (2156535 * ((*(unsigned __int16 *)result >> 6) & 0x1Fu)) >> 18;
            a2[2] = (2156535 * ((*(unsigned __int16 *)result >> 1) & 0x1Fu)) >> 18;
            char v5 = *result;
            result += 2;
            a2[3] = -(v5 & 1);
            a2 += 4;
          }
        }
      }
    }
  }
  return result;
}

char *jet_convert_pixel_data_rgba_4444_to_rgba_8888(char *result, char *a2, int a3, int a4)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (int i = a4 * a3; i; --i)
          {
            *a2 = (*(unsigned __int16 *)result >> 12) | (16 * (*(unsigned __int16 *)result >> 12));
            a2[1] = result[1] & 0xF | (16 * result[1]);
            a2[2] = (*result >> 4) | (16 * (*result >> 4));
            char v5 = *result;
            result += 2;
            a2[3] = v5 & 0xF | (16 * v5);
            a2 += 4;
          }
        }
      }
    }
  }
  return result;
}

unsigned __int16 *jet_convert_pixel_data_rgb_565_to_rgba_8888(unsigned __int16 *result, char *a2, int a3, int a4)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          for (int i = a4 * a3; i; --i)
          {
            *a2 = (2156535 * (*result >> 11)) >> 18;
            a2[1] = (4244475 * ((*result >> 5) & 0x3Fu)) >> 20;
            __int16 v5 = *result++;
            a2[2] = (2156535 * (v5 & 0x1Fu)) >> 18;
            a2[3] = -1;
            a2 += 4;
          }
        }
      }
    }
  }
  return result;
}

uint64_t jet_convert_pixel_data_bgra_8888_to_rgba_8888(uint64_t result, char *a2, int a3, int a4)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          int v4 = a4 * a3;
          if (a4 * a3)
          {
            __int16 v5 = (char *)(result + 3);
            do
            {
              *a2 = *(v5 - 1);
              a2[1] = *(v5 - 2);
              a2[2] = *(v5 - 3);
              char v6 = *v5;
              v5 += 4;
              a2[3] = v6;
              a2 += 4;
              --v4;
            }
            while (v4);
          }
        }
      }
    }
  }
  return result;
}

void jet_buffer::jet_buffer(jet_buffer *this)
{
  *(void *)this = &unk_26D1537E0;
  *((unsigned char *)this + 8) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 22) = 1065353216;
}

uint64_t jet_buffer::is_finished(jet_buffer *this)
{
  if (*((unsigned char *)this + 8)) {
    return 0;
  }
  unsigned int v3 = (uint64_t (***)(void))*((void *)this + 3);
  if (v3)
  {
    uint64_t result = (**v3)(v3);
    if (!result) {
      return result;
    }
    int v4 = (std::__shared_weak_count *)*((void *)this + 4);
    *((void *)this + 3) = 0;
    *((void *)this + 4) = 0;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  return 1;
}

uint64_t jet_buffer::wait(dispatch_semaphore_t *this)
{
  if (jet_buffer::is_finished((jet_buffer *)this)) {
    return 1;
  }
  if (*((unsigned char *)this + 8))
  {
    int v3 = 1;
    do
    {
      while (this[3])
      {
        if (!v3) {
          goto LABEL_9;
        }
      }
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
      dispatch_semaphore_t v5 = this[2];
      this[2] = v4;

      dispatch_semaphore_wait(this[2], 0xFFFFFFFFFFFFFFFFLL);
      int v3 = *((unsigned __int8 *)this + 8);
    }
    while (*((unsigned char *)this + 8));
  }
LABEL_9:
  uint64_t result = jet_buffer::is_finished((jet_buffer *)this);
  dispatch_semaphore_t v6 = this[3];
  if (v6)
  {
    uint64_t result = (*((uint64_t (**)(dispatch_semaphore_t))v6->isa + 1))(this[3]);
    if (result)
    {
      double v7 = (std::__shared_weak_count *)this[4];
      this[3] = 0;
      this[4] = 0;
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
      return 1;
    }
  }
  return result;
}

void jet_buffer::~jet_buffer(dispatch_semaphore_t *this)
{
  *this = (dispatch_semaphore_t)&unk_26D1537E0;
  if (this[2])
  {
    while (dispatch_semaphore_signal(this[2]))
      ;
  }
  for (int i = this[9]; i; int i = (void *)*i)
  {
    int v3 = (void *)i[2];
    dispatch_semaphore_t v5 = this;
    std::__hash_table<std::unordered_set<jet_buffer *> *,std::hash<std::unordered_set<jet_buffer *> *>,std::equal_to<std::unordered_set<jet_buffer *> *>,std::allocator<std::unordered_set<jet_buffer *> *>>::__erase_unique<std::unordered_set<jet_buffer *> *>(v3, &v5);
  }
  std::__hash_table<jet_buffer *,std::hash<jet_buffer *>,std::equal_to<jet_buffer *>,std::allocator<jet_buffer *>>::~__hash_table((uint64_t)(this + 7));
  dispatch_semaphore_t v4 = (std::__shared_weak_count *)this[4];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void xglProgram::xglProgram(xglProgram *this, GLchar *a2, GLchar *a3, EAGLContext *a4)
{
  double v7 = a4;
  *((void *)this + 7) = 0;
  *((void *)this + 6) = (char *)this + 56;
  *((void *)this + 1) = v7;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 3) = (char *)this + 32;
  *((void *)this + 5) = 0;
  *((void *)this + 8) = 0;
  double v8 = v7;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x263F146E8] currentContext];
    double v10 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v9;

    double v8 = (EAGLContext *)*((void *)this + 1);
  }
  glContextUse::glContextUse((glContextUse *)v16, v8);
  *(void *)shader = 0;
  *((_DWORD *)this + 4) = glCreateProgram();
  if (!xglCompileShader(&shader[1], 35633, a2, 0))
  {
    float v13 = "xglCompileShader(&vertexShaderId, GL_VERTEX_SHADER, vertexShaderSource)";
    int v14 = 34;
    goto LABEL_11;
  }
  if (!xglCompileShader(shader, 35632, a3, 0))
  {
    float v13 = "xglCompileShader(&fragmentShaderId, GL_FRAGMENT_SHADER, fragmentShaderSource)";
    int v14 = 35;
LABEL_11:
    __assert_rtn("xglProgram", "xglProgram.mm", v14, v13);
  }
  GLuint v11 = shader[1];
  if (shader[1] && shader[0])
  {
    GLuint Program = glCreateProgram();
    *((_DWORD *)this + 4) = Program;
    glAttachShader(Program, shader[1]);
    glAttachShader(*((_DWORD *)this + 4), shader[0]);
    xglLinkProgram(*((_DWORD *)this + 4));
    glDetachShader(*((_DWORD *)this + 4), shader[1]);
    glDetachShader(*((_DWORD *)this + 4), shader[0]);
    GLuint v11 = shader[1];
  }
  glDeleteShader(v11);
  glDeleteShader(shader[0]);
  glContextUse::~glContextUse((glContextUse *)v16);
}

void sub_21FAE6B98(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v3, *(char **)(v1 + 56));
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v4, *(char **)(v1 + 32));

  _Unwind_Resume(a1);
}

void xglProgram::xglProgram(xglProgram *this, GLuint a2, GLuint a3, EAGLContext *a4)
{
  double v7 = a4;
  *(unsigned char *)this = 0;
  double v8 = v7;
  *((void *)this + 7) = 0;
  *((void *)this + 6) = (char *)this + 56;
  *((void *)this + 1) = v8;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 3) = (char *)this + 32;
  *((void *)this + 5) = 0;
  *((void *)this + 8) = 0;
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v10 = [MEMORY[0x263F146E8] currentContext];
    GLuint v11 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v10;

    uint64_t v9 = (EAGLContext *)*((void *)this + 1);
  }
  glContextUse::glContextUse((glContextUse *)v13, v9);
  if (a2 && a3)
  {
    GLuint Program = glCreateProgram();
    *((_DWORD *)this + 4) = Program;
    glAttachShader(Program, a2);
    glAttachShader(*((_DWORD *)this + 4), a3);
    xglLinkProgram(*((_DWORD *)this + 4));
    glDetachShader(*((_DWORD *)this + 4), a2);
    glDetachShader(*((_DWORD *)this + 4), a3);
  }
  glContextUse::~glContextUse((glContextUse *)v13);
}

void sub_21FAE6CE4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v3, *(char **)(v1 + 56));
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(v4, *(char **)(v1 + 32));

  _Unwind_Resume(a1);
}

void xglProgram::~xglProgram(xglProgram *this)
{
  glContextUse::glContextUse((glContextUse *)v2, *((EAGLContext **)this + 1));
  glDeleteProgram(*((_DWORD *)this + 4));
  *((_DWORD *)this + 4) = 0;
  glContextUse::~glContextUse((glContextUse *)v2);
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy((uint64_t)this + 48, *((char **)this + 7));
  std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy((uint64_t)this + 24, *((char **)this + 4));
}

uint64_t xglProgram::getAttributeIndex(xglProgram *this, char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  uint64_t v4 = (unsigned int *)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>((uint64_t)this + 48, (const void **)__p);
  if ((unsigned int *)((char *)this + 56) == v4) {
    uint64_t AttribLocation = glGetAttribLocation(*((_DWORD *)this + 4), a2);
  }
  else {
    uint64_t AttribLocation = v4[14];
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return AttribLocation;
}

void sub_21FAE6E18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t xglProgram::getUniformLocation(xglProgram *this, char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(v10, a2);
  uint64_t v4 = (uint64_t **)((char *)this + 24);
  dispatch_semaphore_t v5 = (unsigned int *)std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>((uint64_t)this + 24, (const void **)v10);
  if ((unsigned int *)((char *)this + 32) == v5)
  {
    uint64_t UniformLocation = glGetUniformLocation(*((_DWORD *)this + 4), a2);
    std::string::basic_string[abi:ne180100]<0>(__p, a2);
    double v12 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (const void **)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v12)+ 14) = UniformLocation;
    if (v9 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    uint64_t UniformLocation = v5[14];
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }
  return UniformLocation;
}

void sub_21FAE6F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform1i(UniformLocation, a3);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3, GLint a4)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform2i(UniformLocation, a3, a4);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3, GLint a4, GLint a5)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform3i(UniformLocation, a3, a4, a5);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, GLint a3, GLint a4, GLint a5, GLint a6)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform4i(UniformLocation, a3, a4, a5, a6);
}

void xglProgram::setUniformInt(xglProgram *this, char *a2, int a3, const int *a4, GLsizei a5)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);
  switch(a3)
  {
    case 1:
      glUniform1iv(UniformLocation, a5, a4);
      break;
    case 2:
      glUniform2iv(UniformLocation, a5, a4);
      break;
    case 3:
      glUniform3iv(UniformLocation, a5, a4);
      break;
    case 4:
      glUniform4iv(UniformLocation, a5, a4);
      break;
    default:
      return;
  }
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform1f(UniformLocation, a3);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3, GLfloat a4)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform2f(UniformLocation, a3, a4);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3, GLfloat a4, GLfloat a5)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform3f(UniformLocation, a3, a4, a5);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, GLfloat a3, GLfloat a4, GLfloat a5, GLfloat a6)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);

  glUniform4f(UniformLocation, a3, a4, a5, a6);
}

void xglProgram::setUniformFloat(xglProgram *this, char *a2, int a3, const float *a4, GLsizei a5)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);
  switch(a3)
  {
    case 1:
      glUniform1fv(UniformLocation, a5, a4);
      break;
    case 2:
      glUniform2fv(UniformLocation, a5, a4);
      break;
    case 3:
      glUniform3fv(UniformLocation, a5, a4);
      break;
    case 4:
      glUniform4fv(UniformLocation, a5, a4);
      break;
    default:
      return;
  }
}

void xglProgram::setUniformMatrix(xglProgram *this, char *a2, int a3, const float *a4, GLsizei a5)
{
  GLint UniformLocation = xglProgram::getUniformLocation(this, a2);
  switch(a3)
  {
    case 4:
      glUniformMatrix4fv(UniformLocation, a5, 0, a4);
      break;
    case 3:
      glUniformMatrix3fv(UniformLocation, a5, 0, a4);
      break;
    case 2:
      glUniformMatrix2fv(UniformLocation, a5, 0, a4);
      break;
  }
}

BOOL xglProgram::validate(xglProgram *this)
{
  return xglValidateProgram(*((_DWORD *)this + 4));
}

void xglProgram::use(xglProgram *this)
{
}

void std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    char v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      char v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    char v8 = a3;
  }
  else {
    char v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

_OWORD *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v6 = (void **)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  size_t v7 = *v6;
  if (!*v6)
  {
    char v8 = (uint64_t **)v6;
    size_t v7 = operator new(0x40uLL);
    size_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *size_t v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    std::__tree<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::__map_value_compare<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>,std::less<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::tuple<jet_blend_mode,jet_texture_format,jet_texture_format,jet_texture_format,unsigned int,unsigned int>,jet_render_mode *>>>::__insert_node_at(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        char v8 = (void *)v4;
        size_t v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    char v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

void jet_sampler::jet_sampler(jet_sampler *this)
{
  *(void *)this = &unk_26D153878;
}

{
  *(void *)this = &unk_26D153878;
}

void jet_sampler::~jet_sampler(jet_sampler *this)
{
}

void jet_constant::jet_constant(jet_constant *this)
{
  *(void *)this = &unk_26D1538A8;
}

void xglAssertNoError()
{
  jet_log(&cfstr_GlInvalidFrame.isa);

  xglPrintFramebufferStatus();
}

{
  __assert_rtn("xglAssertNoError", "xgl_utils.mm", 479, "code == GL_NO_ERROR");
}

void jet_context::set_vertex_texture()
{
}

void jet_context::set_fragment_texture()
{
}

void (***std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<jet_render_op>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>,std::reverse_iterator<jet_render_op*>>(void (***a1)(void), void (***a2)(void)))(void)
{
  int v3 = a1;
  uint64_t v4 = a1;
  do
  {
    size_t v5 = *v4;
    v4 += 24;
    (*v5)();
    v3 += 24;
    uint64_t result = v4;
  }
  while (v4 != a2);
  return result;
}

void jet_context_OpenGL::create_texture()
{
  __assert_rtn("create_texture", "jet_context_OpenGL.mm", 381, "array_length == 1");
}

{
  __assert_rtn("create_texture", "jet_context_OpenGL.mm", 380, "depth == 1");
}

void jet_context_OpenGL::begin_render_pass()
{
}

{
  __assert_rtn("begin_render_pass", "jet_context_OpenGL.mm", 826, "depthTexture->is_depth_attachment_compatible()");
}

{
  __assert_rtn("begin_render_pass", "jet_context_OpenGL.mm", 822, "colorTexture->is_color_attachment_compatible()");
}

void jet_context_OpenGL::set_vertex_buffer()
{
  __assert_rtn("set_vertex_buffer", "jet_context_OpenGL.mm", 1261, "index >= 0");
}

void jet_context_OpenGL::set_vertex_constant()
{
  __assert_rtn("set_vertex_constant", "jet_context_OpenGL.mm", 1287, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_OpenGL.mm", 1383, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_OpenGL.mm", 1384, "data");
}

void jet_context_OpenGL::set_vertex_texture()
{
  __assert_rtn("set_vertex_texture", "jet_context_OpenGL.mm", 1402, "index >= 0");
}

void jet_context_OpenGL::set_vertex_sampler()
{
  __assert_rtn("set_vertex_sampler", "jet_context_OpenGL.mm", 1424, "index >= 0");
}

void jet_context_OpenGL::draw_indexed()
{
  __assert_rtn("draw_indexed", "jet_context_OpenGL.mm", 1500, "indexType == jet_component_type_unsigned_int || indexType == jet_component_type_unsigned_short");
}

void jet_buffer_OpenGL::set_data()
{
  __assert_rtn("set_data", "jet_types_OpenGL.h", 1046, "length + offset <= _length");
}

void jet_buffer_OpenGL::commit_data()
{
  __assert_rtn("commit_data", "jet_types_OpenGL.h", 981, "length + offset <= _length");
}

void jet_texture_OpenGL::set_data()
{
}

void jet_texture_OpenGL::replace_region()
{
}

uint64_t std::shared_ptr<jet_fence_OpenGL>::shared_ptr[abi:ne180100]<jet_fence_OpenGL,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 24))();
}

void jet_context_Metal::create_texture()
{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 582, "type == jet_texture_type_2D || type == jet_texture_type_Rect");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 580, "data == nullptr");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 579, "mip_mapped == false");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 574, "array_length == 1");
}

{
  __assert_rtn("create_texture", "jet_context_Metal.mm", 573, "depth == 1");
}

void jet_context_Metal::create_texture_from_IOSurface()
{
  __assert_rtn("create_texture_from_IOSurface", "jet_context_Metal.mm", 668, "bytesPerRow % JET_IO_SURFACE_MIN_READ_ALIGNMENT == 0");
}

void jet_context_Metal::create_program()
{
}

{
  __assert_rtn("create_program", "jet_context_Metal.mm", 850, "fragmentFunction");
}

{
  __assert_rtn("create_program", "jet_context_Metal.mm", 852, "getMetalFunction(vertexFunction)");
}

{
  __assert_rtn("create_program", "jet_context_Metal.mm", 853, "getMetalFunction(fragmentFunction)");
}

void jet_context_Metal::begin_render_pass()
{
}

{
  __assert_rtn("begin_render_pass", "jet_context_Metal.mm", 1120, "depthTexture->is_depth_attachment_compatible()");
}

{
  __assert_rtn("begin_render_pass", "jet_context_Metal.mm", 1116, "colorTexture->is_color_attachment_compatible()");
}

void jet_context_Metal::set_vertex_buffer()
{
  __assert_rtn("set_vertex_buffer", "jet_context_Metal.mm", 1338, "index >= 0");
}

void jet_context_Metal::set_vertex_constant()
{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1343, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1352, "index >= 0");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1353, "data");
}

{
  __assert_rtn("set_vertex_constant", "jet_context_Metal.mm", 1354, "elementCount == 1");
}

void jet_context_Metal::set_vertex_texture()
{
  __assert_rtn("set_vertex_texture", "jet_context_Metal.mm", 1361, "index >= 0");
}

void jet_context_Metal::set_vertex_sampler()
{
  __assert_rtn("set_vertex_sampler", "jet_context_Metal.mm", 1366, "index >= 0");
}

void jet_context_Metal::set_fragment_texture()
{
  __assert_rtn("set_fragment_texture", "jet_context_Metal.mm", 1371, "index >= 0");
}

void jet_context_Metal::set_fragment_sampler()
{
  __assert_rtn("set_fragment_sampler", "jet_context_Metal.mm", 1376, "index >= 0");
}

void jet_context_Metal::set_fragment_constant()
{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1382, "index >= 0");
}

{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1392, "index >= 0");
}

{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1393, "data");
}

{
  __assert_rtn("set_fragment_constant", "jet_context_Metal.mm", 1394, "elementCount == 1");
}

void jet_context_Metal::draw_indexed()
{
  __assert_rtn("draw_indexed", "jet_context_Metal.mm", 1421, "indexType == jet_component_type_unsigned_int || indexType == jet_component_type_unsigned_short");
}

void jet_texture_Metal::replace_region()
{
}

void jet_createSharedContext()
{
}

void jet_buffer_pool::set_max_buffer_count()
{
  __assert_rtn("set_max_buffer_count", "jet_buffer_pool.mm", 102, "count >= _maxBufferCount");
}

void CFRelease(CFTypeRef cf)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E28](*(void *)&csid);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLogv(NSString *format, va_list args)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void free(void *a1)
{
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

void glBlendEquation(GLenum mode)
{
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x270EF9828](*(void *)&target);
}

void glClear(GLbitfield mask)
{
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glClearStencil(GLint s)
{
}

uint64_t glClientWaitSyncAPPLE()
{
  return MEMORY[0x270EF9848]();
}

void glColorMask(GLBOOLean red, GLBOOLean green, GLBOOLean blue, GLBOOLean alpha)
{
}

void glCompileShader(GLuint shader)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x270EF9868]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x270EF9870](*(void *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

uint64_t glDeleteSyncAPPLE()
{
  return MEMORY[0x270EF98A8]();
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

void glDepthFunc(GLenum func)
{
}

void glDepthMask(GLBOOLean flag)
{
}

void glDetachShader(GLuint program, GLuint shader)
{
}

void glDisable(GLenum cap)
{
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x270EF98E0]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

uint64_t glFenceSyncAPPLE()
{
  return MEMORY[0x270EF9908]();
}

void glFlush(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

void glGenerateMipmap(GLenum target)
{
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF9980](*(void *)&program, name);
}

void glGetBooleanv(GLenum pname, GLBOOLean *params)
{
}

GLenum glGetError(void)
{
  return MEMORY[0x270EF9990]();
}

void glGetFloatv(GLenum pname, GLfloat *params)
{
}

void glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint *params)
{
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF99E8](*(void *)&program, name);
}

void glGetVertexAttribiv(GLuint index, GLenum pname, GLint *params)
{
}

void glLinkProgram(GLuint program)
{
}

uint64_t glMapBufferRangeEXT()
{
  return MEMORY[0x270EF9A18]();
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
{
}

void glStencilMask(GLuint mask)
{
}

void glStencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform1iv(GLint location, GLsizei count, const GLint *v)
{
}

void glUniform2f(GLint location, GLfloat x, GLfloat y)
{
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform2i(GLint location, GLint x, GLint y)
{
}

void glUniform2iv(GLint location, GLsizei count, const GLint *v)
{
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform3i(GLint location, GLint x, GLint y, GLint z)
{
}

void glUniform3iv(GLint location, GLsizei count, const GLint *v)
{
}

void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)
{
}

void glUniform4iv(GLint location, GLsizei count, const GLint *v)
{
}

void glUniformMatrix2fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

uint64_t glUnmapBufferOES()
{
  return MEMORY[0x270EF9B60]();
}

void glUseProgram(GLuint program)
{
}

void glValidateProgram(GLuint program)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}