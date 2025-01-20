@interface AGXG17FamilyIndirectArgumentEncoder
- (AGXG17FamilyIndirectArgumentEncoder)initWithLayout:(id)a3 device:(id)a4;
- (id).cxx_construct;
- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3;
- (unint64_t)alignment;
- (unint64_t)encodedLength;
- (void)constantDataAtIndex:(unint64_t)a3;
- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4;
- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4;
- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4;
- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4;
- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation AGXG17FamilyIndirectArgumentEncoder

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

- (void).cxx_destruct
{
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    do
    {
      uint64_t v8 = (uint64_t)*a3++;
      [(AGXG17FamilyIndirectArgumentEncoder *)self setIndirectCommandBuffer:v8 atIndex:location++];
      --length;
    }
    while (length);
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  if (!a3)
  {
    layout = self->_impl.layout;
    v11 = (char *)layout + 8;
    if (*(unsigned char *)layout)
    {
      int v12 = 16;
    }
    else
    {
      int v12 = *((_DWORD *)layout + 4);
      if (!v12) {
        goto LABEL_31;
      }
      v11 = (char *)*((void *)layout + 1);
    }
    int v15 = v12 - 1;
    uint64_t v16 = (v12 - 1) & (37 * a4);
    int v17 = *(_DWORD *)&v11[16 * v16];
    if (v17 == a4)
    {
LABEL_15:
      uint64_t v18 = *(unsigned int *)&v11[16 * v16 + 8];
LABEL_16:
      *(void *)&self->_impl.arguments[v18] = 0;
      return;
    }
    int v26 = 1;
    while (v17 != -1)
    {
      int v27 = v16 + v26++;
      uint64_t v16 = v27 & v15;
      int v17 = *(_DWORD *)&v11[16 * v16];
      if (v17 == a4) {
        goto LABEL_15;
      }
    }
LABEL_31:
    uint64_t v18 = 0;
    goto LABEL_16;
  }
  int v4 = *((_DWORD *)a3 + 92);
  if (v4 == 1)
  {
    uint64_t v5 = *(unsigned int *)(*((void *)a3 + 48) + 408);
    v13 = self->_impl.layout;
    arguments = self->_impl.arguments;
    uint64_t v8 = (char *)v13 + 8;
    if (*(unsigned char *)v13)
    {
      int v14 = 16;
    }
    else
    {
      int v14 = *((_DWORD *)v13 + 4);
      if (!v14) {
        goto LABEL_36;
      }
      uint64_t v8 = (char *)*((void *)v13 + 1);
    }
    int v24 = v14 - 1;
    uint64_t v20 = (v14 - 1) & (37 * a4);
    int v25 = *(_DWORD *)&v8[16 * v20];
    if (v25 != a4)
    {
      int v28 = 1;
      while (v25 != -1)
      {
        int v29 = v20 + v28++;
        uint64_t v20 = v29 & v24;
        int v25 = *(_DWORD *)&v8[16 * v20];
        if (v25 == a4) {
          goto LABEL_26;
        }
      }
      goto LABEL_36;
    }
    goto LABEL_26;
  }
  if (!v4)
  {
    uint64_t v5 = *(unsigned int *)(*((void *)a3 + 48) + 128);
    v7 = self->_impl.layout;
    arguments = self->_impl.arguments;
    uint64_t v8 = (char *)v7 + 8;
    if (*(unsigned char *)v7)
    {
      int v9 = 16;
LABEL_19:
      int v19 = v9 - 1;
      uint64_t v20 = (v9 - 1) & (37 * a4);
      int v21 = *(_DWORD *)&v8[16 * v20];
      if (v21 != a4)
      {
        int v22 = 1;
        while (v21 != -1)
        {
          int v23 = v20 + v22++;
          uint64_t v20 = v23 & v19;
          int v21 = *(_DWORD *)&v8[16 * v20];
          if (v21 == a4) {
            goto LABEL_26;
          }
        }
        goto LABEL_36;
      }
LABEL_26:
      *(void *)&arguments[*(unsigned int *)&v8[16 * v20 + 8]] = v5;
      return;
    }
    int v9 = *((_DWORD *)v7 + 4);
    if (v9)
    {
      uint64_t v8 = (char *)*((void *)v7 + 1);
      goto LABEL_19;
    }
LABEL_36:
    *(void *)arguments = v5;
  }
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t length_low = LODWORD(a4.length);
  if (LODWORD(a4.length))
  {
    uint64_t v5 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      int v9 = (unsigned int *)a3[v5];
      if (v9) {
        int v9 = (unsigned int *)v9[268];
      }
      if (*(unsigned char *)layout)
      {
        int v10 = 16;
        v11 = (char *)layout + 8;
      }
      else
      {
        int v10 = *((_DWORD *)layout + 4);
        if (!v10) {
          goto LABEL_3;
        }
        v11 = (char *)*((void *)layout + 1);
      }
      int v12 = v10 - 1;
      uint64_t v13 = (v10 - 1) & (37 * (v5 + LODWORD(a4.location)));
      int v14 = *(_DWORD *)&v11[16 * (v12 & (37 * (v5 + LODWORD(a4.location))))];
      if (v14 == v5 + LODWORD(a4.location))
      {
LABEL_12:
        uint64_t v8 = *(unsigned int *)&v11[16 * v13 + 8];
        goto LABEL_4;
      }
      int v15 = 1;
      while (v14 != -1)
      {
        int v16 = v13 + v15++;
        uint64_t v13 = v16 & v12;
        int v14 = *(_DWORD *)&v11[16 * v13];
        if (v14 == v5 + LODWORD(a4.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v8 = 0;
LABEL_4:
      *(void *)&arguments[v8] = v9;
      ++v5;
    }
    while (v5 != length_low);
  }
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((unsigned int *)a3 + 268);
  }
  else {
    uint64_t v4 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  v7 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v8 = 16;
  }
  else
  {
    int v8 = *((_DWORD *)layout + 4);
    if (!v8) {
      goto LABEL_14;
    }
    v7 = (char *)*((void *)layout + 1);
  }
  int v9 = v8 - 1;
  uint64_t v10 = (v8 - 1) & (37 * a4);
  int v11 = *(_DWORD *)&v7[16 * v10];
  if (v11 == a4)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v7[16 * v10 + 8]] = v4;
    return;
  }
  int v12 = 1;
  while (v11 != -1)
  {
    int v13 = v10 + v12++;
    uint64_t v10 = v13 & v9;
    int v11 = *(_DWORD *)&v7[16 * v10];
    if (v11 == a4) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v4;
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t length_low = LODWORD(a4.length);
  if (LODWORD(a4.length))
  {
    uint64_t v5 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      int v9 = (unsigned int *)a3[v5];
      if (v9) {
        int v9 = (unsigned int *)v9[40];
      }
      if (*(unsigned char *)layout)
      {
        int v10 = 16;
        int v11 = (char *)layout + 8;
      }
      else
      {
        int v10 = *((_DWORD *)layout + 4);
        if (!v10) {
          goto LABEL_3;
        }
        int v11 = (char *)*((void *)layout + 1);
      }
      int v12 = v10 - 1;
      uint64_t v13 = (v10 - 1) & (37 * (v5 + LODWORD(a4.location)));
      int v14 = *(_DWORD *)&v11[16 * (v12 & (37 * (v5 + LODWORD(a4.location))))];
      if (v14 == v5 + LODWORD(a4.location))
      {
LABEL_12:
        uint64_t v8 = *(unsigned int *)&v11[16 * v13 + 8];
        goto LABEL_4;
      }
      int v15 = 1;
      while (v14 != -1)
      {
        int v16 = v13 + v15++;
        uint64_t v13 = v16 & v12;
        int v14 = *(_DWORD *)&v11[16 * v13];
        if (v14 == v5 + LODWORD(a4.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v8 = 0;
LABEL_4:
      *(void *)&arguments[v8] = v9;
      ++v5;
    }
    while (v5 != length_low);
  }
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((unsigned int *)a3 + 40);
  }
  else {
    uint64_t v4 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  v7 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v8 = 16;
  }
  else
  {
    int v8 = *((_DWORD *)layout + 4);
    if (!v8) {
      goto LABEL_14;
    }
    v7 = (char *)*((void *)layout + 1);
  }
  int v9 = v8 - 1;
  uint64_t v10 = (v8 - 1) & (37 * a4);
  int v11 = *(_DWORD *)&v7[16 * v10];
  if (v11 == a4)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v7[16 * v10 + 8]] = v4;
    return;
  }
  int v12 = 1;
  while (v11 != -1)
  {
    int v13 = v10 + v12++;
    uint64_t v10 = v13 & v9;
    int v11 = *(_DWORD *)&v7[16 * v10];
    if (v11 == a4) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v4;
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyIndirectArgumentEncoder;
  return [(_MTLIndirectArgumentEncoder *)&v4 newArgumentEncoderForBufferAtIndex:a3];
}

