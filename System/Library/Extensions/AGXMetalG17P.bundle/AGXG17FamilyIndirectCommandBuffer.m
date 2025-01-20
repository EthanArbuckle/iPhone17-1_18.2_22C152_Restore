@interface AGXG17FamilyIndirectCommandBuffer
- (AGXG17FamilyIndirectCommandBuffer)initWithBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5;
- (AGXG17FamilyIndirectCommandBuffer)initWithDevice:(id)a3 descriptor:(id)a4 count:(unint64_t)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7;
- (id)indirectComputeCommandAtIndex:(unint64_t)a3;
- (id)indirectRenderCommandAtIndex:(unint64_t)a3;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)initWithBuffer:descriptor:maxCommandCount:;
- (void)resetWithRange:(_NSRange)a3;
@end

@implementation AGXG17FamilyIndirectCommandBuffer

- (void)resetWithRange:(_NSRange)a3
{
  int length = a3.length;
  int location = a3.location;
  int type = self->_type;
  if (type)
  {
    if (type == 1)
    {
      v6.uint64_t render = (IndirectCommandBuffer *)self->_impl;
      v7 = [(IOGPUMetalBuffer *)self->_buffer contents];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v14 = ___ZN3AGX25IndirectCommandBufferGen4INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE13resetCommandsEP18AGXG17FamilyBufferjj_block_invoke;
      v15 = &__block_descriptor_40_e27_v32__0_PatchLocation_IIIQ_8l;
      v16 = v7;
      int v8 = *((_DWORD *)v6.render + 36);
      v20[0] = *((_DWORD *)v6.render + 35) + v8 * location;
      v20[1] = v8 * length;
      v20[2] = 4;
      v20[4] = 0x20000000;
      ___ZN3AGX25IndirectCommandBufferGen4INS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE13resetCommandsEP18AGXG17FamilyBufferjj_block_invoke((uint64_t)v13, v20);
      if (!*((unsigned char *)v6.render + 397))
      {
        int v9 = *((_DWORD *)v6.render + 42);
        v19[0] = *((_DWORD *)v6.render + 41) + v9 * location;
        v19[1] = v9 * length;
        v19[2] = 4;
        v19[4] = 0;
        v14((uint64_t)v13, v19);
        int v10 = *((_DWORD *)v6.render + 46);
        v18[0] = *((_DWORD *)v6.render + 45) + v10 * location;
        v18[1] = v10 * length;
        v18[2] = 4;
        v18[4] = 0;
        v14((uint64_t)v13, v18);
      }
      v17[0] = *((_DWORD *)v6.render + 91) + *((_DWORD *)v6.render + 92) * location;
      v17[1] = 16 * length;
      v17[2] = 4;
      v17[4] = 0;
      v14((uint64_t)v13, v17);
    }
  }
  else
  {
    buffer = (char *)self->_buffer;
    uint64_t render = (uint64_t)self->_impl.render;
    AGX::IndirectComputeCommandBufferGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::resetCommands(render, buffer, a3.location, a3.length);
  }
}

- (unint64_t)resourceIndex
{
  int type = self->_type;
  if (type == 1) {
    return *((unsigned int *)self->_impl.render + 102);
  }
  if (type) {
    return 0;
  }
  return *((unsigned int *)self->_impl.render + 32);
}

- (unint64_t)uniqueIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.super.super._label + (int)*MEMORY[0x263F4B188]);
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  v3 = [[AGXG17FamilyIndirectComputeCommand alloc] initWithEncoder:self->_encoder.render withIndex:a3];

  return v3;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  v3 = [[AGXG17FamilyIndirectRenderCommand alloc] initWithEncoder:self->_encoder.render withIndex:a3];

  return v3;
}

- (void)dealloc
{
  int type = self->_type;
  if (!type)
  {
    v4.uint64_t render = (IndirectCommandBuffer *)self->_impl;
    if (!v4.render) {
      goto LABEL_20;
    }
    if (!*((_DWORD *)v4.render + 32) || *((unsigned char *)v4.render + 144)) {
      goto LABEL_19;
    }
    v5 = (os_unfair_lock_s *)(*((void *)v4.render + 17) + 40);
    os_unfair_lock_lock(v5);
    uint64_t v13 = *((void *)v4.render + 17);
    uint64_t v14 = *((unsigned int *)v4.render + 32);
    uint64_t v15 = *(void *)(v13 + 32);
    v16 = (int *)MEMORY[0x263F4B188];
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v13 + 24) + 8) + (int)*MEMORY[0x263F4B188] + 24) + 8 * v14) = v15;
    uint64_t v17 = v15;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v13 + 32), (unint64_t *)&v17, (v15 & 0xFFFFFFFF00000000 | v14) + 0x100000000);
    if (v17 != v15)
    {
      uint64_t v18 = v17;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(v13 + 24) + 8) + *v16 + 24) + 8 * v14) = v17;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v13 + 32), (unint64_t *)&v18, (v17 & 0xFFFFFFFF00000000 | v14) + 0x100000000);
        BOOL v12 = v18 == v17;
        uint64_t v17 = v18;
      }
      while (!v12);
    }
    goto LABEL_18;
  }
  if (type != 1) {
    goto LABEL_22;
  }
  v4.uint64_t render = (IndirectCommandBuffer *)self->_impl;
  if (v4.render)
  {
    if (!*((_DWORD *)v4.render + 102) || *((unsigned char *)v4.render + 424)) {
      goto LABEL_19;
    }
    v5 = (os_unfair_lock_s *)(*((void *)v4.render + 52) + 40);
    os_unfair_lock_lock(v5);
    uint64_t v6 = *((void *)v4.render + 52);
    uint64_t v7 = *((unsigned int *)v4.render + 102);
    uint64_t v8 = *(void *)(v6 + 32);
    int v9 = (int *)MEMORY[0x263F4B188];
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v6 + 24) + 8) + (int)*MEMORY[0x263F4B188] + 24) + 8 * v7) = v8;
    uint64_t v10 = v8;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v6 + 32), (unint64_t *)&v10, (v8 & 0xFFFFFFFF00000000 | v7) + 0x100000000);
    if (v10 != v8)
    {
      uint64_t v11 = v10;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(v6 + 24) + 8) + *v9 + 24) + 8 * v7) = v10;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v6 + 32), (unint64_t *)&v11, (v10 & 0xFFFFFFFF00000000 | v7) + 0x100000000);
        BOOL v12 = v11 == v10;
        uint64_t v10 = v11;
      }
      while (!v12);
    }
