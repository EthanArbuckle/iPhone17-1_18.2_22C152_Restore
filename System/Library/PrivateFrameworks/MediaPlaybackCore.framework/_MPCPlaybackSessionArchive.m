@interface _MPCPlaybackSessionArchive
+ (id)packageTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)saveWithError:(id *)a3;
- (BOOL)writeWithError:(id *)a3;
- (MPNowPlayingContentItem)contentItem;
- (NSDate)lastModifiedDate;
- (NSString)identifier;
- (UIImage)artworkImage;
- (_MPCPlaybackSessionArchive)initWithURL:(id)a3;
- (_MPCPlaybackSessionArchive)initWithURL:(id)a3 identifier:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)setArtworkImage:(id)a3;
- (void)setContentItem:(id)a3;
@end

@implementation _MPCPlaybackSessionArchive

+ (id)packageTypeIdentifier
{
  return @"com.apple.mediaplaybackcore.sessionArchive";
}

- (void)setContentItem:(id)a3
{
}

- (_MPCPlaybackSessionArchive)initWithURL:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MPCPlaybackSessionArchive;
  v7 = [(MSVSegmentedCodingPackage *)&v15 initWithURL:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v10 = [(MSVSegmentedCodingPackage *)v7 infoDictionary];
    v11 = [v10 objectForKeyedSubscript:@"identifier"];

    if (([v11 isEqualToString:v6] & 1) == 0)
    {
      [(MSVSegmentedCodingPackage *)v7 reset];
      v12 = v7->_identifier;
      v13 = [(MSVSegmentedCodingPackage *)v7 infoDictionary];
      [v13 setObject:v12 forKeyedSubscript:@"identifier"];

      [(MSVSegmentedCodingPackage *)v7 setNeedsInfoDictionaryUpdate];
    }
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);

  objc_storeStrong((id *)&self->_contentItem, 0);
}

