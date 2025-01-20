@interface GLKTextureTXR
- (BOOL)hasAlpha;
- (BOOL)lossyCompressedSource;
- (BOOL)uploadToGLTexture:(unsigned int)a3 error:(id *)a4;
- (GLKTextureTXR)initWithTexture:(id)a3 API:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (NSString)label;
- (unsigned)GLTextureName;
- (unsigned)arrayLength;
- (unsigned)depth;
- (unsigned)height;
- (unsigned)mipmapLevelCount;
- (unsigned)target;
- (unsigned)width;
- (void)dealloc;
- (void)setArrayLength:(unsigned int)a3;
- (void)setDepth:(unsigned int)a3;
- (void)setGLTextureName:(unsigned int)a3;
- (void)setHasAlpha:(BOOL)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setLabel:(id)a3;
- (void)setLossyCompressedSource:(BOOL)a3;
- (void)setMipmapLevelCount:(unsigned int)a3;
- (void)setTarget:(unsigned int)a3;
- (void)setWidth:(unsigned int)a3;
@end

@implementation GLKTextureTXR

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GLKTextureTXR;
  [(GLKTextureTXR *)&v3 dealloc];
}

- (GLKTextureTXR)initWithTexture:(id)a3 API:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  v24.receiver = self;
  v24.super_class = (Class)GLKTextureTXR;
  v9 = [(GLKTextureTXR *)&v24 init];
  v10 = v9;
  if (!v9) {
    return v10;
  }
  v9->_texture = (TXRTexture *)a3;
  id v11 = a3;
  v10->_unsigned int arrayLength = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mipmapLevels"), "objectAtIndexedSubscript:", 0), "elements"), "count");
  if ([(TXRTexture *)v10->_texture cubemap])
  {
    if (v10->_arrayLength >= 2)
    {
      if (a6) {
        *a6 = (id)_GLKTextureErrorWithCodeAndErrorString(19, @"OpenGL ES does not support cubemap arrays");
      }
      v10->_unsigned int arrayLength = 1;
    }
    v10->_int target = 34067;
    [a3 dimensions];
    if (v12 != 1) {
      -[GLKTextureTXR initWithTexture:API:options:error:]();
    }
    [a3 dimensions];
    int32x4_t v23 = v13;
    [a3 dimensions];
    if ((vmovn_s32(vceqq_s32(v23, vdupq_lane_s32(v14, 1))).u8[0] & 1) == 0) {
      -[GLKTextureTXR initWithTexture:API:options:error:]();
    }
  }
  else
  {
    [(TXRTexture *)v10->_texture dimensions];
    unsigned int arrayLength = v10->_arrayLength;
    if (v16 < 2)
    {
      if (arrayLength < 2) {
        int v17 = 3553;
      }
      else {
        int v17 = 35866;
      }
    }
    else
    {
      if (arrayLength >= 2)
      {
        if (a6) {
          *a6 = (id)_GLKTextureErrorWithCodeAndErrorString(19, @"OpenGL does not support 3D texture arrays");
        }
        goto LABEL_19;
      }
      int v17 = 32879;
    }
    v10->_int target = v17;
  }
LABEL_19:
  if ([(TXRTexture *)v10->_texture cubemap]) {
    int target = 34069;
  }
  else {
    int target = v10->_target;
  }
  v10->_loadTarget = target;
  v10->_mipmapLevelCount = objc_msgSend((id)-[TXRTexture mipmapLevels](v10->_texture, "mipmapLevels"), "count");
  [(TXRTexture *)v10->_texture dimensions];
  v10->_width = v19;
  [(TXRTexture *)v10->_texture dimensions];
  v10->_height = v20;
  [(TXRTexture *)v10->_texture dimensions];
  v10->_depth = v21;
  v10->_hasAlpha = objc_msgSend(MEMORY[0x263F7F248], "hasAlpha:", -[TXRTexture pixelFormat](v10->_texture, "pixelFormat"));
  v10->_API = a4;
  return v10;
}