LABEL_18:
    os_unfair_lock_unlock(v5);
    v4.uint64_t render = (IndirectCommandBuffer *)self->_impl;
LABEL_19:
    free(v4.render);
    self->_impl.uint64_t render = 0;
  }
LABEL_20:
  uint64_t render = self->_encoder.render;
  if (render)
  {
    free(render);
    self->_encoder.uint64_t render = 0;
  }
LABEL_22:
  buffer = self->_buffer;
  if (buffer)
  {

    self->_buffer = 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)AGXG17FamilyIndirectCommandBuffer;
  [(IOGPUMetalIndirectCommandBuffer *)&v21 dealloc];
}

- (AGXG17FamilyIndirectCommandBuffer)initWithDevice:(id)a3 descriptor:(id)a4 count:(unint64_t)a5 options:(unint64_t)a6 isSuballocDisabled:(BOOL)a7
{
  id v9 = a4;
  char v11 = [a4 commandTypes];
  unint64_t v264 = a6;
  unint64_t v266 = a6 & 0x800000;
  self->_impl.uint64_t render = 0;
  self->_encoder.uint64_t render = 0;
  uint64_t v12 = v11 & 0x60;
  if ((v11 & 0x60) != 0)
  {
    self->_int type = 0;
    uint64_t v13 = malloc_type_calloc(0xA0uLL, 1uLL, 0x75E1C8BBuLL);
    self->_impl.uint64_t render = (IndirectCommandBuffer *)v13;
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v263 = v12;
      *(_DWORD *)uint64_t v13 = a5;
      v13[19] = v266 == 0;
      *((_DWORD *)v13 + 32) = 0;
      *((void *)v13 + 17) = 0;
      v13[144] = 0;
      v13[16] = 0;
      if ([v9 inheritPipelineState]) {
        v14[16] = 1;
      }
      v14[17] = 0;
      if ([v9 inheritBuffers]) {
        v14[17] = 1;
      }
      v14[18] = 0;
      if ([v9 supportRayTracing]) {
        v14[18] = 1;
      }
      if ([v9 supportDynamicAttributeStride]) {
        BOOL v15 = v14[17] == 0;
      }
      else {
        BOOL v15 = 0;
      }
      v14[152] = v15;
      int v21 = [v9 commandTypes];
      int v22 = v14[16];
      int v23 = v14[17];
      int v24 = v14[152];
      if (v14[17])
      {
        int v25 = 0;
        int v26 = v14[152];
        int v27 = v14[16];
      }
      else
      {
        int v25 = [v9 maxKernelBufferBindCount];
        int v27 = v14[16];
        int v26 = v14[152];
      }
      int v28 = (2 * v22) | (4 * v23) | (8 * v24) | 1;
      int v29 = 48 * a5 + 139;
      unsigned int v30 = v29 & 0xFFFFFFE0;
      int v31 = ((v29 | 0x18) + 8 * v25 * a5) & 0xFFFFFFE0;
      unsigned int v32 = (v31 + 272 * a5 + 31) & 0xFFFFFFE0;
      int v33 = v32 + 24 * a5;
      int32x2_t v34 = vdup_n_s32(v27 == 0);
      if (v27) {
        int v33 = v31 + 272 * a5;
      }
      int8x8_t v35 = (int8x8_t)vcltz_s32(vshl_n_s32(v34, 0x1FuLL));
      int8x8_t v36 = vorn_s8(vand_s8((int8x8_t)(v32 | 0x1800000000), v35), v35);
      int v37 = 4 * v25;
      int v38 = 4 * v25 * a5;
      if (v27) {
        int v39 = 0;
      }
      else {
        int v39 = 8 * a5;
      }
      if (v26) {
        int v40 = v33;
      }
      else {
        int v40 = -1;
      }
      if (!v26)
      {
        int v37 = -1;
        int v38 = 0;
      }
      unsigned int v41 = (v33 + v38 + 63) & 0xFFFFFFC0;
      int v42 = v41 + 192 * a5;
      v43.i32[1] = 8;
      v43.i32[0] = v42 + 152 * a5;
      int8x8_t v44 = vand_s8(v43, v35);
      unsigned __int32 v45 = (v43.i32[0] + v39 + 31) & 0xFFFFFFE0;
      int v46 = v45 + 32 * a5;
      unint64_t v47 = (48 * a5 + 108) + 512;
      if (v47 <= (v46 + a5)) {
        unint64_t v47 = (v46 + a5);
      }
      *((void *)v14 + 1) = v47;
      if (v27)
      {
        int v48 = -1;
      }
      else
      {
        if (v26) {
          int v49 = 20;
        }
        else {
          int v49 = 0;
        }
        if (v14[17]) {
          int v50 = 86;
        }
        else {
          int v50 = 106;
        }
        int v48 = v50 + v49;
      }
      unint64_t v51 = v264;
      *((_DWORD *)v14 + 5) = v28;
      *((_DWORD *)v14 + 6) = a5;
      *((_DWORD *)v14 + 7) = v25;
      *((_DWORD *)v14 + 8) = v21;
      *((_DWORD *)v14 + 9) = v48;
      *((void *)v14 + 5) = 0x680000002CLL;
      *((_DWORD *)v14 + 12) = 48;
      *((_DWORD *)v14 + 13) = v30;
      *((_DWORD *)v14 + 14) = 8 * v25;
      *((_DWORD *)v14 + 15) = v31;
      *((_DWORD *)v14 + 16) = 272;
      *(int8x8_t *)(v14 + 68) = v36;
      *((_DWORD *)v14 + 19) = v41;
      *((_DWORD *)v14 + 20) = 192;
      *((_DWORD *)v14 + 21) = v42;
      *((_DWORD *)v14 + 22) = 152;
      *(int8x8_t *)(v14 + 92) = v44;
      *((_DWORD *)v14 + 25) = v45;
      *((_DWORD *)v14 + 26) = 32;
      *((_DWORD *)v14 + 27) = v46;
      *((_DWORD *)v14 + 28) = 1;
      *((_DWORD *)v14 + 29) = v40;
      *((_DWORD *)v14 + 30) = v37;
      v52 = (void *)((char *)self->_impl.render + 8);
      goto LABEL_200;
    }
LABEL_211:

    return 0;
  }
  self->_int type = 1;
  v16 = malloc_type_calloc(0x1C0uLL, 1uLL, 0xC7845CE9uLL);
  self->_impl.uint64_t render = (IndirectCommandBuffer *)v16;
  if (!v16) {
    goto LABEL_211;
  }
  uint64_t v17 = v16;
  uint64_t v263 = 0;
  *(_DWORD *)v16 = a5;
  v16[399] = v266 == 0;
  *((_DWORD *)v16 + 102) = 0;
  *((void *)v16 + 52) = 0;
  v16[424] = 0;
  *((_DWORD *)v16 + 108) = 0;
  v16[396] = 0;
  if ([v9 inheritPipelineState]) {
    v17[396] = 1;
  }
  v17[397] = 0;
  if ([v9 inheritBuffers]) {
    v17[397] = 1;
  }
  *((_DWORD *)v17 + 100) = 0;
  __int16 v18 = [v9 commandTypes];
  v17[437] = (v18 & 2) != 0;
  v17[438] = (v18 & 0xC) != 0;
  BOOL v19 = (v18 & 0x180) != 0;
  v17[436] = (v18 & 0xF) != 0;
  v17[439] = v19;
  if ((v18 & 0xF) != 0) {
    BOOL v19 = 0;
  }
  v17[440] = v19;
  *((_DWORD *)v17 + 108) = 31;
  if ([v9 supportDynamicAttributeStride]) {
    BOOL v20 = v17[397] == 0;
  }
  else {
    BOOL v20 = 0;
  }
  v17[441] = v20;
  v17[398] = 0;
  if ([v9 supportRayTracing]) {
    v17[398] = 1;
  }
  int v257 = *(_DWORD *)(*((void *)a3 + 101) + 5888);
  __int16 v53 = [v9 commandTypes];
  v260 = v9;
  int v261 = v17[396];
  if (v17[396])
  {
    if (v17[436]) {
      int v54 = 12;
    }
    else {
      int v54 = 0;
    }
    int v55 = v17[438];
    if (v55 | v17[437]) {
      int v54 = 20;
    }
    int v56 = v17[439];
    BOOL v57 = v56 == 0;
    int v58 = 36;
  }
  else
  {
    if (v17[436]) {
      int v59 = 24;
    }
    else {
      int v59 = 0;
    }
    if (v17[437]) {
      int v60 = 32;
    }
    else {
      int v60 = v59;
    }
    int v55 = v17[438];
    if (v17[438]) {
      int v54 = 44;
    }
    else {
      int v54 = v60;
    }
    int v56 = v17[439];
    BOOL v57 = v56 == 0;
    int v58 = 52;
  }
  if (v57) {
    int v61 = v54;
  }
  else {
    int v61 = v58;
  }
  unsigned int v62 = 16 * (v53 & 1);
  if ((v53 & 2) != 0) {
    unsigned int v62 = 28;
  }
  if ((v53 & 0xC) != 0) {
    unsigned int v62 = 36;
  }
  if (v62 <= 0x1C) {
    int v63 = 28;
  }
  else {
    int v63 = v62;
  }
  if ((v53 & 0x180) != 0) {
    unsigned int v64 = v63;
  }
  else {
    unsigned int v64 = v62;
  }
  int v65 = v17[441];
  uint64_t v256 = *((void *)v17 + 50);
  if (v55) {
    int v66 = (8 * (v17[436] != 0)) | 2;
  }
  else {
    int v66 = 8 * (v17[436] != 0);
  }
  if (v56) {
    v66 |= 0x10u;
  }
  int v255 = v66;
  int v67 = v17[397];
  if (v17[397])
  {
    int v258 = 0;
    int v259 = 0;
    int v68 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = v17[396];
  }
  else
  {
    int v253 = [v260 maxVertexBufferBindCount];
    int v259 = [v260 maxFragmentBufferBindCount];
    int v258 = [v260 maxObjectBufferBindCount];
    int v68 = [v260 maxMeshBufferBindCount];
    int v71 = v17[396];
    int v70 = 8 * v68;
    int v69 = v253;
  }
  int v72 = v61 + 20;
  unsigned int v73 = v61 + 20 + v64;
  if (v71) {
    int v74 = 28;
  }
  else {
    int v74 = 84;
  }
  if (v71) {
    int v75 = 112;
  }
  else {
    int v75 = 156;
  }
  if (v71)
  {
    int v76 = -1;
    int v77 = -1;
    int v78 = -1;
  }
  else
  {
    if (v17[441]) {
      int v79 = 20;
    }
    else {
      int v79 = 0;
    }
    if (v17[397]) {
      int v76 = 78;
    }
    else {
      int v76 = 98;
    }
    int v78 = v76 + v79;
    if (v17[397]) {
      int v77 = 106;
    }
    else {
      int v77 = 126;
    }
  }
  int v80 = v65;
  int v81 = v67;
  int v82 = (v75 + 63) & 0x1C0;
  if (v17[439]) {
    int v83 = v75;
  }
  else {
    int v83 = -1;
  }
  if (v17[439]) {
    int v84 = v77;
  }
  else {
    int v84 = -1;
  }
  if (v17[439]) {
    int v85 = v76;
  }
  else {
    int v85 = -1;
  }
  if (v17[436]) {
    int v86 = v75;
  }
  else {
    int v86 = -1;
  }
  if (!v17[436]) {
    int v78 = -1;
  }
  int v247 = v78;
  int v87 = v73 + 4 + (v73 + 4) * a5;
  int v88 = (v87 + v74 * a5 + 443) & 0xFFFFFFC0;
  int v89 = v82 * a5;
  if (v17[436]) {
    int v90 = v88 + v82 * a5;
  }
  else {
    int v90 = -1;
  }
  int v246 = v90;
  if (v17[436]) {
    int v91 = (v75 + 63) & 0x1C0;
  }
  else {
    int v91 = -1;
  }
  int v245 = v91;
  if (v17[436]) {
    int v92 = v82 * a5;
  }
  else {
    int v92 = 0;
  }
  unsigned int v93 = v88 + v82 * a5 + v92;
  id v9 = v260;
  if (v17[439])
  {
    int v238 = v88 + v82 * a5 + v92;
    int v239 = v93 + v89;
    v93 += v89 + v89;
    int v240 = (v75 + 63) & 0x1C0;
    if (v17[397])
    {
LABEL_129:
      int v94 = 0;
      uint64_t v236 = 0;
      unint64_t v237 = 0;
      uint64_t v235 = 0;
      int v70 = 0;
      goto LABEL_143;
    }
  }
  else
  {
    int v238 = -1;
    int v239 = -1;
    int v240 = -1;
    if (v17[397]) {
      goto LABEL_129;
    }
  }
  int v95 = 8 * v69;
  if (v17[436]) {
    int v96 = v93;
  }
  else {
    int v96 = -1;
  }
  if (!v17[436]) {
    int v95 = -1;
  }
  unint64_t v237 = __PAIR64__(v96, v95);
  if (v17[436]) {
    int v97 = 8 * v69 * a5;
  }
  else {
    int v97 = 0;
  }
  int v94 = v93 + v97;
  if (v17[439])
  {
    LODWORD(v235) = v93 + v97;
    HIDWORD(v235) = 8 * v258;
    LODWORD(v236) = v94 + 8 * v258 * a5;
    int v94 = v236 + v70 * a5;
  }
  else
  {
    uint64_t v235 = -1;
    LODWORD(v236) = -1;
    int v70 = -1;
  }
  HIDWORD(v236) = 8 * v259;
  unsigned int v93 = v94 + 8 * v259 * a5;