- (_MPCPlaybackSessionArchive)initWithURL:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_MPCPlaybackSessionArchive;
  v3 = [(MSVSegmentedCodingPackage *)&v10 initWithURL:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_3;
  }
  v5 = [(MSVSegmentedCodingPackage *)v3 infoDictionary];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v6;

  if (!v4->_identifier) {
    uint64_t v8 = 0;
  }
  else {
LABEL_3:
  }
    uint64_t v8 = v4;

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)saveWithError:(id *)a3
{
  v5 = [_MPCPlaybackSessionArchive alloc];
  uint64_t v6 = [(MSVSegmentedCodingPackage *)self packageURL];
  v7 = [(_MPCPlaybackSessionArchive *)v5 initWithURL:v6];

  if (!v7
    || ([(_MPCPlaybackSessionArchive *)v7 identifier],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [(_MPCPlaybackSessionArchive *)self identifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        (v10 & 1) != 0)
    || [(MSVSegmentedCodingPackage *)v7 deleteWithError:a3])
  {
    v11 = [MEMORY[0x263EFF910] date];
    lastModifiedDate = self->_lastModifiedDate;
    self->_lastModifiedDate = v11;

    v15.receiver = self;
    v15.super_class = (Class)_MPCPlaybackSessionArchive;
    BOOL v13 = [(MSVSegmentedCodingPackage *)&v15 saveWithError:a3];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)writeWithError:(id *)a3
{
  v185[0] = *MEMORY[0x263EF8340];
  v165.receiver = self;
  v165.super_class = (Class)_MPCPlaybackSessionArchive;
  if (-[MSVSegmentedCodingPackage writeWithError:](&v165, sel_writeWithError_))
  {
    v5 = [(MSVSegmentedCodingPackage *)self packageURL];
    uint64_t v6 = [v5 URLByAppendingPathComponent:@"contentItem.protobuf.gz" isDirectory:0];

    if (self->_contentItem)
    {
      v7 = [(MSVSegmentedCodingPackage *)self infoDictionary];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"contentItem"];

      v9 = [(MPNowPlayingContentItem *)self->_contentItem identifier];
      char v10 = [v8 objectForKeyedSubscript:@"identifier"];
      char v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0)
      {
        if (!v8)
        {
          uint64_t v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
        }
        v12 = [(MPNowPlayingContentItem *)self->_contentItem createExternalRepresentation];
        BOOL v13 = MSVGzipCompressData();

        if (!v13)
        {
          BOOL v13 = 0;
          if (a3)
          {
            BOOL v16 = 0;
            *a3 = 0;
LABEL_171:

            return v16;
          }
          goto LABEL_170;
        }
        if (![v13 writeToURL:v6 options:0 error:a3]) {
          goto LABEL_170;
        }
        v14 = [(MPNowPlayingContentItem *)self->_contentItem identifier];
        [v8 setObject:v14 forKeyedSubscript:@"identifier"];

        [v8 setObject:&unk_26CC192D8 forKeyedSubscript:@"compressionAlgorithm"];
        objc_super v15 = [(MSVSegmentedCodingPackage *)self infoDictionary];
        [v15 setObject:v8 forKeyedSubscript:@"contentItem"];

        [(MSVSegmentedCodingPackage *)self setNeedsInfoDictionaryUpdate];
      }
    }
    else
    {
      v17 = [MEMORY[0x263F08850] defaultManager];
      [v17 removeItemAtURL:v6 error:0];

      v18 = [(MSVSegmentedCodingPackage *)self infoDictionary];
      v19 = [v18 objectForKeyedSubscript:@"contentItem"];

      if (v19)
      {
        v20 = [(MSVSegmentedCodingPackage *)self infoDictionary];
        [v20 setObject:0 forKeyedSubscript:@"contentItem"];

        [(MSVSegmentedCodingPackage *)self setNeedsInfoDictionaryUpdate];
      }
    }
    v21 = [(MSVSegmentedCodingPackage *)self packageURL];
    uint64_t v8 = [v21 URLByAppendingPathComponent:@"artwork" isDirectory:0];

    v22 = [(MSVSegmentedCodingPackage *)self infoDictionary];
    BOOL v13 = [v22 objectForKeyedSubscript:@"artworkHash"];

    if (!self->_artworkImage)
    {
      v34 = [MEMORY[0x263F08850] defaultManager];
      [v34 removeItemAtURL:v8 error:0];

      v35 = [(MSVSegmentedCodingPackage *)self infoDictionary];
      v36 = [v35 objectForKeyedSubscript:@"artworkHash"];

      if (v36)
      {
        v37 = [(MSVSegmentedCodingPackage *)self infoDictionary];
        [v37 setObject:0 forKeyedSubscript:@"artworkHash"];

        [(MSVSegmentedCodingPackage *)self setNeedsInfoDictionaryUpdate];
      }
      goto LABEL_168;
    }
    v163 = v6;
    v164 = v13;
    v23 = MEMORY[0x21D49CBE0](*MEMORY[0x263F54E98]);
    unint64_t v24 = *MEMORY[0x263F54E90];
    id v25 = v23;
    long long v180 = 0u;
    long long v179 = 0u;
    long long v178 = 0u;
    long long v177 = 0u;
    long long v176 = 0u;
    long long v175 = 0u;
    long long v174 = 0u;
    long long v173 = 0u;
    long long v166 = xmmword_21BEF1620;
    uint32x4_t v167 = (uint32x4_t)vaddq_s64(vdupq_n_s64(v24), (int64x2_t)xmmword_21BEF1690);
    v26 = &v168;
    unint64_t v168 = v24;
    unint64_t v169 = v24 + 0x61C8864E7A143579;
    v27 = (uint64_t *)&v170;
    long long v170 = 0u;
    long long v171 = 0u;
    uint64_t v172 = 0;
    id v28 = v25;
    v29 = (unsigned char *)[v28 bytes];
    unint64_t v30 = [v28 length];
    int v31 = v30;
    if ((uint64_t)v166 > 3999)
    {
      if ((uint64_t)v166 > 4255)
      {
        if ((void)v166 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)((char *)&v166 + 8), v29, v30);
        }
        else if ((void)v166 == 4512)
        {
          CC_SHA512_Update((CC_SHA512_CTX *)((char *)&v166 + 8), v29, v30);
        }
      }
      else if ((void)v166 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)((char *)&v166 + 8), v29, v30);
      }
      else if ((void)v166 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)((char *)&v166 + 8), v29, v30);
      }
    }
    else
    {
      if ((uint64_t)v166 <= 2999)
      {
        if ((void)v166)
        {
          if ((void)v166 == 2000)
          {
            int v32 = (((v30 + v167.i8[3]) & 3) - v167.i8[3]);
            v33 = &v167.i8[v167.u8[3]];
            switch(v32)
            {
              case 0:
                break;
              case 1:
                __int8 *v33 = *v29;
                break;
              case 2:
                __int16 v57 = *(_WORD *)v29;
                goto LABEL_69;
              case 3:
                __int16 v57 = *(_WORD *)v29;
                v33[2] = v29[2];
LABEL_69:
                *(_WORD *)v33 = v57;
                break;
              default:
                memcpy(v33, v29, (((v31 + v167.i8[3]) & 3) - v167.i8[3]));
                break;
            }
            HIDWORD(v166) += v31;
          }
        }
        else
        {
          v39 = [MEMORY[0x263F08690] currentHandler];
          v40 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          [v39 handleFailureInFunction:v40 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }
        goto LABEL_71;
      }
      if ((void)v166 == 3000)
      {
        if (!v29) {
          goto LABEL_71;
        }
        BOOL v42 = v30 > 0xF || (DWORD2(v166) + v30) > 0xF;
        DWORD2(v166) += v30;
        HIDWORD(v166) |= v42;
        if (v30 + v170 > 0xF)
        {
          v49 = &v29[v30];
          if (v170)
          {
            v162 = &v29[v30];
            memcpy((char *)&v168 + v170, v29, (16 - v170));
            v49 = v162;
            HIDWORD(v50) = v167.i32[0] - 2048144777 * v168;
            LODWORD(v50) = HIDWORD(v50);
            __int32 v51 = -1640531535 * (v50 >> 19);
            HIDWORD(v50) = v167.i32[1] - 2048144777 * HIDWORD(v168);
            LODWORD(v50) = HIDWORD(v50);
            v167.i32[0] = v51;
            v167.i32[1] = -1640531535 * (v50 >> 19);
            HIDWORD(v50) = v167.i32[2] - 2048144777 * v169;
            LODWORD(v50) = HIDWORD(v50);
            v167.i32[2] = -1640531535 * (v50 >> 19);
            HIDWORD(v50) = v167.i32[3] - 2048144777 * HIDWORD(v169);
            LODWORD(v50) = HIDWORD(v50);
            v29 += (16 - v170);
            v167.i32[3] = -1640531535 * (v50 >> 19);
            LODWORD(v170) = 0;
          }
          if (v29 <= v49 - 16)
          {
            __int32 v52 = v167.i32[0];
            __int32 v53 = v167.i32[1];
            __int32 v54 = v167.i32[2];
            __int32 v55 = v167.i32[3];
            do
            {
              HIDWORD(v56) = v52 - 2048144777 * *(_DWORD *)v29;
              LODWORD(v56) = HIDWORD(v56);
              __int32 v52 = -1640531535 * (v56 >> 19);
              HIDWORD(v56) = v53 - 2048144777 * *((_DWORD *)v29 + 1);
              LODWORD(v56) = HIDWORD(v56);
              __int32 v53 = -1640531535 * (v56 >> 19);
              HIDWORD(v56) = v54 - 2048144777 * *((_DWORD *)v29 + 2);
              LODWORD(v56) = HIDWORD(v56);
              __int32 v54 = -1640531535 * (v56 >> 19);
              HIDWORD(v56) = v55 - 2048144777 * *((_DWORD *)v29 + 3);
              LODWORD(v56) = HIDWORD(v56);
              __int32 v55 = -1640531535 * (v56 >> 19);
              v29 += 16;
            }
            while (v29 <= v49 - 16);
            v167.i64[0] = __PAIR64__(v53, v52);
            v167.i64[1] = __PAIR64__(v55, v54);
          }
          if (v29 >= v49) {
            goto LABEL_71;
          }
          int v43 = v49 - v29;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v168 + v170, v29, v30);
          int v43 = v170 + v31;
        }
        LODWORD(v170) = v43;
        goto LABEL_71;
      }
      if ((void)v166 != 3001 || !v29) {
        goto LABEL_71;
      }
      *((void *)&v166 + 1) += v30;
      if (v30 + v172 <= 0x1F)
      {
        memcpy((char *)&v170 + v172, v29, v30);
        int v38 = v172 + v31;
LABEL_56:
        LODWORD(v172) = v38;
        goto LABEL_71;
      }
      unint64_t v44 = (unint64_t)&v29[v30];
      if (v172)
      {
        v162 = &v29[v30];
        memcpy((char *)&v170 + v172, v29, (32 - v172));
        unint64_t v44 = (unint64_t)v162;
        v167.i64[0] = 0x9E3779B185EBCA87 * __ROR8__(v167.i64[0] - 0x3D4D51C2D82B14B1 * v170, 33);
        v167.i64[1] = 0x9E3779B185EBCA87 * __ROR8__(v167.i64[1] - 0x3D4D51C2D82B14B1 * *((void *)&v170 + 1), 33);
        unint64_t v168 = 0x9E3779B185EBCA87 * __ROR8__(v168 - 0x3D4D51C2D82B14B1 * v171, 33);
        unint64_t v169 = 0x9E3779B185EBCA87 * __ROR8__(v169 - 0x3D4D51C2D82B14B1 * *((void *)&v171 + 1), 33);
        v29 += (32 - v172);
        LODWORD(v172) = 0;
      }
      if ((unint64_t)(v29 + 32) <= v44)
      {
        unint64_t v46 = v167.u64[1];
        unint64_t v45 = v167.i64[0];
        unint64_t v48 = v168;
        unint64_t v47 = v169;
        do
        {
          unint64_t v45 = 0x9E3779B185EBCA87 * __ROR8__(v45 - 0x3D4D51C2D82B14B1 * *(void *)v29, 33);
          unint64_t v46 = 0x9E3779B185EBCA87 * __ROR8__(v46 - 0x3D4D51C2D82B14B1 * *((void *)v29 + 1), 33);
          unint64_t v48 = 0x9E3779B185EBCA87 * __ROR8__(v48 - 0x3D4D51C2D82B14B1 * *((void *)v29 + 2), 33);
          unint64_t v47 = 0x9E3779B185EBCA87 * __ROR8__(v47 - 0x3D4D51C2D82B14B1 * *((void *)v29 + 3), 33);
          v29 += 32;
        }
        while ((unint64_t)v29 <= v44 - 32);
        v167.i64[0] = v45;
        v167.i64[1] = v46;
        unint64_t v168 = v48;
        unint64_t v169 = v47;
      }
      if ((unint64_t)v29 < v44)
      {
        int v38 = v44 - v29;
        __memcpy_chk();
        goto LABEL_56;
      }
    }