- (BOOL)uploadToGLTexture:(unsigned int)a3 error:(id *)a4
{
  v6 = self;
  self->_lossyCompressedSource = objc_msgSend(MEMORY[0x263F7F248], "isCompressed:", -[TXRTexture pixelFormat](self->_texture, "pixelFormat"));
  uint64_t v7 = [(TXRTexture *)v6->_texture pixelFormat];
  unint64_t API = v6->_API;
  if (v7 > 79)
  {
    if (v7 <= 551)
    {
      switch(v7)
      {
        case 80:
          uint64_t v65 = 0x1401000080E1;
          int v9 = 37793;
          goto LABEL_127;
        case 81:
          uint64_t v65 = 0x1401000080E1;
          int v9 = 35907;
          goto LABEL_127;
        case 90:
          uint64_t v65 = 0x836800001908;
          int v9 = 32857;
          goto LABEL_127;
        case 92:
          uint64_t v65 = 0x8C3B00001907;
          int v9 = 35898;
          goto LABEL_127;
        case 93:
          uint64_t v65 = 0x8C3E00001907;
          int v9 = 35901;
          goto LABEL_127;
        case 105:
          uint64_t v65 = 0x140600008227;
          int v9 = 33328;
          goto LABEL_127;
        case 110:
          GLenum v67 = 32856;
          uint64_t v65 = 0x140100001908;
          uint64_t v10 = 70;
          goto LABEL_140;
        case 112:
          GLenum v67 = 36759;
          uint64_t v65 = 0x140000001908;
          uint64_t v10 = 72;
          goto LABEL_140;
        case 115:
          BOOL v15 = API == 3;
          if (API == 3) {
            int v16 = 34842;
          }
          else {
            int v16 = 6408;
          }
          GLenum v67 = v16;
          if (v15) {
            int v17 = 5131;
          }
          else {
            int v17 = 36193;
          }
          LODWORD(v65) = 6408;
          HIDWORD(v65) = v17;
          goto LABEL_128;
        case 125:
          uint64_t v65 = 0x140600001908;
          int v9 = 34836;
          goto LABEL_127;
        case 160:
          uint64_t v65 = 0;
          int v9 = 35841;
          goto LABEL_127;
        case 161:
          uint64_t v65 = 0;
          int v9 = 35412;
          goto LABEL_127;
        case 162:
          uint64_t v65 = 0;
          int v9 = 35840;
          goto LABEL_127;
        case 163:
          uint64_t v65 = 0;
          int v9 = 35413;
          goto LABEL_127;
        case 164:
          uint64_t v65 = 0;
          int v9 = 35843;
          goto LABEL_127;
        case 165:
          uint64_t v65 = 0;
          int v9 = 35414;
          goto LABEL_127;
        case 166:
          uint64_t v65 = 0;
          int v9 = 35842;
          goto LABEL_127;
        case 167:
          uint64_t v65 = 0;
          int v9 = 35415;
          goto LABEL_127;
        case 170:
          uint64_t v65 = 0;
          int v9 = 37488;
          goto LABEL_127;
        case 172:
          uint64_t v65 = 0;
          int v9 = 37489;
          goto LABEL_127;
        case 174:
          uint64_t v65 = 0;
          int v9 = 37490;
          goto LABEL_127;
        case 176:
          uint64_t v65 = 0;
          int v9 = 37491;
          goto LABEL_127;
        case 178:
          uint64_t v65 = 0;
          int v9 = 37496;
          goto LABEL_127;
        case 179:
          uint64_t v65 = 0;
          int v9 = 37497;
          goto LABEL_127;
        case 180:
          uint64_t v65 = 0;
          int v9 = 37492;
          goto LABEL_127;
        case 181:
          uint64_t v65 = 0;
          int v9 = 37493;
          goto LABEL_127;
        case 182:
          uint64_t v65 = 0;
          int v9 = 37494;
          goto LABEL_127;
        case 183:
          uint64_t v65 = 0;
          int v9 = 37495;
          goto LABEL_127;
        case 186:
          uint64_t v65 = 0;
          int v9 = 37840;
          goto LABEL_127;
        case 187:
          uint64_t v65 = 0;
          int v9 = 37841;
          goto LABEL_127;
        case 188:
          uint64_t v65 = 0;
          int v9 = 37842;
          goto LABEL_127;
        case 189:
          uint64_t v65 = 0;
          int v9 = 37843;
          goto LABEL_127;
        case 190:
          uint64_t v65 = 0;
          int v9 = 37844;
          goto LABEL_127;
        case 192:
          uint64_t v65 = 0;
          int v9 = 37845;
          goto LABEL_127;
        case 193:
          uint64_t v65 = 0;
          int v9 = 37846;
          goto LABEL_127;
        case 194:
          uint64_t v65 = 0;
          int v9 = 37847;
          goto LABEL_127;
        case 195:
          uint64_t v65 = 0;
          int v9 = 37848;
          goto LABEL_127;
        case 196:
          uint64_t v65 = 0;
          int v9 = 37849;
          goto LABEL_127;
        case 197:
          uint64_t v65 = 0;
          int v9 = 37850;
          goto LABEL_127;
        case 198:
          uint64_t v65 = 0;
          int v9 = 37851;
          goto LABEL_127;
        case 199:
          uint64_t v65 = 0;
          int v9 = 37852;
          goto LABEL_127;
        case 200:
          uint64_t v65 = 0;
          int v9 = 37853;
          goto LABEL_127;
        case 204:
          uint64_t v65 = 0;
          int v9 = 37808;
          goto LABEL_127;
        case 205:
          uint64_t v65 = 0;
          int v9 = 37809;
          goto LABEL_127;
        case 206:
          uint64_t v65 = 0;
          int v9 = 37810;
          goto LABEL_127;
        case 207:
          uint64_t v65 = 0;
          int v9 = 37811;
          goto LABEL_127;
        case 208:
          uint64_t v65 = 0;
          int v9 = 37812;
          goto LABEL_127;
        case 210:
          uint64_t v65 = 0;
          int v9 = 37813;
          goto LABEL_127;
        case 211:
          uint64_t v65 = 0;
          int v9 = 37814;
          goto LABEL_127;
        case 212:
          uint64_t v65 = 0;
          int v9 = 37815;
          goto LABEL_127;
        case 213:
          uint64_t v65 = 0;
          int v9 = 37816;
          goto LABEL_127;
        case 214:
          uint64_t v65 = 0;
          int v9 = 37817;
          goto LABEL_127;
        case 215:
          uint64_t v65 = 0;
          int v9 = 37818;
          goto LABEL_127;
        case 216:
          uint64_t v65 = 0;
          int v9 = 37819;
          goto LABEL_127;
        case 217:
          uint64_t v65 = 0;
          int v9 = 37820;
          goto LABEL_127;
        case 218:
          uint64_t v65 = 0;
          int v9 = 37821;
          goto LABEL_127;
        default:
          goto LABEL_119;
      }
    }
    switch(v7)
    {
      case 552:
      case 554:
        GLenum v67 = 32856;
        uint64_t v65 = 0x1401000080E1;
        uint64_t v10 = 80;
        goto LABEL_140;
      case 553:
      case 555:
        GLenum v67 = 35907;
        uint64_t v65 = 0x1401000080E1;
        uint64_t v10 = 81;
        goto LABEL_140;
      default:
        if (v7 == 2147483649)
        {
          LODWORD(v65) = 6407;
          int v11 = 32819;
        }
        else
        {
          if (v7 != 2147483650) {
            goto LABEL_119;
          }
          LODWORD(v65) = 6407;
          int v11 = 5121;
        }
        HIDWORD(v65) = v11;
        int v9 = 32849;
        break;
    }
    goto LABEL_127;
  }
  if (v7 > 40)
  {
    if (v7 > 59)
    {
      switch(v7)
      {
        case '<':
          GLenum v67 = 33323;
          uint64_t v65 = 0x140100008227;
          uint64_t v10 = 30;
          goto LABEL_140;
        case '>':
          GLenum v67 = 36756;
          uint64_t v65 = 0x140000008227;
          uint64_t v10 = 32;
          goto LABEL_140;
        case 'A':
          uint64_t v65 = 0x140B00008227;
          int v9 = 33327;
          goto LABEL_127;
        case 'F':
          uint64_t v65 = 0x140100001908;
          int v9 = 32856;
          goto LABEL_127;
        case 'G':
          if (API == 2) {
            int v12 = 35906;
          }
          else {
            int v12 = 35907;
          }
          GLenum v67 = v12;
          if (API == 2) {
            unsigned int v13 = 35906;
          }
          else {
            unsigned int v13 = 6408;
          }
          uint64_t v65 = v13 | 0x140100000000;
          goto LABEL_128;
        case 'H':
          if (API == 2)
          {
            HIDWORD(v65) = 0;
            int v14 = 35906;
            goto LABEL_117;
          }
          uint64_t v65 = 0x140000001908;
          int v9 = 36759;
          break;
        default:
          goto LABEL_119;
      }
      goto LABEL_127;
    }
    switch(v7)
    {
      case ')':
        uint64_t v65 = 0x803400001908;
        int v9 = 32855;
        goto LABEL_127;
      case '*':
        uint64_t v65 = 0x803300001908;
        int v9 = 32854;
        goto LABEL_127;
      case '7':
        uint64_t v65 = 0x140600001903;
        int v9 = 33326;
        goto LABEL_127;
    }
    goto LABEL_119;
  }
  if (v7 > 21)
  {
    if (v7 <= 29)
    {
      if (v7 == 22)
      {
        GLenum v67 = 36756;
        uint64_t v65 = 0x140000001903;
        uint64_t v10 = 12;
        goto LABEL_140;
      }
      if (v7 == 25)
      {
        uint64_t v65 = 0x140B00001903;
        int v9 = 33325;
        goto LABEL_127;
      }
    }
    else
    {
      switch(v7)
      {
        case 30:
          uint64_t v65 = 0x140100008227;
          int v9 = 33323;
          goto LABEL_127;
        case 32:
          uint64_t v65 = 0x140000008227;
          int v9 = 36757;
          goto LABEL_127;
        case 40:
          uint64_t v65 = 0x836300001907;
          int v9 = 36194;
          goto LABEL_127;
      }
    }
LABEL_119:
    int v18 = [MEMORY[0x263F7F248] isGammaEncoded:v7];
    if (v18) {
      unsigned int v19 = 35906;
    }
    else {
      unsigned int v19 = 6408;
    }
    if (v18) {
      uint64_t v10 = 71;
    }
    else {
      uint64_t v10 = 70;
    }
    uint64_t v65 = v19 | 0x140100000000;
    GLenum v67 = v19;
    goto LABEL_140;
  }
  HIDWORD(v65) = 5121;
  if (v7 > 10)
  {
    GLenum v67 = 33321;
    LODWORD(v65) = 6403;
    uint64_t v10 = 10;
    if (v7 == 11) {
      goto LABEL_140;
    }
    if (v7 != 12)
    {
      if (v7 != 20) {
        goto LABEL_119;
      }
LABEL_140:
      [(TXRTexture *)v6->_texture reformat:v10 gammaDegamma:0 bufferAllocator:0 error:a4];
      goto LABEL_141;
    }
    uint64_t v65 = 0x140000001903;
    int v9 = 36756;
LABEL_127:
    GLenum v67 = v9;
    goto LABEL_128;
  }
  if (v7 != 1)
  {
    if (v7 == 10)
    {
      uint64_t v65 = 0x140100001903;
      int v9 = 33321;
      goto LABEL_127;
    }
    goto LABEL_119;
  }
  int v14 = 6406;
LABEL_117:
  GLenum v67 = v14;
  LODWORD(v65) = v14;
LABEL_128:
  unsigned int v20 = (void *)[[NSString alloc] initWithUTF8String:glGetString(0x1F03u)];
  unsigned int v21 = (void *)[v20 componentsSeparatedByString:@" "];
  if (objc_msgSend(MEMORY[0x263F7F248], "isASTC:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"))&& !objc_msgSend(v21, "containsObject:", @"GL_KHR_texture_compression_astc_ldr")|| objc_msgSend(MEMORY[0x263F7F248], "isETC2:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"))&& v6->_API != 3)
  {
    uint64_t v22 = [(TXRTexture *)v6->_texture pixelFormat];
    int v23 = [MEMORY[0x263F7F248] isGammaEncoded:v22];
    if (v23) {
      unsigned int v24 = 35906;
    }
    else {
      unsigned int v24 = 6408;
    }
    if (v23) {
      uint64_t v10 = 71;
    }
    else {
      uint64_t v10 = 70;
    }

    uint64_t v65 = v24 | 0x140100000000;
    GLenum v67 = v24;
    goto LABEL_140;
  }