LABEL_143:
  unsigned int v252 = v73 + 4;
  int v254 = v70;
  unsigned int v250 = v73;
  int v251 = v72;
  int v248 = v83;
  int v249 = v74;
  int v244 = v94;
  if (!v17[436])
  {
    int v99 = 112 * a5;
    int v100 = v93 + 112 * a5;
    if (v17[439])
    {
      int v101 = v100 + v99;
      uint64_t v102 = -1;
      uint64_t v98 = -1;
      if (v71) {
        goto LABEL_149;
      }
      goto LABEL_152;
    }
    uint64_t v98 = -1;
    if (v71)
    {
      int v103 = -1;
      int v233 = -1;
      uint64_t v102 = -1;
      goto LABEL_156;
    }
    uint64_t v102 = -1;
LABEL_159:
    int v107 = v100;
    unsigned int v106 = v93;
    int v105 = 24 * a5;
    unsigned int v93 = -1;
    int v103 = -1;
    int v100 = -1;
    int v101 = -1;
    int v104 = -1;
    int v229 = -1;
    goto LABEL_160;
  }
  uint64_t v98 = v93 | 0x7000000000;
  v93 += 112 * a5;
  if (!v71)
  {
    uint64_t v102 = v93 | 0x1800000000;
    v93 += 24 * a5;
    int v99 = 112 * a5;
    int v100 = v93 + 112 * a5;
    if (v17[439])
    {
      int v101 = v100 + v99;
LABEL_152:
      int v105 = 24 * a5;
      int v229 = v101 + 24 * a5;
      unsigned int v106 = v101 + v105 + v105;
      int v107 = v106 + v99;
      int v104 = 24;
      int v103 = 112;
LABEL_160:
      int v232 = v100;
      int v233 = v93;
      int v234 = v107;
      int v100 = v107 + v105;
      int v230 = 24;
      int v231 = v101;
      unsigned int v93 = v106;
      goto LABEL_161;
    }
    goto LABEL_159;
  }
  int v99 = 112 * a5;
  int v100 = v93 + 112 * a5;
  if (!v17[439])
  {
    uint64_t v102 = -1;
    int v103 = -1;
    int v233 = -1;
LABEL_156:
    int v231 = -1;
    int v232 = -1;
    int v104 = -1;
    goto LABEL_157;
  }
  int v101 = v100 + v99;