LABEL_71:

    memset(&v181[8], 0, 64);
    *(void *)v181 = v166;
    if ((uint64_t)v166 > 3000)
    {
      uint64_t v6 = v163;
      if ((uint64_t)v166 > 4000)
      {
        switch((void)v166)
        {
          case 0xFA1:
            CC_SHA1_Final(&v181[8], (CC_SHA1_CTX *)((char *)&v166 + 8));
            break;
          case 0x10A0:
            CC_SHA256_Final(&v181[8], (CC_SHA256_CTX *)((char *)&v166 + 8));
            break;
          case 0x11A0:
            CC_SHA512_Final(&v181[8], (CC_SHA512_CTX *)((char *)&v166 + 8));
            break;
        }
        goto LABEL_118;
      }
      if ((void)v166 != 3001)
      {
        if ((void)v166 == 4000) {
          CC_MD5_Final(&v181[8], (CC_MD5_CTX *)((char *)&v166 + 8));
        }
LABEL_118:
        v182[0] = *(_OWORD *)v181;
        v182[1] = *(_OWORD *)&v181[16];
        v182[2] = *(_OWORD *)&v181[32];
        v182[3] = *(_OWORD *)&v181[48];
        uint64_t v183 = *(void *)&v181[64];
        if (*(uint64_t *)v181 > 3999)
        {
          BOOL v13 = v164;
          if (*(uint64_t *)v181 > 4255)
          {
            if (*(void *)v181 == 4256)
            {
              v151 = (unsigned __int8 *)v182 + 8;
              v152 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v153 = v152;
              for (uint64_t i = 0; i != 64; i += 2)
              {
                unsigned int v155 = *v151++;
                v156 = &v152[i];
                char *v156 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v155 >> 4];
                v156[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v155 & 0xF];
              }
              id v122 = [NSString alloc];
              v123 = v153;
              uint64_t v124 = 64;
            }
            else
            {
              if (*(void *)v181 != 4512) {
                goto LABEL_173;
              }
              v129 = (unsigned __int8 *)v182 + 8;
              v130 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v131 = v130;
              for (uint64_t j = 0; j != 128; j += 2)
              {
                unsigned int v133 = *v129++;
                v134 = &v130[j];
                char *v134 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v133 >> 4];
                v134[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v133 & 0xF];
              }
              id v122 = [NSString alloc];
              v123 = v131;
              uint64_t v124 = 128;
            }
          }
          else if (*(void *)v181 == 4000)
          {
            v141 = (unsigned __int8 *)v182 + 8;
            v142 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v143 = v142;
            for (uint64_t k = 0; k != 32; k += 2)
            {
              unsigned int v145 = *v141++;
              v146 = &v142[k];
              char *v146 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v145 >> 4];
              v146[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v145 & 0xF];
            }
            id v122 = [NSString alloc];
            v123 = v143;
            uint64_t v124 = 32;
          }
          else
          {
            if (*(void *)v181 != 4001) {
              goto LABEL_173;
            }
            v116 = (unsigned __int8 *)v182 + 8;
            v117 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v118 = v117;
            for (uint64_t m = 0; m != 40; m += 2)
            {
              unsigned int v120 = *v116++;
              v121 = &v117[m];
              char *v121 = MSVFastHexStringFromBytes_hexCharacters_28179[(unint64_t)v120 >> 4];
              v121[1] = MSVFastHexStringFromBytes_hexCharacters_28179[v120 & 0xF];
            }
            id v122 = [NSString alloc];
            v123 = v118;
            uint64_t v124 = 40;
          }
        }
        else
        {
          BOOL v13 = v164;
          if (*(uint64_t *)v181 <= 2999)
          {
            if (*(void *)v181 == 1000)
            {
              uint64_t v135 = *((void *)&v182[0] + 1);
              v136 = (char *)v185 + 1;
              uint64_t quot = *((void *)&v182[0] + 1);
              do
              {
                lldiv_t v138 = lldiv(quot, 10);
                uint64_t quot = v138.quot;
                if (v138.rem >= 0) {
                  LOBYTE(v139) = v138.rem;
                }
                else {
                  uint64_t v139 = -v138.rem;
                }
                *(v136 - 2) = v139 + 48;
                v115 = (const UInt8 *)(v136 - 2);
                --v136;
              }
              while (v138.quot);
              if (v135 < 0)
              {
                *(v136 - 2) = 45;
                v115 = (const UInt8 *)(v136 - 2);
              }
              v114 = (char *)((char *)v185 - (char *)v115);
              goto LABEL_152;
            }
            if (*(void *)v181 == 2000)
            {
              uint64_t v110 = DWORD2(v182[0]);
              v111 = v185;
              do
              {
                ldiv_t v112 = ldiv(v110, 10);
                uint64_t v110 = v112.quot;
                if (v112.rem >= 0) {
                  LOBYTE(v113) = v112.rem;
                }
                else {
                  uint64_t v113 = -v112.rem;
                }
                *((unsigned char *)v111 - 1) = v113 + 48;
                v111 = (void *)((char *)v111 - 1);
              }
              while (v112.quot);
              v114 = (char *)((char *)v185 - (char *)v111);
              v115 = (const UInt8 *)v111;
LABEL_152:
              CFStringRef v140 = CFStringCreateWithBytes(0, v115, (CFIndex)v114, 0x8000100u, 0);
LABEL_163:
              v157 = (__CFString *)v140;
LABEL_164:

              if ([v13 isEqualToString:v157])
              {
LABEL_167:

LABEL_168:
                BOOL v16 = 1;
                goto LABEL_171;
              }
              if ([v28 writeToURL:v8 options:0 error:a3])
              {
                v158 = [(MSVSegmentedCodingPackage *)self infoDictionary];
                [v158 setObject:v157 forKeyedSubscript:@"artworkHash"];

                [(MSVSegmentedCodingPackage *)self setNeedsInfoDictionaryUpdate];
                goto LABEL_167;
              }

LABEL_170:
              BOOL v16 = 0;
              goto LABEL_171;
            }
LABEL_173:
            v160 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v162);
            v161 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
            [v160 handleFailureInFunction:v161 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

            v157 = &stru_26CBCA930;
            goto LABEL_164;
          }
          if (*(void *)v181 == 3000)
          {
            LODWORD(v184[0]) = bswap32(DWORD2(v182[0]));
            v147 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v148 = 0;
            v149 = v147 + 1;
            do
            {
              unint64_t v150 = *((unsigned __int8 *)v184 + v148);
              *(v149 - 1) = MSVFastHexStringFromBytes_hexCharacters_28179[v150 >> 4];
              unsigned char *v149 = MSVFastHexStringFromBytes_hexCharacters_28179[v150 & 0xF];
              v149 += 2;
              ++v148;
            }
            while (v148 != 4);
            id v122 = [NSString alloc];
            v123 = v147;
            uint64_t v124 = 8;
          }
          else
          {
            if (*(void *)v181 != 3001) {
              goto LABEL_173;
            }
            v184[0] = bswap64(*((unint64_t *)&v182[0] + 1));
            v125 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            uint64_t v126 = 0;
            v127 = v125 + 1;
            do
            {
              unint64_t v128 = *((unsigned __int8 *)v184 + v126);
              *(v127 - 1) = MSVFastHexStringFromBytes_hexCharacters_28179[v128 >> 4];
              unsigned char *v127 = MSVFastHexStringFromBytes_hexCharacters_28179[v128 & 0xF];
              v127 += 2;
              ++v126;
            }
            while (v126 != 8);
            id v122 = [NSString alloc];
            v123 = v125;
            uint64_t v124 = 16;
          }
        }
        CFStringRef v140 = (CFStringRef)objc_msgSend(v122, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v123, v124, 4, 1, v162);
        goto LABEL_163;
      }
      if (*((void *)&v166 + 1) < 0x20uLL) {
        unint64_t v93 = v168 + 0x27D4EB2F165667C5;
      }
      else {
        unint64_t v93 = 0x85EBCA77C2B2AE63
      }
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((0x85EBCA77C2B2AE63
                  - 0x61C8864E7A143579
                  * ((__ROR8__(v167.i64[1], 57) + __ROR8__(v167.i64[0], 63) + __ROR8__(v168, 52) + __ROR8__(v169, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v167.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v167.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v168, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v169, 33)));
      unint64_t v94 = v93 + *((void *)&v166 + 1);
      unint64_t v95 = BYTE8(v166) & 0x1F;
      if (v95 >= 8)
      {
        do
        {
          uint64_t v96 = *v27++;
          unint64_t v94 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v96, 33)) ^ v94, 37);
          v95 -= 8;
        }
        while (v95 > 7);
      }
      if (v95 >= 4)
      {
        unsigned int v97 = *(_DWORD *)v27;
        v27 = (uint64_t *)((char *)v27 + 4);
        unint64_t v94 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v97) ^ v94, 41);
        v95 -= 4;
      }
      for (; v95; --v95)
      {
        unsigned int v98 = *(unsigned __int8 *)v27;
        v27 = (uint64_t *)((char *)v27 + 1);
        unint64_t v94 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v98) ^ v94, 53);
      }
      unint64_t v99 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v94 ^ (v94 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v94 ^ (v94 >> 33))) >> 29));
      uint64_t v88 = v99 ^ HIDWORD(v99);