LABEL_141:
  [(TXRTexture *)v6->_texture dimensions];
  int v26 = v25;
  [(TXRTexture *)v6->_texture dimensions];
  if (((v27 - 1) & v26) == 0)
  {
    [(TXRTexture *)v6->_texture dimensions];
    int v29 = v28;
    [(TXRTexture *)v6->_texture dimensions];
    if (((v30 - 1) & v29) == 0) {
      goto LABEL_146;
    }
  }
  unint64_t v31 = v6->_API;
  if (v31 != 1)
  {
    if (v31 == 2) {
      v6->_mipmapLevelCount = 1;
    }
LABEL_146:
    v62 = a4;
    glBindTexture(v6->_target, a3);
    glTexParameteri(v6->_target, 0x2802u, 33071);
    glTexParameteri(v6->_target, 0x2803u, 33071);
    glTexParameteri(v6->_target, 0x2800u, 9729);
    glTexParameteri(v6->_target, 0x813Du, v6->_mipmapLevelCount);
    int v32 = objc_msgSend(MEMORY[0x263F7F248], "isCompressed:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"));
    if ((v32 & 1) == 0) {
      objc_msgSend(MEMORY[0x263F7F248], "pixelBytes:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"));
    }
    if (v6->_mipmapLevelCount <= 1) {
      GLint v33 = 9729;
    }
    else {
      GLint v33 = 9987;
    }
    glTexParameteri(v6->_target, 0x2801u, v33);
    [(TXRTexture *)v6->_texture dimensions];
    if (v6->_mipmapLevelCount)
    {
      uint64_t v35 = 0;
      while (1)
      {
        long long v66 = v34;
        v63 = objc_msgSend((id)-[TXRTexture mipmapLevels](v6->_texture, "mipmapLevels"), "objectAtIndexedSubscript:", v35);
        if (v6->_arrayLength) {
          break;
        }
        uint64_t v50 = *((void *)&v66 + 1);
        int32x2_t v37 = vrev64_s32(*(int32x2_t *)&v66);
LABEL_176:
        uint32x2_t v51 = (uint32x2_t)vrev64_s32(v37);
        int8x8_t v52 = (int8x8_t)vshr_n_u32(v51, 1uLL);
        int8x8_t v53 = (int8x8_t)vcgt_u32(v51, (uint32x2_t)0x100000001);
        *(int32x2_t *)&long long v34 = vsub_s32((int32x2_t)vand_s8(v52, v53), (int32x2_t)vmvn_s8(v53));
        if (v50 <= 1) {
          unsigned int v54 = 1;
        }
        else {
          unsigned int v54 = v50 >> 1;
        }
        *((void *)&v34 + 1) = __PAIR64__(HIDWORD(v50), v54);
        if (++v35 >= (unint64_t)v6->_mipmapLevelCount) {
          goto LABEL_180;
        }
      }
      uint64_t v36 = 0;
      int32x2_t v37 = vrev64_s32(*(int32x2_t *)&v66);
      while (1)
      {
        v38 = v6;
        uint64_t v64 = v36;
        v39 = objc_msgSend((id)objc_msgSend(v63, "elements"), "objectAtIndexedSubscript:", v36);
        if (objc_msgSend((id)objc_msgSend(v39, "faces"), "count")) {
          break;
        }
LABEL_173:
        uint64_t v36 = v64 + 1;
        v6 = v38;
        if (v64 + 1 >= (unint64_t)v38->_arrayLength)
        {
          uint64_t v50 = *((void *)&v66 + 1);
          goto LABEL_176;
        }
      }
      uint64_t v40 = 0;
      while (1)
      {
        v41 = objc_msgSend((id)objc_msgSend(v39, "faces"), "objectAtIndexedSubscript:", v40);
        v42 = objc_msgSend((id)objc_msgSend(v41, "buffer"), "map");
        int v43 = [v41 bytesPerRow];
        if (!v43) {
          int v43 = objc_msgSend(MEMORY[0x263F7F248], "packedMemoryLayoutForFormat:dimensions:", -[TXRTexture pixelFormat](v38->_texture, "pixelFormat"), *(double *)&v66);
        }
        uint64_t v44 = [v42 bytes];
        uint64_t v45 = [v41 offset];
        int target = v38->_target;
        if (target > 34066) {
          break;
        }
        if (target == 3553) {
          goto LABEL_164;
        }
        if (target == 32879) {
          -[GLKTextureTXR uploadToGLTexture:error:]();
        }
LABEL_172:
        if (++v40 >= (unint64_t)objc_msgSend((id)objc_msgSend(v39, "faces"), "count")) {
          goto LABEL_173;
        }
      }
      if (target != 34067)
      {
        if (target == 35866) {
          -[GLKTextureTXR uploadToGLTexture:error:]();
        }
        goto LABEL_172;
      }
LABEL_164:
      pixels = (const GLvoid *)(v44 + v45);
      if (v32)
      {
        GLsizei v48 = [v41 bytesPerImage];
        if (v48) {
          GLsizei v49 = v48;
        }
        else {
          GLsizei v49 = v43 * DWORD1(v66);
        }
        glCompressedTexImage2D(v40 + v38->_loadTarget, v35, v67, v66, SDWORD1(v66), 0, v49, pixels);
      }
      else
      {
        GLint params = 0;
        glGetIntegerv(0xCF5u, &params);
        glPixelStorei(0xCF5u, 1);
        if (v43 != v66
                  * objc_msgSend(MEMORY[0x263F7F248], "pixelBytes:", -[TXRTexture pixelFormat](v38->_texture, "pixelFormat")))-[GLKTextureTXR uploadToGLTexture:error:]();
        glTexImage2D(v40 + v38->_loadTarget, v35, v67, v66, SDWORD1(v66), 0, v65, HIDWORD(v65), pixels);
        glPixelStorei(0xCF5u, params);
      }
      goto LABEL_172;
    }