LABEL_149:
  int v232 = v100;
  int v233 = v93;
  int v100 = v101 + v99;
  uint64_t v102 = -1;
  int v231 = -1;
  int v103 = 112;
  unsigned int v93 = v101;
  int v104 = -1;
LABEL_157:
  int v229 = -1;
  int v230 = -1;
  int v234 = -1;
LABEL_161:
  int v108 = (2 * v261) | (4 * v81);
  int v109 = v87 + 380;
  if (v17[436]) {
    int v110 = v100;
  }
  else {
    int v110 = -1;
  }
  int v262 = v110;
  if (v17[436]) {
    int v111 = 16;
  }
  else {
    int v111 = -1;
  }
  int v243 = v111;
  if (v17[436]) {
    int v112 = 16 * a5;
  }
  else {
    int v112 = 0;
  }
  int v113 = v100 + v112;
  if (v17[439]) {
    int v114 = v113;
  }
  else {
    int v114 = -1;
  }
  int v242 = v114;
  if (v17[439]) {
    int v115 = 52;
  }
  else {
    int v115 = -1;
  }
  int v241 = v115;
  if (v17[439]) {
    int v116 = 52 * a5;
  }
  else {
    int v116 = 0;
  }
  int v117 = v113 + v116;
  int v118 = v88;
  int v119 = v84;
  int v120 = v85;
  int v121 = v76;
  if (v17[441])
  {
    unsigned int v122 = (v117 + 7) & 0xFFFFFFF8;
    int v123 = v69;
    int v124 = 4 * v69;
    int v117 = v122 + 4 * v69 * a5;
  }
  else
  {
    int v123 = v69;
    unsigned int v122 = -1;
    int v124 = -1;
  }
  int v125 = v108 | (8 * v80);
  if (v17[438]) {
    int v126 = v117;
  }
  else {
    int v126 = -1;
  }
  if (v17[438]) {
    int v127 = 8;
  }
  else {
    int v127 = -1;
  }
  if (v17[438]) {
    int v128 = 8 * a5;
  }
  else {
    int v128 = 0;
  }
  int v129 = v117 + v128;
  unsigned int v130 = v117 + v128 + 16 * a5;
  if (v17[439])
  {
    int v131 = *((_DWORD *)v17 + 108);
    int v132 = 4 * v131;
    int v133 = 4 * v131 + 4;
    int v134 = v130 + v133 * a5;
    int v135 = v130;
    unsigned int v130 = v134 + 4 * v131 * a5;
  }
  else
  {
    int v131 = 0;
    int v135 = -1;
    int v133 = -1;
    int v134 = -1;
    int v132 = -1;
  }
  *((_DWORD *)v17 + 4) = v125;
  *((_DWORD *)v17 + 6) = v123;
  *((_DWORD *)v17 + 7) = v259;
  *((_DWORD *)v17 + 8) = v75;
  *((_DWORD *)v17 + 9) = v86;
  *((_DWORD *)v17 + 10) = v121;
  *((_DWORD *)v17 + 11) = v247;
  *((_DWORD *)v17 + 22) = v255;
  *((_DWORD *)v17 + 24) = v258;
  *((_DWORD *)v17 + 26) = v119;
  *((_DWORD *)v17 + 27) = v131;
  *((_DWORD *)v17 + 28) = v68;
  *((_DWORD *)v17 + 30) = v120;
  *((_DWORD *)v17 + 33) = v251;
  *((_DWORD *)v17 + 34) = v250;
  *((_DWORD *)v17 + 37) = v109;
  *((_DWORD *)v17 + 38) = v249;
  *((_DWORD *)v17 + 39) = v118;
  *((_DWORD *)v17 + 40) = (v75 + 63) & 0x1C0;
  *((_DWORD *)v17 + 41) = v244;
  *((_DWORD *)v17 + 42) = HIDWORD(v236);
  *((_DWORD *)v17 + 43) = v246;
  *((_DWORD *)v17 + 44) = v245;
  *((_DWORD *)v17 + 45) = HIDWORD(v237);
  *((_DWORD *)v17 + 46) = v237;
  *((_DWORD *)v17 + 47) = v238;
  *(void *)(v17 + 196) = v235;
  *((_DWORD *)v17 + 51) = v239;
  *((_DWORD *)v17 + 52) = v240;
  LODWORD(v136) = (v257 << 8) | 0x80;
  if (v130 <= v136) {
    uint64_t v136 = v136;
  }
  else {
    uint64_t v136 = v130;
  }
  *((void *)v17 + 1) = v136;
  *((_DWORD *)v17 + 5) = a5;
  *((_OWORD *)v17 + 3) = 0u;
  *((_OWORD *)v17 + 4) = 0u;
  *((void *)v17 + 10) = 0;
  *((_DWORD *)v17 + 23) = 0;
  *((_DWORD *)v17 + 25) = v248;
  *((_DWORD *)v17 + 29) = v248;
  *(void *)(v17 + 124) = 0x1400000004;
  *((_DWORD *)v17 + 35) = 380;
  *((_DWORD *)v17 + 36) = v252;
  *((_DWORD *)v17 + 48) = v240;
  *((_DWORD *)v17 + 53) = v236;
  *((_DWORD *)v17 + 54) = v254;
  *(void *)(v17 + 220) = v98;
  *((_DWORD *)v17 + 57) = v233;
  *((_DWORD *)v17 + 58) = v103;
  *((_DWORD *)v17 + 59) = v232;
  *((_DWORD *)v17 + 60) = v103;
  *((_DWORD *)v17 + 61) = v93;
  *((_DWORD *)v17 + 62) = 112;
  *(void *)(v17 + 252) = v102;
  *((_DWORD *)v17 + 65) = v231;
  *((_DWORD *)v17 + 66) = v104;
  *((_DWORD *)v17 + 67) = v229;
  *((_DWORD *)v17 + 68) = v104;
  *((_DWORD *)v17 + 69) = v234;
  *((_DWORD *)v17 + 70) = v230;
  *((_DWORD *)v17 + 71) = v262;
  *((_DWORD *)v17 + 72) = v243;
  *((_DWORD *)v17 + 73) = v242;
  *((_DWORD *)v17 + 74) = v241;
  *(_OWORD *)(v17 + 300) = 0u;
  *(_OWORD *)(v17 + 316) = 0u;
  *(void *)(v17 + 332) = v256;
  *((_DWORD *)v17 + 85) = v122;
  *((_DWORD *)v17 + 86) = v124;
  *((_DWORD *)v17 + 87) = v126;
  *((_DWORD *)v17 + 88) = v127;
  *(void *)(v17 + 356) = 0;
  *((_DWORD *)v17 + 91) = v129;
  *((_DWORD *)v17 + 92) = 16;
  *(void *)(v17 + 372) = 0;
  *((_DWORD *)v17 + 95) = v135;
  *((_DWORD *)v17 + 96) = v133;
  *((_DWORD *)v17 + 97) = v134;
  *((_DWORD *)v17 + 98) = v132;
  if (v17[396]) {
    *((_DWORD *)v17 + 22) |= 1u;
  }
  v52 = (void *)((char *)self->_impl.render + 8);
  unint64_t v51 = v264;