LABEL_105:
      *(void *)&v181[8] = v88;
      goto LABEL_118;
    }
    uint64_t v6 = v163;
    if ((uint64_t)v166 <= 1999)
    {
      if (!(void)v166)
      {
        v90 = [MEMORY[0x263F08690] currentHandler];
        v91 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
        [v90 handleFailureInFunction:v91 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];

        goto LABEL_118;
      }
      if ((void)v166 != 1000) {
        goto LABEL_118;
      }
      uint64_t v58 = (*((void *)&v166 + 1) + v167.i64[0]) ^ __ROR8__(v167.i64[0], 51);
      uint64_t v59 = v167.i64[1] + (v168 ^ v169);
      uint64_t v60 = __ROR8__(v168 ^ v169, 48);
      uint64_t v61 = (v59 ^ v60) + __ROR8__(*((void *)&v166 + 1) + v167.i64[0], 32);
      uint64_t v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
      uint64_t v63 = v59 + v58;
      uint64_t v64 = v63 ^ __ROR8__(v58, 47);
      unint64_t v65 = (v61 ^ v169) + v64;
      uint64_t v66 = v65 ^ __ROR8__(v64, 51);
      uint64_t v67 = (__ROR8__(v63, 32) ^ 0xFFLL) + v62;
      uint64_t v68 = __ROR8__(v62, 48);
      uint64_t v69 = __ROR8__(v65, 32) + (v67 ^ v68);
      uint64_t v70 = v69 ^ __ROR8__(v67 ^ v68, 43);
      uint64_t v71 = v66 + v67;
      uint64_t v72 = v71 ^ __ROR8__(v66, 47);
      uint64_t v73 = v72 + v69;
      uint64_t v74 = v73 ^ __ROR8__(v72, 51);
      uint64_t v75 = __ROR8__(v71, 32) + v70;
      uint64_t v76 = __ROR8__(v70, 48);
      uint64_t v77 = __ROR8__(v73, 32) + (v75 ^ v76);
      uint64_t v78 = v77 ^ __ROR8__(v75 ^ v76, 43);
      uint64_t v79 = v74 + v75;
      uint64_t v80 = v79 ^ __ROR8__(v74, 47);
      uint64_t v81 = v80 + v77;
      uint64_t v82 = v81 ^ __ROR8__(v80, 51);
      uint64_t v83 = __ROR8__(v79, 32) + v78;
      uint64_t v84 = __ROR8__(v78, 48);
      uint64_t v85 = __ROR8__(v81, 32) + (v83 ^ v84);
      unint64_t v86 = v85 ^ __ROR8__(v83 ^ v84, 43);
      uint64_t v87 = v82 + v83;
      *((void *)&v166 + 1) = v85;
      v167.i64[0] = v87 ^ __ROR8__(v82, 47);
      v167.i64[1] = __ROR8__(v87, 32);
      unint64_t v168 = v86;
      uint64_t v88 = v167.i64[0] ^ v85 ^ v167.i64[1] ^ v86;
      goto LABEL_105;
    }
    if ((void)v166 != 2000)
    {
      if ((void)v166 != 3000) {
        goto LABEL_118;
      }
      if (HIDWORD(v166)) {
        __int32 v89 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v167, (uint32x4_t)xmmword_21BEF1640), (int8x16_t)vshlq_u32(v167, (uint32x4_t)xmmword_21BEF1630)));
      }
      else {
        __int32 v89 = v167.i32[2] + 374761393;
      }
      unsigned __int32 v100 = DWORD2(v166) + v89;
      unint64_t v101 = v170 & 0xF;
      if (v101 >= 4)
      {
        do
        {
          int v102 = *(_DWORD *)v26;
          v26 = (unint64_t *)((char *)v26 + 4);
          HIDWORD(v103) = v100 - 1028477379 * v102;
          LODWORD(v103) = HIDWORD(v103);
          unsigned __int32 v100 = 668265263 * (v103 >> 15);
          v101 -= 4;
        }
        while (v101 > 3);
      }
      for (; v101; --v101)
      {
        int v104 = *(unsigned __int8 *)v26;
        v26 = (unint64_t *)((char *)v26 + 1);
        HIDWORD(v105) = v100 + 374761393 * v104;
        LODWORD(v105) = HIDWORD(v105);
        unsigned __int32 v100 = -1640531535 * (v105 >> 21);
      }
      unsigned int v106 = (-2048144777 * (v100 ^ (v100 >> 15))) ^ ((-2048144777 * (v100 ^ (v100 >> 15))) >> 13);
      unsigned int v107 = (-1028477379 * v106) ^ ((-1028477379 * v106) >> 16);
      goto LABEL_117;
    }
    switch(v167.u8[3])
    {
      case 1u:
        int v92 = v167.u8[0];
        break;
      case 2u:
        int v92 = v167.u16[0];
        break;
      case 3u:
        int v92 = v167.u16[0] | (v167.u8[2] << 16);
        break;
      default:
        unsigned int v108 = DWORD2(v166);
        goto LABEL_116;
    }
    unsigned int v108 = (461845907 * ((380141568 * v92) | ((-862048943 * v92) >> 17))) ^ DWORD2(v166);