LABEL_180:
    GLenum Error = glGetError();
    if (!Error) {
      return 1;
    }
    if (Error == 1281)
    {
      GLint v68 = 0;
      GLint v69 = 0;
      glGetIntegerv(0xD33u, &v69);
      glGetIntegerv(0x851Cu, &v68);
      a4 = v62;
      if (([(TXRTexture *)v6->_texture cubemap] & 1) != 0
        || ([(TXRTexture *)v6->_texture dimensions], v56 <= v69))
      {
        if (([(TXRTexture *)v6->_texture cubemap] & 1) != 0
          || ([(TXRTexture *)v6->_texture dimensions], v59 <= v69))
        {
          if ([(TXRTexture *)v6->_texture cubemap])
          {
            [(TXRTexture *)v6->_texture dimensions];
            if (v60 <= v68) {
              v57 = 0;
            }
            else {
              v57 = @"Cube Map width / height are greater than GL_MAX_CUBE_MAP_TEXTURE_SIZE";
            }
          }
          else
          {
            v57 = 0;
          }
        }
        else
        {
          v57 = @"Texture height is greater than GL_MAX_TEXTURE_SIZE";
        }
      }
      else
      {
        v57 = @"Texture width is greater than GL_MAX_TEXTURE_SIZE";
      }
    }
    else
    {
      v57 = @"OpenGL Error";
      a4 = v62;
    }
    if (a4) {
      goto LABEL_199;
    }
    return 0;
  }
  if (a4)
  {
    v57 = @"OpenGL ES 1 does not support non-power-of-two-textures";
LABEL_199:
    v61 = (void *)_GLKTextureErrorWithCodeAndErrorString(0, (uint64_t)v57);
    BOOL result = 0;
    *a4 = v61;
    return result;
  }
  return 0;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unsigned)GLTextureName
{
  return self->_GLTextureName;
}