- (unint64_t)alignment
{
  return *((void *)self->_impl.layout + 34);
}

- (unint64_t)encodedLength
{
  return *((void *)self->_impl.layout + 33);
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  layout = self->_impl.layout;
  objc_super v4 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v5 = 16;
  }
  else
  {
    int v5 = *((_DWORD *)layout + 4);
    if (!v5) {
      return self->_impl.arguments;
    }
    objc_super v4 = (char *)*((void *)layout + 1);
  }
  int v6 = v5 - 1;
  uint64_t v7 = (v5 - 1) & (37 * a3);
  int v8 = *(_DWORD *)&v4[16 * v7];
  if (v8 == a3) {
    return &self->_impl.arguments[*(void *)&v4[16 * v7 + 8] & 0xFFFFFFFFFFFFFFLL];
  }
  int v10 = 1;
  while (v8 != -1)
  {
    int v11 = v7 + v10++;
    uint64_t v7 = v11 & v6;
    int v8 = *(_DWORD *)&v4[16 * v7];
    if (v8 == a3) {
      return &self->_impl.arguments[*(void *)&v4[16 * v7 + 8] & 0xFFFFFFFFFFFFFFLL];
    }
  }
  return self->_impl.arguments;
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t length_low = LODWORD(a4.length);
  if (LODWORD(a4.length))
  {
    uint64_t v5 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      int v9 = (unsigned int *)a3[v5];
      if (v9) {
        int v9 = (unsigned int *)v9[36];
      }
      if (*(unsigned char *)layout)
      {
        int v10 = 16;
        int v11 = (char *)layout + 8;
      }
      else
      {
        int v10 = *((_DWORD *)layout + 4);
        if (!v10) {
          goto LABEL_3;
        }
        int v11 = (char *)*((void *)layout + 1);
      }
      int v12 = v10 - 1;
      uint64_t v13 = (v10 - 1) & (37 * (v5 + LODWORD(a4.location)));
      int v14 = *(_DWORD *)&v11[16 * (v12 & (37 * (v5 + LODWORD(a4.location))))];
      if (v14 == v5 + LODWORD(a4.location))
      {
LABEL_12:
        uint64_t v8 = *(unsigned int *)&v11[16 * v13 + 8];
        goto LABEL_4;
      }
      int v15 = 1;
      while (v14 != -1)
      {
        int v16 = v13 + v15++;
        uint64_t v13 = v16 & v12;
        int v14 = *(_DWORD *)&v11[16 * v13];
        if (v14 == v5 + LODWORD(a4.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v8 = 0;
LABEL_4:
      *(void *)&arguments[v8] = v9;
      ++v5;
    }
    while (v5 != length_low);
  }
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((unsigned int *)a3 + 36);
  }
  else {
    uint64_t v4 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  uint64_t v7 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v8 = 16;
  }
  else
  {
    int v8 = *((_DWORD *)layout + 4);
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v7 = (char *)*((void *)layout + 1);
  }
  int v9 = v8 - 1;
  uint64_t v10 = (v8 - 1) & (37 * a4);
  int v11 = *(_DWORD *)&v7[16 * v10];
  if (v11 == a4)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v7[16 * v10 + 8]] = v4;
    return;
  }
  int v12 = 1;
  while (v11 != -1)
  {
    int v13 = v10 + v12++;
    uint64_t v10 = v13 & v9;
    int v11 = *(_DWORD *)&v7[16 * v10];
    if (v11 == a4) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v4;
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t length_low = LODWORD(a4.length);
  if (LODWORD(a4.length))
  {
    uint64_t v5 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      int v9 = a3[v5];
      if (v9) {
        int v9 = (void *)*(unsigned int *)(v9[67] + 120);
      }
      if (*(unsigned char *)layout)
      {
        int v10 = 16;
        int v11 = (char *)layout + 8;
      }
      else
      {
        int v10 = *((_DWORD *)layout + 4);
        if (!v10) {
          goto LABEL_3;
        }
        int v11 = (char *)*((void *)layout + 1);
      }
      int v12 = v10 - 1;
      uint64_t v13 = (v10 - 1) & (37 * (v5 + LODWORD(a4.location)));
      int v14 = *(_DWORD *)&v11[16 * (v12 & (37 * (v5 + LODWORD(a4.location))))];
      if (v14 == v5 + LODWORD(a4.location))
      {
LABEL_12:
        uint64_t v8 = *(unsigned int *)&v11[16 * v13 + 8];
        goto LABEL_4;
      }
      int v15 = 1;
      while (v14 != -1)
      {
        int v16 = v13 + v15++;
        uint64_t v13 = v16 & v12;
        int v14 = *(_DWORD *)&v11[16 * v13];
        if (v14 == v5 + LODWORD(a4.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v8 = 0;
LABEL_4:
      *(void *)&arguments[v8] = v9;
      ++v5;
    }
    while (v5 != length_low);
  }
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *(unsigned int *)(*((void *)a3 + 67) + 120);
  }
  else {
    uint64_t v4 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  uint64_t v7 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v8 = 16;
  }
  else
  {
    int v8 = *((_DWORD *)layout + 4);
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v7 = (char *)*((void *)layout + 1);
  }
  int v9 = v8 - 1;
  uint64_t v10 = (v8 - 1) & (37 * a4);
  int v11 = *(_DWORD *)&v7[16 * v10];
  if (v11 == a4)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v7[16 * v10 + 8]] = v4;
    return;
  }
  int v12 = 1;
  while (v11 != -1)
  {
    int v13 = v10 + v12++;
    uint64_t v10 = v13 & v9;
    int v11 = *(_DWORD *)&v7[16 * v10];
    if (v11 == a4) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v4;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  int v4 = a4;
  if (![(MTLDevice *)[(_MTLIndirectArgumentEncoder *)self device] requiresRaytracingEmulation])
  {
    if (a3) {
      uint64_t v7 = *((unsigned int *)a3 + 86);
    }
    else {
      uint64_t v7 = 0;
    }
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    uint64_t v10 = (char *)layout + 8;
    if (*(unsigned char *)layout)
    {
      int v18 = 16;
    }
    else
    {
      int v18 = *((_DWORD *)layout + 4);
      if (!v18) {
        goto LABEL_28;
      }
      uint64_t v10 = (char *)*((void *)layout + 1);
    }
    int v19 = v18 - 1;
    uint64_t v13 = (v18 - 1) & (37 * v4);
    int v20 = *(_DWORD *)&v10[16 * v13];
    if (v20 != v4)
    {
      int v22 = 1;
      while (v20 != -1)
      {
        int v23 = v13 + v22++;
        uint64_t v13 = v23 & v19;
        int v20 = *(_DWORD *)&v10[16 * v13];
        if (v20 == v4) {
          goto LABEL_22;
        }
      }
      goto LABEL_28;
    }
    goto LABEL_22;
  }
  if (a3) {
    uint64_t v7 = *((unsigned int *)a3 + 80);
  }
  else {
    uint64_t v7 = 0;
  }
  int v9 = self->_impl.layout;
  arguments = self->_impl.arguments;
  uint64_t v10 = (char *)v9 + 8;
  if ((*(unsigned char *)v9 & 1) == 0)
  {
    int v11 = *((_DWORD *)v9 + 4);
    if (v11)
    {
      uint64_t v10 = (char *)*((void *)v9 + 1);
      goto LABEL_11;
    }
LABEL_28:
    uint64_t v21 = 0;
    goto LABEL_23;
  }
  int v11 = 16;
LABEL_11:
  int v12 = v11 - 1;
  uint64_t v13 = (v11 - 1) & (37 * v4);
  int v14 = *(_DWORD *)&v10[16 * v13];
  if (v14 != v4)
  {
    int v15 = 1;
    while (v14 != -1)
    {
      int v16 = v13 + v15++;
      uint64_t v13 = v16 & v12;
      int v14 = *(_DWORD *)&v10[16 * v13];
      if (v14 == v4) {
        goto LABEL_22;
      }
    }
    goto LABEL_28;
  }
LABEL_22:
  uint64_t v21 = *(unsigned int *)&v10[16 * v13 + 8];
LABEL_23:
  *(void *)&arguments[v21] = v7;
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(MTLDevice *)[(_MTLIndirectArgumentEncoder *)self device] requiresRaytracingEmulation])
  {
    v20.receiver = self;
    v20.super_class = (Class)AGXG17FamilyIndirectArgumentEncoder;
    -[IOGPUMetalIndirectArgumentEncoder setIntersectionFunctionTables:withBufferRange:](&v20, sel_setIntersectionFunctionTables_withBufferRange_, a3, location, length);
    return;
  }
  if (length)
  {
    uint64_t v8 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      int v12 = a3[v8];
      if (v12) {
        int v12 = (void *)*(unsigned int *)(v12[37] + 160);
      }
      if (*(unsigned char *)layout)
      {
        int v13 = 16;
        int v14 = (char *)layout + 8;
      }
      else
      {
        int v13 = *((_DWORD *)layout + 4);
        if (!v13) {
          goto LABEL_5;
        }
        int v14 = (char *)*((void *)layout + 1);
      }
      int v15 = v13 - 1;
      uint64_t v16 = (v13 - 1) & (37 * (v8 + location));
      int v17 = *(_DWORD *)&v14[16 * (v15 & (37 * (v8 + location)))];
      if (v17 == v8 + location)
      {
LABEL_14:
        uint64_t v11 = *(unsigned int *)&v14[16 * v16 + 8];
        goto LABEL_6;
      }
      int v18 = 1;
      while (v17 != -1)
      {
        int v19 = v16 + v18++;
        uint64_t v16 = v19 & v15;
        int v17 = *(_DWORD *)&v14[16 * v16];
        if (v17 == v8 + location) {
          goto LABEL_14;
        }
      }
LABEL_5:
      uint64_t v11 = 0;
LABEL_6:
      *(void *)&arguments[v11] = v12;
      ++v8;
    }
    while (v8 != length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(MTLDevice *)[(_MTLIndirectArgumentEncoder *)self device] requiresRaytracingEmulation])
  {
    v17.receiver = self;
    v17.super_class = (Class)AGXG17FamilyIndirectArgumentEncoder;
    [(IOGPUMetalIndirectArgumentEncoder *)&v17 setIntersectionFunctionTable:a3 atBufferIndex:a4];
    return;
  }
  if (a3) {
    uint64_t v7 = *(unsigned int *)(*((void *)a3 + 37) + 160);
  }
  else {
    uint64_t v7 = 0;
  }
  layout = self->_impl.layout;
  int v9 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v10 = 16;
  }
  else
  {
    int v10 = *((_DWORD *)layout + 4);
    if (!v10)
    {
LABEL_18:
      uint64_t v14 = 0;
      goto LABEL_12;
    }
    int v9 = (char *)*((void *)layout + 1);
  }
  int v11 = v10 - 1;
  uint64_t v12 = (v10 - 1) & (37 * a4);
  int v13 = *(_DWORD *)&v9[16 * v12];
  if (v13 != a4)
  {
    int v15 = 1;
    while (v13 != -1)
    {
      int v16 = v12 + v15++;
      uint64_t v12 = v16 & v11;
      int v13 = *(_DWORD *)&v9[16 * v12];
      if (v13 == a4) {
        goto LABEL_11;
      }
    }
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v14 = *(unsigned int *)&v9[16 * v12 + 8];
LABEL_12:
  *(void *)&self->_impl.arguments[v14] = v7;
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  if (a4.length)
  {
    uint64_t v4 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      uint64_t v8 = (unsigned int *)a3[v4];
      if (v8) {
        uint64_t v8 = (unsigned int *)v8[88];
      }
      if (*(unsigned char *)layout)
      {
        int v9 = 16;
        int v10 = (char *)layout + 8;
      }
      else
      {
        int v9 = *((_DWORD *)layout + 4);
        if (!v9) {
          goto LABEL_3;
        }
        int v10 = (char *)*((void *)layout + 1);
      }
      int v11 = v9 - 1;
      uint64_t v12 = (v9 - 1) & (37 * (v4 + LODWORD(a4.location)));
      int v13 = *(_DWORD *)&v10[16 * (v11 & (37 * (v4 + LODWORD(a4.location))))];
      if (v13 == v4 + LODWORD(a4.location))
      {
LABEL_12:
        uint64_t v7 = *(unsigned int *)&v10[16 * v12 + 8];
        goto LABEL_4;
      }
      int v14 = 1;
      while (v13 != -1)
      {
        int v15 = v12 + v14++;
        uint64_t v12 = v15 & v11;
        int v13 = *(_DWORD *)&v10[16 * v12];
        if (v13 == v4 + LODWORD(a4.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v7 = 0;
LABEL_4:
      *(void *)&arguments[v7] = v8;
      ++v4;
    }
    while (v4 != a4.length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((unsigned int *)a3 + 88);
  }
  else {
    uint64_t v4 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  uint64_t v7 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v8 = 16;
  }
  else
  {
    int v8 = *((_DWORD *)layout + 4);
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v7 = (char *)*((void *)layout + 1);
  }
  int v9 = v8 - 1;
  uint64_t v10 = (v8 - 1) & (37 * a4);
  int v11 = *(_DWORD *)&v7[16 * v10];
  if (v11 == a4)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v7[16 * v10 + 8]] = v4;
    return;
  }
  int v12 = 1;
  while (v11 != -1)
  {
    int v13 = v10 + v12++;
    uint64_t v10 = v13 & v9;
    int v11 = *(_DWORD *)&v7[16 * v10];
    if (v11 == a4) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v4;
}

- (void)setFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  if (a4.length)
  {
    uint64_t v4 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    do
    {
      int v8 = (unsigned int *)a3[v4];
      if (v8) {
        int v8 = (unsigned int *)v8[88];
      }
      if (*(unsigned char *)layout)
      {
        int v9 = 16;
        uint64_t v10 = (char *)layout + 8;
      }
      else
      {
        int v9 = *((_DWORD *)layout + 4);
        if (!v9) {
          goto LABEL_3;
        }
        uint64_t v10 = (char *)*((void *)layout + 1);
      }
      int v11 = v9 - 1;
      uint64_t v12 = (v9 - 1) & (37 * (v4 + LODWORD(a4.location)));
      int v13 = *(_DWORD *)&v10[16 * (v11 & (37 * (v4 + LODWORD(a4.location))))];
      if (v13 == v4 + LODWORD(a4.location))
      {
LABEL_12:
        uint64_t v7 = *(unsigned int *)&v10[16 * v12 + 8];
        goto LABEL_4;
      }
      int v14 = 1;
      while (v13 != -1)
      {
        int v15 = v12 + v14++;
        uint64_t v12 = v15 & v11;
        int v13 = *(_DWORD *)&v10[16 * v12];
        if (v13 == v4 + LODWORD(a4.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v7 = 0;
LABEL_4:
      *(void *)&arguments[v7] = v8;
      ++v4;
    }
    while (v4 != a4.length);
  }
}

- (void)setFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  if (a3) {
    uint64_t v4 = *((unsigned int *)a3 + 88);
  }
  else {
    uint64_t v4 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  uint64_t v7 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v8 = 16;
  }
  else
  {
    int v8 = *((_DWORD *)layout + 4);
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v7 = (char *)*((void *)layout + 1);
  }
  int v9 = v8 - 1;
  uint64_t v10 = (v8 - 1) & (37 * a4);
  int v11 = *(_DWORD *)&v7[16 * v10];
  if (v11 == a4)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v7[16 * v10 + 8]] = v4;
    return;
  }
  int v12 = 1;
  while (v11 != -1)
  {
    int v13 = v10 + v12++;
    uint64_t v10 = v13 & v9;
    int v11 = *(_DWORD *)&v7[16 * v10];
    if (v11 == a4) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v4;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  uint64_t length_low = LODWORD(a5.length);
  if (LODWORD(a5.length))
  {
    uint64_t v6 = 0;
    layout = self->_impl.layout;
    arguments = self->_impl.arguments;
    int v9 = (int *)MEMORY[0x263F4B188];
    do
    {
      int v11 = (char *)a3[v6];
      if (v11) {
        int v11 = (char *)(a4[v6] + *(void *)&v11[*v9 + 8]);
      }
      if (*(unsigned char *)layout)
      {
        int v12 = 16;
        int v13 = (char *)layout + 8;
      }
      else
      {
        int v12 = *((_DWORD *)layout + 4);
        if (!v12) {
          goto LABEL_3;
        }
        int v13 = (char *)*((void *)layout + 1);
      }
      int v14 = v12 - 1;
      uint64_t v15 = (v12 - 1) & (37 * (v6 + LODWORD(a5.location)));
      int v16 = *(_DWORD *)&v13[16 * (v14 & (37 * (v6 + LODWORD(a5.location))))];
      if (v16 == v6 + LODWORD(a5.location))
      {
LABEL_12:
        uint64_t v10 = *(unsigned int *)&v13[16 * v15 + 8];
        goto LABEL_4;
      }
      int v17 = 1;
      while (v16 != -1)
      {
        int v18 = v15 + v17++;
        uint64_t v15 = v18 & v14;
        int v16 = *(_DWORD *)&v13[16 * v15];
        if (v16 == v6 + LODWORD(a5.location)) {
          goto LABEL_12;
        }
      }
LABEL_3:
      uint64_t v10 = 0;
LABEL_4:
      *(void *)&arguments[v10] = v11;
      ++v6;
    }
    while (v6 != length_low);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  if (a3) {
    unint64_t v5 = *(void *)((char *)a3 + *MEMORY[0x263F4B188] + 8) + a4;
  }
  else {
    unint64_t v5 = 0;
  }
  layout = self->_impl.layout;
  arguments = self->_impl.arguments;
  int v8 = (char *)layout + 8;
  if (*(unsigned char *)layout)
  {
    int v9 = 16;
  }
  else
  {
    int v9 = *((_DWORD *)layout + 4);
    if (!v9) {
      goto LABEL_14;
    }
    int v8 = (char *)*((void *)layout + 1);
  }
  int v10 = v9 - 1;
  uint64_t v11 = (v9 - 1) & (37 * a5);
  int v12 = *(_DWORD *)&v8[16 * v11];
  if (v12 == a5)
  {
LABEL_9:
    *(void *)&arguments[*(unsigned int *)&v8[16 * v11 + 8]] = v5;
    return;
  }
  int v13 = 1;
  while (v12 != -1)
  {
    int v14 = v11 + v13++;
    uint64_t v11 = v14 & v10;
    int v12 = *(_DWORD *)&v8[16 * v11];
    if (v12 == a5) {
      goto LABEL_9;
    }
  }
LABEL_14:
  *(void *)arguments = v5;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  p_impl = &self->_impl;
  if (self->_impl.current_argument_buffer != a3)
  {
    id v7 = a3;

    p_impl->current_argument_buffer = (AGXG17FamilyBuffer *)a3;
  }
  if (a3) {
    unint64_t v8 = *(void *)((char *)a3 + *MEMORY[0x263F4B188] + 24) + a4;
  }
  else {
    unint64_t v8 = 0;
  }
  p_impl->arguments = (char *)v8;
}

- (AGXG17FamilyIndirectArgumentEncoder)initWithLayout:(id)a3 device:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AGXG17FamilyIndirectArgumentEncoder;
  result = -[_MTLIndirectArgumentEncoder initWithLayout:device:](&v8, sel_initWithLayout_device_);
  if (result)
  {
    id v7 = (IndirectArgumentLayout *)*((void *)a3 + 2);
    result->_impl.device = (AGXG17FamilyDevice *)a4;
    result->_impl.layout = v7;
    atomic_fetch_or((atomic_ullong *volatile)a4 + 103, 0x800uLL);
  }
  return result;
}

@end