LABEL_116:
    unsigned int v109 = -2048144789 * (v108 ^ HIDWORD(v166) ^ ((v108 ^ HIDWORD(v166)) >> 16));
    unsigned int v107 = (-1028477387 * (v109 ^ (v109 >> 13))) ^ ((-1028477387 * (v109 ^ (v109 >> 13))) >> 16);
    DWORD2(v166) = v107;
LABEL_117:
    *(_DWORD *)&v181[8] = v107;
    goto LABEL_118;
  }
  return 0;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setArtworkImage:(id)a3
{
}

- (UIImage)artworkImage
{
  artworkImage = self->_artworkImage;
  if (!artworkImage)
  {
    v4 = [(MSVSegmentedCodingPackage *)self packageURL];
    v5 = [v4 URLByAppendingPathComponent:@"artwork" isDirectory:0];

    id v6 = objc_alloc(MEMORY[0x263F827E8]);
    v7 = [v5 path];
    uint64_t v8 = (UIImage *)[v6 initWithContentsOfFile:v7];
    v9 = self->_artworkImage;
    self->_artworkImage = v8;

    artworkImage = self->_artworkImage;
  }

  return artworkImage;
}

- (MPNowPlayingContentItem)contentItem
{
  contentIteuint64_t m = self->_contentItem;
  if (!contentItem)
  {
    v4 = [(MSVSegmentedCodingPackage *)self packageURL];
    v5 = [v4 URLByAppendingPathComponent:@"contentItem.protobuf.gz" isDirectory:0];

    id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
    v7 = MSVGzipDecompressData();

    uint64_t v8 = (MPNowPlayingContentItem *)[objc_alloc(MEMORY[0x263F120F8]) initWithExternalRepresentation:v7];
    v9 = self->_contentItem;
    self->_contentIteuint64_t m = v8;

    contentIteuint64_t m = self->_contentItem;
  }

  return contentItem;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_MPCPlaybackSessionArchive *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(_MPCPlaybackSessionArchive *)self identifier];
      v7 = [(_MPCPlaybackSessionArchive *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(_MPCPlaybackSessionArchive *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, self->_identifier];
}

@end