- (void)setGLTextureName:(unsigned int)a3
{
  self->_GLTextureName = a3;
}

- (unsigned)target
{
  return self->_target;
}

- (void)setTarget:(unsigned int)a3
{
  self->_int target = a3;
}

- (unsigned)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (void)setMipmapLevelCount:(unsigned int)a3
{
  self->_mipmapLevelCount = a3;
}

- (unsigned)arrayLength
{
  return self->_arrayLength;
}

- (void)setArrayLength:(unsigned int)a3
{
  self->_unsigned int arrayLength = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)depth
{
  return self->_depth;
}

- (void)setDepth:(unsigned int)a3
{
  self->_depth = a3;
}

- (BOOL)hasAlpha
{
  return self->_hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_hasAlpha = a3;
}

- (BOOL)lossyCompressedSource
{
  return self->_lossyCompressedSource;
}

- (void)setLossyCompressedSource:(BOOL)a3
{
  self->_lossyCompressedSource = a3;
}

- (void)initWithTexture:API:options:error:.cold.1()
{
  __assert_rtn("-[GLKTextureTXR initWithTexture:API:options:error:]", "GLKTextureTXR.m", 607, "txrTexture.dimensions.x == txrTexture.dimensions.y");
}

- (void)initWithTexture:API:options:error:.cold.2()
{
  __assert_rtn("-[GLKTextureTXR initWithTexture:API:options:error:]", "GLKTextureTXR.m", 606, "1 == txrTexture.dimensions.z");
}

- (void)uploadToGLTexture:error:.cold.1()
{
  __assert_rtn("-[GLKTextureTXR uploadToGLTexture:error:]", "GLKTextureTXR.m", 788, "bytesPerRow == ([TXRPixelFormatInfo pixelBytes:_texture.pixelFormat] * sourceSize.x)");
}

- (void)uploadToGLTexture:error:.cold.2()
{
}

- (void)uploadToGLTexture:error:.cold.3()
{
}

@end