LABEL_200:
  uint64_t v137 = (*v52 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  v269[1] = 0x100010001;
  int v271 = (v266 >> 8) ^ 0x8000;
  v269[0] = 0;
  int v270 = 16777473;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  long long v274 = 0u;
  *(void *)&long long v275 = v137;
  uint64_t v276 = (144 * v266) ^ 0x48000000;
  uint64_t v277 = 0;
  v138 = [(IOGPUMetalResource *)[AGXG17FamilyBuffer alloc] initWithDevice:a3 options:v51 | 0x20000 args:v269 argsSize:104];
  self->_buffer = v138;
  if (!v138) {
    goto LABEL_211;
  }
  uint64_t v139 = (int)*MEMORY[0x263F4B188];
  *(void *)((char *)&v138->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque + v139) = *(void *)((unsigned char *)&v138->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque + v139) & 0x1FFFFFFFFFFFFFFFLL | 0x2000000000000000;
  malloc_type_id_t v140 = v263 ? 1926918315 : 1372316310;
  v141 = malloc_type_calloc(0x10uLL, 1uLL, v140);
  self->_encoder.uint64_t render = (IndirectRenderCommandEncoder *)v141;
  if (!v141) {
    goto LABEL_211;
  }
  void *v141 = self->_buffer;
  v141[1] = self->_impl.render;
  self->_encoder.uint64_t render = (IndirectRenderCommandEncoder *)v141;
  buffer = self->_buffer;
  v268.receiver = self;
  v268.super_class = (Class)AGXG17FamilyIndirectCommandBuffer;
  v143 = [(IOGPUMetalIndirectCommandBuffer *)&v268 initWithBuffer:buffer descriptor:v9 maxCommandCount:a5];
  v144 = v143;
  if (v143)
  {
    *(NSString **)((char *)&v143->_buffer->super.super.super.super.super.super._label + v139) = (NSString *)(*(void *)((char *)&v143->_buffer->super.super.super._res.var0 + v139) + ((v266 << 13) ^ 0x1000000000));
    *(unint64_t *)((char *)&v143->_buffer->super.super.super.super.super._allocationType + v139) = *(void *)&v143->_buffer->super.super.super._anon_50[v139 + 48];
    v145 = (char *)v143 + v139;
    *(void *)v145 = 0;
    *((void *)v145 + 1) = *(NSString **)((char *)&v143->_buffer->super.super.super.super.super.super._label + v139);
    *((void *)v145 + 3) = *(unint64_t *)((char *)&v143->_buffer->super.super.super.super.super._allocationType
                                                + v139);
    *((void *)v145 + 2) = [(IOGPUMetalBuffer *)v143->_buffer length] & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v145[23] << 56);
    v146 = (char *)v144->_buffer + v139;
    long long v147 = *((_OWORD *)v146 + 2);
    *((void *)v145 + 6) = *((void *)v146 + 6);
    *((_OWORD *)v145 + 2) = v147;
    int type = v144->_type;
    if (!type)
    {
      uint64_t render = (uint64_t)v144->_impl.render;
      v150 = v144->_buffer;
      uint64_t v151 = [(IOGPUMetalBuffer *)v150 contents];
      long long v152 = *(_OWORD *)(render + 52);
      long long v153 = *(_OWORD *)(render + 36);
      *(_OWORD *)uint64_t v151 = *(_OWORD *)(render + 20);
      *(_OWORD *)(v151 + 16) = v153;
      *(_OWORD *)(v151 + 32) = v152;
      long long v154 = *(_OWORD *)(render + 84);
      long long v155 = *(_OWORD *)(render + 100);
      long long v156 = *(_OWORD *)(render + 68);
      *(void *)(v151 + 96) = *(void *)(render + 116);
      *(_OWORD *)(v151 + 64) = v154;
      *(_OWORD *)(v151 + 80) = v155;
      *(_OWORD *)(v151 + 48) = v156;
      v267 = (char *)v150;
      uint64_t v157 = *(uint64_t *)((char *)&v150->super.super.super.super.super.super._label + v139);
      long long v279 = 0u;
      memset(v280, 0, 28);
      v158 = (char *)(v151 + *(unsigned int *)(render + 76));
      int v159 = *(_DWORD *)render * *(_DWORD *)(render + 80);
      size_t v160 = v159 & 0xFFFFFFFC;
      uint64_t v161 = v159 & 3;
      int __pattern4 = 0;
      memset_pattern4(v158, &__pattern4, v160);
      if (v161) {
        *(_WORD *)&v158[v160] = 0;
      }
      if (*(_DWORD *)render)
      {
        for (unsigned int i = 0; i < *(_DWORD *)render; ++i)
        {
          if (*(unsigned char *)(render + 17))
          {
            unint64_t v165 = 0;
            if (*(unsigned char *)(render + 16)) {
              goto LABEL_217;
            }
          }
          else
          {
            unint64_t v165 = v157 + *(_DWORD *)(render + 52) + *(_DWORD *)(render + 56) * i;
            if (*(unsigned char *)(render + 16))
            {
LABEL_217:
              uint64_t v166 = 0;
              if (!*(unsigned char *)(render + 152)) {
                goto LABEL_221;
              }
              goto LABEL_213;
            }
          }
          uint64_t v166 = v157 + *(_DWORD *)(render + 68) + *(_DWORD *)(render + 72) * i;
          if (!*(unsigned char *)(render + 152))
          {
LABEL_221:
            uint64_t v164 = 0;
            goto LABEL_214;
          }
LABEL_213:
          uint64_t v164 = v157 + *(_DWORD *)(render + 116) + *(_DWORD *)(render + 120) * i;
LABEL_214:
          AGX::IndirectExecutionCommonGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitABIStateLoadProgram(0, (unsigned __int8 *)v158, v165, v157 + *(_DWORD *)(render + 60) + *(_DWORD *)(render + 64) * i, v166, 0, 0, v164, (uint64_t)&v279, 0xFFFFFFFFLL);
          v158 += *(unsigned int *)(render + 80);
        }
      }
      AGX::IndirectComputeCommandBufferGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::resetCommands(render, v267, 0, *(_DWORD *)render);
      v167.uint64_t render = (IndirectCommandBuffer *)v144->_impl;
      v168 = v144->_buffer;
      AGX::Mempool<32u,0u,true,unsigned long long>::Allocation::Allocation((uint64_t)&v279, (os_unfair_lock_s *)(*((void *)a3 + 101) + 6408), [v9 resourceIndex]);
      int v169 = *((_DWORD *)v167.render + 32);
      *((_DWORD *)v167.render + 32) = v279;
      LODWORD(v279) = v169;
      v170 = (os_unfair_lock_s *)*((void *)v167.render + 17);
      *((void *)v167.render + 17) = *((void *)&v279 + 1);
      *((void *)&v279 + 1) = v170;
      int v171 = *((unsigned __int8 *)v167.render + 144);
      *((unsigned char *)v167.render + 144) = v280[0];
      v280[0] = v171;
      if (v169 && !v171)
      {
        v172 = v170 + 10;
        os_unfair_lock_lock(v170 + 10);
        uint64_t v173 = *((void *)&v279 + 1);
        uint64_t v174 = v279;
        uint64_t v175 = *(void *)(*((void *)&v279 + 1) + 32);
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(*((void *)&v279 + 1) + 24) + 8) + v139 + 24)
                  + 8 * v279) = v175;
        uint64_t v176 = v175;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v173 + 32), (unint64_t *)&v176, (v175 & 0xFFFFFFFF00000000 | v174) + 0x100000000);
        if (v176 != v175)
        {
          uint64_t v177 = v176;
          do
          {
            *(_DWORD *)(*(void *)(*(void *)(*(void *)(v173 + 24) + 8) + v139 + 24) + 8 * v174) = v176;
            atomic_compare_exchange_strong((atomic_ullong *volatile)(v173 + 32), (unint64_t *)&v177, (v176 & 0xFFFFFFFF00000000 | v174) + 0x100000000);
            BOOL v57 = v177 == v176;
            uint64_t v176 = v177;
          }
          while (!v57);
        }
        os_unfair_lock_unlock(v172);
      }
      if (v168) {
        uint64_t v178 = *(uint64_t *)((char *)&v168->super.super.super.super.super.super._label + v139);
      }
      else {
        uint64_t v178 = 27984896;
      }
      v179 = (os_unfair_lock_s *)(*((void *)v167.render + 17) + 40);
      os_unfair_lock_lock(v179);
      *(void *)(*(void *)(*(void *)(*((void *)v167.render + 17) + 8) + v139 + 24)
                + 8 * *((unsigned int *)v167.render + 32)) = v178;
      os_unfair_lock_unlock(v179);
      int type = v144->_type;
    }
    if (type == 1)
    {
      v180 = (unsigned int *)v144->_impl.render;
      v181 = v144->_buffer;
      uint64_t v182 = [(IOGPUMetalBuffer *)v181 contents];
      memcpy([(IOGPUMetalBuffer *)v181 contents], v180 + 4, 0x17CuLL);
      size_t v183 = *v180 * (unint64_t)v180[36];
      v184 = (char *)(v182 + v180[35]);
      LODWORD(v279) = 0x20000000;
      memset_pattern4(v184, &v279, v183);
      *(_DWORD *)&v184[v183] = 671088640;
      uint64_t v185 = *(uint64_t *)((char *)&v181->super.super.super.super.super.super._label + v139);
      if (*((unsigned char *)v180 + 436))
      {
        v186 = (char *)(v182 + v180[43]);
        unint64_t v187 = *v180 * (unint64_t)v180[44];
        unint64_t v188 = v187 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v189 = v187 & 3;
        LODWORD(v279) = 0;
        memset_pattern4(v186, &v279, v187 & 0xFFFFFFFFFFFFFFFCLL);
        if (v189) {
          *(_WORD *)&v186[v188] = 0;
        }
      }
      if (*((unsigned char *)v180 + 439))
      {
        v190 = (char *)(v182 + v180[47]);
        unint64_t v191 = *v180 * (unint64_t)v180[48];
        unint64_t v192 = v191 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v193 = v191 & 3;
        LODWORD(v279) = 0;
        memset_pattern4(v190, &v279, v191 & 0xFFFFFFFFFFFFFFFCLL);
        if (v193) {
          *(_WORD *)&v190[v192] = 0;
        }
        v194 = (char *)(v182 + v180[51]);
        unint64_t v195 = *v180 * (unint64_t)v180[52];
        unint64_t v196 = v195 & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v197 = v195 & 3;
        LODWORD(v279) = 0;
        memset_pattern4(v194, &v279, v195 & 0xFFFFFFFFFFFFFFFCLL);
        if (v197) {
          *(_WORD *)&v194[v196] = 0;
        }
      }
      v198 = (char *)(v182 + v180[39]);
      unint64_t v199 = *v180 * (unint64_t)v180[40];
      unint64_t v200 = v199 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v201 = v199 & 3;
      LODWORD(v279) = 0;
      memset_pattern4(v198, &v279, v199 & 0xFFFFFFFFFFFFFFFCLL);
      if (v201) {
        *(_WORD *)&v198[v200] = 0;
      }
      if (*v180)
      {
        int v202 = 0;
        while (1)
        {
          int v204 = *((unsigned __int8 *)v180 + 396);
          if (!*((unsigned char *)v180 + 436)) {
            goto LABEL_258;
          }
          if (*((unsigned char *)v180 + 397))
          {
            unint64_t v205 = 0;
            if (*((unsigned char *)v180 + 396)) {
              goto LABEL_252;
            }
          }
          else
          {
            unint64_t v205 = v185 + v180[45] + v180[46] * v202;
            if (*((unsigned char *)v180 + 396))
            {
LABEL_252:
              uint64_t v206 = 0;
              if (!*((unsigned char *)v180 + 441)) {
                goto LABEL_256;
              }
              goto LABEL_253;
            }
          }
          uint64_t v206 = v185 + v180[63] + v180[64] * v202;
          if (!*((unsigned char *)v180 + 441))
          {
LABEL_256:
            uint64_t v207 = 0;
            goto LABEL_257;
          }
LABEL_253:
          uint64_t v207 = v185 + v180[85] + v180[86] * v202;
LABEL_257:
          AGX::IndirectExecutionCommonGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitABIStateLoadProgram(v204, (unsigned __int8 *)(v182 + v180[43] + v180[44] * v202), v205, v185 + v180[55] + v180[56] * v202, v206, 0, 0, v207, 0, 0xFFFFFFFFLL);
LABEL_258:
          if (*((unsigned char *)v180 + 439))
          {
            long long v279 = 0u;
            memset(v280, 0, 28);
            if (*((unsigned char *)v180 + 397))
            {
              unint64_t v208 = 0;
              if (*((unsigned char *)v180 + 396)) {
                goto LABEL_261;
              }
LABEL_263:
              uint64_t v209 = v185 + v180[65] + v180[66] * v202;
            }
            else
            {
              unint64_t v208 = v185 + v180[49] + v180[50] * v202;
              if (!*((unsigned char *)v180 + 396)) {
                goto LABEL_263;
              }
LABEL_261:
              uint64_t v209 = 0;
            }
            AGX::IndirectExecutionCommonGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitABIStateLoadProgram(v204, (unsigned __int8 *)(v182 + v180[47] + v180[48] * v202), v208, v185 + v180[57] + v180[58] * v202, v209, 0, v185 + v180[97] + v180[98] * v202, 0, (uint64_t)&v279, 0xFFFFFFFFLL);
            unint64_t v210 = 0;
            if (!*((unsigned char *)v180 + 397)) {
              unint64_t v210 = v185 + v180[53] + v180[54] * v202;
            }
            if (*((unsigned char *)v180 + 396)) {
              uint64_t v211 = 0;
            }
            else {
              uint64_t v211 = v185 + v180[67] + v180[68] * v202;
            }
            AGX::IndirectExecutionCommonGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitABIStateLoadProgram(v204, (unsigned __int8 *)(v182 + v180[51] + v180[52] * v202), v210, v185 + v180[59] + v180[60] * v202, v211, 0, 0, 0, 0, 0xFFFFFFFFLL);
          }
          if (*((unsigned char *)v180 + 397)) {
            unint64_t v212 = 0;
          }
          else {
            unint64_t v212 = v185 + v180[41] + v180[42] * v202;
          }
          if (*((unsigned char *)v180 + 396)) {
            uint64_t v203 = 0;
          }
          else {
            uint64_t v203 = v185 + v180[69] + v180[70] * v202;
          }
          AGX::IndirectExecutionCommonGen4<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::emitABIStateLoadProgram(v204, (unsigned __int8 *)(v182 + v180[39] + v180[40] * v202), v212, v185 + v180[61] + v180[62] * v202, v203, 0, 0, 0, 0, 0xFFFFFFFFLL);
          if (++v202 >= *v180)
          {
            if (!*((unsigned char *)v180 + 396) && *v180)
            {
              unsigned int v213 = 0;
              int32x2_t v214 = vdup_n_s32(0x7200000u);
              do
              {
                v215 = (void *)(v182 + 28 + v180[37] + v180[38] * v213);
                void *v215 = 0xFFFFFFFF00000000;
                v215[1] = v214;
                ++v213;
              }
              while (v213 < *v180);
            }
            break;
          }
        }
      }
      v216.uint64_t render = (IndirectCommandBuffer *)v144->_impl;
      v217 = v144->_buffer;
      AGX::Mempool<32u,0u,true,unsigned long long>::Allocation::Allocation((uint64_t)&v279, (os_unfair_lock_s *)(*((void *)a3 + 101) + 6408), [v9 resourceIndex]);
      int v218 = *((_DWORD *)v216.render + 102);
      *((_DWORD *)v216.render + 102) = v279;
      LODWORD(v279) = v218;
      v219 = (os_unfair_lock_s *)*((void *)v216.render + 52);
      *((void *)v216.render + 52) = *((void *)&v279 + 1);
      *((void *)&v279 + 1) = v219;
      int v220 = *((unsigned __int8 *)v216.render + 424);
      *((unsigned char *)v216.render + 424) = v280[0];
      v280[0] = v220;
      if (v218 && !v220)
      {
        v221 = v219 + 10;
        os_unfair_lock_lock(v219 + 10);
        uint64_t v222 = *((void *)&v279 + 1);
        uint64_t v223 = v279;
        uint64_t v224 = *(void *)(*((void *)&v279 + 1) + 32);
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(*((void *)&v279 + 1) + 24) + 8) + v139 + 24)
                  + 8 * v279) = v224;
        uint64_t v225 = v224;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v222 + 32), (unint64_t *)&v225, (v224 & 0xFFFFFFFF00000000 | v223) + 0x100000000);
        if (v225 != v224)
        {
          uint64_t v226 = v225;
          do
          {
            *(_DWORD *)(*(void *)(*(void *)(*(void *)(v222 + 24) + 8) + v139 + 24) + 8 * v223) = v225;
            atomic_compare_exchange_strong((atomic_ullong *volatile)(v222 + 32), (unint64_t *)&v226, (v225 & 0xFFFFFFFF00000000 | v223) + 0x100000000);
            BOOL v57 = v226 == v225;
            uint64_t v225 = v226;
          }
          while (!v57);
        }
        os_unfair_lock_unlock(v221);
      }
      if (v217) {
        uint64_t v227 = *(uint64_t *)((char *)&v217->super.super.super.super.super.super._label + v139);
      }
      else {
        uint64_t v227 = 27984896;
      }
      v228 = (os_unfair_lock_s *)(*((void *)v216.render + 52) + 40);
      os_unfair_lock_lock(v228);
      *(void *)(*(void *)(*(void *)(*((void *)v216.render + 52) + 8) + v139 + 24)
                + 8 * *((unsigned int *)v216.render + 102)) = v227;
      os_unfair_lock_unlock(v228);
    }
  }
  return v144;
}

- (AGXG17FamilyIndirectCommandBuffer)initWithBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5
{
}

- (void)initWithBuffer:descriptor:maxCommandCount:
{
}

@end